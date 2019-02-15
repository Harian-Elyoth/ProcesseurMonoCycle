library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
  use IEEE.std_logic_arith.all;

entity PCExtender is
  port(
    E : in std_logic_vector(23 downto 0);
    S : out std_logic_vector(31 downto 0)
  );
end entity;

architecture RTL of PCExtender is
  
begin
  
  S <= SXT(E, S'length);
  
end architecture;