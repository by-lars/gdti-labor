library ieee;
use ieee.std_logic_1164.all;

entity alu4 is
  port (
    a, b : in std_logic_vector(3 downto 0);
    sel : in std_logic_vector(1 downto 0);
    result : out std_logic_vector(3 downto 0)
  );
end alu4;

architecture behav of alu4 is
  component alu4or2 is
    port ( a, b: in std_logic_vector(3 downto 0); y : out std_logic_vector(3 downto 0));
  end component;
  component alu4and2 is
    port ( a, b: in std_logic_vector(3 downto 0); y : out std_logic_vector(3 downto 0));
  end component;
  component alu4exor2 is
    port ( a, b: in std_logic_vector(3 downto 0); y : out std_logic_vector(3 downto 0));
  end component;
  component add4 is
    port ( a, b : in std_logic_vector(3 downto 0); sum : out std_logic_vector(3 downto 0); carry:out std_logic);
  end component;
  component mpx16zu4 is port (
    a, b, c, d: in std_logic_vector(3 downto 0);
    sel : in std_logic_vector(1 downto 0);
    y : out std_logic_vector(3 downto 0)
  ); end component;
  -- ein paar signale muss man sich hier auch noch definieren
  signal s_result_or : std_logic_vector(3 downto 0);
  signal s_result_and : std_logic_vector(3 downto 0);
  signal s_result_exor : std_logic_vector(3 downto 0);
  signal s_result_add : std_logic_vector(3 downto 0);

begin
  l_or: alu4or2 port map(a,b, s_result_or);
  l_and: alu4and2 port map(a,b, s_result_and);
  l_exor: alu4exor2 port map(a,b, s_result_exor);
  l_add: add4 port map(a,b, s_result_add);

  l_mxp: mpx16zu4 port map(s_result_add, s_result_or, s_result_and, s_result_exor, sel, result);

end architecture;
