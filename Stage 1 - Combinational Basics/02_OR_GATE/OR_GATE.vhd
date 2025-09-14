LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY OR_GATE IS
    PORT (
        A : IN STD_LOGIC;   -- Input A
        B : IN STD_LOGIC;   -- Input B
        Y : OUT STD_LOGIC   -- Output Y = A OR B
    );
END OR_GATE;

ARCHITECTURE Behavioral OF OR_GATE IS
begin
    -- Compute OR of inputs A and B
    Y <= A or B;
END Behavioral;