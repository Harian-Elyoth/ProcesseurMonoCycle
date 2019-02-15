library IEEE;
  use IEEE.std_logic_1164.ALL;
  use IEEE.numeric_std.ALL;
  use IEEE.std_logic_arith.all;
  
Entity ExtSign is
  generic (N : positive := 2);
  port (
    E : in std_logic_vector(N-1 downto 0);
    S : out std_logic_vector(31 downto 0)
  );
  
end entity;

architecture behav of ExtSign is
  
begin
  
  S <= SXT(E, S'length);
  
end architecture;


  
  