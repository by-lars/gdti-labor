library ieee;
use ieee.std_logic_1164.all;

entity wuerfel_dekoder is
  port (
    inputs : in std_logic_vector (2 downto 0);
    outputs : out std_logic_vector (6 downto 0)
  );
end wuerfel_dekoder;

architecture behav of wuerfel_dekoder is
begin
  process (inputs) begin
    case inputs is
      when "001" => outputs<="0000001";
      when "010" => outputs<="0000110";
      when "011" => outputs<="0000111";
      when "100" => outputs<="0011110";
      when "101" => outputs<="0011111";
      when "110" => outputs<="1111110";
      when others => outputs<="1111111";
    end case;
  end process;
end architecture;
