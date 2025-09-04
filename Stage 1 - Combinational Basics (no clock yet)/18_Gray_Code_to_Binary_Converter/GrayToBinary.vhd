LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY GrayToBinary IS
    GENERIC (
        N : INTEGER := 4
    );
    PORT (
        G : IN STD_LOGIC_VECTOR (N - 1 DOWNTO 0);
        B : OUT STD_LOGIC_VECTOR (N - 1 DOWNTO 0)
    );
END GrayToBinary;

----------------------------------------------------------

ARCHITECTURE Behaviour OF GrayToBinary IS
BEGIN    
    PROCESS (G)
    VARIABLE B_var : STD_LOGIC_VECTOR(N - 1 DOWNTO 0); -- Inside a PROCESS, signal assignments (<=) don’t update immediately. You need to wait to the next delta cycle
    BEGIN
        B_var(N - 1) := G(N - 1); -- MSB is the same in B and G
        FOR i IN N - 2 DOWNTO 0 LOOP
            B_var(i) := B_var(i + 1) XOR G(i);
        END LOOP;
        B <= B_var;
    END PROCESS;
END Behaviour;