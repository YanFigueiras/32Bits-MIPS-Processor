library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity oneBitMux is
	PORT (
		Control:	in STD_LOGIC;
		InputA:	in STD_LOGIC_VECTOR(31 DOWNTO 0);
		InputB:	in STD_LOGIC_VECTOR(31 DOWNTO 0);
		
		Output: out STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
end oneBitMux;

architecture Behavioral of oneBitMux is
begin
	with Control select
	Output <= 
	InputA WHEN '0',
	InputB WHEN '1',
	(x"00000000") WHEN others;

end Behavioral;
