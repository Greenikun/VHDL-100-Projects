LIBRARY IEEE;
USE IEEE.STD_Logic_1164.ALL;

ENTITY NAND_GATE IS
    PORT (
        A : IN STD_LOGIC;   -- Input A
        B : IN STD_LOGIC;   -- Input B
        Y : OUT STD_LOGIC   -- Output Y = A NAND B
    );
END NAND_GATE;

ARCHITECTURE behavioural OF NAND_GATE IS
BEGIN
    -- Compute NAND of inputs A and B
    Y <= A NAND B;
END behavioural;