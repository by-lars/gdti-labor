library ieee;
use ieee.std_logic_1164.all;

entity rs_latch is
  port (
    r, s : in std_logic;
    y, not_y : out std_logic
  );
end rs_latch;


architecture behav of rs_latch is
signal q : std_logic;
signal not_q : std_logic;
  begin

  q <= r nor not_q;
  not_q <= s nor q;

  not_y <= not_q;
  y <= q;

end architecture;
