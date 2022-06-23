LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY MUX_MEM_TO_REG IS
   PORT (
		MEM_TO_REG  : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		OUT_MEMORY	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		ALU_RESULT	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		PC_OUT      : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
		MUX_OUT_MEM_TO_REG	: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
END ENTITY;

ARCHITECTURE MUX_MEM_TO_REG_Arch OF MUX_MEM_TO_REG IS
	
	BEGIN

      PROCESS (MEM_TO_REG)
      BEGIN
		CASE MEM_TO_REG IS
				WHEN "00" => MUX_OUT_MEM_TO_REG <= OUT_MEMORY;
				WHEN "01" => MUX_OUT_MEM_TO_REG <= ALU_RESULT;
				WHEN "10" => MUX_OUT_MEM_TO_REG <= PC_OUT;
				when others => NULL;
			END CASE;
         
			
      END PROCESS;
		
END ARCHITECTURE;