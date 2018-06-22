-- ==================================================== --
-- ==============    REGISTER  ======================== --
-- ==================================================== --
LIBRARY IEEE;   
    
ENTITY REGISTER IS     
    
    PORT (
        ES, CLK, CLR: IN BIT;
        OPERATION: IN BIT_VECTOR(1 DOWNTO 0);      
        D: IN BIT_VECTOR(6 DOWNTO 0);
        Q: INOUT BIT_VECTOR(6 DOWNTO 0)
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
                Q <= (OTHERS => '0'); --Q<='0000'; -- Q<=X"0";

            ELSIF(CLK'EVENT AND CLK = '1') THEN
                CASE OPERATION IS
                    WHEN "00" =>
                        Q <= Q;
                    WHEN "01" =>
                        Q <= D;
                    WHEN "10" =>
                        Q <= Q SLL 1;
                        Q(0) <= ES;
                    WHEN OTHERS =>
                        Q <= Q SRL 1;
                        Q(6) <= ES;
                END CASE;       
            END IF;
        END PROCESS PROC;
END Behave;