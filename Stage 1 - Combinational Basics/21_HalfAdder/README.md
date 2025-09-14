# Half Adder VHDL Project
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Synthesizable](https://img.shields.io/badge/Synthesizable-Yes-brightgreen)
![VHDL](https://img.shields.io/badge/Language-VHDL-blue)
![Hardware](https://img.shields.io/badge/Technology-Hardware-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Coverage](https://img.shields.io/badge/Coverage-100%25-brightgreen)
![Self-Tested](https://img.shields.io/badge/Testbench%20Self%20Checking-Yes-red)

A **VHDL project** implementing a **Half Adder**, part of the **VHDL 100 Projects** series under *Stage 1 – Combinational Basics (no clock yet)*.

The half adder takes two **single-bit inputs** and produces a **Sum** and **Carry** output. The testbench is self-checking, verifying all 4 possible input combinations automatically.



## Table of Contents
  - [Project Description](#project-description)
  - [Entity Overview](#entity-overview)
  - [Architecture](#architecture)
  - [Testbench](#testbench)
  - [Simulation](#simulation)
  - [Test Result](#test-result)



## Project Description

This project implements a simple **combinational circuit**:

  - Inputs: `A` and `B` (single-bit)
  - Outputs: `S` (Sum) and `C` (Carry)

Truth table:

| A | B | Sum (S) | Carry (C) |
|---|---|----------|------------|
| 0 | 0 | 0        | 0          |
| 0 | 1 | 1        | 0          |
| 1 | 0 | 1        | 0          |
| 1 | 1 | 0        | 1          |

**Features:**  
  - Pure combinational logic, no clock required  
  - Synthesizable and simple VHDL code  
  - Exhaustive self-checking testbench for all input combinations  



## Entity Overview

```vhdl
ENTITY HalfAdder IS
    PORT (
        SIGNAL A : IN  STD_LOGIC;  -- First input
        SIGNAL B : IN  STD_LOGIC;  -- Second input
        SIGNAL S : OUT STD_LOGIC;  -- Sum output (A XOR B)
        SIGNAL C : OUT STD_LOGIC   -- Carry output (A AND B)
    );
END HalfAdder;
```
| Signal | Direction | Description     |
| ------ | --------- | --------------- |
| A      | IN        | First input     |
| B      | IN        | Second input    |
| S      | OUT       | Sum = A XOR B   |
| C      | OUT       | Carry = A AND B |

## Architecture
```vhdl
PROCESS (A, B)  -- Triggers whenever A or B changes
BEGIN
    S <= A XOR B;  -- Compute sum
    C <= A AND B;  -- Compute carry
END PROCESS;
```
  - This uses **concurrent combinational logic** inside a process.
  - Outputs update immediately when any input changes.

## Testbench
The **testbench** verifies all input combinations (0 and 1 for both inputs):

```vhdl
stim_proc : PROCESS
    VARIABLE expected_S, expected_C : STD_LOGIC; -- For self-checking
BEGIN
    -- Test 0 + 0
    A <= '0'; B <= '0';
    expected_S := '0'; expected_C := '0';
    WAIT FOR 1 ns;
    ASSERT (expected_S = S AND expected_C = C)
        REPORT "Half Adder failed for A=0 B=0" SEVERITY ERROR;

    -- Test 0 + 1
    A <= '0'; B <= '1';
    expected_S := '1'; expected_C := '0';
    WAIT FOR 1 ns;
    ASSERT (expected_S = S AND expected_C = C)
        REPORT "Half Adder failed for A=0 B=1" SEVERITY ERROR;

    -- Test 1 + 0
    A <= '1'; B <= '0';
    expected_S := '1'; expected_C := '0';
    WAIT FOR 1 ns;
    ASSERT (expected_S = S AND expected_C = C)
        REPORT "Half Adder failed for A=1 B=0" SEVERITY ERROR;

    -- Test 1 + 1
    A <= '1'; B <= '1';
    expected_S := '0'; expected_C := '1';
    WAIT FOR 1 ns;
    ASSERT (expected_S = S AND expected_C = C)
        REPORT "Half Adder failed for A=1 B=1" SEVERITY ERROR;

    WAIT; -- End simulation
END PROCESS;
```

  - Self-checking ensures correctness automatically.
  - Any mismatch triggers a clear `ASSERT` report.

## Simulation

  - Open your VHDL simulator (ModelSim, Vivado, GHDL, etc.)
  - Compile `HalfAdder.vhd` and `HalfAdder_tb.vhd`
  - Run the simulation (`run -all` in ModelSim or equivalent)
  - Inspect the waveform or console output for errors

## Test Result

The half adder was tested for all 4 input combinations:
| A | B | S | C |
| - | - | - | - |
| 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 0 | 1 |

**Observations:**

  - Sum `S` is HIGH when exactly one input is HIGH
  - Carry `C` is HIGH only when both inputs are HIGH
  - All test cases passed with no assertion failures

This confirms that the Half Adder works correctly.
