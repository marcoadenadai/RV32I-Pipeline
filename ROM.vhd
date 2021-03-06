LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ROM IS
    PORT (
		clock    : IN STD_LOGIC := '0';
		Reset 	: IN STD_LOGIC := '0';
      ADDR 		: IN STD_LOGIC_VECTOR (31 DOWNTO 0); -- ENDERECO DA MEMORIA DE INSTRUCAO 
      S 			: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE ROM_arch OF ROM IS

	signal fio_addr : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
	signal fio_result : std_logic_vector(31 downto 0);
	
BEGIN	
	fio_addr <= ADDR;
	S <= fio_result;		
		
		PROCESS (fio_addr, clock) 
			variable	result : std_logic_vector(31 downto 0);
		BEGIN
		
		IF rising_edge(clock) THEN
			IF Reset = '1' THEN
				result := "00000000000000000000010110010011";
			ELSE
			
--				CASE fio_addr IS
--					WHEN "00000000000000000000000000000000" => result := "00000000000000000000010110010011";
--					WHEN "00000000000000000000000000000001" => result := "00000000101000000000010100010011";
--					WHEN "00000000000000000000000000000010" => result := "00000001000000000000000011101111";
--					WHEN "00000000000000000000000000000011" => result := "00000001111000000000010100010011";
--					WHEN "00000000000000000000000000000100" => result := "00000001111100000000010100010011";
--					WHEN "00000000000000000000000000000101" => result := "00000010000000000000010100010011";
--					WHEN "00000000000000000000000000000110" => result := "00000010000100000000010100010011";
--					WHEN "00000000000000000000000000000111" => result := "00000010001000000000010100010011";
--					WHEN "00000000000000000000000000001000" => result := "00000010001100000000010100010011";
--					WHEN "00000000000000000000000000001001" => result := "00000010010000000000010100010011";
--					WHEN "00000000000000000000000000001010" => result := "00000000011100000000011100010011";
--					WHEN "00000000000000000000000000001011" => result := "11111101010111111111000011101111";
--					WHEN "00000000000000000000000000001100" => result := "00000001010000000000010100010011";
--					WHEN "00000000000000000000000000001101" => result := "00000000011100000000011010010011";
--					WHEN "00000000000000000000000000001110" => result := "00000010110101110000010001100011";
--					WHEN "00000000000000000000000000001111" => result := "00000000000000000000000000000000";
--					when others => NULL; -- tem que trocar isso aqui pra nao ter mais warning
--				END CASE;

				-- C:\Users\Marco\Desktop\tools\input_assembly\nosso_teste01.txt
				CASE fio_addr IS
				
				-- 000000001010 00000 000 00010 0010011
				
					WHEN "00000000000000000000000000000000" => result := "00000000101000000000000100010011"; -- addi 	x2,x0,10 
					WHEN "00000000000000000000000000000001" => result := "00000000000000000000000010110011"; -- add 	x1,x0,x0
					WHEN "00000000000000000000000000000010" => result := "00000000001100001000000010110011"; -- add 	x3,x1,x2
					when others => NULL; -- tem que trocar isso aqui pra nao ter mais warning
				END CASE;
			
			END IF;
			
			fio_result <= result;
		END IF;
		
		END PROCESS;
	
		
END ARCHITECTURE;