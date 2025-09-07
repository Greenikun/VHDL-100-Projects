LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY HalfAdder_tb IS
END HalfAdder_tb;
--
--
------------------------------------------------
--
--
ARCHITECTURE Test OF HalfAdder_tb IS
    SIGNAL A : STD_LOGIC;
    SIGNAL B : STD_LOGIC;
    SIGNAL S : STD_LOGIC;
    SIGNAL C : STD_LOGIC;


BEGIN
    DuT : ENTITY work.HalfAdder
        PORT MAP(
            A => A,
            B => B,
            S => S,
            C => C
        );

    stim_proc : PROCESS
        VARIABLE expected_S, expected_C : STD_LOGIC; -- for self checking
    BEGIN
        A <= '0';
        B <= '0';
        WAIT FOR 1 ns;
        expected_S := '0';
        expected_C := '0';

        ASSERT (expected_S = S AND expected_C = C)
        REPORT "Error: Half Adder failed for inputs A=" & STD_LOGIC'image(A) & " B=" & STD_LOGIC'image(B)
            SEVERITY error;
        --------------------------------
        A <= '0';
        B <= '1';
        expected_S := '1';
        expected_C := '0';
        WAIT FOR 1 ns;
        ASSERT (expected_S = S AND expected_C = C)
        REPORT "Error: Half Adder failed for inputs A=" & STD_LOGIC'image(A) & " B=" & STD_LOGIC'image(B)
            SEVERITY error;
        --------------------------------
        A <= '1';
        B <= '0';
        expected_S := '1';
        expected_C := '0';
        WAIT FOR 1 ns;
        ASSERT (expected_S = S AND expected_C = C)
        REPORT "Error: Half Adder failed for inputs A=" & STD_LOGIC'image(A) & " B=" & STD_LOGIC'image(B)
            SEVERITY error;
        --------------------------------
        A <= '1';
        B <= '1';
        expected_S := '0';
        expected_C := '1';
        WAIT FOR 1 ns;
        ASSERT (expected_S = S AND expected_C = C)
        REPORT "Error: Half Adder failed for inputs A=" & STD_LOGIC'image(A) & " B=" & STD_LOGIC'image(B)
            SEVERITY error;
        WAIT;
    END PROCESS;
END Test;