LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY GrayToBinary_tb IS
END GrayToBinary_tb;

-----------------------------------------------------------

ARCHITECTURE Test OF GrayToBinary_tb IS
    CONSTANT N : INTEGER := 4; -- width of input/output
    SIGNAL G : STD_LOGIC_VECTOR(N-1 DOWNTO 0); -- Gray input to DUT
    SIGNAL B : STD_LOGIC_VECTOR(N-1 DOWNTO 0); -- Binary output from DUT
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
        -- Variables to compute expected binary output
        VARIABLE B_expected_var : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
        VARIABLE i_var : INTEGER;
    BEGIN
        -- Loop through all possible Gray code inputs
        FOR i_var IN 0 TO 2**N - 1 LOOP
            G <= STD_LOGIC_VECTOR(to_unsigned(i_var, N)); -- Apply Gray input
            WAIT FOR 1 ns;  -- wait for combinational logic to settle

            -- Compute expected binary output
            B_expected_var(N-1) := G(N-1); -- MSB
            FOR j IN N-2 DOWNTO 0 LOOP
                B_expected_var(j) := B_expected_var(j+1) XOR G(j);
            END LOOP;

            -- Compare DUT output with expected
            ASSERT (B = B_expected_var)
                REPORT "Mismatch! Gray=" & INTEGER'IMAGE(to_integer(unsigned(G))) &
                       " Expected Binary=" & INTEGER'IMAGE(to_integer(unsigned(B_expected_var))) &
                       " Got=" & INTEGER'IMAGE(to_integer(unsigned(B)))
                SEVERITY ERROR;
        END LOOP;

        -- Report success
        REPORT "All test cases PASSED." SEVERITY NOTE;
        WAIT; -- stop simulation
    END PROCESS;

END Test;