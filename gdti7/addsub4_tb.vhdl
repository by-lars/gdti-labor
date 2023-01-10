library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity addsub4_tb is end addsub4_tb;

architecture behav of addsub4_tb is
  component addsub4 port(
    a, b : in std_logic_vector(3 downto 0);
    do_add : in std_logic;
    sum : out std_logic_vector(3 downto 0);
    carry : out std_logic
  ); end component;
  signal a,b,sum : std_logic_vector(3 downto 0);
  signal c_in, do_add, carry : std_logic;
begin
  addsub4_0: addsub4 port map (a, b, do_add,  sum, carry);

  process
    variable si, errcnt : integer;
    variable aii, bii : integer;
  begin
    errcnt := 0;
    for bi in 0 to 15 loop
      for ai in 0 to 15 loop
        a <= std_logic_vector(to_unsigned(ai, 4));
        b <= std_logic_vector(to_unsigned(bi, 4));
        do_add <= '1';
        wait for 1 fs;
        si := to_integer(unsigned(sum));
        if carry='1' then si := si + 16; end if;
        if (ai+bi) mod 32 /= si then
          errcnt := errcnt + 1;
          report integer'image(ai) & "+" & integer'image(bi) & " ==> " & integer'image(ai+bi) & " but simulation returns " & integer'image(si) severity error;
        end if;
        wait for 1 fs;
      end loop;
    end loop;

    for bi in 0 to 15 loop
      for ai in 0 to 15 loop
        a <= std_logic_vector(to_unsigned(ai, 4));
        b <= std_logic_vector(to_unsigned(bi, 4));
        do_add <= '0';
        wait for 1 fs;
        si := to_integer(unsigned(sum));
        if carry='0' then si := si - 16; end if;
        if ai>7 then aii := -(16-ai);  else  aii := ai; end if;
        if bi>7 then bii := -(16-bi);  else  bii := bi; end if;
        if (ai-bi) /= si then 
	  errcnt := errcnt + 1;
	  report integer'image(ai) & "+" & integer'image(bi) & " ==> " & integer'image(ai-bi) & " but simulation returns " & integer'image(si) severity error;
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
