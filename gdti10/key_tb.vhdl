library ieee;
use ieee.std_logic_1164.all;

entity key_tb is end key_tb;

architecture behav of key_tb is

  component key port (
    clk : in std_logic;
    echte_taste : in std_logic;
    taste_wurde_gedrueckt : out std_logic
  ); end component;
  signal clk : std_logic;
  signal echte_taste : std_logic;
  signal taste_wurde_gedrueckt : std_logic;
begin
  singleton_of_taste: key port map (clk, echte_taste, taste_wurde_gedrueckt);

  process begin
    clk <= '0';
    echte_taste <= '0';
                        clk <= '1'; wait for 1 fs; clk <= '0'; wait for 1 fs;
    -- allow for init, bad but ok
                        clk <= '1'; wait for 1 fs; clk <= '0'; wait for 1 fs;
    assert taste_wurde_gedrueckt = '0' report "hu? Taste von alleine gedrueckt?" severity error;
                        clk <= '1'; wait for 1 fs; clk <= '0'; wait for 1 fs;
    assert taste_wurde_gedrueckt = '0' report "hu? Taste von alleine gedrueckt?" severity error;
                        clk <= '1'; wait for 1 fs; clk <= '0'; wait for 1 fs;
    assert taste_wurde_gedrueckt = '0' report "hu? Taste von alleine gedrueckt?" severity error;

    echte_taste <= '1';
                        clk <= '1'; wait for 1 fs; clk <= '0'; wait for 1 fs;
    assert taste_wurde_gedrueckt = '1' report "taste nicht erkannt" severity error;
                        clk <= '1'; wait for 1 fs; clk <= '0'; wait for 1 fs;
    assert taste_wurde_gedrueckt = '0' report "tastenausgang laenger als einen takt aktiv" severity error;

                        clk <= '1'; wait for 1 fs; clk <= '0'; wait for 1 fs;
    assert taste_wurde_gedrueckt = '0' report "hu? Taste von alleine wieder gedrueckt?" severity error;
                        clk <= '1'; wait for 1 fs; clk <= '0'; wait for 1 fs;
    assert taste_wurde_gedrueckt = '0' report "hu? Taste von alleine wieder gedrueckt?" severity error;
                        clk <= '1'; wait for 1 fs; clk <= '0'; wait for 1 fs;
    assert taste_wurde_gedrueckt = '0' report "hu? Taste von alleine wieder gedrueckt?" severity error;

    echte_taste <= '0';
                        clk <= '1'; wait for 1 fs; clk <= '0'; wait for 1 fs;
    assert taste_wurde_gedrueckt = '0' report "hu? Taste von alleine wieder gedrueckt?" severity error;
                        clk <= '1'; wait for 1 fs; clk <= '0'; wait for 1 fs;
    assert taste_wurde_gedrueckt = '0' report "hu? Taste von alleine wieder gedrueckt?" severity error;
                        clk <= '1'; wait for 1 fs; clk <= '0'; wait for 1 fs;
    assert taste_wurde_gedrueckt = '0' report "hu? Taste von alleine wieder gedrueckt?" severity error;

    echte_taste <= '1';
                        clk <= '1'; wait for 1 fs; clk <= '0'; wait for 1 fs;
    assert taste_wurde_gedrueckt = '1' report "taste nicht erkannt (2)" severity error;
                        clk <= '1'; wait for 1 fs; clk <= '0'; wait for 1 fs;
    assert taste_wurde_gedrueckt = '0' report "tastenausgang laenger als einen takt aktiv (2)" severity error;

                        clk <= '1'; wait for 1 fs; clk <= '0'; wait for 1 fs;
    assert taste_wurde_gedrueckt = '0' report "hu? Taste von alleine wieder gedrueckt? (2)" severity error;
                        clk <= '1'; wait for 1 fs; clk <= '0'; wait for 1 fs;
    assert taste_wurde_gedrueckt = '0' report "hu? Taste von alleine wieder gedrueckt? (2)" severity error;
                        clk <= '1'; wait for 1 fs; clk <= '0'; wait for 1 fs;
    assert taste_wurde_gedrueckt = '0' report "hu? Taste von alleine wieder gedrueckt? (2)" severity error;

    echte_taste <= '0';
                        clk <= '1'; wait for 1 fs; clk <= '0'; wait for 1 fs;
    assert taste_wurde_gedrueckt = '0' report "hu? Taste von alleine wieder gedrueckt?" severity error;
                        clk <= '1'; wait for 1 fs; clk <= '0'; wait for 1 fs;
    assert taste_wurde_gedrueckt = '0' report "hu? Taste von alleine wieder gedrueckt?" severity error;
                        clk <= '1'; wait for 1 fs; clk <= '0'; wait for 1 fs;
    assert taste_wurde_gedrueckt = '0' report "hu? Taste von alleine wieder gedrueckt?" severity error;

    assert false report "end of test" severity note;
    wait; --  Wait forever; this will finish the simulation.
  end process;
end behav;
