LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY OR_GATE_tb IS
END OR_GATE_tb;

ARCHITECTURE Behavioral OF OR_GATE_tb IS
    SIGNAL A, B, Y : STD_LOGIC;

BEGIN
    uut : ENTITY work.OR_GATE
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
END behavioral;