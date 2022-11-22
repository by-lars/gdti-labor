library ieee;
use ieee.std_logic_1164.all;

entity f2_tb is end f2_tb;

architecture behav of f2_tb is
  component f2
    port ( a, b, c: in std_logic;   y : out std_logic);
  end component;
  signal a,b,c, y : std_logic;
begin
  f2_0: f2 port map (a, b, c, y);

  process begin
    a <= '0'; b <= '0'; c <= '0'; wait for 1 fs;
    assert y = '0' report "bad result for input 0 0 0" severity error;
    wait for 1 fs;

    a <= '0'; b <= '0'; c <= '1'; wait for 1 fs;
    assert y = '1' report "bad result for input 0 0 1" severity error;
    wait for 1 fs;

    a <= '0'; b <= '1'; c <= '0'; wait for 1 fs;
    assert y = '1' report "bad result for input 0 1 0" severity error;
    wait for 1 fs;

    a <= '0'; b <= '1'; c <= '1'; wait for 1 fs;
    assert y = '1' report "bad result for input 0 1 1" severity error;
    wait for 1 fs;

    a <= '1'; b <= '0'; c <= '0'; wait for 1 fs;
    assert y = '0' report "bad result for input 1 0 0" severity error;
    wait for 1 fs;

    a <= '1'; b <= '0'; c <= '1'; wait for 1 fs;
    assert y = '0' report "bad result for input 1 0 1" severity error;
    wait for 1 fs;

    a <= '1'; b <= '1'; c <= '0'; wait for 1 fs;
    assert y = '0' report "bad result for input 1 1 0" severity error;
    wait for 1 fs;

    a <= '1'; b <= '1'; c <= '1'; wait for 1 fs;
    assert y = '1' report "bad result for input 1 1 1" severity error;
    wait for 1 fs;

    assert false report "end of test" severity note;
    wait; --  Wait forever; this will finish the simulation.
  end process;
end behav;
