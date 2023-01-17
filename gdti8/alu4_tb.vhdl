library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu4_tb is end alu4_tb;

architecture behav of alu4_tb is
  component alu4 is
    port (
      a, b : in std_logic_vector(3 downto 0);
      sel : in std_logic_vector(1 downto 0);
      result : out std_logic_vector(3 downto 0)
    );
  end component;
  signal a, b : std_logic_vector(3 downto 0);
  signal sel : std_logic_vector(1 downto 0);
  signal result : std_logic_vector(3 downto 0);
begin
  the_alu: alu4 port map (a,b,sel,result);

  process begin
    a <= "0101";  b <= "0011";  sel <= "00";
    wait for 1 fs;
    assert result = "1000" report "sel 00 is not ADD" severity error;

    a <= "0101";  b <= "0011";  sel <= "01";
    wait for 1 fs;
    assert result = "0111" report "sel 01 is not OR" severity error;

    a <= "0101";  b <= "0011";  sel <= "10";
    wait for 1 fs;
    assert result = "0001" report "sel 10 is not AND" severity error;

    a <= "0101";  b <= "0011";  sel <= "11";
    wait for 1 fs;
    assert result = "0110" report "sel 11 is not EXOR" severity error;

    report "end of test." severity note;
    wait; --  Wait forever; this will finish the simulation.
  end process;
end behav;





