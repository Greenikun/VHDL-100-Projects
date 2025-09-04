LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY MUX2to1_tb IS
END MUX2to1_tb;

ARCHITECTURE test OF MUX2to1_tb IS
    SIGNAL A, B, S, Y : STD_LOGIC;
BEGIN
    uut : ENTITY work.MUX2to1
        PORT MAP(
            A => A,
            B => B,
            S => S,
            Y => Y
        );
    -- Stimulus process
    stimulus_proc : PROCESS
    BEGIN
        -- Test Case 1
        A <= '0';
        B <= '0';
        S <= '0';
        WAIT FOR 2 ns;

        -- Test Case 2
        A <= '0';
        B <= '1';
        S <= '0';
        WAIT FOR 2 ns;

        -- Test Case 3
        A <= '1';
        B <= '0';
        S <= '0';
        WAIT FOR 2 ns;

        -- Test Case 4
        A <= '1';
        B <= '1';
        S <= '0';
        WAIT FOR 2 ns;

        -- Test Case 5
        A <= '0';
        B <= '0';
        S <= '1';
        WAIT FOR 2 ns;

        -- Test Case 6
        A <= '0';
        B <= '1';
        S <= '1';
        WAIT FOR 2 ns;

        -- Test Case 7
        A <= '1';
        B <= '0';
        S <= '1';
        WAIT FOR 2 ns;

        -- Test Case 8
        A <= '1';
        B <= '1';
        S <= '1';
        WAIT FOR 2 ns;

        WAIT;

    END PROCESS;
END test;