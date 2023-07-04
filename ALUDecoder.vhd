library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALUDecoder is
    Port ( Funct : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUop : in  STD_LOGIC_VECTOR (1 downto 0);
           ALUcontrol : out  STD_LOGIC_VECTOR (2 downto 0));
end ALUDecoder;

architecture Behavioral of ALUDecoder is
	begin
	process(Funct,ALUop)
		begin

			if    ALUop = "00"     then ALUcontrol <= "010";
				elsif ALUop = "01"     then ALUcontrol <= "110";
				elsif ALUop = "10"     then
				if    Funct = "100000" then ALUcontrol <= "010";
					elsif Funct = "100010" then ALUcontrol <= "110";
					elsif Funct = "100100" then ALUcontrol <= "000";
					elsif Funct = "100101" then ALUcontrol <= "001";
					elsif Funct = "101010" then ALUcontrol <= "111";
				end if;
			 
		end if;
	end process;
end Behavioral;
