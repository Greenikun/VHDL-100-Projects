LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY NOR_GATE IS
    PORT (
        A : IN STD_LOGIC;   -- Input A
        B : IN STD_LOGIC;   -- Input B
        Y : OUT STD_LOGIC   -- Output Y = A NOR B
    );
END NOR_GATE;

ARCHITECTURE Behavioural OF NOR_GATE IS
BEGIN
    -- Compute NOR of inputs A and B
    y <= A NOR b;
END Behavioural;