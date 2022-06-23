LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
use ieee.numeric_std.all;  

ENTITY CONTROL IS
    PORT(
            Clock, RESET_IN_START	:IN	STD_LOGIC;
            INSTRUCTION : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
            RESET_OUT   : OUT STD_LOGIC;
            REGWRITE    : OUT STD_LOGIC;
            MEMTOREG    : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
            MEMWRITE    : OUT STD_LOGIC;
            MEMREAD     : OUT STD_LOGIC; 
            BRANCHDOIT  : OUT STD_LOGIC;
            BRANCHOP    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
            ALUSRC      : OUT STD_LOGIC;
            ALUOP       : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            IMMTYPE     : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
		);
END CONTROL;

ARCHITECTURE behavior OF CONTROL IS
	BEGIN
	PROCESS (Clock, RESET_IN_START, INSTRUCTION)
	BEGIN
		IF RESET_IN_START = '1' THEN
            RESET_OUT <= '1';

		ELSIF rising_edge(Clock) THEN
			CASE INSTRUCTION(6 DOWNTO 0) IS --OP_CODE
				WHEN "1100111" => RESET_OUT  <= '0'; --JALR
                                  REGWRITE   <= '0';
                                  MEMTOREG   <= "00";
                                  MEMWRITE   <= '0';
                                  MEMREAD    <= '0';
                                  BRANCHDOIT <= '0';
                                  BRANCHOP   <= "000";
                                  ALUSRC     <= '0';
                                  ALUOP      <= "0000";
                                  IMMTYPE    <= "000";

				WHEN "0000011" => RESET_OUT  <= '0'; --LOADS
                                  REGWRITE   <= '0';
                                  MEMTOREG   <= "00";
                                  MEMWRITE   <= '0';
                                  MEMREAD    <= '0';
                                  BRANCHDOIT <= '0';
                                  BRANCHOP   <= "000";
                                  ALUSRC     <= '0';
                                  ALUOP      <= "0000";
                                  IMMTYPE    <= "000";

                                  
				WHEN "0010011" => RESET_OUT  <= '0';  --INST. ARITIMÉTICAS
                                  REGWRITE   <= '0';
                                  MEMTOREG   <= "00";
                                  MEMWRITE   <= '0';
                                  MEMREAD    <= '0';
                                  BRANCHDOIT <= '0';
                                  BRANCHOP   <= "000";
                                  ALUSRC     <= '0';
                                  ALUOP      <= "0000";
                                  IMMTYPE    <= "000";

				WHEN "1101111" => RESET_OUT  <= '0'; --JAL
                                  REGWRITE   <= '0';
                                  MEMTOREG   <= "00";
                                  MEMWRITE   <= '0';
                                  MEMREAD    <= '0';
                                  BRANCHDOIT <= '0';
                                  BRANCHOP   <= "000";
                                  ALUSRC     <= '0';
                                  ALUOP      <= "0000";
                                  IMMTYPE    <= "000";

				WHEN "0011011" => RESET_OUT  <= '0'; --LUI
                                  REGWRITE   <= '0';
                                  MEMTOREG   <= "00";
                                  MEMWRITE   <= '0';
                                  MEMREAD    <= '0';
                                  BRANCHDOIT <= '0';
                                  BRANCHOP   <= "000";
                                  ALUSRC     <= '0';
                                  ALUOP      <= "0000";
                                  IMMTYPE    <= "000";

				WHEN "0010111" => RESET_OUT  <= '0'; --AUIPC
                                  REGWRITE   <= '0';
                                  MEMTOREG   <= "00";
                                  MEMWRITE   <= '0';
                                  MEMREAD    <= '0';
                                  BRANCHDOIT <= '0';
                                  BRANCHOP   <= "000";
                                  ALUSRC     <= '0';
                                  ALUOP      <= "0000";
                                  IMMTYPE    <= "000";

				WHEN "0100011" => RESET_OUT  <= '0'; --STORES
                                  REGWRITE   <= '0';
                                  MEMTOREG   <= "00";
                                  MEMWRITE   <= '0';
                                  MEMREAD    <= '0';
                                  BRANCHDOIT <= '0';
                                  BRANCHOP   <= "000";
                                  ALUSRC     <= '0';
                                  ALUOP      <= "0000";
                                  IMMTYPE    <= "000"; 
                                
				WHEN "0110011" => RESET_OUT  <= '0';  --TIPO R
                                  REGWRITE   <= '0';
                                  MEMTOREG   <= "00";
                                  MEMWRITE   <= '0';
                                  MEMREAD    <= '0';
                                  BRANCHDOIT <= '0';
                                  BRANCHOP   <= "000";
                                  ALUSRC     <= '0';
                                  ALUOP      <= "0000";
                                  IMMTYPE    <= "000";
				when others => NULL;

			END CASE;
		END IF;
    END PROCESS;
END behavior;