LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY RCA4Bit_tb IS
END RCA4Bit_tb;

ARCHITECTURE Test OF RCA4Bit_tb IS
    -- Signals to connect to DUT
    SIGNAL A    : STD_LOGIC_VECTOR(3 DOWNTO 0); -- Operand A
    SIGNAL B    : STD_LOGIC_VECTOR(3 DOWNTO 0); -- Operand B
    SIGNAL Cin  : STD_LOGIC;                    -- Carry-in
    SIGNAL S    : STD_LOGIC_VECTOR(3 DOWNTO 0); -- Sum output
    SIGNAL Cout : STD_LOGIC;                    -- Carry-out
BEGIN
    -- Instantiate Device Under Test (DUT)
    DuT : ENTITY work.RCA4Bit
        PORT MAP(
            A => A,
            B => B,
            Cin => Cin,
            S => S,
            Cout => Cout
        );

    -- Stimulus and verification process
    stim_proc : PROCESS
        VARIABLE expected_S    : STD_LOGIC_VECTOR(4 DOWNTO 0); -- Expected sum (5 bits: sum + carry)
        VARIABLE expected_Cout : STD_LOGIC;                    -- Expected carry-out
        VARIABLE error_count   : INTEGER := 0;                 -- Counter for errors
    BEGIN
        -- Loop through all input combinations of A and B
        FOR i IN 0 TO 15 LOOP
            A   <= STD_LOGIC_VECTOR(to_unsigned(i, 4));
            Cin <= '0'; -- Test only Cin = 0 here

            FOR j IN 0 TO 15 LOOP
                B <= STD_LOGIC_VECTOR(to_unsigned(j, 4));

                -- Compute expected result
                expected_S := STD_LOGIC_VECTOR(to_unsigned(i + j, 5));

                -- Expected carry based on overflow
                IF (i + j) > 15 THEN
                    expected_Cout := '1';
                ELSE
                    expected_Cout := '0';
                END IF;

                WAIT FOR 1 ns; -- Allow DUT to update

                -- Compare sum output with expected value
                IF S /= expected_S(3 DOWNTO 0) THEN
                    REPORT "SUM mismatch: A=" & INTEGER'image(i) &
                           " B=" & INTEGER'image(j) &
                           " Expected=" & INTEGER'image(to_integer(unsigned(expected_S(3 DOWNTO 0)))) &
                           " Got=" & INTEGER'image(to_integer(unsigned(S)))
                           SEVERITY ERROR;
                    error_count := error_count + 1;
                END IF;

                -- Compare carry-out with expected carry
                IF Cout /= expected_Cout THEN
                    REPORT "CARRY mismatch: A=" & INTEGER'image(i) &
                           " B=" & INTEGER'image(j) &
                           " Expected=" & STD_LOGIC'image(expected_Cout) &
                           " Got=" & STD_LOGIC'image(Cout)
                           SEVERITY ERROR;
                    error_count := error_count + 1;
                END IF;
            END LOOP;
        END LOOP;

        -- Final report after all tests
        IF error_count = 0 THEN
            REPORT "All test cases passed successfully!" SEVERITY NOTE;
        ELSE
            REPORT "Simulation finished with " & INTEGER'image(error_count) & " errors." SEVERITY ERROR;
        END IF;

        WAIT; -- End simulation
    END PROCESS;
END Test;