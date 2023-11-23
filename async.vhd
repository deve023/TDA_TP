-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity async is
    port (
        x: in std_logic_vector(2 downto 0);
        k: out std_logic_vector(1 downto 0));
end;

architecture beh of async is

signal y: std_logic_vector(2 downto 0);
signal sal: std_logic_vector(2 downto 0);

begin
    sal(2) <=  (not y(2) and y(0) and not x(2) and not x(0)) or (not y(1) and not y(0) and x(2) and x(1)) or (y(2) and not y(1) and not y(0) and x(2)) or (not y(2) and y(0) and x(2) and x(1)) or (y(2) and not y(1) and y(0) and not x(1) and not x(0));
    sal(1) <= (not y(2) and not y(1) and x(2) and not x(1) and not x(0)) or (not y(2) and y(0) and x(2) and not x(1) and not x(0));
    sal(0) <= (not y(2) and not y(1) and x(2) and not x(1)) or (not y(1) and y(0) and not x(2) and not x(1)) or (not y(2) and y(1) and y(0) and not x(1));
  
    k(0) <= not sal(2) and not sal(1) and sal(0);
    k(1) <= sal(0);
    
    y(2) <= sal(2);
    y(1) <= sal(1);
    y(0) <= sal(0);
end beh;
