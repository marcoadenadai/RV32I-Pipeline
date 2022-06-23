LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY BancoRegistradores IS
    PORT(
         RegWrite,Clock,Reset	:IN	STD_LOGIC;
			ReadRegister1, ReadRegister2, WriteRegister :IN STD_LOGIC_VECTOR(4 DOWNTO 0); --WriteRegister é o endereço que vai ser escrito 	
			WriteData	:IN   STD_LOGIC_VECTOR(31 DOWNTO 0); 
			ReadData1, ReadData2	:OUT  STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000"
		);
END BancoRegistradores;

ARCHITECTURE behavior OF BancoRegistradores IS
	SIGNAL R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, R16, R17, R18, R19, R20, R21, R22, R23, R24, R25, R26, R27, R28, R29, R30, R31	: STD_LOGIC_VECTOR(31 DOWNTO 0); 	-- Registradores
	BEGIN
	PROCESS (Clock, Reset, RegWrite)
	BEGIN
		IF Reset = '1' THEN
			R0  <= "00000000000000000000000000000000";
			R1  <= "00000000000000000000000000000000";
			R2  <= "00000000000000000000000000000000";
			R3  <= "00000000000000000000000000000000";
			R4  <= "00000000000000000000000000000000";
			R5  <= "00000000000000000000000000000000";
			R6  <= "00000000000000000000000000000000";
			R7  <= "00000000000000000000000000000000";
			R8  <= "00000000000000000000000000000000";
			R9  <= "00000000000000000000000000000000";
			R10 <= "00000000000000000000000000000000";
			R11 <= "00000000000000000000000000000000";
			R12 <= "00000000000000000000000000000000";
			R13 <= "00000000000000000000000000000000";
			R14 <= "00000000000000000000000000000000";
			R15 <= "00000000000000000000000000000000";
			R16 <= "00000000000000000000000000000000";
			R17 <= "00000000000000000000000000000000";
			R18 <= "00000000000000000000000000000000";
			R19 <= "00000000000000000000000000000000";
			R20 <= "00000000000000000000000000000000";
			R21 <= "00000000000000000000000000000000";
			R22 <= "00000000000000000000000000000000";
			R23 <= "00000000000000000000000000000000";
			R24 <= "00000000000000000000000000000000";
			R25 <= "00000000000000000000000000000000";
			R26 <= "00000000000000000000000000000000";
			R27 <= "00000000000000000000000000000000";
			R28 <= "00000000000000000000000000000000";
			R29 <= "00000000000000000000000000000000";
			R30 <= "00000000000000000000000000000000";
			R31 <= "00000000000000000000000000000000";

		ELSIF rising_edge(Clock) AND RegWrite = '1' THEN
			CASE WriteRegister IS
				WHEN "00000" => R0 <="00000000000000000000000000000000";
				WHEN "00001" => R1  <= WriteData; 
				WHEN "00010" => R2  <= WriteData; 
				WHEN "00011" => R3  <= WriteData; 
				WHEN "00100" => R4  <= WriteData; 
				WHEN "00101" => R5  <= WriteData; 
				WHEN "00110" => R6  <= WriteData; 
				WHEN "00111" => R7  <= WriteData; 
				WHEN "01000" => R8  <= WriteData; 
				WHEN "01001" => R9  <= WriteData; 
				WHEN "01010" => R10 <= WriteData; 
				WHEN "01011" => R11 <= WriteData; 
				WHEN "01100" => R12 <= WriteData; 
				WHEN "01101" => R13 <= WriteData; 
				WHEN "01110" => R14 <= WriteData; 
				WHEN "01111" => R15 <= WriteData; 
				WHEN "10000" => R16 <= WriteData; 
				WHEN "10001" => R17 <= WriteData; 
				WHEN "10010" => R18 <= WriteData; 
				WHEN "10011" => R19 <= WriteData; 
				WHEN "10100" => R20 <= WriteData; 
				WHEN "10101" => R21 <= WriteData; 
				WHEN "10110" => R22 <= WriteData; 
				WHEN "10111" => R23 <= WriteData; 
				WHEN "11000" => R24 <= WriteData; 
				WHEN "11001" => R25 <= WriteData; 
				WHEN "11010" => R26 <= WriteData; 
				WHEN "11011" => R27 <= WriteData; 
				WHEN "11100" => R28 <= WriteData; 
				WHEN "11101" => R29 <= WriteData; 
				WHEN "11110" => R30 <= WriteData; 
				WHEN "11111" => R31 <= WriteData; 
				when others => NULL;
				
			END CASE;

		ELSIF rising_edge(Clock) THEN
			CASE ReadRegister1 IS
				WHEN "00000" => ReadData1  <="00000000000000000000000000000000";
							 WHEN "00001" => ReadData1 <=  R1;  
							 WHEN "00010" => ReadData1 <=  R2;  
							 WHEN "00011" => ReadData1 <=  R3;  
							 WHEN "00100" => ReadData1 <=  R4;  
							 WHEN "00101" => ReadData1 <=  R5;  
							 WHEN "00110" => ReadData1 <=  R6;  
							 WHEN "00111" => ReadData1 <=  R7;  
							 WHEN "01000" => ReadData1 <=  R8;  
							 WHEN "01001" => ReadData1 <=  R9;  
							 WHEN "01010" => ReadData1 <=  R10; 
							 WHEN "01011" => ReadData1 <=  R11; 
							 WHEN "01100" => ReadData1 <=  R12; 
							 WHEN "01101" => ReadData1 <=  R13; 
							 WHEN "01110" => ReadData1 <=  R14; 
							 WHEN "01111" => ReadData1 <=  R15; 
							 WHEN "10000" => ReadData1 <=  R16; 
							 WHEN "10001" => ReadData1 <=  R17; 
							 WHEN "10010" => ReadData1 <=  R18; 
							 WHEN "10011" => ReadData1 <=  R19; 
							 WHEN "10100" => ReadData1 <=  R20; 
							 WHEN "10101" => ReadData1 <=  R21; 
							 WHEN "10110" => ReadData1 <=  R22; 
							 WHEN "10111" => ReadData1 <=  R23; 
							 WHEN "11000" => ReadData1 <=  R24; 
							 WHEN "11001" => ReadData1 <=  R25; 
							 WHEN "11010" => ReadData1 <=  R26; 
							 WHEN "11011" => ReadData1 <=  R27; 
							 WHEN "11100" => ReadData1 <=  R28; 
							 WHEN "11101" => ReadData1 <=  R29; 
							 WHEN "11110" => ReadData1 <=  R30; 
							 WHEN "11111" => ReadData1 <=  R31; 
							 when others => NULL;
				END CASE;

			CASE ReadRegister2 IS
				WHEN "00000" => ReadData2  <="00000000000000000000000000000000";
							 WHEN "00001" => ReadData2 <=  R1;  
							 WHEN "00010" => ReadData2 <=  R2;  
							 WHEN "00011" => ReadData2 <=  R3;  
							 WHEN "00100" => ReadData2 <=  R4;  
							 WHEN "00101" => ReadData2 <=  R5;  
							 WHEN "00110" => ReadData2 <=  R6;  
							 WHEN "00111" => ReadData2 <=  R7;  
							 WHEN "01000" => ReadData2 <=  R8;  
							 WHEN "01001" => ReadData2 <=  R9;  
							 WHEN "01010" => ReadData2 <=  R10; 
							 WHEN "01011" => ReadData2 <=  R11; 
							 WHEN "01100" => ReadData2 <=  R12; 
							 WHEN "01101" => ReadData2 <=  R13; 
							 WHEN "01110" => ReadData2 <=  R14; 
							 WHEN "01111" => ReadData2 <=  R15; 
							 WHEN "10000" => ReadData2 <=  R16; 
							 WHEN "10001" => ReadData2 <=  R17; 
							 WHEN "10010" => ReadData2 <=  R18; 
							 WHEN "10011" => ReadData2 <=  R19; 
							 WHEN "10100" => ReadData2 <=  R20; 
							 WHEN "10101" => ReadData2 <=  R21; 
							 WHEN "10110" => ReadData2 <=  R22; 
							 WHEN "10111" => ReadData2 <=  R23; 
							 WHEN "11000" => ReadData2 <=  R24; 
							 WHEN "11001" => ReadData2 <=  R25; 
							 WHEN "11010" => ReadData2 <=  R26; 
							 WHEN "11011" => ReadData2 <=  R27; 
							 WHEN "11100" => ReadData2 <=  R28; 
							 WHEN "11101" => ReadData2 <=  R29; 
							 WHEN "11110" => ReadData2 <=  R30; 
							 WHEN "11111" => ReadData2 <=  R31;
							 when others => NULL;
							 
				END CASE;
		END IF;
    END PROCESS;
END behavior;