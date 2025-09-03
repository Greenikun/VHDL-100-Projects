LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY Decoder3to8_tb IS
END Decoder3to8_tb;

ARCHITECTURE test OF Decoder3to8_tb IS
    SIGNAL A : STD_LOGIC_VECTOR (2 DOWNTO 0);
    SIGNAL EN : STD_LOGIC;
    SIGNAL Y : STD_LOGIC_VECTOR (7 DOWNTO 0);

BEGIN

    dut : ENTITY work.Decoder3to8
        PORT MAP(
            A => A,
            EN => EN,
            Y => Y
        );

    stim_proc : PROCESS
    BEGIN
        EN <= '0';
        FOR i IN 1 TO 8 LOOP
            A <= STD_LOGIC_VECTOR(to_unsigned(i, 3));
            WAIT FOR 1 ns;
        END LOOP;
        --
        EN <= '1';
        FOR i IN 1 TO 8 LOOP
            A <= STD_LOGIC_VECTOR(to_unsigned(i, 3));
            WAIT FOR 1 ns;
        END LOOP;
        WAIT;
    END PROCESS;
END test;