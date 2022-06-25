LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY PC IS
   PORT (
      clock    : IN STD_LOGIC;
		reset		: IN STD_LOGIC;
		pc_in		: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		pc_out	: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		pc_next	: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
END ENTITY;

ARCHITECTURE PCArch OF PC IS

	BEGIN
	
      PROCESS (clock, reset)
      BEGIN
		
         IF rising_edge(clock) THEN
				IF Reset = '1' THEN
					pc_out <= "00000000000000000000000000000000";
					pc_next <= "00000000000000000000000000000001";

				ELSE
					pc_out <= pc_in;
					pc_next <= std_logic_vector(pc_in + 1);
				END IF;
				
         END IF;
			
      END PROCESS;
		
		
		
END ARCHITECTURE;