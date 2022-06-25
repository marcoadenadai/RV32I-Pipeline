LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY MUX_PC IS
   PORT (
		BRANCH_CONTROL: IN STD_LOGIC;
		MUX_IN		: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		BRANCH_IN	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		MUX_OUT	: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
END ENTITY;

ARCHITECTURE MUX_PC_Arch OF MUX_PC IS

	BEGIN

	MUX_OUT <= 
		BRANCH_IN WHEN (BRANCH_CONTROL = '1') ELSE
		MUX_IN;

		


    --   PROCESS (BRANCH_CONTROL)
    --   BEGIN
		
    --      IF BRANCH_CONTROL = '1' THEN
	-- 			MUX_OUT <= BRANCH_IN;
	-- 		ELSE
	-- 			MUX_OUT <= MUX_IN;		
    --      END IF;
			
    --   END PROCESS;
		
END ARCHITECTURE;