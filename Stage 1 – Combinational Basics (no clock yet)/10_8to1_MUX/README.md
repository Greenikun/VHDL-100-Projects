# 8-to-1 Multiplexer

## Overview
This project implements an **8-to-1 multiplexer** in VHDL.  
A multiplexer (MUX) is a digital switch that selects one of several input signals and forwards it to a single output line.  
The selection is controlled by a binary select input.

This project is part of my **100 VHDL Projects Roadmap**, progressing from basic logic gates to CPUs and SoCs.

## Design Details
- **Entity:** `MUX8to1`
- **Inputs:**
  - `D(7 downto 0)` – 8 data inputs
  - `S(2 downto 0)` – 3-bit select line
- **Output:**
  - `Y` – Selected data output

### Function
- When `S = 000`, `Y = D(0)`
- When `S = 001`, `Y = D(1)`
- …
- When `S = 111`, `Y = D(7)`


## Files
- `MUX8to1.vhd` – VHDL source for the multiplexer
- `MUX8to1_tb.vhd` – Testbench for simulation
- `MUX8to1.mpf` – ModelSim project file (contains simulation setup)
- `.gitignore` – Ignore tool-generated files

## Simulation
This project was tested using **ModelSim**.

### Compile & Simulate
```tcl
vcom MUX8to1.vhd
vcom MUX8to1_tb.vhd
vsim work.MUX8to1_tb
add wave -r *
run 100 ns
```
## Test Results

Simulation was run with `D = "10101010"`.  
The output `Y` correctly matches the selected input bit according to `S`.

| Select (S) | Input Bit Selected | Expected Y | Simulation Result |
|------------|--------------------|------------|-------------------|
| 000        | D(0) = 0           | 0          | ✅ Pass |
| 001        | D(1) = 1           | 1          | ✅ Pass |
| 010        | D(2) = 0           | 0          | ✅ Pass |
| 011        | D(3) = 1           | 1          | ✅ Pass |
| 100        | D(4) = 0           | 0          | ✅ Pass |
| 101        | D(5) = 1           | 1          | ✅ Pass |
| 110        | D(6) = 0           | 0          | ✅ Pass |
| 111        | D(7) = 1           | 1          | ✅ Pass |
