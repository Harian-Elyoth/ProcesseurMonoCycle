library IEEE;
  use IEEE.std_logic_1164.ALL;
  use IEEE.numeric_std.ALL;

Entity MUX21 is 
  generic ( N : positive := 32);
  port (A, B : in std_logic_vector(N-1 downto 0);
    COM : in std_logic;
    S : out std_logic_vector(N-1 downto 0)
  );
  
end entity;

architecture RTL of MUX21 is
  
begin
  
  process(COM, A, B)
    
  begin
    
    case(COM) is
    
    when '0' => S <= A;
    when others => S <= B;
      
    end case;
    
  end process;
  
end architecture;