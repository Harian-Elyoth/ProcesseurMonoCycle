library IEEE;
  use IEEE.std_logic_1164.ALL;
  use IEEE.numeric_std.ALL;

entity Data_Memory is
	port(
		DATAIN		: in std_logic_vector (31 downto 0);
		Addr		: in std_logic_vector (5 downto 0);
		WE, CLK		: in std_logic;
		DATAOUT		: out std_logic_vector (31 downto 0));
end Data_Memory;



architecture RTL of Data_Memory is

type table is array (63 downto 0) of std_logic_vector (31 downto 0);

function init_banc return table is
variable result : table;
begin
	for i in 63 downto 0 loop
		result(i) := (others => '0');
	end loop;
	result(32) := x"00000001";
	result(33) := x"00000002";
	result(34) := x"00000003";
	result(35) := x"00000004";
	result(36) := x"00000005";
	result(37) := x"00000006";
	result(38) := x"00000007";
	result(39) := x"00000008";
	result(40) := x"00000009";
	result(41) := x"0000000A";
	result(42) := x"0000000B";
	return result;
end init_banc;

signal BANC : table := init_banc;

begin

	DATAOUT <= BANC(to_integer(unsigned(ADDR)));

	process (CLK)
	begin

		if ( rising_edge(CLK)) then
			if (WE = '1') then
				BANC(to_integer(unsigned(Addr))) <= DATAIN;
			end if;
		end if;

	end process;
	
end architecture;