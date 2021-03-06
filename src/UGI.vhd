library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity UGI is
  port(
    Offset : in std_logic_vector(23 downto 0);
    nPCsel, clk, rst : in std_logic;
    instruction : out std_logic_vector( 31 downto 0)
  );
end entity;

architecture struct of UGI is

-- signaux intermediaires
signal PCout,s3,s4 : std_logic_vector ( 31 downto 0);
signal PCEXTOut , MUXOUT: std_logic_vector(31 downto 0 ) ; 

begin 
  
 -- S3 <= std_logic_vector(to_signed(to_integer(signed(PCOUT)) + 1), 32);
  s3 <= std_logic_vector(unsigned(PCOUT)+1); --PROBLEME ICI
  s4 <= std_logic_vector(unsigned(PCEXTOUT) + unsigned(s3));
  
  PCEXT0 : entity work.PCExtender port map(Offset , PCEXTOut);
    
  MUX0 : entity work.MUX21 generic map( N => 32)
                           port map(s3, s4 ,nPCsel,MUXOUT);
                            
  PC0 : entity work.RegistrePC port map(MUXOUT, pcout, clk, rst);
    
  IM0 : entity work.instruction_memory port map( PCOUT , instruction);
end architecture;
