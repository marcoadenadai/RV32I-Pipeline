
library IEEE;
use IEEE.std_logic_1164.ALL; -- tipos std_logic e std_logic_vector
use IEEE.numeric_std.ALL; -- tipos unsigned e signed
LIBRARY WORK;
USE WORK.BRANCH_COMPARE_PACKAGE.ALL;
use std.textio.ALL; -- deve ser incluido para uso de arquivos

 
entity TB_BRANCH_COMPARE is
end TB_BRANCH_COMPARE;

architecture TB_BRANCH_COMPARE_ARCH of TB_BRANCH_COMPARE is
	constant PERIODO : time := 10 ns;
	signal W_CLK : std_logic := '0'; -- deve ser inicializado
	signal W_RST : std_logic;
	
	signal W_BRANCH_TYPE : STD_LOGIC_VECTOR(2 DOWNTO 0); 	--input
	signal W_REG1 : STD_LOGIC_VECTOR(31 DOWNTO 0);			--input
	signal W_REG2 : STD_LOGIC_VECTOR(31 DOWNTO 0);			--input
	
	signal W_OUT : STD_LOGIC; -- output
	
begin

	W_CLK <= not W_CLK after PERIODO/2; 
	
	BLOCO : BRANCH_COMPARE PORT MAP(	
											W_CLK,
											W_RST,
											W_BRANCH_TYPE, 
											W_REG1,
											W_REG2,
											W_OUT);
	--
	
	tb1 : process
			constant period: time := 10 ns;
			
			begin
			
			wait for period;
			
			-- BRANCH EQUAL
			
			W_BRANCH_TYPE <= "000"; -- BEQ
			W_REG1 <= "00000000000000000000000000000000";
			W_REG2 <= "00000000000000000000000000000000";
			wait for period;
			assert ( (W_OUT = '1') ) -- expected output
			-- error will be reported if output != expected
			report "ERRO BEQ (0 == 0)" severity error;
			
			W_BRANCH_TYPE <= "000"; -- BEQ
			W_REG1 <= "00000000000000000000000000000000";
			W_REG2 <= "11111111111111111111111111111011";
			wait for period;
			assert ( (W_OUT = '0') ) -- expected output
			-- error will be reported if output != expected
			report "ERRO BEQ (0 == -4)" severity error;
			
			-- BRANCH NOT EQUAL
			
			W_BRANCH_TYPE <= "001"; -- BNE
			W_REG1 <= "00000000000000000000000000000000";
			W_REG2 <= "00000000000000000000000000000001";
			wait for period;
			assert ( (W_OUT = '1') ) -- expected output
			-- error will be reported if output != expected
			report "ERRO BNE (0==1)" severity error;
			
			W_BRANCH_TYPE <= "001" ; -- BNE
			W_REG1 <= "00000000000000000000000000000000";
			W_REG2 <= "00000000000000000000000000000000";
			wait for period;
			assert ( (W_OUT = '0') ) -- expected output
			-- error will be reported if output != expected
			report "ERRO BNE (0==0)" severity error;
			
			-- BRANCH LOWER THAN
			
			W_BRANCH_TYPE <= "100" ; -- BLT
			W_REG1 <= "00000000000000000000000000000000";
			W_REG2 <= "00000000000000000000000000000001";
			wait for period;
			assert ( (W_OUT = '1') ) -- expected output
			-- error will be reported if output != expected
			report "ERRO BLT (0<1)" severity error;
			
			W_BRANCH_TYPE <= "100" ; -- BLT
			W_REG1 <= "00000000000000000000000000000000";
			W_REG2 <= "00000000000000000000000000000000";
			wait for period;
			assert ( (W_OUT = '0') ) -- expected output
			-- error will be reported if output != expected
			report "ERRO BLT (0<0)" severity error;
			
			W_BRANCH_TYPE <= "100" ; -- BLT
			W_REG1 <= "00000000000000000000000000000001";
			W_REG2 <= "00000000000000000000000000000000";
			wait for period;
			assert ( (W_OUT = '0') ) -- expected output
			-- error will be reported if output != expected
			report "ERRO BLT (1<0)" severity error;
			
			-- BRANCH LOWER THAN
			
			W_BRANCH_TYPE <= "101" ; -- BGE
			W_REG1 <= "00000000000000000000000000000000";
			W_REG2 <= "00000000000000000000000000000001";
			wait for period;
			assert ( (W_OUT = '0') ) -- expected output
			-- error will be reported if output != expected
			report "ERRO BGE (0>=1)" severity error;
			
			W_BRANCH_TYPE <= "101" ; -- BGE
			W_REG1 <= "00000000000000000000000000000000";
			W_REG2 <= "00000000000000000000000000000000";
			wait for period;
			assert ( (W_OUT = '1') ) -- expected output
			-- error will be reported if output != expected
			report "ERRO BGE (0>=0)" severity error;
			
			W_BRANCH_TYPE <= "101" ; -- BGE
			W_REG1 <= "00000000000000000000000000000001";
			W_REG2 <= "00000000000000000000000000000000";
			wait for period;
			assert ( (W_OUT = '1') ) -- expected output
			-- error will be reported if output != expected
			report "ERRO BGE (1>=0)" severity error;
			
			-- BLTU -- BLTU -- BLTU -- BLTU -- BLTU -- BLTU
			
			W_BRANCH_TYPE <= "110" ; -- BLTU
			W_REG1 <= "00000000000000000000000000000000";
			W_REG2 <= "00000000000000000000000000000001";
			wait for period;
			assert ( (W_OUT = '1') ) -- expected output
			-- error will be reported if output != expected
			report "ERRO BLTU (0<1)" severity error;
			
			W_BRANCH_TYPE <= "110" ; -- BLTU
			W_REG1 <= "00000000000000000000000000000000";
			W_REG2 <= "00000000000000000000000000000000";
			wait for period;
			assert ( (W_OUT = '0') ) -- expected output
			-- error will be reported if output != expected
			report "ERRO BLTU (0<0)" severity error;
			
			W_BRANCH_TYPE <= "110" ; -- BLTU
			W_REG1 <= "00000000000000000000000000000001";
			W_REG2 <= "00000000000000000000000000000000";
			wait for period;
			assert ( (W_OUT = '0') ) -- expected output
			-- error will be reported if output != expected
			report "ERRO BLTU (1<0)" severity error;
			
			W_BRANCH_TYPE <= "110" ; -- BLTU
			W_REG1 <= "01111111111111111111111111111101";
			W_REG2 <= "00000000000000000000000000000000";
			wait for period;
			assert ( (W_OUT = '0') ) -- expected output
			-- error will be reported if output != expected
			report "ERRO BLTU (-2<0)" severity error; ----------------- ! atencao ao unsigned
			
			-- BGEU -- BGEU -- BGEU -- BGEU -- BGEU -- BGEU
			
			W_BRANCH_TYPE <= "111" ; -- BGEU
			W_REG1 <= "00000000000000000000000000000000";
			W_REG2 <= "00000000000000000000000000000001";
			wait for period;
			assert ( (W_OUT = '0') ) -- expected output
			-- error will be reported if output != expected
			report "ERRO BGEU (0>=1)" severity error;
			
			W_BRANCH_TYPE <= "111" ; -- BGEU
			W_REG1 <= "00000000000000000000000000000000";
			W_REG2 <= "00000000000000000000000000000000";
			wait for period;
			assert ( (W_OUT = '1') ) -- expected output
			-- error will be reported if output != expected
			report "ERRO BGEU (0>=0)" severity error;
			
			W_BRANCH_TYPE <= "111" ; -- BGEU
			W_REG1 <= "00000000000000000000000000000001";
			W_REG2 <= "00000000000000000000000000000000";
			wait for period;
			assert ( (W_OUT = '1') ) -- expected output
			-- error will be reported if output != expected
			report "ERRO BGEU (1>=0)" severity error;
			
			W_BRANCH_TYPE <= "111" ; -- BGEU
			W_REG1 <= "11111111111111111111111111111101";
			W_REG2 <= "00000000000000000000000000000000";
			wait for period;
			assert ( (W_OUT = '1') ) -- expected output
			-- error will be reported if output != expected
			report "ERRO BGEU (-2>=0)" severity error; ----------------- ! atencao ao unsigned
		
			wait;
		end process;

											
								
											
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