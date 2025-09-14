library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND_GATE_tb is
end AND_GATE_tb;

architecture Behavioral of AND_GATE_tb is
    signal A, B, Y : std_logic;  -- Signals to drive DUT and capture output
begin
    -- Instantiate the Device Under Test (DUT)
    uut: entity work.AND_GATE
        port map (
            A => A,
            B => B,
            Y => Y
        );

    -- Stimulus process to test all input combinations
    stim_proc: process
    begin
        A <= '0'; B <= '0';   -- Test case 0 AND 0
        wait for 10 ns;
        A <= '0'; B <= '1';   -- Test case 0 AND 1
        wait for 10 ns;
        A <= '1'; B <= '0';   -- Test case 1 AND 0
        wait for 10 ns;
        A <= '1'; B <= '1';   -- Test case 1 AND 1
        wait for 10 ns;
        wait; -- Stop simulation here
    end process;
end Behavioral;