library ieee;
use ieee.std_logic_1164.all;

entity rs_latch_tb is end rs_latch_tb;

architecture behav of rs_latch_tb is
  component rs_latch is port(
    r, s : in std_logic;
    y, not_y : out std_logic
  ); end component;
  signal r,s,y,not_y : std_logic;
  signal expect_y, expect_not_y : std_logic;
begin
  rs_latch_0: rs_latch port map (r, s,  y, not_y);

  process
    type testvec is record r,s,y,ny : integer; end record;
    type testarray is array (natural range <>) of testvec;
    constant testlist : testarray := (
       (1,0,0,1),
       (0,0,0,1),
       (0,1,1,0),
       (0,0,1,0),
       (1,0,0,1),
       (0,0,0,1),
       (1,1,0,0)
    );
    variable errcnt : integer := 0;
  begin
    for i in testlist'range loop
      if testlist(i).r=1 then r<='1'; else r<='0'; end if;
      if testlist(i).s=1 then s<='1'; else s<='0'; end if;
      if testlist(i).y=1 then expect_y<='1'; else expect_y<='0'; end if;
      if testlist(i).ny=1 then expect_not_y<='1'; else expect_not_y<='0'; end if;
      wait for 1 fs;
      if y/=expect_y  or  not_y/=expect_not_y then
        report "rs_latch behaved wrongly" severity error;
        errcnt := errcnt + 1;
      end if;
    end loop;
    if errcnt=0 then
      report "rs_latch OK";
    else
      report "rs_latch test FAILED";
    end if;
    report "end of test.";
    wait; --  Wait forever; this will finish the simulation.
  end process;
end behav;
