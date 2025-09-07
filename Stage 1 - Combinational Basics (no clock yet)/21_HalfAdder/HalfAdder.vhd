LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY HalfAdder IS
    PORT (
        SIGNAL A : IN STD_LOGIC; -- First input
        SIGNAL B : IN STD_LOGIC; -- Second input
        SIGNAL S : OUT STD_LOGIC; -- Sum output (A XOR B)
        SIGNAL C : OUT STD_LOGIC -- Carry output (A AND B)
    );
END HalfAdder;
-----------------------------------------------
ARCHITECTURE Behaviour OF HalfAdder IS
BEGIN
    PROCESS (A, B) -- Sensitivity list: process triggers whenever A or B changes
    BEGIN
        S <= A XOR B; -- Calculate sum
        C <= A AND B; -- Calculate carry
    END PROCESS;
END Behaviour;