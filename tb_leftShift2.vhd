library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_leftShift2 is
end tb_leftShift2;

architecture teste of tb_leftShift2 is

component leftShift2 is
	port( 
    entrada: in std_logic_vector (31 downto 0);
	saida: out std_logic_vector (31 downto 0)
	    );
end component;

signal i,o : std_logic_vector(31 downto 0);

begin
instancia_leftShift2: leftShift2 port map(entrada=>i,saida=>o);

process
	begin
	i <= x"00000001";
	wait for 30 ns;
	i <= x"00000002";
	wait for 30 ns;
	i <= x"00000005";
	wait for 30 ns;
	i <= x"0000000F";
	wait for 30 ns;
wait;
end process


end teste;