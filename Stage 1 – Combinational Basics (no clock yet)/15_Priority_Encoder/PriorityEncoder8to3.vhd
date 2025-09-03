LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY PriorityEncoder8to3 IS
    PORT (
        A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        Y : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
        V : OUT STD_LOGIC -- Valid-input flag
    );
END PriorityEncoder8to3;

ARCHITECTURE Behaviour OF PriorityEncoder8to3 IS
BEGIN
    process(A)
        variable found : BOOLEAN;
    begin
        V <= '0';
        Y <= "000";
        found := FALSE;

        -- Loop from highest to lowest input
        for i in 7 downto 0 loop
            if (A(i) = '1') and not found then
                Y <= std_logic_vector(to_unsigned(i, 3)); -- convert integer i to 3-bit vector
                V <= '1';
                found := TRUE;
            end if;
        end loop;
    end process;
END Behaviour;