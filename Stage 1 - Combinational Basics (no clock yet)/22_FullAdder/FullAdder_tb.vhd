LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY FullAdder_tb IS
END FullAdder_tb;

----------------------------------------------------
ARCHITECTURE Test OF FullAdder_tb IS
    SIGNAL A, B, Cin  : STD_LOGIC;
    SIGNAL Sum, Cout  : STD_LOGIC;
BEGIN

    -- Instantiate the DUT
    DuT : ENTITY work.FullAdder
        PORT MAP(
            A    => A,
            B    => B,
            Cin  => Cin,
            Sum  => Sum,
            Cout => Cout
        );

    -- Stimulus and self-check process
    stim_proc : PROCESS
        VARIABLE vec : STD_LOGIC_VECTOR(2 DOWNTO 0);
        VARIABLE expected_Sum, expected_Cout : STD_LOGIC;
    BEGIN
        -- Loop through all 8 input combinations (A,B,Cin)
        FOR i IN 0 TO 7 LOOP
            vec := STD_LOGIC_VECTOR(to_unsigned(i, 3));

            -- Drive DUT inputs
            A   <= vec(2);
            B   <= vec(1);
            Cin <= vec(0);

            WAIT FOR 1 ns;  -- allow DUT outputs to update

            -- Compute expected outputs
            expected_Sum  := vec(2) XOR vec(1) XOR vec(0);
            expected_Cout := (vec(2) AND vec(1)) OR (vec(0) AND (vec(2) XOR vec(1)));

            -- Assertions to check correctness
            ASSERT Sum = expected_Sum
                REPORT "Error in Sum at input " & STD_LOGIC'IMAGE(vec(2)) & STD_LOGIC'IMAGE(vec(1)) & STD_LOGIC'IMAGE(vec(0))
                SEVERITY ERROR;

            ASSERT Cout = expected_Cout
                REPORT "Error in Cout at input " & STD_LOGIC'IMAGE(vec(2)) & STD_LOGIC'IMAGE(vec(1)) & STD_LOGIC'IMAGE(vec(0))
                SEVERITY ERROR;

            REPORT "Test " & integer'image(i) & " passed!" SEVERITY NOTE;
        END LOOP;

        WAIT; -- stop simulation
    END PROCESS stim_proc;

END Test;