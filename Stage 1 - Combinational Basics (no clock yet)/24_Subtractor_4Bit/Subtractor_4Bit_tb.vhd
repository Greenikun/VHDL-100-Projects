LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;  -- Needed for to_unsigned

ENTITY Subtractor_4Bit_tb IS
END Subtractor_4Bit_tb;

ARCHITECTURE Test OF Subtractor_4Bit_tb IS
    SIGNAL A : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL B : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL D : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL Bout : STD_LOGIC;
BEGIN
    -- Instantiate DUT
    DuT : ENTITY work.Subtractor_4Bit
        PORT MAP(
            A => A,
            B => B,
            D => D,
            Bout => Bout
        );

    -- Stimulus process
    stim_proc : PROCESS
    BEGIN
        FOR i IN 0 TO 15 LOOP
            A <= STD_LOGIC_VECTOR(to_unsigned(i, 4));
            FOR j IN 0 TO 15 LOOP
                B <= STD_LOGIC_VECTOR(to_unsigned(j, 4));
                WAIT FOR 1 ns;
            END LOOP;
        END LOOP;
        WAIT;  -- Stop simulation
    END PROCESS;
END Test;
