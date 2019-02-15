library IEEE;
  use IEEE.std_logic_1164.ALL;
  use IEEE.numeric_std.ALL;

entity Register_bench is
  port(
    clk,WE : in std_logic;
    W : in std_logic_vector(31 downto 0);
    Rw , RA , RB : in std_logic_vector(3 downto 0);
    A, B : out std_logic_vector(31 downto 0 )
  );
end entity;
    
architecture RTL of Register_bench is
  
  -- DEclaration type tableau memoire 
  type table is array(15 downto 0 ) of std_logic_vector(31 downto 0 ) ;
  
  -- FOnction d'initialisatiojn du banc de registre
  function init_banc return table is
  variable result : table ;
  begin
    for i in 14 downto 0 loop 
      result(i) := (others =>'0');
    end loop;
    result(15) := X"00000030";
    return result;
    
    end init_banc;
    
    -- declaration et initialisation du banc de registres 16x32 bits
    signal Banc : table := init_banc;
    
begin
  
  A <= Banc(to_integer(unsigned(RA)));
  B <= Banc(to_integer(unsigned(RB)));
  
  
  process(clk,WE)
    begin

      
      if rising_edge(clk) then
        if(WE ='1') then 
          Banc(to_integer(unsigned(RW))) <=  W;
        end if;
      end if;
        
        
        
    end process;
    
  end architecture RTL;