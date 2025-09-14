LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY deMUX1to2_tb IS
END deMUX1to2_tb;

ARCHITECTURE test OF deMUX1to2_tb IS
    SIGNAL D  : STD_LOGIC_VECTOR(7 DOWNTO 0); -- Test input
    SIGNAL O1 : STD_LOGIC_VECTOR(7 DOWNTO 0); -- DUT output 1
    SIGNAL O2 : STD_LOGIC_VECTOR(7 DOWNTO 0); -- DUT output 2
    SIGNAL S  : STD_LOGIC;                     -- DUT select signal
BEGIN
    -- Instantiate the DUT
    dut : ENTITY work.deMUX1to2
        PORT MAP(
            D  => D,
            O1 => O1,
            O2 => O2,
            S  => S
        );

    -- Stimulus process to exhaustively test all input combinations
    stim_proc : PROCESS
    BEGIN
        -- Loop through all 8-bit values for D (0 to 255)
        FOR i IN 0 TO 255 LOOP
            D <= STD_LOGIC_VECTOR(to_unsigned(i, 8));

            -- Apply select S=0, output should go to O1
            S <= '0';
            WAIT FOR 1 ns;

            -- Apply select S=1, output should go to O2
            S <= '1';
            WAIT FOR 1 ns;
        END LOOP;

        -- Stop simulation
        WAIT;
    END PROCESS;
END test;