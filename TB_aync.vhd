library IEEE;
use IEEE.std_logic_1164.all;


entity TB_async is
end;

architecture Test of TB_async is
signal x: std_logic_vector(2 downto 0);
signal k: std_logic_vector(1 downto 0);

component async  port (
    x: in std_logic_vector(2 downto 0);
    k: out std_logic_vector(1 downto 0));
end component;

begin
    DUT: async port map (x, k);
    
    x(0) <= '0', '0' after 10 ns, '1' after 30 ns;
    x(1) <= '1', '0' after 10 ns, '1' after 50 ns, '0' after 60 ns;
    x(2) <= '0', '1' after 10 ns, '0' after 20 ns;
end Test;