library ieee;
use ieee.std_logic_1164.all;

entity frase is
    port(
        clk, clr, en: in std_logic;
        display: out std_logic_vector(8 downto 0)
        );
    attribute pin_numbers of frase: entity is
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

end frase;

architecture behave of frase is
    constant D:   std_logic_vector(6 downto 0):= "1000010";
    constant I:   std_logic_vector(6 downto 0):= "1001111";
    constant S:   std_logic_vector(6 downto 0):= "0100100";
    constant E:   std_logic_vector(6 downto 0):= "0110000";
    constant N:   std_logic_vector(6 downto 0):= "0101010";
    constant O:   std_logic_vector(6 downto 0):= "0000001";
    constant G:   std_logic_vector(6 downto 0):= "0000100";
    constant T:   std_logic_vector(6 downto 0):= "1110000";
    constant A:   std_logic_vector(6 downto 0):= "0001000";
    constant L:   std_logic_vector(6 downto 0):= "1110001";

    constant q0:  std_logic_vector(8 downto 0):= "00" & D;
    constant q1:  std_logic_vector(8 downto 0):= "00" & I;
    constant q2:  std_logic_vector(8 downto 0):= "00" & S;
    constant q3:  std_logic_vector(8 downto 0):= "00" & E;
    constant q4:  std_logic_vector(8 downto 0):= "00" & N;
    constant q5:  std_logic_vector(8 downto 0):= "00" & O;
    constant q6:  std_logic_vector(8 downto 0):= "01" & D;
    constant q7:  std_logic_vector(8 downto 0):= "01" & I;
    constant q8:  std_logic_vector(8 downto 0):= "00" & G;
    constant q9:  std_logic_vector(8 downto 0):= "10" & I;
    constant q10: std_logic_vector(8 downto 0):= "00" & T;
    constant q11: std_logic_vector(8 downto 0):= "00" & A;
    constant q12: std_logic_vector(8 downto 0):= "00" & L;

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
                    else
                        display <= q0;
                    end if;
                end if;
            end if;
        end process;
end behave;
