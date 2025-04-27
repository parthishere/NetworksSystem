#!/usr/bin/env python3
"""
Comprehensive Test Suite for Distributed File System (DFC/DFS)

This script tests the DFC client and DFS servers with various scenarios:
- Sequential and parallel operations
- Multiple clients sending requests simultaneously
- Various file types and sizes
- Server failure scenarios
- Verification of file integrity

Usage:
    python3 test_dfs.py
"""

import os
import sys
import time
import random
import string
import subprocess
import threading
import hashlib
import filecmp
import shutil
from concurrent.futures import ThreadPoolExecutor, as_completed

# Configuration
CLIENT_BINARY = "./client/dfc"
SERVER_BINARY = "./server/dfs"
DFS_DIRS = ["./server/dfs1", "./server/dfs2", "./server/dfs3", "./server/dfs4"]
DFS_PORTS = ["8000", "8001", "8003", "8004"]
TEST_DIR = "./test_files"
DOWNLOAD_DIR = "./client/download"
RESULTS_DIR = "./test_results"
MAX_CLIENTS = 3
VERBOSE = True  # Set to False to reduce output

# Colors for terminal output
class Colors:
    GREEN = '\033[92m'
    RED = '\033[91m'
    YELLOW = '\033[93m'
    BLUE = '\033[94m'
    MAGENTA = '\033[95m'
    CYAN = '\033[96m'
    RESET = '\033[0m'
    BOLD = '\033[1m'

def log(message, color=Colors.RESET, verbose=False):
    """Print a message with color, respecting verbose setting"""
    if verbose and not VERBOSE:
        return
    print(f"{color}{message}{Colors.RESET}")

def generate_random_file(filename, size_kb):
    """Generate a file with random content of specified size"""
    with open(filename, 'wb') as f:
        f.write(os.urandom(size_kb * 1024))
    log(f"Generated random file: {filename} ({size_kb} KB)", Colors.BLUE, True)

def calculate_md5(filename):
    """Calculate MD5 hash of a file"""
    hash_md5 = hashlib.md5()
    with open(filename, "rb") as f:
        for chunk in iter(lambda: f.read(4096), b""):
            hash_md5.update(chunk)
    return hash_md5.hexdigest()

def setup():
    """Setup test environment"""
    log("\n" + Colors.BOLD + "SETTING UP TEST ENVIRONMENT" + Colors.RESET)
    
    # Create test directories
    for directory in [TEST_DIR, RESULTS_DIR]:
        if not os.path.exists(directory):
            os.makedirs(directory)
            log(f"Created directory: {directory}")
    
    # Generate test files of different sizes
    if not os.listdir(TEST_DIR):
        file_sizes = [
            ("tiny.txt", 1),          # 1 KB
            ("small.txt", 10),        # 10 KB
            ("medium.txt", 100),      # 100 KB
            ("large.txt", 1000),      # 1 MB
            ("huge.txt", 5000)        # 5 MB
        ]
        
        for filename, size in file_sizes:
            generate_random_file(os.path.join(TEST_DIR, filename), size)
        
        # Create a text file with readable content
        with open(os.path.join(TEST_DIR, "readable.txt"), 'w') as f:
            f.write("This is a readable text file for the DFS test.\n")
            f.write("It contains multiple lines of text to test line integrity.\n")
            f.write("Each line should be preserved exactly as written.\n")
            f.write("1234567890!@#$%^&*()_+\n")  # Special characters
        
        log("Generated all test files", Colors.GREEN)
    
    # Create a configuration file for the client
    config_content = ""
    for i, (port, directory) in enumerate(zip(DFS_PORTS, DFS_DIRS)):
        config_content += f"server dfs{i+1} 127.0.0.1:{port}\n"
    
    with open("./client/dfc.conf", 'w') as f:
        f.write(config_content)
    
    log("Created client configuration file", Colors.GREEN)

def start_servers():
    """Start all DFS servers"""
    log("\n" + Colors.BOLD + "STARTING DFS SERVERS" + Colors.RESET)
    
    processes = []
    for i, (port, directory) in enumerate(zip(DFS_PORTS, DFS_DIRS)):
        cmd = [SERVER_BINARY, directory, port]
        log(f"Starting server {i+1}: {' '.join(cmd)}", Colors.CYAN)
        
        # Start the server process and redirect output to a log file
        log_file = open(f"{RESULTS_DIR}/server{i+1}.log", "w")
        process = subprocess.Popen(
            cmd, 
            stdout=log_file, 
            stderr=log_file,
            universal_newlines=True
        )
        processes.append((process, log_file))
    
    # Give servers time to start
    time.sleep(2)
    log("All servers started", Colors.GREEN)
    return processes

