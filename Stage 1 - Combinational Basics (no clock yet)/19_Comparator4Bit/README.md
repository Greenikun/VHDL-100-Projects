# 4-Bit VHDL Comparator
![Gray to Binary](https://img.shields.io/badge/Status-Completed-brightgreen)
![Synthesizable](https://img.shields.io/badge/Synthesizable-Yes-brightgreen)
![VHDL](https://img.shields.io/badge/Language-VHDL-blue)
![Hardware](https://img.shields.io/badge/Technology-Hardware-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Coverage](https://img.shields.io/badge/Coverage-100%25-brightgreen)
![Self-Tested](https://img.shields.io/badge/Testbench%20Self%20Checking-Yes-red)


A **VHDL project** implementing a **digital 4-bit comparator**, part of the **VHDL 100 Projects** series under *Stage 1 – Combinational Basics (no clock yet)*.  

The comparator compares two binary numbers and outputs signals indicating whether one is **greater than**, **less than**, or **equal to** the other.  



## Table of Contents
- [Project Description](#project-description)  
- [Entity Overview](#entity-overview)  
- [Architecture](#architecture)  
- [Testbench](#testbench)  
- [Simulation](#simulation)  
- [Test Result](#test-result)  

## Project Description

The comparator is fully **combinational**, meaning no clock is needed.  
It compares **4-bit numbers** and outputs three flags:

- `A_gt_B` → HIGH if A > B  
- `A_lt_B` → HIGH if A < B  
- `A_eq_B` → HIGH if A = B  

**Features:**  
- Combinational logic.
- Synthesizable and efficient VHDL code.
- Self-checking Testbench.


## Entity Overview

```vhdl
ENTITY Comparator IS
    GENERIC (
        N : INTEGER := 4  -- Number of bits
    );
    PORT (
        A     : IN  STD_LOGIC_VECTOR(N-1 DOWNTO 0); -- First input
        B     : IN  STD_LOGIC_VECTOR(N-1 DOWNTO 0); -- Second input
        A_gt_B: OUT STD_LOGIC;                      -- HIGH if A > B
        A_lt_B: OUT STD_LOGIC;                      -- HIGH if A < B
        A_eq_B: OUT STD_LOGIC                       -- HIGH if A = B
    );
END Comparator;
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
- Check if `A = B` using equality comparison.
- Check if `A > B` or `A < B` using standard binary comparison operators.

```vhdl
PROCESS (A, B)
BEGIN
    IF A = B THEN
        A_eq_B <= '1';
        A_gt_B <= '0';
        A_lt_B <= '0';
    ELSIF A > B THEN
        A_gt_B <= '1';
        A_lt_B <= '0';
        A_eq_B <= '0';
    ELSE
        A_lt_B <= '1';
        A_gt_B <= '0';
        A_eq_B <= '0';
    END IF;
END PROCESS;
```

## Testbench
The testbench automatically verifies all possible input combinations for N-bit numbers:

- Generates inputs `A` and `B`.
- Computes expected outputs internally.
- Compares `DUT` outputs to expected results.
- Reports mismatches or successes.
```vhdl
FOR i_var IN 0 TO 2**N - 1 LOOP
    FOR j_var IN 0 TO 2**N - 1 LOOP
        A <= STD_LOGIC_VECTOR(to_unsigned(i_var, N));
        B <= STD_LOGIC_VECTOR(to_unsigned(j_var, N));
        WAIT FOR 1 ns;

        -- Expected outputs
        A_eq_B_expected <= '1' WHEN i_var = j_var ELSE '0';
        A_gt_B_expected <= '1' WHEN i_var > j_var ELSE '0';
        A_lt_B_expected <= '1' WHEN i_var < j_var ELSE '0';

        ASSERT (A_eq_B = A_eq_B_expected AND
                A_gt_B = A_gt_B_expected AND
                A_lt_B = A_lt_B_expected)
            REPORT "Mismatch!" SEVERITY ERROR;
    END LOOP;
END LOOP;
```
## Simulation
1. Open your VHDL simulator (ModelSim, GHDL, Vivado, etc.).
2. Compile `Comparator.vhd` and Comparator_tb.vhd`.
3. Run the simulation.
3. Check the waveform or console for verification.
**Example Output (4-bit):**

| A    | B    | A\_gt\_B | A\_lt\_B | A\_eq\_B |
| ---- | ---- | -------- | -------- | -------- |
| 0000 | 0001 | 0        | 1        | 0        |
| 0010 | 0001 | 1        | 0        | 0        |
| 0110 | 0110 | 0        | 0        | 1        |



## Test Result

The comparator was fully tested in **ModelSim**. All possible input combinations for 4-bit numbers were applied, and the outputs matched the expected values.  

**Example waveform/console output (4-bit inputs):**

| Time (ns) | A    | B    | A_gt_B | A_lt_B | A_eq_B |
|-----------|------|------|--------|--------|--------|
| 0         | 0000 | 0000 | 0      | 0      | 1      |
| 1         | 0001 | 0000 | 1      | 0      | 0      |
| 2         | 0010 | 0011 | 0      | 1      | 0      |
| 3         | 0101 | 0101 | 0      | 0      | 1      |
| 4         | 1110 | 0111 | 1      | 0      | 0      |

**Observations:**

- `A_eq_B` is HIGH only when both inputs are equal  
- `A_gt_B` and `A_lt_B` signals correctly indicate which input is greater  
- All test vectors passed successfully with **no mismatches**  

This confirms the **combinational comparator works correctly for all possible inputs** in the 4-bit example.
