-- ==================================================== --
-- ==============    Mensaje   ======================== --
-- ==================================================== --
LIBRARY IEEE;   
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

    
ENTITY MENSAJE IS     
    PORT (
		CLK,CLR: IN STD_LOGIC;
        DIRECCION: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
		DISPLAY: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		AN: INOUT STD_LOGIC_VECTOR(2 DOWNTO 0)
    );

	ATTRIBUTE PIN_NUMBERS OF MENSAJE : ENTITY IS 
		"CLK:1 "				&
		"CLR:13 "				&
		"DIRECCION(0):6 "			&
		"DIRECCION(1):5 "			&
		"DIRECCION(2):4 "			&
		"AN(0):14 "				&
		"AN(1):23 "				&
		"AN(2):22 "				&
		"DISPLAY(0):15 "			&
		"DISPLAY(1):16 "			&
		"DISPLAY(2):17 "			&
		"DISPLAY(3):18 "			&
		"DISPLAY(4):19 "			&
		"DISPLAY(5):20 "			&
		"DISPLAY(6):21";
END MENSAJE;  

ARCHITECTURE Behave OF MENSAJE IS 
CONSTANT Symbold : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1000010"; 
CONSTANT SymbolI : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1001111"; 
CONSTANT SymbolS : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0100100"; 
CONSTANT SymbolE : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0110000"; 
CONSTANT Symboln : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0101010";
CONSTANT SymbolO : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000001"; 
CONSTANT Symboles : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1110111"; 
TYPE MEMORIA IS ARRAY(7 DOWNTO 0) OF STD_LOGIC_VECTOR (6 DOWNTO 0);
CONSTANT ROM2 : MEMORIA := ( Symboles, Symboln, SymbolE, SymbolS, SymbolI, Symbold, Symbole, Symboles );
CONSTANT ROM1 : MEMORIA := ( Symboles, SymbolO, Symboln, SymbolE, SymbolS, SymbolI, Symbold, Symboles );
CONSTANT ROM0 : MEMORIA := ( Symboles, Symboles, SymbolO, Symboln, SymbolE, SymbolS, SymbolI, Symbold );
SIGNAL DISP2: STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL DISP1: STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL DISP0: STD_LOGIC_VECTOR(6 DOWNTO 0);
BEGIN
	RING : PROCESS(CLK,CLR)
		BEGIN
			IF(CLR = '1') THEN
				AN<="110";
			ELSIF(RISING_EDGE(CLK)) THEN
 				AN<=TO_STDLOGICVECTOR(TO_BITVECTOR(AN) ROL 1);
			END IF;
	END PROCESS RING;

DISP2<= ROM2(CONV_INTEGER(DIRECCION));
DISP1<= ROM1(CONV_INTEGER(DIRECCION));
DISP0<= ROM0(CONV_INTEGER(DIRECCION));

DISPLAY <=  DISP0 WHEN (AN = "110") ELSE
          	DISP1 WHEN (AN = "101") ELSE
            DISP2 WHEN (AN = "011") ELSE
			( OTHERS => '-' );
END Behave;
