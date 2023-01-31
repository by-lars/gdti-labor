library ieee;
use ieee.std_logic_1164.all;

entity schloss_tb is end schloss_tb;

architecture behav of schloss_tb is
  component schloss is port (
    clk : in std_logic;
    echte_tasten : in std_logic_vector(1 to 3);
    echte_taste_reset : in std_logic;
    offen : out std_logic
  ); end component;
  signal clk : std_logic;
  signal echte_tasten : std_logic_vector(1 to 3);
  signal echte_taste_reset : std_logic;
  signal offen : std_logic;
begin
  schloss_instance: schloss port map(clk, echte_tasten, echte_taste_reset, offen);

  process
    variable i : integer := 0;
    variable t1,t2,t3,t4 : integer;
    variable ok : integer := -1;
  begin
    echte_tasten <= "000";  echte_taste_reset <= '0';
    clk<='0'; wait for 1 fs;

    while i < 3*3*3*3 loop
      t4 := 1 + (i mod 3);
      t3 := 1 + ((i / 3) mod 3);
      t2 := 1 + ((i / 9) mod 3);
      t1 := 1 + ((i / 27));
      i := i + 1;
      --report integer'image(t1) & "-" & integer'image(t2) & "-" & integer'image(t3) & "-" & integer'image(t4);
      echte_tasten <= "000";
      echte_taste_reset <= '0';
                     wait for 1 fs;
                     clk<='1'; wait for 2 fs; clk<='0'; wait for 2 fs;
                     clk<='1'; wait for 2 fs; clk<='0'; wait for 2 fs;
                     clk<='1'; wait for 2 fs; clk<='0'; wait for 1 fs; 
      -- ein mal reset druecken
      report "Drücke Taste 'reset'";
      echte_taste_reset <= '1';
                     wait for 1 fs;
                     clk<='1'; wait for 2 fs; clk<='0'; wait for 2 fs;
                     clk<='1'; wait for 2 fs; clk<='0'; wait for 2 fs;
                     clk<='1'; wait for 2 fs; clk<='0'; wait for 1 fs; 
      echte_taste_reset <= '0';
                     wait for 1 fs;
                     clk<='1'; wait for 2 fs; clk<='0'; wait for 2 fs;
                     clk<='1'; wait for 2 fs; clk<='0'; wait for 2 fs;
                     clk<='1'; wait for 2 fs; clk<='0'; wait for 1 fs; 
      if offen='1' then report "Schloss offen nach (nur!) 'reset'" severity failure; end if;
      -- erste taste druecken
      report "Drücke Taste '"&integer'image(t1)&"'";
      echte_tasten(t1)<='1';
                     wait for 1 fs;
                     clk<='1'; wait for 2 fs; clk<='0'; wait for 2 fs;
                     clk<='1'; wait for 2 fs; clk<='0'; wait for 2 fs;
                     clk<='1'; wait for 2 fs; clk<='0'; wait for 1 fs; 
      echte_tasten(t1)<='0';
                     wait for 1 fs;
                     clk<='1'; wait for 2 fs; clk<='0'; wait for 2 fs;
                     clk<='1'; wait for 2 fs; clk<='0'; wait for 2 fs;
                     clk<='1'; wait for 2 fs; clk<='0'; wait for 1 fs; 
      if offen='1' then report "Schloss offen nach 'reset' und nur einer weiteren Taste?!?" severity failure; end if;
      -- zweite taste druecken
      report "Drücke Taste '"&integer'image(t2)&"'";
      echte_tasten(t2)<='1';
                     wait for 1 fs;
                     clk<='1'; wait for 2 fs; clk<='0'; wait for 2 fs;
                     clk<='1'; wait for 2 fs; clk<='0'; wait for 2 fs;
                     clk<='1'; wait for 2 fs; clk<='0'; wait for 1 fs; 
      echte_tasten(t2)<='0';
                     wait for 1 fs;
                     clk<='1'; wait for 2 fs; clk<='0'; wait for 2 fs;
                     clk<='1'; wait for 2 fs; clk<='0'; wait for 2 fs;
                     clk<='1'; wait for 2 fs; clk<='0'; wait for 1 fs; 
      if offen='1' then report "Schloss offen nach 'reset' und nur zwei weiteren Tasten?!?" severity failure; end if;
      -- dritte taste druecken
      report "Drücke Taste '"&integer'image(t3)&"'";
      echte_tasten(t3)<='1';
                     wait for 1 fs;
                     clk<='1'; wait for 2 fs; clk<='0'; wait for 2 fs;
                     clk<='1'; wait for 2 fs; clk<='0'; wait for 2 fs;
                     clk<='1'; wait for 2 fs; clk<='0'; wait for 1 fs; 
      echte_tasten(t3)<='0';
                     wait for 1 fs;
                     clk<='1'; wait for 2 fs; clk<='0'; wait for 2 fs;
                     clk<='1'; wait for 2 fs; clk<='0'; wait for 2 fs;
                     clk<='1'; wait for 2 fs; clk<='0'; wait for 1 fs; 
      if offen='1' then
        if ok=-1 then
          report "Schloss offen nach 'reset' und " & integer'image(t1) & "-" & integer'image(t2) & "-" & integer'image(t3);
          ok := i;
          i := i + 2; -- skip pressing fourth key at all
        else
	  t3 := 1 + ((ok / 3) mod 3);
	  t2 := 1 + ((ok / 9) mod 3);
	  t1 := 1 + ((ok / 27));
          report "Aber es war doch mit dem code 'reset' und " & integer'image(t1) & "-" & integer'image(t2) & "-" & integer'image(t3) & " auch schon offen ?!?" severity failure;
        end if;
      else
	-- vierte taste druecken
	report "Drücke Taste '"&integer'image(t4)&"'";
	echte_tasten(t4)<='1';
		       wait for 1 fs;
		       clk<='1'; wait for 2 fs; clk<='0'; wait for 2 fs;
		       clk<='1'; wait for 2 fs; clk<='0'; wait for 2 fs;
		       clk<='1'; wait for 2 fs; clk<='0'; wait for 1 fs; 
	echte_tasten(t4)<='0';
		       wait for 1 fs;
		       clk<='1'; wait for 2 fs; clk<='0'; wait for 2 fs;
		       clk<='1'; wait for 2 fs; clk<='0'; wait for 2 fs;
		       clk<='1'; wait for 2 fs; clk<='0'; wait for 1 fs; 
	if offen='1' then report "Schloss offen nach 'reset' und vier weiteren Tasten?!?" severity failure; end if;
      end if;

    end loop;
    t3 := 1 + ((ok / 3) mod 3);
    t2 := 1 + ((ok / 9) mod 3);
    t1 := 1 + ((ok / 27));
    report "=====> Einziger gefundener gueltiger code ist 'reset-"
         & integer'image(t1) & "-" & integer'image(t2) & "-" & integer'image(t3) & "'";
    report "=====> Test bestanden";
    report "end of test";
    wait;

  end process;
end architecture;
