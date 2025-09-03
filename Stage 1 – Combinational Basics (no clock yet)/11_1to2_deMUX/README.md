# 1-to-2 Demultiplexer (VHDL Project)

This project implements an **8-bit 1-to-2 demultiplexer** in VHDL.  
The demultiplexer routes an input vector `D` to one of two outputs (`O1`, `O2`) depending on the select line `S`.  


## Project Structure
- `deMUX1to2.vhd` → RTL design (8-bit 1-to-2 demux)  
- `deMUX1to2_tb.vhd` → Testbench with full coverage  
- `.gitignore` → Ignore ModelSim/VSCode temporary files  
- `vsim.wlf` → ModelSim waveform database (auto-generated, ignored in git)  
- `deMUX1to2.mpf` → ModelSim project file (auto-generated, ignored in git)



## Design Description
A **1-to-2 demultiplexer** routes an input vector `D` to one of two outputs (`O1`, `O2`) depending on the select line `S`.  

- **Inputs:**
  - `D` : 8-bit input data
  - `S` : select signal (1 bit)

- **Outputs:**
  - `O1` : output data (active when `S = 0`)
  - `O2` : output data (active when `S = 1`)

**Behavior:**
- If `S = 0` → `O1 = D`, `O2 = 0`  
- If `S = 1` → `O1 = 0`, `O2 = D`  



## Testbench
The testbench (`deMUX1to2_tb.vhd`) verifies the design by:
- Applying **all 256 possible input values** (`D = 0 to 255`)  
- Testing both select states (`S = 0` and `S = 1`)  
- Simulation runtime ≈ **5200 ns**  

This ensures **100% functional coverage**.



## Simulation (ModelSim)

### Compile
```tcl
vlib work
vcom deMUX1to2.vhd
vcom deMUX1to2_tb.vhd
```

### Run Simulation
```tcl
vsim deMUX1to2_tb
run 520 ns
```

### Expected Results
- When `S = 0`: `O1 = D`, `O2 = 00000000`
- When `S = 1`: `O1 = 00000000`, `O2 = D`
