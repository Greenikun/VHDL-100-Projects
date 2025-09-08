LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY FullAdder_tb IS
END FullAdder_tb;
--
--
----------------------------------------------------
--
--
ARCHITECTURE Test OF FullAdder_tb IS
    SIGNAL A : STD_LOGIC := '0';
    SIGNAL B : STD_LOGIC := '0';
    SIGNAL Cin : STD_LOGIC := '0';
    SIGNAL Sum : STD_LOGIC;
    SIGNAL Cout : STD_LOGIC;
BEGIN

    DuT : ENTITY work.FullAdder
        PORT MAP(
            A => A,
            B => B,
            Cin => Cin,
            Sum => Sum,
            Cout => Cout
        );
    stim_proc : PROCESS
        VARIABLE vec : STD_LOGIC_VECTOR(2 DOWNTO 0);
        VARIABLE expected_Sum, expected_Cout : STD_LOGIC;
        VARIABLE curr_A, curr_B, curr_Cin : STD_LOGIC;
    BEGIN
        FOR i IN 0 TO 7 LOOP
            -- store current inputs in variables
            curr_A := vec(2);
            curr_B := vec(1);
            curr_Cin := vec(0);

            A <= curr_A;
            B <= curr_B;
            Cin <= curr_Cin;

            WAIT FOR 1 ns;

            -- expected outputs
            expected_Sum := curr_A XOR curr_B XOR curr_Cin;
            expected_Cout := (curr_A AND curr_B) OR (curr_Cin AND (curr_A XOR curr_B));

            -- assertions
            ASSERT Sum = expected_Sum
            REPORT "Error in Sum at iteration " & INTEGER'image(i)
                SEVERITY ERROR;

            ASSERT Cout = expected_Cout
            REPORT "Error in Cout at iteration " & INTEGER'image(i)
                SEVERITY ERROR;

            REPORT "Test " & INTEGER'image(i) & " passed!" SEVERITY NOTE;
        END LOOP;

        WAIT;
    END PROCESS stim_proc;
END Test;