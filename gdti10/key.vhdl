library ieee;
use ieee.std_logic_1164.all;

entity key is
  port (
    clk : in std_logic;
    echte_taste : in std_logic;
    taste_wurde_gedrueckt : out std_logic
  );
end key;

architecture behav of key is
  signal last_key : std_logic := '0';
begin
  process (clk) begin
    if rising_edge(clk) then
      
      taste_wurde_gedrueckt <= (not last_key) and echte_taste;
      last_key <= echte_taste;

    end if;
  end process;
end architecture;
