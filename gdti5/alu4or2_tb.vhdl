library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu4or2_tb is end alu4or2_tb;

architecture behav of alu4or2_tb is
  component alu4or2
    port ( a, b: in std_logic_vector(3 downto 0);
           y : out std_logic_vector(3 downto 0));
  end component;
  signal in1, in2, result : std_logic_vector(3 downto 0);
  signal expect : std_logic_vector(3 downto 0);
begin
  or2_0: alu4or2 port map (a=>in1, b=>in2, y=>result);

  process
    variable errcnt : integer:= 0;
    variable a,b,y : integer;
  begin
    for ai in 0 to 15 loop
      for bi in 0 to 15 loop
        in1 <= std_logic_vector(to_unsigned(ai, 4));
        in2 <= std_logic_vector(to_unsigned(bi, 4));
        for i in 0 to 3 loop
          a := (ai / (2**i)) mod 2;
          b := (bi / (2**i)) mod 2;
    -- die folgende Zeile muss and/or/xor machen, je nachdem was geprueft werden soll
          if (a=1) or (b=1) then y:=1; else y:=0; end if;
          if y=1 then expect(i)<='1'; else expect(i)<='0'; end if;
        end loop;
        wait for 1 fs;
        if expect /= result then
          errcnt := errcnt + 1;
          report "falsch" severity error;
        end if;
        wait for 1 fs;
      end loop;
    end loop;
    if errcnt=0 then
      report "Had no errors";
    else
      report "Had " & integer'image(errcnt) & " errors";
    end if;
    assert false report "end of test" severity note;
    wait; --  Wait forever; this will finish the simulation.
  end process;
end behav;
