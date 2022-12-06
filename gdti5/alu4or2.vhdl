library ieee;
use ieee.std_logic_1164.all;

entity alu4or2 is
  port (
    a, b: in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0)
  );
end alu4or2;

architecture behav of alu4or2 is
  component oder is port (a, b: in std_logic; y : out std_logic); end component;
begin
  or1: oder port map(a => a(0),b => b(0),y => y(0));
  or2: oder port map(a => a(1),b => b(1),y => y(1));
  or3: oder port map(a => a(2),b => b(2),y => y(2));
  or4: oder port map(a => a(3),b => b(3),y => y(3));
end architecture;
