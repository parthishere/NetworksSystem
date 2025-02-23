#ifndef __THREADPOOL_H__
#define __THREADPOOL_H__

#include "common.h"

typedef void *threadpool;
typedef void *(*dispatch_fn)(sockdetails_t);

void destroy_threadpool(threadpool tp);
void dispatch(threadpool from_me, dispatch_fn dispatch_to_here, sockdetails_t sd);
threadpool create_threadpool(int num_of_threads_in_pool);

#endif

