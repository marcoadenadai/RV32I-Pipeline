LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

PACKAGE MUX_PC_PACKAGE IS
   COMPONENT MUX_PC 
   PORT (
      BRANCH_CONTROL: IN STD_LOGIC;
		MUX_IN		: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		BRANCH_IN	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		MUX_OUT	: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
   END COMPONENT;
END MUX_PC_PACKAGE;