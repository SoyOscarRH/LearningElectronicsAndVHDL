-- ==================================================== --
-- ==============    COUNTER   ======================== --
-- ==================================================== --
LIBRARY IEEE;   
USE IEEE.STD_LOGIC_1164.ALL;
    
ENTITY COUNTER IS     
    GENERIC(
        N : INTEGER := 7
    );
    PORT (
        Enable, CLK, CLR: IN STD_LOGIC;
        Q: INOUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
    );

    ATTRIBUTE PIN_NUMBERS OF COUNTER: ENTITY IS
        "CLK:1 "       &
        "Enable:9 "    &
        "CLR:13 "      &
        "Q(0):14 "     &
        "Q(1):15 "     &
        "Q(2):16 "     &
        "Q(3):17 "     &
        "Q(4):18 "     &
        "Q(5):19 "     &
        "Q(6):20";

END COUNTER;  


ARCHITECTURE Behave OF COUNTER IS 
    BEGIN
        CalculateOutput : PROCESS(CLK, CLR)
        VARIABLE Temporal: STD_LOGIC;
        BEGIN
            
            IF(CLR = '1') THEN
                Q <= (OTHERS => '0');

            ELSIF(RISING_EDGE(CLK)) THEN
                FOR i IN 0 TO N-1 LOOP
                    
                    Temporal := Enable;
                    
                    FOR j IN 0 TO i-1 LOOP
                        Temporal := Temporal AND Q(j);
                    END LOOP;

                    Q(i) <= Q(i) XOR Temporal;    

                END LOOP;       
            END IF;

        END PROCESS CalculateOutput;
END Behave;
