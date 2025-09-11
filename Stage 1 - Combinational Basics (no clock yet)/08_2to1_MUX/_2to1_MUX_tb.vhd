LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY MUX2to1_tb IS
END MUX2to1_tb;

ARCHITECTURE test OF MUX2to1_tb IS
    SIGNAL A, B, S, Y : STD_LOGIC;  -- Signals to drive DUT and capture output
BEGIN
    -- Instantiate the Device Under Test (DUT)
    uut : ENTITY work.MUX2to1
        PORT MAP(
            A => A,
            B => B,
            S => S,
            Y => Y
        );

    -- Stimulus process to test all input combinations
    stimulus_proc : PROCESS
    BEGIN
        -- Select = 0 test cases
        A <= '0'; B <= '0'; S <= '0';  -- Expect Y = 0
        WAIT FOR 2 ns;

        A <= '0'; B <= '1'; S <= '0';  -- Expect Y = 0
        WAIT FOR 2 ns;

        A <= '1'; B <= '0'; S <= '0';  -- Expect Y = 1
        WAIT FOR 2 ns;

        A <= '1'; B <= '1'; S <= '0';  -- Expect Y = 1
        WAIT FOR 2 ns;

        -- Select = 1 test cases
        A <= '0'; B <= '0'; S <= '1';  -- Expect Y = 0
        WAIT FOR 2 ns;

        A <= '0'; B <= '1'; S <= '1';  -- Expect Y = 1
        WAIT FOR 2 ns;

        A <= '1'; B <= '0'; S <= '1';  -- Expect Y = 0
        WAIT FOR 2 ns;

        A <= '1'; B <= '1'; S <= '1';  -- Expect Y = 1
        WAIT FOR 2 ns;

        WAIT; -- Stop simulation here
    END PROCESS;
END test;