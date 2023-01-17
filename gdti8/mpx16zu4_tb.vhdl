library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mpx16zu4_tb is end mpx16zu4_tb;

architecture behav of mpx16zu4_tb is
  component mpx16zu4 is
    port (
      a, b, c, d: in std_logic_vector(3 downto 0);
      sel : in std_logic_vector(1 downto 0);
      y : out std_logic_vector(3 downto 0)
    );
  end component;
  signal a, b, c, d: std_logic_vector(3 downto 0);
  signal sel : std_logic_vector(1 downto 0);
  signal y : std_logic_vector(3 downto 0);
begin
  the_mpx: mpx16zu4 port map (a,b,c,d,sel,y);

  process
  variable expect : integer;
  variable errcnt : integer := 0;
  begin
    for auswahl in 0 to 3 loop
      for n in 0 to 65535 loop
        a <= std_logic_vector(to_unsigned((n     ) mod 16, 4));
        b <= std_logic_vector(to_unsigned((n/  16) mod 16, 4));
        c <= std_logic_vector(to_unsigned((n/ 256) mod 16, 4));
        d <= std_logic_vector(to_unsigned((n/4096) mod 16, 4));
        sel <= std_logic_vector(to_unsigned(auswahl, 2));
        case auswahl is
          when 0 => expect :=  n       mod 16;
          when 1 => expect := (n/  16) mod 16;
          when 2 => expect := (n/ 256) mod 16;
          when 3 => expect := (n/4096) mod 16;
          when others =>
        end case;
        wait for 1 fs;
        if (expect /= to_integer(unsigned(y))) then
          errcnt := errcnt + 1;
          report "Expected " & integer'image(expect) severity error;
        end if;
      end loop;
    end loop;
    report "end of test. " & integer'image(errcnt) & " errors" severity note;
    wait; --  Wait forever; this will finish the simulation.
  end process;
end behav;





