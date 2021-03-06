library ieee;
use ieee.std_logic_1164.all;
Use ieee.std_logic_arith.all;



entity instruction_decoder is
	port(
		INSTRUCTION, PSROUT				: in std_logic_vector (31 downto 0);
		OFFSET						: out std_logic_vector (23 downto 0);
		IMM8						: out std_logic_vector (7 downto 0);
		RA, RB, RW					: out std_logic_vector (3 downto 0);
		OP						: out std_logic_vector (1 downto 0);
		NPCSEL, PSREN, WE, REGSEL, UALSRC, WRSRC, MEMWR	: out std_logic);
end entity;



architecture RTL of instruction_decoder is

type enum_instruction is (MOV, ADDi, ADDr, CMP, LDR, STR, BAL, BLT, ERR);

signal instr_courante								: enum_instruction;

begin

	process (INSTRUCTION)
	begin

		case INSTRUCTION(31 downto 28) is
			when "1110" =>
				case INSTRUCTION(27 downto 26) is
					when "00" =>
						case INSTRUCTION(25 downto 20) is
							when "101000" =>
								instr_courante <= ADDi;
							when "001000" =>
								instr_courante <= ADDr;
							when "111010" =>
								instr_courante <= MOV;
							when "110101" =>
								instr_courante <= CMP;
							when others =>
								instr_courante <= ERR;
						end case;
					when "01" =>
						case INSTRUCTION(20) is
							when '1' =>
								instr_courante <= LDR;
							when '0' =>
								instr_courante <= STR;
							when others =>
								instr_courante <= ERR;
						end case;
					when "10" =>
						instr_courante <= BAL;
					when others =>
						instr_courante <= ERR;
				end case;
			when "1011" =>
				instr_courante <= BLT;
			when others =>
				instr_courante <= ERR;
		end case;

	end process;

	process(instr_courante)
	begin
		
		IMM8 <= INSTRUCTION(7 downto 0);
		OFFSET <= INSTRUCTION(23 downto 0);
		RA <= INSTRUCTION(19 downto 16);
		RB <= INSTRUCTION(3 downto 0);
		RW <= INSTRUCTION(15 downto 12);

		case instr_courante is
			when ADDi =>
				OP <= "00";
				NPCSEL <= '0';
				PSREN <= '0';
				WE <= '1';
				REGSEL <= '0';
				UALSRC <= '1';
				WRSRC <= '0';
				MEMWR <= '0';

			when ADDr =>
				OP <= "00";
				NPCSEL <= '0';
				PSREN <= '0';
				WE <= '1';
				REGSEL <= '0';
				UALSRC <= '0';
				WRSRC <= '0';
				MEMWR <= '0';

			when MOV =>
				OP <= "01";
				NPCSEL <= '0';
				PSREN <= '0';
				WE <= '1';
				REGSEL <= '0';
				UALSRC <= '1';
				WRSRC <= '0';
				MEMWR <= '0';

			when CMP =>
				OP <= "10";
				NPCSEL <= '0';
				PSREN <= '1';
				WE <= '0';
				REGSEL <= '0';
				UALSRC <= '1';
				WRSRC <= '0';
				MEMWR <= '0';

			when LDR =>
				OP <= "00";
				NPCSEL <= '0';
				PSREN <= '0';
				WE <= '1';
				REGSEL <= '0';
				UALSRC <= '1';
				WRSRC <= '1';
				MEMWR <= '0';

			when STR =>
				OP <= "00";
				NPCSEL <= '0';
				PSREN <= '0';
				WE <= '0';
				REGSEL <= '1';
				UALSRC <= '1';
				WRSRC <= '0';
				MEMWR <= '1';

			when BAL =>
				OP <= "00";
				NPCSEL <= '1';
				PSREN <= '0';
				WE <= '0';
				REGSEL <= '0';
				UALSRC <= '0';
				WRSRC <= '0';
				MEMWR <= '0';

			when BLT =>
				OP <= "00";
				NPCSEL <= PSROUT(0);
				PSREN <= '1';
				WE <= '0';
				REGSEL <= '0';
				UALSRC <= '0';
				WRSRC <= '0';
				MEMWR <= '0';

			when ERR =>
				OFFSET <= (others => '0');
				IMM8 <= (others => '0');
				RA <= (others => '0');
				RB <= (others => '0');
				RW <= (others => '0');
				OP <= (others => '0');
				NPCSEL <= '0';
				PSREN <= '0';
				WE <= '0';
				REGSEL <= '0';
				UALSRC <= '0';
				WRSRC <= '0';
				MEMWR <= '0';

			when others =>
				OFFSET <= (others => '0');
				IMM8 <= (others => '0');
				RA <= (others => '0');
				RB <= (others => '0');
				RW <= (others => '0');
				OP <= (others => '0');
				NPCSEL <= '0';
				PSREN <= '0';
				WE <= '0';
				REGSEL <= '0';
				UALSRC <= '0';
				WRSRC <= '0';
				MEMWR <= '0';
		end case;

	end process;
	
end architecture;