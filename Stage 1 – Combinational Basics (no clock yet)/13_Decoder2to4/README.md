# Decoder2to4 VHDL Project

![Gray to Binary](https://img.shields.io/badge/Status-Completed-brightgreen)
![Synthesizable](https://img.shields.io/badge/Synthesizable-Yes-brightgreen)
![VHDL](https://img.shields.io/badge/Language-VHDL-blue)
![Hardware](https://img.shields.io/badge/Technology-Hardware-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Coverage](https://img.shields.io/badge/Coverage-100%25-brightgreen)
![Self-Tested](https://img.shields.io/badge/Testbench%20Self%20Checking-No-red)

## Project Overview
This project implements a **2-to-4 line decoder with enable input** in VHDL. The decoder has:

- **Inputs:**  
  - `A` : 2-bit input  
  - `EN`: Enable input  

- **Outputs:**  
  - `Y` : 4-bit one-hot output, where only one bit is active based on `A` when `EN = 1`. If `EN = 0`, all outputs are `'0'`.  




## Files in this Project
| File | Description |
|------|-------------|
| `Decoder2to4.vhd` | VHDL implementation of the 2-to-4 decoder |
| `Decoder2to4_tb.vhd` | Testbench to verify functionality |



## How to Simulate in ModelSim

1. Open ModelSim.  
2. Navigate to the project folder.  
3. Compile the design and testbench:
   ```tcl
   vcom Decoder2to4.vhd
   vcom Decoder2to4_tb.vhd
   ```
4. Run the simulation:
   ```tcl
   vsim work.Decoder2to4_tb
   add wave *
   run 10ns
   ```
5. Observe the waveforms for `Y(3 downto 0)` to ensure correct decoder behavior:

  | EN | A  | Y3 | Y2 | Y1 | Y0 | Pass/Fail |
  |----|----|----|----|----|----|-----------|
  | 0  | 00 | 0  | 0  | 0  | 0  | Pass ✅   |
  | 0  | 01 | 0  | 0  | 0  | 0  | Pass ✅   |
  | 0  | 10 | 0  | 0  | 0  | 0  | Pass ✅   |
  | 0  | 11 | 0  | 0  | 0  | 0  | Pass ✅   |
  | 1  | 00 | 0  | 0  | 0  | 1  | Pass ✅   |
  | 1  | 01 | 0  | 0  | 1  | 0  | Pass ✅   |
  | 1  | 10 | 0  | 1  | 0  | 0  | Pass ✅   |
  | 1  | 11 | 1  | 0  | 0  | 0  | Pass ✅   |
