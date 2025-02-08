CC=gcc
CFLAGS= -g -o2  
LFLAGS = -lpthread s
INC=src/

OUTPUT = build/
SRCS = $(wildcard *.c) $(wildcard $(INC)*.c)
OBJS = $(SRCS:.c=.o)
TARGET = client

all: $(TARGET)

$(OUPUT)$(TARGET): $(OBJS)
	@echo "Creating folder "$(OUTPUT)
	
	@mkdir -p $(OUTPUT)
	@$(CC) $(CFLAGS) -I$(INC) $(LDFLAGS) $^ -o $(OUTPUT)$@
	@rm $(OBJS)
	@echo "Binary saved to output folder"

%.o: %.c
	@$(CC) $(CFLAGS) -I$(INC) $(LDFLAGS) -c $^ -o $@


.PHONY: clean
clean:
	-rm -rf $(TARGET) $(OBJS) $(OUTPUT)