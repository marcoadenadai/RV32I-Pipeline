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

			RegWrite <= '0';
			ReadRegister1 <= "00000"; -- endereço registrador vai ser lido
			ReadRegister2 <= "00001"; -- endereço registrador vai ser lido
			wait for period;
			assert ( (ReadData1 <= "00000000000000000000000000000000") AND (ReadData2 = "00000000000000000000000000000000") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registradores (1)" severity error;

			--wait for period;
			
			-- Write
			RegWrite <= '1';
			ReadRegister2 <= "00001"; -- endereço registrador vai ser lido
			WriteRegister <= "00001"; -- endereço do registrador que vai ser escrito
			WriteData <= "11111111111111111111111111111111";
			wait for period;
			assert ( (ReadData1 <= "00000000000000000000000000000000") AND (ReadData2 = "00000000000000000000000000000000") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registradores (2)" severity error;
					
			
			-- Teste
			-- Read
			RegWrite <= '0';
			ReadRegister1 <= "00000"; -- endereço registrador vai ser lido
			ReadRegister2 <= "00001"; -- endereço registrador vai ser lido
			wait for period;
			assert ( (ReadData1 <= "00000000000000000000000000000000") AND (ReadData2 = "11111111111111111111111111111111") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no Banco de registradores (3)" severity error;
			

			wait;
		end process;

end architecture;