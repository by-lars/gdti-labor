library ieee;
use ieee.std_logic_1164.all;

entity f6 is
  port (
    a, b, c: in std_logic;
    y : out std_logic
  );
end f6;

architecture behav of f6 is
signal inputs : std_logic_vector(2 downto 0);
begin
  inputs(2) <= a;
  inputs(1) <= b;
  inputs(0) <= c;
  process (inputs) begin
    y <= '0';
    case inputs is
      when "100" => y<='1';
      when "101" => y<='1';
      when "011" => y<='1';
      when others =>
    end case;
  end process;
  -- y <= (a and (not b)) or ((not a) and b and c);
end architecture;
