# Makefile for compiling and simulating Verilog files with QuestaSim

# Variables
SIM = vsim
NAME ?= clock_delay_0
SRC_DIR ?= ./
COMPILE_OPT = -sv
SIM_OPT = -c -do "run -all; quit -f" -voptargs=+acc work.$(NAME)
FILELIST ?= # Optional filelist variable

# Find all Verilog source files in the source directory or use filelist if provided
ifeq ($(strip $(FILELIST)),)
    VERILOG_FILES = $(shell find2 $(SRC_DIR) -type f \( -name "*.sv" -o -name "*.v" \))
else
    VERILOG_FILES = $(shell cat $(FILELIST))
endif

# Default target
all: run

# Compile target
compile:
	@echo "Using Verilog files: $(VERILOG_FILES)"
ifeq ($(strip $(VERILOG_FILES)),)
	@echo "No Verilog files (.sv or .v) found to compile"
else
	vlog $(COMPILE_OPT) $(VERILOG_FILES)
endif

# Simulation target
sim:
	$(SIM) $(SIM_OPT)

# Run target: compile and then simulate
run: compile sim

# Clean target to remove generated files
clean:
	@echo "Cleaning up..."
	@rm -rf work transcript vsim.wlf

# Help target to display available targets
help:
	@echo "Available targets:"
	@echo "  all      - Compile and simulate the Verilog files"
	@echo "  compile  - Compile the Verilog files"
	@echo "  sim      - Simulate the compiled design"
	@echo "  run      - Compile and then simulate the Verilog files"
	@echo "  clean    - Clean up generated files"
	@echo "  help     - Display this help message"

# Declare phony targets to avoid conflicts with files of the same name
.PHONY: all compile sim run clean help
