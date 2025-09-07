LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Comparator8Bit_tb IS
END Comparator8Bit_tb;
---------------------------------------------
ARCHITECTURE Test OF Comparator8Bit_tb IS

    SIGNAL A, B : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL A_gt_B, A_lt_B, A_eq_B : STD_LOGIC;

BEGIN

    DuT : ENTITY work.Comparator8Bit
        PORT MAP(
            A => A,
            B => B,
            A_gt_B => A_gt_B,
            A_lt_B => A_lt_B,
            A_eq_B => A_eq_B
        );

    stim_proc : PROCESS
        VARIABLE expected_A_gt_B, expected_A_lt_B, expected_A_eq_B : STD_LOGIC;
    BEGIN
        FOR i IN 0 TO 255 LOOP
            A <= STD_LOGIC_VECTOR(to_unsigned(i, 8));
            FOR j IN 0 TO 255 LOOP
                B <= STD_LOGIC_VECTOR(to_unsigned(j, 8));
                WAIT FOR 1 ns;
                IF i > j THEN
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
        WAIT;
    END PROCESS;

END Test;