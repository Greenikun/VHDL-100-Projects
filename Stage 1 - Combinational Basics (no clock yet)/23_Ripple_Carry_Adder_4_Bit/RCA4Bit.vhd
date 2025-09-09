LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY RCA4Bit IS
    PORT (
        A : IN STD_LOGIC_VECTOR (3 DOWNTO 0);  -- 4-bit input A
        B : IN STD_LOGIC_VECTOR (3 DOWNTO 0);  -- 4-bit input B
        Cin : IN STD_LOGIC;                     -- Carry-in
        S : OUT STD_LOGIC_VECTOR (3 DOWNTO 0); -- 4-bit sum output
        Cout : OUT STD_LOGIC                     -- Carry-out from MSB
    );
END RCA4Bit;

ARCHITECTURE Behaviour OF RCA4Bit IS
    SIGNAL C : STD_LOGIC_VECTOR(4 DOWNTO 0); -- Internal carry signals
BEGIN
    C(0) <= Cin;  -- Connect external carry-in to first adder
    -- Instantiate four 1-bit full adders, cascading carry
    FA0 : ENTITY work.myFullAdder PORT MAP(A(0), B(0), C(0), S(0), C(1));
    FA1 : ENTITY work.myFullAdder PORT MAP(A(1), B(1), C(1), S(1), C(2));
    FA2 : ENTITY work.myFullAdder PORT MAP(A(2), B(2), C(2), S(2), C(3));
    FA3 : ENTITY work.myFullAdder PORT MAP(A(3), B(3), C(3), S(3), C(4));
END Behaviour;