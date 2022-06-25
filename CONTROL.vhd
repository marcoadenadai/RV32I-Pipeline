LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;  
USE ieee.std_logic_signed.all;

ENTITY CONTROL IS
    PORT(
            Clock, RESET_IN_START	:IN	STD_LOGIC;
            INSTRUCTION : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
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
		variable	OP_CODE : std_logic_vector(6 downto 0);
		variable    FUNC_3  : std_logic_vector(2 downto 0);
		variable    FUNC_7  : std_logic_vector(6 downto 0);
	BEGIN
            

            IF RESET_IN_START = '1' THEN
                  

		ELSIF rising_edge(Clock) THEN
                  OP_CODE := INSTRUCTION(6 DOWNTO 0);
			CASE OP_CODE IS --OP_CODE
				WHEN "1100111" =>  
										 REGWRITE   <= '1';
										 MEMTOREG   <= "10";
										 MEMWRITE   <= '0';
										 MEMREAD    <= '0';
										 BRANCHDOIT <= '1';
										 BRANCHOP   <= "010";
										 ALUSRC     <= '1';
										 ALUOP      <= "0000";
										 IMMTYPE    <= "011";

				WHEN "0000011" => 
                                    FUNC_3 := INSTRUCTION(15 DOWNTO 13);
                                    CASE FUNC_3 IS 
                                            WHEN "000" => 
                                                          REGWRITE   <= '1';
                                                          MEMTOREG   <= "00";
                                                          MEMWRITE   <= '0';
                                                          MEMREAD    <= '1';
                                                          BRANCHDOIT <= '0';
                                                          --BRANCHOP   <= "000";
                                                          ALUSRC     <= '1';
                                                          ALUOP      <= "0000";
                                                          IMMTYPE    <= "011";

                                            WHEN "001" => 
                                                          REGWRITE   <= '1';
                                                          MEMTOREG   <= "00";
                                                          MEMWRITE   <= '0';
                                                          MEMREAD    <= '1';
                                                          BRANCHDOIT <= '0';
                                                          --BRANCHOP   <= "000";
                                                          ALUSRC     <= '1';
                                                          ALUOP      <= "0000";
                                                          IMMTYPE    <= "011";

                                            WHEN "010" => 
                                                          REGWRITE   <= '1';
                                                          MEMTOREG   <= "00";
                                                          MEMWRITE   <= '0';
                                                          MEMREAD    <= '1';
                                                          BRANCHDOIT <= '0';
                                                          --BRANCHOP   <= "000";
                                                          ALUSRC     <= '1';
                                                          ALUOP      <= "0000";
                                                          IMMTYPE    <= "011";

                                           WHEN "100" => 
                                                          REGWRITE   <= '1';
                                                          MEMTOREG   <= "00";
                                                          MEMWRITE   <= '0';
                                                          MEMREAD    <= '1';
                                                          BRANCHDOIT <= '0';
                                                          --BRANCHOP   <= "000";
                                                          ALUSRC     <= '1';
                                                          ALUOP      <= "0000";
                                                          IMMTYPE    <= "011";

                                            WHEN "101" => 
                                                          REGWRITE   <= '1';
                                                          MEMTOREG   <= "00";
                                                          MEMWRITE   <= '0';
                                                          MEMREAD    <= '1';
                                                          BRANCHDOIT <= '0';
                                                          --BRANCHOP   <= "000";
                                                          ALUSRC     <= '1';
                                                          ALUOP      <= "0000";
                                                          IMMTYPE    <= "011";

                                            WHEN OTHERS => NULL;
                                      END CASE;

				WHEN "0100011" => --TIPO S 
                                  FUNC_3 := INSTRUCTION(15 DOWNTO 13);
                                  CASE FUNC_3 IS 
                                          WHEN "000" => 
                                                        REGWRITE   <= '0';
                                                        --MEMTOREG   <= "00";
                                                        MEMWRITE   <= '1';
                                                        MEMREAD    <= '0';
                                                        BRANCHDOIT <= '0';
                                                        --BRANCHOP   <= "000";
                                                        ALUSRC     <= '1';
                                                        ALUOP      <= "0000";
                                                        IMMTYPE    <= "100";

                                          WHEN "001" => 
                                                        REGWRITE   <= '0';
                                                        --MEMTOREG   <= "00";
                                                        MEMWRITE   <= '1';
                                                        MEMREAD    <= '0';
                                                        BRANCHDOIT <= '0';
                                                        --BRANCHOP   <= "000";
                                                        ALUSRC     <= '1';
                                                        ALUOP      <= "0000";
                                                        IMMTYPE    <= "100";

                                          WHEN "010" => 
                                                        REGWRITE   <= '0';
                                                        --MEMTOREG   <= "00";
                                                        MEMWRITE   <= '1';
                                                        MEMREAD    <= '0';
                                                        BRANCHDOIT <= '0';
                                                        --BRANCHOP   <= "000";
                                                        ALUSRC     <= '1';
                                                        ALUOP      <= "0000";
                                                        IMMTYPE    <= "100";

                                          WHEN OTHERS => NULL;
                                    END CASE;

                                    WHEN "0010011" => --TIPO I
                                    FUNC_3 := INSTRUCTION(15 DOWNTO 13);
                                    CASE FUNC_3 IS 
                                            WHEN "000" => 
                                                          REGWRITE   <= '1';
                                                          MEMTOREG   <= "01";
                                                          MEMWRITE   <= '0';
                                                          MEMREAD    <= '0';
                                                          BRANCHDOIT <= '0';
                                                          --BRANCHOP   <= "000";
                                                          ALUSRC     <= '1';
                                                          ALUOP      <= "0000";
                                                          IMMTYPE    <= "011";

                                            WHEN "010" => 
                                                          REGWRITE   <= '1';
                                                          MEMTOREG   <= "01";
                                                          MEMWRITE   <= '0';
                                                          MEMREAD    <= '0';
                                                          BRANCHDOIT <= '0';
                                                          --BRANCHOP   <= "000";
                                                          ALUSRC     <= '1';
                                                          ALUOP      <= "0011";
                                                          IMMTYPE    <= "011";

                                            WHEN "011" => 
                                                          REGWRITE   <= '1';
                                                          MEMTOREG   <= "01";
                                                          MEMWRITE   <= '0';
                                                          MEMREAD    <= '0';
                                                          BRANCHDOIT <= '0';
                                                          --BRANCHOP   <= "000";
                                                          ALUSRC     <= '1';
                                                          ALUOP      <= "0100";
                                                          IMMTYPE    <= "011";

                                          WHEN "100" => 
                                                          REGWRITE   <= '1';
                                                          MEMTOREG   <= "01";
                                                          MEMWRITE   <= '0';
                                                          MEMREAD    <= '0';
                                                          BRANCHDOIT <= '0';
                                                          --BRANCHOP   <= "000";
                                                          ALUSRC     <= '1';
                                                          ALUOP      <= "0101";
                                                          IMMTYPE    <= "011";

                                          WHEN "110" => 
                                                          REGWRITE   <= '1';
                                                          MEMTOREG   <= "01";
                                                          MEMWRITE   <= '0';
                                                          MEMREAD    <= '0';
                                                          BRANCHDOIT <= '0';
                                                          --BRANCHOP   <= "000";
                                                          ALUSRC     <= '1';
                                                          ALUOP      <= "1000";
                                                          IMMTYPE    <= "011";

                                          WHEN "111" => 
                                                          REGWRITE   <= '1';
                                                          MEMTOREG   <= "01";
                                                          MEMWRITE   <= '0';
                                                          MEMREAD    <= '0';
                                                          BRANCHDOIT <= '0';
                                                          --BRANCHOP   <= "000";
                                                          ALUSRC     <= '1';
                                                          ALUOP      <= "1001";
                                                          IMMTYPE    <= "011";

                                          WHEN "001" => 
                                                          REGWRITE   <= '1';
                                                          MEMTOREG   <= "01";
                                                          MEMWRITE   <= '0';
                                                          MEMREAD    <= '0';
                                                          BRANCHDOIT <= '0';
                                                          --BRANCHOP   <= "000";
                                                          ALUSRC     <= '1';
                                                          ALUOP      <= "0010";
                                                          IMMTYPE    <= "011";

                                          WHEN "101" => 
                                                      FUNC_7 := INSTRUCTION(31 DOWNTO 25);
                                                      IF FUNC_7 = "0000000" THEN --SRLI //OK
                                                            REGWRITE   <= '1';
                                                            MEMTOREG   <= "01";
                                                            MEMWRITE   <= '0';
                                                            MEMREAD    <= '0';
                                                            BRANCHDOIT <= '0';
                                                            --BRANCHOP   <= "000";
                                                            ALUSRC     <= '1';
                                                            ALUOP      <= "0110";
                                                            IMMTYPE    <= "011";
                                                      ELSE  --SRAI //OK
                                                            REGWRITE   <= '1';
                                                            MEMTOREG   <= "01";
                                                            MEMWRITE   <= '0';
                                                            MEMREAD    <= '0';
                                                            BRANCHDOIT <= '0';
                                                            --BRANCHOP   <= "000";
                                                            ALUSRC     <= '1';
                                                            ALUOP      <= "0111";
                                                            IMMTYPE    <= "011";
                                                      END IF;

                                            WHEN OTHERS => NULL;
                                      END CASE;

				WHEN "1101111" => 
                                  REGWRITE   <= '1';
                                  MEMTOREG   <= "10";
                                  MEMWRITE   <= '0';
                                  MEMREAD    <= '0';
                                  BRANCHDOIT <= '1';
                                  BRANCHOP   <= "010";
                                  ALUSRC     <= '1';
                                  ALUOP      <= "0000";
                                  IMMTYPE    <= "001";

				WHEN "0110111" => 
                                  REGWRITE   <= '1';
                                  MEMTOREG   <= "01";
                                  MEMWRITE   <= '0';
                                  MEMREAD    <= '0';
                                  BRANCHDOIT <= '0';
                                  --BRANCHOP   <= "000";
                                  ALUSRC     <= '1';
                                  ALUOP      <= "1010";
                                  IMMTYPE    <= "000";

				WHEN "0010111" => 
                                  REGWRITE   <= '1';
                                  MEMTOREG   <= "01";
                                  MEMWRITE   <= '0';
                                  MEMREAD    <= '0';
                                  BRANCHDOIT <= '1';
                                  BRANCHOP   <= "011";
                                  ALUSRC     <= '1';
                                  ALUOP      <= "0000";
                                  IMMTYPE    <= "000";

				WHEN "0110011" => 
                                    FUNC_3 := INSTRUCTION(15 DOWNTO 13);
                                    CASE FUNC_3 IS 
                                          WHEN "000" => 
                                                      FUNC_7 := INSTRUCTION(31 DOWNTO 25);
                                                      IF FUNC_7 = "0000000" THEN --ADD //OK
                                                            REGWRITE   <= '1';
                                                            MEMTOREG   <= "01";
                                                            MEMWRITE   <= '0';
                                                            MEMREAD    <= '0';
                                                            BRANCHDOIT <= '0';
                                                            --BRANCHOP   <= "000";
                                                            ALUSRC     <= '0';
                                                            ALUOP      <= "0000";
                                                            --IMMTYPE    <= "000";
                                                      ELSE  --SUB //OK 
                                                            REGWRITE   <= '1';
                                                            MEMTOREG   <= "01";
                                                            MEMWRITE   <= '0';
                                                            MEMREAD    <= '0';
                                                            BRANCHDOIT <= '0';
                                                            --BRANCHOP   <= "000";
                                                            ALUSRC     <= '0';
                                                            ALUOP      <= "0001";
                                                            --IMMTYPE    <= "000";
                                                      END IF;

                                          WHEN "001" => 
                                                        REGWRITE   <= '1';
                                                        MEMTOREG   <= "01";
                                                        MEMWRITE   <= '0';
                                                        MEMREAD    <= '0';
                                                        BRANCHDOIT <= '0';
                                                        --BRANCHOP   <= "000";
                                                        ALUSRC     <= '0';
                                                        ALUOP      <= "0010";
                                                        --IMMTYPE    <= "000";

                                          WHEN "010" => 
                                                        REGWRITE   <= '1';
                                                        MEMTOREG   <= "01";
                                                        MEMWRITE   <= '0';
                                                        MEMREAD    <= '0';
                                                        BRANCHDOIT <= '0';
                                                        --BRANCHOP   <= "000";
                                                        ALUSRC     <= '0';
                                                        ALUOP      <= "0011";
                                                        --IMMTYPE    <= "000";

                                          WHEN "011" => 
                                                        REGWRITE   <= '1';
                                                        MEMTOREG   <= "01";
                                                        MEMWRITE   <= '0';
                                                        MEMREAD    <= '0';
                                                        BRANCHDOIT <= '0';
                                                        --BRANCHOP   <= "000";
                                                        ALUSRC     <= '0';
                                                        ALUOP      <= "0100";
                                                        --IMMTYPE    <= "000";

                                          WHEN "100" => 
                                                        REGWRITE   <= '1';
                                                        MEMTOREG   <= "01";
                                                        MEMWRITE   <= '0';
                                                        MEMREAD    <= '0';
                                                        BRANCHDOIT <= '0';
                                                        --BRANCHOP   <= "000";
                                                        ALUSRC     <= '0';
                                                        ALUOP      <= "0101";
                                                        --IMMTYPE    <= "000";

                                          WHEN "101" =>  --SRL/SRA
                                                      FUNC_7 := INSTRUCTION(31 DOWNTO 25); 
                                                      IF FUNC_7 = "0000000" THEN --SRL //OK
                                                            REGWRITE   <= '1';
                                                            MEMTOREG   <= "01";
                                                            MEMWRITE   <= '0';
                                                            MEMREAD    <= '0';
                                                            BRANCHDOIT <= '0';
                                                            --BRANCHOP   <= "000";
                                                            ALUSRC     <= '0';
                                                            ALUOP      <= "0110";
                                                            --IMMTYPE    <= "000";
                                                      ELSE  --SRA //OK
                                                            REGWRITE   <= '1';
                                                            MEMTOREG   <= "01";
                                                            MEMWRITE   <= '0';
                                                            MEMREAD    <= '0';
                                                            BRANCHDOIT <= '0';
                                                            --BRANCHOP   <= "000";
                                                            ALUSRC     <= '0';
                                                            ALUOP      <= "0111";
                                                            --IMMTYPE    <= "000";
                                                      END IF;

                                          WHEN "110" => 
                                                      REGWRITE   <= '1';
                                                      MEMTOREG   <= "01";
                                                      MEMWRITE   <= '0';
                                                      MEMREAD    <= '0';
                                                      BRANCHDOIT <= '0';
                                                      --BRANCHOP   <= "000";
                                                      ALUSRC     <= '0';
                                                      ALUOP      <= "1000";
                                                      --IMMTYPE    <= "000";

                                          WHEN "111" => 
                                                      REGWRITE   <= '1';
                                                      MEMTOREG   <= "01";
                                                      MEMWRITE   <= '0';
                                                      MEMREAD    <= '0';
                                                      BRANCHDOIT <= '0';
                                                      --BRANCHOP   <= "000";
                                                      ALUSRC     <= '0';
                                                      ALUOP      <= "1001";
                                                      --IMMTYPE    <= "000";

                                          WHEN OTHERS => NULL;
                                    END CASE;
                        WHEN "1100011" => 
                                    FUNC_3 := INSTRUCTION(15 DOWNTO 13);
                                    CASE FUNC_3 IS 
                                          WHEN "000" => 
                                                        REGWRITE   <= '0';
                                                        --MEMTOREG   <= "00";
                                                        MEMWRITE   <= '0';
                                                        MEMREAD    <= '0';
                                                        BRANCHDOIT <= '1';
                                                        BRANCHOP   <= "000";
                                                        ALUSRC     <= '1';
                                                        ALUOP      <= "0000";
                                                        IMMTYPE    <= "010";

                                          WHEN "001" => 
                                                        REGWRITE   <= '0';
                                                        --MEMTOREG   <= "00";
                                                        MEMWRITE   <= '0';
                                                        MEMREAD    <= '0';
                                                        BRANCHDOIT <= '1';
                                                        BRANCHOP   <= "001";
                                                        ALUSRC     <= '1';
                                                        ALUOP      <= "0000";
                                                        IMMTYPE    <= "010";

                                          WHEN "100" => 
                                                        REGWRITE   <= '0';
                                                        --MEMTOREG   <= "00";
                                                        MEMWRITE   <= '0';
                                                        MEMREAD    <= '0';
                                                        BRANCHDOIT <= '1';
                                                        BRANCHOP   <= "100";
                                                        ALUSRC     <= '1';
                                                        ALUOP      <= "0000";
                                                        IMMTYPE    <= "010";

                                          WHEN "101" => 
                                                        REGWRITE   <= '0';
                                                        --MEMTOREG   <= "00";
                                                        MEMWRITE   <= '0';
                                                        MEMREAD    <= '0';
                                                        BRANCHDOIT <= '1';
                                                        BRANCHOP   <= "101";
                                                        ALUSRC     <= '1';
                                                        ALUOP      <= "0000";
                                                        IMMTYPE    <= "010";

                                          WHEN "110" => 
                                                        REGWRITE   <= '0';
                                                        --MEMTOREG   <= "00";
                                                        MEMWRITE   <= '0';
                                                        MEMREAD    <= '0';
                                                        BRANCHDOIT <= '1';
                                                        BRANCHOP   <= "110";
                                                        ALUSRC     <= '1';
                                                        ALUOP      <= "0000";
                                                        IMMTYPE    <= "010";

                                          WHEN "111" => 
                                                        REGWRITE   <= '0';
                                                        --MEMTOREG   <= "00";
                                                        MEMWRITE   <= '0';
                                                        MEMREAD    <= '0';
                                                        BRANCHDOIT <= '1';
                                                        BRANCHOP   <= "111";
                                                        ALUSRC     <= '1';
                                                        ALUOP      <= "0000";
                                                        IMMTYPE    <= "010";

                                          WHEN OTHERS => NULL;
                                    END CASE;
				when others => NULL;
			END CASE;
		END IF;
    END PROCESS;
END behavior;