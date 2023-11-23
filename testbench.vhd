library IEEE;
use IEEE.std_logic_1164.all;

entity TB_alarma_anti_robo is
end;

architecture Test of TB_alarma_anti_robo is

signal buzzer, clk, rst : std_logic:='0';
signal x,led : std_logic_vector(2 downto 0);

component alarma_anti_robo  port (
    x: in std_logic_vector(2 downto 0);
    buzzer: out std_logic;
    led : out std_logic_vector(2 downto 0);
    clk: in std_logic;
    rst: in std_logic);
end component;

begin
  DUT: alarma_anti_robo port map(x, buzzer, led, clk, rst);
  
  clk <= not clk after 1 ns;
  rst <= '1','0' after 5 ns;
  x(2) <= '0', '1' after 10 ns, '0' after 15 ns, '1' after 65 ns, '0' after 70 ns;
  x(1) <= '1', '0' after 5 ns, '1' after 50 ns, '0' after 60 ns, '1' after 145 ns;
  x(0) <= '0', '1' after 5 ns, '0' after 6 ns, '1' after 40 ns, '0' after 70 ns, '1' after 80 ns;
end Test;
