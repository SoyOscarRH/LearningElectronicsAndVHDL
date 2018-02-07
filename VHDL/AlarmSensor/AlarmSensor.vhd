LIBRARY ieee;   
USE ieee.std_logic_1164.all;    
    
ENTITY AlarmSensor IS     
    PORT (
        A, B, Reference: in std_logic_vector(2 downto 0);
        Selector: in std_logic;    
        Display: out std_logic_vector(6 downto 0)
    );
END AlarmSensor;  


ARCHITECTURE Behave OF AlarmSensor IS 
    SIGNAL SelectorOut, ComparatorOut: std_logic_vector(2 downto 0);
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
    Display <=  "1111000" WHEN ComparatorOut = "100" ELSE
                "1001110" WHEN ComparatorOut = "001" ELSE
                "1001000" WHEN ComparatorOut = "010" ELSE
                "0000000";

end Behave;