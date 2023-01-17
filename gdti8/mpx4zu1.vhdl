library ieee;
use ieee.std_logic_1164.all;

entity mpx4zu1 is
  port (
    a, b, c, d: in std_logic;
    sel : in std_logic_vector(1 downto 0);
    y : out std_logic
  );
end mpx4zu1;

architecture behav of mpx4zu1 is
begin
  process (a,b,c,d,sel) begin
    case sel is
      when "00" => y <= a;
      when "01" => y <= b;
      when "10" => y <= c;
      when "11" => y <= d;
      when others =>
    end case;
  end process;
end architecture;
