LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY PriorityEncoder8to3_tb IS
END PriorityEncoder8to3_tb;

-------------------------------------------------------
ARCHITECTURE test OF PriorityEncoder8to3_tb IS
    -- signals to connect to the DUT
    SIGNAL A : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL Y : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL V : STD_LOGIC;
BEGIN
    -- Instantiate the DUT
    uut : ENTITY work.PriorityEncoder8to3
        PORT MAP(
            A => A,
            Y => Y,
            V => V
        );

    -- Stimulus process
    stim_proc : PROCESS
    BEGIN

        FOR i IN 7 DOWNTO 0 LOOP
            A <= (OTHERS => '0');
            A(i) <= '1';
            WAIT FOR 1 ns;
        END LOOP;
        -- Test multiple-high inputs (priority check)
        A <= "10101010";
        WAIT FOR 10 ns; -- highest = 7
        A <= "01010101";
        WAIT FOR 10 ns; -- highest = 6
        A <= "00000000";
        WAIT FOR 10 ns; -- no input active
        WAIT;
    END PROCESS;
END test;