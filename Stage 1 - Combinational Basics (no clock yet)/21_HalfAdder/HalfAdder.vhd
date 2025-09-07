LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY HalfAdder IS
    PORT (
        SIGNAL A : IN STD_LOGIC;
        SIGNAL B : IN STD_LOGIC;
        SIGNAL S : OUT STD_LOGIC;
        SIGNAL C : OUT STD_LOGIC
    );
END HalfAdder;
-----------------------------------------------
ARCHITECTURE Behaviour OF HalfAdder IS
BEGIN
    PROCESS (A, B)
    BEGIN
        S <= A XOR B;
        C <= A AND B;
    END PROCESS;
END Behaviour;