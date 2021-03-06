library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity UGI_tb is
end entity;

architecture BENCH of UGI_tb is
  
  signal Offset :  std_logic_vector(23 downto 0);
  signal nPCsel, clk, rst : std_logic;
  signal instruction : std_logic_vector( 31 downto 0);
  
  begin
  
  clock : process
  begin
      clk <= '1';
      wait for 10 ns;
      clk <= '0';
      wait for 10 ns;
    end process;
    
    test : process 
    begin
    
      rst <= '1' ;
    
      wait for 10 ns ;
      -- on teste si le pc s'incremente bien     
      rst <= '0'; 
      nPCsel <= '0' ; 
      Offset <= (others => '0');
      
      wait for 10 ns ;
      
      assert instruction = X"E3A01020" report "probleme d'incrementation" severity note;
      
      wait for 10 ns;
      
      assert instruction  = X"E3A02000" report " pbm d'incr" severity note;
      
      wait for 10 ns;
      
      nPCsel <= '1';
      Offset <= "000000000000000000000011";
      
      wait for 10 ns;
      
      wait;
    end process;
    
    TST: entity work.UGI port map( Offset, nPCsel ,clk , rst, instruction);
  end architecture;
      
      
      
      