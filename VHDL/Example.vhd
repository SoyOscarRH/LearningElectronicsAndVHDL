library ieee;
use ieee.std_logic_1164.all;

entity PinNumbers is 
	port (
		a, b, c, d, e: in std_logic;
		x1, x2, x3, x4, x5, x6: out std_logic
	);
end PinNumbers;

architecture Gate of PinNumbers is
begin
	x1 <= a and b and c and d and e;
	x6 <= not c;
end Gate;