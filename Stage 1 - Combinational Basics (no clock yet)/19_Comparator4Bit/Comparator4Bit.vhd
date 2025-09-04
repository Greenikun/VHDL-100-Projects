LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY Comparator4Bit IS
    PORT (
        A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);

        A_gt_B : OUT STD_LOGIC;
        A_lt_B : OUT STD_LOGIC;
        A_eq_B : OUT STD_LOGIC

    );
END Comparator4Bit;
----------------------------------------------------
ARCHITECTURE Behaviour OF Comparator4Bit IS
BEGIN
    PROCESS (A, B)
        VARIABLE A_int, B_int : INTEGER;

    BEGIN
        A_int := to_integer(unsigned(A));
        B_int := to_integer(unsigned(B));

        IF A_int > B_int THEN
            A_gt_B <= '1';
            A_lt_B <= '0';
            A_eq_B <= '0';
        ELSIF A_int < B_int THEN
            A_gt_B <= '0';
            A_lt_B <= '1';
            A_eq_B <= '0';
        ELSE 
            A_gt_B <= '0';
            A_lt_B <= '0';
            A_eq_B <= '1';
        END IF;
    END PROCESS;
END Behaviour;