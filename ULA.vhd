 
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
use ieee.numeric_std.all;  

ENTITY ULA IS
	PORT(
			ULAop			: IN	STD_LOGIC_VECTOR(3 DOWNTO 0) := "0110"; --BYPASS DEFAULT
			A, B			: IN	STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
			ULAout 		: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
END ENTITY;

ARCHITECTURE ULA_Arch OF ULA IS

BEGIN
						
	PROCESS (ULAop, A, B)
		
		begin
		
		CASE ULAOp is
			-- ADD
			WHEN "0000" => ULAout <= A + B;
			-- SUB
			WHEN "0001" => ULAout <= A - B;
			-- SLL
			WHEN "0010" => ULAout <= std_logic_vector(shift_left(unsigned(A), to_integer(unsigned(B))));
			-- SLT
			WHEN "0011" => IF A < B THEN
									ULAout <= "00000000000000000000000000000001";
								ELSE
									ULAout <= "00000000000000000000000000000000";
								END IF;
			-- SLTU
			WHEN "0100" => IF UNSIGNED(A) < UNSIGNED(B) THEN
									ULAout <= "00000000000000000000000000000001";
								ELSE
									ULAout <= "00000000000000000000000000000000";
								END IF;
			-- XOR
			WHEN "0101" => ULAout <= A XOR B;
			-- SRL
			WHEN "0110" => ULAout <= std_logic_vector(shift_right(unsigned(A), to_integer(unsigned(B))));
			-- SRA
			WHEN "0111" => ULAout <= std_logic_vector(shift_right(signed(A), to_integer(unsigned(B))));
			-- OR
			WHEN "1000" => ULAout <= A OR B;
			-- AND
			WHEN "1001" => ULAout <= A AND B;
			-- BYPASS (B)
			WHEN "1010" => ULAout <= B;
--			WHEN "1011" => ;
--			WHEN "1100" => ;
--			WHEN "1101" => ;
--			WHEN "1110" => ;
--			WHEN "1111" => ;
			WHEN others => ULAout <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
		END CASE;
		
	END PROCESS;

END ARCHITECTURE;	
