LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE MUX_ALU_2_PACKAGE IS
   COMPONENT MUX_ALU_2
      PORT (
		ALU_SRC: IN STD_LOGIC;
		IMM		: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		REG_OUT_2	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		MUX_OUT_ALU_2	: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
   END COMPONENT;
END MUX_ALU_2_PACKAGE;