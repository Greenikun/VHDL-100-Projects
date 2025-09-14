LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

----------------------------------------------------------------

ENTITY deMUX1to4 IS
    PORT (
        D  : IN  STD_LOGIC;                   -- Input signal
        S  : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);-- 2-bit select signal
        O1 : OUT STD_LOGIC;                    -- Output 1
        O2 : OUT STD_LOGIC;                    -- Output 2
        O3 : OUT STD_LOGIC;                    -- Output 3
        O4 : OUT STD_LOGIC                     -- Output 4
    );
END deMUX1to4;

----------------------------------------------------------------

ARCHITECTURE behaviour OF deMUX1to4 IS
BEGIN
    PROCESS (S, D)
    BEGIN
        -- Default output values to avoid latches
        O1 <= '0';
        O2 <= '0';
        O3 <= '0';
        O4 <= '0';

        -- Route input D to the selected output based on S
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
                NULL;  -- outputs remain '0' for invalid select values
        END CASE;
    END PROCESS;
END behaviour;