library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XNOR_GATE is
    Port (
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end XNOR_GATE;

architecture Behavioral of XNOR_GATE is
begin
    Y <= A xnor B;
end Behavioral;