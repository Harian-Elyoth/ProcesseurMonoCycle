library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity UT2 is
	port(
		IMM : in std_logic_vector (7 downto 0);
		RA, RB, RW : in std_logic_vector (3 downto 0) := "0000";
		OP		: in std_logic_vector (1 downto 0);
		WE, CLK, SEL1, SEL2		: in std_logic;
		N					: out std_logic_vector(31 downto 0)
);
end UT2;

architecture RTL of UT2 is

signal BUSW, BUSA, BUSB, MUXOUT, IMMOUT, ALUOUT, DATAOUT : std_logic_vector (31 downto 0);

begin

	

	Register_bench : entity work.Register_bench port map (W => BUSW, RA => RA, RB => RB, RW => RW, WE => WE, CLK => CLK, A => BUSA, B => BUSB);

	ExtSign : entity work.ExtSign generic map (N => 8)
	                              port map (E => IMM, S => IMMOUT);

	MUX21 : entity work.MUX21 port map(A => BUSB, B => IMMOUT, COM => SEL1, S => MUXOUT);

	ALU : entity work.ALU port map (OP => OP, A => BUSA, B => MUXOUT, S => ALUOUT, N => N);

	Data_Memory : entity work.Data_Memory port map (DATAIN => BUSB, ADDR => ALUOUT(5 downto 0), WE => WE, CLK => CLK, DATAOUT => DATAOUT);

	MUX212 : entity work.MUX21 port map(A => ALUOUT, B => DATAOUT, COM => SEL2, S => BUSW);

end architecture;