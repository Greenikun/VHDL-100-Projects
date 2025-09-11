LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY Decoder3to8 IS
    PORT (
        A  : IN  STD_LOGIC_VECTOR (2 DOWNTO 0);  -- 3-bit input address
        EN : IN  STD_LOGIC;                       -- Enable signal
        Y  : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)   -- 8-bit output
    );
END Decoder3to8;

ARCHITECTURE Behavioral OF Decoder3to8 IS
BEGIN
    PROCESS (A, EN)
    BEGIN
        -- Only decode when enable is active
        IF (EN = '1') THEN
            CASE A IS
                WHEN "000" => Y <= "00000001"; -- output 0 active
                WHEN "001" => Y <= "00000010"; -- output 1 active
                WHEN "010" => Y <= "00000100"; -- output 2 active
                WHEN "011" => Y <= "00001000"; -- output 3 active
                WHEN "100" => Y <= "00010000"; -- output 4 active
                WHEN "101" => Y <= "00100000"; -- output 5 active
                WHEN "110" => Y <= "01000000"; -- output 6 active
                WHEN "111" => Y <= "10000000"; -- output 7 active
                WHEN OTHERS => Y <= "00000000"; -- default case
            END CASE;
        ELSE
            Y <= "00000000"; -- disable all outputs if EN = 0
        END IF;
    END PROCESS;
END Behavioral;