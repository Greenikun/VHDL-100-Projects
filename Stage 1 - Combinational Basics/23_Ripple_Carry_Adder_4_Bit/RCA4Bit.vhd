LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY RCA4Bit IS
    PORT (
        A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);  -- 4-bit input operand A
        B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);  -- 4-bit input operand B
        Cin : IN STD_LOGIC;                   -- Carry-in input
        S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); -- 4-bit sum output
        Cout : OUT STD_LOGIC                  -- Carry-out output
    );
END RCA4Bit;

ARCHITECTURE Behaviour OF RCA4Bit IS
BEGIN
    PROCESS(A, B, Cin)  -- Combinational process sensitive to inputs
        VARIABLE c : STD_LOGIC_VECTOR(4 DOWNTO 0); -- Internal carry chain
    BEGIN
        -- Initialize carry-in
        c(0) := Cin;

        -- Ripple-carry logic: compute carry propagation
        c(1) := (A(0) AND B(0)) OR (c(0) AND (A(0) XOR B(0)));
        c(2) := (A(1) AND B(1)) OR (c(1) AND (A(1) XOR B(1)));
        c(3) := (A(2) AND B(2)) OR (c(2) AND (A(2) XOR B(2)));
        c(4) := (A(3) AND B(3)) OR (c(3) AND (A(3) XOR B(3)));

        -- Compute sum bits using XOR with carry-in
        S(0) <= A(0) XOR B(0) XOR c(0);
        S(1) <= A(1) XOR B(1) XOR c(1);
        S(2) <= A(2) XOR B(2) XOR c(2);
        S(3) <= A(3) XOR B(3) XOR c(3);

        -- Output final carry-out
        Cout <= c(4);
    END PROCESS;
END Behaviour;
