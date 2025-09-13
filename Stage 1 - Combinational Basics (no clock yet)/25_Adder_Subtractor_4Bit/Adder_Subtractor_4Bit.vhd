LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

-- ========================
-- Top-level 4-bit Adder-Subtractor
-- ========================
ENTITY Adder_Subtractor_4Bit IS
    PORT (
        A      : IN  STD_LOGIC_VECTOR(3 DOWNTO 0); -- 4-bit input A
        B      : IN  STD_LOGIC_VECTOR(3 DOWNTO 0); -- 4-bit input B
        Sub    : IN  STD_LOGIC;                     -- Control: 0 = Add, 1 = Subtract
        S      : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); -- 4-bit sum/difference output
        CB_out : OUT STD_LOGIC                      -- Carry-out (addition) / Borrow-out (subtraction)
    );
END Adder_Subtractor_4Bit;

ARCHITECTURE Behaviour OF Adder_Subtractor_4Bit IS
    -- Carry/Borrow propagation chain: CB_chain(0) is initial carry/borrow, CB_chain(4) is final carry/borrow
    SIGNAL CB_chain : STD_LOGIC_VECTOR(4 DOWNTO 0);

    -- Modified B for subtraction (B XOR Sub)
    SIGNAL B_mod : STD_LOGIC_VECTOR(3 DOWNTO 0);

    -- Full Adder Component Declaration
    COMPONENT FullAdder IS
        PORT (
            A_1bit   : IN  STD_LOGIC; -- 1-bit input A
            B_1bit   : IN  STD_LOGIC; -- 1-bit input B (or modified for subtraction)
            Cin_1bit : IN  STD_LOGIC; -- Carry-in / Borrow-in
            S_1bit   : OUT STD_LOGIC; -- 1-bit sum/difference output
            Cout_1bit: OUT STD_LOGIC  -- Carry-out / Borrow-out
        );
    END COMPONENT;

BEGIN
    -- ================================
    -- Prepare B_mod for subtraction
    -- If Sub = 1, B is complemented (B XOR 1 = ~B)
    -- If Sub = 0, B_mod = B (B XOR 0 = B)
    -- ================================
    B_mod(0) <= B(0) XOR Sub;
    B_mod(1) <= B(1) XOR Sub;
    B_mod(2) <= B(2) XOR Sub;
    B_mod(3) <= B(3) XOR Sub;

    -- Initial carry-in = Sub (0 for addition, 1 for subtraction to implement two's complement)
    CB_chain(0) <= Sub;

    -- ================================
    -- Instantiate 4 Full Adders
    -- Each Full Adder handles one bit, chain carries/borrows through CB_chain
    -- ================================
    FAS0 : FullAdder PORT MAP(
        A_1bit   => A(0),
        B_1bit   => B_mod(0),
        Cin_1bit => CB_chain(0),
        S_1bit   => S(0),
        Cout_1bit=> CB_chain(1)
    );

    FAS1 : FullAdder PORT MAP(
        A_1bit   => A(1),
        B_1bit   => B_mod(1),
        Cin_1bit => CB_chain(1),
        S_1bit   => S(1),
        Cout_1bit=> CB_chain(2)
    );

    FAS2 : FullAdder PORT MAP(
        A_1bit   => A(2),
        B_1bit   => B_mod(2),
        Cin_1bit => CB_chain(2),
        S_1bit   => S(2),
        Cout_1bit=> CB_chain(3)
    );

    FAS3 : FullAdder PORT MAP(
        A_1bit   => A(3),
        B_1bit   => B_mod(3),
        Cin_1bit => CB_chain(3),
        S_1bit   => S(3),
        Cout_1bit=> CB_chain(4)
    );

    -- Output final carry/borrow
    CB_out <= CB_chain(4);

END Behaviour;

-- ========================
-- 1-bit Full Adder
-- ========================
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY FullAdder IS
    PORT (
        A_1bit   : IN  STD_LOGIC;  -- 1-bit input A
        B_1bit   : IN  STD_LOGIC;  -- 1-bit input B
        Cin_1bit : IN  STD_LOGIC;  -- Carry-in / Borrow-in
        S_1bit   : OUT STD_LOGIC;  -- 1-bit sum/difference
        Cout_1bit: OUT STD_LOGIC   -- Carry-out / Borrow-out
    );
END FullAdder;

ARCHITECTURE Behaviour OF FullAdder IS
BEGIN
    -- Compute sum/difference
    S_1bit    <= A_1bit XOR B_1bit XOR Cin_1bit;

    -- Compute carry-out / borrow-out
    Cout_1bit <= (A_1bit AND B_1bit) OR (B_1bit AND Cin_1bit) OR (Cin_1bit AND A_1bit);
END Behaviour;