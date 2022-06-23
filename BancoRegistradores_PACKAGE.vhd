LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE BancoRegistradores_PACKAGE IS
   COMPONENT BancoRegistradores
   PORT(
      RegWrite,Clock,Reset	:IN	STD_LOGIC;
      ReadRegister1, ReadRegister2, WriteRegister :IN STD_LOGIC_VECTOR(4 DOWNTO 0); --WriteRegister é o endereço que vai ser escrito 	
      WriteData	:IN   STD_LOGIC_VECTOR(31 DOWNTO 0); 
      ReadData1, ReadData2	:OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
   );
   END COMPONENT;
END BancoRegistradores_PACKAGE;