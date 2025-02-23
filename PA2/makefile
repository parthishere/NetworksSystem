
all:
	-cd server && $(MAKE)

run:
	-cd server && ./build/server 8000

.PHONY: run_server
run_server:
	-cd server && ./build/server 8000

.PHONY: run_client
run_client:
	
.PHONY: clean
clean:
	-cd server && $(MAKE) clean

.PHONY: test
test:
	-cd server && python3 stress.py

.PHONY: run
run: 
	-cd server && ./$(OUTPUT)/$(TARGET) 8000