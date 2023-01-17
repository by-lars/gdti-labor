library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mpx4zu1_tb is end mpx4zu1_tb;

architecture behav of mpx4zu1_tb is
  component mpx4zu1
    port ( a, b, c, d: in std_logic;
    sel : in std_logic_vector(1 downto 0);
    y : out std_logic
  );
  end component;
  signal a,b,c,d,y : std_logic;
  signal sel : std_logic_vector(1 downto 0);
begin
  mpx4zu1_0: mpx4zu1 port map (a,b,c,d,sel,y);

  process
  variable expect : integer;
  variable errcnt : integer := 0;
  begin
    for op in 0 to 3 loop
      for n in 0 to 15 loop
        if  n    mod 2=1 then a<='1'; else a<='0'; end if;
        if (n/2) mod 2=1 then b<='1'; else b<='0'; end if;
        if (n/4) mod 2=1 then c<='1'; else c<='0'; end if;
        if (n/8) mod 2=1 then d<='1'; else d<='0'; end if;
        sel <= std_logic_vector(to_unsigned(op, 2));
        case op is
          when 0 => expect :=  n    mod 2;
          when 1 => expect := (n/2) mod 2;
          when 2 => expect := (n/4) mod 2;
          when 3 => expect := (n/8) mod 2;
          when others =>
        end case;
        wait for 1 fs;
        if (expect=1 and y='0') or (expect=0 and y='1') then
          errcnt := errcnt + 1;
          report "Expected " & integer'image(expect) severity error;
        end if;
      end loop;
    end loop;
    report "end of test. " & integer'image(errcnt) & " errors" severity note;
    wait; --  Wait forever; this will finish the simulation.
  end process;
end behav;
