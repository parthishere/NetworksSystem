/**
 * @file threadpool.h
 * @brief Thread Pool Interface for Concurrent Task Execution
 * @copyright (c) 2025 Your Organization
 *
 * This header file defines the public interface for a thread pool implementation
 * that manages concurrent task execution. It provides an opaque pointer-based API
 * for thread pool creation, task dispatching, and cleanup operations.
 *
 * Usage Example:
 * @code
 *     // Create a thread pool with 4 worker threads
 *     threadpool pool = create_threadpool(4);
 *     
 *     // Dispatch a task
 *     dispatch(pool, my_task_function, socket_details);
 *     
 *     // Cleanup
 *     destroy_threadpool(pool);
 * @endcode
 */


#ifndef __THREADPOOL_H__
#define __THREADPOOL_H__

#include "common.h"

/**
 * @typedef threadpool
 * @brief Opaque pointer type representing a thread pool instance
 * 
 * This type hides the internal implementation details of the thread pool
 * structure, providing encapsulation and preventing direct manipulation
 * of pool internals by clients.
 */
typedef void *threadpool;

/**
 * @typedef dispatch_fn
 * @brief Function pointer type for tasks that can be dispatched to the thread pool
 * 
 * @param sockDetails_t Socket details structure containing connection information
 * @return void* Result of the task execution (if any)
 * 
 * This type defines the signature for functions that can be scheduled
 * for execution by the thread pool's worker threads.
 */
typedef void *(*dispatch_fn)(sockDetails_t*);

/**
 * @function destroy_threadpool
 * @brief Cleanly shuts down a thread pool and releases all associated resources
 * 
 * @param tp Pointer to the thread pool to destroy
 * 
 * This function will:
 * 1. Signal all worker threads to terminate
 * 2. Wait for all threads to complete their current tasks
 * 3. Release all allocated resources
 * 4. Free the thread pool structure
 */
void destroy_threadpool(threadpool tp);

/**
 * @function dispatch
 * @brief Schedules a task for execution by the thread pool
 * 
 * @param from_me Pointer to the thread pool that will execute the task
 * @param dispatch_to_here Function pointer to the task to be executed
 * @param sd Socket details structure containing connection information
 * 
 * This function queues a task for execution by one of the pool's worker threads.
 * If all threads are busy, the task will wait in the queue until a thread
 * becomes available.
 */
void dispatch(threadpool from_me, dispatch_fn dispatch_to_here, sockDetails_t *sd);

/**
 * @function create_threadpool
 * @brief Creates and initializes a new thread pool
 * 
 * @param num_of_threads_in_pool Number of worker threads to create in the pool
 * @return threadpool Pointer to the created thread pool, or NULL on failure
 * 
 * This function initializes a new thread pool with the specified number of
 * worker threads. The threads are created in a ready state, waiting for
 * tasks to be dispatched.
 * 
 * @note The number of threads must be greater than 0 and less than or equal
 * to MAX_THREAD_IN_POOL (defined in common.h)
 */
threadpool create_threadpool(int num_of_threads_in_pool);

#endif

