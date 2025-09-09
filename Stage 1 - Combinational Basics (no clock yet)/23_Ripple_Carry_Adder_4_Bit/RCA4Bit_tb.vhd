LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY RCA4Bit_tb IS
END RCA4Bit_tb;

ARCHITECTURE Test OF RCA4Bit_tb IS
    SIGNAL A : STD_LOGIC_VECTOR(3 DOWNTO 0);  -- 4-bit input for DUT
    SIGNAL B : STD_LOGIC_VECTOR(3 DOWNTO 0);  -- 4-bit input for DUT
    SIGNAL Cin : STD_LOGIC;                     -- Carry-in for DUT
    SIGNAL S : STD_LOGIC_VECTOR(3 DOWNTO 0);   -- Sum output from DUT
    SIGNAL Cout : STD_LOGIC;                    -- Carry-out from DUT
BEGIN
    -- Instantiate DUT
    uut : ENTITY work.RCA4Bit
        PORT MAP(
            A => A,
            B => B,
            Cin => Cin,
            S => S,
            Cout => Cout
        );

    stim_proc : PROCESS
        VARIABLE expected_S : INTEGER;       -- Expected 4-bit sum
        VARIABLE expected_Cout : STD_LOGIC;  -- Expected carry-out
    BEGIN
        -- Loop over Cin = 0 and Cin = 1
        FOR c IN 0 TO 1 LOOP
            Cin <= '0' WHEN c = 0 ELSE '1';

            -- Loop over all 4-bit A and B combinations
            FOR i IN 0 TO 15 LOOP
                A <= STD_LOGIC_VECTOR(to_unsigned(i, 4));
                FOR j IN 0 TO 15 LOOP
                    B <= STD_LOGIC_VECTOR(to_unsigned(j, 4));
                    WAIT FOR 1 ns;

                    -- Self-check: compute expected sum and carry
                    expected_S := (i + j + (0 WHEN Cin = '0' ELSE 1)) MOD 16;
                    expected_Cout := '1' WHEN (i + j + (0 WHEN Cin = '0' ELSE 1)) > 15 ELSE '0';

                    -- Compare DUT output with expected values
                    ASSERT (S = STD_LOGIC_VECTOR(to_unsigned(expected_S, 4))) AND (Cout = expected_Cout)
                    REPORT "Test failed: A=" & INTEGER'image(i) &
                           " B=" & INTEGER'image(j) &
                           " Cin=" & STD_LOGIC'image(Cin)
                    SEVERITY error;
                END LOOP;
            END LOOP;
        END LOOP;

        REPORT "All tests passed!" SEVERITY note;  -- All combinations passed
        WAIT;
    END PROCESS;
END Test;
