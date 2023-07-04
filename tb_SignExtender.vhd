library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_SignExtender is
end tb_SignExtender;

architecture tb_arch of tb_SignExtender is

	component SignExtender is
		PORT (
		Input: in STD_LOGIC_VECTOR(15 DOWNTO 0);
		
		Output: out STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	end component;

	signal Input_tb: STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal Output_tb: STD_LOGIC_VECTOR(31 DOWNTO 0);
	
begin

	uut_SignExtender: SignExtender
		port map (
			Input => Input_tb,
			Output => Output_tb
		);
	
	process
	begin
		-- Inicialização
		Input_tb <= (others => '0');

		wait for 20 ns;
		Input_tb <= x"000F";
		
		wait for 20 ns;
		Input_tb <= x"00FF";
		
		wait for 20 ns;
		Input_tb <= x"00F0";

		wait;

	end process;

end tb_arch;
