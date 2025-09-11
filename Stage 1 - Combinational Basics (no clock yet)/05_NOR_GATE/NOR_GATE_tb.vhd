LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY NOR_GATE_tb IS
END NOR_GATE_tb;

ARCHITECTURE Behavioural OF NOR_GATE_tb IS
    SIGNAL A, B, Y : STD_LOGIC;  -- Signals to drive DUT and capture output
BEGIN
    -- Instantiate the Device Under Test (DUT)
    uut :
    ENTITY work.NOR_GATE
        PORT MAP(
            A => A,
            B => B,
            Y => Y
        );

    -- Stimulus process to test all input combinations
    stim_proc : PROCESS
    BEGIN
        A <= '0';
        B <= '0';  -- Test case 0 NOR 0
        WAIT FOR 10 ns;

        A <= '0';
        B <= '1';  -- Test case 0 NOR 1
        WAIT FOR 10 ns;

        A <= '1';
        B <= '0';  -- Test case 1 NOR 0
        WAIT FOR 10 ns;

        A <= '1';
        B <= '1';  -- Test case 1 NOR 1
        WAIT FOR 10 ns;

        WAIT; -- Stop simulation here
    END PROCESS;
END Behavioural;