LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE MUX_MEM_TO_REG_PACKAGE IS
   COMPONENT MUX_MEM_TO_REG
      PORT (
			MEM_TO_REG  : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			OUT_MEMORY	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			ALU_RESULT	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			PC_OUT      : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
			MUX_OUT_MEM_TO_REG	: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
   END COMPONENT;
END MUX_MEM_TO_REG_PACKAGE;