#include "queue.h"

#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>
#include <semaphore.h>


typedef struct thread_s
{
    struct thread_s *next_thread;
    void *(*function_to_run)(sockdetails_t);
    sockdetails_t sd;
} _thread_t;

typedef struct _threadpool
{
    int current_thread_number;
    int max_thread_num;
    pthread_t *pthreads;
    pthread_attr_t *pthreads_attr;
    pthread_mutex_t mutex;
    pthread_cond_t queue_empty;
    pthread_cond_t queue_not_empty;
    sem_t sync_sem;
    _thread_t *thread_head;
    _thread_t *thread_tail;
    int shutdown;
} _threadpool_t;



void *default_thread_func(threadpool args)
{
    _threadpool_t *tp = (_threadpool_t *)args;
    printf("New thread was created \n");
    while (!tp->shutdown)
    {
        printf("Waiting for semaphore to release\n");
        sem_wait(&(tp->sync_sem));
        printf("semaphore released\n");
        
        pthread_mutex_lock(&(tp->mutex));
        _thread_t *current_thread = tp->thread_head;
        
        
        if (current_thread != NULL)
        {
            tp->current_thread_number--;
            tp->thread_head = current_thread->next_thread;
            if(tp->thread_head == NULL){
                tp->thread_tail = NULL;
            }
            pthread_mutex_unlock(&(tp->mutex));
            (current_thread->function_to_run)(current_thread->sd);

            free(current_thread);
        }
        else {
            pthread_mutex_unlock(&(tp->mutex));
            tp->thread_tail = NULL;
            tp->current_thread_number = 0;
        }
    }
}

void dispatch(threadpool from_me, dispatch_fn dispatch_to_here, sockdetails_t sd)
{
    
    _threadpool_t *tp = from_me;
    if(tp == NULL || dispatch_to_here == NULL) return;
    
    _thread_t *current_thread = malloc(sizeof(_thread_t));

    if(current_thread == NULL) return;
    current_thread->function_to_run = dispatch_to_here;
    current_thread->sd = sd;
    current_thread->next_thread = NULL;
    
    pthread_mutex_lock(&(tp->mutex));
    if (tp->thread_tail == NULL || tp->thread_head == NULL)
    {
        tp->thread_head = current_thread;
        tp->thread_tail = current_thread;
        tp->current_thread_number++;
    }
    else
    {
        tp->thread_tail->next_thread = current_thread;
        tp->thread_tail = current_thread;
        tp->current_thread_number++;
    }
    

    sem_post(&(tp->sync_sem));
    pthread_mutex_unlock(&(tp->mutex));

}

threadpool create_threadpool(int num_of_threads_in_pool)
{
    if (num_of_threads_in_pool >= MAX_THREAD_IN_POOL || num_of_threads_in_pool <= 0)
    {
        return NULL;
    }

    _threadpool_t *tp = (_threadpool_t *)malloc(sizeof(*tp));
    if (NULL == tp)
        return NULL;

    tp->max_thread_num = num_of_threads_in_pool;
    tp->current_thread_number = 0;
    tp->thread_head = NULL;
    tp->thread_tail = NULL;
    tp->pthreads = malloc(sizeof(pthread_t) * num_of_threads_in_pool);
    tp->pthreads_attr = malloc(sizeof(pthread_attr_t) * num_of_threads_in_pool);
    tp->shutdown = 0;

    pthread_mutex_init(&(tp->mutex), NULL);
    pthread_cond_init(&(tp->queue_empty), NULL);
    pthread_cond_init(&(tp->queue_not_empty), NULL);
    sem_init(&(tp->sync_sem), 0, 0);

    for (int i = 0; i < num_of_threads_in_pool; i++)
    {
        // we dont need thread_attribute
        pthread_attr_init(&(tp->pthreads_attr[i]));
        // pthread_attr_setinheritsched(, PTHREAD_EXPLICIT_SCHED)
        // pthread_attr_setschedpolicy(&(tp->pthread_attr[i]), SCHED_FIFO);
        // pthread_attr_setaffinity_np(&(tp->pthread_attr[i]), sizeof(cpu_set_t), &threadcpu);
        // pthread_attr_setschedparam(&rt_sched_attr[i], &rt_param[i]);
        if (pthread_create(&(tp->pthreads[i]), NULL, default_thread_func, tp) != 0)
        {
            fprintf(stderr, "Error during threadpool creation!\n");

            destroy_threadpool(tp);

            exit(EXIT_FAILURE);
        }
    }

    return tp;
}


void destroy_threadpool(threadpool tp){
    
    _threadpool_t *_tp = (_threadpool_t *)tp;

    pthread_mutex_lock(&(_tp->mutex));
    _tp->shutdown = 1;
    pthread_mutex_unlock(&(_tp->mutex));

    for(int i=0; i<TOTAL_THREADS; i++){
        sem_post(&(_tp->sync_sem));
        pthread_join(_tp->pthreads[i], NULL);
        pthread_attr_destroy(&(_tp->pthreads_attr[i]));
    }

    _thread_t *current = _tp->thread_head;
    while(current != NULL){
        _thread_t *next = current->next_thread;
        free(current);
        current = next;
    }
    
    pthread_mutex_destroy(&(_tp->mutex));
    pthread_cond_destroy(&(_tp->queue_empty));
    pthread_cond_destroy(&(_tp->queue_not_empty));
    sem_destroy(&(_tp->sync_sem));

    free(_tp->pthreads);
    free(_tp->pthreads_attr);
    free(_tp);
}

// queue_t *init_queue(int max_size);
// void enqueue(queue_t *q, int *client_sockfd);
// int *dequeue(queue_t *q);


// typedef struct queue_s
// {
//     node_t *head;
//     node_t *tail;
//     int max_size;
//     int current_size;
// } queue_t;


// queue_t *init_queue(int max_size)
// {
//     queue_t *queue = malloc(sizeof(queue_t));
//     queue->current_size = 1;
//     queue->max_size = max_size;

//     queue->head = NULL;
//     queue->tail = NULL;
// }

// void enqueue(queue_t *q, int *client_sockfd)
// {
//     if (!q)
//         return;
//     if (q->current_size >= q->max_size)
//         return;

//     node_t *new_node = (node_t *)malloc(sizeof(node_t));
//     if (new_node == NULL)
//     {
//         free(q);
//         return;
//     }

//     new_node->client_sockfd = client_sockfd;

//     if (q->tail == NULL)
//     {
//         q->head = new_node;
//         q->tail = new_node;
//         new_node->next_node = new_node;
//     }

//     else
//     {
//         q->tail->next_node = new_node;
//         q->tail = new_node;
//     }

//     q->current_size++;
// }

// int *dequeue(queue_t *q)
// {

//     int *data = NULL;

//     if (!q)
//         return data;
//     if (q->current_size <= 0)
//         return data;

//     if (q->head == NULL)
//         return data;

//     else
//     {
//         node_t *head = q->head;
//         data = head->client_sockfd;
//         q->head = head->next_node;
//         int *sockfd = head->client_sockfd;
//         if (q->head == NULL)
//         {
//             q->tail = NULL;
//         }
//         free(head);
//         q->current_size--;
//         return sockfd;
//     }
//     return data;
// }

// queue -> FIFO
