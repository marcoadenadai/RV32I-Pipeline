library IEEE;
use IEEE.std_logic_1164.ALL; -- tipos std_logic e std_logic_vector
use IEEE.numeric_std.ALL; -- tipos unsigned e signed
library work;
USE work.BancoRegistradores_PACKAGE.all;
use std.textio.ALL; -- deve ser incluido para uso de arquivos

 
entity TB_Banco_Registradores is
end TB_Banco_Registradores;

architecture TB_Banco_Registradores_ARCH of TB_Banco_Registradores is
	constant PERIODO : time := 10 ns;
	signal RegWrite : STD_LOGIC; 	--input
	signal W_CLK : STD_LOGIC := '0'; 	--input
	signal Reset : STD_LOGIC; 	--input

	signal ReadRegister1 : STD_LOGIC_VECTOR(4 DOWNTO 0); 	--input
	signal ReadRegister2 : STD_LOGIC_VECTOR(4 DOWNTO 0); 	--input
	signal WriteRegister : STD_LOGIC_VECTOR(4 DOWNTO 0); 	--input

	signal WriteData : STD_LOGIC_VECTOR(31 DOWNTO 0); 	--input
	signal ReadData1 : STD_LOGIC_VECTOR(31 DOWNTO 0); 	--output
	signal ReadData2 : STD_LOGIC_VECTOR(31 DOWNTO 0); 	--output


