library ieee;
use ieee.std_logic_1164.all;

entity d_ms_ff_tb is end d_ms_ff_tb;

architecture behav of d_ms_ff_tb is
  component d_ms_ff is port(
    d, clk : in std_logic;
    y, not_y : out std_logic
  ); end component;
  signal d,clk, y,not_y : std_logic;
  signal expect_y,expect_not_y : std_logic;
begin
  d_ms_ff_0: d_ms_ff port map (d, clk,  y, not_y);

  process
    type testvec is record  d,clk,y,ny : integer; end record;
    type testarray is array (natural range <>) of testvec;
    constant testlist : testarray := (
       (0,1, 2,2),
       (0,0, 0,1),
       (1,0, 0,1),
       (1,1, 0,1),
       (1,0, 1,0),
       (1,1, 1,0),
       (1,0, 1,0),
       (0,1, 1,0),
       (0,0, 0,1),
       (0,1, 0,1),
       (0,0, 0,1),
       (1,0, 0,1)
    );
    variable errcnt : integer := 0;
  begin
    for i in testlist'range loop
      if testlist(i).d=1 then d<='1'; else d<='0'; end if;
      if testlist(i).clk=1 then clk<='1'; else clk<='0'; end if;
      if testlist(i).y=1 then expect_y<='1'; else expect_y<='0'; end if;
      if testlist(i).ny=1 then expect_not_y<='1'; else expect_not_y<='0'; end if;
      wait for 1 fs;
      if testlist(i).y/=2 then
        if y/=expect_y  or  not_y/=expect_not_y then
          report "clocked d ms_ff behaved wrongly" severity error;
          errcnt := errcnt + 1;
        end if;
      end if;
    end loop;
    if errcnt=0 then
      report "clocked d ms_ff OK";
    else
      report "clocked d ms_ff test FAILED";
    end if;
    report "end of test.";
    wait; --  Wait forever; this will finish the simulation.
  end process;
end behav;
