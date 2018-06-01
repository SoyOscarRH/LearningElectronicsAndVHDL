--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package paquete is

	component registro is
		 Port ( clk : in  STD_LOGIC;
				  clr : in  STD_LOGIC;
				  D : in  STD_LOGIC_VECTOR (7 downto 0);
				  Q : inout  STD_LOGIC_VECTOR (7 downto 0);
				  L : in  STD_LOGIC;
				  SHE : in  STD_LOGIC);
	end component;
	
	component contador is
		 Port ( clk : in  STD_LOGIC;
				  clr : in  STD_LOGIC;
				  D : in  STD_LOGIC_VECTOR (3 downto 0);
				  Q : out  STD_LOGIC_VECTOR (3 downto 0);
				  UP : in  STD_LOGIC;
				  L : in  STD_LOGIC);
	end component;
	
	component convertidor is
		 Port ( clk : in  STD_LOGIC;
				  clr : in  STD_LOGIC;
				  Q : in  STD_LOGIC_VECTOR (3 downto 0);
				  S : out  STD_LOGIC_VECTOR (6 downto 0));
	end component;
	
	component fsm is
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
	end component;

end paquete;

package body paquete is

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
 
end paquete;
