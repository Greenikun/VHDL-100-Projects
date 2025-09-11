LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY deMUX1to2 IS
    PORT (
         D  : IN STD_LOGIC_VECTOR(7 downto 0);  -- 8-bit input signal
         O1 : OUT STD_LOGIC_VECTOR(7 downto 0); -- Output 1, receives D when S=0
         O2 : OUT STD_LOGIC_VECTOR(7 downto 0); -- Output 2, receives D when S=1
         S  : IN STD_LOGIC                       -- Select signal
    );
END deMUX1to2;

ARCHITECTURE behaviour OF deMUX1to2 IS
BEGIN
    -- Assign D to O1 if S=0, else zero
    O1 <= D WHEN S = '0' ELSE "00000000";

    -- Assign D to O2 if S=1, else zero
    O2 <= D WHEN S = '1' ELSE "00000000"; 
END behaviour;