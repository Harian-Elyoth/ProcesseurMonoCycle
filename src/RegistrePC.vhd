library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity RegistrePC is
  port(
    E : in std_logic_vector(31 downto 0);
    S : out std_logic_vector(31 downto 0);
    clk, rst : in std_logic
  );
end entity;

architecture RTL of RegistrePC is
  
  signal int : std_logic_vector(31 downto 0);
  
begin
  
  process(clk, rst)
    
    begin
      
      if rst = '1' then
        
        int <= (others => '0');
      
      else
      
        if rising_edge(clk) then
          
          int <= E;
          
        end if;
        
      end if;
      
    end process;
    
    S <= int;
    
  end architecture;
