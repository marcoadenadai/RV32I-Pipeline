library IEEE;
use IEEE.std_logic_1164.ALL; -- tipos std_logic e std_logic_vector
use IEEE.numeric_std.ALL; -- tipos unsigned e signed
use std.textio.ALL; -- deve ser incluido para uso de arquivos
library work;
USE work.IMM_HANDLER_PACKAGE.all;
 
entity TB_IMM_HANDLER is
end TB_IMM_HANDLER;

architecture TB_IMM_HANDLER_ARCH of TB_IMM_HANDLER is
	constant PERIODO : time := 10 ns;
	signal W_CLK : std_logic := '0'; -- deve ser inicializado
	signal W_RST : std_logic;
	
	signal W_IMM_TYPE : STD_LOGIC_VECTOR(2 DOWNTO 0);
	signal W_INSTRUCTION : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	signal W_OUT_RD : STD_LOGIC_VECTOR(4 DOWNTO 0);
	signal W_OUT_IMM : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
begin

	W_CLK <= not W_CLK after PERIODO/2; 
	
	BLOCO : IMM_HANDLER PORT MAP(	W_IMM_TYPE,
											W_INSTRUCTION,
											W_OUT_RD,
											W_OUT_IMM);
											
	-- injetando sinais de entrada
	
	
--	-- type U
--	W_IMM_TYPE <= "000";
--	W_INSTRUCTION <= "11111111111111111101001001111111"; -- ok

--	-- type J
--	W_IMM_TYPE <= "001"               FEDCBA9876543210
--	W_INSTRUCTION <= "11111111111111111101001001111111"; -- ok
	
--	-- type B
--	W_IMM_TYPE <= "010";
--	W_INSTRUCTION <= "01111111111111111111010110000000"; -- saida: 00000000000000000001111111101010 // OK !!
	
--	-- type I
--	W_IMM_TYPE <= "011";	  --     098.FEDCBA9876543210
--	W_INSTRUCTION <= "01111111111111111111010110000000"; -- saida: 00000000000000000000011111111111 //  OK !!
	
--	-- type S
--	W_IMM_TYPE <= "100";
--	W_INSTRUCTION <= "01111111111111111111010110000000"; -- saida: 00000000000000000000111111101011 // OK !! RD: 01011 , OK!
	
	
end architecture;