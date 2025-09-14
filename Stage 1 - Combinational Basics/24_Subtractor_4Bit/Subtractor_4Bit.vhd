LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

-- 4-bit Subtractor top-level entity
ENTITY Subtractor_4Bit IS
    PORT (
        A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);  -- Minuend input
        B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);  -- Subtrahend input
        D : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); -- Difference output
        Bout : OUT STD_LOGIC                  -- Final borrow output
    );
END Subtractor_4Bit;

ARCHITECTURE Behavioural OF Subtractor_4Bit IS
    -- Declare the 1-bit Full Subtractor component
    COMPONENT FullSubtractor IS
        PORT (
            A_1bit : IN STD_LOGIC;    -- Single bit from A
            B_1bit : IN STD_LOGIC;    -- Single bit from B
            Bin_1bit : IN STD_LOGIC;  -- Borrow-in from previous stage
            D_1bit : OUT STD_LOGIC;   -- Single-bit difference output
            Bout_1bit : OUT STD_LOGIC -- Borrow-out to next stage
        );
    END COMPONENT;

    SIGNAL borrow_chain : STD_LOGIC_VECTOR(4 DOWNTO 0); -- Borrow propagation chain
BEGIN
    borrow_chain(0) <= '0'; -- Initial borrow-in is 0

    -- Instantiate Full Subtractors for each bit, connecting borrow chain
    FS0 : FullSubtractor PORT MAP(
        A_1bit => A(0),
        B_1bit => B(0),
        Bin_1bit => borrow_chain(0),
        D_1bit => D(0),
        Bout_1bit => borrow_chain(1)
    );
    FS1 : FullSubtractor PORT MAP(
        A_1bit => A(1),
        B_1bit => B(1),
        Bin_1bit => borrow_chain(1),
        D_1bit => D(1),
        Bout_1bit => borrow_chain(2)
    );
    FS2 : FullSubtractor PORT MAP(
        A_1bit => A(2),
        B_1bit => B(2),
        Bin_1bit => borrow_chain(2),
        D_1bit => D(2),
        Bout_1bit => borrow_chain(3)
    );
    FS3 : FullSubtractor PORT MAP(
        A_1bit => A(3),
        B_1bit => B(3),
        Bin_1bit => borrow_chain(3),
        D_1bit => D(3),
        Bout_1bit => borrow_chain(4)
    );

    Bout <= borrow_chain(4); -- Final borrow output
END Behavioural;

-- ========================
-- Full Subtractor Module
-- ========================

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

-- 1-bit Full Subtractor entity
ENTITY FullSubtractor IS
    PORT (
        A_1bit : IN STD_LOGIC;    -- Minuend bit
        B_1bit : IN STD_LOGIC;    -- Subtrahend bit
        Bin_1bit : IN STD_LOGIC;  -- Borrow-in
        D_1bit : OUT STD_LOGIC;   -- Difference bit
        Bout_1bit : OUT STD_LOGIC -- Borrow-out
    );
END FullSubtractor;

ARCHITECTURE Behavioural OF FullSubtractor IS
BEGIN
    -- Difference equation: D = A XOR B XOR Bin
    D_1bit <= A_1bit XOR B_1bit XOR Bin_1bit;

    -- Borrow-out equation: Bout = (~A AND B) OR ((~(A XOR B)) AND Bin)
    Bout_1bit <= (NOT A_1bit AND B_1bit) OR (NOT (A_1bit XOR B_1bit) AND Bin_1bit);
END Behavioural;