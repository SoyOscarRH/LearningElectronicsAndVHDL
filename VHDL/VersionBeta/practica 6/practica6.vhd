library ieee;
use ieee.std_logic_1164.all;

entity practica6 is 
	port (a, b, c, d, e: in std_logic;
		x1, x2, x3, x4, x5, x6: out std_logic);
	attribute pin_numbers of practica6:
	entity is "a:1 b:2 c:3 d:4 e:5 x1:23 x2:22 x3:18 x4:21 x5:20 x6:19";
end practica6;

architecture compuerta of practica6 is
begin
	x1 <= a and b and c and d and e;
	x2 <= a or b or c or d or e;
	x3 <= a xor b xor c xor d xor e;
	x4 <= not x1;
	x5 <= not x2;
	x6 <= not x3;
end compuerta;

