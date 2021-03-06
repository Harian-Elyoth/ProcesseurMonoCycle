library IEEE;
  use IEEE.std_logic_1164.ALL;
  use IEEE.numeric_std.ALL;

entity UT_tb is
end entity;

architecture BENCH of UT_tb is
      signal  clk,WE ,rst:  std_logic;
      signal OP :  std_logic_vector (1 downto 0);
   -- W : in std_logic_vector(31 downto 0 );
      signal RW,RA,RB :  std_logic_vector(3 downto 0 );
      signal N :  std_logic;
      signal S :  std_logic_vector(31 downto 0);
      
  begin
    
    clock : process
    
    begin
      
      clk <= '1';
      
      wait for 10 ns;
      
      clk <= '0';
      
      wait for 10 ns;
      
    end process;
    
    test_bench : process
     
    begin
      
    rst <='1'; 
    
    wait for 10 ns;
    -- R(1)= R(15) ICI R(1) VAUT 30
    rst <= '0';
    OP <= "11";
    RB <= "0000";
    RW <= "0001";
    RA <= "1111";
    WE <= '1';
    wait for 10 ns;
    
     
    assert S = X"00000030" report "ERREUR CALCUL 2" severity note;
    wait for 10 ns;
    -- R(1) = R(1) + R(15) ICI R1 VAUT 60
    OP <= "00";
    RW <= "0001";
    RA <= "0001";
    RB <= "1111";
    WE <= '1';
    
    wait for 10 ns;
    
    
    assert S = X"00000060" report "ERREUR CALCUL 3" severity note;
    wait for 10 ns;
    -- R(2) = R(1) + R(15) ICI RE VAUT 90
    OP <= "00";
    RW <= "0010";
    RA <= "0001";
    RB <= "1111";
    WE <= '1';
    
    wait for 10 ns;
    assert S = X"00000090" report "ERREUR CALCUL 4" severity note;
    
    wait for 10 ns;
    -- R(3) = R(1) - R(15) ICI R3 VAUT 30
    OP <= "10" ;
    rw <= "0011";
    ra <= "0001";
    rb <= "1111";
    we <='1';
    wait for 10 ns;
   
    assert S = X"00000030" report "ERREUR CALCUL 5" severity note;
    wait for 10 ns;
    
    -- R(5) = R(7) - R(15) ICI R5 VAUT FFFFD0
    OP <= "10" ; 
    rw <= "0101";
    ra <= "0111";
    rb <= "1111";
    we <= '1' ; 
    wait for 10 ns;
 
    assert S = X"FFFFFFD0" report "ERREUR CALCUL 6" severity note;
    
    
    wait; 
  end process;
  
  GO : entity work.UT(struct) port map(clk, WE,rst , OP, RW, RA, RB, N, S);
end architecture;

  
    
     
      