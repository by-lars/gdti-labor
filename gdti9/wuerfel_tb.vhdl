library ieee;
use ieee.std_logic_1164.all;

entity wuerfel_tb is end wuerfel_tb;

architecture behav of wuerfel_tb is
  component wuerfel port (
    clk : in std_logic;
    clk_enable : in std_logic;
    outputs : out std_logic_vector (6 downto 0)
  ); end component;
  signal clk : std_logic;
  signal clk_enable : std_logic;
  signal outputs : std_logic_vector (6 downto 0);
begin
  wuerfel_0: wuerfel port map (clk, clk_enable, outputs);

  process
  variable st, st_expect : integer;
  begin
    clk_enable <= '1';
    clk <= '0'; wait for 1 fs;
    clk <= '1'; wait for 1 fs;
    clk <= '0'; wait for 1 fs;
    if outputs="0000001" then
      st := 1;
    elsif outputs="0000110" or outputs="0011000" then
      st := 2;
    elsif outputs="0000111" or outputs="0011001" then
      st := 3;
    elsif outputs="0011110" then
      st := 4;
    elsif outputs="0011111" then
      st := 5;
    elsif outputs="1111110" then
      st := 6;
    else
      report "Bad state after initial clk pulse" severity error;
    end if;
    --report integer'image(st);

    for n in 1 to 20 loop
      clk <= '1'; wait for 1 fs;
      clk <= '0'; wait for 1 fs;
      st_expect := st+1;  if st_expect=7 then st_expect:=1; end if;
      if outputs="0000001" then
	st := 1;
      else if outputs="0000110" or outputs="0011000" then
	st := 2;
      else if outputs="0000111" or outputs="0011001" then
	st := 3;
      else if outputs="0011110" then
	st := 4;
      else if outputs="0011111" then
	st := 5;
      else if outputs="1111110" then
	st := 6;
      else
	report "Bad state after some clk pulse" severity error;
      end if; end if; end if; end if; end if; end if;
      if st /= st_expect then
        report "did not expect that state" severity error;
      end if;
    end loop;

    clk_enable <= '0';
    for n in 1 to 20 loop
      clk <= '1'; wait for 1 fs;
      clk <= '0'; wait for 1 fs;
      if outputs="0000001" then
	st := 1;
      else if outputs="0000110" or outputs="0011000" then
	st := 2;
      else if outputs="0000111" or outputs="0011001" then
	st := 3;
      else if outputs="0011110" then
	st := 4;
      else if outputs="0011111" then
	st := 5;
      else if outputs="1111110" then
	st := 6;
      else
	report "Bad state after some clk pulse" severity error;
      end if; end if; end if; end if; end if; end if;
      if st /= st_expect then
        report "did not expect that state (clk_enable is LOW!)" severity error;
      end if;
    end loop;

    assert false report "end of test" severity note;
    wait; --  Wait forever; this will finish the simulation.
  end process;
end behav;