def stop_servers(server_processes):
    """Stop all DFS servers"""
    log("\n" + Colors.BOLD + "STOPPING DFS SERVERS" + Colors.RESET)
    
    for i, (process, log_file) in enumerate(server_processes):
        log(f"Stopping server {i+1}", Colors.CYAN)
        process.terminate()
        process.wait()
        log_file.close()
    
    log("All servers stopped", Colors.GREEN)

def run_client_command(command, args=None, client_id=0):
    """Run a DFC client command and return the result"""
    cmd = [CLIENT_BINARY, command]
    if args:
        if isinstance(args, list):
            cmd.extend(args)
        else:
            cmd.append(args)
    
    log(f"Client {client_id}: Running command: {' '.join(cmd)}", Colors.CYAN, True)
    
    result = subprocess.run(
        cmd, 
        stdout=subprocess.PIPE, 
        stderr=subprocess.PIPE,
        universal_newlines=True
    )
    print(result.stdout)
    
    if result.returncode != 0:
        log(f"Client {client_id}: Command failed with code {result.returncode}", Colors.RED)
        log(f"Error: {result.stderr}", Colors.RED, True)
    else:
        log(f"Client {client_id}: Command completed successfully", Colors.GREEN, True)
    
    return result

def verify_file_transfer(original_path, downloaded_file, test_name, client_id=0):
    """Verify that a file was transferred correctly by comparing MD5 hashes"""
    original_file = os.path.basename(original_path)
    downloaded_path = os.path.join(DOWNLOAD_DIR, downloaded_file)
    
    if not os.path.exists(downloaded_path):
        log(f"Client {client_id}: [{test_name}] FAIL - Downloaded file does not exist: {downloaded_path}", Colors.RED)
        return False
    
    original_md5 = calculate_md5(original_path)
    downloaded_md5 = calculate_md5(downloaded_path)
    
    if original_md5 == downloaded_md5:
        log(f"Client {client_id}: [{test_name}] PASS - File integrity verified: {downloaded_file}", Colors.GREEN)
        return True
    else:
        log(f"Client {client_id}: [{test_name}] FAIL - File integrity check failed: {downloaded_file}", Colors.RED)
        log(f"Original MD5: {original_md5}", Colors.RED, True)
        log(f"Downloaded MD5: {downloaded_md5}", Colors.RED, True)
        return False

def clean_download_folder():
    """Clean the download folder between tests"""
    for file in os.listdir(DOWNLOAD_DIR):
        file_path = os.path.join(DOWNLOAD_DIR, file)
        if os.path.isfile(file_path):
            os.remove(file_path)
    log("Cleaned download folder", Colors.BLUE, True)

def clean_servers():
    """Clean the server directories"""
    for directory in DFS_DIRS:
        for file in os.listdir(directory):
            if file != "Makefile" and not file.endswith(".sh"):  # Skip makefiles and scripts
                file_path = os.path.join(directory, file)
                if os.path.isfile(file_path):
                    os.remove(file_path)
    log("Cleaned server directories", Colors.BLUE, True)

def test_basic_functionality():
    """Test basic PUT, GET, and LIST operations"""
    log("\n" + Colors.BOLD + "TEST: BASIC FUNCTIONALITY" + Colors.RESET)
    
    # Clean any previous files
    clean_download_folder()
    clean_servers()
    
    test_file = os.path.join(TEST_DIR, "small.txt")
    filename = os.path.basename(test_file)
    
    # Test PUT
    log("\nTesting PUT command...", Colors.YELLOW)
    result = run_client_command("put", test_file)
    if "FILE UPLOAD SUCCESSFUL" not in result.stdout:
        log("PUT command failed", Colors.RED)
        log(result.stdout, Colors.RED, True)
        return False
    
    # Test LIST
    log("\nTesting LIST command...", Colors.YELLOW)
    result = run_client_command("ls")
    if filename not in result.stdout:
        log("LIST command failed to show uploaded file", Colors.RED)
        log(result.stdout, Colors.RED, True)
        return False
    
    # Test GET
    log("\nTesting GET command...", Colors.YELLOW)
    result = run_client_command("get", filename)
    
    # Verify file integrity
    if verify_file_transfer(test_file, filename, "Basic GET"):
        log("Basic functionality test: PASSED", Colors.GREEN)
        return True
    else:
        log("Basic functionality test: FAILED", Colors.RED)
        return False

