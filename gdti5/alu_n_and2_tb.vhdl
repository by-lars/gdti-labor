library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_n_and2_tb is end alu_n_and2_tb;

architecture behav of alu_n_and2_tb is
  constant my_width : integer := 7;
  constant pow2_of_my_width : integer := 2**my_width - 1;
  component alu_n_and2
    generic (width : integer := 4);
    port ( a, b: in std_logic_vector(width-1 downto 0);
           y : out std_logic_vector(width-1 downto 0));
  end component;
  signal in1, in2, result : std_logic_vector(my_width-1 downto 0);
  signal expect : std_logic_vector(my_width-1 downto 0);
begin
  and2_0: alu_n_and2 generic map(width=>my_width) port map (a=>in1, b=>in2, y=>result);

  process
    variable cnt : integer:= 0;
    variable errcnt : integer:= 0;
    variable a,b,y : integer;
  begin
    for ai in 0 to pow2_of_my_width loop
      for bi in 0 to pow2_of_my_width loop
        in1 <= std_logic_vector(to_unsigned(ai, my_width));
        in2 <= std_logic_vector(to_unsigned(bi, my_width));
        for i in 0 to my_width-1 loop
          a := (ai / (2**i)) mod 2;
          b := (bi / (2**i)) mod 2;
    -- die folgende Zeile muss and/or/xor machen, je nachdem was geprueft werden soll
          if (a=1) and (b=1) then y:=1; else y:=0; end if;
          if y=1 then expect(i)<='1'; else expect(i)<='0'; end if;
        end loop;
        wait for 1 fs;
        if expect /= result then
          errcnt := errcnt + 1;
          report "falsch" severity error;
        end if;
        wait for 1 fs;
        cnt := cnt + 1;
      end loop;
    end loop;
    if errcnt=0 then
      report integer'image(cnt) & " tests done. Had no errors";
    else
      report "Had " & integer'image(errcnt) & " errors";
    end if;
    assert false report "end of test" severity note;
    wait; --  Wait forever; this will finish the simulation.
  end process;
end behav;
