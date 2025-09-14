LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY Decoder3to8_tb IS
END Decoder3to8_tb;

ARCHITECTURE test OF Decoder3to8_tb IS
    SIGNAL A  : STD_LOGIC_VECTOR (2 DOWNTO 0);  -- input address for DUT
    SIGNAL EN : STD_LOGIC;                       -- enable signal for DUT
    SIGNAL Y  : STD_LOGIC_VECTOR (7 DOWNTO 0);  -- output from DUT

BEGIN

    -- Instantiate the DUT
    dut : ENTITY work.Decoder3to8
        PORT MAP(
            A  => A,
            EN => EN,
            Y  => Y
        );

    -- Stimulus process
    stim_proc : PROCESS
    BEGIN
        -- Test with enable = 0 (all outputs should remain 0)
        EN <= '0';
        FOR i IN 1 TO 8 LOOP
            A <= STD_LOGIC_VECTOR(to_unsigned(i, 3));
            WAIT FOR 1 ns;
        END LOOP;

        -- Test with enable = 1 (decoder should activate corresponding output)
        EN <= '1';
        FOR i IN 1 TO 8 LOOP
            A <= STD_LOGIC_VECTOR(to_unsigned(i, 3));
            WAIT FOR 1 ns;
        END LOOP;

        WAIT;  -- stop simulation
    END PROCESS;
END test;