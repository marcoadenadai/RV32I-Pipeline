 
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
use ieee.numeric_std.all;  

ENTITY ULA IS
	PORT( 	
			Clock			:IN	STD_LOGIC;
			Reset       :IN 	STD_LOGIC;
			ULAop			:IN	STD_LOGIC_VECTOR(3 DOWNTO 0) := "0110"; --BYPASS DEFAULT
			A, B			:IN	STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
			ULAout 			:OUT STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000"
		);
END ENTITY;

ARCHITECTURE ULA_Arch OF ULA IS

BEGIN
	PROCESS (ULAop, clock)
	BEGIN
	
		IF Clock'EVENT AND clock = '0' THEN
			CASE ULAop IS
				WHEN "0000" => 
					ULAout <= A AND B;
				WHEN "0001" => 
					ULAout <= A OR B;
				WHEN "0010" => 
					ULAout <= A + B;
				WHEN "0011" => 
					ULAout <= A XOR B;
				WHEN "0100" => 
					ULAout <= A + B;
				WHEN "0101" => 
					ULAout <= A - B;
				WHEN "0110" => 
					ULAout <= B; -- BYPASS DE IMEDIATO
				WHEN "0111" => 
					ULAout <= std_logic_vector(shift_left(signed(A), to_integer(unsigned(B))));     -- SHIFT LEFT ARITMETICO
				WHEN "1000" => 
					ULAout <= std_logic_vector(shift_right(signed(A), to_integer(unsigned(B))));    --SHIFT RIGHT ARITIMETICO
				WHEN "1001" => 
					ULAout <= std_logic_vector(shift_left(unsigned(A), to_integer(unsigned(B))));   -- SHIFT LEFT LOGICO
				WHEN "1010" => 
					ULAout <= std_logic_vector(shift_right(unsigned(A), to_integer(unsigned(B))));  -- SHIFT RIGHT LOGICO
				WHEN OTHERS => NULL;
			END CASE; 
		END IF;
	END PROCESS;
END ARCHITECTURE;	

	
-- OP1 : in std_logic_vector(7 downto 0);
-- signal accum: std_logic_vector(7 downto 0);
-- ...
-- accum <= std_logic_vector(shift_left(unsigned(accum), to_integer(unsigned(U))));  
-- accum <= std_logic_vector(shift_right(unsigned(accum), to_integer(unsigned(OP1))));


-- AND
-- OR
-- +
-- -
-- not
-- shift left
-- shift right
-- rotate
-- xor
-- bypass

-- total de 10