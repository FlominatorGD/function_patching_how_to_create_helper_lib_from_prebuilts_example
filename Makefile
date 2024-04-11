# Compiler settings
CXX = g++
CXXFLAGS = -Wall -fPIC

# Directories
SRC_DIR = source
BUILD_DIR = build
BIN_DIR = $(BUILD_DIR)/bin
LIB_DIR = $(BUILD_DIR)/lib
INCLUDE_DIR = include

# Target libraries and executables
TARGET_LIBA  = $(LIB_DIR)/libab-impl.so
TARGET_LIBB  = $(LIB_DIR)/libb-impl.so
TARGET_EXEC = $(BIN_DIR)/app

# Source files
SOURCES_LIBA = $(SRC_DIR)/libab.cpp
SOURCES_LIBB = $(SRC_DIR)/libb.cpp
SOURCES_EXEC = $(SRC_DIR)/main.cpp

# Default target
all: build_dirs copy_sources $(TARGET_LIBA) $(TARGET_LIBB) $(TARGET_EXEC)

# Create build directories
build_dirs:
	mkdir -p $(BIN_DIR) $(LIB_DIR) $(BUILD_DIR)/$(INCLUDE_DIR)

# Copy sources to build directory
copy_sources:
	cp $(SRC_DIR)/*.cpp $(BUILD_DIR)
	cp $(SRC_DIR)/$(INCLUDE_DIR)/*.h $(BUILD_DIR)/$(INCLUDE_DIR)

# Object files
OBJECTS_LIBA = $(patsubst $(SRC_DIR)/%,$(BUILD_DIR)/%,$(SOURCES_LIBA:.cpp=.o))
OBJECTS_LIBB = $(patsubst $(SRC_DIR)/%,$(BUILD_DIR)/%,$(SOURCES_LIBB:.cpp=.o))
OBJECTS_EXEC = $(patsubst $(SRC_DIR)/%,$(BUILD_DIR)/%,$(SOURCES_EXEC:.cpp=.o))

# Rule to make the library liba
$(TARGET_LIBA): $(OBJECTS_LIBA)
	$(CXX) $(CXXFLAGS) -shared $^ -o $@

# Rule to make the library libb
$(TARGET_LIBB): $(OBJECTS_LIBB)
	$(CXX) $(CXXFLAGS) -shared $^ -o $@

# Rule to make the executable
$(TARGET_EXEC): $(OBJECTS_EXEC) $(TARGET_LIBA)
	$(CXX) $(CXXFLAGS) -L$(LIB_DIR) -Wl,-rpath=$(LIB_DIR) -l:libab-impl.so $^ -o $@

# Generic rule for building objects from their source files in the build directory
$(BUILD_DIR)/%.o: $(BUILD_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -I$(BUILD_DIR)/$(INCLUDE_DIR) -c $< -o $@

# Clean
clean:
	rm -rf $(BUILD_DIR)/*

.PHONY: all build_dirs copy_sources clean
