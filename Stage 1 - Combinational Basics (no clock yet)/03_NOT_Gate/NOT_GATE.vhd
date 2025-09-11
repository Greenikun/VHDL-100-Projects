LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY NOT_GATE IS
    PORT (
        A : IN STD_LOGIC;   -- Input A
        Y : OUT STD_LOGIC   -- Output Y = NOT A
    );
END NOT_GATE;

ARCHITECTURE behavioural OF NOT_GATE IS
BEGIN
    -- Compute inversion of input A
    Y <= NOT A;
END behavioural;