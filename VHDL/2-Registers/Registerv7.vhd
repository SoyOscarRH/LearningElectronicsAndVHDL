-- ==================================================== --
-- ==============    REGISTER  ======================== --
-- ==================================================== --
LIBRARY IEEE;   
USE IEEE.STD_LOGIC_1164.ALL;
    
ENTITY REGISTER IS     
    GENERIC(
        N : INTEGER := 7
    );
    PORT (
        ES, CLK, CLR: IN STD_LOGIC;
        OPERATION: IN STD_LOGIC_VECTOR(1 DOWNTO 0);      
        D: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
        Q: INOUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
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
            IF CLR = '1' THEN
                Q <= (OTHERS => '0'); --Q<='0000'; -- Q<=X"0";

            ELSIF RISING_EDGE(CLK) THEN
                CASE OPERATION IS
                    WHEN "00" =>
                        Q <= Q;
                    WHEN "01" =>
                        Q <= D;
                    WHEN "10" =>
                        Q <= TO_STDLOGICVECTOR(TO_BITVECTOR(Q) SLL 1);
                        Q(0) <= ES;
                    WHEN OTHERS =>
                        Q <= TO_STDLOGICVECTOR(TO_BITVECTOR(Q) SRL 1);
                        Q(N-1) <= ES;
                END CASE;       
            END IF;
        END PROCESS PROC;
END Behave;