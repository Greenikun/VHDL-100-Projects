LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY myFullAdder IS
    PORT (
        A : IN STD_LOGIC;       -- First input bit
        B : IN STD_LOGIC;       -- Second input bit
        Cin : IN STD_LOGIC;     -- Carry-in
        S : OUT STD_LOGIC;      -- Sum output
        Cout : OUT STD_LOGIC    -- Carry-out
    );
END myFullAdder;

ARCHITECTURE Behaviour OF myFullAdder IS
BEGIN
    -- Sum and carry equations for a single-bit full adder
    S <= A XOR B XOR Cin;
    Cout <= (A AND B) OR (Cin AND (A XOR B));
END Behaviour;
