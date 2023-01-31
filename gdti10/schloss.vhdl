library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity schloss is
  port (
    clk : in std_logic;
    echte_tasten : in std_logic_vector(1 to 3);
    echte_taste_reset : in std_logic;
    offen : out std_logic
  );
end schloss;

architecture behav of schloss is
  component key is port (
    clk : in std_logic;
    echte_taste : in std_logic;
    taste_wurde_gedrueckt : out std_logic
  ); end component;

  signal s_key_pressed : std_logic_vector(1 to 3) := "000";
  signal s_reset_pressed : std_logic := '0';
  begin
    l_key_1: key port map(clk, echte_tasten(1), s_key_pressed(1));
    l_key_2: key port map(clk, echte_tasten(2), s_key_pressed(2));
    l_key_3: key port map(clk, echte_tasten(3), s_key_pressed(3));
    l_key_reset: key port map(clk, echte_taste_reset, s_reset_pressed);
    
    process (clk) 
      variable v_state : integer := 1;
    begin
    if rising_edge(clk) then

        case v_state is
          when 1 => 
          if s_key_pressed(1) = '1' then v_state := 2; end if;
          if s_key_pressed(2) = '1' then v_state := 4; end if;
          if s_key_pressed(3) = '1' then v_state := 4; end if;
          when 2 => 
          if s_key_pressed(2) = '1' then v_state := 3; end if;
          if s_key_pressed(1) = '1' then v_state := 4; end if;
          if s_key_pressed(3) = '1' then v_state := 4; end if;
          when 3 => 
          if s_key_pressed(3) = '1' then v_state := 5; end if;
          if s_key_pressed(1) = '1' then v_state := 4; end if;
          if s_key_pressed(2) = '1' then v_state := 4; end if;
          when 4 =>
            if s_reset_pressed = '1' then
              offen <= '0';
              v_state := 1;
            end if;
          when 5 =>
            offen <= '1';
          if s_reset_pressed = '1' then
            offen <= '0';
            v_state := 1;
          end if;
          when others =>
        end case;

    end if;
  end process;
end architecture;
