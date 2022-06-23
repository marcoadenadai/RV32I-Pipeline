LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY MUX_ALU_2 IS
   PORT (
		ALU_SRC: IN STD_LOGIC;
		IMM		: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		REG_OUT_2	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		MUX_OUT_ALU_2	: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
END ENTITY;

ARCHITECTURE MUX_ALU_2_Arch OF MUX_ALU_2 IS
	
	BEGIN
		WITH ALU_SRC SELECT 

		   MUX_OUT_ALU_2 <= IMM WHEN '1',
								  REG_OUT_2 WHEN '0',
								  REG_OUT_2 WHEN OTHERS;

		
END ARCHITECTURE;