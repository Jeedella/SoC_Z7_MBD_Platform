# Output file
TARGET = uart

# Aplication directories src for .c files, inc for .h files
SRC_DIR = src
INC_DIR = inc

# Setting compiler flags
ARCH = arm-linux-gnueabihf
CC = $(ARCH)-gcc
CFLAGS = -I$(INC_DIR)
LDLIBS = -Wall
SIZE = $(ARCH)-size

# Build #
###################################################################################################

# Listing all to be compiled *.c files
SRC = $(wildcard $(SRC_DIR)/*.c)

# Setting buid directory paths
BUILD_DIR = build
OBJ_DIR = $(BUILD_DIR)/obj
   
# Listing object files from source files
OBJ = $(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)
     
# This is the default target if the user just calls 'make'
all: build size
     
# Build all the files
build: builddirs $(BUILD_DIR)/$(TARGET)
     
# Create the required directories (if not already existing)
builddirs:
	@mkdir -p $(BUILD_DIR)
	@mkdir -p $(OBJ_DIR)
     
# Link everything together
$(BUILD_DIR)/$(TARGET): $(OBJ)
	@echo Linking $@
	$(CC) $(OBJ) $(LDLIBS) -o $(BUILD_DIR)/$(TARGET).app
     
# Compile c files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(dir $@)
	@echo Compiling $^
	@$(CC) $(CFLAGS) -c $^ -o $@
     
# Print size information
size: $(BUILD_DIR)/$(TARGET)
	@echo
	$(SIZE) $(BUILD_DIR)/$(TARGET).app
	@echo ELF made
     
# Clean up
clean:
	@rm -rf $(BUILD_DIR) $(OBJ) $(TARGET) $(TARGET).* *.a *.o *~
	@echo Done
     
# Clean must be a phony target so make knows this never exists as a file
.PHONY: clean
