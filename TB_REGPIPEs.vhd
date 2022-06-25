
library IEEE;
use IEEE.std_logic_1164.ALL; -- tipos std_logic e std_logic_vector
use IEEE.numeric_std.ALL; -- tipos unsigned e signed
library work;
USE work.REGPIPE_IF_DF_PACKAGE.all;
USE work.REGPIPE_ID_EX_PACKAGE.all;
USE work.REGPIPE_EX_MEM_PACKAGE.all;
USE work.REGPIPE_MEM_WB_PACKAGE.all;
use std.textio.ALL; -- deve ser incluido para uso de arquivos

 
entity TB_REGPIPEs is
end TB_REGPIPEs;

-- TODO TERMINAR, PREICSA TERMINAR ESSE EH SO UM ESBOCO !!! MUITA ATENCAO NOS FIOS

architecture TB_REGPIPEs_ARCH of TB_REGPIPEs is
	constant PERIODO : time := 10 ns;
	
	signal W_CLK : STD_LOGIC := '0';
	signal W_RST : STD_LOGIC := '0';
	
	-- IF / DF (1) ------------------------
	
	--inputs--
	signal W_PC  	: STD_LOGIC_VECTOR(31 downto 0) := "00000000000000000000000000000000"; -- DEFINIR VALORES p/ TESTE
	signal W_INST 	: STD_LOGIC_VECTOR(31 downto 0) := "00000000000000000000000000000000"; -- DEFINIR VALORES p/ TESTE	--outputs--
	signal W_PC_OUT : STD_LOGIC_VECTOR(31 downto 0);
	signal W_INST_OUT : STD_LOGIC_VECTOR(31 downto 0);
	
	---------------------------------------
	
	-- ID / EX (2)
	
	--inputs--
	
	--	>> W_PC_OUT
	signal W_R1  	: STD_LOGIC_VECTOR(31 downto 0) := "00000000000000000000000000000000"; -- DEFINIR VALORES p/ TESTE
	signal W_R2  	: STD_LOGIC_VECTOR(31 downto 0) := "00000000000000000000000000000000"; -- DEFINIR VALORES p/ TESTE
	--	>> W_INST_OUT
	
	--outputs--
	signal W_PC_OUT2 : STD_LOGIC_VECTOR(31 downto 0);
	signal W_R1_OUT2 : STD_LOGIC_VECTOR(31 downto 0);
	signal W_R2_OUT2 : STD_LOGIC_VECTOR(31 downto 0);
	signal W_INST_OUT2 : STD_LOGIC_VECTOR(31 downto 0);
	
	---------------------------------------
	
	-- EX / MEM (3)
	
	--inputs--
	--	>> W_PC_OUT2
	--	>> W_R2_OUT2
	signal W_BRANCH  	: STD_LOGIC := '0'; 																		-- DEFINIR VALORES p/ TESTE
	signal W_ULA		: STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";	-- DEFINIR VALORES p/ TESTE
	signal W_RD		: STD_LOGIC_VECTOR(4 DOWNTO 0) := "00000"; 											-- DEFINIR VALORES p/ TESTE
	
	--outputs--
	signal W_BRANCH_OUT3	: STD_LOGIC := '0';
	
	signal W_PC_OUT3 : STD_LOGIC_VECTOR(31 downto 0);
	signal W_INST_OUT3 : STD_LOGIC_VECTOR(31 downto 0);	
	signal W_R2_OUT3 : STD_LOGIC_VECTOR(31 downto 0);
	signal W_ULA_OUT3	: STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal W_RD_OUT3	: STD_LOGIC_VECTOR(4 DOWNTO 0);
	
	---------------------------------------
	
	-- MEM / WB (4)
	
	--inputs--
	-- >> W_PC_OUT3
	signal W_RAM_OUT : STD_LOGIC_VECTOR(31 DOWNTO 0); ---- DEFINIR VALORES p/ TESTE
	-- >> W_ULA_OUT3
	-- >> W_RD_OUT3
	
	
	--outputs--
	
	signal W_PC_OUT4 : STD_LOGIC_VECTOR(31 downto 0);
	signal W_RAM_OUT4 : STD_LOGIC_VECTOR(31 downto 0);
	signal W_ULA_OUT4	: STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal W_RD_OUT4 : STD_LOGIC_VECTOR(31 downto 0);
	
	
	---------------------------------------
	
	
begin

	W_CLK <= not W_CLK after PERIODO/2;
	
	BLOCO_1 : REGPIPE_IF_DF PORT MAP ( clock => W_CLK,
												  Reset => W_RST,
												  PCIn => W_PC,
												  PCOut => W_PC_OUT,
												  InstructionIn => W_INST,
												  InstructionOut => 	W_INST_OUT											
												);
	
	BLOCO_2 : REGPIPE_ID_EX PORT MAP ( clock => W_CLK,
												  Reset => W_RST,
												  PCIn => W_PC_OUT,
												  PCOut => W_PC_OUT2,
												  InstructionIn => W_INST_OUT,
												  InstructionOut => 	W_INST_OUT2,
												  REG_1_IN => W_R1,
												  REG_1_OUT => W_R1_OUT2,
												  REG_2_IN => W_R2,
												  REG_2_OUT => W_R2_OUT2
												  
												 );
	
	BLOCO_3 : REGPIPE_EX_MEM PORT MAP (clock => W_CLK,
												  Reset => W_RST,
												  PCIn => W_PC_OUT2,
												  PCOut => W_PC_OUT3,
												  
												  REG_IN => W_R2_OUT2,
												  REG_OUT => W_R2_OUT3,
												  
												  ALU_IN => W_ULA,
												  ALU_OUT => W_ULA_OUT3,
												  RD_IN => W_RD,
												  RD_OUT => W_RD_OUT3,
												  BRANCH_COMPARE_IN => W_BRANCH,
												  BRANCH_COMPARE_OUT => W_BRANCH_OUT3
												  );
	
	BLOCO_4 : REGPIPE_MEM_WB PORT MAP ( clock => W_CLK,
												  Reset => W_RST,
												  PCIn => W_PC_OUT3,
												  PCOut => W_PC_OUT4,
												  MEM_IN => W_RAM_OUT,
												  MEM_OUT => W_RAM_OUT4,
												  ALU_IN => W_ULA_OUT3,
												  ALU_OUT => W_ULA_OUT4,
												  RD_IN => W_RD_OUT3,
												  RD_OUT => W_RD_OUT4
												  
												  );
	
	
	
	
	tb1 : process
			constant period: time := 10 ns;
			
			begin
			
			-- TEST1 ---------------------------------------------------------------
--			W_ULA_OP <= "0000";
--			W_A <= "11111111111111111111111111111111";
--			W_B <= "00000000000000000000000000000001";
--			wait for period;
--			assert ( (W_OUT = "00000000000000000000000000000001") ) -- expected output
--			-- error will be reported if output != expected
--			report "ERRO no AND (1)" severity error;
			

			wait;
		end process;

end architecture;