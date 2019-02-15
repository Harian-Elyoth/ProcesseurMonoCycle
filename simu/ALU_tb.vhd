library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU_tb is
end entity;

Architecture BENCH of ALU_tb is
  
  SIGNAL TOP : std_logic_vector(1 downto 0);
  SIGNAL TA, TB, TS : std_logic_vector(31 downto 0);
  SIGNAL TN : std_logic;
  
begin
  
  process
    
    begin
  
    TA <= "00000000000000000000000000000001"; 
    TB <= "00000000000000000000000000000010"; 
    TOP <= "00";
  
    wait for 10 ns;
  
    assert TS = "00000000000000000000000000000011" report "Erreur sur L'addition";
    assert TN = '0' report "erreur de signe";
    wait for 5 ns;
    
    TOP <= "01";
    
    wait for 10 ns;
    
    assert TS = "00000000000000000000000000000010" report "Erreur sur affec B" ;
    assert TN = '0' report "erreur de signe";
    
    wait for 5 ns;
    
    TOP <= "10";
    
    wait for 10 ns ;
    
    assert TS = "11111111111111111111111111111111" REPORT "ERREUR SUR LA SOUSTRACTION";
    assert TN = '1' report "erreur de signe";
    
    wait for 5 ns ;
    
    TOP <= "11";
    
    wait for 10 ns;
    
    assert TS = "00000000000000000000000000000001" report "erreur d'affecttion sur A";
    assert TN = '0' report "errreur de signe";
    
    wait for 5 ns;
    wait;
end process;

SIMUL : entity work.ALU(behav) port map (TOP ,TA , TB, TS, TN);
 
end architecture BENCH;
  
    