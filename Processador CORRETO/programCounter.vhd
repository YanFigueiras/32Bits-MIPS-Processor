library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity programCounter is
    port (
        CLK: in std_logic;
        EN: in std_logic;
        D: in std_logic_vector(31 downto 0);
        Q: out std_logic_vector(31 downto 0)
    );
end programCounter;

architecture RTL of programCounter is
    signal reg : std_logic_vector(31 downto 0) := x"00000040"; -- Valor inicial
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
            if (EN = '1') then
                reg <= D;
            end if;
        end if;
    end process;

    Q <= reg;
end RTL;
