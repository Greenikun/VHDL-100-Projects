LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

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
    BEGIN
        FOR i IN 0 TO 7 LOOP
            vec := STD_LOGIC_VECTOR(to_unsigned(i, 3));
            A <= vec(2);
            B <= vec(1);
            Cin <= vec(0);
            WAIT FOR 1 ns;
        END LOOP;
        WAIT;
    END stim_proc PROCESS;
END Test;