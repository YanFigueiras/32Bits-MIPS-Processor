library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_ALU is
end tb_ALU;

architecture tb_arch of tb_ALU is

	component ALU is
		port (
		ALUControl: in STD_LOGIC_VECTOR(2 DOWNTO 0);
		ALUSrcA: in STD_LOGIC_VECTOR(31 DOWNTO 0);
		ALUSrcB: in STD_LOGIC_VECTOR(31 DOWNTO 0);
		
		ALUResult: out STD_LOGIC_VECTOR(31 DOWNTO 0);
		Zero: out STD_LOGIC
	);
	end component;

	signal ALUControl_tb: STD_LOGIC_VECTOR(2 DOWNTO 0);
	signal ALUSrcA_tb: STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal ALUSrcB_tb: STD_LOGIC_VECTOR(31 DOWNTO 0);

	signal ALUResult_tb: STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal Zero_tb: STD_LOGIC;
	
begin

	uut_ALU: ALU
		port map (
			ALUControl => ALUControl_tb,
			ALUSrcA => ALUSrcA_tb,
			ALUSrcB => ALUSrcB_tb,
			
			ALUResult => ALUResult_tb,
			Zero => Zero_tb
		);
	process
	begin
	
		ALUSrcA_tb <= x"00000002";
		ALUSrcB_tb <= x"00000001";	
		
		ALUControl_tb <= "000";	
		wait for 20 ns;
		
		ALUControl_tb <= "001";
		wait for 20 ns;
		
		ALUControl_tb <= "010";
		wait for 20 ns;
		
		ALUControl_tb <= "100";	
		wait for 20 ns;
		
		ALUControl_tb <= "101";
		wait for 20 ns;
		
		ALUControl_tb <= "110";
		wait for 20 ns;
		
		ALUControl_tb <= "111";
		wait for 20 ns;
		
		ALUSrcA_tb <= x"00000001";
		ALUSrcB_tb <= x"00000001";	
		
		ALUControl_tb <= "000";	
		wait for 20 ns;
		
		ALUControl_tb <= "001";
		wait for 20 ns;
		
		ALUControl_tb <= "010";
		wait for 20 ns;
		
		ALUControl_tb <= "100";	
		wait for 20 ns;
		
		ALUControl_tb <= "101";
		wait for 20 ns;
		
		ALUControl_tb <= "110";
		wait for 20 ns;
		
		ALUControl_tb <= "111";
		wait for 20 ns;
		
		ALUSrcA_tb <= x"00000001";
		ALUSrcB_tb <= x"00000002";	
		
		ALUControl_tb <= "000";	
		wait for 20 ns;
		
		ALUControl_tb <= "001";
		wait for 20 ns;
		
		ALUControl_tb <= "010";
		wait for 20 ns;
		
		ALUControl_tb <= "100";	
		wait for 20 ns;
		
		ALUControl_tb <= "101";
		wait for 20 ns;
		
		ALUControl_tb <= "110";
		wait for 20 ns;
		
		ALUControl_tb <= "111";
		wait for 20 ns;
		
		
		ALUSrcA_tb <= x"0000FFFF";
		ALUSrcB_tb <= x"0000FF00";	
		
		ALUControl_tb <= "000";	
		wait for 20 ns;
		
		ALUControl_tb <= "001";
		wait for 20 ns;
		
		ALUControl_tb <= "010";
		wait for 20 ns;
		
		ALUControl_tb <= "100";	
		wait for 20 ns;
		
		ALUControl_tb <= "101";
		wait for 20 ns;
		
		ALUControl_tb <= "110";
		wait for 20 ns;
		
		ALUControl_tb <= "111";
		wait for 20 ns;
		
		
		
		wait;

	end process;

end tb_arch;
