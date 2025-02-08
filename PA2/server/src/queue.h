#ifndef __THREADPOOL_H__
#define __THREADPOOL_H__

#define MAX_THREAD_IN_POOL 200

typedef void *threadpool;
typedef void *(*dispatch_fn)(void *);


void dispatch(threadpool from_me, dispatch_fn dispatch_to_here, void *arg);
threadpool create_threadpool(int num_of_threads_in_pool);

#endif

