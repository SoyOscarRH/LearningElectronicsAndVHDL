library ieee;
use ieee.std_logic_1164.all;

entity fullAdder is 
    port ( a, b, cin: in std_logic; 
           cout, s: out std_logic);
    attribute pin_numbers of fullAdder:
    entity is "a:1 b:2 cin:3 cout:23 s:22";
end fullAdder;

architecture behave of fullAdder is 
begin 
    s <= a xor b xor cin;
    cout <= (a and b) or (a and cin) or (b and cin);
end behave;
