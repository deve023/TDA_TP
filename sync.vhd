library IEEE;
use IEEE.std_logic_1164.all;

entity sync is
	port( 	k: in std_logic;
    		clk: in std_logic;
			rst: in std_logic;
            Z: out std_logic;
			Q: out std_logic_vector(4 downto 0));
end;

architecture sync_arch of sync is

signal D: std_logic_vector(4 downto 0);
signal Q_aux : std_logic_vector (4 downto 0);
    
component FF_D is
    port(
        D: in std_logic;
		clk: in std_logic;
		rst: in std_logic;
		Q: out std_logic);
end component;
begin
	D(0) <= k and not Q_aux(0) and (Q_aux(4) or Q_aux(3) or Q_aux(2) or Q_aux(1));
    FF0: FF_D port map ( D=>D(0), clk=>clk, rst=>rst, Q=>Q_aux(0));
    
    D(1) <= (not k) or (Q_aux(2) and not Q_aux(1) and not Q_aux(0)) or (Q_aux(3) and not Q_aux(1) and not Q_aux(0)) or (Q_aux(4) and not Q_aux(1) and not Q_aux(0)) or (Q_aux(1) and Q_aux(0));
    FF1: FF_D port map ( D=>D(1), clk=>clk, rst=>rst, Q=>Q_aux(1));
    
    D(2) <= (not k) or (Q_aux(2) and not Q_aux(1) and Q_aux(0)) or (Q_aux(2) and Q_aux(1) and not Q_aux(0)) or (Q_aux(2) and Q_aux(1) and Q_aux(0)) or (Q_aux(4) and Q_aux(2) and Q_aux(0)) or (Q_aux(3) and not Q_aux(2) and not Q_aux(1) and not Q_aux(0)) or (Q_aux(4) and not Q_aux(2) and not Q_aux(1) and not Q_aux(0));
    FF2: FF_D port map ( D=>D(2), clk=>clk, rst=>rst, Q=>Q_aux(2));
    
    D(3) <= (not k) or (Q_aux(3) and not Q_aux(2) and Q_aux(0)) or (Q_aux(3) and not Q_aux(2) and Q_aux(1)) or (not Q_aux(4) and Q_aux(3) and Q_aux(2)) or (Q_aux(4) and Q_aux(3) and Q_aux(2)) or (Q_aux(4) and not Q_aux(3) and not Q_aux(2) and not Q_aux(1) and not Q_aux(0));
    FF3: FF_D port map ( D=>D(3), clk=>clk, rst=>rst, Q=>Q_aux(3));
    
    D(4) <= (not k) or (Q_aux(4) and Q_aux(3)) or (Q_aux(4) and Q_aux(2)) or (Q_aux(4) and Q_aux(1)) or (Q_aux(4) and Q_aux(0));
    FF4: FF_D port map ( D=>D(4), clk=>clk, rst=>rst, Q=>Q_aux(4));
    
    Q <= Q_aux;
    Z <= not (Q_aux(4) or Q_aux(3) or Q_aux(2) or Q_aux(1) or Q_aux(0));
end; 
