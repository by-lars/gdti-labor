library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity add4_tb is end add4_tb;

architecture behav of add4_tb is
  component add4 port(
    a, b : in std_logic_vector(3 downto 0);
    sum : out std_logic_vector(3 downto 0);
    carry : out std_logic
  ); end component;
  signal a,b,sum : std_logic_vector(3 downto 0);
  signal carry : std_logic;
begin
  add4_0: add4 port map (a, b,  sum, carry);

  process
    variable si, errcnt : integer;
  begin
    errcnt := 0;
    for bi in 0 to 15 loop
      for ai in 0 to 15 loop
        a <= std_logic_vector(to_unsigned(ai, 4));
        b <= std_logic_vector(to_unsigned(bi, 4));
        wait for 1 fs;
        si := to_integer(unsigned(sum));
        if carry = '1' then si := si + 16; end if;
        if (ai+bi) mod 32 /= si then
          errcnt := errcnt + 1;
          report integer'image(ai) & "+" & integer'image(bi) & " ==> " & integer'image(ai+bi) & " but simulation returns " & integer'image(si) severity error;
        end if;
        wait for 1 fs;
      end loop;
    end loop;
    if errcnt=0 then
      report "Had no errors";
    else
      report "Had " & integer'image(errcnt) & " errors";
    end if;
    report "end of test.";
    wait; --  Wait forever; this will finish the simulation.
  end process;
end behav;
