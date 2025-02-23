#!/usr/bin/python3
import socket
import threading
import time

"""
HTTP Server Load Testing Script
Copyright (c) 2025 Parth Thakkar

This script implements a multi-threaded HTTP load tester that:
- Creates multiple concurrent connections to an HTTP server
- Sends configurable HTTP requests
- Measures response times and data sizes
- Handles connection timeouts and errors

The tester supports:
- Configurable number of concurrent connections
- Multiple requests per connection
- Keep-alive connections
- Customizable request parameters
"""


# request = { "GET / HTTP/1.1\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n",\
#     "GET / HTTP/1.1\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n",\
#     "GET /404 HTTP/1.1\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n",\
#     "GET / HTTP/0.8\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n",# wrong method \ 
#     "GET / HTTP/1.1\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n",# wrong structure \
#     "GET / HTTP/1.1\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n",\
#     "GET / HTTP/1.1\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n",\
#     "GET / HTTP/1.1\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n",\
#     "GET / HTTP/1.1\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n",\
#     "GET / HTTP/1.1\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n",\
#     "GET / HTTP/1.1\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n"}



def make_request(host, port, loops=10):
    """
    Makes HTTP requests to the specified server
    
    Args:
        host (str): Target server hostname
        port (int): Target server port
        loops (int): Number of requests to make per connection
    
    This function:
    1. Creates a TCP socket connection
    2. Sends HTTP requests with keep-alive
    3. Reads complete responses
    4. Handles timeouts and errors
    5. Cleans up resources
    """
     
    for i in range(loops):
        try:
            # Create socket
            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            sock.settimeout(5)  # 5 second timeout
            
            # Connect
            sock.connect((host, port))
            
            # Send HTTP request
            request = (
                "GET / HTTP/1.1\r\n"
                f"Host: {host}:{port}\r\n"
                "Connection: keep-alive\r\n"
                "\r\n"
            )
            sock.send(request.encode())
            
            # Read response
            response = b""
            while True:
                data = sock.recv(1024)
                if not data:
                    break
                response += data
                
            print(f"Response received: {len(response)} bytes")
        
        except Exception as e:
            print(f"Error: {e}")
            break;
                
    sock.close()

def run_test(num_connections, host='localhost', port=8000, loops=10):
    """
    Runs multi-threaded load test against target server
    
    Args:
        num_connections (int): Number of concurrent connections
        host (str): Target server hostname
        port (int): Target server port
        loops (int): Requests per connection
    
    This function:
    1. Creates specified number of worker threads
    2. Initiates concurrent connections
    3. Waits for all threads to complete
    4. Handles thread synchronization
    """
    
    threads = []
    
    # Create and start threads
    for i in range(num_connections):
        t = threading.Thread(target=make_request, args=(host, port, loops))
        threads.append(t)
        t.start()
        print(f"Started connection {i+1}")
        # time.sleep(0.1)  # Small delay between starting connections
    
    # Wait for all threads to complete
    for t in threads:
        t.join()

if __name__ == "__main__":
    # Test configuration
    HOST = 'localhost'      # Target server hostname
    PORT = 8000            # Target server port
    CONNECTIONS = 100        # Number of simultaneous connections
    LOOPS = 10             # Requests per connection
    
    print(f"Starting load test with {CONNECTIONS} connections")
    print(f"Target: {HOST}:{PORT}")
    
    run_test(CONNECTIONS, HOST, PORT, LOOPS)
    print(f"Test completed with total {CONNECTIONS * LOOPS} requests")