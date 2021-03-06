-- ==================================================== --
-- =================    MESSAGE ======================= --
-- ====================================================
library ieee;
use ieee.std_logic_1164.all;

entity ipn is
    port(clk, clr: in std_logic;
         an:       inout std_logic_vector(2 downto 0);
         display:  out std_logic_vector(6 downto 0));

    attribute pin_numbers of ipn: entity is
    "clk:1 "         &
    "clr:13 "        &
    "an(0):14 "      &
    "display(0):15 " &
    "display(1):16 " &
    "display(2):17 " &
    "display(3):18 " &
    "display(4):19 " &
    "display(5):20 " &
    "display(6):21 " &
    "an(2):22 "      &
    "an(1):23";
end ipn;

architecture behave of ipn is
    constant LetterI: std_logic_vector(6 downto 0):= "1001111";
    constant LetterP: std_logic_vector(6 downto 0):= "0011000";
    constant LetterN: std_logic_vector(6 downto 0):= "1101010";
    constant q0: std_logic_vector(2 downto 0):= "110";
    constant q1: std_logic_vector(2 downto 0):= "101";
    constant q2: std_logic_vector(2 downto 0):= "011";
    begin
        process(clk, clr)
        begin
            if clr = '1' then
                an <= q0;
            elsif rising_edge(clk) then
                an(0) <= an(2);
                an(1) <= an(0);
                an(2) <= an(1);
            end if;
        end process;

    display <= LetterI when an = q2 else
               LetterP when an = q1 else
               LetterN when an = q0 else
               "0000000";

end behave;
