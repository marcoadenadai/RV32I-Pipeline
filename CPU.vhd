library IEEE;
use IEEE.std_logic_1164.ALL; -- tipos std_logic e std_logic_vector
use IEEE.numeric_std.ALL; -- tipos unsigned e signed
use std.textio.ALL; -- deve ser incluido para uso de arquivos
library work;
USE work.RAM_PACKAGE.all;
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

ENTITY CPU IS
	PORT(
		CLK : IN STD_LOGIC;
		RESET: IN STD_LOGIC;
		
		--CONTROLE-----------------------
		REGWRITE: IN STD_LOGIC;
		BRANCH_OP: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		MEM_WRITE: IN STD_LOGIC;
		MEM_READ: IN STD_LOGIC
	);

END ENTITY;

ARCHITECTURE CPU_ARCH OF CPU IS
BEGIN
END ARCHITECTURE;
