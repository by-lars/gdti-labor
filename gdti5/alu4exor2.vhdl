library ieee;
use ieee.std_logic_1164.all;

entity alu4exor2 is
  port (
    a, b: in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0)
  );
end alu4exor2;

architecture behav of alu4exor2 is
begin
  process (a,b) begin
    y <= a xor b;
  end process;
end architecture;
