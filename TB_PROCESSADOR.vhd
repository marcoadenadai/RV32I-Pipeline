library IEEE;
use IEEE.std_logic_1164.ALL; -- tipos std_logic e std_logic_vector
use IEEE.numeric_std.ALL; -- tipos unsigned e signed
use std.textio.ALL; -- deve ser incluido para uso de arquivos
LIBRARY work;

USE work.CONTROL_PACKAGE.all;

USE work.MUX_PC_PACKAGE.all;

USE work.PC_PACKAGE.all;

USE work.ROM_PACKAGE.all;

USE work.REGPIPE_IF_DF_PACKAGE.all;

USE work.BancoRegistradores_PACKAGE.all;

USE work.REGPIPE_ID_EX_PACKAGE.all;

USE work.BRANCH_COMPARE_PACKAGE.all;

USE work.MUX_ALU_1_PACKAGE.all;

USE work.MUX_ALU_2_PACKAGE.all;

USE work.ULA_PACKAGE.all;

USE work.IMM_HANDLER_PACKAGE.all;

USE work.REGPIPE_EX_MEM_PACKAGE.all;

USE work.AND_BRANCH_PACKAGE.all;

USE work.RAM_PACKAGE.all;

USE work.REGPIPE_MEM_WB_PACKAGE.all;

USE work.MUX_MEM_TO_REG_PACKAGE.all;
 
entity TB_PROCESSADOR is
end TB_PROCESSADOR;

