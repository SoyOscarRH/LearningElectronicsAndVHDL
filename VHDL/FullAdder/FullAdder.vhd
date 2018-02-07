library ieee;   
use ieee.std_logic_1164.all;    
    
entity FullAdder is     
    port (
        a, b, cin: in std_logic;    
        cout, s: out std_logic
    );  
end FullAdder;  
    
architecture behave of FullAdder is begin   
    s <= a xor b xor cin;   
    cout <= (a and b) or (a and cin) or (b and cin);    
end behave;