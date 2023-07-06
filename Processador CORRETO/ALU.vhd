library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
	port (
		ALUControl: in STD_LOGIC_VECTOR(2 DOWNTO 0);
		ALUSrcA: in STD_LOGIC_VECTOR(31 DOWNTO 0);
		ALUSrcB: in STD_LOGIC_VECTOR(31 DOWNTO 0);
		
		ALUResult: out STD_LOGIC_VECTOR(31 DOWNTO 0);
		Zero: out STD_LOGIC
	);
end ALU;

architecture Behavioral of ALU is
------//intermediate signals//-------------
	signal z: STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal b: STD_LOGIC_VECTOR(31 DOWNTO 0);
	----------------------------
	begin

	b <= (ALUSrcA -  ALUSrcB);
	with ALUControl select z <= 	
		ALUSrcA and ALUSrcB when "000",
		ALUSrcA or ALUSrcB when "001",
		ALUSrcA + ALUSrcB when "010",
		ALUSrcA and (not ALUSrcB) when "100",
		ALUSrcA or (not ALUSrcB) when "101",
		ALUSrcA - ALUSrcB when "110",
		"0000000000000000000000000000000" & b(31) when "111",		
	ALUSrcA+ALUSrcB when others;	

	with z select Zero <=
		'1' when x"00000000",
	'0' when others;	
	
	ALUResult <= z;
----------------------------
end Behavioral;
