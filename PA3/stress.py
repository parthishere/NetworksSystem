# #!/usr/bin/python3
# import socket
# import threading
# import time

# """
# HTTP Server Load Testing Script
# Copyright (c) 2025 Parth Thakkar

# This script implements a multi-threaded HTTP load tester that:
# - Creates multiple concurrent connections to an HTTP server
# - Sends configurable HTTP requests
# - Measures response times and data sizes
# - Handles connection timeouts and errors

# The tester supports:
# - Configurable number of concurrent connections
# - Multiple requests per connection
# - Keep-alive connections
# - Customizable request parameters
# """


# # request = { "GET / HTTP/1.1\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n",\
# #     "GET / HTTP/1.1\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n",\
# #     "GET /404 HTTP/1.1\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n",\
# #     "GET / HTTP/0.8\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n",# wrong method \ 
# #     "GET / HTTP/1.1\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n",# wrong structure \
# #     "GET / HTTP/1.1\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n",\
# #     "GET / HTTP/1.1\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n",\
# #     "GET / HTTP/1.1\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n",\
# #     "GET / HTTP/1.1\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n",\
# #     "GET / HTTP/1.1\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n",\
# #     "GET / HTTP/1.1\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n"}



# def make_request(host, port, loops=10):
#     """
#     Makes HTTP requests to the specified server
    
#     Args:
#         host (str): Target server hostname
#         port (int): Target server port
#         loops (int): Number of requests to make per connection
    
#     This function:
#     1. Creates a TCP socket connection
#     2. Sends HTTP requests with keep-alive
#     3. Reads complete responses
#     4. Handles timeouts and errors
#     5. Cleans up resources
#     """
     
#     for i in range(loops):
#         try:
#             # Create socket
#             sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
#             sock.settimeout(5)  # 5 second timeout
            
#             # Connect
#             sock.connect((host, port))
            
#             # Send HTTP request
#             request = (
#                 "GET http://httpbin.org/get HTTP/1.1\r\n"
#                 f"Host: httpbin.org\r\n"
#                 "Connection: keep-alive\r\n"
#                 "\r\n"
#             )
#             sock.send(request.encode())
            
#             # Read response
#             response = b""
#             while True:
#                 data = sock.recv(1024)
#                 if not data:
#                     break
#                 response += data
                
#             print(f"---------- \nResponse received: {len(response)} bytes, \n {response}\n --------- \n")
        
#         except Exception as e:
#             print(f"Error: {e}")
#             break;
                
#     sock.close()

# def run_test(num_connections, host='localhost', port=8000, loops=10):
#     """
#     Runs multi-threaded load test against target server
    
#     Args:
#         num_connections (int): Number of concurrent connections
#         host (str): Target server hostname
#         port (int): Target server port
#         loops (int): Requests per connection
    
#     This function:
#     1. Creates specified number of worker threads
#     2. Initiates concurrent connections
#     3. Waits for all threads to complete
#     4. Handles thread synchronization
#     """
    
#     threads = []
    
#     # Create and start threads
#     for i in range(num_connections):
#         t = threading.Thread(target=make_request, args=(host, port, loops))
#         threads.append(t)
#         t.start()
#         print(f"Started connection {i+1}")
#         # time.sleep(0.1)  # Small delay between starting connections
    
#     # Wait for all threads to complete
#     for t in threads:
#         t.join()

# if __name__ == "__main__":
#     # Test configuration
#     HOST = 'localhost'      # Target server hostname
#     PORT = 8080            # Target server port
#     CONNECTIONS = 1        # Number of simultaneous connections
#     LOOPS = 100             # Requests per connection
    
#     print(f"Starting load test with {CONNECTIONS} connections")
#     print(f"Target: {HOST}:{PORT}")
    
#     run_test(CONNECTIONS, HOST, PORT, LOOPS)
#     print(f"Test completed with total {CONNECTIONS * LOOPS} requests")



# #!/usr/bin/python3
# import socket
# import threading
# import time

# """
# HTTP Server Load Testing Script
# Copyright (c) 2025 Parth Thakkar

# This script implements a multi-threaded HTTP load tester that:
# - Creates multiple concurrent connections to an HTTP server
# - Sends configurable HTTP requests with edge cases
# - Measures response times and data sizes
# - Handles connection timeouts and errors
# - Supports serial and parallel requests
# """

# def make_request(host, port, requests):
#     """
#     Makes a sequence of HTTP requests to the specified server.
    
