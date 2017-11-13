
library ieee;
use ieee.std_logic_1164.all;

entity fullSubtractor is 
    port (
        x, y, bin: in std_logic;
        r, bout: out std_logic
    );
    attribute pin_numbers of fullSubtractor:
    entity is "x:1 y:2 bin:3 bout:23 r:22";
end fullSubtractor;

architecture behave of fullSubtractor is 
begin 
    r <= x xor y xor bin;
    bout <= ((not x) and bin) or ((not x) and y) 
        or (y and bin);
end behave;
