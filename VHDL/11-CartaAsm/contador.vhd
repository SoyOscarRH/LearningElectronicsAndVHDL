----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:07:09 06/01/2018 
-- Design Name: 
-- Module Name:    contador - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity contador is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (3 downto 0);
           Q : inout  STD_LOGIC_VECTOR (3 downto 0);
           UP : in  STD_LOGIC;
           L : in  STD_LOGIC);
end contador;

architecture Behavioral of contador is

begin
	process(clk, clr)
	begin
		if clr = '1' then
			Q <= (OTHERS => '0');
		elsif rising_edge(clk) then
			if L = '1' then
				Q <= D;
			else
				if UP = '1' then
					Q <= Q + 1;
				else
					Q <= Q;
				end if;
			end if;
		end if;
	end process;

end Behavioral;

