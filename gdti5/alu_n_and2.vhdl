library ieee;
use ieee.std_logic_1164.all;

entity alu_n_and2 is
  generic(width: integer);
  port (
    a, b: in std_logic_vector(width-1 downto 0);
    y : out std_logic_vector(width-1 downto 0)
  );
end alu_n_and2;

architecture behav of alu_n_and2 is
begin
-- die schmarte lösung: 
--  y <= a and b;

-- loopy doopy
  gen: for i in 0 to width-1 generate
    y(i) <= a(i) and b(i); 
  end generate;
end architecture;
