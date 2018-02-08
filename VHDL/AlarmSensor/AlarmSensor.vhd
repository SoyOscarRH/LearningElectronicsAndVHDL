LIBRARY ieee;   
USE ieee.STD_LOGIC_1164.all;    
    
ENTITY AlarmSensor IS     
    PORT (
        A, B, Reference: in STD_LOGIC_VECTOR(2 DOWNTO 0);
        Selector: in STD_LOGIC;    
        Display: out STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
END AlarmSensor;  


ARCHITECTURE Behave OF AlarmSensor IS 
    
    SIGNAL SelectorOut, ComparatorOut: STD_LOGIC_VECTOR(2 DOWNTO 0);
    CONSTANT GreaterSymbol : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111000";
    CONSTANT LessSymbol    : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1001110";
    CONSTANT EqualSymbol   : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1001000";

    BEGIN

        -- =========  SELECTOR - MULTIPLEXOR ======= --   
        WITH Selector SELECT
            SelectorOut <=  A WHEN '0',
                            B WHEN OTHERS;

        -- =============  COMPARATOR  ============== --   
        Comparator: PROCESS(SelectorOut, Reference)
        BEGIN
            IF (SelectorOut > Reference) THEN
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