#     Args:
#         host (str): Target server hostname
#         port (int): Target server port
#         requests (list): List of request strings
#     """
#     try:
#         sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
#         sock.settimeout(10)  # 5 second timeout
#         sock.connect((host, port))

#         for request_str in requests:
#             try:
#                 print(f"> sent : \n{request_str}")
#                 sock.send(request_str.encode())
#                 response = b""
#                 while True:
#                     data = sock.recv(1024)
#                     if not data:
#                         break
#                     response += data
#                 print(f"< Response received: {len(response)} bytes, \n{response}\n -------- \n")

#             except Exception as e:
#                 print(f"Error during request: {e}")
#                 break

#         sock.close()

#     except Exception as e:
#         print(f"Error during connection: {e}")

# def run_test(num_connections, requests, host='localhost', port=8080):
#     """
#     Runs multi-threaded load test against target server.
    
#     Args:
#         num_connections (int): Number of concurrent connections
#         host (str): Target server hostname
#         port (int): Target server port
#         requests (list): List of request strings
#         parallel (bool): If True, each connection sends all requests; if False, requests are distributed.
#     """
        

#     threads = []
    
    
#     for i in range(num_connections):
#         t = threading.Thread(target=make_request, args=(host, port, requests))
#         threads.append(t)
#         t.start()
#         print(f"Started parallel connection {i+1}")
    
#     req_per_thread = len(requests) // num_connections
#     remainder = len(requests) % num_connections

#     for i in range(num_connections):
#         start = i * req_per_thread + min(i, remainder)
#         end = start + req_per_thread + (1 if i < remainder else 0)
#         thread_requests = requests[start:end]
#         t = threading.Thread(target=make_request, args=(host, port, thread_requests))
#         threads.append(t)
#         t.start()
#         print(f"Started serial connection {i+1} with requests {start} to {end}")

#     for t in threads:
#         t.join()

# if __name__ == "__main__":
#     HOST = 'localhost'
#     PORT = 8080
#     CONNECTIONS = 5
#     NORMAL_TEST = True
    
#     requests_list = [
#         "GET http://httpbin.org/get HTTP/1.1\r\nHost: httpbin.org\r\nConnection: keep-alive\r\n\r\n",
#         "GET http://httpbin.org/get HTTP/1.1\r\nHost: httpbin.org\r\nConnection: keep-alive\r\n\r\n",
#         "GET http://httpbin.org/get HTTP/1.1\r\nHost: httpbin.org\r\nConnection: keep-alive\r\n\r\n",
#         "GET http://httpbin.org/get HTTP/1.1\r\nHost: httpbin.org\r\nConnection: keep-alive\r\n\r\n",
#         "GET http://httpbin.org/get HTTP/1.1\r\nHost: httpbin.org\r\nConnection: keep-alive\r\n\r\n",
#     ]

#     print(f"Starting load test with {CONNECTIONS} connections")
#     print(f"Target: {HOST}:{PORT}")
#     if not NORMAL_TEST:
#         run_test(CONNECTIONS, requests_list, HOST, PORT)
#     else:
#        make_request(HOST, PORT, requests_list)
#     print(f"Test completed")
    
    
    
#!/usr/bin/python3
import socket
import threading
import time

"""
HTTP Server Load Testing Script
Copyright (c) 2025 Parth Thakkar

This script implements a multi-threaded HTTP load tester that:
- Creates multiple concurrent connections to an HTTP server
- Sends configurable HTTP requests with edge cases
- Measures response times and data sizes
- Handles connection timeouts and errors
- Supports serial and parallel requests
"""

def make_request(host, port, requests):
    """
    Makes a sequence of HTTP requests to the specified server.
    
    Args:
        host (str): Target server hostname
        port (int): Target server port
        requests (list): List of request strings
    """
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.settimeout(10)  # 10 second timeout
        sock.connect((host, port))

        for request_str in requests:
            try:
                print(f"> sent : \n{request_str}")
                sock.send(request_str.encode())
                
                # Read the response with a proper HTTP response parsing
                response = b""
                start_time = time.time()
                
                # Loop with timeout to prevent hanging
                while time.time() - start_time < 10:  # 10 second max read time
                    try:
                        chunk = sock.recv(4096)  # Larger buffer
                        if not chunk:
                            break  # Connection closed by server
                        response += chunk
                        
                        # # Check if we've received a complete HTTP response
                        # if b"\r\n\r\n" in response and (
                        #     # Either not a chunked response
                        #     (b"Transfer-Encoding: chunked" not in response) or 
                        #     # Or chunked response with terminating chunk
                        #     (b"\r\n0\r\n\r\n" in response)
                        # ):
                        #     break 
                            
                    except socket.timeout:
                        print("Socket timeout while receiving data")
                        break
                
                print(f"< Response received: {len(response)} bytes for header > \n{request_str} \n --------")
                # if len(response) > 0:
                #     # Print the header part only to keep the output readable
                #     header_end = response.find(b"\r\n\r\n") + 4
                #     print(response[:header_end].decode('utf-8', errors='replace'))
                #     print("... [body content] ...")

            except Exception as e:
                print(f"Error during request: {e}")
                break

        sock.close()

    except Exception as e:
        print(f"Error during connection: {e}")

