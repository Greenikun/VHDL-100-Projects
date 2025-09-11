LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY MUX4to1 IS
    PORT (
        A : IN STD_LOGIC;              -- Input 0
        B : IN STD_LOGIC;              -- Input 1
        C : IN STD_LOGIC;              -- Input 2
        D : IN STD_LOGIC;              -- Input 3
        S : IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- 2-bit select signal
        Y : OUT STD_LOGIC              -- Output, selected input
    );
END MUX4to1;

ARCHITECTURE behavioural OF MUX4to1 IS
BEGIN
    -- Process to implement 4-to-1 multiplexer
    PROCESS (A, B, C, D, S)
    BEGIN
        -- Default assignment prevents Y from being 'U'
        Y <= '0';

        -- Select which input to output based on S
        IF S = "00" THEN
            Y <= A;  -- Select input A
        ELSIF S = "01" THEN
            Y <= B;  -- Select input B
        ELSIF S = "10" THEN
            Y <= C;  -- Select input C
        ELSIF S = "11" THEN
            Y <= D;  -- Select input D
        END IF;
    END PROCESS;
END behavioural;