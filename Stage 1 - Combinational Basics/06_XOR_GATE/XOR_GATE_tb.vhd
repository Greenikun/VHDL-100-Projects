library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XOR_GATE_tb is
end XOR_GATE_tb;

architecture Behavioral of XOR_GATE_tb is
    signal A, B, Y : std_logic;  -- Signals to drive DUT and capture output
begin
    -- Instantiate the Device Under Test (DUT)
    uut: entity work.XOR_GATE
        port map (
            A => A,
            B => B,
            Y => Y
        );

    -- Stimulus process to test all input combinations
    stim_proc: process
    begin
        A <= '0'; B <= '0';  -- Test case 0 XOR 0
        wait for 10 ns;

        A <= '0'; B <= '1';  -- Test case 0 XOR 1
        wait for 10 ns;

        A <= '1'; B <= '0';  -- Test case 1 XOR 0
        wait for 10 ns;

        A <= '1'; B <= '1';  -- Test case 1 XOR 1
        wait for 10 ns;

        wait; -- Stop simulation here
    end process;
end Behavioral;