# 4-Bit Adder-Subtractor VHDL Project
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Synthesizable](https://img.shields.io/badge/Synthesizable-Yes-brightgreen)
![VHDL](https://img.shields.io/badge/Language-VHDL-blue)
![Hardware](https://img.shields.io/badge/Technology-Hardware-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Coverage](https://img.shields.io/badge/Coverage-100%25-brightgreen)
![Self-Tested](https://img.shields.io/badge/Testbench%20Self%20Checking-Yes-red)

A **VHDL project** implementing a **4-bit combinational adder-subtractor**. The project includes a **self-checking testbench** that verifies all possible input combinations automatically.

## Table of Contents

- [4-Bit Adder-Subtractor VHDL Project](#4-bit-adder-subtractor-vhdl-project)
- [Table of Contents](#table-of-contents)
- [Project Description](#project-description)
- [Entity Overview](#entity-overview)
- [Architecture](#architecture)
- [Testbench](#testbench)
- [Simulation](#simulation)
- [Expected Results](#expected-results)
- [Test Results](#test-results)

## Project Description

This project implements a **4-bit adder-subtractor**:

- **Inputs:** `A`, `B` — 4-bit vectors; `Sub` — control signal (0 = Add, 1 = Subtract)  
- **Outputs:** `S` (sum/difference), `CB_out` (carry/borrow)

The adder-subtractor is implemented using **1-bit full adders chained together**:

- Four 1-bit full adders connected sequentially.
- Carry/borrow out from each stage propagates to the next stage.
- Subtraction is implemented via **two's complement** of `B`.
- Purely combinational, synthesizable, and modular.
- Exhaustive self-checking testbench covering all input combinations.

## Entity Overview

```vhdl
ENTITY Adder_Subtractor_4Bit IS
    PORT (
        A      : IN  STD_LOGIC_VECTOR(3 DOWNTO 0); -- 4-bit input A
        B      : IN  STD_LOGIC_VECTOR(3 DOWNTO 0); -- 4-bit input B
        Sub    : IN  STD_LOGIC;                     -- Control: 0 = Add, 1 = Subtract
        S      : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); -- 4-bit sum/difference output
        CB_out : OUT STD_LOGIC                      -- Carry-out / Borrow-out
    );
END Adder_Subtractor_4Bit;
```

| Signal | Direction | Description                     |
| ------ | --------- | ------------------------------- |
| A      | IN        | 4-bit input A                   |
| B      | IN        | 4-bit input B                   |
| Sub    | IN        | Operation control (0 = Add, 1 = Subtract) |
| S      | OUT       | 4-bit sum or difference         |
| CB_out | OUT       | Carry-out (addition) / Borrow-out (subtraction) |


## Architecture

- 4-bit adder-subtractor uses **1-bit full adders** connected in series.
- **Carry/Borrow** out of each stage propagates to the next.
- **Subtraction** is implemented using two's complement:

**Modified B:**

$$
B_{mod} = B \oplus Sub
$$

**Initial carry-in:**

$$
Cin = Sub
$$

**Sum/Difference:**

$$
S = A + B_{mod} + Sub
$$

**Carry/Borrow-out:**

- **Addition:** `CB_out = 1` if 4-bit sum overflow occurs.  
- **Subtraction:** `CB_out = 1` if no borrow, `0` if borrow occurs (matches MSB inversion).

- The design is **combinational**, fully synthesizable, and modular.
- Each **1-bit full adder** handles one bit and passes its carry/borrow to the next stage.



## Testbench

The **self-checking testbench** verifies all possible input combinations for `A` and `B`:

```vhdl
-- For addition
temp_result := resize(A_u,5) + resize(B_u,5)
expected_CB_out := temp_result(4)
expected_S := temp_result(3 DOWNTO 0)

-- For subtraction
temp_result := resize(A_u,5) - resize(B_u,5)
expected_CB_out := not temp_result(4)  -- borrow flag
expected_S := temp_result(3 DOWNTO 0)
```

- Automatically checks **all 256 combinations of `A` and `B`** for addition and subtraction.
- Reports detailed error messages if the DUT output does not match expected sum/difference or carry/borrow.
- Confirms **“All test cases passed successfully!”** if there are no errors.

## Simulation

Using ModelSim, simulation steps:

1. Create and map work library:
```vhdl
vlib work
vmap work work
```

2. Compile design and testbench:
```vhdl
vcom FullAdder.vhd
vcom Adder_Subtractor_4Bit.vhd
vcom Adder_Subtractor_4Bit_tb.vhd
```

3. Load and simulate:
```vhdl
vsim work.Adder_Subtractor_4Bit_tb
```

4. Optional: add all signals to the waveform:
```vhdl
add wave *
```

5. Run complete simulation:
```vhdl
run -all
```

- Check console or waveform for assertion messages and signal behavior.

## Expected Results

**Addition:**

$$
S = (A + B) \bmod 16
$$

**Carry-out:**

$$
CB\_{out} =
\begin{cases} 
1 & \text{if sum exceeds 15 (overflow)} \\
\\
0 & \text{otherwise}
\end{cases}
$$

**Subtraction:**

$$
S = (A - B) \bmod 16 = A + (\text{2's complement of } B) = A + (\overline{B} + 1)
$$

**Borrow-out:**

$$
CB\_{out} =
\begin{cases} 
0 & \text{if borrow occurs } (A < B) \\
\\
1 & \text{if no borrow } (A \ge B)
\end{cases}
$$

**Example:**

```vhdl
A = 1011_2 (11), B = 1110_2 (14)

-- Addition
S = (11 + 14) mod 16 = 9
CB_out = 1  -- carry occurred

-- Subtraction
S = (11 - 14) mod 16 = 13
CB_out = 0  -- borrow occurred
```


## Test Results

- All 256 test cases passed successfully for both addition and subtraction.
- Self-checking testbench confirms correctness of `S` and `CB_out`.
- Design is fully synthesizable and ready for FPGA/ASIC implementation.
