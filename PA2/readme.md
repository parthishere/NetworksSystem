# HTTP Server Implementation
A basic (C) Socket HTTP server implementation supporting HTTP/1.0 and HTTP/1.1 protocols with thread pool management and zero-copy file transfers.

## Table of Contents
- [Features](#features)
- [Architecture](#architecture)
- [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)
- [Implementation Details](#implementation-details)
- [Performance Considerations](#performance-considerations)
- [Testing](#testing)
- [Security Considerations](#security-considerations)
- [API Reference](#api-reference)

## Features
- **Protocol Support**
  - HTTP/1.0 and HTTP/1.1 compatibility
  - Keep-alive connections
  - Multiple request methods (GET, POST, DELETE, PATCH)
  - Comprehensive status code handling

- **Performance Optimizations**
  - Thread pool for connection management
  - Zero-copy file transfers using sendfile()
  - Non-blocking I/O with select()
  - Connection timeout handling

- **Security Features**
  - Path traversal prevention
  - Resource access control
  - Input validation
  - Buffer overflow protection

- **Resource Management**
  - Automatic thread scaling
  - Connection pooling
  - Memory management
  - File descriptor handling

## Architecture

### Core Components
1. **Thread Pool Manager** (`queue.c`)
   - Worker thread creation and management
   - Task queue implementation
   - Thread synchronization
   - Resource cleanup

2. **HTTP Parser** (`parser.c`)
   - Request line parsing
   - Header field extraction
   - Protocol validation
   - Error detection

3. **Response Builder** (`builder.c`)
   - Header construction
   - Content type detection
   - File serving
   - Error response generation

4. **Socket Handler** (`setup.c`)
   - Server socket initialization
   - Client connection acceptance
   - Network configuration
   - Address management

### Data Structures
```c
typedef struct thread_s {
    struct thread_s *next_thread;
    void *(*function_to_run)(sockdetails_t);
    sockdetails_t sd;
} _thread_t;

typedef struct _threadpool {
    int current_thread_number;
    int max_thread_num;
    pthread_t *pthreads;
    pthread_mutex_t mutex;
    sem_t sync_sem;
    _thread_t *thread_head;
    int shutdown;
} _threadpool_t;

typedef struct req_header_s {
    httpType_t http_version;
    char *uri_str;
    contentType_t content_type;
    method_t method;
    int connection_keep_alive;
} HttpHeader_t;
```

## Installation

### Build Instructions
```bash
# Clone the repository
git clone https://github.com/yourusername/http-server.git

# Navigate to project directory
cd http-server

# Build the server
make

# Run tests
make test
```

## Usage

### Starting the Server
```bash
# Start server on default port 8000
./http_server 8000

# Start with specific port
./http_server <port_number>
```

### Directory Structure
```
www/                 # Web root directory
├── index.html      # Default page
├── css/           # Stylesheets
├── js/            # JavaScript files
└── images/        # Media files
```

### Configuration Options
Edit `common.h` to modify server settings:
```c
#define MAX_SIZE (1024 * 30)   // Buffer size
#define TOTAL_THREADS 150      // Thread pool size
#define TIMEOUT_HTTP_SEC 2     // Connection timeout
#define USE_SENDFILE 1         // Enable zero-copy
```

## Implementation Details

### Thread Pool Management
The server uses a thread pool for handling concurrent connections:
1. Pre-creates a configurable number of worker threads
2. Maintains a task queue for incoming connections
3. Uses semaphores for thread synchronization
4. Implements graceful shutdown handling

### HTTP Parsing
Request parsing follows RFC 2616 specifications:
1. Line-by-line parsing using strtok_r()
2. Header field extraction and validation
3. Method and protocol version verification
4. URI security checks

### File Serving
Implements optimized file serving:
```c
#if USE_SENDFILE
    /* Zero-copy transfer */
    numbytes = sendfile(sd->client_sock_fd, fd, NULL, size);
#else
    /* Buffered transfer */
    while ((numbytes = read(fd, buffer, RECIEVE_SIZE)) > 0) {
        send(sd->client_sock_fd, buffer, numbytes, MSG_NOSIGNAL);
    }
#endif
```

### Connection Management
- Implements keep-alive connections
- Handles connection timeouts using select()
- Proper resource cleanup on connection close
- Error recovery mechanisms

## Performance Considerations

### Thread Pool Optimization
- Default pool size: 150 threads
- Dynamic task queue
- Thread reuse to avoid creation overhead
- Semaphore-based synchronization

### Memory Management
- Fixed-size buffers (30KB default)
- Zero-copy file transfers when possible
- Proper memory cleanup in error cases
- Resource limit enforcement

### Network Optimization
- Non-blocking I/O operations
- Keep-alive connection support
- Connection timeout handling
- Buffer size tuning

## Testing

### Load Testing Script
Included Python script for performance testing:
```python
python3 load_test.py --connections 100 --loops 10
```

Test parameters:
- Concurrent connections
- Requests per connection
- Connection timeout
- Request patterns

### Error Testing
Test cases include:
- Invalid HTTP methods
- Malformed requests
- Path traversal attempts
- Protocol violations
- Resource limits

## Security Considerations

### Input Validation
- URI sanitization
- Header field validation
- Buffer size checks
- Method verification

### Resource Protection
- Path traversal prevention
- File permission checks
- Resource limits
- Error handling

### Error Handling
- Comprehensive error codes
- Secure error responses
- Resource cleanup
- Connection termination

## API Reference

### Thread Pool API
```c
threadpool create_threadpool(int num_threads);
void dispatch(threadpool tp, dispatch_fn fn, sockdetails_t sd);
void destroy_threadpool(threadpool tp);
```

### HTTP Handling API
```c
int parse_request_line_thread_safe(char *request, HttpHeader_t *header);
void build_and_send_header(HttpHeader_t *header, sockdetails_t *sd);
void init_server_side_socket(sockdetails_t *sd, char *argv[]);
```

