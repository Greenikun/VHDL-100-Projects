-- ====================================================
-- Project: 2-to-4 Decoder
-- File   : Decoder2to4_tb.vhd
-- Author : Ahmad Nabil (TheChipMaker)
-- Desc   : Simple 2-to-4 testbench for a line decoder with enable input
-- ====================================================

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY Decoder2to4_tb IS
END Decoder2to4_tb;

ARCHITECTURE test OF Decoder2to4_tb IS

    SIGNAL A : STD_LOGIC_VECTOR (1 DOWNTO 0);
    SIGNAL EN : STD_LOGIC;
    SIGNAL Y : STD_LOGIC_VECTOR (3 DOWNTO 0);

BEGIN

    uut : ENTITY work.Decoder2to4
        PORT MAP(
            A => A,
            EN => EN,
            Y => Y
        );

    stim_proc : PROCESS
    BEGIN
        EN <= '0';

        A <= "00";
        WAIT FOR 1 ns;
        A <= "01";
        WAIT FOR 1 ns;
        A <= "10";
        WAIT FOR 1 ns;
        A <= "11";
        WAIT FOR 1 ns;
        -------------------------------
        EN <= '1';
        A <= "00";
        WAIT FOR 1 ns;
        A <= "01";
        WAIT FOR 1 ns;
        A <= "10";
        WAIT FOR 1 ns;
        A <= "11";
        WAIT FOR 1 ns;
        WAIT;
    END PROCESS;
END test;