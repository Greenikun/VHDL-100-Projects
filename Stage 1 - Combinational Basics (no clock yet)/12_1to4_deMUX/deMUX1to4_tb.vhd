LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

----------------------------------------------------------------

ENTITY deMUX1to4_tb IS
END deMUX1to4_tb;

----------------------------------------------------------------

ARCHITECTURE test OF deMUX1to4_tb IS

    SIGNAL D : STD_LOGIC;                      -- Input signal for DUT
    SIGNAL S : STD_LOGIC_VECTOR(1 DOWNTO 0);   -- 2-bit select signal for DUT
    SIGNAL O1, O2, O3, O4 : STD_LOGIC;         -- Outputs from DUT

BEGIN
    -- Instantiate the DUT
    DUT : ENTITY work.deMUX1to4
        PORT MAP(
            D  => D,
            S  => S,
            O1 => O1,
            O2 => O2,
            O3 => O3,
            O4 => O4
        );

    -- Stimulus process to test all combinations of D and S
    stim_proc : PROCESS
    BEGIN
        -- Test with D=0
        D <= '0';
        S <= "00"; WAIT FOR 1 ns;
        S <= "01"; WAIT FOR 1 ns;
        S <= "10"; WAIT FOR 1 ns;
        S <= "11"; WAIT FOR 1 ns;

        -- Test with D=1
        D <= '1';
        S <= "00"; WAIT FOR 1 ns;
        S <= "01"; WAIT FOR 1 ns;
        S <= "10"; WAIT FOR 1 ns;
        S <= "11"; WAIT FOR 1 ns;

        WAIT;  -- stop simulation
    END PROCESS;

END test;