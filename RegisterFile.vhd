library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RegisterFile is
	PORT (
		A1: in STD_LOGIC_VECTOR(4 DOWNTO 0); -- Rs (25:21)
		A2: in STD_LOGIC_VECTOR(4 DOWNTO 0); -- Rt (20:16)
		A3: in STD_LOGIC_VECTOR(4 DOWNTO 0); -- Rt (20:16) ou Rd (15:11)
		WD3: in STD_LOGIC_VECTOR(31 DOWNTO 0);
		WE3: in STD_LOGIC; -- habilitação de escrita para A3 e WD3
		CLK: in STD_LOGIC;

		RD1: out STD_LOGIC_VECTOR(31 DOWNTO 0);
		RD2: out STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
end RegisterFile;

architecture Behavioral of RegisterFile is
	TYPE registers IS ARRAY (0 TO 31) OF STD_LOGIC_VECTOR(31 DOWNTO 0); -- Cria 32 registradores de 32 bits
	signal regfile: Registers := (others => (others => '0')); -- Inicializa todos com valor zero
	
begin
	RD1 <= regfile(CONV_INTEGER(A1)); -- lê dados do registrador especificado pelo endereço A1
	RD2 <= regfile(CONV_INTEGER(A2)); -- lê dados do registrador especificado pelo endereço A2

	process(CLK)
	begin
		if rising_edge(CLK) then
			if WE3 = '1' then
				regfile(CONV_INTEGER(A3)) <= WD3; -- escreve os dados de WD3 no registrador especificado pelo endereço A3
			end if;
		end if;
	end process;

end Behavioral;
