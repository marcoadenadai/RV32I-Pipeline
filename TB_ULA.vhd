
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

	tb1 : process
			constant period: time := 10 ns;
			
			begin
			-- AND -------------------------------------------------------------------
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

			W_ULA_OP <= "0000";
			W_A <= "10101010101010101010101010101010";
			W_B <= "00000000000000000000000000010001";
			wait for period;
			assert ( (W_OUT = "00000000000000000000000000000000") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no AND (3)" severity error;

			W_ULA_OP <= "0000";
			W_A <= "01010101010101010101010101010101";
			W_B <= "00000000000000000000000000010001";
			wait for period;
			assert ( (W_OUT = "00000000000000000000000000010001") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no AND (4)" severity error;

			-- OR -------------------------------------------------------------------
			W_ULA_OP <= "0001";
			W_A <= "11111111111111111111111111110000";
			W_B <= "00000000000000000000000000000001";
			wait for period;
			assert ( (W_OUT = "11111111111111111111111111110001") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no OR (1)" severity error;
			
			W_ULA_OP <= "0001";
			W_A <= "11111111111111111111111100000000";
			W_B <= "00000000000000000000000000010001";
			wait for period;
			assert ( (W_OUT = "11111111111111111111111100010001") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no OR (2)" severity error;

			W_ULA_OP <= "0001";
			W_A <= "10101010101010101010101010101010";
			W_B <= "00000000000000000000000000010001";
			wait for period;
			assert ( (W_OUT = "10101010101010101010101010111011") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no OR (3)" severity error;

			W_ULA_OP <= "0001";
			W_A <= "01010101010101010101010101010101";
			W_B <= "00000000000000000000000000010001";
			wait for period;
			assert ( (W_OUT = "01010101010101010101010101010101") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no OR (4)" severity error;


			-- SUM -------------------------------------------------------------------
			W_ULA_OP <= "0010";
			W_A <= "00001111111111111111111100000000";
			W_B <= "01000000000000000000000000000000";
			wait for period;
			assert ( (W_OUT = "01001111111111111111111100000000") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no SUM (1)" severity error;
			
			W_ULA_OP <= "0010";
			W_A <= "11111111111111111111111111110000";
			W_B <= "00000000000000000000000000000001";
			wait for period;
			assert ( (W_OUT = "11111111111111111111111111110001") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no SUM (2)" severity error;

			W_ULA_OP <= "0010";
			W_A <= "10101010101010101010101010101010";
			W_B <= "01000000000000000000000000000000";
			wait for period;
			assert ( (W_OUT = "11101010101010101010101010101010") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no SUM (3)" severity error;
			
			W_ULA_OP <= "0010";
			W_A <= "01010101010101010101010101010101";
			W_B <= "00000000000000000000000000000001";
			wait for period;
			assert ( (W_OUT = "01010101010101010101010101010110") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no SUM (4)" severity error;

			-- SUB -------------------------------------------------------------------
			W_ULA_OP <= "0011";
			W_A <= "11111111111111111111111111111111";
			W_B <= "10000000000000000000000000000001";
			wait for period;
			assert ( (W_OUT = "01111111111111111111111111111110") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no SUB (1)" severity error;
			
			W_ULA_OP <= "0011";
			W_A <= "11111111111111111111111111111111";
			W_B <= "11000000000000000000000000000000";
			wait for period;
			assert ( (W_OUT = "00111111111111111111111111111111") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no SUB (2)" severity error;

			W_ULA_OP <= "0011";
			W_A <= "10101010101010101010101010101010";
			W_B <= "10000000000000000000000000000001";
			wait for period;
			assert ( (W_OUT = "00101010101010101010101010101001") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no SUB (3)" severity error;
			
			W_ULA_OP <= "0011";
			W_A <= "01010101010101010101010101010101";
			W_B <= "11000000000000000000000000000000";
			wait for period;
			assert ( (W_OUT = "10010101010101010101010101010101") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no SUB (4)" severity error;

			-- XOR -------------------------------------------------------------------
			W_ULA_OP <= "0100";
			W_A <= "11111111111111111111111111111111";
			W_B <= "00000000000000000000000000000001";
			wait for period;
			assert ( (W_OUT = "11111111111111111111111111111110") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no XOR (1)" severity error;
			
			W_ULA_OP <= "0100";
			W_A <= "11111111111111111111111111111111";
			W_B <= "00000000000000000000000000010001";
			wait for period;
			assert ( (W_OUT = "11111111111111111111111111101110") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no XOR (2)" severity error;

			W_ULA_OP <= "0100";
			W_A <= "10101010101010101010101010101010";
			W_B <= "00000000000000000000000000000001";
			wait for period;
			assert ( (W_OUT = "10101010101010101010101010101011") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no XOR (3)" severity error;
			
			W_ULA_OP <= "0100";
			W_A <= "01010101010101010101010101010101";
			W_B <= "00000000000000000000000000010001";
			wait for period;
			assert ( (W_OUT = "01010101010101010101010101000100") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no XOR (4)" severity error;

			-- SHIFT LEFT ARITMETICO -------------------------------------------------------------------
			W_ULA_OP <= "0101";
			W_A <= "11111111111111111111111111111111";
			W_B <= "00000000000000000000000000000001";
			wait for period;
			assert ( (W_OUT = "11111111111111111111111111111110") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no SHIFT LEFT ARITMETICO (1)" severity error;
			
			W_ULA_OP <= "0101";
			W_A <= "11111111111111111111111111111111";
			W_B <= "00000000000000000000000000010001";
			wait for period;
			assert ( (W_OUT = "11111111111111100000000000000000") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no SHIFT LEFT ARITMETICO (2)" severity error;

			W_ULA_OP <= "0101";
			W_A <= "10101010101010101010101010101010";
			W_B <= "00000000000000000000000000000001";
			wait for period;
			assert ( (W_OUT = "01010101010101010101010101010100") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no SHIFT LEFT ARITMETICO (3)" severity error;
			
			W_ULA_OP <= "0101";
			W_A <= "01010101010101010101010101010101";
			W_B <= "00000000000000000000000000010001";
			wait for period;
			assert ( (W_OUT = "10101010101010100000000000000000") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no SHIFT LEFT ARITMETICO (4)" severity error;

			-- SHIFT RIGHT ARITMETICO -------------------------------------------------------------------
			W_ULA_OP <= "0110";
			W_A <= "11111111111111111111111111111111";
			W_B <= "00000000000000000000000000000001";
			wait for period;
			assert ( (W_OUT = "11111111111111111111111111111111") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no SHIFT RIGHT ARITMETICO (1)" severity error;
			
			W_ULA_OP <= "0110";
			W_A <= "11111111111111111111111111111111";
			W_B <= "00000000000000000000000000010001";
			wait for period;
			assert ( (W_OUT = "11111111111111111111111111111111") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no SHIFT RIGHT ARITMETICO (2)" severity error;

			W_ULA_OP <= "0110";
			W_A <= "10101010101010101010101010101010";
			W_B <= "00000000000000000000000000000001";
			wait for period;
			assert ( (W_OUT = "11010101010101010101010101010101") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no SHIFT RIGHT ARITMETICO (3)" severity error;
			
			W_ULA_OP <= "0110";
			W_A <= "01010101010101010101010101010101";
			W_B <= "00000000000000000000000000010001";
			wait for period;
			assert ( (W_OUT = "00000000000000000010101010101010") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no SHIFT RIGHT ARITMETICO (4)" severity error;

			-- SHIFT LEFT LOGICO -------------------------------------------------------------------
			W_ULA_OP <= "0111";
			W_A <= "11111111111111111111111111111111";
			W_B <= "00000000000000000000000000000001";
			wait for period;
			assert ( (W_OUT = "11111111111111111111111111111110") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no SHIFT LEFT LOGICO (1)" severity error;
			
			W_ULA_OP <= "0111";
			W_A <= "11111111111111111111111111111111";
			W_B <= "00000000000000000000000000010001";
			wait for period;
			assert ( (W_OUT = "11111111111111100000000000000000") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no SHIFT LEFT LOGICO (2)" severity error;

			W_ULA_OP <= "0111";
			W_A <= "10101010101010101010101010101010";
			W_B <= "00000000000000000000000000000001";
			wait for period;
			assert ( (W_OUT = "01010101010101010101010101010100") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no SHIFT LEFT LOGICO (3)" severity error;
			
			W_ULA_OP <= "0111";
			W_A <= "01010101010101010101010101010101";
			W_B <= "00000000000000000000000000010001";
			wait for period;
			assert ( (W_OUT = "10101010101010100000000000000000") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no SHIFT LEFT LOGICO (4)" severity error;

			-- SHIFT RIGHT LOGICO -------------------------------------------------------------------

			W_ULA_OP <= "1000";
			W_A <= "11111111111111111111111111111111";
			W_B <= "00000000000000000000000000000001";
			wait for period;
			assert ( (W_OUT = "01111111111111111111111111111111") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no SHIFT RIGHT LOGICO (1)" severity error;
			
			W_ULA_OP <= "1000";
			W_A <= "11111111111111111111111111111110";
			W_B <= "00000000000000000000000000010001";
			wait for period;
			assert ( (W_OUT = "00000000000000000111111111111111") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no SHIFT RIGHT LOGICO (2)" severity error;

			W_ULA_OP <= "1000";
			W_A <= "10101010101010101010101010101010";
			W_B <= "00000000000000000000000000000001";
			wait for period;
			assert ( (W_OUT = "01010101010101010101010101010101") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no SHIFT RIGHT LOGICO (3)" severity error;
			
			W_ULA_OP <= "1000";
			W_A <= "01010101010101010101010101010101";
			W_B <= "00000000000000000000000000010001";
			wait for period;
			assert ( (W_OUT = "00000000000000000010101010101010") ) -- expected output
			-- error will be reported if output != expected
			report "ERRO no SHIFT RIGHT LOGICO (4)" severity error;
			

			wait;
		end process;

end architecture;