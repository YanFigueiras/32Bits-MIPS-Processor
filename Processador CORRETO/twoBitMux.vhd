library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity twoBitMux is
	PORT (
		Control:	in STD_LOGIC_VECTOR(1 DOWNTO 0);
		InputA:	in STD_LOGIC_VECTOR(31 DOWNTO 0);
		InputB:	in STD_LOGIC_VECTOR(31 DOWNTO 0);
		InputC:	in STD_LOGIC_VECTOR(31 DOWNTO 0);
		InputD:	in STD_LOGIC_VECTOR(31 DOWNTO 0);
		
		Output: out STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
end twoBitMux;

architecture Behavioral of twoBitMux is
begin
	with Control select
	Output <= 
	InputA WHEN "00",
	InputB WHEN "01",
	InputC WHEN "10",
	InputD WHEN "11",
	x"FFFFFFFF" WHEN others;

end Behavioral;
