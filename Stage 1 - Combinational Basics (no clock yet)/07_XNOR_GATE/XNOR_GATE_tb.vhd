library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XNOR_GATE_tb is
end XNOR_GATE_tb;

architecture Behavioral of XNOR_GATE_tb is
    signal A, B, Y : std_logic;
begin
    uut: entity work.XNOR_GATE
        port map (
            A => A,
            B => B,
            Y => Y
        );

    stim_proc: process
    begin
        A <= '0'; B <= '0';
        wait for 10 ns;
        A <= '0'; B <= '1';
        wait for 10 ns;
        A <= '1'; B <= '0';
        wait for 10 ns;
        A <= '1'; B <= '1';
        wait for 10 ns;
        wait; -- stop simulation here
    end process;
end Behavioral;
