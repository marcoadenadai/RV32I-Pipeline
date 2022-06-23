LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE ROM_PACKAGE IS
   COMPONENT ROM
   PORT (
		clock    : IN STD_LOGIC := '0';
		Reset 	: IN STD_LOGIC := '0';
      ADDR 		: IN STD_LOGIC_VECTOR (31 DOWNTO 0); -- Verificar tamanho do endereco
      S 			: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
   END COMPONENT;
END ROM_PACKAGE;