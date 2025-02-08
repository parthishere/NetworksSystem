
all:
	-cd server && $(MAKE)
	-cd client && $(MAKE) 

run:
	-cd server && ./build/server
	-cd client && ./build/client

run_server:
	-cd server && ./build/server

run_client:
	-cd client && ./build/client

clean:
	-cd server && $(MAKE) clean
	-cd client && $(MAKE) clean