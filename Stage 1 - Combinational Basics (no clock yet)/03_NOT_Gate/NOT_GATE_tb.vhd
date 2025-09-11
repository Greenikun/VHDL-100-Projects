LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY NOT_GATE_tb IS
END NOT_GATE_tb;

ARCHITECTURE behavioural OF NOT_GATE_tb IS
    SIGNAL A, Y : STD_LOGIC;  -- Signals to drive DUT and capture output
BEGIN
    -- Instantiate the Device Under Test (DUT)
    uut : ENTITY work.NOT_GATE
        PORT MAP(
            A => A,
            Y => Y
        );

    -- Stimulus process to test all input values
    stim_proc : PROCESS
    BEGIN
        A <= '0';  -- Test case: NOT 0
        WAIT FOR 10 ns;

        A <= '1';  -- Test case: NOT 1
        WAIT FOR 10 ns;

        WAIT; -- Stop simulation here
    END PROCESS;
END behavioural;