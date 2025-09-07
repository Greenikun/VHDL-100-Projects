LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Comparator8Bit IS
    PORT (
        A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);  -- 8-bit input A
        B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);  -- 8-bit input B

        A_gt_B : OUT STD_LOGIC;               -- Output: A > B
        A_lt_B : OUT STD_LOGIC;               -- Output: A < B
        A_eq_B : OUT STD_LOGIC                -- Output: A = B
    );
END Comparator8Bit;


-----------------------------------------------------------


ARCHITECTURE Behaviour OF Comparator8Bit IS
BEGIN
    PROCESS (A, B)                            -- Combinational process sensitive to A and B
        VARIABLE A_int, B_int : INTEGER;     -- Convert vectors to integers for comparison
    BEGIN
        A_int := to_integer(unsigned(A));    -- Convert A to integer
        B_int := to_integer(unsigned(B));    -- Convert B to integer

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
    END PROCESS;                             -- End of combinational comparison

END Behaviour;