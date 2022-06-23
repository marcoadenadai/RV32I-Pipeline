LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
use ieee.numeric_std.all;
use IEEE.Numeric_std.all;

ENTITY IMM_HANDLER IS
   PORT (
		IMM_TYPE			: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		INSTRUCTION    : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		RD       		: OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      IMM_OUT        : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000" -- SIGN EXTENDED
		);
END ENTITY;

ARCHITECTURE IMM_HANDLER_Arch OF IMM_HANDLER IS
	
	--TIPOS DE IMEDIATO 
			--INST TIPO U	000
			--INST TIPO J	001
			--INST TIPO B	010
			--INST TIPO I	011
			--INST TIPO S	100
			
	SIGNAL myIMM_OUT : STD_LOGIC_VECTOR(31 DOWNTO 0);
	----SIGNAL myRD_OUT  : STD_LOGIC_VECTOR(4 DOWNTO 0);
		
	BEGIN
	
	IMM_OUT <= myIMM_OUT;
	RD <= INSTRUCTION(11 DOWNTO 7); -- a localizacao do rd sempre sera essa, com excecao para instrucoes S e B que nao possuem rd
	
      PROCESS (IMM_TYPE, INSTRUCTION)
		variable aux : std_logic_Vector(31 downto 0);
      BEGIN
				CASE IMM_TYPE IS
					WHEN "000" => 
						--INST TIPO U -- OK
						
						aux(11 downto 0) := "000000000000";

						aux(31 downto 12) := INSTRUCTION(31 DOWNTO 12);
						
						myIMM_OUT <= aux;
						
						-----------------------
					WHEN "001" => 
						--INST TIPO J -- ok
						
						aux(0) := '0';
						
						aux(4 downto 1) := INSTRUCTION(24 DOWNTO 21);
						
						aux(10 downto 5) := INSTRUCTION(30 DOWNTO 25);
						
						aux(11) := INSTRUCTION(20);
						
						aux(19 downto 12) := INSTRUCTION(19 DOWNTO 12);
					
					
						if INSTRUCTION(31) = '1' THEN
							aux(31 downto 20) := "111111111111";
						else
							aux(31 downto 20) := "000000000000";
						end if;	
						
						myIMM_OUT <= aux;
						
						-----------------------
					WHEN "010" => 
						--INST TIPO B // OK !!
						
						aux(0) := '0';
						
						aux(4 downto 1) := INSTRUCTION(11 downto 8);
						
						aux(10 downto 5) := INSTRUCTION(30 downto 25);
						
						aux(11) := INSTRUCTION(7);
												
						
						if INSTRUCTION(31) = '1' THEN
							aux(31 downto 12) := "11111111111111111111";
						else
							aux(31 downto 12) := "00000000000000000000";
						end if;
						
						myIMM_OUT <= aux;
						
						-----------------------
					WHEN "011" => 
						--INST TIPO I // OK !!
						
						aux(0) := INSTRUCTION(20);
						
						aux(4 downto 1) := INSTRUCTION(24 downto 21);
						
						aux(10 downto 5) := INSTRUCTION(30 downto 25);
						
						if INSTRUCTION(31) = '1' THEN
							aux(31 downto 11) := "111111111111111111111";
						else
							aux(31 downto 11) := "000000000000000000000";
						end if;
						
						myIMM_OUT <= aux;

						-----------------------
					WHEN "100" => 
						--INST TIPO S // OK !!
						
						aux(0) := INSTRUCTION(7);
						
						aux(4 downto 1) := INSTRUCTION(11 downto 8);
						
						aux(10 downto 5) := INSTRUCTION(30 downto 25);
						
						if INSTRUCTION(31) = '1' THEN
							aux(31 downto 11) := "111111111111111111111";
						else
							aux(31 downto 11) := "000000000000000000000";
						end if;
						
						myIMM_OUT <= aux;
						
						-----------------------
					WHEN OTHERS => NULL;
				
				END CASE;
      END PROCESS;
END ARCHITECTURE;
