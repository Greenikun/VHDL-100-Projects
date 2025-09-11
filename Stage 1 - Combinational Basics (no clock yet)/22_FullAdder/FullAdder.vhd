LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY FullAdder IS
    PORT (
        A    : IN STD_LOGIC;
        B    : IN STD_LOGIC;
        Cin  : IN STD_LOGIC;
        Sum  : OUT STD_LOGIC;
        Cout : OUT STD_LOGIC
    );
END FullAdder;

----------------------------------------------------
ARCHITECTURE Behaviour OF FullAdder IS
BEGIN
    Sum  <= A XOR B XOR Cin;
    Cout <= (A AND B) OR (Cin AND (A XOR B));
END Behaviour;