LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY MUX2to1 IS
    PORT (
        A : IN STD_LOGIC; -- Input 0
        B : IN STD_LOGIC; -- Input 1
        S : IN STD_LOGIC; -- Select
        Y : OUT STD_LOGIC -- Output
    );
END MUX2to1;

ARCHITECTURE Behavioural OF MUX2to1 IS
BEGIN
    PROCESS (A, B, S)
    BEGIN
        IF S <= '0' THEN
            Y <= A;
        ELSE
            Y <= B;
        END IF;
    END PROCESS;

END Behavioural;