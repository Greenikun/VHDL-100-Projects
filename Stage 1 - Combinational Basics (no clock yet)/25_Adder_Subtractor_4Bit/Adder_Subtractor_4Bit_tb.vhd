LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;


ENTITY Adder_Subtractor_4Bit_tb IS
END Adder_Subtractor_4Bit_tb;

ARCHITECTURE Test OF Adder_Subtractor_4Bit_tb IS
    SIGNAL A : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL B : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL Sub : STD_LOGIC;
    SIGNAL S : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL CB_out : STD_LOGIC;
BEGIN

    DuT : ENTITY work.Adder_Subtractor_4Bit
        PORT MAP(
            A => A,
            B => B,
            Sub => Sub,
            S => S,
            CB_out => CB_out
        );

    stim_proc : PROCESS
    
    BEGIN
        -- Addition
        Sub <= '0';
        FOR i IN 0 TO 15 LOOP
            A <= STD_LOGIC_VECTOR(to_unsigned(i, 4));
            FOR j IN 0 TO 15 LOOP
                B <= STD_LOGIC_VECTOR(to_unsigned(j, 4));
                WAIT FOR 1 ns;
            END LOOP;
        END LOOP;
        -- Subtraction
        Sub <= '1';
        FOR i IN 0 TO 15 LOOP
            A <= STD_LOGIC_VECTOR(to_unsigned(i, 4));
            FOR j IN 0 TO 15 LOOP
                B <= STD_LOGIC_VECTOR(to_unsigned(j, 4));
                WAIT FOR 1 ns;
            END LOOP;
        END LOOP;
        WAIT;
    END PROCESS;
END Test;