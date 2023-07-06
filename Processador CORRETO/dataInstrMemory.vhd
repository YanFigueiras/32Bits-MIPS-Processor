library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity dataInstrMemory is
    Port ( memWrite : in  STD_LOGIC;
           writeData : in  STD_LOGIC_VECTOR (31 downto 0);
           readData : out  STD_LOGIC_VECTOR (31 downto 0);
			  readDataAmostra : out  STD_LOGIC_VECTOR (31 downto 0);
           address : in  STD_LOGIC_VECTOR (31 downto 0);
           CLK : in  STD_LOGIC);
end dataInstrMemory;

architecture Behavioral of dataInstrMemory is
--BIG ENDIAN
type bytes is  array (0 to 127) of STD_LOGIC_VECTOR(7 downto 0); -- address maximo = 1111111(base2) = 127(base10) = 7F(base16)
-- 0(0x0) até 63(0x3F): data ->address(6) = 0, 64(0x40) até 127(0x7F): instruction ->address(6) = 1
signal mem : bytes := ( 
						  --data 
						  X"00",X"00",X"00",X"00",
						  X"00",X"00",X"00",X"00",
						  X"00",X"00",X"00",X"00",
						  X"00",X"00",X"00",X"00",
						  X"00",X"00",X"00",X"00",
						  X"00",X"00",X"00",X"00",
						  X"00",X"00",X"00",X"00",
						  X"00",X"00",X"00",X"00",
						  X"00",X"00",X"00",X"00",
						  X"00",X"00",X"00",X"00",
						  X"00",X"00",X"00",X"00",
						  X"00",X"00",X"00",X"00",
						  X"00",X"00",X"00",X"00",
						  X"00",X"00",X"00",X"00",
						  X"00",X"00",X"00",X"00",
						  X"00",X"00",X"00",X"00",
						  --instructions (16 no máx) (ALTERAR!!)
						  "00100000","00010000","00000000","00000000",
						  "00100000","00010001","00000000","00000110",
						  "00100000","00010011","00000000","00000001",
						  "00000010","00010001","01000000","00101010",
						  "00010001","00000000","00000000","00000011",
						  "10101110","01110000","00000000","00000000",
						  "00100010","00010000","00000000","00000001",
						  "00001000","00000000","00000000","00010011",
						  "10001110","01110000","00000000","00000000",
						  "10101100","00010000","00000000","00000000",
						  "00001000","00000000","00000000","00011010",
						  X"00",X"00",X"00",X"00",
						  X"00",X"00",X"00",X"00",
						  X"00",X"00",X"00",X"00",
						  X"00",X"00",X"00",X"00",
						  X"00",X"00",X"00",X"00");

begin

process(writeData, address, memWrite, CLK)

begin
--if instruction (read only)
if(memWrite='0') then
readData(31 downto 24)<=mem(conv_integer(address));
readData(23 downto 16)<=mem(conv_integer(address)+1);
readData(15 downto 8)<=mem(conv_integer(address)+2);
readData(7 downto 0)<=mem(conv_integer(address)+3);

elsif(memWrite='1' and address(6)='0' and rising_edge(CLK) ) then
mem(conv_integer(address))<=writeData(31 downto 24);
mem(conv_integer(address)+1)<=writeData(23 downto 16);
mem(conv_integer(address)+2)<=writeData(15 downto 8);
mem(conv_integer(address)+3)<=writeData(7 downto 0);
end if;
end process;

process(CLK) --amostragem do endereço 0x0 como teste
begin
readDataAmostra(31 downto 24)<=mem(conv_integer(0));
readDataAmostra(23 downto 16)<=mem(conv_integer(0)+1);
readDataAmostra(15 downto 8)<=mem(conv_integer(0)+2);
readDataAmostra(7 downto 0)<=mem(conv_integer(0)+3);
end process;

end Behavioral;