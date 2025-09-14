LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY BinaryToGray_tb IS
END BinaryToGray_tb;

------------------------------------------------------
ARCHITECTURE Test OF BinaryToGray_tb IS

    CONSTANT N : INTEGER := 4; -- width of input/output
    SIGNAL B : STD_LOGIC_VECTOR (N - 1 DOWNTO 0); -- Binary input to DUT
    SIGNAL G : STD_LOGIC_VECTOR (N - 1 DOWNTO 0); -- Gray output from DUT
BEGIN
    -- Instantiate the DUT
    dut : ENTITY work.BinaryToGray
        GENERIC MAP(
            N => N
        )
    PORT MAP(
        B => B,
        G => G
    );

    -- Stimulus process
    stim_process : PROCESS
    BEGIN
        -- Test all possible binary input values (0 to 2^N-1)
        FOR i IN 0 TO 2 ** N - 1 LOOP
            B <= STD_LOGIC_VECTOR(to_unsigned(i, 4));
            WAIT FOR 1 ns; -- small delay to observe output
        END LOOP;
    END PROCESS;
END Test;