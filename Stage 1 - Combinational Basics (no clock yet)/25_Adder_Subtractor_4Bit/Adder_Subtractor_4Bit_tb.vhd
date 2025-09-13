LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY Adder_Subtractor_4Bit_tb IS
END Adder_Subtractor_4Bit_tb;

ARCHITECTURE Test OF Adder_Subtractor_4Bit_tb IS
    SIGNAL A      : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL B      : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL Sub    : STD_LOGIC;
    SIGNAL S      : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL CB_out : STD_LOGIC;
BEGIN

    -- Instantiate the 4-bit Adder-Subtractor
    DuT : ENTITY work.Adder_Subtractor_4Bit
        PORT MAP(
            A      => A,
            B      => B,
            Sub    => Sub,
            S      => S,
            CB_out => CB_out
        );

    stim_proc : PROCESS
        VARIABLE expected_S      : INTEGER;
        VARIABLE expected_CB_out : INTEGER;
        VARIABLE error_flag      : BOOLEAN := FALSE;  -- Tracks if any mismatch occurs
    BEGIN
        -- ================================
        -- Addition Test
        -- ================================
        Sub <= '0';
        FOR i IN 0 TO 15 LOOP
            A <= STD_LOGIC_VECTOR(to_unsigned(i, 4));
            FOR j IN 0 TO 15 LOOP
                B <= STD_LOGIC_VECTOR(to_unsigned(j, 4));

                -- Calculate expected sum and carry
                expected_S := i + j;
                IF expected_S > 15 THEN
                    expected_CB_out := 1;
                    expected_S := expected_S MOD 16;  -- wrap-around 4-bit result
                ELSE
                    expected_CB_out := 0;
                END IF;

                WAIT FOR 1 ns;  -- allow signals to propagate

                -- Check DUT output against expected values
                IF to_integer(unsigned(S)) /= expected_S OR
                   ((CB_out = '1') AND expected_CB_out = 0) OR
                   ((CB_out = '0') AND expected_CB_out = 1) THEN
                    REPORT "Mismatch: A=" & INTEGER'image(i) &
                           " B=" & INTEGER'image(j) &
                           " S=" & INTEGER'image(to_integer(unsigned(S))) &
                           " Expected_S=" & INTEGER'image(expected_S) &
                           " CB_out=" & STD_LOGIC'image(CB_out)
                           SEVERITY ERROR;
                    error_flag := TRUE;  -- mark that an error occurred
                END IF;

            END LOOP;
        END LOOP;

        -- ================================
        -- Subtraction Test
        -- ================================
        Sub <= '1';
        FOR i IN 0 TO 15 LOOP
            A <= STD_LOGIC_VECTOR(to_unsigned(i, 4));
            FOR j IN 0 TO 15 LOOP
                B <= STD_LOGIC_VECTOR(to_unsigned(j, 4));

                -- Calculate expected difference and borrow
                expected_S := i - j;
                IF expected_S < 0 THEN
                    expected_S := expected_S + 16;  -- wrap-around 4-bit result
                    expected_CB_out := 1;           -- borrow
                ELSE
                    expected_CB_out := 0;
                END IF;

                WAIT FOR 1 ns;

                -- Check DUT output against expected values
                IF to_integer(unsigned(S)) /= expected_S OR
                   ((CB_out = '1') AND expected_CB_out = 0) OR
                   ((CB_out = '0') AND expected_CB_out = 1) THEN
                    REPORT "Mismatch: A=" & INTEGER'image(i) &
                           " B=" & INTEGER'image(j) &
                           " S=" & INTEGER'image(to_integer(unsigned(S))) &
                           " Expected_S=" & INTEGER'image(expected_S) &
                           " CB_out=" & STD_LOGIC'image(CB_out)
                           SEVERITY ERROR;
                    error_flag := TRUE;  -- mark that an error occurred
                END IF;

            END LOOP;
        END LOOP;

        -- ================================
        -- Success Message
        -- ================================
        IF error_flag = FALSE THEN
            REPORT "All addition and subtraction test cases passed successfully!" 
                   SEVERITY NOTE;
        END IF;

        WAIT;  -- stop simulation
    END PROCESS;
END Test;