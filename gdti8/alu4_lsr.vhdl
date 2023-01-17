library ieee;
use ieee.std_logic_1164.all;

entity alu4_lsr is
  port (
    a, b : in std_logic_vector(3 downto 0);
    sel : in std_logic_vector(1 downto 0);
    result : out std_logic_vector(3 downto 0)
  );
end alu4_lsr;

architecture behav of alu4_lsr is
  component lsr is
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

  signal s_result_lsr : std_logic_vector(3 downto 0);
  signal s_result_and : std_logic_vector(3 downto 0);
  signal s_result_exor : std_logic_vector(3 downto 0);
  signal s_result_add : std_logic_vector(3 downto 0);
begin
  l_lsr: lsr port map(a,b, s_result_lsr);
  l_and: alu4and2 port map(a,b, s_result_and);
  l_exor: alu4exor2 port map(a,b, s_result_exor);
  l_add: add4 port map(a,b, s_result_add);

  l_mxp: mpx16zu4 port map(s_result_add, s_result_lsr, s_result_and, s_result_exor, sel, result);

end architecture;
