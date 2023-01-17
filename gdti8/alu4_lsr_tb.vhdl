library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu4_lsr_tb is end alu4_lsr_tb;

architecture behav of alu4_lsr_tb is
  component alu4_lsr is
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
  the_alu: alu4_lsr port map (a,b,sel,result);

  process
  variable expect : integer;
  begin
    a <= "0101";  b <= "0011";  sel <= "00";
    wait for 1 fs;
    assert result = "1000" report "sel 00 is not ADD" severity error;

    for ai in 0 to 15 loop
      for bi in 0 to 4 loop
        a <= std_logic_vector(to_unsigned(ai, 4));
        b <= std_logic_vector(to_unsigned(bi, 4));
	sel <= "01";
        expect := ai;
        for ci in 1 to bi loop
          expect := expect / 2;
        end loop;
	wait for 1 fs;
	assert result = std_logic_vector(to_unsigned(expect, 4))
                 report "sel 01 is not LSR" severity error;
	wait for 1 fs;
      end loop;
    end loop;

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





