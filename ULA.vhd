 
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
	
	WITH ULAop SELECT
		ULAout <= 	A AND B WHEN "0000",
						A OR B WHEN "0001",
						A + B WHEN "0010",
						A - B WHEN "0011",
						A XOR B WHEN "0100",
						std_logic_vector(shift_left(signed(A), to_integer(unsigned(B)))) WHEN "0101", --   <<= shift left aritmetico
						std_logic_vector(shift_right(signed(A), to_integer(unsigned(B)))) WHEN "0110", --  >>= shift right aritmetico
						std_logic_vector(shift_left(unsigned(A), to_integer(unsigned(B)))) WHEN "0111", --   << shift left logico
						std_logic_vector(shift_right(unsigned(A), to_integer(unsigned(B)))) WHEN "1000", --  >> shift right logico
						B WHEN "1001",  -- BYPASS
						"ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" WHEN others;

END ARCHITECTURE;	
