LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY NAND_GATE_tb IS

END NAND_GATE_tb;

ARCHITECTURE behavioural OF NAND_GATE_tb IS

    SIGNAL A, B, Y : STD_LOGIC;

BEGIN

    uut : ENTITY work.NAND_GATE
        PORT MAP(
            A => A,
            B => B,
            Y => Y
        );
    stim_proc : PROCESS
    BEGIN
        a <= '0';
        b <= '0';
        WAIT FOR 10 ns;
        a <= '0';
        b <= '1';
        WAIT FOR 10 ns;
        a <= '1';
        b <= '0';
        WAIT FOR 10 ns;
        a <= '1';
        b <= '1';
        WAIT FOR 10 ns;
        WAIT;
    END PROCESS;

END behavioural;