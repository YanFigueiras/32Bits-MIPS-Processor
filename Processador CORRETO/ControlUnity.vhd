library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlUnity is
	Port(
		  opcode : in	std_logic_vector(5 downto 0);
		  funct  : in  std_logic_vector (5 downto 0);
		  clk    : in  std_logic;
		  reset  : in  std_logic;
		  
		  MemtoReg  : out std_logic; --mux selection of data to save in register file
		  IorD      : out std_logic; --mux selection of data adress to read in instruction/data memory
		  PCSrc     : out std_logic_vector(1 downto 0); --mux selection of next program counter
		  ALUSrcB   : out std_logic_vector(1 downto 0); -- mux selection of ALU input B
		  ALUSrcA   : out std_logic; --mux selection of ALU input A
		  AlUcontrol: out std_logic_vector(2 downto 0); --selection of ALU operation
		  RegDst    : out std_logic; --mux selection of destination register
		  MemWrite  : out std_logic; --enable to save data in instruction/data memory
		  RegWrite  : out std_logic; --enable to save data in register file
		  Branch    : out std_logic; --branch enable
		  IRWrite   : out std_logic; --enable intruction register
		  PCWrite   : out std_logic --enable PC register
		  );
end ControlUnity;

architecture Behavioral of ControlUnity is
	component ALUDecoder
		Port(
			  Funct : in  std_logic_vector (5 downto 0);
           ALUop : in  std_logic_vector (1 downto 0);
           ALUcontrol : out  std_logic_vector (2 downto 0));
	end component;
	
	component MainDecoder 
		Port(
			clk		 : in	std_logic;
			opcode	 : in	std_logic_vector(5 downto 0);
			reset   : in std_logic;
			
			MemtoReg  : out std_logic;
			IorD      : out std_logic;
			PCSrc     : out std_logic_vector(1 downto 0);
			ALUSrcB   : out std_logic_vector(1 downto 0);
			ALUSrcA   : out std_logic ;
			AlUop     : out std_logic_vector(1 downto 0); 
			RegDst    : out std_logic ;
			MemWrite  : out std_logic ;
			RegWrite  : out std_logic ;
			Branch    : out std_logic ;
			IRWrite   : out std_logic ;
			PCWrite   : out std_logic 
		);
	 end component;
	 
	 signal ALUOpSig : std_logic_vector(1 downto 0);

	begin
		
		InstantiationALUDecoder: ALUDecoder Port Map(
																	Funct => funct,
																	ALUop =>ALUOpSig,
																	ALUcontrol => ALUcontrol
																	);
		InstantiationMainDecoder: MainDecoder Port Map(
																		clk => clk,
																		opcode => opcode,
																		reset => reset,
																		MemtoReg => MemtoReg,
																		IorD     => IorD,
																		PCSrc    => PCSrc,
																		ALUSrcB  => ALUSrcB,
																		ALUSrcA  => ALUSrcA, 
																		AlUop    => ALUOpSig, 
																		RegDst   => RegDst, 
																		MemWrite => MemWrite, 
																		RegWrite => RegWrite, 
																		Branch   => Branch, 
																		IRWrite  => IRWrite, 
																		PCWrite  => PCWrite 																
																		);
end Behavioral;
	
		