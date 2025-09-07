LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Comparator8Bit_tb IS
END Comparator8Bit_tb;
---------------------------------------------
ARCHITECTURE Test OF Comparator8Bit_tb IS

    SIGNAL A, B : STD_LOGIC_VECTOR(7 DOWNTO 0);   -- Testbench signals for inputs
    SIGNAL A_gt_B, A_lt_B, A_eq_B : STD_LOGIC;    -- Testbench signals for DUT outputs

BEGIN

    DuT : ENTITY work.Comparator8Bit                 -- Instantiate the DUT
        PORT MAP(
            A => A,
            B => B,
            A_gt_B => A_gt_B,
            A_lt_B => A_lt_B,
            A_eq_B => A_eq_B
        );

    stim_proc : PROCESS                              -- Stimulus process to apply all input combinations
        VARIABLE expected_A_gt_B, expected_A_lt_B, expected_A_eq_B : STD_LOGIC;  -- Expected outputs for self-check
    BEGIN
        FOR i IN 0 TO 255 LOOP                      -- Sweep A from 0 to 255
            A <= STD_LOGIC_VECTOR(to_unsigned(i, 8));
            FOR j IN 0 TO 255 LOOP                  -- Sweep B from 0 to 255
                B <= STD_LOGIC_VECTOR(to_unsigned(j, 8));
                WAIT FOR 1 ns;                      -- Small delay to allow DUT outputs to settle
                IF i > j THEN                        -- Compute expected outputs
                    expected_A_gt_B := '1';
                    expected_A_lt_B := '0';
                    expected_A_eq_B := '0';
                ELSIF i < j THEN
                    expected_A_gt_B := '0';
                    expected_A_lt_B := '1';
                    expected_A_eq_B := '0';
                ELSIF i = j THEN
                    expected_A_gt_B := '0';
                    expected_A_lt_B := '0';
                    expected_A_eq_B := '1';
                END IF;

                -- Self-check using assertions; print message if DUT output mismatches expected value
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
        WAIT;                                       -- Wait indefinitely at the end of the test
    END PROCESS;

END Test;