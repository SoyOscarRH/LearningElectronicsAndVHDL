----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:26:06 06/01/2018 
-- Design Name: 
-- Module Name:    fsm - Behavioral 
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fsm is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           INI : in  STD_LOGIC;
           A0 : in  STD_LOGIC;
           Z : in  STD_LOGIC;
           SHE : out  STD_LOGIC;
           LA : out  STD_LOGIC;
           UP : out  STD_LOGIC;
           LB : out  STD_LOGIC;
           SEL : out  STD_LOGIC);
end fsm;

architecture Behavioral of fsm is
type estado is(a, b, c);
signal actual, siguiente : estado;

begin
	automata : process(actual, INI, Z, A0)
	begin
		SHE <= '0';
		LA <= '0';
		UP <= '0';
		LB <= '0';
		SEL <= '0';
		case actual is
			when a =>
				LB <= '1';
				if INI = '0' then
					LA <= '1';
					siguiente <= a;
				else
					siguiente <= b;
				end if;
			when b =>
				SHE <= '1';
				if Z = '0' then
					if A0 = '0' then
						siguiente <= b;
					else
						UP <= '1';
						siguiente <= b;
					end if;
				else
					siguiente <= c;
				end if;
			when c =>
				SEL <= '1';
				if INI = '0' then
					siguiente <= a;
				else
					siguiente <= c;
				end if;
		end case;
	end process automata;
	
	transicion : process(clk, clr)
	begin
		if clr = '1' then
			actual <= a;
		elsif rising_edge(clk) then
			actual <= siguiente;
		end if;
	end process transicion;

end Behavioral;

