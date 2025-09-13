LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

-- ========================
-- Top-level 4-bit Adder-Subtractor
-- ========================
ENTITY Adder_Subtractor_4Bit IS
    PORT (
        A      : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        B      : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        Sub    : IN  STD_LOGIC;  -- 0 = Add, 1 = Subtract
        S      : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        CB_out : OUT STD_LOGIC     -- carry-out / borrow-out
    );
END Adder_Subtractor_4Bit;

ARCHITECTURE Behaviour OF Adder_Subtractor_4Bit IS
    -- Carry/Borrow chain
    SIGNAL CB_chain : STD_LOGIC_VECTOR(4 DOWNTO 0);

    -- Modified B (B XOR Sub)
    SIGNAL B_mod : STD_LOGIC_VECTOR(3 DOWNTO 0);

    -- Full Adder Component
    COMPONENT FullAdder IS
        PORT (
            A_1bit   : IN  STD_LOGIC;
            B_1bit   : IN  STD_LOGIC;
            Cin_1bit : IN  STD_LOGIC;
            S_1bit   : OUT STD_LOGIC;
            Cout_1bit: OUT STD_LOGIC
        );
    END COMPONENT;

BEGIN
    -- Prepare modified B for subtraction
    B_mod(0) <= B(0) XOR Sub;
    B_mod(1) <= B(1) XOR Sub;
    B_mod(2) <= B(2) XOR Sub;
    B_mod(3) <= B(3) XOR Sub;

    -- Initial carry-in = Sub (0 for add, 1 for subtract)
    CB_chain(0) <= Sub;

    -- Instantiate 4 Full Adders
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

    -- Output carry/borrow
    CB_out <= CB_chain(4);

END Behaviour;

-- ========================
-- 1-bit Full Adder
-- ========================
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY FullAdder IS
    PORT (
        A_1bit   : IN  STD_LOGIC;
        B_1bit   : IN  STD_LOGIC;
        Cin_1bit : IN  STD_LOGIC;
        S_1bit   : OUT STD_LOGIC;
        Cout_1bit: OUT STD_LOGIC
    );
END FullAdder;

ARCHITECTURE Behaviour OF FullAdder IS
BEGIN
    S_1bit    <= A_1bit XOR B_1bit XOR Cin_1bit;
    Cout_1bit <= (A_1bit AND B_1bit) OR (B_1bit AND Cin_1bit) OR (Cin_1bit AND A_1bit);
END Behaviour;