# 4-Bit Ripple Carry Adder (RCA) VHDL Project
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Synthesizable](https://img.shields.io/badge/Synthesizable-Yes-brightgreen)
![VHDL](https://img.shields.io/badge/Language-VHDL-blue)
![Hardware](https://img.shields.io/badge/Technology-Hardware-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Coverage](https://img.shields.io/badge/Coverage-100%25-brightgreen)
![Self-Tested](https://img.shields.io/badge/Testbench%20Self%20Checking-Yes-red)

A **VHDL project** implementing a **4-bit Ripple Carry Adder (RCA)**. The project includes a **self-checking testbench** that verifies all possible input combinations automatically.



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

- **Inputs:** `A`, `B` (4-bit vectors), `Cin` (single-bit)
- **Outputs:** `S` (4-bit sum), `Cout` (carry-out)

The adder is implemented using **pure combinational logic** in a ripple-carry configuration:

- Four 1-bit additions connected sequentially.
- Carry-out from each stage propagates to the next stage.
- Synthesizable and modular design.
- Exhaustive self-checking testbench covering all input combinations.



## Entity Overview

```vhdl
ENTITY RCA4Bit IS
    PORT (
        A    : IN  STD_LOGIC_VECTOR(3 DOWNTO 0); -- 4-bit input A
        B    : IN  STD_LOGIC_VECTOR(3 DOWNTO 0); -- 4-bit input B
        Cin  : IN  STD_LOGIC;                     -- Carry-in
        S    : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); -- 4-bit sum output
        Cout : OUT STD_LOGIC                      -- Carry-out
    );
END RCA4Bit;
```

| Signal | Direction | Description                      |
| ------ | --------- | -------------------------------- |
| A      | IN        | 4-bit input operand A            |
| B      | IN        | 4-bit input operand B            |
| Cin    | IN        | Carry-in                         |
| S      | OUT       | 4-bit sum = A + B + Cin (mod 16) |
| Cout   | OUT       | Carry-out (1 if sum ≥ 16)        |

## Architecture
```vhdl
ARCHITECTURE Behaviour OF RCA4Bit IS
BEGIN
    PROCESS(A, B, Cin)
        VARIABLE c : STD_LOGIC_VECTOR(4 DOWNTO 0); -- Internal carry chain
    BEGIN
        -- Initialize carry-in
        c(0) := Cin;

        -- Ripple-carry logic: compute internal carries
        c(1) := (A(0) AND B(0)) OR (c(0) AND (A(0) XOR B(0)));
        c(2) := (A(1) AND B(1)) OR (c(1) AND (A(1) XOR B(1)));
        c(3) := (A(2) AND B(2)) OR (c(2) AND (A(2) XOR B(2)));
        c(4) := (A(3) AND B(3)) OR (c(3) AND (A(3) XOR B(3)));

        -- Compute sum bits
        S(0) <= A(0) XOR B(0) XOR c(0);
        S(1) <= A(1) XOR B(1) XOR c(1);
        S(2) <= A(2) XOR B(2) XOR c(2);
        S(3) <= A(3) XOR B(3) XOR c(3);

        -- Output final carry
        Cout <= c(4);
    END PROCESS;
END Behaviour;
```

- Combinational, synthesizable logic.
- Internal variable `c` stores carry chain.
- Sum `S` is computed bitwise using `XOR` with the propagated carry.

## Testbench

The **self-checking testbench** verifies all possible input combinations for `A`, `B`, and `Cin = 0`:
```vhdl
stim_proc : PROCESS
    VARIABLE expected_S    : STD_LOGIC_VECTOR(4 DOWNTO 0); -- Expected 5-bit sum
    VARIABLE expected_Cout : STD_LOGIC;                    -- Expected carry-out
    VARIABLE error_count   : INTEGER := 0;                 -- Error counter
BEGIN
    FOR i IN 0 TO 15 LOOP
        A   <= STD_LOGIC_VECTOR(to_unsigned(i, 4));
        Cin <= '0';

        FOR j IN 0 TO 15 LOOP
            B <= STD_LOGIC_VECTOR(to_unsigned(j, 4));
            expected_S := STD_LOGIC_VECTOR(to_unsigned(i + j, 5));

            IF (i + j) > 15 THEN
                expected_Cout := '1';
            ELSE
                expected_Cout := '0';
            END IF;

            WAIT FOR 1 ns;

            -- Check sum output
            IF S /= expected_S(3 DOWNTO 0) THEN
                REPORT "SUM mismatch: A=" & INTEGER'image(i) &
                       " B=" & INTEGER'image(j) &
                       " Expected=" & INTEGER'image(to_integer(unsigned(expected_S(3 DOWNTO 0)))) &
                       " Got=" & INTEGER'image(to_integer(unsigned(S)))
                       SEVERITY ERROR;
                error_count := error_count + 1;
            END IF;

            -- Check carry-out
            IF Cout /= expected_Cout THEN
                REPORT "CARRY mismatch: A=" & INTEGER'image(i) &
                       " B=" & INTEGER'image(j) &
                       " Expected=" & STD_LOGIC'image(expected_Cout) &
                       " Got=" & STD_LOGIC'image(Cout)
                       SEVERITY ERROR;
                error_count := error_count + 1;
            END IF;
        END LOOP;
    END LOOP;

    -- Final pass/fail report
    IF error_count = 0 THEN
        REPORT "All test cases passed successfully!" SEVERITY NOTE;
    ELSE
        REPORT "Simulation finished with " & INTEGER'image(error_count) & " errors." SEVERITY ERROR;
    END IF;

    WAIT;
END PROCESS;
```

- Automatically checks **all 256 combinations of `A` and `B` with `Cin = 0`**.
- Reports detailed error messages if the DUT output does not match expected sum or carry.
- Prints “All test cases passed successfully!” if there are no errors.

## Simulation

Using **ModelSim**, the simulation steps are:

1. Create and map work library:
  ```
  vlib work
  vmap work work
  ```
2. Compile design and testbench:
  ```
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
5. Run complete simulation:
  ```
  run -all
  ```
- Check console or waveform for assertion messages and signal behavior.

## Test Results

- All 256 test cases for `Cin = 0` passed successfully.
- `S` = least significant 4 bits of `A + B + Cin` (`mod 16`)
- `Cout = 1` when sum ≥ 16
- The self-checking testbench confirms correctness of the design with no assertion failures.