def run_test(num_connections, requests, host='localhost', port=8080, parallel=True):
    """
    Runs multi-threaded load test against target server.
    
    Args:
        num_connections (int): Number of concurrent connections
        host (str): Target server hostname
        port (int): Target server port
        requests (list): List of request strings
        parallel (bool): If True, each connection sends all requests; if False, requests are distributed.
    """
    threads = []
    
    if parallel:
        # Parallel mode: each thread sends all requests
        for i in range(num_connections):
            t = threading.Thread(target=make_request, args=(host, port, requests))
            threads.append(t)
            t.start()
            print(f"Started parallel connection {i+1}")
    else:
        # Serial mode: distribute requests among threads
        req_per_thread = max(1, len(requests) // num_connections)
        remainder = len(requests) % num_connections

        for i in range(min(num_connections, len(requests))):
            start = i * req_per_thread + min(i, remainder)
            end = start + req_per_thread + (1 if i < remainder else 0)
            thread_requests = requests[start:end]
            t = threading.Thread(target=make_request, args=(host, port, thread_requests))
            threads.append(t)
            t.start()
            print(f"Started serial connection {i+1} with requests {start} to {end-1}")

    for t in threads:
        t.join()

if __name__ == "__main__":
    HOST = 'localhost'  # Change this to your actual target host
    PORT = 8080         # Change this to your actual target port
    CONNECTIONS = 5
    PARALLEL_MODE = True  # Set to False for serial mode
    
    # IMPORTANT: For direct socket connections to a server (not through a proxy),
    # the request line should NOT include the full URL
    requests_list = [
        "GET / HTTP/1.1\r\nHost: localhost:8080\r\nConnection: keep-alive\r\n\r\n",
        "GET /api HTTP/1.1\r\nHost: localhost:8080\r\nConnection: keep-alive\r\n\r\n",
        "GET /test HTTP/1.1\r\nHost: localhost:8080\r\nConnection: keep-alive\r\n\r\n",
        "POST /submit HTTP/1.1\r\nHost: localhost:8080\r\nContent-Length: 11\r\nConnection: keep-alive\r\n\r\nHello World",
        "GET /nonexistent HTTP/1.1\r\nHost: localhost:8080\r\nConnection: close\r\n\r\n",
    ]

    # For testing against a real web service like httpbin.org
    # You need to connect directly to that host and port, not localhost
    httpbin_requests = [
        "GET /get HTTP/1.1\r\nHost: httpbin.org\r\nConnection: keep-alive\r\n\r\n",
        "GET /status/200 HTTP/1.1\r\nHost: httpbin.org\r\nConnection: keep-alive\r\n\r\n",
        "GET /headers HTTP/1.1\r\nHost: httpbin.org\r\nConnection: keep-alive\r\n\r\n",
        "POST /post HTTP/1.1\r\nHost: httpbin.org\r\nContent-Length: 11\r\nConnection: keep-alive\r\n\r\nHello World",
        "GET /delay/1 HTTP/1.1\r\nHost: httpbin.org\r\nConnection: close\r\n\r\n",
    ]

    print(f"Starting load test with {CONNECTIONS} connections")
    print(f"Target: {HOST}:{PORT}")
    
    # Choose which test mode to run
    # 1. Simple test - single connection with all requests
    # make_request(HOST, PORT, requests_list)
    
    # 2. Full test - multiple connections in parallel or serial mode
    run_test(CONNECTIONS, requests_list, HOST, PORT, PARALLEL_MODE)
    
    # 3. Test against httpbin.org (uncomment to use)
    # run_test(CONNECTIONS, httpbin_requests, "httpbin.org", 80, PARALLEL_MODE)
    
    print("Test completed")