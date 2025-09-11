LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY MUX2to1 IS
    PORT (
        A : IN STD_LOGIC;  -- Input 0
        B : IN STD_LOGIC;  -- Input 1
        S : IN STD_LOGIC;  -- Select signal
        Y : OUT STD_LOGIC  -- Output, selected input
    );
END MUX2to1;

ARCHITECTURE Behavioural OF MUX2to1 IS
BEGIN
    -- Process to implement 2-to-1 multiplexer
    PROCESS (A, B, S)
    BEGIN
        IF S <= '0' THEN
            Y <= A;  -- When select is 0, output A
        ELSE
            Y <= B;  -- When select is 1, output B
        END IF;
    END PROCESS;

END Behavioural;