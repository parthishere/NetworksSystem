#!/usr/bin/python3
"""
Test script for Distributed File System client

This script tests the DFC client sending requests to server:
- In series (one after another)
- In parallel (multiple concurrent requests)
- Using a mix of both approaches
- With recursive patterns
"""

import os
import sys
import time
import subprocess
import threading
from concurrent.futures import ThreadPoolExecutor, as_completed

# Configuration
CLIENT_BINARY = "./dfc"
TEST_DIR = "./test_files"
DOWNLOAD_DIR = "./download"
MAX_CLIENTS = 5  # Maximum number of parallel clients

def run_client_command(command, args=None, client_id=0):
    """Run a DFC client command and return the result"""
    cmd = [CLIENT_BINARY, command]
    if args:
        if isinstance(args, list):
            cmd.extend(args)
        else:
            cmd.append(args)
    
    print(f"Client {client_id}: Running command: {' '.join(cmd)}")
    
    result = subprocess.run(
        cmd, 
        stdout=subprocess.PIPE, 
        stderr=subprocess.PIPE,
        text=True,
        errors='replace'
    )
    
    print(f"Client {client_id} output: {result.stdout.strip()}")
    
    if result.returncode != 0:
        print(f"Client {client_id}: Command failed with code {result.returncode}")
        print(f"Error: {result.stderr.strip()}")
    else:
        print(f"Client {client_id}: Command completed successfully")
    
    return result

def clean_download_folder():
    """Clean the download folder between tests"""
    if not os.path.exists(DOWNLOAD_DIR):
        os.makedirs(DOWNLOAD_DIR)
    for file in os.listdir(DOWNLOAD_DIR):
        file_path = os.path.join(DOWNLOAD_DIR, file)
        if os.path.isfile(file_path):
            os.remove(file_path)
    print("Cleaned download folder")

def run_serial_test():
    """Run client commands one after another"""
    print("\n=== SERIAL TEST ===")
    clean_download_folder()
    
    test_files = [
        os.path.join(TEST_DIR, "tiny.txt"),
        os.path.join(TEST_DIR, "small.txt"),
        os.path.join(TEST_DIR, "medium.txt")
    ]
    
    # PUT operations
    for file_path in test_files:
        print(f"Uploading file: {os.path.basename(file_path)}")
        run_client_command("put", file_path)
    
    # LIST operation
    run_client_command("ls")
    
    # GET operations
    for file_path in test_files:
        filename = os.path.basename(file_path)
        print(f"Downloading file: {filename}")
        run_client_command("get", filename)

def run_parallel_test():
    """Run client commands in parallel"""
    print("\n=== PARALLEL TEST ===")
    clean_download_folder()
    
    test_files = [
        os.path.join(TEST_DIR, "tiny.txt"),
        os.path.join(TEST_DIR, "small.txt"),
        os.path.join(TEST_DIR, "medium.txt")
    ]
    
    # Upload files in parallel
    def client_upload(client_id, file_path):
        print(f"Client {client_id}: Uploading {os.path.basename(file_path)}")
        run_client_command("put", file_path, client_id)
    
    with ThreadPoolExecutor(max_workers=len(test_files)) as executor:
        for i, file_path in enumerate(test_files):
            executor.submit(client_upload, i, file_path)
    
    # Run LIST command
    run_client_command("ls")
    
    # Download files in parallel
    def client_download(client_id, filename):
        print(f"Client {client_id}: Downloading {filename}")
        run_client_command("get", filename, client_id)
    
    with ThreadPoolExecutor(max_workers=len(test_files)) as executor:
        for i, file_path in enumerate(test_files):
            filename = os.path.basename(file_path)
            executor.submit(client_download, i, filename)

def run_recursive_test(depth=3):
    """Run a recursive test pattern, where each operation spawns sub-operations"""
    print(f"\n=== RECURSIVE TEST (depth={depth}) ===")
    clean_download_folder()
    
    test_file = os.path.join(TEST_DIR, "small.txt")
    filename = os.path.basename(test_file)
    
    def recursive_operation(current_depth, client_id):
        if current_depth <= 0:
            return
        
        # PUT operation
        print(f"Client {client_id} (depth {current_depth}): PUT operation")
        run_client_command("put", test_file, client_id)
        
        # Spawn two sub-operations with different client IDs
        if current_depth > 1:
            threads = []
            # First sub-operation: LIST
            t1 = threading.Thread(
                target=lambda: run_client_command("ls", client_id=client_id*10+1)
            )
            threads.append(t1)
            t1.start()
            
            # Second sub-operation: Recursive call with reduced depth
            t2 = threading.Thread(
                target=recursive_operation, 
                args=(current_depth-1, client_id*10+2)
            )
            threads.append(t2)
            t2.start()
            
            # Wait for sub-operations to complete
            for t in threads:
                t.join()
        
        # GET operation
        print(f"Client {client_id} (depth {current_depth}): GET operation")
        run_client_command("get", filename, client_id)
    
    # Start the recursive operation
    recursive_operation(depth, 1)

def run_mixed_test():
    """Run a mix of serial and parallel operations"""
    print("\n=== MIXED TEST ===")
    clean_download_folder()
    
    test_files = [
        os.path.join(TEST_DIR, "tiny.txt"),
        os.path.join(TEST_DIR, "small.txt"),
        os.path.join(TEST_DIR, "medium.txt"),
        os.path.join(TEST_DIR, "readable.txt")
    ]
    
    # First, sequential uploads
    print("Sequential uploads:")
    for i, file_path in enumerate(test_files[:2]):
        print(f"Uploading file: {os.path.basename(file_path)}")
        run_client_command("put", file_path, i)
    
    # Then, parallel uploads
    print("Parallel uploads:")
    with ThreadPoolExecutor(max_workers=2) as executor:
        for i, file_path in enumerate(test_files[2:]):
            executor.submit(run_client_command, "put", file_path, i+2)
    
    # LIST operation
    run_client_command("ls")
    
    # Mixed downloads: some sequential, some parallel
    print("Mixed downloads:")
    
    # Sequential downloads
    for filename in [os.path.basename(test_files[0])]:
        print(f"Sequential download: {filename}")
        run_client_command("get", filename)
    
    # Parallel downloads
    parallel_files = [os.path.basename(f) for f in test_files[1:]]
    with ThreadPoolExecutor(max_workers=len(parallel_files)) as executor:
        for i, filename in enumerate(parallel_files):
            executor.submit(run_client_command, "get", filename, i+1)

def main():
    """Run all tests"""
    if not os.path.exists(TEST_DIR):
        print(f"Test directory {TEST_DIR} does not exist!")
        sys.exit(1)
    
    print("Starting DFC client tests...")
    
    # Run the different test scenarios
    run_serial_test()
    run_parallel_test()
    run_recursive_test()
    run_mixed_test()
    
    print("\nAll tests completed!")

if __name__ == "__main__":
    main()