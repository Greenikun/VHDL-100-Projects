library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XOR_GATE is
    Port (
        A : in  STD_LOGIC;   -- Input A
        B : in  STD_LOGIC;   -- Input B
        Y : out STD_LOGIC    -- Output Y = A XOR B
    );
end XOR_GATE;

architecture Behavioral of XOR_GATE is
begin
    -- Compute XOR of inputs A and B
    Y <= A xor B;
end Behavioral;