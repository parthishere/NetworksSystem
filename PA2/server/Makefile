CC=gcc
CFLAGS= -g -o2  
LFLAGS = -lpthread 
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
	@$(CC) $(CFLAGS) $(INC) $(LDFLAGS) $^ -o $(OUTPUT)$@
	@rm $(OBJS)
	@echo "Binary saved to output folder"

%.o: %.c
	@$(CC) $(CFLAGS) -I$(INC) $(LDFLAGS) -c $^ -o $@


.PHONY: clean
clean:
	-rm -rf $(TARGET) $(OBJS) $(OUTPUT)