architecture TB_PROCESSADOR_ARCH of TB_PROCESSADOR is
	-- CONSTANTES -------------------------------------------------------------
		constant PERIODO : time := 10 ns;
	
	-- SIGNALS ----------------------------------------------------------------

	-- GERAIS
		signal W_CLK 								: STD_LOGIC := '0';
		signal W_RST 								: STD_LOGIC := '0';
		
	-- Signals Unidade de Controle
		signal 
		 W_REG_WRITE_OUT,
		 W_MEM_READ_OUT, 
		 W_BRANCH_DO_IT_OUT, 
		 W_ALU_SRC_OUT, 
		 W_MEM_WRITE_OUT							: STD_LOGIC;
		signal W_MEM_TO_REG_OUT						: STD_LOGIC_VECTOR(1 DOWNTO 0);
		signal W_BRANCHOP_OUT, IMM_TYPE_OUT			: STD_LOGIC_VECTOR(2 DOWNTO 0);
		signal W_ALU_OP_OUT							: STD_LOGIC_VECTOR(3 DOWNTO 0);

	-- MUX ALU 1
		signal W_MUX_OUT_ALU_1 						: STD_LOGIC_VECTOR(31 DOWNTO 0);

	--MUX ALU 2
		signal W_MUX_OUT_ALU_2 						: STD_LOGIC_VECTOR(31 DOWNTO 0);


	-- Signals MUX_PCSrc
		signal W_BRANCH_CONTROL 					: STD_LOGIC := '0';
		signal W_MUX_IN 							: STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
		signal W_BRANCH_IN 							: STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
		signal W_MUX_OUT							: STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	-- Signals PC
		signal W_PC_IN								: STD_LOGIC_VECTOR(31 downto 0) := "00000000000000000000000000000000";
		signal W_PC_OUT								: STD_LOGIC_VECTOR(31 downto 0);
		signal W_PC_NEXT_OUT 						: STD_LOGIC_VECTOR(31 downto 0);

		
	-- Signals ROM
		---- signal W_PC_NEXT_OUT 						: STD_LOGIC_VECTOR(31 downto 0);
		signal W_ROM_OUT	 						: STD_LOGIC_VECTOR(31 DOWNTO 0);	

	-- Signals [IF/DF]  --------------------------------------------------]
		signal 	W_PC_IF_DF_OUT, W_INSTRUCTION_IF_DF_OUT : STD_LOGIC_VECTOR(31 DOWNTO 0);

	-- Signals BancoDeRegistradores
		signal W_READ_REGISTER_1					: STD_LOGIC_VECTOR(4 DOWNTO 0) := "00000";
		signal W_READ_REGISTER_2					: STD_LOGIC_VECTOR(4 DOWNTO 0) := "00000";
		signal W_WRITE_REGISTER						: STD_LOGIC_VECTOR(4 DOWNTO 0) := "00000"; 
		signal W_WRITE_DATA							: STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
		signal W_READ_DATA_1_OUT					: STD_LOGIC_VECTOR(31 DOWNTO 0); 
		signal W_READ_DATA_2_OUT					:  STD_LOGIC_VECTOR(31 DOWNTO 0);

	-- Signals [ID/EX]  --------------------------------------------------]
		---- signal W_PC_IN 								: STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000"; 
		signal W_PC_REGPIPE_ID_EX_OUT 				: STD_LOGIC_VECTOR(31 DOWNTO 0);
		signal W_REG_1_IN          					: STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
		signal W_REGPIPE_ID_EX_SAIDA_REG_OUT_1  	: STD_LOGIC_VECTOR(31 DOWNTO 0); 
		signal W_REG_2_IN							: STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
		signal W_REGPIPE_ID_EX_SAIDA_REG_OUT_2  	: STD_LOGIC_VECTOR(31 DOWNTO 0); 
		signal W_INSTRUCTION_IN						: STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";  
		signal W_INSTRUCTION_REGPIPE_ID_EX_OUT		: STD_LOGIC_VECTOR(31 DOWNTO 0); 
		signal W_CTL_REG_WRITE_IN					: STD_LOGIC := '0';
		signal W_CTL_REG_WRITE_REGPIPE_ID_EX_OUT	: STD_LOGIC;
		signal W_CTL_MEM_TO_REG						: STD_LOGIC_VECTOR(1 DOWNTO 0) := "00"; 
		signal W_CTL_MEM_TO_REG_REGPIPE_ID_EX_OUT  : STD_LOGIC_VECTOR(1 DOWNTO 0);
		signal W_CTL_MEM_WRITE_IN					: STD_LOGIC := '0'; 
		signal W_CTL_MEM_WRITE_REGPIPE_ID_EX_OUT	: STD_LOGIC;
		signal W_CTL_MEM_READ_IN					: STD_LOGIC := '0';
		signal W_CTL_MEM_READ_REGPIPE_ID_EX_OUT		: STD_LOGIC;
		signal W_CTL_BRANCH_DO_IT_IN				: STD_LOGIC := '0';
		signal W_CTL_BRANCH_DO_IT_REGPIPE_ID_EX_OUT	: STD_LOGIC;
		signal W_CTL_BRANCH_OP_IN					: STD_LOGIC_VECTOR(2 DOWNTO 0) := "000"; 
		signal W_CTL_BRANCH_OP_REGPIPE_ID_EX_OUT	: STD_LOGIC_VECTOR(2 DOWNTO 0); 
		signal W_CTL_ALU_SRC_IN						: STD_LOGIC := '0';
		signal W_CTL_ALU_SRC_REGPIPE_ID_EX_OUT		: STD_LOGIC;
		signal W_CTL_ALU_OP_IN						: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000"; 
		signal W_CTL_ALU_OP_REGPIPE_ID_EX_OUT		: STD_LOGIC_VECTOR(3 DOWNTO 0);
		signal W_CTL_IMM_TYPE_IN					: STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";
		signal W_CTL_IMM_TYPE_REGPIPE_ID_EX_OUT		: STD_LOGIC_VECTOR(2 DOWNTO 0); 
		signal W_REG_1_REGPIPE_ID_EX_OUT			: STD_LOGIC_VECTOR(31 DOWNTO 0);
		signal W_REG_2_REGPIPE_ID_EX_OUT			: STD_LOGIC_VECTOR(31 DOWNTO 0);
		
	-- Branch_Compare;
  		signal W_DECISION_BRANCH_COMPARE_OUT              : STD_LOGIC;

	-- Signals ULA
		signal W_ULAOUT 			: STD_LOGIC_VECTOR(31 DOWNTO 0);

	-- Signals Imm_Handler
		---- signal W_CTL_IMM_TYPE_IN					: STD_LOGIC_VECTOR(2 DOWNTO 0);
		---- signal W_INSTRUCTION_IN     				: STD_LOGIC_VECTOR(31 DOWNTO 0);
		signal W_RD_OUT       						: STD_LOGIC_VECTOR(4 DOWNTO 0);
		signal W_IMM_OUT           					: STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	-- [-- Signals [EX/MEM] --------------------------------------------------]
		signal W_PCIN								: STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
		signal W_PC_REGPIPE_EX_MEM_OUT        		: STD_LOGIC_VECTOR(31 DOWNTO 0);
		signal W_BRANCH_COMPARE_IN					: STD_LOGIC := '0';
		signal W_BRANCH_COMPARE_REGPIPE_EX_MEM_OUT	: STD_LOGIC;
		signal W_ALU_IN								: STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
		signal W_ALU_REGPIPE_EX_MEM_OUT       		: STD_LOGIC_VECTOR(31 DOWNTO 0);
		signal W_REG_IN								: STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
		signal W_REG_REGPIPE_EX_MEM_OUT      		: STD_LOGIC_VECTOR(31 DOWNTO 0);
		signal W_RD_IN								: STD_LOGIC_VECTOR(4 DOWNTO 0) := "00000";
		signal W_RD_REGPIPE_EX_MEM_OUT       		: STD_LOGIC_VECTOR(4 DOWNTO 0);
		
		signal W_CTL_REGWRITE_IN					: STD_LOGIC := '0';
		signal W_CTL_REGPIPE_EX_MEM_REGWRITE_OUT	: STD_LOGIC ;
		
		signal W_CTL_MEMTOREG_IN					: STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
		signal W_CTL_REGPIPE_EX_MEM_MEMTOREG_OUT	: STD_LOGIC_VECTOR(1 DOWNTO 0);
		
		signal W_CTL_MEMWRITE_IN					: STD_LOGIC := '0';
		signal W_CTL_REGPIPE_EX_MEM_MEMWRITE_OUT	: STD_LOGIC;
		
		signal W_CTL_MEMREAD_IN						: STD_LOGIC := '0';
		signal W_CTL_REGPIPE_EX_MEM_MEMREAD_OUT		:  STD_LOGIC ;
		
		signal W_CTL_BRANCHDOIT_IN					: STD_LOGIC := '0';
		signal W_CTL_REGPIPE_EX_MEM_BRANCHDOIT_OUT	: STD_LOGIC;

	
	-- Signals AND_BRANCH
		signal W_BRANCH_DO_IT       				: STD_LOGIC;
		signal W_COMPARE_BRANCH_OUT					: STD_LOGIC;
		signal W_AND_OUT							: STD_LOGIC;

	-- signals RAM
		signal W_RAM_OUT		 					: STD_LOGIC_VECTOR(31 DOWNTO 0);
		---- signal W_WRITE_DATA		 					: STD_LOGIC_VECTOR(31 downto 0);

	-- [-- Signals [MEM/WB] --------------------------------------------------]
		---- signal W_PC_IN								: STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
		signal W_PC_REGPIPE_MEM_WB_OUT        						: STD_LOGIC_VECTOR(31 DOWNTO 0);
		signal W_MEM_IN								: STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
		signal W_MEM_REGPIPE_MEM_WB_OUT       						: STD_LOGIC_VECTOR(31 DOWNTO 0);
		---- signal W_ALU_IN								: STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
		signal W_ALU_REGPIPE_MEM_WB_OUT        					: STD_LOGIC_VECTOR(31 DOWNTO 0);
		---- signal W_RD_IN								: STD_LOGIC_VECTOR(4 DOWNTO 0) := "00000";
		signal W_RD_REGPIPE_MEM_WB_OUT       						: STD_LOGIC_VECTOR(4 DOWNTO 0);
		---- signal W_CTL_REGWRITE_IN					: STD_LOGIC := '0';
		signal W_CTL_REGWRITE_REGPIPE_MEM_WB_OUT					: STD_LOGIC ;
		---- signal W_CTL_MEMTOREG_IN					: STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
		signal W_CTL_MEMTOREG_REGPIPE_MEM_WB_OUT					: STD_LOGIC_VECTOR(1 DOWNTO 0);
			

	-- Signals MUX_MemToReg
		signal W_MUX_OUT_MEM_TO_REG 				:  STD_LOGIC_VECTOR(31 DOWNTO 0);


