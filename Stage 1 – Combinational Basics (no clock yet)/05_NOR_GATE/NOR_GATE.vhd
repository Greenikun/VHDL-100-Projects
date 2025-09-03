LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY NOR_GATE IS
    PORT (
        A : IN STD_LOGIC;
        B : IN STD_LOGIC;
        Y : OUT STD_LOGIC
    );

END NOR_GATE;

ARCHITECTURE Behavioural OF NOR_GATE IS

BEGIN

    y <= A NOR b;
END Behavioural;