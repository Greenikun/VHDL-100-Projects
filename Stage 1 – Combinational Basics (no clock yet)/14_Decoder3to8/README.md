# Decoder3to8 VHDL Project

## Project Overview
This project implements a **3-to-8 line decoder with enable input** in VHDL. The decoder has:

- **Inputs:**  
  - `A` : 3-bit input  
  - `EN`: Enable input  

- **Outputs:**  
  - `Y` : 8-bit one-hot output, where only one bit is active based on `A` when `EN = 1`. If `EN = 0`, all outputs are `'0'`.  

## Files in this Project
| File | Description |
|------|-------------|
| `Decoder3to8.vhd` | VHDL implementation of the 3-to-8 decoder |
| `Decoder3to8_tb.vhd` | Testbench to verify functionality |
| `Decoder3to8.mpf` | ModelSim project file |
| `vsim.wlf` | ModelSim waveform database file |
| `.gitignore` | Ignore build, backup, and OS junk files |
| `.vscode/` | VS Code settings |

## How to Simulate in ModelSim

1. Open ModelSim.  
2. Navigate to the project folder.  
3. Compile the design and testbench:
   ```tcl
   vcom Decoder3to8.vhd
   vcom Decoder3to8_tb.vhd
   ```
4. Run the simulation:
   ```tcl
   vsim work.Decoder3to8_tb
   add wave *
   run 16ns
   ```
5. Observe the waveforms for `Y(7 downto 0)` to ensure correct decoder behavior:

   ```
   EN |  A  | Y7 | Y6 | Y5 | Y4 | Y3 | Y2 | Y1 | Y0 | Pass/Fail
   ---|-----|----|----|----|----|----|----|----|----|-----------
   0  | 000 | 0  | 0  | 0  | 0  | 0  | 0  | 0  | 0  | Pass ✅
   0  | 001 | 0  | 0  | 0  | 0  | 0  | 0  | 0  | 0  | Pass ✅
   0  | 010 | 0  | 0  | 0  | 0  | 0  | 0  | 0  | 0  | Pass ✅
   0  | 011 | 0  | 0  | 0  | 0  | 0  | 0  | 0  | 0  | Pass ✅
   0  | 100 | 0  | 0  | 0  | 0  | 0  | 0  | 0  | 0  | Pass ✅
   0  | 101 | 0  | 0  | 0  | 0  | 0  | 0  | 0  | 0  | Pass ✅
   0  | 110 | 0  | 0  | 0  | 0  | 0  | 0  | 0  | 0  | Pass ✅
   0  | 111 | 0  | 0  | 0  | 0  | 0  | 0  | 0  | 0  | Pass ✅
   1  | 000 | 0  | 0  | 0  | 0  | 0  | 0  | 0  | 1  | Pass ✅
   1  | 001 | 0  | 0  | 0  | 0  | 0  | 0  | 1  | 0  | Pass ✅
   1  | 010 | 0  | 0  | 0  | 0  | 0  | 1  | 0  | 0  | Pass ✅
   1  | 011 | 0  | 0  | 0  | 0  | 1  | 0  | 0  | 0  | Pass ✅
   1  | 100 | 0  | 0  | 0  | 1  | 0  | 0  | 0  | 0  | Pass ✅
   1  | 101 | 0  | 0  | 1  | 0  | 0  | 0  | 0  | 0  | Pass ✅
   1  | 110 | 0  | 1  | 0  | 0  | 0  | 0  | 0  | 0  | Pass ✅
   1  | 111 | 1  | 0  | 0  | 0  | 0  | 0  | 0  | 0  | Pass ✅
   ```
