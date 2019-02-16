library IEEE;
use IEEE.Std_logic_1164.all;

entity REG32_tb is

end entity;

architecture BENCH of REG32_tb is

signal NOUT		: std_logic_vector (31 downto 0);
signal CLK, RST, WE, N	: std_logic;
signal OK		: boolean;
  
begin

	process
	begin
		
		OK <= TRUE;
		N <= '0';
		RST <= '1';
		WE <= '0';

		CLK <= '0';
		wait for 5 ns;
		CLK <= '1';
		wait for 5 ns;

		if (NOUT(0) /= '0') then
			OK <= FALSE;
		end if;

		RST <= '0';

		CLK <= '0';
		wait for 5 ns;
		CLK <= '1';
		wait for 5 ns;

		if (NOUT(0) /= '0') then
			OK <= FALSE;
		end if;
		
		N <= '1';
		WE <= '1';

		CLK <= '0';
		wait for 5 ns;
		CLK <= '1';
		wait for 5 ns;

		if (NOUT(0) /= '1') then
			OK <= FALSE;
		end if;

		N <= '0';

		CLK <= '0';
		wait for 5 ns;
		CLK <= '1';
		wait for 5 ns;

		if (NOUT(0) /= '0') then
			OK <= FALSE;
		end if;
		
		wait;
	end process;

	UUT : entity work.REG32 port map (CLK => CLK, RST => RST, WE => WE, N => N, NOUT => NOUT);   
              
end BENCH;