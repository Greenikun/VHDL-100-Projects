LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL; -- Needed for to_unsigned conversion

-- Testbench for 4-bit subtractor
ENTITY Subtractor_4Bit_tb IS
END Subtractor_4Bit_tb;

ARCHITECTURE Test OF Subtractor_4Bit_tb IS
    -- Signals to connect to DUT
    SIGNAL A : STD_LOGIC_VECTOR(3 DOWNTO 0);   -- Minuend input
    SIGNAL B : STD_LOGIC_VECTOR(3 DOWNTO 0);   -- Subtrahend input
    SIGNAL D : STD_LOGIC_VECTOR(3 DOWNTO 0);   -- Difference output
    SIGNAL Bout : STD_LOGIC;                   -- Borrow output
BEGIN
    -- Instantiate the Device Under Test (DUT)
    DuT : ENTITY work.Subtractor_4Bit
        PORT MAP(
            A => A,
            B => B,
            D => D,
            Bout => Bout
        );

    -- Stimulus process: applies all input combinations and checks results
    stim_proc : PROCESS
        VARIABLE expected_D : STD_LOGIC_VECTOR(3 DOWNTO 0); -- Expected difference
        VARIABLE expected_Bout : STD_LOGIC;                 -- Expected borrow
        VARIABLE mismatch_found : BOOLEAN := FALSE;        -- Flag to track errors
    BEGIN
        -- Loop over all possible A and B combinations (4-bit)
        FOR i IN 0 TO 15 LOOP
            A <= STD_LOGIC_VECTOR(to_unsigned(i, 4));
            FOR j IN 0 TO 15 LOOP
                B <= STD_LOGIC_VECTOR(to_unsigned(j, 4));
                WAIT FOR 1 ns;  -- Small delay to allow signals to propagate

                -- Compute expected results
                expected_D := STD_LOGIC_VECTOR(to_unsigned(((i - j) MOD 16), 4));
                IF i < j THEN
                    expected_Bout := '1';
                ELSE
                    expected_Bout := '0';
                END IF;

                -- Check if DUT output matches expected
                IF D /= expected_D OR expected_Bout /= Bout THEN
                    mismatch_found := TRUE;
                    REPORT "Mismatch for A=" & INTEGER'image(i) &
                           " B=" & INTEGER'image(j)
                           SEVERITY ERROR;
                END IF;
            END LOOP;
        END LOOP;

        -- Report success if no mismatches found
        IF NOT mismatch_found THEN
            REPORT "All test cases passed successfully!" SEVERITY NOTE;
        END IF;

        WAIT; -- Stop simulation
    END PROCESS;

END Test;
