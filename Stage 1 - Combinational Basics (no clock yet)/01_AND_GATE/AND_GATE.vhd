library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND_GATE is
    Port (
        A : in  STD_LOGIC;   -- Input A
        B : in  STD_LOGIC;   -- Input B
        Y : out STD_LOGIC    -- Output Y = A AND B
    );
end AND_GATE;

architecture Behavioral of AND_GATE is
begin
    -- Compute AND of inputs A and B
    Y <= A and B;
end Behavioral;