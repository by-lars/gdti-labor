library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ctr_1_to_6 is
  port (
    clk : in std_logic;
    clk_enable : in std_logic;
    ctr_value : out std_logic_vector(2 downto 0)
  );
end ctr_1_to_6;

architecture behav of ctr_1_to_6 is 
begin
    process (clk) 
        variable v_Counter : integer := 1;
    begin
        if falling_edge(clk) and clk_enable='1' then
            v_Counter := v_Counter + 1;

            if v_Counter = 7 then 
                v_Counter := 1; 
            end if;

            ctr_value <= std_logic_vector(to_unsigned(v_Counter, ctr_value'length));

        end if;
    end process;
end architecture;
