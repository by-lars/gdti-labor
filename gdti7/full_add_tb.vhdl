library ieee;
use ieee.std_logic_1164.all;

entity full_add_tb is end full_add_tb;

architecture behav of full_add_tb is
  component full_add
    port (a, b, c_in: in std_logic;  sum, c_out : out std_logic);
  end component;
  signal a,b,c_in,sum,c_out : std_logic;
begin
  full_add_0: full_add port map (a, b, c_in,  sum, c_out);

  process begin
    -- diese und die folgende Zeile ersetzen durch geeignete Testfaelle
    -- report "testbench selbst erstellen!" severity error;

    a <= '0';
    b <= '0';
    c_in <= '0';
    wait for 1 fs;
    assert sum = '0' report "bad result for input 0 0 0" severity error;
    assert c_out = '0' report "bad result for input 0 0 0" severity error;
    wait for 1 fs;

    a <= '1';
    b <= '0';
    c_in <= '0';
    wait for 1 fs;
    assert sum = '1' report "bad result for input 1 0 0" severity error;
    assert c_out = '0' report "bad result for input 1 0 0" severity error;
    wait for 1 fs;

    a <= '1';
    b <= '1';
    c_in <= '0';
    wait for 1 fs;
    assert sum = '0' report "bad result for input 1 1 0" severity error;
    assert c_out = '1' report "bad result for input 1 1 0" severity error;
    wait for 1 fs;

    a <= '1';
    b <= '1';
    c_in <= '1';
    wait for 1 fs;
    assert sum = '1' report "bad result for input 1 1 1" severity error;
    assert c_out = '1' report "bad result for input 1 1 1" severity error;
    wait for 1 fs;

    
    a <= '0';
    b <= '1';
    c_in <= '0';
    wait for 1 fs;
    assert sum = '1' report "bad result for input 0 1 0" severity error;
    assert c_out = '0' report "bad result for input 0 1 0" severity error;
    wait for 1 fs;

    a <= '0';
    b <= '1';
    c_in <= '1';
    wait for 1 fs;
    assert sum = '0' report "bad result for input 0 1 1" severity error;
    assert c_out = '1' report "bad result for input 0 1 1" severity error;
    wait for 1 fs;

    a <= '0';
    b <= '0';
    c_in <= '1';
    wait for 1 fs;
    assert sum = '1' report "bad result for input 0 0 1" severity error;
    assert c_out = '0' report "bad result for input 0 0 1" severity error;
    wait for 1 fs;


    a <= '1';
    b <= '0';
    c_in <= '1';
    wait for 1 fs;
    assert sum = '0' report "bad result for input 1 0 1" severity error;
    assert c_out = '1' report "bad result for input 1 0 1" severity error;
    wait for 1 fs;

    assert false report "end of test" severity note;
    wait; --  Wait forever; this will finish the simulation.
  end process;
end behav;
