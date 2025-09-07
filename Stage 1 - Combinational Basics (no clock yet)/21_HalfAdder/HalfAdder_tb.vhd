LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY HalfAdder_tb IS
END HalfAdder_tb;
--
--
------------------------------------------------
--
--
ARCHITECTURE Test OF HalfAdder_tb IS
    SIGNAL A : STD_LOGIC;
    SIGNAL B : STD_LOGIC;
    SIGNAL S : STD_LOGIC;
    SIGNAL C : STD_LOGIC;

BEGIN
    DuT : ENTITY work.HalfAdder
        PORT MAP(
            A => A,
            B => B,
            S => S,
            C => C
        );

    stim_proc : PROCESS
    BEGIN
        A <= 0;
        B <= 0;
        WAIT FOR 1 ns;
        A <= 0;
        B <= 1;
        WAIT FOR 1 ns;
        A <= 1;
        B <= 0;
        WAIT FOR 1 ns;
        A <= 1;
        B <= 1;
        WAIT FOR 1 ns;
        WAIT;
    END PROCESS;
END Test;