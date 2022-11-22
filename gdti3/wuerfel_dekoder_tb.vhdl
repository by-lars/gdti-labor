library ieee;
use ieee.std_logic_1164.all;

entity wuerfel_dekoder_tb is end wuerfel_dekoder_tb;

architecture behav of wuerfel_dekoder_tb is
  component wuerfel_dekoder port (
    inputs : in std_logic_vector (2 downto 0);
    outputs : out std_logic_vector (6 downto 0)
  ); end component;
  signal inputs : std_logic_vector(2 downto 0);
  signal outputs : std_logic_vector (6 downto 0);
begin
  wuerfel_0: wuerfel_dekoder port map (inputs, outputs);

  process begin
    inputs <= "001"; wait for 1 fs;
    assert outputs = "0000001" report "bad result for input 0 0 1" severity error;
    wait for 1 fs;

    inputs <= "010"; wait for 1 fs;
    assert outputs = "0000110"
        or outputs = "0011000" report "bad result for input 0 1 0" severity error;
    wait for 1 fs;

    inputs <= "011"; wait for 1 fs;
    assert outputs = "0000111"
        or outputs = "0011001" report "bad result for input 0 1 1" severity error;
    wait for 1 fs;

    inputs <= "100"; wait for 1 fs;
    assert outputs = "0011110" report "bad result for input 1 0 0" severity error;
    wait for 1 fs;

    inputs <= "101"; wait for 1 fs;
    assert outputs = "0011111" report "bad result for input 1 0 1" severity error;
    wait for 1 fs;

    inputs <= "110"; wait for 1 fs;
    assert outputs = "1111110" report "bad result for input 1 1 0" severity error;
    wait for 1 fs;

    assert false report "end of test" severity note;
    wait; --  Wait forever; this will finish the simulation.
  end process;
end behav;
