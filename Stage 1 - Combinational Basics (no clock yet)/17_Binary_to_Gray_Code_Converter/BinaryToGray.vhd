LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY BinaryToGray IS
    GENERIC (
        N : INTEGER := 4
    );
    PORT (
        B : IN STD_LOGIC_VECTOR (N - 1 DOWNTO 0); -- Binary input
        G : OUT STD_LOGIC_VECTOR (N - 1 DOWNTO 0) -- Gray code output
    );
END BinaryToGray;

-----------------------------------------------------

ARCHITECTURE behaviour OF BinaryToGray IS
BEGIN
    b_proc : PROCESS (B)
    BEGIN
        G(N - 1) <= B(N - 1);

        FOR i IN N - 2 DOWNTO 0 LOOP -- MSB of B is already processed
            -- Each Gray bit (except MSB) = binary bit XOR previous binary bit
            G(i) <= B(i + 1) XOR B(i);
        END LOOP;

    END PROCESS b_proc;

END behaviour;