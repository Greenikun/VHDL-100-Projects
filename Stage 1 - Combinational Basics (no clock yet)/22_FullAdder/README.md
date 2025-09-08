# Full Adder VHDL Project
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Synthesizable](https://img.shields.io/badge/Synthesizable-Yes-brightgreen)
![VHDL](https://img.shields.io/badge/Language-VHDL-blue)
![Hardware](https://img.shields.io/badge/Technology-Hardware-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Coverage](https://img.shields.io/badge/Coverage-100%25-brightgreen)
![Self-Tested](https://img.shields.io/badge/Testbench%20Self%20Checking-Yes-red)

A **VHDL project** implementing a **Full Adder**, part of the **VHDL 100 Projects** series under *Stage 1 – Combinational Basics (no clock yet)*.

The full adder takes three **single-bit inputs** and produces a **Sum** and **Carry-out** output. The testbench is self-checking, verifying all 8 possible input combinations automatically.

## Table of Contents
- [Full Adder VHDL Project](#full-adder-vhdl-project)
  - [Table of Contents](#table-of-contents)
  - [Project Description](#project-description)
  - [Entity Overview](#entity-overview)
  - [Architecture](#architecture)
  - [Testbench](#testbench)
  - [Simulation](#simulation)
- [1. Create work library and map](#1-create-work-library-and-map)
- [2. Compile the design and testbench](#2-compile-the-design-and-testbench)
- [3. Load the testbench](#3-load-the-testbench)
- [4. Add all signals to waveform viewer (optional)](#4-add-all-signals-to-waveform-viewer-optional)
- [5. Run the simulation completely](#5-run-the-simulation-completely)
  - [Test Result](#test-result)

## Project Description

This project implements a **combinational circuit**:

- Inputs: `A`, `B`, and `Cin` (single-bit)
- Outputs: `Sum` and `Cout`

Truth table:

| A   | B   | Cin | Sum | Cout |
| --- | --- | --- | --- | ---- |
| 0   | 0   | 0   | 0   | 0    |
| 0   | 0   | 1   | 1   | 0    |
| 0   | 1   | 0   | 1   | 0    |
| 0   | 1   | 1   | 0   | 1    |
| 1   | 0   | 0   | 1   | 0    |
| 1   | 0   | 1   | 0   | 1    |
| 1   | 1   | 0   | 0   | 1    |
| 1   | 1   | 1   | 1   | 1    |

**Features:**

- Pure combinational logic, no clock required  
- Synthesizable and simple VHDL code  
- Exhaustive self-checking testbench for all input combinations  

## Entity Overview

```vhdl
ENTITY FullAdder IS
    PORT (
        A   : IN  STD_LOGIC;  -- First input
        B   : IN  STD_LOGIC;  -- Second input
        Cin : IN  STD_LOGIC;  -- Carry-in input
        Sum : OUT STD_LOGIC;  -- Sum output
        Cout: OUT STD_LOGIC   -- Carry-out output
    );
END FullAdder;
```

| Signal | Direction | Description                                  |
| ------ | --------- | -------------------------------------------- |
| A      | IN        | First input                                  |
| B      | IN        | Second input                                 |
| Cin    | IN        | Carry-in input                               |
| Sum    | OUT       | Sum = A XOR B XOR Cin                        |
| Cout   | OUT       | Carry-out = (A AND B) OR (Cin AND (A XOR B)) |

## Architecture

```vhdl
ARCHITECTURE Behaviour OF FullAdder IS
BEGIN
    Sum  <= A XOR B XOR Cin;
    Cout <= (A AND B) OR (Cin AND (A XOR B));
END Behaviour;
```

- Uses **concurrent combinational logic**.
- Outputs update immediately when any input changes.

## Testbench

The **testbench** verifies all input combinations (`0` and `1` for `A`, `B`, `Cin`):
```vhdl
stim_proc : PROCESS
    VARIABLE vec            : STD_LOGIC_VECTOR(2 DOWNTO 0);
    VARIABLE expected_Sum   : STD_LOGIC;
    VARIABLE expected_Cout  : STD_LOGIC;
BEGIN
    FOR i IN 0 TO 7 LOOP
        vec := STD_LOGIC_VECTOR(to_unsigned(i, 3));
        A   <= vec(2);
        B   <= vec(1);
        Cin <= vec(0);

        WAIT FOR 1 ns;

        expected_Sum  := vec(2) XOR vec(1) XOR vec(0);
        expected_Cout := (vec(2) AND vec(1)) OR (vec(0) AND (vec(2) XOR vec(1)));

        ASSERT Sum = expected_Sum
            REPORT "Error in Sum at iteration " & INTEGER'image(i)
            SEVERITY ERROR;

        ASSERT Cout = expected_Cout
            REPORT "Error in Cout at iteration " & INTEGER'image(i)
            SEVERITY ERROR;

        REPORT "Test " & INTEGER'image(i) & " passed!" SEVERITY NOTE;
    END LOOP;

    WAIT; -- End simulation
END PROCESS;
```
- Self-checking ensures correctness automatically.
- Any mismatch triggers a clear `ASSERT` report.

## Simulation

Using **ModelSim**, the commands used were:

# 1. Create work library and map
```
vlib work
vmap work work
```

# 2. Compile the design and testbench
```
vcom FullAdder.vhd
vcom FullAdder_tb.vhd
```

# 3. Load the testbench
```
vsim work.FullAdder_tb
```

# 4. Add all signals to waveform viewer (optional)
```
add wave *
```

# 5. Run the simulation completely
```
run -all
```
- Check the console or waveform window for assertion messages and signal behavior.

## Test Result
The full adder was tested for all 8 input combinations:

| A | B | Cin | Sum | Cout |
| - | - | --- | --- | ---- |
| 0 | 0 | 0   | 0   | 0    |
| 0 | 0 | 1   | 1   | 0    |
| 0 | 1 | 0   | 1   | 0    |
| 0 | 1 | 1   | 0   | 1    |
| 1 | 0 | 0   | 1   | 0    |
| 1 | 0 | 1   | 0   | 1    |
| 1 | 1 | 0   | 0   | 1    |
| 1 | 1 | 1   | 1   | 1    |

**Observations:**

- Sum `Sum` is HIGH when an odd number of inputs are HIGH.

- Carry-out `Cout` is HIGH when two or more inputs are HIGH.

- All test cases passed with no assertion failures.

This confirms that the Full Adder works correctly and is fully self-verified.
