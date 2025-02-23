SERVER_DIR = server
BUILD_DIR = $(SERVER_DIR)/build
SERVER_BIN = $(BUILD_DIR)/server


all: $(SERVER_BIN) run

$(SERVER_BIN): 
	@echo "Building server in $(SERVER_DIR)..."
	cd $(SERVER_DIR) && $(MAKE)
	@test -f $(SERVER_BIN) || (echo "Server binary not found!"; exit 1)

# Clean build files
.PHONY: clean
clean:
	@echo "Cleaning..."
	cd $(SERVER_DIR) && $(MAKE) clean

# Run tests
.PHONY: test
test:
	cd $(SERVER_DIR) && python3 stress.py

# Run server
.PHONY: run
run: server
	cd $(SERVER_DIR) && $(SERVER_BIN) 8000; \
	