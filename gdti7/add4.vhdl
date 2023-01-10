library ieee;
use ieee.std_logic_1164.all;

entity add4 is
  port (
    a, b : in std_logic_vector(3 downto 0);
    sum : out std_logic_vector(3 downto 0);
    carry : out std_logic
  );
end add4;

architecture behav of add4 is
  component full_add
    port (a, b, c_in: in std_logic;  sum, c_out : out std_logic);
  end component;
  -- hier eigene signale
  signal s_sum : std_logic_vector(3 downto 0);
  signal s_carry : std_logic_vector(3 downto 0);
begin
  l_add1: full_add port map(a(0), b(0), '0', sum => s_sum(0), c_out => s_carry(0));
  l_add2: full_add port map(a(1), b(1), s_carry(0), sum => s_sum(1), c_out => s_carry(1));
  l_add3: full_add port map(a(2), b(2), s_carry(1), sum => s_sum(2), c_out => s_carry(2));
  l_add5: full_add port map(a(3), b(3), s_carry(2), sum => s_sum(3), c_out => s_carry(3));
  carry <= s_carry(3);
  sum <= s_sum;
end architecture;
