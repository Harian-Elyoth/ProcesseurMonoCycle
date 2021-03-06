library IEEE;
  use IEEE.std_logic_1164.ALL;
  use IEEE.numeric_std.ALL;
  
  entity UT is
    port(
      clk, WE,rst : in std_logic;
      OP : in std_logic_vector (1 downto 0);
      --W : in std_logic_vector(31 downto 0 );
      RW,RA,RB : in std_logic_vector(3 downto 0 );
      N : out std_logic;
      S : out std_logic_vector(31 downto 0)
    );
  end entity;
  
  architecture struct of UT is
    signal BUSA ,BUSB : std_logic_vector(31 downto 0 );
     signal BUSW :  std_logic_vector(31 downto 0);
    
  begin
  

    REGISTER0 : entity work.Register_bench(RTL) port map(clk, WE, BUSW ,RW , RA , RB, BUSA, BUSB);
    ALU0 : entity work.ALU(behav) port map (OP, BUSA, BUSB, BUSW , N);
      S<= BUSW;
      
    end architecture struct;
    
      