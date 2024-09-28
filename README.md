# SystemVerilog Project Template

This repository provides a SystemVerilog project template for learning and prototyping, using Questa (Mentor Graphics) for compilation and simulation. It allows you to quickly set up a project to learn SystemVerilog or conduct simple experiments.

## Features

- **Easy Compilation and Simulation**: Two simple make commands for compiling and simulating your Verilog/SystemVerilog code.
- **Flexible File Management**: Use `FILELIST` and `SRC_DIR` variables to specify source files.
- **Automatic File Discovery**: Automatically finds all `.sv` and `.v` files in the specified source directory if `FILELIST` is not provided.

## Getting Started

### Prerequisites

- Questa (Mentor Graphics) installed and configured
- GNU Make

### Usage

1. **Clone the repository:**

    ```sh
    git clone https://github.com/Bowen-0x00/systemverilog-project-template.git
    cd systemverilog-project-template
    ```

2. **Compile your project:**

    If you want to compile all `.sv` and `.v` files in the `SRC_DIR`:

    ```sh
    make compile
    ```

    If you want to compile files specified in `filelist.f`:

    ```sh
    FILELIST=filelist.f make compile
    ```

3. **Simulate your project:**

    If you want to simulate all `.sv` and `.v` files in the `SRC_DIR`:

    ```sh
    make sim
    ```

    If you want to simulate files specified in `filelist.f`:

    ```sh
    FILELIST=filelist.f make sim
    ```

### Makefile Variables

- `FILELIST`: Specifies the file list containing the files to compile or simulate. If not set, all `.sv` and `.v` files in `SRC_DIR` will be used.
- `SRC_DIR`: Specifies the directory containing the source files. Default is the current directory (`./`).

### Makefile Targets

- `compile`: Compiles the Verilog/SystemVerilog files.
- `sim`: Simulates the compiled design.
- `clean`: Cleans up the generated files.
- `help`: Displays available make targets and their descriptions.

### Example Filelist

Here is an example `filelist.f`:

