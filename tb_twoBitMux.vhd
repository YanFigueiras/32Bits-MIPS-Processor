library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_twoBitMux is
end tb_twoBitMux;

architecture tb_arch of tb_twoBitMux is

	component twoBitMux is
		PORT (
			Control:	in STD_LOGIC_VECTOR(1 DOWNTO 0);
			InputA:	in STD_LOGIC_VECTOR(31 DOWNTO 0);
			InputB:	in STD_LOGIC_VECTOR(31 DOWNTO 0);
			InputC:	in STD_LOGIC_VECTOR(31 DOWNTO 0);
			InputD:	in STD_LOGIC_VECTOR(31 DOWNTO 0);
			
			Output: out STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	end component;

	signal Control_tb: STD_LOGIC_VECTOR(1 DOWNTO 0);
	signal InputA_tb: STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal InputB_tb: STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal InputC_tb:	STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal InputD_tb:	STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	signal Output_tb: STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	
	
begin

	uut_twoBitMux: twoBitMux
		port map (
			Control => Control_tb,
			InputA => InputA_tb,
			InputB => InputB_tb,
			InputC => InputC_tb,
			InputD => InputD_tb,
			
			Output => Output_tb
		);
	
	process
	begin
		-- Inicialização
		Control_tb <= "00";
		InputA_tb <= x"0000000F";
		InputB_tb <= x"000000F0";
		InputC_tb <= x"00000F00";
		InputD_tb <= x"0000F000";
		wait for 20 ns;
		
		Control_tb <= "00";
		wait for 20 ns;
		
		Control_tb <= "01";
		wait for 20 ns;
		
		Control_tb <= "10";
		wait for 20 ns;
		
		Control_tb <= "11";
		wait for 20 ns;
		
		Control_tb <= "00";
		InputA_tb <= x"0000000C";
		InputB_tb <= x"000000C0";
		InputC_tb <= x"00000C00";
		InputD_tb <= x"0000C000";
		wait for 20 ns;
		
		Control_tb <= "00";
		wait for 20 ns;
		
		Control_tb <= "01";
		wait for 20 ns;
		
		Control_tb <= "10";
		wait for 20 ns;
		
		Control_tb <= "11";
		wait for 20 ns;
		

		wait;

	end process;

end tb_arch;
