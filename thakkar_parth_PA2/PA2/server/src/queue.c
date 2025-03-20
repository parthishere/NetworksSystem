/**
 * @file queue.c
 * @brief Thread Pool Implementation for concurrent task execution
 * @copyright (c) 2025 Parth Thakkar
 * 
 * This file implements a thread pool system that manages a collection of worker threads
 * for concurrent task execution. The implementation uses POSIX threads and provides
 * mechanisms for thread synchronization, task queuing, and resource management.
 * 
 * The thread pool maintains a linked list of tasks and distributes them among
 * available worker threads. It supports dynamic task dispatching and graceful
 * shutdown capabilities.
 */

#include "queue.h"

#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>
#include <semaphore.h>


/**
 * @struct thread_s
 * @brief Structure representing a task in the thread pool queue
 * 
 * This structure maintains information about a single task including:
 * - Pointer to the next task in the queue
 * - Function pointer to the task to be executed
 * - Socket details required for the task execution
 */
typedef struct thread_s
{
    struct thread_s *next_thread;          /* Pointer to next task in queue */
    void *(*function_to_run)(sockdetails_t); /* Function pointer for the task */
    sockdetails_t sd;                      /* Socket details for the task */
} _thread_t;


/**
 * @struct _threadpool
 * @brief Main thread pool structure containing pool management information
 * 
 * This structure maintains the complete state of the thread pool including:
 * - Thread accounting information
 * - Synchronization primitives
 * - Task queue pointers
 * - Thread management resources
 */
typedef struct _threadpool
{
    int current_thread_number;         /* Current number of active threads */
    int max_thread_num;               /* Maximum allowed threads in pool */
    pthread_t *pthreads;              /* Array of pthread handles */
    pthread_attr_t *pthreads_attr;    /* Array of thread attributes */
    pthread_mutex_t mutex;            /* Mutex for thread synchronization */
    pthread_cond_t queue_empty;       /* Condition variable for empty queue */
    pthread_cond_t queue_not_empty;   /* Condition variable for non-empty queue */
    sem_t sync_sem;                   /* Semaphore for thread synchronization */
    _thread_t *thread_head;           /* Head of task queue */
    _thread_t *thread_tail;           /* Tail of task queue */
    int shutdown;                     /* Shutdown flag */
} _threadpool_t;


/**
 * @function default_thread_func
 * @brief Default worker thread function that processes tasks from the queue
 * 
 * @param args Pointer to the thread pool structure
 * @return NULL
 * 
 * This function implements the main loop for worker threads. Each thread:
 * 1. Waits for available tasks using semaphore
 * 2. Dequeues a task when available
 * 3. Executes the task function
 * 4. Cleans up task resources
 */
void *default_thread_func(threadpool args)
{
    _threadpool_t *tp = (_threadpool_t *)args;
    printf(GRN"[+] (%d) Thread was created \n"RESET, gettid());
    while (!tp->shutdown)
    {
        printf(GRN"[+] (%d) Thread waiting for Connection\n\n"RESET, gettid());
        sem_wait(&(tp->sync_sem)); /* Wait for task availability */
        
        pthread_mutex_lock(&(tp->mutex));
        _thread_t *current_thread = tp->thread_head;
        
        
        if (current_thread != NULL)
        {
            /* Dequeue task and update queue pointers */
            tp->current_thread_number--;
            tp->thread_head = current_thread->next_thread;
            if(tp->thread_head == NULL){
                tp->thread_tail = NULL;
            }
            pthread_mutex_unlock(&(tp->mutex));
            /* Execute task function */
            (current_thread->function_to_run)(current_thread->sd);
            
            free(current_thread);
        }
        else {
            pthread_mutex_unlock(&(tp->mutex));
            tp->thread_tail = NULL;
            tp->current_thread_number = 0;
        }
    }
    printf(GRN"[+] (%d) Thread exiting\n\n"RESET, gettid());
    return NULL;
}


/**
 * @function dispatch
 * @brief Dispatches a new task to the thread pool
 * 
 * @param from_me Pointer to thread pool
 * @param dispatch_to_here Function pointer to task
 * @param sd Socket details for the task
 * 
 * This function:
 * 1. Creates a new task structure
 * 2. Initializes it with provided function and data
 * 3. Adds it to the task queue
 * 4. Signals worker threads about task availability
 */