begin

	W_CLK <= not W_CLK after PERIODO/2; 
	
	BLOCO : BancoRegistradores PORT MAP(	
		RegWrite,
		W_CLK,
		Reset,		
		ReadRegister1, 
		ReadRegister2,
		WriteRegister,
		WriteData,
		ReadData1,
		ReadData2
	);

	tb1 : process
			constant period: time := 10 ns;
			
			begin

			-- First Read
			Reset <= '1';
			wait for period;
			Reset <= '0';

			-- REGISTRADOR 0 ----------------------------------------------------------------------
			--Read 1
			RegWrite <= '0';
			ReadRegister1 <= "00000"; -- endereço registrador vai ser lido
			wait for period;
			assert ( ReadData1 <= "00000000000000000000000000000000" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registradores 0 (1)" severity error;

			--wait for period;
		

			-- REGISTRADOR 1 ----------------------------------------------------------------------

			-- Write 1
			RegWrite <= '1';
			ReadRegister1 <= "00001"; -- endereço registrador vai ser lido
			WriteRegister <= "00001"; -- endereço do registrador que vai ser escrito
			WriteData <= "11111111111111111111111111111111";
			wait for period;
			assert ( ReadData1 <= "00000000000000000000000000000000" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registrador 1 (1)" severity error;
					
			
			-- Read 2
			RegWrite <= '0';
			ReadRegister1 <= "00001"; -- endereço registrador vai ser lido
			wait for period;
			assert ( ReadData1 = "11111111111111111111111111111111" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registrador 1 (2)" severity error;

			-- REGISTRADOR 2 ----------------------------------------------------------------------

			
			-- Write 1
			RegWrite <= '1';
			WriteRegister <= "00010"; -- endereço do registrador que vai ser escrito
			WriteData <= "11111111111111111111111111111110";
			wait for period;
					
			
			-- Read 2
			RegWrite <= '0';
			ReadRegister1 <= "00010"; -- endereço registrador vai ser lido
			wait for period;
			assert ( ReadData1 = "11111111111111111111111111111110" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registrador 2 (2)" severity error;

			-- REGISTRADOR 3 ----------------------------------------------------------------------

			-- Write 1
			RegWrite <= '1';
			WriteRegister <= "00011"; -- endereço do registrador que vai ser escrito
			WriteData <= "11111111111111111111111111111100";
			wait for period;
					
			
			-- Read 2
			RegWrite <= '0';
			ReadRegister1 <= "00011"; -- endereço registrador vai ser lido
			wait for period;
			assert ( ReadData1 = "11111111111111111111111111111100" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registrador 3 (2)" severity error;

			-- REGISTRADOR 4 ----------------------------------------------------------------------

			-- Write 1
			RegWrite <= '1';
			WriteRegister <= "00100"; -- endereço do registrador que vai ser escrito
			WriteData <= "11111111111111111111111111111000";
			wait for period;
					
			
			-- Read 2
			RegWrite <= '0';
			ReadRegister1 <= "00100"; -- endereço registrador vai ser lido
			wait for period;
			assert ( ReadData1 = "11111111111111111111111111111000" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registrador 4 (2)" severity error;

			-- REGISTRADOR 5 ----------------------------------------------------------------------

			-- Write 1
			RegWrite <= '1';
			WriteRegister <= "00101"; -- endereço do registrador que vai ser escrito
			WriteData <= "11111111111111111111111111110000";
			wait for period;
			
			-- Read 2
			RegWrite <= '0';
			ReadRegister1 <= "00101"; -- endereço registrador vai ser lido
			wait for period;
			assert ( ReadData1 = "11111111111111111111111111110000" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registrador 5 (2)" severity error;

			-- REGISTRADOR 6 ----------------------------------------------------------------------

			-- Write 1
			RegWrite <= '1';
			WriteRegister <= "00110"; -- endereço do registrador que vai ser escrito
			WriteData <= "11111111111111111111111111100000";
			wait for period;
					
			
			-- Read 2
			RegWrite <= '0';
			ReadRegister1 <= "00110"; -- endereço registrador vai ser lido
			wait for period;
			assert ( ReadData1 = "11111111111111111111111111100000" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registrador 6 (2)" severity error;

			-- REGISTRADOR 7 ----------------------------------------------------------------------

			-- Write 1
			RegWrite <= '1';
			WriteRegister <= "00111"; -- endereço do registrador que vai ser escrito
			WriteData <= "11111111111111111111111111000000";
			wait for period;
					
			
			-- Read 2
			RegWrite <= '0';
			ReadRegister1 <= "00111"; -- endereço registrador vai ser lido
			wait for period;
			assert ( ReadData1 = "11111111111111111111111111000000" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registrador 7 (2)" severity error;

			-- REGISTRADOR 8 ----------------------------------------------------------------------

			-- Write 1
			RegWrite <= '1';
			WriteRegister <= "01000"; -- endereço do registrador que vai ser escrito
			WriteData <= "11111111111111111111111110000000";
			wait for period;
					
			
			-- Read 2
			RegWrite <= '0';
			ReadRegister1 <= "01000"; -- endereço registrador vai ser lido
			wait for period;
			assert ( ReadData1 = "11111111111111111111111110000000" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registrador 8 (2)" severity error;

			-- REGISTRADOR 9 ----------------------------------------------------------------------

			-- Write 1
			RegWrite <= '1';
			WriteRegister <= "01001"; -- endereço do registrador que vai ser escrito
			WriteData <= "11111111111111111111111100000000";
			wait for period;
					
			
			-- Read 2
			RegWrite <= '0';
			ReadRegister1 <= "01001"; -- endereço registrador vai ser lido
			wait for period;
			assert ( ReadData1 = "11111111111111111111111100000000" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registrador 9 (2)" severity error;

			-- REGISTRADOR 10 ----------------------------------------------------------------------

			-- Write 1
			RegWrite <= '1';
			WriteRegister <= "01010"; -- endereço do registrador que vai ser escrito
			WriteData <= "11111111111111111111111000000000";
			wait for period;
					
			
			-- Read 2
			RegWrite <= '0';
			ReadRegister1 <= "01010"; -- endereço registrador vai ser lido
			wait for period;
			assert ( ReadData1 = "11111111111111111111111000000000" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registrador 10 (2)" severity error;

			-- REGISTRADOR 11 ----------------------------------------------------------------------

			-- Write 1
			RegWrite <= '1';
			WriteRegister <= "01011"; -- endereço do registrador que vai ser escrito
			WriteData <= "11111111111111111111110000000000";
			wait for period;
					
			
			-- Read 2
			RegWrite <= '0';
			ReadRegister1 <= "01011"; -- endereço registrador vai ser lido
			wait for period;
			assert ( ReadData1 = "11111111111111111111110000000000" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registrador 11 (2)" severity error;

			-- REGISTRADOR 12 ----------------------------------------------------------------------

			-- Write 1
			RegWrite <= '1';
			WriteRegister <= "01100"; -- endereço do registrador que vai ser escrito
			WriteData <= "11111111111111111111100000000000";
			wait for period;
					
			
			-- Read 2
			RegWrite <= '0';
			ReadRegister1 <= "01100"; -- endereço registrador vai ser lido
			wait for period;
			assert ( ReadData1 = "11111111111111111111100000000000" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registrador 12 (2)" severity error;

			-- REGISTRADOR 13 ----------------------------------------------------------------------

			-- Write 1
			RegWrite <= '1';
			WriteRegister <= "01101"; -- endereço do registrador que vai ser escrito
			WriteData <= "11111111111111111111000000000000";
			wait for period;
					
			
			-- Read 2
			RegWrite <= '0';
			ReadRegister1 <= "01101"; -- endereço registrador vai ser lido
			wait for period;
			assert ( ReadData1 = "11111111111111111111000000000000" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registrador 13 (2)" severity error;

			-- REGISTRADOR 14 ----------------------------------------------------------------------

			-- Write 1
			RegWrite <= '1';
			WriteRegister <= "01110"; -- endereço do registrador que vai ser escrito
			WriteData <= "11111111111111111110000000000000";
			wait for period;
					
			
			-- Read 2
			RegWrite <= '0';
			ReadRegister1 <= "01110"; -- endereço registrador vai ser lido
			wait for period;
			assert ( ReadData1 = "11111111111111111110000000000000" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registrador 14 (2)" severity error;

			-- REGISTRADOR 15 ----------------------------------------------------------------------

			-- Write 1
			RegWrite <= '1';
			WriteRegister <= "01111"; -- endereço do registrador que vai ser escrito
			WriteData <= "11111111111111111000000000000000";
			wait for period;
					
			
			-- Read 2
			RegWrite <= '0';
			ReadRegister1 <= "01111"; -- endereço registrador vai ser lido
			wait for period;
			assert ( ReadData1 = "11111111111111111000000000000000" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registrador 15 (2)" severity error;

			-- REGISTRADOR 16 ----------------------------------------------------------------------

			-- Write 1
			RegWrite <= '1';
			WriteRegister <= "10000"; -- endereço do registrador que vai ser escrito
			WriteData <= "11111111111111110000000000000000";
			wait for period;
					
			
			-- Read 2
			RegWrite <= '0';
			ReadRegister1 <= "10000"; -- endereço registrador vai ser lido
			wait for period;
			assert ( ReadData1 = "11111111111111110000000000000000" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registrador 16 (2)" severity error;

			-- REGISTRADOR 17 ----------------------------------------------------------------------

			-- Write 1
			RegWrite <= '1';
			WriteRegister <= "10001"; -- endereço do registrador que vai ser escrito
			WriteData <= "11111111111111100000000000000000";
			wait for period;
					
			
			-- Read 2
			RegWrite <= '0';
			ReadRegister1 <= "10001"; -- endereço registrador vai ser lido
			wait for period;
			assert ( ReadData1 = "11111111111111100000000000000000" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registrador 17 (2)" severity error;

			-- REGISTRADOR 18 ----------------------------------------------------------------------

			-- Write 1
			RegWrite <= '1';
			WriteRegister <= "10010"; -- endereço do registrador que vai ser escrito
			WriteData <= "11111111111111000000000000000000";
			wait for period;
					
			
			-- Read 2
			RegWrite <= '0';
			ReadRegister1 <= "10010"; -- endereço registrador vai ser lido
			wait for period;
			assert ( ReadData1 = "11111111111111000000000000000000" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registrador 18 (2)" severity error;

			-- REGISTRADOR 19 ----------------------------------------------------------------------

			-- Write 1
			RegWrite <= '1';
			WriteRegister <= "10011"; -- endereço do registrador que vai ser escrito
			WriteData <= "11111111111110000000000000000000";
			wait for period;
					
			
			-- Read 2
			RegWrite <= '0';
			ReadRegister1 <= "10011"; -- endereço registrador vai ser lido
			wait for period;
			assert ( ReadData1 = "11111111111110000000000000000000" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registrador 19 (2)" severity error;
			

			-- REGISTRADOR 20 ----------------------------------------------------------------------

			-- Write 1
			RegWrite <= '1';
			WriteRegister <= "10100"; -- endereço do registrador que vai ser escrito
			WriteData <= "11111111111100000000000000000000";
			wait for period;
					
			
			-- Read 2
			RegWrite <= '0';
			ReadRegister1 <= "10100"; -- endereço registrador vai ser lido
			wait for period;
			assert ( ReadData1 = "11111111111100000000000000000000" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registrador 20 (2)" severity error;

			-- REGISTRADOR 21 ----------------------------------------------------------------------

			-- Write 1
			RegWrite <= '1';
			WriteRegister <= "10101"; -- endereço do registrador que vai ser escrito
			WriteData <= "11111111111000000000000000000000";
			wait for period;
					
			
			-- Read 2
			RegWrite <= '0';
			ReadRegister1 <= "10101"; -- endereço registrador vai ser lido
			wait for period;
			assert ( ReadData1 = "11111111111000000000000000000000" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registrador 21 (2)" severity error;

			-- REGISTRADOR 22 ----------------------------------------------------------------------

			-- Write 1
			RegWrite <= '1';
			WriteRegister <= "10110"; -- endereço do registrador que vai ser escrito
			WriteData <= "11111111110000000000000000000000";
			wait for period;
					
			
			-- Read 2
			RegWrite <= '0';
			ReadRegister1 <= "10110"; -- endereço registrador vai ser lido
			wait for period;
			assert ( ReadData1 = "11111111110000000000000000000000" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registrador 22 (2)" severity error;

			-- REGISTRADOR 23 ----------------------------------------------------------------------

			-- Write 1
			RegWrite <= '1';
			WriteRegister <= "10111"; -- endereço do registrador que vai ser escrito
			WriteData <= "11111111100000000000000000000000";
			wait for period;
					
			
			-- Read 2
			RegWrite <= '0';
			ReadRegister1 <= "10111"; -- endereço registrador vai ser lido
			wait for period;
			assert ( ReadData1 = "11111111100000000000000000000000" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registrador 23 (2)" severity error;

			-- REGISTRADOR 24 ----------------------------------------------------------------------

			-- Write 1
			RegWrite <= '1';
			WriteRegister <= "11000"; -- endereço do registrador que vai ser escrito
			WriteData <= "11111111000000000000000000000000";
			wait for period;
					
			
			-- Read 2
			RegWrite <= '0';
			ReadRegister1 <= "11000"; -- endereço registrador vai ser lido
			wait for period;
			assert ( ReadData1 = "11111111000000000000000000000000" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registrador 24 (2)" severity error;

			-- REGISTRADOR 25 ----------------------------------------------------------------------

			-- Write 1
			RegWrite <= '1';
			WriteRegister <= "11001"; -- endereço do registrador que vai ser escrito
			WriteData <= "11111111000000000000000000000000";
			wait for period;
					
			
			-- Read 2
			RegWrite <= '0';
			ReadRegister1 <= "11001"; -- endereço registrador vai ser lido
			wait for period;
			assert ( ReadData1 = "11111111000000000000000000000000" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registrador 25 (2)" severity error;

			-- REGISTRADOR 26 ----------------------------------------------------------------------

			-- Write 1
			RegWrite <= '1';
			WriteRegister <= "11010"; -- endereço do registrador que vai ser escrito
			WriteData <= "11111110000000000000000000000000";
			wait for period;
					
			
			-- Read 2
			RegWrite <= '0';
			ReadRegister1 <= "11010"; -- endereço registrador vai ser lido
			wait for period;
			assert ( ReadData1 = "11111110000000000000000000000000" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registrador 26 (2)" severity error;

			-- REGISTRADOR 27 ----------------------------------------------------------------------

			-- Write 1
			RegWrite <= '1';
			WriteRegister <= "11011"; -- endereço do registrador que vai ser escrito
			WriteData <= "11111100000000000000000000000000";
			wait for period;
					
			
			-- Read 2
			RegWrite <= '0';
			ReadRegister1 <= "11011"; -- endereço registrador vai ser lido
			wait for period;
			assert ( ReadData1 = "11111100000000000000000000000000" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registrador 27 (2)" severity error;

			-- REGISTRADOR 28 ----------------------------------------------------------------------

			-- Write 1
			RegWrite <= '1';
			WriteRegister <= "11100"; -- endereço do registrador que vai ser escrito
			WriteData <= "11111000000000000000000000000000";
			wait for period;
					
			
			-- Read 2
			RegWrite <= '0';
			ReadRegister1 <= "11100"; -- endereço registrador vai ser lido
			wait for period;
			assert ( ReadData1 = "11111000000000000000000000000000" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registrador 28 (2)" severity error;

			-- REGISTRADOR 29 ----------------------------------------------------------------------

			-- Write 1
			RegWrite <= '1';
			WriteRegister <= "11101"; -- endereço do registrador que vai ser escrito
			WriteData <= "11110000000000000000000000000000";
			wait for period;
					
			
			-- Read 2
			RegWrite <= '0';
			ReadRegister1 <= "11101"; -- endereço registrador vai ser lido
			wait for period;
			assert ( ReadData1 = "11110000000000000000000000000000" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registrador 29 (2)" severity error;

			-- REGISTRADOR 30 ----------------------------------------------------------------------

			-- Write 1
			RegWrite <= '1';
			WriteRegister <= "11110"; -- endereço do registrador que vai ser escrito
			WriteData <= "11100000000000000000000000000000";
			wait for period;
					
			
			-- Read 2
			RegWrite <= '0';
			ReadRegister1 <= "11110"; -- endereço registrador vai ser lido
			wait for period;
			assert ( ReadData1 = "11100000000000000000000000000000" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registrador 30 (2)" severity error;

			-- REGISTRADOR 31 ----------------------------------------------------------------------

			-- Write 1
			RegWrite <= '1';
			WriteRegister <= "11111"; -- endereço do registrador que vai ser escrito
			WriteData <= "11000000000000000000000000000000";
			wait for period;
					
			
			-- Read 2
			RegWrite <= '0';
			ReadRegister1 <= "11111"; -- endereço registrador vai ser lido
			wait for period;
			assert ( ReadData1 = "11000000000000000000000000000000" ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registrador 31 (2)" severity error;


			wait;
		end process;

end architecture;