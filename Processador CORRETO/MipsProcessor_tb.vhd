library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MipsProcessor_tb is
end MipsProcessor_tb;

architecture tb of MipsProcessor_tb is

component MipsProcessor is
    PORT (CLK : in std_logic;
			 RESET : in std_logic;
	       ReadDataAmostra : out std_logic_vector(31 downto 0)
        );
end component;

    signal CLK  : std_logic := '0';
    signal RESET: std_logic  := '0';
    signal ReadDataAmostra : std_logic_vector(31 downto 0);
    
    constant period : time := 20 ns;
    signal clk_enable : std_logic := '1';

begin

    dut : MipsProcessor
    port map (CLK  => CLK, 
	           RESET => RESET,
				  ReadDataAmostra => ReadDataAmostra
              );

    CLK <= not CLK after period/2 when clk_enable = '1' else '0';
	 clk_enable <= '1', '0' after 200*period;
    
    tb : process
    begin
     wait for period*190;
	  RESET <= '1';
	   wait for 40 ns;
	  wait;
    end process;
end tb;
