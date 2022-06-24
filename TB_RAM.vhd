library IEEE;
use IEEE.std_logic_1164.ALL; -- tipos std_logic e std_logic_vector
use IEEE.numeric_std.ALL; -- tipos unsigned e signed
use std.textio.ALL; -- deve ser incluido para uso de arquivos
library work;
USE work.RAM_PACKAGE.all;
 
entity TB_RAM is
end TB_RAM;

architecture TB_RAM_ARCH of TB_RAM is

	constant PERIODO : time := 10 ns;
	
	signal W_CLK 			: std_logic := '0';
	signal W_RST 			: std_logic;
	signal W_MEM_WRITE 	: std_logic;
	signal W_MEM_READ		: std_logic;
	signal W_ADDR			: UNSIGNED(31 DOWNTO 0);
	signal W_WRITE_DATA	: STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal W_MEM_OUT		: STD_LOGIC_VECTOR(31 DOWNTO 0);
	
begin

	W_CLK <= not W_CLK after PERIODO/2; 
	
	BLOCO : RAM PORT MAP(W_CLK,
								W_RST,
								W_MEM_WRITE,
								W_MEM_READ,
								W_ADDR,
								W_WRITE_DATA,
								W_MEM_OUT
								);	
								
	tb1 : process
			constant period: time := 10 ns;
			
			begin
			
			W_RST <= '1';
			wait for period;
			W_RST <= '0';
			
			W_MEM_WRITE <= '1';
			W_MEM_READ <= '0';
			W_ADDR <= 		 "00000000000000000000000000000000";
			W_WRITE_DATA <= "00001111000011110000111100001111";
			
			wait for period;
			
			W_MEM_WRITE <= '0';
			W_MEM_READ <= '1';
			W_ADDR <= 		 "00000000000000000000000000000000";
			--W_WRITE_DATA <= "00001111000011110000111100001111";
			
			wait for period;
			
			-- OBS: NAO FAZ WRITE E READ JUNTO, NESSE CASO ELE SO FAZ O WRITE!! (24.06.2022 01:18)
			W_MEM_WRITE <= '1';
			W_MEM_READ <= '1';
			W_ADDR <= 		 "00000000000000000000000000000000";
			W_WRITE_DATA <= "00000000000000000000000000000111";
			
			wait for period;
			

--			assert ( (W_MEM_OUT = "00000000000000000000000000000000") ) -- expected output
--			-- error will be reported if output != expected
--			report "ERRO BEQ (0 == 0)" severity error;
			
		
			wait;
		end process;
	
	
end architecture;