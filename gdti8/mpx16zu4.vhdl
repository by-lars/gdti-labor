library ieee;
use ieee.std_logic_1164.all;

entity mpx16zu4 is
  port (
    a, b, c, d: in std_logic_vector(3 downto 0);
    sel : in std_logic_vector(1 downto 0);
    y : out std_logic_vector(3 downto 0)
  );
end mpx16zu4;

architecture behav of mpx16zu4 is
  component mpx4zu1 is port (
    a, b, c, d: in std_logic;
    sel : in std_logic_vector(1 downto 0);
    y : out std_logic
  ); end component;
begin
  mx1: mpx4zu1 port map(a(0), b(0), c(0), d(0), sel, y(0));
  mx2: mpx4zu1 port map(a(1), b(1), c(1), d(1), sel, y(1));
  mx3: mpx4zu1 port map(a(2), b(2), c(2), d(2), sel, y(2));
  mx4: mpx4zu1 port map(a(3), b(3), c(3), d(3), sel, y(3));

end architecture;
