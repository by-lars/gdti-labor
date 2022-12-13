library ieee;
use ieee.std_logic_1164.all;

entity d_ms_ff 
is port(
  d, clk : in std_logic;
  y, not_y : out std_logic
);
end d_ms_ff;

architecture behav of d_ms_ff is
component d_latch is 
port(
  d, clk : in std_logic;
  y, not_y : out std_logic
);
end component;
signal clk1, din, yout: std_logic;
begin
  latch_0: d_latch port map(d, clk, y => yout);
  latch_1: d_latch port map(d => din, clk => clk1, y => y, not_y => not_y);
  
  din <= yout;
  clk1 <= not clk;
end behav;
