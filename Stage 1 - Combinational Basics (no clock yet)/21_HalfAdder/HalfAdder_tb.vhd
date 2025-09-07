LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY HalfAdder_tb IS
END HalfAdder_tb;

ARCHITECTURE Test OF HalfAdder_tb IS
    SIGNAL A, B, S, C : STD_LOGIC; -- Signals to connect to HalfAdder
BEGIN
    DuT : ENTITY work.HalfAdder
        PORT MAP(
            A => A,
            B => B,
            S => S,
            C => C
        );

    stim_proc : PROCESS
        VARIABLE expected_S, expected_C : STD_LOGIC; -- Used for self-checking outputs
    BEGIN
        -- Test 0 + 0
        A <= '0';
        B <= '0';
        expected_S := '0';
        expected_C := '0';
        WAIT FOR 1 ns;
        ASSERT (expected_S = S AND expected_C = C)
        REPORT "Error: Half Adder failed for A=0 B=0" SEVERITY ERROR;

        -- Test 0 + 1
        A <= '0';
        B <= '1';
        expected_S := '1';
        expected_C := '0';
        WAIT FOR 1 ns;
        ASSERT (expected_S = S AND expected_C = C)
        REPORT "Error: Half Adder failed for A=0 B=1" SEVERITY ERROR;

        -- Test 1 + 0
        A <= '1';
        B <= '0';
        expected_S := '1';
        expected_C := '0';
        WAIT FOR 1 ns;
        ASSERT (expected_S = S AND expected_C = C)
        REPORT "Error: Half Adder failed for A=1 B=0" SEVERITY ERROR;

        -- Test 1 + 1
        A <= '1';
        B <= '1';
        expe