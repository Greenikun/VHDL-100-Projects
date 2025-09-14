# 4-Bit Subtractor VHDL Project
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Synthesizable](https://img.shields.io/badge/Synthesizable-Yes-brightgreen)
![VHDL](https://img.shields.io/badge/Language-VHDL-blue)
![Hardware](https://img.shields.io/badge/Technology-Hardware-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Coverage](https://img.shields.io/badge/Coverage-100%25-brightgreen)
![Self-Tested](https://img.shields.io/badge/Testbench%20Self%20Checking-Yes-red)

A **VHDL project** implementing a **4-bit combinational subtractor**. The project includes a **self-checking testbench** that verifies all possible input combinations automatically.



## Table of Contents

- [4-Bit Subtractor VHDL Project](#4-bit-subtractor-vhdl-project)
- [Table of Contents](#table-of-contents)
- [Project Description](#project-description)
- [Entity Overview](#entity-overview)
- [Architecture](#architecture)
- [Testbench](#testbench)
- [Simulation](#simulation)
- [Expected Results](#expected-results)
- [Test Results](#test-results)



## Project Description

This project implements a **4-bit subtractor**:

- **Inputs:** `A` (minuend), `B` (subtrahend) — 4-bit vectors  
- **Outputs:** `D` (difference), `Bout` (final borrow)  

The subtractor is implemented using **full subtractor components chained together**:

- Four 1-bit full subtractors connected sequentially.
- Borrow-out from each stage propagates to the next stage.
- Purely combinational, synthesizable, and modular.
- Exhaustive self-checking testbench covering all input combinations.



## Entity Overview

```vhdl
ENTITY Subtractor_4Bit IS
    PORT (
        A    : IN  STD_LOGIC_VECTOR(3 DOWNTO 0); -- Minuend
        B    : IN  STD_LOGIC_VECTOR(3 DOWNTO 0); -- Subtrahend
        D    : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); -- Difference
        Bout : OUT STD_LOGIC                      -- Borrow-out
    );
END Subtractor_4Bit;
```

| Signal | Direction | Description                     |
| ------ | --------- | ------------------------------- |
| A      | IN        | 4-bit input (minuend)           |
| B      | IN        | 4-bit input (subtrahend)        |
| D      | OUT       | 4-bit difference (A - B mod 16) |
| Bout   | OUT       | Borrow-out (1 if A < B)         |

## Architecture

- 4-bit subtractor uses **1-bit full subtractors** connected in series.
- Borrow-out of each stage propagates to the next.
- Difference `D` is calculated as:
  
**Difference:**

$$
\displaystyle D = A - B = A + (\text{2's complement of } B) = A + (\overline{B} + 1)
$$

**Borrow-out:**

$$
Bout_{\text{expected}} = 
\begin{cases} 
1 & \text{if } A < B \\
\\
\\
0 & \text{if } A \ge B
\end{cases}
$$

- Internal borrow chain ensures correct subtraction across all bits.

## Testbench
The **self-checking testbench** verifies all possible input combinations for `A` and `B`:
```vhdl
-- For each i,j combination
expected_D    := STD_LOGIC_VECTOR(to_unsigned((i - j) MOD 16, 4));
expected_Bout := '1' when i < j else '0';
```
- Automatically checks **all 256 combinations of** `A` **and** `B`.
- Reports detailed error messages if the DUT output does not match expected difference or borrow.
- Prints **“All test cases passed successfully!”** if there are no errors.

## Simulation

Using ModelSim, simulation steps:

1. Create and map work library:
```vhdl
vlib work
vmap work work
```

2. Compile design and testbench:
```vhdl
vcom Subtractor_4Bit.vhd
vcom Subtractor_4Bit_tb.vhd
```

3. Load and simulate:
```vhdl
vsim work.Subtractor_4Bit_tb
```

4. Optional: add all signals to waveform:
```vhdl
add wave *
```

5. Run complete simulation:
```vhdl
run -all
```

- Check console or waveform for assertion messages and signal behavior.

## Expected Results

**Difference:**

$$
D = A - B = A + (\text{2's complement of } B) = A + (\overline{B} + 1) \pmod{16}
$$

**Borrow-out:**

$$
Bout_{\text{expected}} = 
\begin{cases} 
1 & \text{if } A < B \\
\\
\\
0 & \text{if } A \ge B
\end{cases}
$$



**Example:** 

$$
A = 1011_2 \ (11), \quad B = 1110_2 \ (14) 
$$

$$
D = (11 - 14) \bmod 16 = 13 \\
$$

$$
Bout_{\text{expected}} = 1
$$




The **testbench** automatically checks **all combinations of A and B** and verifies correctness.

## Test Results

- All 256 test cases passed successfully.
- Self-checking testbench confirms correctness of `D` and `Bout`.
- Design is fully synthesizable and ready for FPGA/ASIC implementation.
