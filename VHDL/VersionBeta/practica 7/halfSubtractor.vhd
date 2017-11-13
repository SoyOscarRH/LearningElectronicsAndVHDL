
library ieee;
use ieee.std_logic_1164.all;

entity halfSubtractor is 
    port (x, y: in std_logic; 
        r, b: out std_logic);
    attribute pin_numbers of halfSubtractor:
    entity is "x:1 y:2 b:23 r:22";
end halfSubtractor;

architecture behave of halfSubtractor is 
begin 
    r <= x xor y;
    b <= (not x) and y;
end behave;
