library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity wuerfel is
  port (
    clk : in std_logic;
    clk_enable : in std_logic;
    outputs : out std_logic_vector (6 downto 0)
  );
end wuerfel;

architecture behav of wuerfel is 
component ctr_1_to_6 is
    port (clk : in std_logic; clk_enable : in std_logic; ctr_value : out std_logic_vector(2 downto 0));
end component;
component wuerfel_dekoder is
    port (inputs : in std_logic_vector (2 downto 0); outputs : out std_logic_vector (6 downto 0));
end component;
signal s_CountValue : std_logic_vector (2 downto 0) := "001";
begin
    l_counter: ctr_1_to_6 port map(clk, clk_enable, s_CountValue);
    l_Wuerfel: wuerfel_dekoder port map(s_CountValue, outputs);
end architecture;
