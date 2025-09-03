LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY deMUX1to2_tb IS
END deMUX1to2_tb;
ARCHITECTURE test OF deMUX1to2_tb IS
    SIGNAL D : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL O1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL O2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL S : STD_LOGIC;

BEGIN

    dut : ENTITY work.deMUX1to2
        PORT MAP(
            D => D,
            O1 => O1,
            O2 => O2,
            S => S
        );

    stim_proc : PROCESS
    BEGIN
        -- Loop through all values of D (0 to 255)
        FOR i IN 0 TO 255 LOOP
            D <= STD_LOGIC_VECTOR(to_unsigned(i, 8));

            -- Test with S = 0
            S <= '0';
            WAIT FOR 1 ns;

            -- Test with S = 1
            S <= '1';
            WAIT FOR 1 ns;
        END LOOP;

        -- Stop simulation
        WAIT;
    END PROCESS;

END test;