def test_multiple_files():
    """Test uploading and downloading multiple files"""
    log("\n" + Colors.BOLD + "TEST: MULTIPLE FILES" + Colors.RESET)
    
    # Clean any previous files
    clean_download_folder()
    clean_servers()
    
    test_files = [
        os.path.join(TEST_DIR, "tiny.txt"),
        os.path.join(TEST_DIR, "small.txt"),
        os.path.join(TEST_DIR, "medium.txt"),
        os.path.join(TEST_DIR, "readable.txt")
    ]
    
    # Upload all files one by one
    log("\nUploading multiple files...", Colors.YELLOW)
    for file_path in test_files:
        log(f"Uploading file: {os.path.basename(file_path)}...", Colors.CYAN)
        result = run_client_command("put", file_path)
    
    # Check LIST command
    log("\nVerifying files are listed correctly...", Colors.YELLOW)
    result = run_client_command("ls")
    
    all_files_listed = True
    for file_path in test_files:
        filename = os.path.basename(file_path)
        if filename not in result.stdout:
            log(f"File {filename} not found in LIST output", Colors.RED)
            all_files_listed = False
    
    if not all_files_listed:
        log("Multiple files test (LIST): FAILED", Colors.RED)
        return False
    
    # Download and verify each file
    all_files_verified = True
    for file_path in test_files:
        filename = os.path.basename(file_path)
        log(f"\nDownloading file: {filename}...", Colors.YELLOW)
        result = run_client_command("get", filename)
        
        if not verify_file_transfer(file_path, filename, "Multiple Files"):
            all_files_verified = False
    
    if all_files_verified:
        log("Multiple files test: PASSED", Colors.GREEN)
        return True
    else:
        log("Multiple files test: FAILED", Colors.RED)
        return False

def test_large_file():
    """Test uploading and downloading a large file"""
    log("\n" + Colors.BOLD + "TEST: LARGE FILE" + Colors.RESET)
    
    # Clean any previous files
    clean_download_folder()
    clean_servers()
    
    test_file = os.path.join(TEST_DIR, "large.txt")
    filename = os.path.basename(test_file)
    
    # Upload large file
    log("\nUploading large file...", Colors.YELLOW)
    result = run_client_command("put", test_file)
    
    # Download and verify
    log("\nDownloading large file...", Colors.YELLOW)
    result = run_client_command("get", filename)
    
    if verify_file_transfer(test_file, filename, "Large File"):
        log("Large file test: PASSED", Colors.GREEN)
        return True
    else:
        log("Large file test: FAILED", Colors.RED)
        return False

def test_parallel_operations():
    """Test multiple clients performing operations in parallel"""
    log("\n" + Colors.BOLD + "TEST: PARALLEL OPERATIONS" + Colors.RESET)
    
    # Clean any previous files
    clean_download_folder()
    clean_servers()
    
    # Define test files for each client
    client_files = [
        os.path.join(TEST_DIR, "tiny.txt"),
        os.path.join(TEST_DIR, "small.txt"),
        os.path.join(TEST_DIR, "medium.txt")
    ]
    
    # First, upload all files
    log("\nUploading test files from multiple clients in parallel...", Colors.YELLOW)
    
    def client_upload(client_id, file_path):
        log(f"Client {client_id}: Uploading {os.path.basename(file_path)}", Colors.BLUE, True)
        result = run_client_command("put", file_path, client_id)
        success = "FILE UPLOAD SUCCESSFUL" in result.stdout
        return success
    
    # Use ThreadPoolExecutor to run uploads in parallel
    with ThreadPoolExecutor(max_workers=MAX_CLIENTS) as executor:
        future_to_file = {
            executor.submit(client_upload, i, file_path): (i, file_path)
            for i, file_path in enumerate(client_files)
        }
        
        for future in as_completed(future_to_file):
            client_id, file_path = future_to_file[future]
            try:
                success = future.result()
                if success:
                    log(f"Client {client_id}: Successfully uploaded {os.path.basename(file_path)}", Colors.GREEN)
                else:
                    log(f"Client {client_id}: Failed to upload {os.path.basename(file_path)}", Colors.RED)
            except Exception as e:
                log(f"Client {client_id}: Error uploading file: {e}", Colors.RED)
    
    # Now test parallel downloads
    log("\nDownloading files from multiple clients in parallel...", Colors.YELLOW)
    clean_download_folder()
    
    def client_download(client_id, file_path):
        filename = os.path.basename(file_path)
        result = run_client_command("get", filename, client_id)
        return verify_file_transfer(file_path, filename, "Parallel", client_id)
    
    all_downloads_successful = True
    
    with ThreadPoolExecutor(max_workers=MAX_CLIENTS) as executor:
        future_to_file = {
            executor.submit(client_download, i, file_path): (i, file_path)
            for i, file_path in enumerate(client_files)
        }
        
        for future in as_completed(future_to_file):
            client_id, file_path = future_to_file[future]
            try:
                success = future.result()
                if not success:
                    all_downloads_successful = False
            except Exception as e:
                log(f"Client {client_id}: Error downloading file: {e}", Colors.RED)
                all_downloads_successful = False
    
    # Test parallel LIST operations
    log("\nTesting parallel LIST operations...", Colors.YELLOW)
    
    def client_list(client_id):
        result = run_client_command("ls", client_id=client_id)
        # Check if all files are in the list output
        for file_path in client_files:
            filename = os.path.basename(file_path)
            if filename not in result.stdout:
                log(f"Client {client_id}: File {filename} not found in LIST output", Colors.RED)
                return False
        return True
    
    all_lists_successful = True
    
    with ThreadPoolExecutor(max_workers=MAX_CLIENTS) as executor:
        future_to_client = {
            executor.submit(client_list, i): i
            for i in range(MAX_CLIENTS)
        }
        
        for future in as_completed(future_to_client):
            client_id = future_to_client[future]
            try:
                success = future.result()
                if not success:
                    all_lists_successful = False
            except Exception as e:
                log(f"Client {client_id}: Error listing files: {e}", Colors.RED)
                all_lists_successful = False
    
    if all_downloads_successful and all_lists_successful:
        log("Parallel operations test: PASSED", Colors.GREEN)
        return True
    else:
        log("Parallel operations test: FAILED", Colors.RED)
        return False

