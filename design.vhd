library IEEE;
use IEEE.std_logic_1164.all;

entity alarma_anti_robo is
    port (
        x : in std_logic_vector(2 downto 0);
      	buzzer: out std_logic;
        led : out std_logic_vector(2 downto 0);
        clk: in std_logic;
        rst: in std_logic);
end;

architecture beh of alarma_anti_robo is

signal k: std_logic_vector(1 downto 0);
signal Q_aux: std_logic_vector(4 downto 0);

component async is
    port (
        x: in std_logic_vector(2 downto 0);
        k: out std_logic_vector(1 downto 0));
end component;

component sync is
	port( 	k: in std_logic;
    		clk: in std_logic;
			rst: in std_logic;
            Z: out std_logic;
			Q: out std_logic_vector(4 downto 0));
end component;

begin
ASYNC1: async port map (x,k);
SYNC1: sync port map (k=>k(0), clk=>clk, rst=>rst, Z=>buzzer, Q=>Q_aux);

led(0) <= x(0);
led(1) <= k(1);
led(2) <= k(0);
end beh;