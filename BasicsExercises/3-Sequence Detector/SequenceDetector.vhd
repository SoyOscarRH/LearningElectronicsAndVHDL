-- ==================================================== --
-- ==========    SEQUENCE DETECTOR ==================== --
-- ==================================================== --
LIBRARY IEEE;   
USE IEEE.STD_LOGIC_1164.ALL;    
    
ENTITY DETECTOR IS     
    
    PORT (
        CLK, CLR, X: IN STD_LOGIC;
        AN0: OUT STD_LOGIC;
        DISPLAY: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );

    ATTRIBUTE PIN_NUMBERS OF DETECTOR : ENTITY IS
        "CLK:1 "            &
        "X:11 "             &
        "CLR:13 "           &
        "AN0:14 "           &
        "DISPLAY(6):21 "    &   
        "DISPLAY(5):20 "    &   
        "DISPLAY(4):19 "    &  
        "DISPLAY(3):18 "    &  
        "DISPLAY(2):17 "    &  
        "DISPLAY(1):16 "    &  
        "DISPLAY(0):15 "; 

END DETECTOR;  

ARCHITECTURE SEQUENCE OF DETECTOR IS 
    CONSTANT SuccessSymbol : STD_LOGIC_VECTOR(6 DOWNTO 0):= "0001000";
    CONSTANT BugSymbol : STD_LOGIC_VECTOR(6 DOWNTO 0):= "0110000";
    SIGNAL QA, QB, Y : STD_LOGIC;
    BEGIN
        AN0 <= '0';

        PROC: PROCESS(CLK, CLR)
        BEGIN
            IF(CLR = '1') THEN
                QA <= '0';
                QB <= '0';
            ELSIF(CLK'EVENT AND CLK = '1') THEN
                QA <= (NOT QB AND X) OR (QA AND X);
                QB <= (QA AND X) OR (QA AND QB);
            END IF;
        END PROCESS PROC;

        Y <= (NOT QA AND QB AND X);
        DISPLAY <= SuccessSymbol WHEN Y = '1' 
                    ELSE BugSymbol;

END SEQUENCE;
