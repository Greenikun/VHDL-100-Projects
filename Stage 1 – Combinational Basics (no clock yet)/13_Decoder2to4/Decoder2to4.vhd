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
        A : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
        EN : IN STD_LOGIC;
        Y : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
    );
END Decoder2to4;

ARCHITECTURE behaviour OF Decoder2to4 IS
BEGIN
    PROCESS (A, EN)
    BEGIN
        IF (EN = '1') THEN
            CASE A IS
                WHEN "00" => Y <= "0001";
                WHEN "01" => Y <= "0010";
                WHEN "10" => Y <= "0100";
                WHEN "11" => Y <= "1000";
                WHEN OTHERS => Y <= (OTHERS => '0');
            END CASE;
        ELSIF (EN = '0') THEN
            Y <= "0000";
        END IF;
    END PROCESS;
END behaviour;