library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SignExtender is
	PORT (
		Input: in STD_LOGIC_VECTOR(15 DOWNTO 0);
		
		Output: out STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
end SignExtender;

architecture Behavioral of SignExtender is
begin

	Output(31 downto 16) <= x"0000";
	
	Output(15 downto 0) <= Input(15 downto 0);


end Behavioral;
