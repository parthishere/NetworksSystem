#include "queue.h"

#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>




typedef struct thread_s
{
    struct thread_s *next_thread;
    void *(*function_to_run)(void *);
    void *args;
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
    _thread_t *thread_head;
    _thread_t *thread_tail;
} _threadpool_t;



void *default_thread_func(threadpool args)
{
    _threadpool_t *tp = (_threadpool_t *)args;
    printf("New thread was created \n");
    pthread_mutex_lock(&(tp->mutex));
    printf("locked mutex from the thread \n");
    while (1)
    {
        printf("thread waiting to be signaled again \n");
        pthread_cond_wait(&(tp->queue_not_empty), &(tp->mutex));
        printf("thread was signaled \n");
        // here mutex will be unlocked

        _thread_t *current_thread = tp->thread_head;
        tp->current_thread_number--;
        if (tp->thread_head == NULL)
        {
            tp->thread_tail = NULL;
            tp->current_thread_number = 0;
        }else{
            tp->thread_head = current_thread->next_thread;
        }

        // pthread_mutex_unlock(tp->mutex);
        pthread_mutex_unlock(&(tp->mutex));

        (current_thread->function_to_run)(current_thread->args);


        free(current_thread); // we do not need it anymore;
    }
}

void dispatch(threadpool from_me, dispatch_fn dispatch_to_here, void *arg)
{
    
    _threadpool_t *tp = from_me;
    if(tp == NULL || dispatch_to_here == NULL) return;

    _thread_t *current_thread = malloc(sizeof(_thread_t));
    if(current_thread == NULL) return;
    current_thread->function_to_run = dispatch_to_here;
    current_thread->args = arg;
    current_thread->next_thread = NULL;


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
    // pthread_cond_signal(tp->queue_not_empty);
    pthread_cond_signal(&(tp->queue_not_empty));
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

    // pthread_mutex_init(tp->mutex, NULL);
    pthread_mutex_init(&(tp->mutex), NULL);
    // pthread_cond_init(tp->queue_empty, NULL);
    pthread_cond_init(&(tp->queue_empty), NULL);
    // pthread_cond_init(tp->queue_not_empty, NULL);
    pthread_cond_init(&(tp->queue_not_empty), NULL);

    for (int i = 0; i < num_of_threads_in_pool; i++)
    {
        // we dont need thread_attribute
        // pthread_attr_init(&(tp->pthreads_attr[i]));
        // pthread_attr_setinheritsched(, PTHREAD_EXPLICIT_SCHED)
        // pthread_attr_setschedpolicy(&(tp->pthread_attr[i]), SCHED_FIFO);
        // pthread_attr_setaffinity_np(&(tp->pthread_attr[i]), sizeof(cpu_set_t), &threadcpu);
        // pthread_attr_setschedparam(&rt_sched_attr[i], &rt_param[i]);
        if (pthread_create(&(tp->pthreads[i]), NULL, default_thread_func, tp) != 0)
        {
            fprintf(stderr, "Error during threadpool creation!\n");

            pthread_attr_destroy(&(tp->pthreads_attr[i]));
            pthread_attr_destroy(&(tp->pthreads_attr[i]));
            // pthread_mutex_destroy(tp->mutex);
            pthread_mutex_destroy(&(tp->mutex));
            // pthread_cond_destroy(tp->queue_empty);
            pthread_cond_destroy(&(tp->queue_empty));
            // pthread_cond_destroy(tp->queue_not_empty);
            pthread_cond_destroy(&(tp->queue_not_empty));
            free(tp->pthreads);
            free(tp->pthreads_attr);
            free(tp);

            exit(EXIT_FAILURE);
        }
    }

    return tp;
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
