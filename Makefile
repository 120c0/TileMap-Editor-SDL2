.PHONY: clean

BIN_DIR = .bin
SRC_DIR = src

TARGET = app.elf
COMPILER = g++

SOURCE_FILES := \
	$(wildcard $(SRC_DIR)/*.cpp) \
	$(wildcard $(SRC_DIR)/*/*.cpp) \
	$(wildcard $(SRC_DIR)/*/*/*.cpp)

OBJECT_FILES := $(patsubst $(SRC_DIR)/%.cpp,$(BIN_DIR)/%.o,$(SOURCE_FILES))

CFLAGS = -Wall -Wextra -pedantic -Iinclude `sdl2-config --cflags`
LDFLAGS = `sdl2-config --libs` -lSDL2_image

RM = rm -f
MKDIR = mkdir -p

$(BIN_DIR)/%.o: $(SRC_DIR)/%.cpp | $(BIN_DIR)
	@$(MKDIR) $(dir $@)
	@$(COMPILER) -c -o $@ $< $(CFLAGS)
	$(info [$(COMPILER)] $< -> $@...)

$(TARGET): $(OBJECT_FILES)
	@$(COMPILER) -o $@ $^ $(LDFLAGS)
	$(info Generate executable...)

$(BIN_DIR):
	@$(MKDIR) $(BIN_DIR)
	$(info Generate bin directory...)

clean:
	@$(RM) $(TARGET) $(OBJECT_FILES)
	@$(RM) -r $(BIN_DIR)/*
	$(info Cleaning...)

