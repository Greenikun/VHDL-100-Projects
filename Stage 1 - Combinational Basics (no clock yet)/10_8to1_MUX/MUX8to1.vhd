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
        D : IN STD_LOGIC_VECTOR (7 DOWNTO 0); -- 8 data inputs
        S : IN STD_LOGIC_VECTOR (2 DOWNTO 0); -- 3 bit inputs
        Y : OUT STD_LOGIC
    );
END MUX8to1;
ARCHITECTURE behaviour OF MUX8to1 IS
BEGIN
    WITH S SELECT
        Y <= D(0) WHEN "000",
        D(1) WHEN "001",
        D(2) WHEN "010",
        D(3) WHEN "011",
        D(4) WHEN "100",
        D(5) WHEN "101",
        D(6) WHEN "110",
        D(7) WHEN "111",
        '0' WHEN OTHERS;
END behaviour;