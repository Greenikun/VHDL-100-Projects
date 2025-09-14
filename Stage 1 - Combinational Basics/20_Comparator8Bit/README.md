# 8-Bit VHDL Comparator
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Synthesizable](https://img.shields.io/badge/Synthesizable-Yes-brightgreen)
![VHDL](https://img.shields.io/badge/Language-VHDL-blue)
![Hardware](https://img.shields.io/badge/Technology-Hardware-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Coverage](https://img.shields.io/badge/Coverage-100%25-brightgreen)
![Self-Tested](https://img.shields.io/badge/Testbench%20Self%20Checking-Yes-red)

A **VHDL project** implementing a **digital 8-bit comparator**, part of the **VHDL 100 Projects** series under *Stage 1 – Combinational Basics (no clock yet)*.  

The comparator compares two **8-bit binary numbers** and outputs signals indicating whether one is **greater than**, **less than**, or
**equal to** the other. The testbench is self-checking, automatically verifying all possible input combinations (65536 cases) and reporting any mismatches.


## Table of Contents
- [Project Description](#project-description)  
- [Entity Overview](#entity-overview)  
- [Architecture](#architecture)  
- [Testbench](#testbench)  
- [Simulation](#simulation)  
- [Test Result](#test-result)  

---

## Project Description

This comparator is fully **combinational**, meaning no clock is needed.  
It compares **8-bit numbers** and outputs three flags:

  - `A_gt_B` → HIGH if A > B  
  - `A_lt_B` → HIGH if A < B  
  - `A_eq_B` → HIGH if A = B  

**Features:**  
  - Pure combinational logic.  
  - Synthesizable and efficient VHDL code.  
  - Exhaustive self-checking testbench for all 65,536 input combinations.  



## Entity Overview

```vhdl
ENTITY Comparator8Bit IS
    PORT (
        A      : IN  STD_LOGIC_VECTOR(7 DOWNTO 0); -- First input
        B      : IN  STD_LOGIC_VECTOR(7 DOWNTO 0); -- Second input
        A_gt_B : OUT STD_LOGIC;                     -- HIGH if A > B
        A_lt_B : OUT STD_LOGIC;                     -- HIGH if A < B
        A_eq_B : OUT STD_LOGIC                      -- HIGH if A = B
    );
END Comparator8Bit;
```
| Signal   | Direction | Description         |
| -------- | --------- | ------------------- |
| A        | IN        | First binary input  |
| B        | IN        | Second binary input |
| A\_gt\_B | OUT       | HIGH if A > B       |
| A\_lt\_B | OUT       | HIGH if A < B       |
| A\_eq\_B | OUT       | HIGH if A = B       |

## Architecture
Comparison Logic:

  - Converts `STD_LOGIC_VECTOR` inputs to integers.
  - Compares values to set the outputs `A_gt_B`, `A_lt_B`, and `A_eq_B`.

```vhdl
PROCESS (A, B)
    VARIABLE A_int, B_int : INTEGER;
BEGIN
    A_int := to_integer(unsigned(A));
    B_int := to_integer(unsigned(B));

    IF (A_int > B_int) THEN
        A_gt_B <= '1';
        A_lt_B <= '0';
        A_eq_B <= '0';
    ELSIF (A_int < B_int) THEN
        A_gt_B <= '0';
        A_lt_B <= '1';
        A_eq_B <= '0';
    ELSE
        A_gt_B <= '0';
        A_lt_B <= '0';
        A_eq_B <= '1';
    END IF;
END PROCESS;
```

## Testbench

The **testbench** verifies all possible combinations of 8-bit inputs:
  - Iterates `A` and `B` from 0 to 255.
  - Computes expected outputs internally.
  - Compares DUT outputs to expected results using `ASSERT`.
  - Reports mismatches automatically.

```vhdl
FOR i IN 0 TO 255 LOOP
    A <= STD_LOGIC_VECTOR(to_unsigned(i, 8));
    FOR j IN 0 TO 255 LOOP
        B <= STD_LOGIC_VECTOR(to_unsigned(j, 8));
        WAIT FOR 1 ns;

        -- Expected outputs
        IF i > j THEN
            expected_A_gt_B := '1';
            expected_A_lt_B := '0';
            expected_A_eq_B := '0';
        ELSIF i < j THEN
            expected_A_gt_B := '0';
            expected_A_lt_B := '1';
            expected_A_eq_B := '0';
        ELSE
            expected_A_gt_B := '0';
            expected_A_lt_B := '0';
            expected_A_eq_B := '1';
        END IF;

        -- Self-check
        ASSERT expected_A_gt_B = A_gt_B
            REPORT "Mismatch at A=" & integer'image(i) & ", B=" & integer'image(j) & " : A_gt_B incorrect"
            SEVERITY ERROR;
        ASSERT expected_A_lt_B = A_lt_B
            REPORT "Mismatch at A=" & integer'image(i) & ", B=" & integer'image(j) & " : A_lt_B incorrect"
            SEVERITY ERROR;
        ASSERT expected_A_eq_B = A_eq_B
            REPORT "Mismatch at A=" & integer'image(i) & ", B=" & integer'image(j) & " : A_eq_B incorrect"
            SEVERITY ERROR;
    END LOOP;
END LOOP;
```

## Simulation

  - Open your VHDL simulator (ModelSim, GHDL, Vivado, etc.).
  - Compile `Comparator8Bit.vhd` and `Comparator8Bit_tb.vhd`.
  - Run the simulation with `run -all` (ModelSim) or equivalent.
  - Check console output for assertion failures or the waveform window for visual inspection.

## Test Result

The comparator was fully tested in **ModelSim**. All possible input combinations for 8-bit numbers were applied.

**Example outputs (partial 8-bit inputs):**
| A        | B        | A\_gt\_B | A\_lt\_B | A\_eq\_B |
| -------- | -------- | -------- | -------- | -------- |
| 00000000 | 00000001 | 0        | 1        | 0        |
| 00000010 | 00000001 | 1        | 0        | 0        |
| 01101100 | 01101100 | 0        | 0        | 1        |
| 11111110 | 01111111 | 1        | 0        | 0        |

**Observations:**
  - `A_eq_B` is `HIGH` only when both inputs are equal.
  - `A_gt_B` and `A_lt_B` signals correctly indicate which input is greater.
  - All 65,536 test vectors passed successfully with no assertion failures.
This confirms that the **combinational 8-bit comparator works correctly for all possible inputs**.

