LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

----------------------------------------------------------------

ENTITY deMUX1to4 IS
    PORT (
        D  : IN  STD_LOGIC;
        S  : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
        O1 : OUT STD_LOGIC;
        O2 : OUT STD_LOGIC;
        O3 : OUT STD_LOGIC;
        O4 : OUT STD_LOGIC
    );
END deMUX1to4;

----------------------------------------------------------------

ARCHITECTURE behaviour OF deMUX1to4 IS
BEGIN
    PROCESS (S, D)
    BEGIN
        -- default values (avoid latches)
        O1 <= '0';
        O2 <= '0';
        O3 <= '0';
        O4 <= '0';

        -- select which output gets D
        CASE S IS
            WHEN "00" =>
                O1 <= D;
            WHEN "01" =>
                O2 <= D;
            WHEN "10" =>
                O3 <= D;
            WHEN "11" =>
                O4 <= D;
            WHEN OTHERS =>
                NULL;  -- nothing (outputs stay at '0')
        END CASE;
    END PROCESS;
END behaviour;
