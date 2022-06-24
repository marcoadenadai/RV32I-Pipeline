LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY REGPIPE_EX_MEM IS
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
END ENTITY;

ARCHITECTURE REGPIPE_EX_MEM_Arch OF REGPIPE_EX_MEM IS
	BEGIN
      PROCESS (clock)
      BEGIN
		
         IF rising_edge(clock) THEN
				
				IF Reset = '1' THEN
					PcOut              <= "00000000000000000000000000000000";
					BRANCH_COMPARE_OUT <= '0';
					ALU_OUT 				 <= "00000000000000000000000000000000";
					REG_OUT 				 <= "00000000000000000000000000000000";
					RD_OUT 				 <= "00000";
					
					ctl_RegWrite_OUT <= '0';
					ctl_MemToReg_OUT <= "00";
					ctl_MemWrite_OUT <= '0';
					ctl_MemRead_OUT <= '0';
					ctl_BranchDoIt_OUT <= '0';
					
				ELSE
					PcOut              <= PCIN;
					BRANCH_COMPARE_OUT <= BRANCH_COMPARE_IN;
					ALU_OUT 				 <= ALU_IN;
					REG_OUT 				 <= REG_IN;
					RD_OUT 				 <= RD_IN;
					
					ctl_RegWrite_OUT <= ctl_RegWrite_IN;
					ctl_MemToReg_OUT <= ctl_MemToReg_IN;
					ctl_MemWrite_OUT <= ctl_MemWrite_IN;
					ctl_MemRead_OUT <= ctl_MemRead_IN;
					ctl_BranchDoIt_OUT <= ctl_BranchDoIt_IN;
				END IF;
				
         END IF;
			
      END PROCESS;
END ARCHITECTURE;