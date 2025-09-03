# 2-to-1 Multiplexer (VHDL)

![Gray to Binary](https://img.shields.io/badge/Status-Completed-brightgreen)
![Synthesizable](https://img.shields.io/badge/Synthesizable-Yes-brightgreen)
![VHDL](https://img.shields.io/badge/Language-VHDL-blue)
![Hardware](https://img.shields.io/badge/Technology-Hardware-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Coverage](https://img.shields.io/badge/Coverage-100%25-brightgreen)
![Self-Tested](https://img.shields.io/badge/Testbench%20Self%20Checking-No-red)

## Project Overview
This project implements a **2-to-1 Multiplexer (MUX)** in **VHDL**.  
A multiplexer is a digital switch that selects one of two inputs (`A` or `B`) based on a select line (`S`) and forwards it to the output (`Y`).

**Truth Table:**

| S (Select) | A | B | Y (Output) |
|------------|---|---|-------------|
| 0          | A | B | A           |
| 1          | A | B | B           |


## Files in this Repository
- **`_2to1_MUX.vhd`** → VHDL source code (Design Under Test - DUT)  
- **`_2to1_MUX_tb.vhd`** → VHDL testbench for simulation  




## Simulation Instructions (ModelSim)
1. Open ModelSim.  
2. Create or open the project and add the VHDL files.  
3. From the Transcript, run:

   ```tcl
   vlib work
   vmap work work
   vcom "_2to1_MUX.vhd"
   vcom "_2to1_MUX_tb.vhd"
   vsim work.MUX2to1_tb
   add wave *
   run 16 ns



## Expected Output Table

| Test Case | A | B | S | Y (Expected) |
|-----------|---|---|---|--------------|
| 1         | 0 | 0 | 0 | 0            |
| 2         | 0 | 1 | 0 | 0            |
| 3         | 1 | 0 | 0 | 1            |
| 4         | 1 | 1 | 0 | 1            |
| 5         | 0 | 0 | 1 | 0            |
| 6         | 0 | 1 | 1 | 1            |
| 7         | 1 | 0 | 1 | 0            |
| 8         | 1 | 1 | 1 | 1            |
##


   ## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
