-- Quartus II VHDL Template
-- Four-State Moore State Machine

-- A Moore machine's outputs are dependent only on the current state.
-- The output is written only when the state changes.  (State
-- transitions are synchronous.)

library ieee;
use ieee.std_logic_1164.all;

entity MainDecoder is

	port(
		CLK		 : in	std_logic;
		reset     : in std_logic;
		opcode	 : in	std_logic_vector(5 downto 0);
		
		MemtoReg  : out std_logic; --mux selection of data to save in register file
		IorD      : out std_logic; --mux selection of data adress to read in instruction/data memory
		PCSrc     : out std_logic_vector(1 downto 0); --mux selection of next program counter
		ALUSrcB   : out std_logic_vector(1 downto 0); -- mux selection of ALU input B
		ALUSrcA   : out std_logic; --mux selection of ALU input A
		AlUop     : out std_logic_vector(1 downto 0); --selection of ALU operation
		RegDst    : out std_logic; --mux selection of destination register
		MemWrite  : out std_logic; --enable to save data in instruction/data memory
		RegWrite  : out std_logic; --enable to save data in register file
		Branch    : out std_logic; --branch enable
		IRWrite   : out std_logic; --enable intruction register
		PCWrite   : out std_logic);--enable PC register

end entity;

architecture Behavioral of MainDecoder is

	-- Build an enumerated type for the state machine
	type state_type is (fetch, decode, memoryAddr, memoryWrite,
							  memoryRead, writeBackLw, execute, 
							  writeBackTypeR,
							  branchBeq, executeAddi, writeBackAddi
							  , jump );

	-- Register to hold the current state
	signal currentState   : state_type := fetch;

