
library ieee;
use ieee.std_logic_1164.all;

entity halfAdder is 
    port (
        a, b: in std_logic;
        c, s: out std_logic
    );
    attribute pin_numbers of halfAdder:
    entity is "a:1 b:2 c:23 s:22";
end halfAdder;

architecture behave of halfAdder is 
begin 
    s <= a xor b;
    c <= a and b;
end behave;

