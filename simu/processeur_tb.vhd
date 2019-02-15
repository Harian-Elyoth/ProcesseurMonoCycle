library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity processeur_tb is
end entity; 

architecture bench of processeur_tb is
  
  signal clk, rst : std_logic;
  
  
begin
  
  clock: process
  begin
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns ; 
    
  end process;
  -----------------------------------------------------------
  test: process(clk)
  begin
    
    
  end process;
end process;
end architecture;
  