begin

	-- Logic to advance to the next state
	process (CLK, reset)
	begin
		
		if (rising_edge(CLK)) then
			if (reset = '1') then currentState <= fetch;
			end if;
			
			case currentState is
			
				when fetch=>
					currentState <= decode;
					
					
				when decode=>
					if opcode = "100011" or opcode="101011" then
						currentState <= memoryAddr;
					elsif opcode = "000000" then
						currentState <= execute;
					elsif opcode = "000100" then
						currentState <= branchBeq;
					elsif opcode = "001000" then
						currentState <= executeAddi;
					elsif opcode = "000010" then
						currentState <= jump;
					end if;
					
					
				when memoryAddr=>
					if opcode = "100011" then
						currentState <= memoryRead;
					elsif opcode = "101011" then
						currentState <= memoryWrite;
					end if;
					
					
				when memoryWrite =>
					currentState <= fetch;
					
					
				when memoryRead =>
					currentState <= WriteBackLw;
					
					
				when writeBackLw =>
					currentState <= fetch;
					
					
				when execute =>
					currentState <= WriteBackTypeR;
					
					
				when writeBackTypeR =>
					currentState <= fetch;
					
					
				when branchBeq =>
					currentState <= fetch;
					
					
				when executeAddi =>
					currentState <= WriteBackAddi;
					
					
				when writeBackAddi =>
					currentState <= fetch;
					
					
				when jump =>
					currentState <= fetch;
					
					
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (currentState)
	begin
		case currentState is
			when fetch =>
				MemtoReg  <= '0';
				IorD      <= '0';
				PCSrc     <= "00";
				ALUSrcB   <= "01";
				ALUSrcA   <= '0';
				ALUop     <= "00";
				RegDst    <= '0';
				MemWrite  <= '0';
				RegWrite  <= '0';
				Branch    <= '0';
				IRWrite   <= '1';
				PCWrite   <= '1';
				
				
			when decode =>
				MemtoReg  <= '0';
				IorD      <= '0';
				PCSrc     <= "00";
				ALUSrcB   <= "11";
				ALUSrcA   <= '0';
				ALUop     <= "00";
				RegDst    <= '0';
				MemWrite  <= '0';
				RegWrite  <= '0';
				Branch    <= '0';
				IRWrite   <= '0';
				PCWrite   <= '0';
				
				
			when memoryAddr =>
				MemtoReg  <= '0';
				IorD      <= '0';
				PCSrc     <= "00";
				ALUSrcB   <= "10";
				ALUSrcA   <= '1';
				ALUop     <= "00";
				RegDst    <= '0';
				MemWrite  <= '0';
				RegWrite  <= '0';
				Branch    <= '0';
				IRWrite   <= '0';
				PCWrite   <= '0';
				
			when memoryWrite =>
				MemtoReg  <= '0';
				IorD      <= '1';
				PCSrc     <= "00";
				ALUSrcB   <= "00";
				ALUSrcA   <= '0';
				ALUop     <= "00";
				RegDst    <= '0';
				MemWrite  <= '1';
				RegWrite  <= '0';
				Branch    <= '0';
				IRWrite   <= '0';
				PCWrite   <= '0';
				
			when memoryRead =>
				MemtoReg  <= '0';
				IorD      <= '1';
				PCSrc     <= "00";
				ALUSrcB   <= "00";
				ALUSrcA   <= '0';
				ALUop     <= "00";
				RegDst    <= '0';
				MemWrite  <= '0';
				RegWrite  <= '0';
				Branch    <= '0';
				IRWrite   <= '0';
				PCWrite   <= '0';
				
			when writeBackLw =>
				MemtoReg  <= '1';
				IorD      <= '0';
				PCSrc     <= "00";
				ALUSrcB   <= "00";
				ALUSrcA   <= '0';
				ALUop     <= "00";
				RegDst    <= '0';
				MemWrite  <= '0';
				RegWrite  <= '1';
				Branch    <= '0';
				IRWrite   <= '0';
				PCWrite   <= '0';
				
			when execute =>
				MemtoReg  <= '0';
				IorD      <= '0';
				PCSrc     <= "00";
				ALUSrcB   <= "00";
				ALUSrcA   <= '1';
				ALUop     <= "10";
				RegDst    <= '0';
				MemWrite  <= '0';
				RegWrite  <= '0';
				Branch    <= '0';
				IRWrite   <= '0';
				PCWrite   <= '0';
				
			when writeBackTypeR =>
				MemtoReg  <= '0';
				IorD      <= '0';
				PCSrc     <= "00";
				ALUSrcB   <= "00";
				ALUSrcA   <= '0';
				ALUop     <= "00";
				RegDst    <= '1';
				MemWrite  <= '0';
				RegWrite  <= '1';
				Branch    <= '0';
				IRWrite   <= '0';
				PCWrite   <= '0';
				
			when branchBeq =>
				MemtoReg  <= '0';
				IorD      <= '0';
				PCSrc     <= "01";
				ALUSrcB   <= "00";
				ALUSrcA   <= '1';
				ALUop     <= "01";
				RegDst    <= '0';
				MemWrite  <= '0';
				RegWrite  <= '0';
				Branch    <= '1';
				IRWrite   <= '0';
				PCWrite   <= '0';
				
			when executeAddi =>
				MemtoReg  <= '0';
				IorD      <= '0';
				PCSrc     <= "00";
				ALUSrcB   <= "10";
				ALUSrcA   <= '1';
				ALUop     <= "00";
				RegDst    <= '0';
				MemWrite  <= '0';
				RegWrite  <= '0';
				Branch    <= '0';
				IRWrite   <= '0';
				PCWrite   <= '0';
				
			when writeBackAddi =>
				MemtoReg  <= '0';
				IorD      <= '0';
				PCSrc     <= "00";
				ALUSrcB   <= "00";
				ALUSrcA   <= '0';
				ALUop     <= "00";
				RegDst    <= '0';
				MemWrite  <= '0';
				RegWrite  <= '1';
				Branch    <= '0';
				IRWrite   <= '0';
				PCWrite   <= '0';
				
			when jump =>
				MemtoReg  <= '0';
				IorD      <= '0';
				PCSrc     <= "10";
				ALUSrcB   <= "01";
				ALUSrcA   <= '0';
				ALUop     <= "00";
				RegDst    <= '0';
				MemWrite  <= '0';
				RegWrite  <= '0';
				Branch    <= '0';
				IRWrite   <= '0';
				PCWrite   <= '1';
			
		end case;
	end process;

end Behavioral;
