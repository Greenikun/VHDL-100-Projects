LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY RCA4Bit IS
    PORT (
        A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        Cin : IN STD_LOGIC;
        S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        Cout : OUT STD_LOGIC
    );
END RCA4Bit;

ARCHITECTURE Behaviour OF RCA4Bit IS
BEGIN
    PROCESS(A, B, Cin)
        VARIABLE c : STD_LOGIC_VECTOR(4 DOWNTO 0);
    BEGIN
        c(0) := Cin;

        c(1) := (A(0) AND B(0)) OR (c(0) AND (A(0) XOR B(0)));
        c(2) := (A(1) AND B(1)) OR (c(1) AND (A(1) XOR B(1)));
        c(3) := (A(2) AND B(2)) OR (c(2) AND (A(2) XOR B(2)));
        c(4) := (A(3) AND B(3)) OR (c(3) AND (A(3) XOR B(3)));

        S(0) <= A(0) XOR B(0) XOR c(0);
        S(1) <= A(1) XOR B(1) XOR c(1);
        S(2) <= A(2) XOR B(2) XOR c(2);
        S(3) <= A(3) XOR B(3) XOR c(3);

        Cout <= c(4);
    END PROCESS;
END Behaviour;
