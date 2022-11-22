library ieee;
use ieee.std_logic_1164.all;

entity wuerfel_d2 is
  port (
    inputs : in std_logic_vector (2 downto 0);
    outputs : out std_logic_vector (6 downto 0)
  );
end wuerfel_d2;

architecture behav of wuerfel_d2 is
begin
    outputs(0) <= inputs(0);
    outputs(1) <= inputs(1) or inputs(2);
    outputs(2) <= inputs(1) or inputs(2);
    outputs(3) <= inputs(2);
    outputs(4) <= inputs(2);
    outputs(5) <= inputs(2) and inputs(1);
    outputs(6) <= inputs(2) and inputs(1);
end architecture;