BEGIN
	-- Setup General CLOCK
	W_CLK <= not W_CLK after PERIODO/2; 
-- COMPONENTS ------------------------------------------------------------------
	-- COMPONENTS ------------------------------------------------------------------
		-- COMPONENTS ------------------------------------------------------------------
		-- COMPONENTS ------------------------------------------------------------------
	-- COMPONENTS ------------------------------------------------------------------
-- COMPONENTS ------------------------------------------------------------------

	-- Unidade de Controle
	C_UNIDADE_CONTROLE: CONTROL PORT MAP(W_CLK, W_RST, W_INSTRUCTION_IF_DF_OUT, W_REG_WRITE_OUT, W_MEM_TO_REG_OUT, W_MEM_WRITE_OUT, W_MEM_READ_OUT, W_BRANCH_DO_IT_OUT, W_BRANCHOP_OUT, W_ALU_SRC_OUT, W_ALU_OP_OUT, IMM_TYPE_OUT); -- CLOCK, RESET, INSTRUCTION, REG_WRITE(SAIDA), MEMTOREG(SAIDA), MEMWRITE(SAIDA), MEMREAD(SAIDA), BRANCHDOIT(SAIDA), BRANCHOP(SAIDA), AUSRC(SAIDA), ALUOP(SAIDA), IMMTYPE(SAIDA) --OK
	
	-- MUX_PCSrc --OK
	C_MUX_PC: MUX_PC PORT MAP(W_AND_OUT, W_PC_NEXT_OUT, W_ALU_REGPIPE_EX_MEM_OUT, W_MUX_OUT); --BRANCH_CONTROL, MUX_IN, BRANCH_IN, MUX_OUT(SAIDA)

	-- PC --OK
	C_PC: PC PORT MAP(W_CLK, W_RST, W_MUX_OUT, W_PC_OUT, W_PC_NEXT_OUT); -- CLOCK, RESET, PC_IN, PC_OUT, PC_NEXT 
	  
	-- ROM --OK
	C_ROM: ROM PORT MAP(W_CLK, W_RST, W_PC_OUT, W_ROM_OUT); -- CLOCK, RESET, ADDR, S(SAIDA) 

	-- <-- [IF/DF]  (PIPELINE REGISTER - REGPIPE #1) --> --OK
	C_REG_PIPE_IF_DF: REGPIPE_IF_DF PORT MAP(W_CLK, W_RST, W_PC_OUT, W_PC_IF_DF_OUT, W_ROM_OUT, W_INSTRUCTION_IF_DF_OUT); --CLOCK, RESET, PCIN, PCOUT(SAIDA), INSTRUCTION_IN, INSTRUCTION_OUT(SAIDA) 

	-- BancoDeRegistradores --OK
	W_READ_REGISTER_1 <= W_INSTRUCTION_IF_DF_OUT(19 DOWNTO 15);
	W_READ_REGISTER_2 <= W_INSTRUCTION_IF_DF_OUT(24 DOWNTO 20);
	C_BANCO_REGISTRADORES: BancoRegistradores PORT MAP(W_REG_WRITE_OUT , W_CLK, W_RST, W_READ_REGISTER_1, W_READ_REGISTER_2, W_RD_REGPIPE_MEM_WB_OUT, W_MUX_OUT_MEM_TO_REG, W_READ_DATA_1_OUT, W_READ_DATA_2_OUT); --REGWRITE, CLOCK, RESET, READ_REGISTER_1, READ_REGISTER_2, WRITE_REGISTER, WRITE_DATA, READ_DATA_1(SAIDA), READ_DATA_2(SAIDA)

	-- <-- [ID/EX]  (PIPELINE REGISTER - REGPIPE #2) --> --OK
	C_REG_PIPE_ID_EX: REGPIPE_ID_EX PORT MAP(W_CLK, W_RST, W_PC_IF_DF_OUT, W_PC_REGPIPE_ID_EX_OUT, W_READ_DATA_1_OUT,  W_REG_1_REGPIPE_ID_EX_OUT, W_READ_DATA_2_OUT, W_REG_2_REGPIPE_ID_EX_OUT, W_INSTRUCTION_IF_DF_OUT, W_INSTRUCTION_REGPIPE_ID_EX_OUT, W_REG_WRITE_OUT, W_CTL_REG_WRITE_REGPIPE_ID_EX_OUT, W_MEM_TO_REG_OUT, W_CTL_MEM_TO_REG_REGPIPE_ID_EX_OUT, W_MEM_WRITE_OUT, W_CTL_MEM_WRITE_REGPIPE_ID_EX_OUT, W_MEM_READ_OUT, W_CTL_MEM_READ_REGPIPE_ID_EX_OUT, W_BRANCH_DO_IT_OUT, W_CTL_BRANCH_DO_IT_REGPIPE_ID_EX_OUT, W_BRANCHOP_OUT, W_CTL_BRANCH_OP_REGPIPE_ID_EX_OUT, W_ALU_SRC_OUT, W_CTL_ALU_SRC_REGPIPE_ID_EX_OUT, W_ALU_OP_OUT, W_CTL_ALU_OP_REGPIPE_ID_EX_OUT, IMM_TYPE_OUT, W_CTL_IMM_TYPE_REGPIPE_ID_EX_OUT); --CLOCK, RESET, PC_IN, PC_OUT(SAIDA),  REG_1_IN, REG_1_OUT(SAIDA), REG_2_IN, REG_2_OUT(SAIDA), INSTRUCTION_IN, INSTRUCTION_OUT(SAIDA), CTL_REG_WRITE_IN, CTL_REG_WRITE_OUT(SAIDA), CTL_MEM_TO_REG, CTL_MEM_TO_REG_OUT(SAIDA), CTL_MEM_WRITE_IN, CTL_MEM_WRITE_OUT(SAIDA), CTL_MEM_READ_IN, CTL_MEM_READ_OUT(SAIDA), CTL_BRANCH_DO_IT_IN, CTL_BRANCH_DO_IT_OUT(SAIDA), CTL_BRANCH_OP_IN, CTL_BRANCH_OP_OUT(SAIDA), CTL_ALU_SRC_IN, CTL_ALU_SRC_OUT(SAIDA), CTL_ALU_OP_IN, CTL_ALU_OP_OUT(SAIDA), CTL_IMM_TYPE_IN, CTL_IMM_TYPE_OUT(SAIDA) 

	-- Branch_Compare --OK
	C_BRANCH_COMPARE: BRANCH_COMPARE PORT MAP(W_CLK, W_RST, W_CTL_BRANCH_OP_REGPIPE_ID_EX_OUT, W_REG_1_REGPIPE_ID_EX_OUT, W_REG_2_REGPIPE_ID_EX_OUT, W_DECISION_BRANCH_COMPARE_OUT); -- CLOCK, RESET, MY_BRANCH_OP, REGPIPE_ID_EX_SAIDA_REG_OUT_1,REGPIPE_ID_EX_SAIDA_REG_OUT_2, DECISION_BRANCH_OUT(SAIDA)

	-- MUX_BranchDoIT (MUX_ALU_1) --OK
	C_MUX_ALU_1: MUX_ALU_1 PORT MAP(W_CTL_BRANCH_DO_IT_REGPIPE_ID_EX_OUT, W_PC_REGPIPE_ID_EX_OUT, W_REG_1_REGPIPE_ID_EX_OUT, W_MUX_OUT_ALU_1); --BRANCH_DO_IT, PC_IN, REG_OUT_1, MUX_OUT_ALU_1(SAIDA);

	-- MUX_AluSRC     (MUX_ALU_2) --OK
	C_MUX_ALU_2: MUX_ALU_2 PORT MAP(W_CTL_ALU_SRC_REGPIPE_ID_EX_OUT, W_IMM_OUT, W_REG_2_REGPIPE_ID_EX_OUT, W_MUX_OUT_ALU_2); --ALU_SRC, IMM, REG_OUT_2, MUX_OUT_ALU_2(SAIDA)

	-- ULA --OK
	C_ULA: ULA PORT MAP(W_CTL_ALU_OP_REGPIPE_ID_EX_OUT, W_MUX_OUT_ALU_1, W_MUX_OUT_ALU_2, W_ULAOUT); --ULA_OP, A, B, ULA_OUT(SAIDA)

	-- Imm_Handler --OK
	C_IMM_HANDLER: IMM_HANDLER PORT MAP(W_CTL_IMM_TYPE_REGPIPE_ID_EX_OUT, W_INSTRUCTION_REGPIPE_ID_EX_OUT, W_RD_OUT, W_IMM_OUT); --  IMM_TYPE, INSTRUCTION, RD(SAIDA), IMM_OU(SAIDA)


	-- <-- [EX/MEM] (PIPELINE REGISTER - REGPIPE #3) --> --OK
	C_REGPIPE_EX_MEM: REGPIPE_EX_MEM PORT MAP(W_CLK, W_RST, W_PC_REGPIPE_ID_EX_OUT, W_PC_REGPIPE_EX_MEM_OUT, W_DECISION_BRANCH_COMPARE_OUT, W_BRANCH_COMPARE_REGPIPE_EX_MEM_OUT, W_ULAOUT, W_ALU_REGPIPE_EX_MEM_OUT, W_REG_2_REGPIPE_ID_EX_OUT, W_REG_REGPIPE_EX_MEM_OUT, W_RD_OUT, W_RD_REGPIPE_EX_MEM_OUT, W_CTL_REG_WRITE_REGPIPE_ID_EX_OUT, W_CTL_REGPIPE_EX_MEM_REGWRITE_OUT, W_CTL_MEM_TO_REG_REGPIPE_ID_EX_OUT, W_CTL_REGPIPE_EX_MEM_MEMTOREG_OUT, W_CTL_MEM_WRITE_REGPIPE_ID_EX_OUT, W_CTL_REGPIPE_EX_MEM_MEMWRITE_OUT, W_CTL_MEM_READ_REGPIPE_ID_EX_OUT, W_CTL_REGPIPE_EX_MEM_MEMREAD_OUT, W_CTL_BRANCH_DO_IT_REGPIPE_ID_EX_OUT, W_CTL_REGPIPE_EX_MEM_BRANCHDOIT_OUT); ---CLOCK, RESET, PCIN, PCOUT, BRANCH_COMPARE_IN, BRANCH_COMPARE_OUT, ALU_IN, ALU_OUT, REG_IN, REG_OUT, RD_IN, RD_OUT, ctl_RegWrite_IN, ctl_RegWrite_OUT, ctl_MemToReg_IN, ctl_MemToReg_OUT, ctl_MemWrite_IN, Ctl_MemWrite_OUT, ctl_MemRead_IN, ctl_MemRead_OUT,ctl_BranchDoIt_IN, ctl_BranchDoIt_OUT
	
	-- AND_BRANCH --OK
	C_AND_BRANCH: AND_BRANCH PORT MAP(W_CTL_REGPIPE_EX_MEM_BRANCHDOIT_OUT, W_BRANCH_COMPARE_REGPIPE_EX_MEM_OUT, W_AND_OUT); --BRANCH_DO_IT, COMPARE_BRANCH_OUT(SAIDA)

	-- RAM (DATA MEMORY) --OK
	C_RAM: RAM PORT MAP(W_CLK, W_RST, W_CTL_MEM_READ_REGPIPE_ID_EX_OUT, W_CTL_REGPIPE_EX_MEM_MEMREAD_OUT, UNSIGNED(W_ALU_REGPIPE_EX_MEM_OUT), W_REG_REGPIPE_EX_MEM_OUT, W_RAM_OUT); --CLOCK, RESET, MEM_WRITE, MEM_READ, ADDR, WRITE_DATA, MEM_OUT(SAIDA)

	-- <-- [MEM/WB] (PIPELINE REGISTER - REGPIPE #4) --> --OK 
	C_REG_PIPE_MEM_WB: REGPIPE_MEM_WB PORT MAP(W_CLK, W_RST, W_PC_REGPIPE_EX_MEM_OUT, W_PC_REGPIPE_MEM_WB_OUT, W_RAM_OUT, W_MEM_REGPIPE_MEM_WB_OUT, W_ALU_REGPIPE_EX_MEM_OUT, W_ALU_REGPIPE_MEM_WB_OUT, W_RD_REGPIPE_EX_MEM_OUT, W_RD_REGPIPE_MEM_WB_OUT, W_CTL_REGPIPE_EX_MEM_REGWRITE_OUT, W_CTL_REGWRITE_REGPIPE_MEM_WB_OUT, W_CTL_REGPIPE_EX_MEM_MEMTOREG_OUT, W_CTL_MEMTOREG_REGPIPE_MEM_WB_OUT);  --CLOCK, RESET, PC_IN, PC_OUT(SAIDA), MIM_IN, MEM_OUT(SAIDA), ALU_IN, ALU_OUT(SAIDA), RD_IN, RD_OUT(SAIDA), CTL_REG_WRITE_IN, CTL_REG_WRITE_OUT(SAIDA), CTL_MEM_TO_REG_IN, CTL_MEM_TO_REG_OUT(SAIDA)
	
	-- MUX_MemToReg  --OK
	C_MUX_MEM_TO_REG: MUX_MEM_TO_REG PORT MAP(W_CTL_MEMTOREG_REGPIPE_MEM_WB_OUT, W_MEM_REGPIPE_MEM_WB_OUT, W_ALU_REGPIPE_EX_MEM_OUT, W_PC_REGPIPE_MEM_WB_OUT, W_MUX_OUT_MEM_TO_REG); --MEM_TO_REG, OUT_MEMORY, ALU_RESULT, PC_OUT, MUX_OUT_MEM_TO_REG(SAIDA) "00",  REGPIPE_MEM_WB_SAIDA_RAM_OUT, REGPIPE_MEM_WB_SAIDA_ULA, REGPIPE_MEM_WB_SAIDA_PC, MUX_MEM_TO_REG_SAIDA
	

-- ------- ---------------------------------------------------------------------
	

								
	tb1 : process
			constant period: time := 10 ns;
			
			begin
			
--			W_RST <= '1';
--			wait for period;
--			W_RST <= '0';
--			
--			W_MEM_WRITE <= '1';
--			W_MEM_READ <= '0';
--			W_ADDR <= 		 "00000000000000000000000000000000";
--			W_WRITE_DATA <= "00001111000011110000111100001111";
--			
--			wait for period;
--			
--			W_MEM_WRITE <= '0';
--			W_MEM_READ <= '1';
--			W_ADDR <= 		 "00000000000000000000000000000000";
--			--W_WRITE_DATA <= "00001111000011110000111100001111";
--			
--			wait for period;
--			
--			-- OBS: NAO FAZ WRITE E READ JUNTO, NESSE CASO ELE SO FAZ O WRITE!! (24.06.2022 01:18)
--			W_MEM_WRITE <= '1';
--			W_MEM_READ <= '1';
--			W_ADDR <= 		 "00000000000000000000000000000000";
--			W_WRITE_DATA <= "00000000000000000000000000000111";
--			
--			wait for period;
--			
----			assert ( (W_MEM_OUT = "00000000000000000000000000000000") ) -- expected output
----			-- error will be reported if output != expected
----			report "ERRO BEQ (0 == 0)" severity error;			
		
			wait;
		end process;
	
	
end architecture;