LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY HalfAdder IS
    PORT (
        A : IN STD_LOGIC;    -- First input
        B : IN STD_LOGIC;    -- Second input
        S : OUT STD_LOGIC;   -- Sum output (A XOR B)
        C : OUT STD_LOGIC    -- Carry output (A AND B)
    );
END HalfAdder;

-----------------------------------------------
ARCHITECTURE Behaviour OF HalfAdder IS
BEGIN
    PROCESS (A, B)  -- Triggered whenever A or B changes
    BEGIN
        S <= A XOR B; -- Sum
        C <= A AND B; -- Carry
    END PROCESS;
END Behaviour;