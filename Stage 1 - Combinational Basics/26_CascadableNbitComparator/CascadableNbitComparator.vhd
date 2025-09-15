LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY CascadableNbitComparator IS
    GENERIC (
        N : INTEGER := 8 -- width of this slice
    );
    PORT (
        a, b : IN STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
        eq_in : IN STD_LOGIC; -- from lower bits
        gt_in : IN STD_LOGIC;
        lt_in : IN STD_LOGIC;
        eq_out : OUT STD_LOGIC; -- to higher bits
        gt_out : OUT STD_LOGIC;
        lt_out : OUT STD_LOGIC
    );
END CascadableNbitComparator;

ARCHITECTURE Behavioral OF CascadableNbitComparator IS
    SIGNAL a_unsigned : unsigned(N - 1 DOWNTO 0);
    SIGNAL b_unsigned : unsigned(N - 1 DOWNTO 0);
    SIGNAL eq_self : STD_LOGIC;
    SIGNAL gt_self : STD_LOGIC;
    SIGNAL lt_self : STD_LOGIC;
BEGIN

    a_unsigned <= unsigned(a);
    b_unsigned <= unsigned(b);

    -- Compare within this slice
    eq_self <= '1' WHEN a_unsigned = b_unsigned ELSE
        '0';
    gt_self <= '1' WHEN a_unsigned > b_unsigned ELSE
        '0';
    lt_self <= '1' WHEN a_unsigned < b_unsigned ELSE
        '0';

    -- Cascade logic
    eq_out <= eq_in AND eq_self; -- only equal if self-equal AND lower bits equal
    gt_out <= gt_self OR (eq_self AND gt_in); -- greater if self-greater, or self-equal and lower greater
    lt_out <= lt_self OR (eq_self AND lt_in); -- same for less

END Behavioral;