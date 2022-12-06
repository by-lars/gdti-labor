library ieee;
use ieee.std_logic_1164.all;

entity oder is
  port (
    a, b: in std_logic;
    y : out std_logic
  );
end oder;

architecture behav of oder is
begin
  y <= a or b;
end architecture;
