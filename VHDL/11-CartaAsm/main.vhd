----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:43:30 06/01/2018 
-- Design Name: 
-- Module Name:    main - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
library WORK;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.paquete.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           INI : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (7 downto 0);
           DISPLAY : out  STD_LOGIC_VECTOR (6 downto 0));
end main;

architecture Behavioral of main is
signal SHE, LA, UP, LB, SEL, Z : std_logic;
signal QA : std_logic_vector(7 downto 0);
signal QB : std_logic_vector(3 downto 0);
signal S  : std_logic_vector(6 downto 0);

begin
	reg : registro port map(
		clk => clk,
		clr => clr,
		D => A,
		Q => QA,
		L => LA,
		SHE => SHE
	);
	
	cont : contador port map(
		clk => clk,
		clr => clr,
		D => (OTHERS => '0'),
		Q => QB,
		UP => UP,
		L => LB
	);
	
	conv : convertidor port map(
		clk => clk,
		clr => clr,
		Q => QB,
		S => S
	);
	
	control : fsm port map(
		clk => clk,
		clr => clr,
		INI => INI,
		A0 => QA(0),
		Z => Z,
		SHE => SHE,
		LA => LA,
		UP => UP,
		LB => LB,
		SEL => SEL
	);
	
	Z <= not(QA(0) or QA(1) or QA(2) or QA(3) or QA(4) or QA(5) or QA(6) or QA(7));
	
	DISPLAY <= S when SEL = '1' else
				  "1111110";

end Behavioral;

