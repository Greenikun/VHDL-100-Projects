LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


ENTITY deMUX1to2 IS
    PORT (
         D : IN STD_LOGIC_VECTOR(7 downto 0); -- Input signal
         O1 : OUT STD_LOGIC_VECTOR(7 downto 0); -- Output signal 1
         O2 : OUT STD_LOGIC_VECTOR(7 downto 0); -- Output signal 2
         S : IN STD_LOGIC -- Select
    );
END deMUX1to2;

ARCHITECTURE behaviour OF deMUX1to2 IS
begin

O1 <= D WHEN S = '0' else "00000000";
O2 <= D WHEN S = '1' else "00000000"; 



END behaviour;