--                  a
--             ____________
--            │            │
--          f │            │ b
--            │            │
--            │____________│
--            │     g      │
--            │            │
--         e  │            │ c
--            │            │
--             ‾‾‾‾‾‾‾‾‾‾‾‾
--                   d
--
--      Segment mapping (active high):
--      MSB  a   b   c   d   e   f
--      MSB  0   0   0   0   0   0
--
-- 0:       a(1) b(1) c(1) d(1) e(1) f(1) g(0)       (1111110)
-- 1:       a(0) b(1) c(1) d(0) e(0) f(0) g(0)       (0110000)
-- 2:       a(1) b(1) c(0) d(1) e(1) f(0) g(1)       (1101101)
-- 3:       a(1) b(1) c(1) d(1) e(0) f(0) g(1)       (1111001)
-- 4:       a(0) b(1) c(1) d(0) e(0) f(1) g(1)       (0110011)
-- 5:       a(1) b(0) c(1) d(1) e(0) f(1) g(1)       (1011011)
-- 6:       a(1) b(0) c(1) d(1) e(1) f(1) g(1)       (1011111)
-- 7:       a(1) b(1) c(1) d(0) e(0) f(0) g(0)       (1110000)
-- 8:       a(1) b(1) c(1) d(1) e(1) f(1) g(1)       (1111111)
-- 9:       a(1) b(1) c(1) d(1) e(0) f(1) g(1)       (1111011)
-- Other:   a(0) b(0) c(0) d(0) e(0) f(0) g(0)       (0000000)
--
--
--
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY sevenSeg IS
    PORT (
        A : IN  STD_LOGIC_VECTOR(3 DOWNTO 0); -- 4-bit input representing hexadecimal digit (0–15)
        Y : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)  -- 7-segment output (a–g)
    );
END sevenSeg;

----------------------------------------------
ARCHITECTURE Behaviour OF sevenSeg IS
BEGIN

    PROCESS (A)
    BEGIN
        -- Map input digit to 7-segment display encoding
        CASE A IS
            WHEN "0000" => Y <= "1111110"; -- 0
            WHEN "0001" => Y <= "0110000"; -- 1
            WHEN "0010" => Y <= "1101101"; -- 2
            WHEN "0011" => Y <= "1111001"; -- 3
            WHEN "0100" => Y <= "0110011"; -- 4
            WHEN "0101" => Y <= "1011011"; -- 5
            WHEN "0110" => Y <= "1011111"; -- 6
            WHEN "0111" => Y <= "1110000"; -- 7
            WHEN "1000" => Y <= "1111111"; -- 8
            WHEN "1001" => Y <= "1111011"; -- 9
            WHEN OTHERS => Y <= "0000000"; -- invalid input, turn off display
        END CASE;

    END PROCESS;

END Behaviour;