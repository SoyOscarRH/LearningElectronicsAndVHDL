-- ==================================================== --
-- ==============    REGISTER  ======================== --
-- ==================================================== --

LIBRARY IEEE;   
USE IEEE.STD_LOGIC_1164.ALL;    
    
ENTITY REGISTER IS     
    
    PORT (
        ES, CLK, CLR: IN STD_LOGIC;
        OPERATION: IN STD_LOGIC_VECTOR(1 DOWNTO 0);      
        D: IN STD_LOGIC_VECTOR(6 DOWNTO 0);
        Q: INOUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );

    ATTRIBUTE PIN_NUMBERS OF REGISTER : ENTITY IS
        "CLK:1 "            &
        "ES:2 "             &
        "D(6):3 "           &
        "D(5):4 "           &
        "D(4):5 "           &
        "D(3):6 "           &
        "D(2):7 "           &
        "D(1):8 "           &
        "D(0):9 "           &
        "OPERATION(0):10 "  &   
        "OPERATION(1):11 "  &   
        "Q(6):20 "          &   
        "Q(5):19 "          &   
        "Q(4):18 "          &  
        "Q(3):17 "          &  
        "Q(2):16 "          &  
        "Q(1):15 "          &  
        "Q(0):14 "          & 
        "CLR:13"; 

END REGISTER;  


ARCHITECTURE Behave OF REGISTER IS 
    BEGIN
        PROC : PROCESS(CLK, CLR)
        BEGIN
            IF(CLR = '1') THEN
                Q <= (OTHERS => '0');

            ELSIF(CLK'EVENT AND CLK = '1') THEN
                FOR I IN 6 DOWNTO 0 LOOP
                    IF (I = 0) THEN
                        Q(I) <= (Q(I)   AND NOT OPERATION(1) AND NOT OPERATION(0)) OR
                                (D(I)   AND NOT OPERATION(1) AND     OPERATION(0)) OR
                                (ES     AND     OPERATION(1) AND NOT OPERATION(0)) OR
                                (Q(I+1) AND     OPERATION(1) AND     OPERATION(0));
                    ELSIF(I = 6) THEN               
                        Q(I) <= (Q(I)   AND NOT OPERATION(1) AND NOT OPERATION(0)) OR
                                (D(I)   AND NOT OPERATION(1) AND     OPERATION(0)) OR
                                (Q(I-1) AND     OPERATION(1) AND NOT OPERATION(0)) OR
                                (ES     AND     OPERATION(1) AND     OPERATION(0));

                    ELSE 
                        Q(I) <= (Q(I)   AND NOT OPERATION(1) AND NOT OPERATION(0)) OR
                                (D(I)   AND NOT OPERATION(1) AND     OPERATION(0)) OR
                                (Q(I-1) AND     OPERATION(1) AND NOT OPERATION(0)) OR
                                (Q(I+1) AND     OPERATION(1) AND     OPERATION(0));

                    END IF;
                END LOOP;       
            END IF;
        END PROCESS PROC;
END Behave;