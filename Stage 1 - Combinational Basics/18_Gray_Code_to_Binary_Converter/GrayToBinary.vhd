LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY GrayToBinary IS
    GENERIC (
        N : INTEGER := 4 -- width of input/output (default 4 bits)
    );
    PORT (
        G : IN  STD_LOGIC_VECTOR (N - 1 DOWNTO 0); -- Gray code input
        B : OUT STD_LOGIC_VECTOR (N - 1 DOWNTO 0)  -- Binary output
    );
END GrayToBinary;

----------------------------------------------------------

ARCHITECTURE Behaviour OF GrayToBinary IS
BEGIN    
    PROCESS (G)
        -- Variable to hold intermediate binary calculation
        VARIABLE B_var : STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
    BEGIN
        -- MSB of binary = MSB of Gray code
        B_var(N - 1) := G(N - 1);

        -- Compute remaining binary bits
        FOR i IN N - 2 DOWNTO 0 LOOP
            -- Each binary bit = XOR of previous binary bit and corresponding Gray bit
            B_var(i) := B_var(i + 1) XOR G(i);
        END LOOP;

        -- Update output signal
        B <= B_var;
    END PROCESS;
END Behaviour;