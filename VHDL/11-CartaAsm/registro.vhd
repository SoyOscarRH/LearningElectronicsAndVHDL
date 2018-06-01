----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:52:44 06/01/2018 
-- Design Name: 
-- Module Name:    registro - Behavioral 
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

entity registro is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (7 downto 0);
           Q : inout  STD_LOGIC_VECTOR (7 downto 0);
           L : in  STD_LOGIC;
           SHE : in  STD_LOGIC);
end registro;

architecture Behavioral of registro is

begin
	process(clk, clr)
	begin
		if clr = '1' then
			Q <= (OTHERS => '0');
		elsif rising_edge(clk) then
			if L = '1' then
				Q <= D;
			else
				if SHE = '1' then
					Q <= to_stdlogicvector(to_bitvector(Q) srl 1);
				else
					Q <= Q;
				end if;
			end if;
		end if;
	end process;

end Behavioral;

