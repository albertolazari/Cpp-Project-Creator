##########################
#     Auto Makefile      #
# Made by Alberto Lazari #
##########################

# To learn how to use this Makefile just type "make help" in the root directory of your project

# vvv Project and compilation parameters vvv #
##############################################

# Directories containing the sources to compile (SRC) and build files (BUILD)
SRC   := .
BUILD := build

# Insert here the directories containing the header files
# (Separate the paths with a space)
INCLUDEPATHS := include

# Insert here the path/to/executable file to build
# (By default it's named after the root dir of the project and
# will be placed in the (BUILD) directory)
EXECUTABLE := $(BUILD)/$(shell basename "$$("pwd")")

# File extensions
SRCEXT := .cpp
OBJEXT := .o
DEPEXT := .d

# Compiler to use (CXX) and its parameters
CXX      := g++
CXXFLAGS := -std=c++11 -Wall -Wextra -I$(INCLUDEPATHS) -g

#######################################
# From now on everything is automated #
#######################################

SRCTEMP      := $(wildcard $(SRC)/**$(SRCEXT))
SOURCES      := $(patsubst $(SRC)/%$(SRCEXT),$(SRC)/%$(SRCEXT), $(SRCTEMP))
OBJECTS      := $(patsubst $(SRC)/%$(SRCEXT),$(BUILD)/%$(OBJEXT), $(SOURCES))
OBJ          := $(patsubst $(BUILD)/%$(OBJEXT),%$(OBJEXT), $(OBJECTS))
DEPENDENCIES := $(patsubst $(SRC)/%$(SRCEXT),$(BUILD)/%$(DEPEXT), $(SOURCES))

# Colors:
red    := [1;91m
green  := [1;92m
blue   := [1;94m
yellow := [1;93m
end    := [0m

# Targets:
build: $(EXECUTABLE)

all: $(OBJECTS)

$(EXECUTABLE): $(OBJECTS)
	@$(CXX) $(CXXFLAGS) $(OBJECTS) -o "$(EXECUTABLE)"
	@echo "========== $(green)$(patsubst $(BUILD)/%,%, $(EXECUTABLE))$(end) compiled successfully =========="

run: build
	@echo "$(green)$(patsubst $(BUILD)/%,%, $(EXECUTABLE))$(end)>"
	@./$(EXECUTABLE)

#linking: $(OBJECTS)
#	@if exist *.o if not $(OBJEXT) == ".o" $(CXX) $(CXXFLAGS) *$(OBJEXT) *.o -o $(EXECUTABLE) else \
		$(CXX) $(CXXFLAGS) *.o -o $(EXECUTABLE) else \
		$(CXX) $(CXXFLAGS) *$(OBJEXT) -o $(EXECUTABLE)

#	@echo "========== $(green)$(patsubst $(BUILD)/%,%, $(EXECUTABLE))$(end) compiled successfully =========="

# Includes dependency files in their relatives object target dependencies
-include $(DEPENDENCIES)

$(OBJECTS): $(BUILD)/%$(OBJEXT): $(SRC)/%$(SRCEXT)
	# Creates needed dirs if non-existent
	@test -d $(BUILD) || mkdir $(BUILD) > /dev/null

	@echo "building $(blue)$(patsubst $(BUILD)/%$(OBJEXT), %$(OBJEXT), $@)$(end)"
	@$(CXX) $(CXXFLAGS) -MMD -MF \
		$(patsubst $(BUILD)/%$(OBJEXT), $(BUILD)/%$(DEPEXT), $@) -c $< -o $@

$(OBJ): %$(OBJEXT): $(BUILD)/%$(OBJEXT)

clean_obj:
	@rm $(OBJECTS) 2> /dev/null || true

clean_dep:
	@rm $(DEPENDENCIES) 2> /dev/null || true

clean:
	@rm $(OBJECTS) 2> /dev/null || true
	@rm $(DEPENDENCIES) 2> /dev/null || true
	@rm "$(EXECUTABLE)" 2> /dev/null || true
	@echo "$(yellow)build$(end) directory cleaned"

help:
	@echo "This $(yellow)Auto Makefile$(end) lets you compile a C++ project automatically, just type make ;)"
	@echo ""
	@echo Actually, you can pass different parameters to make:
	@echo ""
	@echo "$(yellow)help$(end)      shows this message"
	@echo "$(yellow)build$(end)     compiles the project (gets called by default, which means when you only call "make")"
	@echo "$(yellow)all$(end)       compiles all of the project's objects without linking them"
	@echo "$(yellow)linking$(end)   links all of the (OBJEXT)* and .o files that are placed in the (BUILD)* directory,"
	@echo "          which means you can link the objects produced by the project (automatically,"
	@echo "          if not yet compiled) with external objects you need"
	@echo "          *(OBJEXT) and (BUILD) are two variables you can set in the Makefile"
	@echo "$(yellow)run$(end)       compiles and run the project"
	@echo "$(yellow)clean$(end)     deletes each project file (dependencies, objects and the executable) placed in the"
	@echo "          (BUILD) directory."
	@echo "          You can also call clean_obj or clean_dep variants which only delete respectively"
	@echo "          the objects or the dependencies"
