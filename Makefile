CC := gcc
SRCS = $(wildcard *.c)
OBJS = $(SRCS:.c=.o)
TARGETS = $(SRCS:.c=)

CFLAGS = 
LDFLAGS = 
INC = 

all: $(TARGETS) 


.PHONY: run
run: $(TARGETS)
	- ./$< $(ARGS)

%: %c
	@echo "target"
	$(CC) $(CFLAGS) $(LDFLAGS) $(INC) $< -o $@

# $(OBJS):%.o: %.c
# 	$(CC) $(CFLAGS) $(LDFLAGS) $(INC) -c $^ -o $@



.PHONY: clean
clean:
	-@ rm -rf $(OBJS) $(TARGETS);


