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
	signal shiftleft: STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal shiftright: STD_LOGIC_VECTOR(31 DOWNTO 0);
	----------------------------
	begin
	----------//code//---------
	--leftshift--
	with ALUSrcB select
		shiftleft<=	
		ALUSrcA WHEN x"00000000",
		ALUSrcA(30 DOWNTO 0) & '0' WHEN x"00000001",
		ALUSrcA(29 DOWNTO 0) & "00" WHEN x"00000002",
		ALUSrcA(28 DOWNTO 0) & "000" WHEN x"00000003",
		ALUSrcA(27 DOWNTO 0) & "0000" WHEN x"00000004",
		ALUSrcA(26 DOWNTO 0) & "00000" WHEN x"00000005",
		ALUSrcA(25 DOWNTO 0) & "000000" WHEN x"00000006",
		ALUSrcA(24 DOWNTO 0) & "0000000" WHEN x"00000007",
		ALUSrcA(23 DOWNTO 0) & "00000000" WHEN x"00000008",
		ALUSrcA(22 DOWNTO 0) & "000000000" WHEN x"00000009",
		ALUSrcA(21 DOWNTO 0) & "0000000000" WHEN x"0000000A",
		ALUSrcA(20 DOWNTO 0) & "00000000000" WHEN x"0000000B",
		ALUSrcA(19 DOWNTO 0) & "000000000000" WHEN x"0000000C",
		ALUSrcA(18 DOWNTO 0) & "0000000000000" WHEN x"0000000D",
		ALUSrcA(17 DOWNTO 0) & "00000000000000" WHEN x"0000000E",
		ALUSrcA(16 DOWNTO 0) & "000000000000000" WHEN x"0000000F",
		ALUSrcA(15 DOWNTO 0) & "0000000000000000" WHEN x"00000010",
		ALUSrcA(14 DOWNTO 0) & "00000000000000000" WHEN x"00000011",
		ALUSrcA(13 DOWNTO 0) & "000000000000000000" WHEN x"00000012",
		ALUSrcA(12 DOWNTO 0) & "0000000000000000000" WHEN x"00000013",
		ALUSrcA(11 DOWNTO 0) & "00000000000000000000" WHEN x"00000014",
		ALUSrcA(10 DOWNTO 0) & "000000000000000000000" WHEN x"00000015",
		ALUSrcA(9 DOWNTO 0) &  "0000000000000000000000" WHEN x"00000016",
		ALUSrcA(8 DOWNTO 0) &  "00000000000000000000000" WHEN x"00000017",
		ALUSrcA(7 DOWNTO 0) &  "000000000000000000000000" WHEN x"00000018",
		ALUSrcA(6 DOWNTO 0) &  "0000000000000000000000000" WHEN x"00000019",
		ALUSrcA(5 DOWNTO 0) &  "00000000000000000000000000" WHEN x"0000001A",
		ALUSrcA(4 DOWNTO 0) &  "000000000000000000000000000" WHEN x"0000001B",
		ALUSrcA(3 DOWNTO 0) &  "0000000000000000000000000000" WHEN x"0000001C",
		ALUSrcA(2 DOWNTO 0) &  "00000000000000000000000000000" WHEN x"0000001D",
		ALUSrcA(1 DOWNTO 0) &  "000000000000000000000000000000" WHEN x"0000001E",
		ALUSrcA(0) &           "0000000000000000000000000000000" WHEN x"0000001F",
	x"00000000" WHEN OTHERS;
--rightshift--
	WITH ALUSrcB SELECT shiftright<=
		ALUSrcA WHEN x"00000000",
		'0' & ALUSrcA(31 DOWNTO 1) WHEN x"00000001",
		"00" & ALUSrcA(31 DOWNTO 2) WHEN x"00000002",
		"000" & ALUSrcA(31 DOWNTO 3) WHEN x"00000003",
		"0000" & ALUSrcA(31 DOWNTO 4) WHEN x"00000004",
		"00000" & ALUSrcA(31 DOWNTO 5) WHEN x"00000005",
		"000000" & ALUSrcA(31 DOWNTO 6) WHEN x"00000006",
		"0000000" & ALUSrcA(31 DOWNTO 7) WHEN x"00000007",
		"00000000" & ALUSrcA(31 DOWNTO 8) WHEN x"00000008",
		"000000000" & ALUSrcA(31 DOWNTO 9) WHEN x"00000009",
		"0000000000" & ALUSrcA(31 DOWNTO 10) WHEN x"0000000A",
		"00000000000" & ALUSrcA(31 DOWNTO 11) WHEN x"0000000B",
		"000000000000" & ALUSrcA(31 DOWNTO 12) WHEN x"0000000C",
		"0000000000000" & ALUSrcA(31 DOWNTO 13) WHEN x"0000000D",
		"00000000000000" & ALUSrcA(31 DOWNTO 14) WHEN x"0000000E",
		"000000000000000" & ALUSrcA(31 DOWNTO 15) WHEN x"0000000F",
		"0000000000000000" & ALUSrcA(31 DOWNTO 16) WHEN x"00000010",
		"00000000000000000" & ALUSrcA(31 DOWNTO 17) WHEN x"00000011",
		"000000000000000000" & ALUSrcA(31 DOWNTO 18) WHEN x"00000012",
		"0000000000000000000" & ALUSrcA(31 DOWNTO 19) WHEN x"00000013",
		"00000000000000000000" & ALUSrcA(31 DOWNTO 20) WHEN x"00000014",
		"000000000000000000000" & ALUSrcA(31 DOWNTO 21) WHEN x"00000015",
		"0000000000000000000000" & ALUSrcA(31 DOWNTO 22) WHEN x"00000016",
		"00000000000000000000000" & ALUSrcA(31 DOWNTO 23) WHEN x"00000017",
		"000000000000000000000000" & ALUSrcA(31 DOWNTO 24) WHEN x"00000018",
		"0000000000000000000000000" & ALUSrcA(31 DOWNTO 25) WHEN x"00000019",
		"00000000000000000000000000" & ALUSrcA(31 DOWNTO 26) WHEN x"0000001A",
		"000000000000000000000000000" & ALUSrcA(31 DOWNTO 27) WHEN x"0000001B",
		"0000000000000000000000000000" & ALUSrcA(31 DOWNTO 28) WHEN x"0000001C",
		"00000000000000000000000000000" & ALUSrcA(31 DOWNTO 29) WHEN x"0000001D",
		"000000000000000000000000000000" & ALUSrcA(31 DOWNTO 30) WHEN x"0000001E",
		"0000000000000000000000000000000" & ALUSrcA(31) WHEN x"0000001F",
	x"00000000" WHEN OTHERS;
-------------------------------------
	with ALUControl select z <= 	
		ALUSrcA and ALUSrcB when "000",
		ALUSrcA or ALUSrcB when "001",
		ALUSrcA + ALUSrcB when "010",
		ALUSrcA and (not ALUSrcB) when "100",
		ALUSrcA or (not ALUSrcB) when "101",
		ALUSrcA - (not ALUSrcB) when "110",
		ALUSrcA+ALUSrcB when "111",		
	ALUSrcA+ALUSrcB when others;	

	with z select Zero <=
		'1' when x"00000000",
	'0' when others;	
	
	ALUResult <= z;
----------------------------
end Behavioral;