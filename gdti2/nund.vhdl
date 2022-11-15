library ieee;
use ieee.std_logic_1164.all;

entity nund is
  port (
    a, b: in std_logic;
    y : out std_logic
  );
end nund;

architecture behav of nund is
begin
  y <= a nand b;
end architecture;
