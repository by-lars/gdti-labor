library ieee;
use ieee.std_logic_1164.all;

entity lsr is
  port (
    a, b: in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0)
  );
end lsr;

architecture behav of lsr is
  begin
    process (a,b) begin
      case b is
        when "0000" => y <= a;
        when "0001" => 
        y(0) <= a(1);
        y(1) <= a(2);
        y(2) <= a(3);
        y(3) <= '0';
        when "0010" => 
        y(0) <= a(2);
        y(1) <= a(3);
        y(2) <= '0';
        y(3) <= '0';
        when "0011" => 
        y(0) <= a(3);
        y(1) <= '0';
        y(2) <= '0';
        y(3) <= '0';
        when "0100" => 
        y(0) <= '0';
        y(1) <= '0';
        y(2) <= '0';
        y(3) <= '0';
        when others =>
      end case;
    end process;

end architecture;
