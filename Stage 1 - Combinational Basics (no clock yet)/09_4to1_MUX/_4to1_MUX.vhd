LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY MUX4to1 IS
    PORT (
        A : IN STD_LOGIC;
        B : IN STD_LOGIC;
        C : IN STD_LOGIC;
        D : IN STD_LOGIC;
        S : IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- 2-bit select
        Y : OUT STD_LOGIC
    );
END MUX4to1;

ARCHITECTURE behavioural OF MUX4to1 IS
BEGIN
    PROCESS (A, B, C, D, S)
    BEGIN
        -- Default assignment prevents Y from being 'U'
        Y <= '0';

        IF S = "00" THEN
            Y <= A;
        ELSIF S = "01" THEN
            Y <= B;
        ELSIF S = "10" THEN
            Y <= C;
        ELSIF S = "11" THEN
            Y <= D;
        END IF;
    END PROCESS;
END behavioural;

