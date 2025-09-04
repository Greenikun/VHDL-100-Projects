LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY NOT_GATE_tb IS
END NOT_GATE_tb;

ARCHITECTURE behavioural OF NOT_GATE_tb IS
    SIGNAL A, Y : STD_LOGIC;

BEGIN
    uut : ENTITY work.NOT_GATE
        PORT MAP(
            A => A,
            Y => Y
        );
    stim_proc : PROCESS
    BEGIN
        A <= '0';
        WAIT FOR 10 ns;
        A <= '1';
        WAIT FOR 10 ns;
        WAIT;
    END PROCESS;
END behavioural;