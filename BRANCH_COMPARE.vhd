LIBRARY ieee;
library STD;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
use ieee.numeric_std.all;
use STD.textio.all; 
use IEEE.std_logic_textio.all;  

ENTITY BRANCH_COMPARE IS
   PORT (
      clock    				: IN STD_LOGIC := '0';
		Reset						: IN STD_LOGIC := '0';
		BRANCH_OP				: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		REG_1_IN       		: IN STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
		REG_2_IN       		: IN STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
      DECISION       : OUT STD_LOGIC := '0'
		);
END ENTITY;

ARCHITECTURE BRANCH_COMPARE_Arch OF BRANCH_COMPARE IS
	
	BEGIN
      PROCESS (BRANCH_OP, REG_1_IN, REG_2_IN) IS
			--variable my_line : line;
			variable out_var : STD_LOGIC := '0';
			
			variable r1_signed : SIGNED(31 downto 0);
			variable r1_unsigned : UNSIGNED(31 downto 0);
			
			variable r2_signed : SIGNED(31 downto 0);
			variable r2_unsigned : UNSIGNED(31 downto 0);
			
			
	
      BEGIN
			
			r1_signed := SIGNED(REG_1_IN);
			r2_signed := SIGNED(REG_2_IN);
			
			r1_unsigned := UNSIGNED(REG_1_IN);
			r2_unsigned := UNSIGNED(REG_2_IN);
		
			CASE BRANCH_OP IS
				WHEN "000" => 
				-- BEQ
						IF (r1_signed = r2_signed) THEN
							out_var := '1';
						ELSE
							out_var := '0';
						END IF;
				WHEN "001" =>
				-- BNE
						IF (r1_signed /= r2_signed) THEN
							out_var := '1';
						ELSE
							out_var := '0';
						END IF;
						--write(my_line, string'("Hello World"));
						--writeline(output, my_line);
				WHEN "100" =>
				-- BLT
						IF (r1_signed < r2_signed) THEN
							out_var := '1';
						ELSE
							out_var := '0';
						END IF;				
				WHEN "101" =>
				-- BGE
						IF (r1_signed >= r2_signed) THEN
							out_var := '1';
						ELSE
							out_var := '0';
						END IF;
				WHEN "110" =>
				-- BLTU
						IF (r1_unsigned < r2_unsigned) THEN
							out_var := '1';
						ELSE
							out_var := '0';
						END IF;
				WHEN "111" =>
				-- BGEU
						IF (r1_unsigned >= r2_unsigned) THEN
							out_var := '1';
						ELSE
							out_var := '0';
						END IF;
						
				WHEN "010" =>
				-- JUMP INCONDICIONAL
						out_var := '1';
				
				WHEN "011" =>
				-- DO NOT BRANCH !!! (AUIPC)
						out_var := '0';
				
				WHEN OTHERS => NULL;
			
			END CASE;
			DECISION <= out_var;
      END PROCESS;
END ARCHITECTURE;

