# Binary to Gray Code Converter (VHDL)

![Gray to Binary](https://img.shields.io/badge/Status-Completed-brightgreen)
![Synthesizable](https://img.shields.io/badge/Synthesizable-Yes-brightgreen)
![VHDL](https://img.shields.io/badge/Language-VHDL-blue)
![Hardware](https://img.shields.io/badge/Technology-Hardware-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Coverage](https://img.shields.io/badge/Coverage-100%25-brightgreen)
![Self-Tested](https://img.shields.io/badge/Testbench%20Self%20Checking-No-red)

A **parameterizable Binary to Gray Code converter** written in VHDL.  
This project is synthesizable and suitable for **Synopsys tools**, and simulation is done using **ModelSim**.



## Features

- Generic input width `N` (default: 4 bits)  
- Converts N-bit binary input to N-bit Gray code output  
- Synthesizable architecture suitable for FPGA/ASIC design  
- Fully tested with a ModelSim testbench  



## File Structure

- `BinaryToGray.vhd` → Main entity and architecture for the converter  
- `BinaryToGray_tb.vhd` → Testbench that exercises all possible input combinations  



## Usage

1. Compile the design and testbench in ModelSim:

```tcl
vcom BinaryToGray.vhd
vcom BinaryToGray_tb.vhd
vsim work.BinaryToGray_tb
add wave *
run 20 ns
```

2. Observe the output G for each input B in the waveform viewer or in the console output.

| Binary Input (B) | Gray Output (G) |
|-----------------|----------------|
| 0000            | 0000           |
| 0001            | 0001           |
| 0010            | 0011           |
| 0011            | 0010           |
| 0100            | 0110           |
| 0101            | 0111           |
| 0110            | 0101           |
| 0111            | 0100           |
| 1000            | 1100           |
| 1001            | 1101           |
| 1010            | 1111           |
| 1011            | 1110           |
| 1100            | 1010           |
| 1101            | 1011           |
| 1110            | 1001           |
| 1111            | 1000           |
