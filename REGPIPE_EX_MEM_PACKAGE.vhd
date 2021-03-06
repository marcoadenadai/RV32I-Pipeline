LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE REGPIPE_EX_MEM_PACKAGE IS
   COMPONENT REGPIPE_EX_MEM
      PORT (
			clock    				: IN STD_LOGIC := '0';
		   Reset						: IN STD_LOGIC := '0';
		   PCIn						: IN STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
         PCOut        			: OUT STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
		   BRANCH_COMPARE_IN		: IN STD_LOGIC := '0';
		   BRANCH_COMPARE_OUT	: OUT STD_LOGIC := '0';
		   ALU_IN					: IN STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
         ALU_OUT       			: OUT STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
		   REG_IN					: IN STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
         REG_OUT      			: OUT STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
		   RD_IN						: IN STD_LOGIC_VECTOR(4 DOWNTO 0) := "00000";
         RD_OUT       			: OUT STD_LOGIC_VECTOR(4 DOWNTO 0) := "00000";
			
			ctl_RegWrite_IN		: IN STD_LOGIC := '0';
			ctl_RegWrite_OUT		: OUT STD_LOGIC := '0';
			
			ctl_MemToReg_IN		: IN STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
			ctl_MemToReg_OUT		: OUT STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
			
			ctl_MemWrite_IN		: IN STD_LOGIC := '0';
			ctl_MemWrite_OUT		: OUT STD_LOGIC := '0';
			
			ctl_MemRead_IN			: IN STD_LOGIC := '0';
			ctl_MemRead_OUT		: OUT STD_LOGIC := '0';
			
			ctl_BranchDoIt_IN		: IN STD_LOGIC := '0';
			ctl_BranchDoIt_OUT	: OUT STD_LOGIC := '0'
			
		);
   END COMPONENT;
END REGPIPE_EX_MEM_PACKAGE;