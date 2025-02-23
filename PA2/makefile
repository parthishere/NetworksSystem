
all: server run

server:
	-cd server && $(MAKE)
	
.PHONY: clean
clean:
	-cd server && $(MAKE) clean

.PHONY: test
test:
	-cd server && python3 stress.py

.PHONY: run
run: 
	-cd server && ./build/server 8000