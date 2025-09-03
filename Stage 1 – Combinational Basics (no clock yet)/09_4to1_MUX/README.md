# 4-to-1 Multiplexer (VHDL)

![Gray to Binary](https://img.shields.io/badge/Status-Completed-brightgreen)
![Synthesizable](https://img.shields.io/badge/Synthesizable-Yes-brightgreen)
![VHDL](https://img.shields.io/badge/Language-VHDL-blue)
![Hardware](https://img.shields.io/badge/Technology-Hardware-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Coverage](https://img.shields.io/badge/Coverage-100%25-brightgreen)
![Self-Tested](https://img.shields.io/badge/Testbench%20Self%20Checking-No-red)

This project implements and tests a **4-to-1 multiplexer** in VHDL.  
The design is verified using a self-checking **testbench** with exhaustive simulation.


## Project Structure

- **`_4to1_MUX.vhd`** – VHDL source code for the 4-to-1 multiplexer.  
- **`_4to1_MUX_tb.vhd`** – Testbench for verifying the multiplexer.  


## Design Description

### Multiplexer (MUX4to1)
- **Inputs**:  
  - `A`, `B`, `C`, `D` (1 bit each)  
  - `S` (2-bit select)  
- **Output**:  
  - `Y`  

**Logic:**  
- When `S = 00`, `Y = A`  
- When `S = 01`, `Y = B`  
- When `S = 10`, `Y = C`  
- When `S = 11`, `Y = D`  

### Testbench
- Applies all possible input combinations (16 total) for each select value.  
- Ensures that `Y` always matches the expected input line.  
- Provides both **manual check** and **exhaustive simulation**.

---

## How to Run in ModelSim (Terminal)

1. Open a terminal in the project folder:
    ```bash
    cd "Your Directory .."

2. Compile the design and testbench:
    ```bash
    vcom _4to1_MUX.vhd
    vcom _4to1_MUX_tb.vhd

3. Simulate:
    ```bash
    vsim work.MUX4to1_tb
   
4. To view waveforms:
    ```bash
    add wave *
   
5. Run the simulation (100 ns, for example):
    ```bash
    run 100 ns
   
