LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY REGPIPE_IF_DF IS
   PORT (
      clock    				: IN STD_LOGIC := '0';
		Reset						: IN STD_LOGIC := '0';
		PCIn						: IN STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
      PCOut        			: OUT STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
		InstructionIn			: IN STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
      InstructionOut       : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000"
	);
END ENTITY;

ARCHITECTURE REGPIPE_IF_DF_Arch OF REGPIPE_IF_DF IS
	BEGIN
      PROCESS (clock)
      BEGIN
		
         IF rising_edge(clock) THEN
				
				IF Reset = '1' THEN
					PcOut <= "00000000000000000000000000000000";
					InstructionOut <= "00000000000000000000000000000000";
					
				ELSE
					PcOut <= PcIn;
					InstructionOut <= InstructionIn;
					
				END IF;
				
         END IF;
			
      END PROCESS;
END ARCHITECTURE;