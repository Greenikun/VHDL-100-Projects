LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

----------------------------------------------------------------

ENTITY deMUX1to4_tb IS
END deMUX1to4_tb;

----------------------------------------------------------------

ARCHITECTURE test OF deMUX1to4_tb IS

    SIGNAL D : STD_LOGIC;
    SIGNAL S : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL O1, O2, O3, O4 : STD_LOGIC;

BEGIN
    DUT : ENTITY work.deMUX1to4
        PORT MAP(
            D => D,
            S => S,
            O1 => O1,
            O2 => O2,
            O3 => O3,
            O4 => O4
        );
    stim_proc : PROCESS
    BEGIN
        -- test 1: D=0
        D <= '0';
        S <= "00";
        WAIT FOR 1 ns;
        S <= "01";
        WAIT FOR 1 ns;
        S <= "10";
        WAIT FOR 1 ns;
        S <= "11";
        WAIT FOR 1 ns;

        -- test 2: D=1
        D <= '1';
        S <= "00";
        WAIT FOR 1 ns;
        S <= "01";
        WAIT FOR 1 ns;
        S <= "10";
        WAIT FOR 1 ns;
        S <= "11";
        WAIT FOR 1 ns;
        WAIT;
    END PROCESS;

END test;