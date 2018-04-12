-- ==================================================== --
-- ==============    COUNTER   ======================== --
-- ==================================================== --
LIBRARY IEEE;   
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
    
ENTITY COUNTER IS     
    GENERIC(
        N : INTEGER := 3
    );
    PORT (
        Enable, CLK, CLR, UpDown, L: IN STD_LOGIC;
        Load: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
        Q: INOUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
        C: OUT STD_LOGIC
    );

 
END COUNTER;  


ARCHITECTURE Behave OF COUNTER IS 
    BEGIN
        CalculateOutput : PROCESS(CLK, CLR)
        VARIABLE Temporal: STD_LOGIC;
        BEGIN
            
            IF(CLR = '1') THEN
                Q <= (OTHERS => '0');
                C <= '0';

            ELSIF(RISING_EDGE(CLK) AND Enable = '1') THEN
                IF(UpDown = '1') THEN
                    Q <= Q + 1;
                ELSIF(UpDown = '0') THEN
                    Q <= Q - 1;
                END IF;     
            END IF;

        END PROCESS CalculateOutput;
END Behave;