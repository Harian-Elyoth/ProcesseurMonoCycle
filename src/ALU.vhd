library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is 
  port (
    OP : in std_logic_vector(1 downto 0);
    A, B : in std_logic_vector(31 downto 0);
    S : out std_logic_vector(31 downto 0);
    N : out std_logic
  );
  
end entity;


architecture behav of ALU is
  
  SIGNAL resultat : std_logic_vector(31 downto 0);
  
begin
  
  process(OP, A, B)
    
  begin
    
    case(OP) is
    
       when "00" => resultat <= Std_logic_vector(SIGNED(A) + SIGNED(B));
       when "01" => resultat <= B;
       when "10" => resultat <= std_logic_vector(SIGNED(A) - SIGNED(B));
       when others => resultat <= A;
    end case;
    
   
      
    
  end process;
  
  N <= resultat(31);
  
  S <= resultat;
  
end architecture;