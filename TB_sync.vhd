library IEEE;
use IEEE.std_logic_1164.all;

entity TB_sync is
end;

architecture beh of TB_sync is
	signal k,clk,rst,Z : std_logic:='0';
	signal Q: std_logic_vector(4 downto 0);
	component sync is
	port( 	k: in std_logic;
    		clk: in std_logic;
			rst: in std_logic;
            Z: out std_logic;
			Q: out std_logic_vector(4 downto 0));
	end component;

begin
	DUT: sync port map (k,clk,rst,Z,Q);
    
	clk <= not clk after 10 ns;
	rst <= '1','0' after 5 ns;
    k <= '0', '1' after 10 ns, '0' after 40 ns, '1' after 45 ns, '0' after 60 ns, '1' after 70 ns;
end;