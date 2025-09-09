LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY myFullAdder IS
    PORT (
        A : IN STD_LOGIC;
        B : IN STD_LOGIC;
        Cin : IN STD_LOGIC;
        S : OUT STD_LOGIC;
        Cout : OUT STD_LOGIC
    );

END myFullAdder;
--
--
-------------------------------
--
--
ARCHITECTURE Behaviour OF myFullAdder IS
BEGIN
    S <= A XOR B XOR C;
    Cout <= (A AND B) OR (Cin AND (A XOR B));
END Behaviour;