library ieee;
use ieee.std_logic_1164.all;

entity nicht is
  port (
    a: in std_logic;
    y : out std_logic
  );
end nicht;

architecture behav of nicht is
begin
  y <= not a;
end architecture;
