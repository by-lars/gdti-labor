library ieee;
use ieee.std_logic_1164.all;

entity d_latch 
is port(
  d, clk : in std_logic;
  y, not_y : out std_logic
);
end d_latch;

architecture behav of d_latch is
  component rs_latch is port(
    r, s : in std_logic;
    y, not_y : out std_logic
  ); end component;
  signal r, s: std_logic;
begin 
  latch: rs_latch port map (r,s,y, not_y);
  r <= (not d) and clk;
  s <= d and clk;
end behav;
