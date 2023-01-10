library ieee;
use ieee.std_logic_1164.all;

entity full_add is
  port (
    a, b, c_in : in std_logic;
    sum, c_out : out std_logic
  );
end full_add;

architecture behav of full_add is
begin
  sum <= (a xor b) xor c_in;
  c_out <= (c_in and (a xor b)) or (a and b);
end architecture;
