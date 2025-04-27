#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}==========================================${NC}"
echo -e "${BLUE}    DISTRIBUTED FILE SYSTEM TEST SUITE    ${NC}"
echo -e "${BLUE}==========================================${NC}"

# Check if client and server are built
if [ ! -f "./client/dfc" ] || [ ! -f "./server/dfs" ]; then
    echo -e "${YELLOW}Compiling client and server...${NC}"
    
    # Compile client
    echo -e "${BLUE}Compiling client...${NC}"
    cd ./client
    make clean && make
    if [ $? -ne 0 ]; then
        echo -e "${RED}Failed to compile client!${NC}"
        exit 1
    fi
    cd ..
    
    # Compile server
    echo -e "${BLUE}Compiling server...${NC}"
    cd ./server
    make clean && make
    if [ $? -ne 0 ]; then
        echo -e "${RED}Failed to compile server!${NC}"
        exit 1
    fi
    cd ..
    
    echo -e "${GREEN}Compilation successful!${NC}"
fi

# Ensure server directories exist
for dir in "./server/dfs1" "./server/dfs2" "./server/dfs3" "./server/dfs4"; do
    if [ ! -d "$dir" ]; then
        echo -e "${YELLOW}Creating directory $dir...${NC}"
        mkdir -p "$dir"
    fi
done

# Create test directories if they don't exist
for dir in "./test_files" "./test_results" "./client/download"; do
    if [ ! -d "$dir" ]; then
        echo -e "${YELLOW}Creating directory $dir...${NC}"
        mkdir -p "$dir"
    fi
done

# Make sure Python is available
if ! command -v python3 &>/dev/null; then
    echo -e "${RED}Python 3 is required but not found. Please install Python 3.${NC}"
    exit 1
fi

# Make the test script executable
chmod +x ./test_dfs.py

# Check if any previous server processes are running and kill them
echo -e "${YELLOW}Checking for existing server processes...${NC}"
pkill -f "./server/dfs" || true
sleep 1

# Run the test script
echo -e "${BLUE}Starting DFS test suite...${NC}"
python3 ./test_dfs.py

exit_code=$?

# Clean up any lingering processes
echo -e "${YELLOW}Cleaning up processes...${NC}"
pkill -f "./server/dfs" || true

if [ $exit_code -eq 0 ]; then
    echo -e "${GREEN}Test suite completed successfully!${NC}"
else
    echo -e "${RED}Test suite failed with exit code $exit_code!${NC}"
fi

echo -e "${BLUE}==========================================${NC}"
echo -e "${BLUE}    TEST SUITE COMPLETE                   ${NC}"
echo -e "${BLUE}==========================================${NC}"

exit $exit_code