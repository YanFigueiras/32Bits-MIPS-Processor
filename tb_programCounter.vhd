library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity programCounter_tb is
end programCounter_tb;

architecture TB of programCounter_tb is
    -- Componente a ser testado
    component programCounter
        port (
            CLK: in std_logic;
            EN: in std_logic;
            D: in std_logic_vector(31 downto 0);
            Q: out std_logic_vector(31 downto 0)
        );
    end component;

    -- Sinais de teste
    signal CLOCK_tb : std_logic := '0';
    signal ENABLE_tb : std_logic := '0';
    signal D_tb : std_logic_vector(31 downto 0) := (others => '0');
    signal Q_tb : std_logic_vector(31 downto 0);

    constant clock_period : time := 20 ns; -- Período de 50 MHz (20 ns)

begin
    -- Instância do componente a ser testado
    dut: programCounter
        port map (
            CLK => CLOCK_tb,
            EN => ENABLE_tb,
            D => D_tb,
            Q => Q_tb
        );

    -- Geração do clock de 50 MHz
    clock_process: process
    begin
        while now < 1000 ns loop
            CLOCK_tb <= '0';
            wait for clock_period / 2;
            CLOCK_tb <= '1';
            wait for clock_period / 2;
        end loop;
        wait;
    end process;

    -- Processo de estímulo
    stimulus_process: process
    begin
        -- Aguarde alguns ciclos de clock antes de ativar o ENABLE
		  ENABLE_tb <= '1';
        wait for 100 ns;

        -- Estímulo para mudar o valor de D
        D_tb <= x"12345678";
        wait for 200 ns;
        D_tb <= x"87654321";
        wait for 200 ns;

        -- Desativar o ENABLE
        ENABLE_tb <= '0';
        wait for 100 ns;

        -- Finalizar a simulação
        wait;
    end process;

end TB;
