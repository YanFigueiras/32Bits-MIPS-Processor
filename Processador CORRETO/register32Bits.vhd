library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity register32Bits is
    port (
        CLK: in std_logic;
        EN: in std_logic;
        D: in std_logic_vector(31 downto 0);
        Q: out std_logic_vector(31 downto 0)
    );
end register32Bits;

architecture RTL of register32Bits is
    signal reg : std_logic_vector(31 downto 0);
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
