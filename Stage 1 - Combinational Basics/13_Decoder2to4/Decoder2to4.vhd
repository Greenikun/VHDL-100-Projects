-- ====================================================
-- Project: 2-to-4 Decoder
-- File   : Decoder2to4.vhd
-- Author : Ahmad Nabil (TheChipMaker)
-- Desc   : Simple line decoder with enable input
-- ====================================================

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY Decoder2to4 IS
    PORT (
        A  : IN  STD_LOGIC_VECTOR (1 DOWNTO 0);  -- 2-bit input address
        EN : IN  STD_LOGIC;                       -- Enable signal
        Y  : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)   -- 4-bit output
    );
END Decoder2to4;

ARCHITECTURE behaviour OF Decoder2to4 IS
BEGIN
    PROCESS (A, EN)
    BEGIN
        -- Only decode when enable is active
        IF (EN = '1') THEN
            CASE A IS
                WHEN "00" => Y <= "0001";  -- output line 0 active
                WHEN "01" => Y <= "0010";  -- output line 1 active
                WHEN "10" => Y <= "0100";  -- output line 2 active
                WHEN "11" => Y <= "1000";  -- output line 3 active
                WHEN OTHERS => Y <= (OTHERS => '0'); -- default case
            END CASE;
        ELSIF (EN = '0') THEN
            Y <= "0000";  -- disable all outputs if EN is 0
        END IF;
    END PROCESS;
END behaviour;