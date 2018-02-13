-- ==================================================== --
-- ==============    ALARM SENSOR   =================== --
-- ==================================================== --
LIBRARY IEEE;   
USE IEEE.STD_LOGIC_1164.ALL;    
    
ENTITY AlarmSensor IS     
    
    PORT (
        A, B, Reference: in STD_LOGIC_VECTOR(2 DOWNTO 0);
        Selector: in STD_LOGIC;    
        Display: out STD_LOGIC_VECTOR(6 DOWNTO 0)
    );

    ATTRIBUTE PIN_NUMBERS OF AlarmSensor : ENTITY IS
        "Display(0): 15 "   &   
        "Display(1): 16 "   &   
        "Display(2): 17 "   &   
        "Display(3): 18 "   &   
        "Display(4): 19 "   &   
        "Display(5): 20 "   &   
        "Display(6): 21 "   & 
        "A(0): 2 "          &   
        "A(1): 3 "          &   
        "B(6): 4 "          &
        "B(4): 5 "          &   
        "Reference(0): 6 "  &   
        "Reference(1): 7 "  &
        "Selector: 8 ";    

END AlarmSensor;  


ARCHITECTURE Behave OF AlarmSensor IS 
    
    SIGNAL SelectorOut, ComparatorOut: STD_LOGIC_VECTOR(2 DOWNTO 0);
    
    CONSTANT GreaterSymbol: STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111000";
    CONSTANT LessSymbol: STD_LOGIC_VECTOR(6 DOWNTO 0) := "1001110";
    CONSTANT EqualSymbol: STD_LOGIC_VECTOR(6 DOWNTO 0) := "1001000";

    BEGIN

        -- =========  SELECTOR - MULTIPLEXOR ======= --   
        WITH Selector SELECT
            SelectorOut <=  A WHEN '0',
                            B WHEN OTHERS;

        -- =============  COMPARATOR  ============== --   
        Comparator: PROCESS(SelectorOut, Reference)
        BEGIN
            IF (SelectorOut > Reference)    THEN
                ComparatorOut <= "100";
            ELSIF (SelectorOut = Reference) THEN
                ComparatorOut <= "010";
            ELSE
                ComparatorOut <= "001";
            END IF;
        END PROCESS;
        
        -- =============  DISPLAY  ============== --   
        Display <=  GreaterSymbol WHEN (ComparatorOut = "100") ELSE
                    LessSymbol    WHEN (ComparatorOut = "001") ELSE
                    EqualSymbol   WHEN (ComparatorOut = "010") ELSE
                    "0000000";

end Behave;