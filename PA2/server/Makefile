CC=gcc
CFLAGS= -g -o2  
LDFLAGS = -lpthread -lrt
INC_SRC = src/
INC_GLOBAL = ../
INC=-Isrc/ -I./ -Iincludes/

OUTPUT = build/
SRCS = $(wildcard *.c) $(wildcard $(INC_SRC)*.c) $(wildcard $(INC_GLOBAL)*.c)
OBJS = $(SRCS:.c=.o)
TARGET = server


all: $(TARGET)

$(TARGET): $(OBJS)
	@echo "Creating folder "$(OUTPUT)
	
	@mkdir -p $(OUTPUT)
	@$(CC) $(CFLAGS) $(INC) $^ -o $(OUTPUT)$@ $(LDFLAGS)
	@rm $(OBJS)
	@echo "Binary saved to output folder"

%.o: %.c
	@$(CC) $(CFLAGS) -I$(INC)  -c $^ -o $@ $(LDFLAGS)


.PHONY: clean
clean:
	-rm -rf $(TARGET) $(OBJS) $(OUTPUT)


.PHONY: test
test:
	python3 stress.py