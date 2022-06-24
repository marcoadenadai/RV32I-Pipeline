
library IEEE;
use IEEE.std_logic_1164.ALL; -- tipos std_logic e std_logic_vector
use IEEE.numeric_std.ALL; -- tipos unsigned e signed
library work;
USE work.ULA_PACKAGE.all;
use std.textio.ALL; -- deve ser incluido para uso de arquivos

 
entity TB_ULA is
end TB_ULA;

architecture TB_ULA_ARCH of TB_ULA is
	constant PERIODO : time := 10 ns;
	
	signal W_ULA_OP : STD_LOGIC_VECTOR(3 DOWNTO 0); 	--input
	signal W_A : STD_LOGIC_VECTOR(31 DOWNTO 0);			--input
	signal W_B : STD_LOGIC_VECTOR(31 DOWNTO 0);			--input
	
	signal W_OUT : STD_LOGIC_VECTOR(31 DOWNTO 0); -- output
	
begin

	--W_CLK <= not W_CLK after PERIODO/2; 
	
	BLOCO : ULA PORT MAP(	
											W_ULA_OP, 
											W_A,
											W_B,
											W_OUT);
	--
	
	tb1 : process
			constant period: time := 100 ns;
			
			begin
			
			W_ULA_OP <= "0000";
			W_A <= "11111111111111111111111111111111";
			W_B <= "00000000000000000000000000000001";
			wait for period;
			assert ( (W_OUT = "00000000000000000000000000000001") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no AND (1)" severity error;
			
			W_ULA_OP <= "0000";
			W_A <= "11111111111111111111111111111111";
			W_B <= "00000000000000000000000000010001";
			wait for period;
			assert ( (W_OUT = "00000000000000000000000000010001") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no AND (2)" severity error;
			

			wait;
		end process;

end architecture;