LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY REGPIPE_ID_EX IS
   PORT (
      clock    				: IN STD_LOGIC := '0';
		Reset						: IN STD_LOGIC := '0';
		PCIn						: IN STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
      PCOut        			: OUT STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
		REG_1_IN       		: IN STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
      REG_1_OUT		      : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
		REG_2_IN       		: IN STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
      REG_2_OUT			   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
		InstructionIn			: IN STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
      InstructionOut       : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
		
		ctl_RegWrite_IN		: IN STD_LOGIC := '0';
		ctl_RegWrite_OUT		: OUT STD_LOGIC := '0';
		
		ctl_MemToReg_IN		: IN STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
		ctl_MemToReg_OUT		: OUT STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
		
		ctl_MemWrite_IN		: IN STD_LOGIC := '0';
		ctl_MemWrite_OUT		: OUT STD_LOGIC := '0';
		
		ctl_MemRead_IN			: IN STD_LOGIC := '0';
		ctl_MemRead_OUT		: OUT STD_LOGIC := '0';
		
		ctl_BranchDoIt_IN		: IN STD_LOGIC := '0';
		ctl_BranchDoIt_OUT	: OUT STD_LOGIC := '0';
		
		ctl_BranchOP_IN		: IN STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";
		ctl_BranchOP_OUT		: OUT STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";
		
		ctl_ALUSrc_IN			: IN STD_LOGIC := '0';
		ctl_ALUSrc_OUT			: OUT STD_LOGIC := '0';
		
		ctl_ALUOp_IN			: IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
		ctl_ALUOp_OUT			: OUT STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
		
		ctl_ImmType_IN			: IN STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";
		ctl_ImmType_OUT		: OUT STD_LOGIC_VECTOR(2 DOWNTO 0) := "000"
		
		);
END ENTITY;

ARCHITECTURE REGPIPE_ID_EX_Arch OF REGPIPE_ID_EX IS
	BEGIN
      PROCESS (clock)
      BEGIN
		
         IF rising_edge(clock) THEN
				
				IF Reset = '1' THEN
					PCOut <= "00000000000000000000000000000000";
					InstructionOut <= "00000000000000000000000000000000";
					REG_1_OUT <= "00000000000000000000000000000000";
					REG_2_OUT <= "00000000000000000000000000000000";
					
					ctl_RegWrite_OUT <= '0';
					ctl_MemToReg_OUT <= "00";
					ctl_MemWrite_OUT <= '0';
					ctl_MemRead_OUT <= '0';
					ctl_BranchDoIt_OUT <= '0';
					ctl_BranchOP_OUT <= "000";
					ctl_ALUSrc_OUT <= '0';
					ctl_ALUOp_OUT <= "0000";
					ctl_ImmType_OUT <= "000";
					
				ELSE
					PCOut <= PcIn;
					REG_1_OUT <= REG_1_IN;
					REG_2_OUT <= REG_2_IN;
					InstructionOut <= InstructionIn;
					
					ctl_RegWrite_OUT <= ctl_RegWrite_IN;
					ctl_MemToReg_OUT <= ctl_MemToReg_IN;
					ctl_MemWrite_OUT <= ctl_MemWrite_IN;
					ctl_MemRead_OUT <= ctl_MemRead_IN;
					ctl_BranchDoIt_OUT <= ctl_BranchDoIt_IN;
					ctl_BranchOP_OUT <= ctl_BranchOP_IN;
					ctl_ALUSrc_OUT <= ctl_ALUSrc_IN;
					ctl_ALUOp_OUT <= ctl_ALUOp_IN;
					ctl_ImmType_OUT <= ctl_ImmType_IN;
				END IF;
				
         END IF;
			
      END PROCESS;
END ARCHITECTURE;