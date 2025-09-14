LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY PriorityEncoder8to3_tb IS
END PriorityEncoder8to3_tb;

-------------------------------------------------------
ARCHITECTURE test OF PriorityEncoder8to3_tb IS
    -- Signals to connect to DUT
    SIGNAL A : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');  -- input
    SIGNAL Y : STD_LOGIC_VECTOR(2 DOWNTO 0);                     -- output from DUT
    SIGNAL V : STD_LOGIC;                                        -- valid flag from DUT
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

        -- Test each single high input for priority detection
        FOR i IN 7 DOWNTO 0 LOOP
            A <= (OTHERS => '0');  -- clear all inputs
            A(i) <= '1';           -- set only current input high
            WAIT FOR 1 ns;
        END LOOP;

        -- Test multiple-high inputs (verify priority of highest index)
        A <= "10101010";  -- highest active input should be 7
        WAIT FOR 10 ns;
        A <= "01010101";  -- highest active input should be 6
        WAIT FOR 10 ns;
        A <= "00000000";  -- no inputs active, V should be 0
        WAIT FOR 10 ns;

        WAIT;  -- stop simulation
    END PROCESS;
END test;