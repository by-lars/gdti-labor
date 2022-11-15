library ieee;
use ieee.std_logic_1164.all;

entity nor2 is
  port (
    a, b: in std_logic;
    y : out std_logic
  );
end nor2;

architecture behav of nor2 is
begin
  y <= a nor b;
end architecture;
