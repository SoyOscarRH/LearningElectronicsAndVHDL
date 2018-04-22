library ieee;
use ieee.std_logic_1164.all;

entity hex is
    port(
        clk, clr, en: in std_logic;
        display: out std_logic_vector(6 downto 0)
        );
    attribute pin_numbers of hex: entity is
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

end hex;

architecture behave of hex is
    constant q0:  std_logic_vector(6 downto 0):= "0000001";
    constant q1:  std_logic_vector(6 downto 0):= "1001111";
    constant q2:  std_logic_vector(6 downto 0):= "0010010";
    constant q3:  std_logic_vector(6 downto 0):= "0000110";
    constant q4:  std_logic_vector(6 downto 0):= "1001100";
    constant q5:  std_logic_vector(6 downto 0):= "0100100";
    constant q6:  std_logic_vector(6 downto 0):= "0100000";
    constant q7:  std_logic_vector(6 downto 0):= "0001111";
    constant q8:  std_logic_vector(6 downto 0):= "0000000";
    constant q9:  std_logic_vector(6 downto 0):= "0000100";
    constant q10: std_logic_vector(6 downto 0):= "0001000";
    constant q11: std_logic_vector(6 downto 0):= "1100000";
    constant q12: std_logic_vector(6 downto 0):= "0110001";
    constant q13: std_logic_vector(6 downto 0):= "1000010";
    constant q14: std_logic_vector(6 downto 0):= "0110000";
    constant q15: std_logic_vector(6 downto 0):= "0111000";

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
                    elsif display = q9 then
                        display <= q10;
                    elsif display = q10 then
                        display <= q11;
                    elsif display = q11 then
                        display <= q12;
                    elsif display = q12 then
                        display <= q13;
                    elsif display = q13 then
                        display <= q14;
                    elsif display = q14 then
                        display <= q15;
                    else
                        display <= q0;
                    end if;
                end if;
            end if;
        end process;
end behave;
