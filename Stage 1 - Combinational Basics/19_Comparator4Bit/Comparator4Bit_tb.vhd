LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY Comparator4Bit_tb IS
END Comparator4Bit_tb;

ARCHITECTURE Test OF Comparator4Bit_tb IS
    -- Testbench signals for DUT inputs
    SIGNAL A : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL B : STD_LOGIC_VECTOR(3 DOWNTO 0);

    -- Testbench signals for DUT outputs
    SIGNAL A_gt_B : STD_LOGIC;
    SIGNAL A_lt_B : STD_LOGIC;
    SIGNAL A_eq_B : STD_LOGIC;

    -- Helper function to convert std_logic_vector to string for reporting
    FUNCTION to_string(v : STD_LOGIC_VECTOR) RETURN STRING IS
        VARIABLE s : STRING(1 TO v'LENGTH);
    BEGIN
        FOR i IN v'RANGE LOOP
            IF v(i) = '0' THEN
                s(i - v'LOW + 1) := '0';
            ELSE
                s(i - v'LOW + 1) := '1';
            END IF;
        END LOOP;
        RETURN s;
    END FUNCTION;

BEGIN
    -- Instantiate DUT
    DUT : ENTITY work.Comparator4Bit
        PORT MAP(
            A => A,
            B => B,
            A_gt_B => A_gt_B,
            A_lt_B => A_lt_B,
            A_eq_B => A_eq_B
        );

    -- Self-checking stimulus process
    stim_proc : PROCESS
        -- Variables to store expected outputs
        VARIABLE expected_gt, expected_lt, expected_eq : STD_LOGIC;
    BEGIN
        -- Exhaustively test all combinations of 4-bit inputs
        FOR i IN 0 TO 15 LOOP
            FOR j IN 0 TO 15 LOOP
                A <= STD_LOGIC_VECTOR(to_unsigned(i, 4)); -- Apply test input A
                B <= STD_LOGIC_VECTOR(to_unsigned(j, 4)); -- Apply test input B
                WAIT FOR 1 ns;

                -- Compute expected outputs
                IF i > j THEN
                    expected_gt := '1';
                    expected_lt := '0';
                    expected_eq := '0';
                ELSIF i < j THEN
                    expected_gt := '0';
                    expected_lt := '1';
                    expected_eq := '0';
                ELSE
                    expected_gt := '0';
                    expected_lt := '0';
                    expected_eq := '1';
                END IF;

                -- Check DUT outputs and report
                IF (A_gt_B /= expected_gt) OR (A_lt_B /= expected_lt) OR (A_eq_B /= expected_eq) THEN
                    REPORT "FAIL: A=" & to_string(A) & " B=" & to_string(B) & " --> DUT outputs incorrect"
                        SEVERITY ERROR;
                ELSE
                    REPORT "PASS: A=" & to_string(A) & " B=" & to_string(B) & " --> DUT outputs correct";
                END IF;

            END LOOP;
        END LOOP;

        WAIT; -- stop simulation
    END PROCESS stim_proc;

END Test;