def test_mixed_operations():
    """Test a mix of PUT, GET, and LIST operations from multiple clients"""
    log("\n" + Colors.BOLD + "TEST: MIXED OPERATIONS" + Colors.RESET)
    
    # Clean any previous files
    clean_download_folder()
    clean_servers()
    
    # Define operation sequences for each client
    operations = [
        # Client 0: Upload and then download files
        [
            ("put", os.path.join(TEST_DIR, "small.txt")),
            ("put", os.path.join(TEST_DIR, "medium.txt")),
            ("get", "small.txt"),
            ("get", "medium.txt")
        ],
        # Client 1: List files, upload a file, list again
        [
            ("ls", None),
            ("put", os.path.join(TEST_DIR, "tiny.txt")),
            ("ls", None),
            ("get", "tiny.txt")
        ],
        # Client 2: Wait, then download files uploaded by other clients
        [
            ("sleep", 2),  # Wait for other clients to upload
            ("ls", None),
            ("get", "small.txt"),
            ("get", "tiny.txt")
        ]
    ]
    
    def client_routine(client_id, ops):
        results = []
        
        for op, arg in ops:
            if op == "sleep":
                time.sleep(arg)
                continue
                
            if op == "put":
                result = run_client_command(op, arg, client_id)
                filename = os.path.basename(arg)
                success = "FILE UPLOAD SUCCESSFUL" in result.stdout
                log(f"Client {client_id}: PUT {filename} - {'SUCCESS' if success else 'FAIL'}", 
                    Colors.GREEN if success else Colors.RED)
                results.append(success)
                
            elif op == "get":
                # First find the original file path for verification
                original_path = None
                for test_op, test_arg in operations[client_id]:
                    if test_op == "put" and os.path.basename(test_arg) == arg:
                        original_path = test_arg
                        break
                
                # If this client didn't upload it, look at other clients
                if not original_path:
                    for other_client_ops in operations:
                        for test_op, test_arg in other_client_ops:
                            if test_op == "put" and os.path.basename(test_arg) == arg:
                                original_path = test_arg
                                break
                        if original_path:
                            break
                
                result = run_client_command(op, arg, client_id)
                if original_path:
                    success = verify_file_transfer(original_path, arg, "Mixed Ops", client_id)
                    results.append(success)
                else:
                    log(f"Client {client_id}: Cannot verify {arg} - original path not found", Colors.YELLOW)
                    results.append("FILE DOWNLOAD SUCCESSFUL" in result.stdout)
                    
            elif op == "ls":
                result = run_client_command(op, client_id=client_id)
                # Just consider it successful if it runs without error
                success = result.returncode == 0
                log(f"Client {client_id}: LIST - {'SUCCESS' if success else 'FAIL'}", 
                    Colors.GREEN if success else Colors.RED)
                results.append(success)
        
        return all(results) if results else True
    
    # Run all client routines in parallel
    with ThreadPoolExecutor(max_workers=MAX_CLIENTS) as executor:
        future_to_client = {
            executor.submit(client_routine, i, ops): i
            for i, ops in enumerate(operations)
        }
        
        all_successful = True
        for future in as_completed(future_to_client):
            client_id = future_to_client[future]
            try:
                success = future.result()
                if not success:
                    all_successful = False
            except Exception as e:
                log(f"Client {client_id}: Error in mixed operations: {e}", Colors.RED)
                all_successful = False
    
    if all_successful:
        log("Mixed operations test: PASSED", Colors.GREEN)
        return True
    else:
        log("Mixed operations test: FAILED", Colors.RED)
        return False

