LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY RCA4Bit_tb IS
END RCA4Bit_tb;

ARCHITECTURE Test OF RCA4Bit_tb IS
    SIGNAL A : STD_LOGIC_VECTOR(3 DOWNTO 0); -- 4-bit input for DUT
    SIGNAL B : STD_LOGIC_VECTOR(3 DOWNTO 0); -- 4-bit input for DUT
    SIGNAL Cin : STD_LOGIC; -- Carry-in for DUT
    SIGNAL S : STD_LOGIC_VECTOR(3 DOWNTO 0); -- Sum output from DUT
    SIGNAL Cout : STD_LOGIC; -- Carry-out from DUT
BEGIN
    -- Instantiate DUT
    DuT : ENTITY work.RCA4Bit
        PORT MAP(
            A => A,
            B => B,
            Cin => Cin,
            S => S,
            Cout => Cout
        );

    stim_proc : PROCESS
        --  VARIABLE expected_S        : STD_LOGIC_VECTOR(3 DOWNTO 0); -- Expected 4-bit sum
        --   VARIABLE expected_Cout     : STD_LOGIC;                     -- Expected carry-out
        --   VARIABLE expected_sum      : UNSIGNED(4 DOWNTO 0);
    BEGIN
        FOR i IN 0 TO 15 LOOP
            A <= STD_LOGIC_VECTOR(to_unsigned(i, 4));
            B <= STD_LOGIC_VECTOR(to_unsigned(i, 4));
            Cin <= '0';
            WAIT FOR 1 ns;
        END LOOP;
        WAIT;
    END PROCESS;
END Test;