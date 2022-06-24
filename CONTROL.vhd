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
		variable	OP_CODE : std_logic_vector(6 downto 0);
		variable    FUNC_3  : std_logic_vector(2 downto 0);
		variable    FUNC_7  : std_logic_vector(6 downto 0);
	BEGIN
            

            IF RESET_IN_START = '1' THEN
                  RESET_OUT <= '1';

		ELSIF rising_edge(Clock) THEN
                  OP_CODE := INSTRUCTION(6 DOWNTO 0);
			CASE OP_CODE IS --OP_CODE
				WHEN "1100111" =>  RESET_OUT  <= '0'; --JALR
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
                                    FUNC_3 := INSTRUCTION(15 DOWNTO 13);
                                    CASE FUNC_3 IS 
                                            WHEN "000" => RESET_OUT  <= '0';  --LB
                                                          REGWRITE   <= '0';
                                                          MEMTOREG   <= "00";
                                                          MEMWRITE   <= '0';
                                                          MEMREAD    <= '0';
                                                          BRANCHDOIT <= '0';
                                                          BRANCHOP   <= "000";
                                                          ALUSRC     <= '0';
                                                          ALUOP      <= "0000";
                                                          IMMTYPE    <= "000";

                                            WHEN "001" => RESET_OUT  <= '0';  --LH
                                                          REGWRITE   <= '0';
                                                          MEMTOREG   <= "00";
                                                          MEMWRITE   <= '0';
                                                          MEMREAD    <= '0';
                                                          BRANCHDOIT <= '0';
                                                          BRANCHOP   <= "000";
                                                          ALUSRC     <= '0';
                                                          ALUOP      <= "0000";
                                                          IMMTYPE    <= "000";

                                            WHEN "010" => RESET_OUT  <= '0';  --LW
                                                          REGWRITE   <= '0';
                                                          MEMTOREG   <= "00";
                                                          MEMWRITE   <= '0';
                                                          MEMREAD    <= '0';
                                                          BRANCHDOIT <= '0';
                                                          BRANCHOP   <= "000";
                                                          ALUSRC     <= '0';
                                                          ALUOP      <= "0000";
                                                          IMMTYPE    <= "000";

                                           WHEN "100" => RESET_OUT  <= '0';  --LBU
                                                          REGWRITE   <= '0';
                                                          MEMTOREG   <= "00";
                                                          MEMWRITE   <= '0';
                                                          MEMREAD    <= '0';
                                                          BRANCHDOIT <= '0';
                                                          BRANCHOP   <= "000";
                                                          ALUSRC     <= '0';
                                                          ALUOP      <= "0000";
                                                          IMMTYPE    <= "000";

                                            WHEN "101" => RESET_OUT  <= '0';  --LHU
                                                          REGWRITE   <= '0';
                                                          MEMTOREG   <= "00";
                                                          MEMWRITE   <= '0';
                                                          MEMREAD    <= '0';
                                                          BRANCHDOIT <= '0';
                                                          BRANCHOP   <= "000";
                                                          ALUSRC     <= '0';
                                                          ALUOP      <= "0000";
                                                          IMMTYPE    <= "000";

                                            WHEN OTHERS => NULL;
                                      END CASE;

				WHEN "0100011" => --TIPO S 
                                  FUNC_3 := INSTRUCTION(15 DOWNTO 13);
                                  CASE FUNC_3 IS 
                                          WHEN "000" => RESET_OUT  <= '0';  --SB
                                                        REGWRITE   <= '0';
                                                        MEMTOREG   <= "00";
                                                        MEMWRITE   <= '0';
                                                        MEMREAD    <= '0';
                                                        BRANCHDOIT <= '0';
                                                        BRANCHOP   <= "000";
                                                        ALUSRC     <= '0';
                                                        ALUOP      <= "0000";
                                                        IMMTYPE    <= "000";

                                          WHEN "001" => RESET_OUT  <= '0';  --SH
                                                        REGWRITE   <= '0';
                                                        MEMTOREG   <= "00";
                                                        MEMWRITE   <= '0';
                                                        MEMREAD    <= '0';
                                                        BRANCHDOIT <= '0';
                                                        BRANCHOP   <= "000";
                                                        ALUSRC     <= '0';
                                                        ALUOP      <= "0000";
                                                        IMMTYPE    <= "000";

                                          WHEN "010" => RESET_OUT  <= '0';  --SW
                                                        REGWRITE   <= '0';
                                                        MEMTOREG   <= "00";
                                                        MEMWRITE   <= '0';
                                                        MEMREAD    <= '0';
                                                        BRANCHDOIT <= '0';
                                                        BRANCHOP   <= "000";
                                                        ALUSRC     <= '0';
                                                        ALUOP      <= "0000";
                                                        IMMTYPE    <= "000";

                                          WHEN OTHERS => NULL;
                                    END CASE;

                                    WHEN "0010011" => --TIPO I
                                    FUNC_3 := INSTRUCTION(15 DOWNTO 13);
                                    CASE FUNC_3 IS 
                                            WHEN "000" => RESET_OUT  <= '0';  --ADDI
                                                          REGWRITE   <= '0';
                                                          MEMTOREG   <= "00";
                                                          MEMWRITE   <= '0';
                                                          MEMREAD    <= '0';
                                                          BRANCHDOIT <= '0';
                                                          BRANCHOP   <= "000";
                                                          ALUSRC     <= '0';
                                                          ALUOP      <= "0000";
                                                          IMMTYPE    <= "000";

                                            WHEN "010" => RESET_OUT  <= '0';  --SLTI
                                                          REGWRITE   <= '0';
                                                          MEMTOREG   <= "00";
                                                          MEMWRITE   <= '0';
                                                          MEMREAD    <= '0';
                                                          BRANCHDOIT <= '0';
                                                          BRANCHOP   <= "000";
                                                          ALUSRC     <= '0';
                                                          ALUOP      <= "0000";
                                                          IMMTYPE    <= "000";

                                            WHEN "011" => RESET_OUT  <= '0';  --SLTIU
                                                          REGWRITE   <= '0';
                                                          MEMTOREG   <= "00";
                                                          MEMWRITE   <= '0';
                                                          MEMREAD    <= '0';
                                                          BRANCHDOIT <= '0';
                                                          BRANCHOP   <= "000";
                                                          ALUSRC     <= '0';
                                                          ALUOP      <= "0000";
                                                          IMMTYPE    <= "000";

                                          WHEN "100" => RESET_OUT  <= '0';  --XORI
                                                          REGWRITE   <= '0';
                                                          MEMTOREG   <= "00";
                                                          MEMWRITE   <= '0';
                                                          MEMREAD    <= '0';
                                                          BRANCHDOIT <= '0';
                                                          BRANCHOP   <= "000";
                                                          ALUSRC     <= '0';
                                                          ALUOP      <= "0000";
                                                          IMMTYPE    <= "000";

                                          WHEN "110" => RESET_OUT  <= '0';  --ORI
                                                          REGWRITE   <= '0';
                                                          MEMTOREG   <= "00";
                                                          MEMWRITE   <= '0';
                                                          MEMREAD    <= '0';
                                                          BRANCHDOIT <= '0';
                                                          BRANCHOP   <= "000";
                                                          ALUSRC     <= '0';
                                                          ALUOP      <= "0000";
                                                          IMMTYPE    <= "000";

                                          WHEN "111" => RESET_OUT  <= '0';  --ANDI
                                                          REGWRITE   <= '0';
                                                          MEMTOREG   <= "00";
                                                          MEMWRITE   <= '0';
                                                          MEMREAD    <= '0';
                                                          BRANCHDOIT <= '0';
                                                          BRANCHOP   <= "000";
                                                          ALUSRC     <= '0';
                                                          ALUOP      <= "0000";
                                                          IMMTYPE    <= "000";

                                          WHEN "001" => RESET_OUT  <= '0';  --SLLI
                                                          REGWRITE   <= '0';
                                                          MEMTOREG   <= "00";
                                                          MEMWRITE   <= '0';
                                                          MEMREAD    <= '0';
                                                          BRANCHDOIT <= '0';
                                                          BRANCHOP   <= "000";
                                                          ALUSRC     <= '0';
                                                          ALUOP      <= "0000";
                                                          IMMTYPE    <= "000";

                                          WHEN "101" => RESET_OUT  <= '0';  --SRLI / SRAI
                                                      FUNC_7 := INSTRUCTION(31 DOWNTO 25);
                                                      IF FUNC_7 = "0000000" THEN --SRLI
                                                            REGWRITE   <= '0';
                                                            MEMTOREG   <= "00";
                                                            MEMWRITE   <= '0';
                                                            MEMREAD    <= '0';
                                                            BRANCHDOIT <= '0';
                                                            BRANCHOP   <= "000";
                                                            ALUSRC     <= '0';
                                                            ALUOP      <= "0000";
                                                            IMMTYPE    <= "000";
                                                      ELSE  --SRAI
                                                            REGWRITE   <= '0';
                                                            MEMTOREG   <= "00";
                                                            MEMWRITE   <= '0';
                                                            MEMREAD    <= '0';
                                                            BRANCHDOIT <= '0';
                                                            BRANCHOP   <= "000";
                                                            ALUSRC     <= '0';
                                                            ALUOP      <= "0000";
                                                            IMMTYPE    <= "000";
                                                      END IF;

                                            WHEN OTHERS => NULL;
                                      END CASE;

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

				WHEN "0110111" => RESET_OUT  <= '0'; --LUI
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
                                    FUNC_3 := INSTRUCTION(15 DOWNTO 13);
                                    CASE FUNC_3 IS 
                                          WHEN "000" => 
                                                      FUNC_7 := INSTRUCTION(31 DOWNTO 25);
                                                      IF FUNC_7 = "0000000" THEN --ADD
                                                            REGWRITE   <= '0';
                                                            MEMTOREG   <= "00";
                                                            MEMWRITE   <= '0';
                                                            MEMREAD    <= '0';
                                                            BRANCHDOIT <= '0';
                                                            BRANCHOP   <= "000";
                                                            ALUSRC     <= '0';
                                                            ALUOP      <= "0000";
                                                            IMMTYPE    <= "000";
                                                      ELSE  --SUB
                                                            REGWRITE   <= '0';
                                                            MEMTOREG   <= "00";
                                                            MEMWRITE   <= '0';
                                                            MEMREAD    <= '0';
                                                            BRANCHDOIT <= '0';
                                                            BRANCHOP   <= "000";
                                                            ALUSRC     <= '0';
                                                            ALUOP      <= "0000";
                                                            IMMTYPE    <= "000";
                                                      END IF;

                                          WHEN "001" => RESET_OUT  <= '0'; -- SLL
                                                        REGWRITE   <= '0';
                                                        MEMTOREG   <= "00";
                                                        MEMWRITE   <= '0';
                                                        MEMREAD    <= '0';
                                                        BRANCHDOIT <= '0';
                                                        BRANCHOP   <= "000";
                                                        ALUSRC     <= '0';
                                                        ALUOP      <= "0000";
                                                        IMMTYPE    <= "000";

                                          WHEN "010" => RESET_OUT  <= '0';  --SLT
                                                        REGWRITE   <= '0';
                                                        MEMTOREG   <= "00";
                                                        MEMWRITE   <= '0';
                                                        MEMREAD    <= '0';
                                                        BRANCHDOIT <= '0';
                                                        BRANCHOP   <= "000";
                                                        ALUSRC     <= '0';
                                                        ALUOP      <= "0000";
                                                        IMMTYPE    <= "000";

                                          WHEN "011" => RESET_OUT  <= '0'; --SLTU
                                                        REGWRITE   <= '0';
                                                        MEMTOREG   <= "00";
                                                        MEMWRITE   <= '0';
                                                        MEMREAD    <= '0';
                                                        BRANCHDOIT <= '0';
                                                        BRANCHOP   <= "000";
                                                        ALUSRC     <= '0';
                                                        ALUOP      <= "0000";
                                                        IMMTYPE    <= "000";

                                          WHEN "100" => RESET_OUT  <= '0';  --XOR
                                                        REGWRITE   <= '0';
                                                        MEMTOREG   <= "00";
                                                        MEMWRITE   <= '0';
                                                        MEMREAD    <= '0';
                                                        BRANCHDOIT <= '0';
                                                        BRANCHOP   <= "000";
                                                        ALUSRC     <= '0';
                                                        ALUOP      <= "0000";
                                                        IMMTYPE    <= "000";

                                          WHEN "101" =>  --SRL/SRA
                                                      FUNC_7 := INSTRUCTION(31 DOWNTO 25); 
                                                      IF FUNC_7 = "0000000" THEN --SRL
                                                            REGWRITE   <= '0';
                                                            MEMTOREG   <= "00";
                                                            MEMWRITE   <= '0';
                                                            MEMREAD    <= '0';
                                                            BRANCHDOIT <= '0';
                                                            BRANCHOP   <= "000";
                                                            ALUSRC     <= '0';
                                                            ALUOP      <= "0000";
                                                            IMMTYPE    <= "000";
                                                      ELSE  --SRA
                                                            REGWRITE   <= '0';
                                                            MEMTOREG   <= "00";
                                                            MEMWRITE   <= '0';
                                                            MEMREAD    <= '0';
                                                            BRANCHDOIT <= '0';
                                                            BRANCHOP   <= "000";
                                                            ALUSRC     <= '0';
                                                            ALUOP      <= "0000";
                                                            IMMTYPE    <= "000";
                                                      END IF;

                                          WHEN "110" => RESET_OUT  <= '0';  --OR
                                                      REGWRITE   <= '0';
                                                      MEMTOREG   <= "00";
                                                      MEMWRITE   <= '0';
                                                      MEMREAD    <= '0';
                                                      BRANCHDOIT <= '0';
                                                      BRANCHOP   <= "000";
                                                      ALUSRC     <= '0';
                                                      ALUOP      <= "0000";
                                                      IMMTYPE    <= "000";

                                          WHEN "111" => RESET_OUT  <= '0';  --AND
                                                      REGWRITE   <= '0';
                                                      MEMTOREG   <= "00";
                                                      MEMWRITE   <= '0';
                                                      MEMREAD    <= '0';
                                                      BRANCHDOIT <= '0';
                                                      BRANCHOP   <= "000";
                                                      ALUSRC     <= '0';
                                                      ALUOP      <= "0000";
                                                      IMMTYPE    <= "000";

                                          WHEN OTHERS => NULL;
                                    END CASE;
                        WHEN "1100011" => RESET_OUT  <= '0';  --TIPO B
                                    FUNC_3 := INSTRUCTION(15 DOWNTO 13);
                                    CASE FUNC_3 IS 
                                          WHEN "000" => RESET_OUT  <= '0';  --BEQ
                                                        REGWRITE   <= '0';
                                                        MEMTOREG   <= "00";
                                                        MEMWRITE   <= '0';
                                                        MEMREAD    <= '0';
                                                        BRANCHDOIT <= '0';
                                                        BRANCHOP   <= "000";
                                                        ALUSRC     <= '0';
                                                        ALUOP      <= "0000";
                                                        IMMTYPE    <= "000";

                                          WHEN "001" => RESET_OUT  <= '0';  --BNE
                                                        REGWRITE   <= '0';
                                                        MEMTOREG   <= "00";
                                                        MEMWRITE   <= '0';
                                                        MEMREAD    <= '0';
                                                        BRANCHDOIT <= '0';
                                                        BRANCHOP   <= "000";
                                                        ALUSRC     <= '0';
                                                        ALUOP      <= "0000";
                                                        IMMTYPE    <= "000";

                                          WHEN "100" => RESET_OUT  <= '0';  --BLT
                                                        REGWRITE   <= '0';
                                                        MEMTOREG   <= "00";
                                                        MEMWRITE   <= '0';
                                                        MEMREAD    <= '0';
                                                        BRANCHDOIT <= '0';
                                                        BRANCHOP   <= "000";
                                                        ALUSRC     <= '0';
                                                        ALUOP      <= "0000";
                                                        IMMTYPE    <= "000";

                                          WHEN "101" => RESET_OUT  <= '0';  --BGE
                                                        REGWRITE   <= '0';
                                                        MEMTOREG   <= "00";
                                                        MEMWRITE   <= '0';
                                                        MEMREAD    <= '0';
                                                        BRANCHDOIT <= '0';
                                                        BRANCHOP   <= "000";
                                                        ALUSRC     <= '0';
                                                        ALUOP      <= "0000";
                                                        IMMTYPE    <= "000";

                                          WHEN "110" => RESET_OUT  <= '0';  --BLTU
                                                        REGWRITE   <= '0';
                                                        MEMTOREG   <= "00";
                                                        MEMWRITE   <= '0';
                                                        MEMREAD    <= '0';
                                                        BRANCHDOIT <= '0';
                                                        BRANCHOP   <= "000";
                                                        ALUSRC     <= '0';
                                                        ALUOP      <= "0000";
                                                        IMMTYPE    <= "000";

                                          WHEN "111" => RESET_OUT  <= '0';  --BGEU
                                                        REGWRITE   <= '0';
                                                        MEMTOREG   <= "00";
                                                        MEMWRITE   <= '0';
                                                        MEMREAD    <= '0';
                                                        BRANCHDOIT <= '0';
                                                        BRANCHOP   <= "000";
                                                        ALUSRC     <= '0';
                                                        ALUOP      <= "0000";
                                                        IMMTYPE    <= "000";

                                          WHEN OTHERS => NULL;
                                    END CASE;
				when others => NULL;
			END CASE;
		END IF;
    END PROCESS;
END behavior;