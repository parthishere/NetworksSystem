SRC_DIR = src
INCLUDE_DIR = includes

OUTPUT_DIR = ./build
OBJ_DIR = $(OUTPUT_DIR)/obj $(OUTPUT_DIR)/obj/$(SRC_DIR)
ASM_DIR = $(OUTPUT_DIR)/asm $(OUTPUT_DIR)/asm/$(SRC_DIR)

CC := gcc
CFLAGS := 
LDFLAGS := 
INC := -I$(INCLUDE_DIR) -I./ -I$(SRC_DIR) 

ROOT_SRC = $(wildcard *.c)
SRC_DIR_SRC = $(wildcard $(SRC_DIR)/*.c)
ALL_SRC = $(ROOT_SRC) $(SRC_DIR_SRC)

ROOT_OBJS = $(patsubst %.c, $(OUTPUT_DIR)/obj/%.o, $(ROOT_SRC))
SRC_DIR_OBJS = $(patsubst $(SRC_DIR)/%.c, $(OUTPUT_DIR)/obj/$(SRC_DIR)/%.o, $(SRC_DIR_SRC))
ALL_OBJS = $(ROOT_OBJS) $(SRC_DIR_OBJS)

ROOT_ASMS = $(patsubst %.c, $(OUTPUT_DIR)/asm/%.s, $(ROOT_SRC))
SRC_DIR_ASMS = $(patsubst $(SRC_DIR)/%.c, $(OUTPUT_DIR)/asm/$(SRC_DIR)/%.s, $(SRC_DIR_SRC))
ALL_ASMS = $(ROOT_ASMS) $(SRC_DIR_ASMS)


TARGET = proxy


all: pre-build $(OUTPUT_DIR)/$(TARGET) $(ALL_ASMS)

$(OUTPUT_DIR)/$(TARGET): $(ALL_OBJS)
	@echo "Linking target: $@"
	@$(CC) $(CFLAGS) $(INC) $^ -o $@ $(LDFLAGS)
	@echo ""

$(OUTPUT_DIR)/obj/%.o : %.c
	@echo "Compiling c file: $< -> $@"
	@$(CC) $(CFLAGS) $(INC) -c $< -o $@ $(LDFLAGS)

$(OUTPUT_DIR)/obj/$(SRC_DIR)/%.o : $(SRC_DIR)/%.c
	@echo "Compiling src directory c file: $< -> $@"
	@$(CC) $(CFLAGS) $(INC) -c $< -o $@ $(LDFLAGS)


$(OUTPUT_DIR)/asm/%.s : %.c
	@echo "Assembling asm file: $< -> $@"
	@$(CC) $(CFLAGS) $(INC) -S $< -o $@ $(LDFLAGS)

$(OUTPUT_DIR)/asm/$(SRC_DIR)/%.s : $(SRC_DIR)/%.c
	@echo "Assembling src directory asm file: $< -> $@"
	@$(CC) $(CFLAGS) $(INC) -S $< -o $@ $(LDFLAGS)


pre-build:
	@echo "SRCS "$(ALL_SRC) 
	@echo "OBJS " $(ALL_OBJS)
	@echo "ASMS " $(ALL_ASMS)
	@echo "Creating folders.."
	@mkdir -p $(SRC_DIR) $(INCLUDE_DIR) $(OUTPUT_DIR) $(ASM_DIR) $(OBJ_DIR)

.PHONY: clean
clean:
	- rm -rf $(OSRC) $(TARGET) $(OUTPUT_DIR)