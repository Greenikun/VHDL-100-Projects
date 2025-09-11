-- ======================================================
-- Project : 91_8to1_MUX
-- File    : MUX8to1_tb.vhd
-- Author  : Ahmad Nabil
-- Function: 8-to-1 Multiplexer Test Bench
-- ======================================================

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY MUX8to1_tb IS
END MUX8to1_tb;

ARCHITECTURE test OF MUX8to1_tb IS
    SIGNAL D : STD_LOGIC_VECTOR(7 DOWNTO 0) := "10101010"; -- Test pattern for inputs
    SIGNAL S : STD_LOGIC_VECTOR(2 DOWNTO 0) := (OTHERS => '0'); -- Select lines initialized to 0
    SIGNAL Y : STD_LOGIC; -- Output signal
BEGIN
    -- Instantiate the 8-to-1 MUX DUT
    uut : ENTITY work.MUX8to1
        PORT MAP(
            D => D,
            S => S,
            Y => Y
        );

    -- Stimulus process to drive select inputs
    stim_proc : PROCESS
    BEGIN
        FOR i IN 0 TO 7 LOOP
            S <= STD_LOGIC_VECTOR(to_unsigned(i, 3)); -- Set select lines to choose each input
            WAIT FOR 1 ns;                             -- Small delay for observation
        END LOOP;
        WAIT; -- Stop simulation here
    END PROCESS;
END test;