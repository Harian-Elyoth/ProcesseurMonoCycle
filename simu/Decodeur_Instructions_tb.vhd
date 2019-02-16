library IEEE;
use IEEE.Std_logic_1164.all;

entity Decodeur_Instructions_tb is

end entity;

architecture BENCH of Decodeur_Instructions_tb is

signal PSROUT, INSTRUCTION				: std_logic_vector (31 downto 0);
signal OFFSET						: std_logic_vector (23 downto 0);
signal IMM8						: std_logic_vector (7 downto 0);
signal RA, RB, RW					: std_logic_vector (3 downto 0);
signal OP						: std_logic_vector (1 downto 0);
signal NPCSEL, PSREN, WE, REGSEL, UALSRC, WRSRC, MEMWR	: std_logic;
signal OK						: boolean;
  
begin

	process
	begin
		
		OK <= TRUE;
		PSROUT <= (others => '0');
		INSTRUCTION <= (others => '0');

		wait for 10 ns;

		INSTRUCTION <= x"E3A01020";		--"1110-0011-1010-0000-0001-0000-0010-0000"

		wait for 10 ns;

		INSTRUCTION <= x"E0822000";

		if (IMM8 /= "00100000" and RW /= "0001" and OP /= "01" and NPCSEL /= '0' and PSREN /= '0' and WE /= '1' and REGSEL /= '0' and UALSRC /= '1' and WRSRC /= '0' and MEMWR /= '0') then
			OK <= FALSE;
		end if;

		wait for 10 ns;

		INSTRUCTION <= x"E6110000";-- 0x2 _loop -- LDR R0,0(R1) -- R0 = DATAMEM[R1] 
	
		wait for 10 ns;

		INSTRUCTION <= x"E0822000";-- 0x3		 -- ADD R2,R2,R0 -- R2 = R2 + R0
		
		wait for 10 ns;
	
		INSTRUCTION <= x"E2811001";-- 0x4		 -- ADD R1,R1,#1 -- R1 = R1 + 1

		wait for 10 ns;
	
		INSTRUCTION <= x"E351002A";-- 0x5		 -- CMP R1,0x2A  -- si R1 >= 0x2A 

		wait for 10 ns;
	
		INSTRUCTION <= x"BAFFFFFB";-- 0x6		 -- BLT loop 	 -- PC = PC + (-5) si N = 1

		wait for 10 ns;
	
		INSTRUCTION <= x"E6012000";-- 0x7		 -- STR R2,0(R1) -- DATAMEM[R1] = R2

		wait for 10 ns;

		INSTRUCTION <= x"EAFFFFF7";-- 0x8		 -- BAL main	 -- PC = PC + (-7)

		wait for 10 ns;

		INSTRUCTION <= (others => '0');

		wait;
	end process;

	UUT : entity work.Decodeur_Instructions port map (	PSROUT => PSROUT, INSTRUCTION => INSTRUCTION, OFFSET => OFFSET, IMM8 => IMM8,
								RA => RA, RB => RB, RW => RW, OP => OP, NPCSEL => NPCSEL, PSREN => PSREN, WE => WE,
								REGSEL => REGSEL, UALSRC => UALSRC, WRSRC => WRSRC, MEMWR => MEMWR);   
              
end BENCH;