void dispatch(threadpool from_me, dispatch_fn dispatch_to_here, sockdetails_t sd)
{
    
    _threadpool_t *tp = from_me;
    if(tp == NULL || dispatch_to_here == NULL) return;
    
    /* Allocate and initialize new task */
    _thread_t *current_thread = malloc(sizeof(_thread_t));

    if(current_thread == NULL) return;
    current_thread->function_to_run = dispatch_to_here;
    current_thread->sd = sd;
    current_thread->next_thread = NULL;
    
    pthread_mutex_lock(&(tp->mutex));

    /* Add task to queue */
    if (tp->thread_tail == NULL || tp->thread_head == NULL)
    {
        /* Empty queue case */
        tp->thread_head = current_thread;
        tp->thread_tail = current_thread;
        tp->current_thread_number++;
    }
    else
    {
        /* Add to tail of queue */
        tp->thread_tail->next_thread = current_thread;
        tp->thread_tail = current_thread;
        tp->current_thread_number++;
    }
    
    /* Signal task availability */
    sem_post(&(tp->sync_sem));
    pthread_mutex_unlock(&(tp->mutex));

}


/**
 * @function create_threadpool
 * @brief Creates and initializes a new thread pool
 * 
 * @param num_of_threads_in_pool Number of worker threads to create
 * @return Pointer to created thread pool or NULL on failure
 * 
 * This function:
 * 1. Allocates thread pool structure
 * 2. Initializes synchronization primitives
 * 3. Creates worker threads
 * 4. Sets up thread attributes
 */
threadpool create_threadpool(int num_of_threads_in_pool)
{
    if (num_of_threads_in_pool > MAX_THREAD_IN_POOL || num_of_threads_in_pool <= 0)
    {
        printf(RED"[-] Max thread limit reached, change MAX_THREAD_IN_POOL\n"RESET);
        return NULL;
    }

    /* Allocate and initialize thread pool structure */
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

    /* Initialize synchronization primitives */
    pthread_mutex_init(&(tp->mutex), NULL);
    pthread_cond_init(&(tp->queue_empty), NULL);
    pthread_cond_init(&(tp->queue_not_empty), NULL);
    sem_init(&(tp->sync_sem), 0, 0);

    /* Create worker threads */
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
            fprintf(stderr, RED"Error during threadpool creation!\n"RESET);

            destroy_threadpool(tp);

            exit(EXIT_FAILURE);
        }
    }

    return tp;
}


/**
 * @function destroy_threadpool
 * @brief Cleanly shuts down the thread pool and releases resources
 * 
 * @param tp Pointer to thread pool to destroy
 * 
 * This function:
 * 1. Sets shutdown flag
 * 2. Signals all threads to exit
 * 3. Waits for thread completion
 * 4. Cleans up synchronization primitives
 * 5. Frees all allocated memory
 */
void destroy_threadpool(threadpool tp){
    if(tp == NULL) return;

    _threadpool_t *_tp = (_threadpool_t *)tp;

    /* Signal shutdown */
    pthread_mutex_lock(&(_tp->mutex));
    _tp->shutdown = 1;
    pthread_mutex_unlock(&(_tp->mutex));

    /* Wake up all threads */
    for(int i=0; i<TOTAL_THREADS; i++){
        sem_post(&(_tp->sync_sem));
    }

    /* Wait for thread completion and cleanup */
    for(int i=0; i<TOTAL_THREADS; i++){
    
        usleep(1000);
        pthread_join(_tp->pthreads[i], NULL);
        int sem_value;
        sem_getvalue(&(_tp->sync_sem), &sem_value);
        pthread_attr_destroy(&(_tp->pthreads_attr[i]));
    }
    
    /* Free task queue */
    _thread_t *current = _tp->thread_head;
    while(current != NULL){
        _thread_t *next = current->next_thread;
        free(current);
        current = next;
    }
    
    /* Destroy synchronization primitives */
    pthread_mutex_destroy(&(_tp->mutex));
    pthread_cond_destroy(&(_tp->queue_empty));
    pthread_cond_destroy(&(_tp->queue_not_empty));
    sem_destroy(&(_tp->sync_sem));

    /* Free allocated memory */
    free(_tp->pthreads);
    free(_tp->pthreads_attr);
    free(_tp);
}
