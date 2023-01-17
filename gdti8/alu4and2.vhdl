library ieee;
use ieee.std_logic_1164.all;

entity alu4and2 is
  port (
    a, b: in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0)
  );
end alu4and2;

architecture behav of alu4and2 is
begin
  y <= a and b;
end architecture;
