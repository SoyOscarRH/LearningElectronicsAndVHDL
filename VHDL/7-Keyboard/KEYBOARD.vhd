-- ==================================================== --
-- ==================  KEYBOARD ======================= --
-- ==================================================== --
LIBRARY IEEE;   
USE IEEE.STD_LOGIC_1164.ALL;    
    
ENTITY KEYBOARD IS         
    PORT (
	   	CLK, CLR: IN STD_LOGIC;
		ROW: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		COLUMN: INOUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	        DISPLAY: INOUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
    ATTRIBUTE PIN_NUMBERS OF KEYBOARD : ENTITY IS
		"CLK:1 "		&
		"CLR:13 "		&
    		"ROW(3):11 "		&
		"ROW(2):10 "		&
		"ROW(1):9 "		&
		"ROW(0):8 "		&
	        "DISPLAY(6):15 "   	&   
        	"DISPLAY(5):16 "   	&   
        	"DISPLAY(4):17 "   	&  
 	    	"DISPLAY(3):18 "   	&  
		"DISPLAY(2):19 "   	&  
		"DISPLAY(1):20 "   	&  
		"DISPLAY(0):21 "    	&
	 	"COLUMN(0):14 "     	&
		"COLUMN(1):22 "     	&
		"COLUMN(2):23 ";
END KEYBOARD;  

ARCHITECTURE BEHAVE OF KEYBOARD IS 
	CONSTANT StarSymbol : STD_LOGIC_VECTOR(6 DOWNTO 0):= "0001000";
	CONSTANT CatSymbol : STD_LOGIC_VECTOR(6 DOWNTO 0):=  "0000100";
	CONSTANT Number0 : STD_LOGIC_VECTOR(6 DOWNTO 0):=    "0000001";
	CONSTANT Number1 : STD_LOGIC_VECTOR(6 DOWNTO 0):=    "1001111";
	CONSTANT Number2 : STD_LOGIC_VECTOR(6 DOWNTO 0):=    "0010010";
	CONSTANT Number3 : STD_LOGIC_VECTOR(6 DOWNTO 0):=    "0000110";
	CONSTANT Number4 : STD_LOGIC_VECTOR(6 DOWNTO 0):=    "1001100";
	CONSTANT Number5 : STD_LOGIC_VECTOR(6 DOWNTO 0):=    "0100100";
	CONSTANT Number6 : STD_LOGIC_VECTOR(6 DOWNTO 0):=    "0100000";
	CONSTANT Number7 : STD_LOGIC_VECTOR(6 DOWNTO 0):=    "0001111";
	CONSTANT Number8 : STD_LOGIC_VECTOR(6 DOWNTO 0):=    "0000000";
	CONSTANT Number9 : STD_LOGIC_VECTOR(6 DOWNTO 0):=    "0000100";
	SIGNAL L: STD_LOGIC;
	SIGNAL KEY: STD_LOGIC_VECTOR(6 DOWNTO 0);
	    BEGIN
			L<= NOT(ROW(0) AND ROW(1) AND ROW(2) AND ROW(3));
			RING : PROCESS(CLK,CLR)
			BEGIN
				IF(CLR = '1') THEN
					COLUMN<="110";
				ELSIF(RISING_EDGE(CLK)) THEN
 				    COLUMN<=TO_STDLOGICVECTOR(TO_BITVECTOR(COLUMN) ROL 1);
				END IF;
			END PROCESS RING;

			CODIFIER: PROCESS(ROW,COLUMN)
			BEGIN
				CASE ROW&COLUMN IS
				WHEN "1110011"=>
					KEY<= Number1;
				WHEN "1110101"=>
					KEY<= Number2;
				WHEN "1110110"=>
					KEY<= Number3;
				WHEN "1101011"=>
					KEY<= Number4;
			   	WHEN "1101101"=>
					KEY<= Number5;
				WHEN "1101110"=>
					KEY<= Number6;
				WHEN "1011011"=>
					KEY<= Number7;
				WHEN "1011101"=>
					KEY<= Number8;
				WHEN "1011110"=>
					KEY<= Number9;
				WHEN "0111011"=>
					KEY<= StarSymbol;
				WHEN "0111101"=>
					KEY<= Number0;
				WHEN "0111110"=>
					KEY<= CatSymbol;
				WHEN OTHERS=>
					KEY<=(OTHERS => '-');
				END CASE;
			END PROCESS CODIFIER;

			REGISTRO: PROCESS(CLK,CLR)
			BEGIN
				IF(CLR = '1') THEN
					DISPLAY <= (OTHERS=>'1');
				ELSIF(RISING_EDGE(CLK)) THEN
 				    CASE L IS
						WHEN '0' =>
						 DISPLAY <= DISPLAY;
						WHEN OTHERS =>
						 DISPLAY <= KEY;
					END CASE;
				END IF;
			END PROCESS REGISTRO;
END BEHAVE;
