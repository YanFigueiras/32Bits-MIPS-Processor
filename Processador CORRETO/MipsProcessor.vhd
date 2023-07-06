LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity MipsProcessor is
    port ( CLK : in std_logic;
			  RESET : in std_logic;
	        ReadDataAmostra : out std_logic_vector(31 downto 0)
        );
end MipsProcessor;



architecture RTL OF MipsProcessor is
	component datapath is 
			port (
				  CLK  : in std_logic;
				  PCEn  : in std_logic;
				  IorD  : in std_logic;
				  MemWrite : in std_logic;
				  IRWrite : in std_logic;
				  RegDst  : in std_logic;
				  MemtoReg : in std_logic;
				  RegWrite : in std_logic;
				  ALUSrcA : in std_logic;
				  ALUSrcB : in std_logic_vector(1 downto 0);
				  ALUControl : in std_logic_vector(2 downto 0);
				  PCSrc: in std_logic_vector(1 downto 0);
				  opcode : out	std_logic_vector(5 downto 0);
				  funct  : out std_logic_vector (5 downto 0);
				  ReadDataAmostra  : out std_logic_vector (31 downto 0);
				  Zero: out std_logic
			 );
		end component;	
		
		component ControlUnity is 
			Port(
				  opcode : in	std_logic_vector(5 downto 0);
				  funct  : in  std_logic_vector (5 downto 0);
				  reset  : in std_logic;
				  clk    : in  std_logic;
				  MemtoReg  : out std_logic; 
				  IorD      : out std_logic; 
				  PCSrc     : out std_logic_vector(1 downto 0); 
				  ALUSrcB   : out std_logic_vector(1 downto 0); 
				  ALUSrcA   : out std_logic; 
				  AlUcontrol: out std_logic_vector(2 downto 0); 
				  RegDst    : out std_logic; 
				  MemWrite  : out std_logic; 
				  RegWrite  : out std_logic; 
				  Branch    : out std_logic; 
				  IRWrite   : out std_logic; 
				  PCWrite   : out std_logic
				  );
		end component;	
		
		component PCEnable is 
			Port(
				  zero: in std_logic;
				  branch: in std_logic;
				  pcWrite: in std_logic;
				  pcEn: out std_logic
				  );
		end component;	
		
		signal FioBranch,FioZero,FioPCWrite,IorD,MemWrite,IRWrite,RegDst,MemtoReg,RegWrite,ALUSrcA: std_logic;
		signal ALUSrcB, PCSrc: std_logic_vector(1 downto 0);
		signal ALUControl: std_logic_vector(2 downto 0);
		signal opcode, funct: std_logic_vector(5 downto 0);
		signal FioPCEn: std_logic;
	begin
		EnableDoPc: PCEnable port map (
		zero => FioZero,
		branch => FioBranch,
		pcWrite => FioPCWrite,
		pcEn => FioPCEn
		);
		
		CaminhoDeDados : datapath port map (  CLK => CLK,
												  PCEn => FioPCEn,
												  IorD => IorD,
												  MemWrite => MemWrite,
												  IRWrite => IRWrite,
												  RegDst => RegDst,
												  MemtoReg => MemtoReg,
												  RegWrite => RegWrite,
												  ALUSrcA => ALUSrcA,
												  ALUSrcB(1 downto 0) => ALUSrcB(1 downto 0),
												  ALUControl(2 downto 0) => ALUControl(2 downto 0),
												  PCSrc(1 downto 0) => PCSrc(1 downto 0),
												  opcode(5 downto 0) => opcode(5 downto 0),
												  funct(5 downto 0) => funct(5 downto 0),
												  ReadDataAmostra(31 downto 0) => ReadDataAmostra(31 downto 0),
												  Zero => FioZero
												 );
																																												
		Controladora : ControlUnity port map (opcode(5 downto 0) => opcode(5 downto 0),
														  funct(5 downto 0) => funct(5 downto 0),
														  reset => RESET,
														  clk => CLK,
														  MemtoReg => MemtoReg,
														  IorD => IorD,
														  PCSrc(1 downto 0) => PCSrc(1 downto 0), 
														  ALUSrcB(1 downto 0) => ALUSrcB(1 downto 0),
														  ALUSrcA => ALUSrcA,
														  AlUcontrol(2 downto 0) => ALUControl(2 downto 0), 
														  RegDst => RegDst,
														  MemWrite => MemWrite,
														  RegWrite => RegWrite,
														  Branch => FioBranch,
														  IRWrite => IRWrite,
														  PCWrite => FioPCWrite
														  );
end RTL ;