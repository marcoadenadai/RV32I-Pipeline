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
	
	signal current_pc : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	BEGIN
	
	 pc_out <= std_logic_vector(current_pc);
    pc_next <= std_logic_vector(current_pc + 1);
	
      PROCESS (clock, reset)
      BEGIN
		
         IF rising_edge(clock) THEN
				IF Reset = '1' THEN
					current_pc <= "00000000000000000000000000000000";
				ELSE
					current_pc <= pc_in;
				END IF;
				
         END IF;
			
      END PROCESS;
		
		
		
END ARCHITECTURE;

-- criar um componente somador que vai ser usado 2 vezes


