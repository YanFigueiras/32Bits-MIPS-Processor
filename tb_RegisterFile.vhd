library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_RegisterFile is
end tb_RegisterFile;

architecture tb_arch of tb_RegisterFile is

	component RegisterFile is
		port (
			A1: in STD_LOGIC_VECTOR(4 DOWNTO 0);
			A2: in STD_LOGIC_VECTOR(4 DOWNTO 0);
			A3: in STD_LOGIC_VECTOR(4 DOWNTO 0);
			WD3: in STD_LOGIC_VECTOR(31 DOWNTO 0);
			WE3: in STD_LOGIC;
			CLK: in STD_LOGIC;

			RD1: out STD_LOGIC_VECTOR(31 DOWNTO 0);
			RD2: out STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	end component;

	signal A1_tb, A2_tb, A3_tb: STD_LOGIC_VECTOR(4 DOWNTO 0);
	signal WE3_tb: STD_LOGIC;
	signal clk_tb: STD_LOGIC := '1';
	signal RD1_tb, RD2_tb, WD3_tb: STD_LOGIC_VECTOR(31 DOWNTO 0);
	
begin

	uut_RegisterFile: RegisterFile
		port map (
			A1 => A1_tb,
			A2 => A2_tb,
			A3 => A3_tb,
			WD3 => WD3_tb,
			WE3 => WE3_tb,
			CLK => clk_tb,
			RD1 => RD1_tb,
			RD2 => RD2_tb
		);
	
	clk_tb <= not clk_tb after 20ns; -- clock 50mhz
	
	process
	begin
		-- Inicialização
		A1_tb <= (others => '0');
		A2_tb <= (others => '0');
		A3_tb <= (others => '0');
		WD3_tb <= (others => '0');
		WE3_tb <= '0';

		wait for 20 ns;
		-- Teste de leitura inicial
		A1_tb <= "00001";
		A2_tb <= "00010";

		wait for 20 ns;

		-- Teste de escrita
		A3_tb <= "00011";
		WD3_tb <= "11110000111100001111000011110000";
		WE3_tb <= '1';

		wait for 20 ns;

		-- Teste de leitura após a escrita
		A1_tb <= "00011";
		A2_tb <= "00010";

		wait for 20 ns;

		-- Teste de escrita em outro registrador
		A3_tb <= "00100";
		WD3_tb <= "01010101010101010101010101010101";
		WE3_tb <= '1';

		wait for 20 ns;

		-- Teste de leitura após a segunda escrita
		A1_tb <= "00001";
		A2_tb <= "00100";

		wait;

	end process;

end tb_arch;
