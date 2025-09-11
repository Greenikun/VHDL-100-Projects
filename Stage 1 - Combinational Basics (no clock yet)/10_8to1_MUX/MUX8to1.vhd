-- ======================================================
-- Project : 91_8to1_MUX
-- File    : MUX8to1.vhd
-- Author  : Ahmad Nabil
-- Function: 8-to-1 Multiplexer
-- ======================================================

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY MUX8to1 IS
    PORT (
        D : IN STD_LOGIC_VECTOR (7 DOWNTO 0); -- 8 data inputs (D0-D7)
        S : IN STD_LOGIC_VECTOR (2 DOWNTO 0); -- 3-bit select signal
        Y : OUT STD_LOGIC                     -- Output, selected input
    );
END MUX8to1;

ARCHITECTURE behaviour OF MUX8to1 IS
BEGIN
    -- Multiplexer logic using 'with-select-when'
    WITH S SELECT
        Y <= D(0) WHEN "000",  -- Select D0
             D(1) WHEN "001",  -- Select D1
             D(2) WHEN "010",  -- Select D2
             D(3) WHEN "011",  -- Select D3
             D(4) WHEN "100",  -- Select D4
             D(5) WHEN "101",  -- Select D5
             D(6) WHEN "110",  -- Select D6
             D(7) WHEN "111",  -- Select D7
             '0'  WHEN OTHERS; -- Default output to prevent 'U'
END behaviour;