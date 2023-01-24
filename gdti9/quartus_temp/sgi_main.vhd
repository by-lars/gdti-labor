-- this is an automatically generated file - no use in editing it
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity sgi_main_entity is
  port(
    clock_50:in std_logic;
    signal key:in std_logic_vector (1 downto 0);
    signal p_in:in std_logic_vector (1 to 16);
    signal p_out:inout std_logic_vector (1 to 16);  -- inout ?!?!?
    signal led:inout std_logic_vector (7 downto 0)  -- inout ?!?!?
  );
end;

architecture behav of sgi_main_entity is
  component wuerfel is
    port (
      clk : in std_logic;
      clk_enable : in std_logic;
      outputs : out std_logic_vector (6 downto 0)
    );
  end component;
  signal wleds : std_logic_vector(6 downto 0);
  signal clock_10khz:std_logic;
begin
  process(clock_50)
    ---- speed is selected by the number of bits in "div"
    ---- 24 --> 0.75 Hz
    ---- 15 --> 1.5 kHz
    variable div:std_logic_vector(14 downto 0):=(others=>'0');
  begin
    if rising_edge(clock_50) then
      if div=(div'range => '0') then
        div:=(div'range => '1');
        clock_10khz <= not clock_10khz;
      else
        div:=div-1;
      end if;
    end if;
  end process;

  p_out(1) <= wleds(0);
  p_out(2) <= wleds(1);
  p_out(3) <= wleds(2);
  p_out(4) <= wleds(3);
  p_out(5) <= wleds(4);
  p_out(6) <= wleds(5);
  p_out(7) <= wleds(6);
  the_main_instance: wuerfel port map(clock_10khz, p_in(1), wleds);

  led(0) <= clock_50;  -- debug
  led(1) <= key(0); -- suppress "unused pin led(x)" messages
  led(2) <= key(0);
  led(3) <= key(0);
  led(4) <= not key(1);
  led(5) <= not key(1);
  led(6) <= not key(1);
  led(7) <= not key(1);
end;
