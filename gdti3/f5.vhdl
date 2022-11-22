library ieee;
use ieee.std_logic_1164.all;

entity f5 is
  port (
    a, b, c: in std_logic;
    y : out std_logic
  );
end f5;

architecture behav of f5 is
signal inputs : std_logic_vector(2 downto 0);
begin
  inputs(2) <= a;
  inputs(1) <= b;
  inputs(0) <= c;
  process (inputs) begin
    y <= '0';
    case inputs is
      when "001" => y<='1';
      when "011" => y<='1';
      when "100" => y<='1';
      when others =>
    end case;
  end process;
  -- y <= ((not a) and c) or (a and (not b) and (not c));
end architecture;
