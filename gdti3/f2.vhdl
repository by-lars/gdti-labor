library ieee;
use ieee.std_logic_1164.all;

entity f2 is
  port (
    a, b, c: in std_logic;
    y : out std_logic
  );
end f2;

architecture behav of f2 is
signal inputs : std_logic_vector(2 downto 0);
begin
  inputs(2) <= a;
  inputs(1) <= b;
  inputs(0) <= c;
  process (inputs) begin
    y <= '0';
    case inputs is
      when "001" => y<='1';
      when "010" => y<='1';
      when "011" => y<='1';
      when "111" => y<='1';
      when others =>
    end case;
  end process;
  -- y <= (b and c) or ((not a) and c) or ((not a) and b);
end architecture;
