LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY OR_GATE IS
    PORT (
        A : IN STD_LOGIC;
        B : IN STD_LOGIC;
        Y : OUT STD_LOGIC
    );
END OR_GATE;

ARCHITECTURE Behavioral OF OR_GATE IS
begin
    Y <= A or B;

END Behavioral;