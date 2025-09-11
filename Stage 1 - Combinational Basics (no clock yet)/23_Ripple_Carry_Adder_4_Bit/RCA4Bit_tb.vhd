LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY RCA4Bit_tb IS
END RCA4Bit_tb;

ARCHITECTURE Test OF RCA4Bit_tb IS
    SIGNAL A     : STD_LOGIC_VECTOR(3 DOWNTO 0); -- 4-bit input for DUT
    SIGNAL B     : STD_LOGIC_VECTOR(3 DOWNTO 0); -- 4-bit input for DUT
    SIGNAL Cin   : STD_LOGIC;                     -- Carry-in for DUT
    SIGNAL S     : STD_LOGIC_VECTOR(3 DOWNTO 0); -- Sum output from DUT
    SIGNAL Cout  : STD_LOGIC;                     -- Carry-out from DUT
BEGIN
    -- Instantiate DUT
    DuT : ENTITY work.RCA4Bit
        PORT MAP(
            A    => A,
            B    => B,
            Cin  => Cin,
            S    => S,
            Cout => Cout
        );

    stim_proc : PROCESS
        VARIABLE expected_S        : STD_LOGIC_VECTOR(3 DOWNTO 0); -- Expected 4-bit sum
        VARIABLE expected_Cout     : STD_LOGIC;                     -- Expected carry-out
        VARIABLE expected_loop_sum : unsigned(4 DOWNTO 0);
    BEGIN
        -- Loop through all input combinations
        FOR cin_val IN 0 TO 1 LOOP
            Cin <= STD_LOGIC'val(cin_val);
            FOR i IN 0 TO 15 LOOP
                A <= STD_LOGIC_VECTOR(to_unsigned(i, 4));
                FOR j IN 0 TO 15 LOOP
                    B <= STD_LOGIC_VECTOR(to_unsigned(j, 4));
                    WAIT FOR 1 ns;

                    expected_loop_sum := to_unsigned(i, 5) + to_unsigned(j, 5) + to_unsigned(cin_val, 5);
                    expected_S    := STD_LOGIC_VECTOR(expected_loop_sum(3 DOWNTO 0));
                    expected_Cout := expected_loop_sum(4);

                    -- Check DUT outputs
                    ASSERT (S = expected_S AND Cout = expected_Cout)
                        REPORT "Test Failed! Error at A=" & INTEGER'image(i) &
                               ", B=" & INTEGER'image(j) &
                               ", Cin=" & INTEGER'image(cin_val) &
                               ". Got S=" & INTEGER'image(to_integer(unsigned(S))) &
                               " Cout=" & STD_LOGIC'image(Cout)
                        SEVERITY ERROR;
                END LOOP;
            END LOOP;
        END LOOP;

        -- All tests passed
        REPORT "All tests completed successfully!" SEVERITY NOTE;
        WAIT; -- stop simulation
    END PROCESS;
END Test;