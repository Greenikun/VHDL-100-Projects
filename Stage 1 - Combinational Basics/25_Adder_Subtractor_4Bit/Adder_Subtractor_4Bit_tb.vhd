LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Adder_Subtractor_4Bit_tb IS
END Adder_Subtractor_4Bit_tb;

ARCHITECTURE Test OF Adder_Subtractor_4Bit_tb IS
    -- DUT signals
    SIGNAL A, B      : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL Sub       : STD_LOGIC;
    SIGNAL S         : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL CB_out    : STD_LOGIC;

    -- Helper unsigned signals for arithmetic
    SIGNAL A_u, B_u, S_u : unsigned(3 DOWNTO 0);
BEGIN
    -- Convert STD_LOGIC_VECTOR to unsigned
    A_u <= unsigned(A);
    B_u <= unsigned(B);
    S_u <= unsigned(S);

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
        VARIABLE expected_S       : unsigned(3 DOWNTO 0);
        VARIABLE expected_CB_out  : STD_LOGIC;
        VARIABLE temp_result      : unsigned(4 DOWNTO 0); -- extra bit for carry/borrow
    BEGIN
        -- ================================
        -- Addition Test
        -- ================================
        Sub <= '0';
        FOR i IN 0 TO 15 LOOP
            A <= std_logic_vector(to_unsigned(i,4));
            FOR j IN 0 TO 15 LOOP
                B <= std_logic_vector(to_unsigned(j,4));
                WAIT FOR 1 ns;

                -- Compute expected sum
                temp_result := resize(A_u,5) + resize(B_u,5); -- 5 bits to catch carry
                expected_CB_out := temp_result(4);            -- carry out
                expected_S := temp_result(3 DOWNTO 0);        -- lower 4 bits

                -- Check results
                IF S_u /= expected_S THEN
                    REPORT "Addition mismatch: A=" & integer'image(i) &
                           " B=" & integer'image(j) &
                           " S=" & integer'image(to_integer(S_u)) &
                           " Expected=" & integer'image(to_integer(expected_S));
                END IF;

                IF CB_out /= expected_CB_out THEN
                    REPORT "Addition carry mismatch: A=" & integer'image(i) &
                           " B=" & integer'image(j) &
                           " CB_out=" & STD_LOGIC'image(CB_out) &
                           " Expected=" & STD_LOGIC'image(expected_CB_out);
                END IF;
            END LOOP;
        END LOOP;

        -- ================================
        -- Subtraction Test
        -- ================================
        Sub <= '1';
        FOR i IN 0 TO 15 LOOP
            A <= std_logic_vector(to_unsigned(i,4));
            FOR j IN 0 TO 15 LOOP
                B <= std_logic_vector(to_unsigned(j,4));
                WAIT FOR 1 ns;

                -- Compute expected difference
                temp_result := resize(A_u,5) - resize(B_u,5); -- 5 bits to catch borrow
                expected_CB_out := not temp_result(4);            -- borrow flag
                expected_S := temp_result(3 DOWNTO 0);        -- lower 4 bits

                -- Check results
                IF S_u /= expected_S THEN
                    REPORT "Subtraction mismatch: A=" & integer'image(i) &
                           " B=" & integer'image(j) &
                           " S=" & integer'image(to_integer(S_u)) &
                           " Expected=" & integer'image(to_integer(expected_S));
                END IF;

                IF CB_out /= expected_CB_out THEN
                    REPORT "Subtraction borrow mismatch: A=" & integer'image(i) &
                           " B=" & integer'image(j) &
                           " CB_out=" & STD_LOGIC'image(CB_out) &
                           " Expected=" & STD_LOGIC'image(expected_CB_out);
                END IF;
            END LOOP;
        END LOOP;

        WAIT; -- stop simulation
    END PROCESS;
END Test;
