# Gray Code to Binary Converter

![Gray to Binary](https://img.shields.io/badge/Status-Completed-brightgreen)
![Synthesizable](https://img.shields.io/badge/Synthesizable-Yes-brightgreen)
![VHDL](https://img.shields.io/badge/Language-VHDL-blue)
![Hardware](https://img.shields.io/badge/Technology-Hardware-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Coverage](https://img.shields.io/badge/Coverage-100%25-brightgreen)

A **VHDL project** that converts Gray code to Binary code. Part of the **VHDL 100 Projects** series under *Stage 1 – Combinational Basics (no clock yet)*.

Gray code is a binary numeral system where **two successive values differ by only one bit**. Converting Gray code to binary is useful in digital systems such as **encoders, communication circuits, and error correction**.



## Table of Contents
- [Project Description](#project-description)  
- [Entity Overview](#entity-overview)  
- [Architecture](#architecture)  
- [Testbench](#testbench)  
- [Simulation](#simulation)   



## Project Description

The `GrayToBinary` converter is fully **combinational**, meaning no clock is needed.  
It is **parameterizable**—you can choose the number of bits `N` for your application.  

**Features:**  
- Combinational logic  
- Parameterizable bit-width (`N`, default 4)  
- Clean and efficient VHDL implementation  


## Entity Overview

```vhdl
ENTITY GrayToBinary IS
    GENERIC (
        N : INTEGER := 4  -- Number of bits
    );
    PORT (
        G : IN STD_LOGIC_VECTOR (N - 1 DOWNTO 0);  -- Gray code input
        B : OUT STD_LOGIC_VECTOR (N - 1 DOWNTO 0)  -- Binary output
    );
END GrayToBinary;
```

| Signal | Direction | Description     |
| ------ | --------- | --------------- |
| G      | IN        | Gray code input |
| B      | OUT       | Binary output   |


## Architecture

**Conversion Logic:**

1. MSB of binary output equals MSB of Gray input.  
2. Remaining bits are computed iteratively:

```vhdl
-- B[i] = B[i+1] XOR G[i]
B_var(i) := B_var(i + 1) XOR G(i);
```

*B[i] = B[i+1] ⊕ G[i]*  <!-- italic -->

**VHDL Implementation Snippet:**
```vhdl
PROCESS (G)
    VARIABLE B_var : STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
BEGIN
    B_var(N - 1) := G(N - 1);
    FOR i IN N - 2 DOWNTO 0 LOOP
        B_var(i) := B_var(i + 1) XOR G(i);
    END LOOP;
    B <= B_var;
END PROCESS;
```

**Example (4-bit):**
| Gray | Binary |
| ---- | ------ |
| 0000 | 0000   |
| 0001 | 0001   |
| 0011 | 0010   |
| 0010 | 0011   |
| 0110 | 0100   |
| 0111 | 0101   |
| 0101 | 0110   |
| 0100 | 0111   |

## Testbench

The testbench applies **all possible Gray code values** and checks correctness:

- Computes expected binary result internally
- Compares DUT output against the expected result
- Reports mismatches and success messages

**VHDL snippet from the testbench:**

```vhdl
FOR i_var IN 0 TO 2**N - 1 LOOP
    G <= STD_LOGIC_VECTOR(to_unsigned(i_var, N));
    WAIT FOR 1 ns;

    -- Compute expected binary
    B_expected_var(N-1) := G(N-1);
    FOR j IN N-2 DOWNTO 0 LOOP
        B_expected_var(j) := B_expected_var(j+1) XOR G(j);
    END LOOP;

    ASSERT (B = B_expected_var)
        REPORT "Mismatch!" SEVERITY ERROR;
END LOOP;
```

## Simulation

1. Open your VHDL simulator (ModelSim, GHDL, Vivado, etc.)
2. Compile `GrayToBinary.vhd` and `GrayToBinary_tb.vhd`
3. Run the simulation
4. Check console messages or waveform for verification

**Waveform Example (4-bit):**

```text
Time   G       B
0 ns   0000    0000
1 ns   0001    0001
2 ns   0011    0010
3 ns   0010    0011
...

