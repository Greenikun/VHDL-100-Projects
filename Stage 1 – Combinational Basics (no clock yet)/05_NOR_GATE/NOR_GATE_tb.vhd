LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY NOR_GATE_tb IS
END NOR_GATE_tb;

ARCHITECTURE Behavioural OF NOR_GATE_tb IS

    SIGNAL A, B, Y : STD_LOGIC;

BEGIN
    uut :
    ENTITY work.NOR_GATE
        PORT MAP(
            A => A,
            B => B,
            Y => Y
        );
        stim_proc : PROCESS
        BEGIN
            A <= '0';
            B <= '0';
            WAIT FOR 10 ns;
            A <= '0';
            B <= '1';
            WAIT FOR 10 ns;
            A <= '1';
            B <= '0';
            WAIT FOR 10 ns;
            A <= '1';
            B <= '1';
            WAIT FOR 10 ns;
            WAIT;
        END PROCESS;
    END Behavioural;