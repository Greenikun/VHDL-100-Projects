library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XNOR_GATE is
    Port (
        A : in  STD_LOGIC;   -- Input A
        B : in  STD_LOGIC;   -- Input B
        Y : out STD_LOGIC    -- Output Y = A XNOR B
    );
end XNOR_GATE;

architecture Behavioral of XNOR_GATE is
begin
    -- Compute XNOR of inputs A and B
    Y <= A xnor B;
end Behavioral;