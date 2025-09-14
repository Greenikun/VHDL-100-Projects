LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY PriorityEncoder8to3 IS
    PORT (
        A : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);  -- 8-bit input signals
        Y : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);  -- 3-bit output representing highest priority input index
        V : OUT STD_LOGIC                       -- Valid flag: '1' if at least one input is high
    );
END PriorityEncoder8to3;

ARCHITECTURE Behaviour OF PriorityEncoder8to3 IS
BEGIN
    process(A)
        variable found : BOOLEAN;  -- flag to indicate first/highest input found
    begin
        V <= '0';                 -- default: no valid input
        Y <= "000";               -- default output
        found := FALSE;

        -- Check inputs from highest (7) to lowest (0) for priority encoding
        for i in 7 downto 0 loop
            if (A(i) = '1') and not found then
                Y <= std_logic_vector(to_unsigned(i, 3)); -- assign index to output
                V <= '1';                                  -- set valid flag
                found := TRUE;                             -- mark highest input found
            end if;
        end loop;
    end process;
END Behaviour;