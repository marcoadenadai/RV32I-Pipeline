LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE AND_BRANCH_PACKAGE IS
   COMPONENT AND_BRANCH
      PORT (
		BRANCH_DO_IT            : IN STD_LOGIC;
		COMPARE_BRANCH_OUT		: IN STD_LOGIC;
		AND_OUT	: OUT STD_LOGIC
		);
   END COMPONENT;
END AND_BRANCH_PACKAGE;