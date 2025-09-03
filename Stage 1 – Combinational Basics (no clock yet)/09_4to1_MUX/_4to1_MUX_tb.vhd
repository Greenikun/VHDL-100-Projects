LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY MUX4to1_tb IS
END MUX4to1_tb;

ARCHITECTURE test OF MUX4to1_tb IS
    -- Signals to drive the DUT
    SIGNAL A, B, C, D, Y : STD_LOGIC := '0';
    SIGNAL S : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
BEGIN
    -- Instantiate DUT
    uut : ENTITY work.MUX4to1
        PORT MAP(
            A => A,
            B => B,
            C => C,
            D => D,
            S => S,
            Y => Y
        );

    -- Stimulus process
    stim_proc : PROCESS
        VARIABLE inputs : STD_LOGIC_VECTOR(3 DOWNTO 0);
    BEGIN
        -- Check manually first
        A <= '1'; B <= '0'; C <= '1'; D <= '0'; S <= "00"; WAIT FOR 10 ns;
        S <= "01"; WAIT FOR 10 ns;
        S <= "10"; WAIT FOR 10 ns;
        S <= "11"; WAIT FOR 10 ns;

        -- Automatic exhaustive testing
        FOR s_int IN 0 TO 3 LOOP
            FOR i IN 0 TO 15 LOOP
                inputs := STD_LOGIC_VECTOR(to_unsigned(i, 4));
                A <= inputs(3);
                B <= inputs(2);
                C <= inputs(1);
                D <= inputs(0);
                S <= STD_LOGIC_VECTOR(to_unsigned(s_int, 2));
                WAIT FOR 1 ns;  -- longer for readability
            END LOOP;
        END LOOP;

        WAIT;  -- stop simulation
    END PROCESS;
END test;

