library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ctr_1_to_6_tb is end ctr_1_to_6_tb;

architecture behav of ctr_1_to_6_tb is
  component ctr_1_to_6 is
    port (
      clk : in std_logic;
      clk_enable : in std_logic;
      ctr_value : out std_logic_vector(2 downto 0)
    );
  end component;
  signal clk : std_logic;
  signal clk_enable : std_logic;
  signal ctr_value : std_logic_vector(2 downto 0);
begin
  the_instance: ctr_1_to_6 port map (clk, clk_enable, ctr_value);

  process
  variable expect : integer;
  begin
    -- initialise ctr
    clk_enable <= '1';
    clk <= '0'; wait for 1 fs;
    clk <= '1'; wait for 1 fs;
    clk <= '0'; wait for 1 fs;
    expect := to_integer(unsigned(ctr_value));
    if (expect < 1) or (6 < expect) then
      report "ctr not in range 1..6 after first clk" severity error;
    end if;
    -- now do 20 clk ticks and look for proper counting
    for n in 1 to 20 loop
      clk <= '1'; wait for 1 fs;
      if expect < 6 then
        expect := expect + 1;
      else
        expect := 1;
      end if;
      clk <= '0'; wait for 1 fs;
      -- report integer'image(n) & " " & integer'image(expect);
      if expect /= to_integer(unsigned(ctr_value)) then
        report "ctr not doing cycle 1..6" severity error;
      end if;
    end loop;
    -- now do 20 clk ticks and look for no counting
    clk_enable <= '0';
    for n in 1 to 20 loop
      clk <= '1'; wait for 1 fs;
      clk <= '0'; wait for 1 fs;
      -- report integer'image(n) & " " & integer'image(expect);
      if expect /= to_integer(unsigned(ctr_value)) then
        report "ctr not stable while clk_enable is 0" severity error;
      end if;
    end loop;
    report "end of test." severity note;
    wait; --  Wait forever; this will finish the simulation.
  end process;
end behav;
