LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY GrayToBinary_tb IS
END GrayToBinary_tb;

-----------------------------------------------------------

ARCHITECTURE Test OF GrayToBinary_tb IS
    CONSTANT N : INTEGER := 4;
    SIGNAL G : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
    SIGNAL B : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
BEGIN
    -- Instantiate DUT
    DUT: ENTITY work.GrayToBinary
        GENERIC MAP (N => N)
        PORT MAP (
            G => G,
            B => B
        );

    -- Stimulus + self-check process
    stim_proc: PROCESS
        VARIABLE B_expected_var : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
        VARIABLE i_var : INTEGER;
    BEGIN
        FOR i_var IN 0 TO 2**N - 1 LOOP
            -- Apply Gray code input
            G <= STD_LOGIC_VECTOR(to_unsigned(i_var, N));
            WAIT FOR 1 ns;  -- allow combinational DUT to update

            -- Compute expected binary value using a variable
            B_expected_var(N-1) := G(N-1);
            FOR j IN N-2 DOWNTO 0 LOOP
                B_expected_var(j) := B_expected_var(j+1) XOR G(j);
            END LOOP;

            -- Assert DUT output matches expected
            ASSERT (B = B_expected_var)
                REPORT "Mismatch! Gray=" & INTEGER'IMAGE(to_integer(unsigned(G))) &
                       " Expected Binary=" & INTEGER'IMAGE(to_integer(unsigned(B_expected_var))) &
                       " Got=" & INTEGER'IMAGE(to_integer(unsigned(B)))
                SEVERITY ERROR;
        END LOOP;

        -- Success message
        REPORT "All test cases PASSED." SEVERITY NOTE;
        WAIT;  -- stop simulation
    END PROCESS;

END Test;
