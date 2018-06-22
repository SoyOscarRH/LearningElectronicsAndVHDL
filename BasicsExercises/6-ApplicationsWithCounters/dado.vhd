library ieee;
use ieee.std_logic_1164.all;

entity dado is
    port(
        clk, clr, en: in std_logic;
        display: out std_logic_vector(6 downto 0)
        );
    attribute pin_numbers of dado: entity is
        "clk:1 "         &
        "clr:13 "        &
        "en:2 "          &
        "display(0):15 " &
        "display(1):16 " &
        "display(2):17 " &
        "display(3):18 " &
        "display(4):19 " &
        "display(5):20 " &
        "display(6):21";

end dado;

architecture behave of dado is
    constant q0: std_logic_vector(6 downto 0):= "1001111";
    constant q1: std_logic_vector(6 downto 0):= "0010010";
    constant q2: std_logic_vector(6 downto 0):= "0000110";
    constant q3: std_logic_vector(6 downto 0):= "1001100";
    constant q4: std_logic_vector(6 downto 0):= "0100100";
    constant q5: std_logic_vector(6 downto 0):= "0100000";

    begin
        automata: process(clk, clr)
        begin
            if clr = '1' then
                display <= q0;
            elsif rising_edge(clk) then
                if en = '1' then
                    if display = q0 then
                        display <= q1;
                    elsif display = q1 then
                        display <= q2;
                    elsif display = q2 then
                        display <= q3;
                    elsif display = q3 then
                        display <= q4;
                    elsif display = q4 then
                        display <= q5;
                    else
                        display <= q0;
                    end if;
                end if;
            end if;
        end process;
end behave;
