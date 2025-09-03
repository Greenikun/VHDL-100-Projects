# NOT_GATE VHDL Project
## Table of Contents
- [Overview](#overview)
- [Main Files](#main-files)
- [Requirements](#requirements)
- [How to Compile and Simulate](#how-to-compile-and-simulate)
- [License](#license)

## Overview
VHDL implementation and testbench for a basic NOT gate. Includes source code and testbench files for simulation and synthesis practice using ModelSim and VS Code.

## Main Files
- `NOT_GATE.vhd`: VHDL code implementing the NOT gate entity and architecture.
- `NOT_GATE_tb.vhd`: Testbench to simulate the NOT gate inputs and observe output behavior.


## Requirements
- ModelSim (Intel FPGA Edition recommended) for simulation.
- VS Code (or any text editor) for editing and compiling VHDL code.
- VHDL compiler tools (e.g., `vcom`) properly installed and added to system PATH.

## How to Compile and Simulate
**1- Compile VHDL Files:** In the ModelSim GUI, you can compile manually, go to `Compile` -> `Compile..` -> and then select the required file and its testbench.
Or using Modelsim command line:
```pgsql 
vlib work
vmap work ./work
vcom NOT_GATE.vhd
vcom NOT_GATE_tb.vhd
```

**2- Simulate Testbench:**
```pgsql 
vsim work.NOT_GATE_tb
add wave *
run 20 ns
```
**3- View waveforms:**
Use the ModelSim waveform viewer to inspect signal transitions and verify NOT gate functionality.
The `vsim.wlf` file is generated during simulation and contains all waveform data from your testbench. Open it in ModelSim to review or analyze signals.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
