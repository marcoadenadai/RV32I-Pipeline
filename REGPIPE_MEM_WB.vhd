LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY REGPIPE_MEM_WB IS
   PORT (
      clock    				: IN STD_LOGIC := '0';
		Reset						: IN STD_LOGIC := '0';
		
		PCIn						: IN STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
      PCOut        			: OUT STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
		
		MEM_IN					: IN STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
      MEM_OUT       			: OUT STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
		
		ALU_IN					: IN STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
      ALU_OUT       			: OUT STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
		
		RD_IN						: IN STD_LOGIC_VECTOR(4 DOWNTO 0) := "00000";
      RD_OUT       			: OUT STD_LOGIC_VECTOR(4 DOWNTO 0) := "00000";
		
		ctl_RegWrite_IN		: IN STD_LOGIC := '0';
		ctl_RegWrite_OUT		: OUT STD_LOGIC := '0';
		
		ctl_MemToReg_IN		: IN STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
		ctl_MemToReg_OUT		: OUT STD_LOGIC_VECTOR(1 DOWNTO 0) := "00"
	);
END ENTITY;

ARCHITECTURE REGPIPE_MEM_WB_Arch OF REGPIPE_MEM_WB IS
	BEGIN
      PROCESS (clock)
      BEGIN
		
         IF rising_edge(clock) THEN
				
				IF Reset = '1' THEN
					PcOut              <= "00000000000000000000000000000000";
					MEM_OUT 				 <= "00000000000000000000000000000000";
					ALU_OUT 				 <= "00000000000000000000000000000000";
					RD_OUT 				 <= "00000";
					
					ctl_RegWrite_OUT <= '0';
					ctl_MemToReg_OUT <= "00";
					
				ELSE
					PcOut              <= PcIN;
					MEM_OUT 				 <= MEM_IN;
					ALU_OUT 				 <= ALU_IN;
					RD_OUT 				 <= RD_IN;
					
					ctl_RegWrite_OUT <= ctl_RegWrite_IN;
					ctl_MemToReg_OUT <= ctl_MemToReg_IN;
				END IF;
				
         END IF;
			
      END PROCESS;
END ARCHITECTURE;