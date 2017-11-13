library ieee;
use ieee.std_logic_1164.all;
entity fourBitsAdder is
	port( a, b: in std_logic_vector (3 downto 0);
		  cin: in std_logic;
		  s: out std_logic_vector (3 downto 0);
		  cout: out std_logic);
	attribute pin_numbers of fourBitsAdder:
	entity is "a(3):1 a(2):2 a(1):3 a(0):4 b(3):5 b(2):6 b(1):7 b(0):8 cin:9 cout:23 s(3):22 s(2):21 s(1):20 s(0):19";
end fourBitsAdder;

architecture behave of fourBitsAdder is
signal c: std_logic_vector (2 downto 0);
attribute synthesis_off of c: signal is true;
begin
    s(0) <= a(0) xor b(0) xor cin;
    c(0) <= (a(0) and b(0)) or(a(0) and cin) or (b(0) and cin);
    s(1) <= a(1) xor b(1) xor c(0);
    c(1) <= (a(1) and b(1)) or(a(1) and c(0)) or(b(1) and c(0));
    s(2) <= a(2) xor b(2) xor c(1);
    c(2) <= (a(2) and b(2)) or(a(2) and c(1)) or(b(2) and c(1));
    s(3) <= a(3) xor b(3) xor c(2);
    cout <= (a(3) and b(3)) or(a(3) and c(2)) or(b(3) and c(2));
end behave;