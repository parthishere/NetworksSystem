#!/usr/bin/python3
import socket
import threading
import time


request = { "GET / HTTP/1.1\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n",\
    "GET / HTTP/1.1\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n",\
    "GET /404 HTTP/1.1\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n",\
    "GET / HTTP/0.8\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n",# wrong method \ 
    "GET / HTTP/1.1\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n",# wrong structure \
    "GET / HTTP/1.1\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n",\
    "GET / HTTP/1.1\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n",\
    "GET / HTTP/1.1\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n",\
    "GET / HTTP/1.1\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n",\
    "GET / HTTP/1.1\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n",\
    "GET / HTTP/1.1\r\nHost: localhost:8000\r\nConnection: keep-alive\r\n\r\n"}
def make_request(host, port): 
    for i in range(10):
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
                # "Connection: keep-alive\r\n"
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

def run_test(num_connections, host='localhost', port=8000):
    threads = []
    
    # Create and start threads
    for i in range(num_connections):
        t = threading.Thread(target=make_request, args=(host, port))
        threads.append(t)
        t.start()
        print(f"Started connection {i+1}")
        # time.sleep(0.1)  # Small delay between starting connections
    
    # Wait for all threads to complete
    for t in threads:
        t.join()

if __name__ == "__main__":
    HOST = 'localhost'
    PORT = 8000
    CONNECTIONS = 100 # Number of simultaneous connections
    
    print(f"Starting load test with {CONNECTIONS} connections")
    print(f"Target: {HOST}:{PORT}")
    
    run_test(CONNECTIONS, HOST, PORT)
    print("Test completed")