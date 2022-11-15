library ieee;
use ieee.std_logic_1164.all;

entity und is
  port (
    a, b: in std_logic;
    y : out std_logic
  );
end und;

architecture behav of und is
begin
  y <= a and b;
end architecture;
