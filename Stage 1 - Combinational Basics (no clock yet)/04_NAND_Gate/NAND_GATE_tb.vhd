LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY NAND_GATE_tb IS
END NAND_GATE_tb;

ARCHITECTURE behavioural OF NAND_GATE_tb IS
    SIGNAL A, B, Y : STD_LOGIC;  -- Signals to drive DUT and capture output
BEGIN
    -- Instantiate the Device Under Test (DUT)
    uut : ENTITY work.NAND_GATE
        PORT MAP(
            A => A,
            B => B,
            Y => Y
        );

    -- Stimulus process to test all input combinations
    stim_proc : PROCESS
    BEGIN
        a <= '0';
        b <= '0';  -- Test case 0 NAND 0
        WAIT FOR 10 ns;

        a <= '0';
        b <= '1';  -- Test case 0 NAND 1
        WAIT FOR 10 ns;

        a <= '1';
        b <= '0';  -- Test case 1 NAND 0
        WAIT FOR 10 ns;

        a <= '1';
        b <= '1';  -- Test case 1 NAND 1
        WAIT FOR 10 ns;

        WAIT; -- Stop simulation here
    END PROCESS;
END behavioural;