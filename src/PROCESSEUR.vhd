library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity processeur is 
  port(
clk : in std_logic;
rst : in std_logic
);
end entity;

architecture struct of processeur is
  
  signal instruction : std_logic_vector( 31 downto 0);
  signal offset : std_logic_vector(23 downto 0 );
  signal WrSrc, MemWr , PSRen , AluSrc  , RegSel, nPCSel, RegWr : std_logic;
  signal Ra, Rd, Rb, Rm : std_logic_vector(3 downto 0 );
  signal PSRout, flag : std_logic_vector (31 downto 0);
  signal ALUctr : std_logic_vector (1 downto 0 );
 	signal IMM8	:  std_logic_vector (7 downto 0);
  
  --process pour le clock ???????
 
begin
  
DECODER0 : entity work.instruction_decoder(RTL) port map (instruction,PSRout, offset , IMM8 , Ra, Rm,Rd, Aluctr, nPCsel,PSRen , regwr, Regsel, ALUsrc, WrSrc, MemWr);
UGI0 : entity work.UGI(struct) port map( offset , nPCsel , clk, rst, instruction);
RPSR0 : entity work.RegistrePSR(RTL) port map(flag ,PSRout, clk, rst, PSRen);
MUX24 : entity work.MUX21(RTL) generic map(N => 4)
                                port map (Rm, Rd, RegSel, Rb);
UT_2_0: entity work.UT2(RTL) port map (IMM8 , Ra, Rb, Rd , ALUctr, REgWr, clk, ALUsrc, WrSrc, flag(31));
flag <= (others =>'0');

end architecture ;