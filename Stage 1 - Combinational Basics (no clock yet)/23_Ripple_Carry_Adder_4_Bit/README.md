# 4-Bit Ripple Carry Adder (RCA) VHDL Project
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Synthesizable](https://img.shields.io/badge/Synthesizable-Yes-brightgreen)
![VHDL](https://img.shields.io/badge/Language-VHDL-blue)
![Hardware](https://img.shields.io/badge/Technology-Hardware-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Coverage](https://img.shields.io/badge/Coverage-100%25-brightgreen)
![Self-Tested](https://img.shields.io/badge/Testbench%20Self%20Checking-Yes-red)

A **VHDL project** implementing a **4-bit Ripple Carry Adder (RCA)**, part of the **VHDL 100 Projects** series under *Stage 1 – Combinational Basics (no clock yet)*.

The RCA takes two **4-bit inputs** (`A` and `B`) and a **carry-in** (`Cin`), producing a **4-bit sum** (`S`) and a **carry-out** (`Cout`). The testbench is **self-checking**, verifying all 512 input combinations automatically.

## Table of Contents

- [4-Bit Ripple Carry Adder (RCA) VHDL Project](#4-bit-ripple-carry-adder-rca-vhdl-project)
  - [Table of Contents](#table-of-contents)
  - [Project Description](#project-description)
  - [Entity Overview](#entity-overview)
  - [Architecture](#architecture)
  - [Testbench](#testbench)
  - [Simulation](#simulation)
  - [Test Results](#test-results)

## Project Description

This project implements a **4-bit combinational adder**:

- Inputs: `A`, `B` (4-bit vectors), `Cin` (single-bit).
- Outputs: `S` (4-bit sum), `Cout` (carry-out).

The adder is composed of **four 1-bit full adders** connected in a ripple-carry configuration.

**Features:**

- Pure combinational logic, no clock required.
- Synthesizable and modular design.
- Exhaustive self-checking testbench for all input combinations.

## Entity Overview

```vhdl
ENTITY RCA4Bit IS
    PORT (
        A    : IN  STD_LOGIC_VECTOR (3 DOWNTO 0); -- 4-bit input A
        B    : IN  STD_LOGIC_VECTOR (3 DOWNTO 0); -- 4-bit input B
        Cin  : IN  STD_LOGIC;                     -- Carry-in
        S    : OUT STD_LOGIC_VECTOR (3 DOWNTO 0); -- 4-bit sum output
        Cout : OUT STD_LOGIC                      -- Carry-out
    );
END RCA4Bit;
```

| Signal | Direction | Description                      |
| ------ | --------- | -------------------------------- |
| A      | IN        | 4-bit input A                    |
| B      | IN        | 4-bit input B                    |
| Cin    | IN        | Carry-in                         |
| S      | OUT       | 4-bit sum = A + B + Cin (mod 16) |
| Cout   | OUT       | Carry-out (1 if sum ≥ 16)        |


## Architecture

```vhdl
ARCHITECTURE Behaviour OF RCA4Bit IS
    SIGNAL C : STD_LOGIC_VECTOR(4 DOWNTO 0); -- Internal carry signals
BEGIN
    C(0) <= Cin;
    FA0 : ENTITY work.myFullAdder PORT MAP(A(0), B(0), C(0), S(0), C(1));
    FA1 : ENTITY work.myFullAdder PORT MAP(A(1), B(1), C(1), S(1), C(2));
    FA2 : ENTITY work.myFullAdder PORT MAP(A(2), B(2), C(2), S(2), C(3));
    FA3 : ENTITY work.myFullAdder PORT MAP(A(3), B(3), C(3), S(3), C(4));
END Behaviour;
```
- Composed of four **1-bit full adders** in a ripple-carry chain.
- Internal signals `C(1)` to `C(4)` propagate carries from LSB to MSB.

## Testbench

The **self-checking testbench** verifies all combinations of `A`, `B`, and `Cin` automatically:
```vhdl
    stim_proc : PROCESS
        VARIABLE expected_S : INTEGER;       -- Expected 4-bit sum
        VARIABLE expected_Cout : STD_LOGIC;  -- Expected carry-out
    BEGIN
        -- Loop over Cin = 0 and Cin = 1
        FOR c IN 0 TO 1 LOOP
            Cin <= '0' WHEN c = 0 ELSE '1';

            -- Loop over all 4-bit A and B combinations
            FOR i IN 0 TO 15 LOOP
                A <= STD_LOGIC_VECTOR(to_unsigned(i, 4));
                FOR j IN 0 TO 15 LOOP
                    B <= STD_LOGIC_VECTOR(to_unsigned(j, 4));
                    WAIT FOR 1 ns;

                    -- Self-check: compute expected sum and carry
                    expected_S := (i + j + (0 WHEN Cin = '0' ELSE 1)) MOD 16;
                    expected_Cout := '1' WHEN (i + j + (0 WHEN Cin = '0' ELSE 1)) > 15 ELSE '0';

                    -- Compare DUT output with expected values
                    ASSERT (S = STD_LOGIC_VECTOR(to_unsigned(expected_S, 4))) AND (Cout = expected_Cout)
                    REPORT "Test failed: A=" & INTEGER'image(i) &
                           " B=" & INTEGER'image(j) &
                           " Cin=" & STD_LOGIC'image(Cin)
                    SEVERITY error;
                END LOOP;
            END LOOP;
        END LOOP;

        REPORT "All tests passed!" SEVERITY note;  -- All combinations passed
        WAIT;
    END PROCESS;
```
- **Self-checking** ensures any mismatch between the expected and DUT outputs triggers an assertion.

## Simulation
Using **ModelSim**, the steps were:

1. Create work library and map:
   ```
    vlib work
    vmap work work
   ```
2. Compile design and testbench:
   ```
    vcom myFullAdder.vhd
    vcom RCA4Bit.vhd
    vcom RCA4Bit_tb.vhd
   ```
3. Load and simulate:
   ```
    vsim work.RCA4Bit_tb
   ```
4. Optional: add all signals to waveform:
   ```
    add wave *
   ```
5. Run simulation completely:
   ```
    run -all
   ```
- Check the console or waveform window for assertion messages and signal behavior.

## Test Results
The 4-bit RCA was tested for all **512 input combinations**:

`S` = least significant 4 bits of `A + B + Cin` (`mod 16`)

`Cout` = `1` when the sum exceeds 15

All test cases passed with **no assertion failures**, confirming correctness of the design.