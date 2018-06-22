library ieee;
use ieee.std_logic_1164.all;

entity boleta is
    port(
        clk, clr, en: in std_logic;
        display: out std_logic_vector(8 downto 0)
        );
    attribute pin_numbers of boleta: entity is
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

end boleta;

architecture behave of boleta is
    constant n0:  std_logic_vector(6 downto 0):= "0000001";
    constant n1:  std_logic_vector(6 downto 0):= "1001111";
    constant n2:  std_logic_vector(6 downto 0):= "0010010";
    constant n3:  std_logic_vector(6 downto 0):= "0000110";
    constant n4:  std_logic_vector(6 downto 0):= "1001100";
    constant n5:  std_logic_vector(6 downto 0):= "0100100";
    constant n6:  std_logic_vector(6 downto 0):= "0100000";
    constant n7:  std_logic_vector(6 downto 0):= "0001111";
    constant n8:  std_logic_vector(6 downto 0):= "0000000";
    constant n9:  std_logic_vector(6 downto 0):= "0000100";

    constant q0:  std_logic_vector(8 downto 0):= "00" & n2;
    constant q1:  std_logic_vector(8 downto 0):= "00" & n0;
    constant q2:  std_logic_vector(8 downto 0):= "00" & n1;
    constant q3:  std_logic_vector(8 downto 0):= "00" & n4;
    constant q4:  std_logic_vector(8 downto 0):= "01" & n1;
    constant q5:  std_logic_vector(8 downto 0):= "00" & n7;
    constant q6:  std_logic_vector(8 downto 0):= "01" & n0;
    constant q7:  std_logic_vector(8 downto 0):= "00" & n8;
    constant q8:  std_logic_vector(8 downto 0):= "00" & n3;
    constant q9:  std_logic_vector(8 downto 0):= "00" & n6;

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
                    elsif display = q5 then
                        display <= q6;
                    elsif display = q6 then
                        display <= q7;
                    elsif display = q7 then
                        display <= q8;
                    elsif display = q8 then
                        display <= q9;
                    else
                        display <= q0;
                    end if;
                end if;
            end if;
        end process;
end behave;
