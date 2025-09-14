# 8-to-3 Priority Encoder VHDL Project

![Gray to Binary](https://img.shields.io/badge/Status-Completed-brightgreen)
![Synthesizable](https://img.shields.io/badge/Synthesizable-Yes-brightgreen)
![VHDL](https://img.shields.io/badge/Language-VHDL-blue)
![Hardware](https://img.shields.io/badge/Technology-Hardware-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Coverage](https://img.shields.io/badge/Coverage-100%25-brightgreen)
![Self-Tested](https://img.shields.io/badge/Testbench%20Self%20Checking-No-red)

## Project Overview
This project implements an **8-to-3 priority encoder** in VHDL.  
The encoder takes an 8-bit input vector `A` and outputs the binary code of the **highest-priority input** as a 3-bit vector `Y`.  
An optional valid signal `V` indicates if any input is high.

This project is **synthesizable** and suitable for **Synopsys tools**, and simulation is done using **ModelSim**.



## Files
- `PriorityEncoder8to3.vhd` – VHDL source code for the encoder  
- `PriorityEncoder8to3_tb.vhd` – Testbench file for simulation  



## Input/Output Table

### Single-High Inputs

| A7 | A6 | A5 | A4 | A3 | A2 | A1 | A0 | V | Y   |
|----|----|----|----|----|----|----|----|---|-----|
| 0  | 0  | 0  | 0  | 0  | 0  | 0  | 0  | 0 | 000 |
| 0  | 0  | 0  | 0  | 0  | 0  | 0  | 1  | 1 | 000 |
| 0  | 0  | 0  | 0  | 0  | 0  | 1  | 0  | 1 | 001 |
| 0  | 0  | 0  | 0  | 0  | 1  | 0  | 0  | 1 | 010 |
| 0  | 0  | 0  | 0  | 1  | 0  | 0  | 0  | 1 | 011 |
| 0  | 0  | 0  | 1  | 0  | 0  | 0  | 0  | 1 | 100 |
| 0  | 0  | 1  | 0  | 0  | 0  | 0  | 0  | 1 | 101 |
| 0  | 1  | 0  | 0  | 0  | 0  | 0  | 0  | 1 | 110 |
| 1  | 0  | 0  | 0  | 0  | 0  | 0  | 0  | 1 | 111 |

### Multiple-High Inputs (Priority Encoded)

| A7 | A6 | A5 | A4 | A3 | A2 | A1 | A0 | V | Y   |
|----|----|----|----|----|----|----|----|---|-----|
| 1  | 0  | 1  | 0  | 1  | 0  | 0  | 1  | 1 | 111 |
| 0  | 1  | 1  | 0  | 1  | 0  | 0  | 1  | 1 | 110 |
| 0  | 0  | 1  | 1  | 1  | 0  | 0  | 1  | 1 | 101 |
| 0  | 0  | 0  | 0  | 1  | 1  | 1  | 1  | 1 | 011 |



## Simulation Instructions

1. Open ModelSim and compile the design:

   ```tcl
   vcom PriorityEncoder8to3.vhd
   vcom PriorityEncoder8to3_tb.vhd
   ```
2. Run the simulation:
   ```tcl
   vsim work.PriorityEncoder8to3_tb
   add wave *
   run 200 ns
   ```
4. Observe the waveforms of Y and V to verify proper encoding.
