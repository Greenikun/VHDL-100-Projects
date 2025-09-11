LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY BinaryToGray IS
    GENERIC (
        N : INTEGER := 4 -- width of binary input (default 4 bits)
    );
    PORT (
        B : IN  STD_LOGIC_VECTOR (N - 1 DOWNTO 0); -- Binary input
        G : OUT STD_LOGIC_VECTOR (N - 1 DOWNTO 0)  -- Gray code output
    );
END BinaryToGray;

-----------------------------------------------------

ARCHITECTURE behaviour OF BinaryToGray IS
BEGIN
    b_proc : PROCESS (B)
    BEGIN
        -- MSB of Gray code = MSB of binary input
        G(N - 1) <= B(N - 1);

        -- Generate remaining Gray bits
        FOR i IN N - 2 DOWNTO 0 LOOP -- MSB already processed
            -- Each Gray bit (except MSB) = XOR of binary bit with next higher-order bit
            G(i) <= B(i + 1) XOR B(i);
        END LOOP;

    END PROCESS b_proc;

END behaviour;