def test_server_failure():
    """Test system behavior when a server fails"""
    log("\n" + Colors.BOLD + "TEST: SERVER FAILURE RECOVERY" + Colors.RESET)
    
    # Clean any previous files
    clean_download_folder()
    clean_servers()
    
    # First, upload files with all servers running
    test_file = os.path.join(TEST_DIR, "medium.txt")
    filename = os.path.basename(test_file)
    
    log("\nUploading test file with all servers running...", Colors.YELLOW)
    result = run_client_command("put", test_file)
    
    # Check that the file was uploaded successfully
    if "FILE UPLOAD SUCCESSFUL" not in result.stdout:
        log("Initial upload failed, cannot continue server failure test", Colors.RED)
        return False
    
    # Now stop one server
    log("\nSimulating server failure by stopping server 1...", Colors.YELLOW)
    failed_server_id = 0  # First server
    failed_server_process = server_processes[failed_server_id][0]
    failed_server_log = server_processes[failed_server_id][1]
    
    failed_server_process.terminate()
    failed_server_process.wait()
    failed_server_log.close()
    
    # Try to download the file with one server down
    log("\nAttempting to download file with one server down...", Colors.YELLOW)
    result = run_client_command("get", filename)
    
    # Check if download succeeded
    download_success = verify_file_transfer(test_file, filename, "Server Failure")
    
    # Restart the failed server
    log("\nRestarting failed server...", Colors.YELLOW)
    cmd = [SERVER_BINARY, DFS_DIRS[failed_server_id], DFS_PORTS[failed_server_id]]
    log_file = open(f"{RESULTS_DIR}/server{failed_server_id+1}_restarted.log", "w")
    new_process = subprocess.Popen(
        cmd, 
        stdout=log_file, 
        stderr=log_file,
        universal_newlines=True
    )
    
    # Replace the process in the server_processes list
    server_processes[failed_server_id] = (new_process, log_file)
    
    # Give the server time to start
    time.sleep(2)
    
    if download_success:
        log("Server failure recovery test: PASSED", Colors.GREEN)
        log("System successfully recovered file with one server down", Colors.GREEN)
        return True
    else:
        log("Server failure recovery test: FAILED", Colors.RED)
        log("System could not recover file with one server down", Colors.RED)
        return False

def run_all_tests():
    """Run all tests and report results"""
    test_results = {}
    
    try:
        # Basic functionality tests
        test_results["Basic Functionality"] = test_basic_functionality()
        test_results["Multiple Files"] = test_multiple_files()
        test_results["Large File"] = test_large_file()
        
        # Advanced tests
        test_results["Parallel Operations"] = test_parallel_operations()
        test_results["Mixed Operations"] = test_mixed_operations()
        test_results["Server Failure Recovery"] = test_server_failure()
        
        # Generate summary report
        log("\n" + Colors.BOLD + "TEST SUMMARY" + Colors.RESET)
        log("=" * 50)
        
        passed = 0
        for test_name, result in test_results.items():
            status = "PASS" if result else "FAIL"
            color = Colors.GREEN if result else Colors.RED
            log(f"{test_name}: {color}{status}{Colors.RESET}")
            if result:
                passed += 1
        
        log("\n" + "-" * 50)
        log(f"Tests Passed: {passed}/{len(test_results)}")
        log("-" * 50)
        
        if passed == len(test_results):
            log(Colors.GREEN + Colors.BOLD + "\nALL TESTS PASSED! Your DFS implementation is working correctly." + Colors.RESET)
        else:
            log(Colors.YELLOW + Colors.BOLD + f"\n{passed}/{len(test_results)} TESTS PASSED. Some issues were detected in your DFS implementation." + Colors.RESET)
        
    except Exception as e:
        log(f"Error during test execution: {e}", Colors.RED)
        import traceback
        traceback.print_exc()

if __name__ == "__main__":
    try:
        # Setup test environment
        setup()
        
        # Start servers
        # server_processes = start_servers()
        
        # Run tests
        run_all_tests()
        
    finally:
        # Stop servers
        try:
            stop_servers(server_processes)
        except:
            log("Error stopping servers", Colors.RED)