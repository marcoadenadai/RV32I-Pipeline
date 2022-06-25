# Risc-V RV32I-Spec. VHDL Pipeline Project


## Descrição

Esse repositório armazena um projeto de um processador Risc-V com as específicações [RV32I](https://msyksphinz-self.github.io/riscv-isadoc/html/rvi.html#rv32i-rv64i-instructions), foi utilizado a documentação [riscv-spec-v2.2.pdf](DOCs/riscv-spec-v2.2.pdf). Trata-se de um projeto da disciplina de Arquiteturas de Computadores ministrada pelo professor @AlissonLinhares com o objetivo de exemplificar os conceitos fundamentais sobre arquitetura de compiladores como abstrações e tecnologias computacionais, instruções - linguagem de máquina, operações, operandos, represetações de números, represetações de instruções, operaçÕes lógicas, instruções de tomada de decisões, suporte a procedimentos, modos de endereçamento, paralelismo e instruções : sincronização, tradução e execução de um programa, aritimética para computadores, construção de datapath, processador multiciclo e pipeline, etc..


## Documentação

O projeto desse repositório feito em VHDL utilizando o Quartus Prime 20.1 pode ser representado pelo seguinte diagrama (Datapath):
![Datapath Image](DOCS/Datapath.png)


As instruções e sinais da Unidade de Controle foram mapeados da seguinte forma:


## Sinais de Controle 

A tabela abaixo contém os sinais de controle de cada instrução em conjunto com seus campos OPCODE, FUNC3 e FUNC7

| OPCODE | FUNC  3| FUNC 7 | INSTRUCTION |	TYPE |	IF	| ID |	EX |	MEM |	WB | RegWrite |	MemToReg |	MemWrite |	 MemRead	| BranchDoIt |	BranchOP |	ALUSrc |	ALUOp |	ImmType |
| ------ | ----- | ------ | ------ |------ | ------ |------ | ------ |------ | ------ |------ | ------ |------ | ------ |------ | ------ |------ | ------ |------ | 
| 0110111|	-   |-	    |    LUI    |U|	X| X|  X|	 |	X	 |	1	|01|		0|	0|0		|X	|1	|1010	|000 |
|0010111|	-	|-	    |    AUIPC	|U|	X| X|  X|	 |	X	 |	1	|01		|0|	 0|	1|	011	|1	|0000	|000|
|1101111|	-	|-	    |    JAL	|J|	X| X|  X|	 |	X	 |	1	|10		|0|	 0|	1|	010	|1	|0000	|001|
|1100111|	000	|-	    |    JALR	|I|	X| X|  X|	 |	X	 |	1	|10		|0|	 0|	1|	010	|1	|0000	|011|
|1100011|	000	|-	    |    BEQ	|B|	X| X|  X|	 |		 |	0	|X		|0|	 0|	1|	000	|1	|0000	|010|
|1100011|	001	|-	    |    BNE	|B|	X| X|  X|	 |		 |	0	|X		|0|	 0|	1|	001	|1	|0000	|010|
|1100011|	100	|-	    |    BLT	|B|	X| X|  X|	 |		 |	0	|X		|0|	 0|	1|	100	|1	|0000	|010|
|1100011|	101	|-	    |    BGE	|B|	X| X|  X|	 |		 |	0	|X		|0|	 0|	1|	101	|1	|0000	|010|
|1100011|	110	|-	    |    BLTU	|B|	X| X|  X|	 |		 |	0	|X		|0|	 0|	1|	110	|1	|0000	|010|
|1100011|	111	|-	    |    BGEU	|B|	X| X|  X|	 |		 |	0	|X		|0|	 0|	1|	111	|1	|0000	|010|
|0000011|	000	|-	    |    LB	I	|X|	X| X|  X|	X|		 |  1   |00		|0|	 1|	0|	 X	|1	|0000	|011|
|0000011|	001	|-	    |    LH	I	|X|	X| X|  X|	X|		 |  1   |00		|0|	 1|	0|	X	|1	|0000	|011|
|0000011|	010	|-	    |    LW	I	|X|	X| X|  X|	X|		 |  1   |00		|0|	 1|	0|	X	|1	|0000	|011|
|0000011|	100	|-	    |    LBU	|I|	X| X|  X|	X|	X	 |	1	|00		|0|	 1|	0|	X	|1	|0000	|011|
|0000011|	101	|-	    |    LHU	|I|	X| X|  X|	X|	X	 |	1	|00		|0|	 1|	0|	X	|1	|0000	|011|
|0100011|	000	|-	    |    SB	S	|X|	X| X|  X|	 |		 |  0   |X		|1|	 0|	0|	X	|1	|0000	|100|
|0100011|	001	|-	    |    SH	S	|X|	X| X|  X|	 |		 |  0   |X		|1|	 0|	0|	X	|1	|0000	|100|
|0100011|	010	|-	    |    SW	S	|X|	X| X|  X|	 |		 |  0   |X		|1|	 0|	0|	X	|1	|0000	|100|
|0010011|	000	|-	    |    ADDI	|I|	X| X|  X|	 |	X	 |	1	|01		|0|	 0|	0|	X	|1	|0000	|011|
|0010011|	010	|-	    |    SLTI	|I|	X| X|  X|	 |	X	 |	1	|01		|0|	 0|	0|	X	|1	|0011	|011|
|0010011|	011	|-	    |    SLTIU	|I|	X| X|  X|	 |	X	 |	1	|01		|0|	 0|	0|	X	|1	|0100	|011|
|0010011|	100	|-	    |    XORI	|I|	X| X|  X|	 |	X	 |	1	|01		|0|	 0|	0|	X	|1	|0101	|011|
|0010011|	110	|-	    |    ORI	|I|	X| X|  X|	 |	X	 |	1	|01		|0|	 0|	0|	X	|1	|1000	|011|
|0010011|	111	|-	    |    ANDI	|I|	X| X|  X|	 |	X	 |	1	|01		|0|	 0|	0|	X	|1	|1001	|011|
|0010011|	001	|0000000|	 SLLI	|I|  | X|  X|   X|  X	 | 1	|01	    |0|  0|	0|X	    |1	|0010	|011|
|0010011|	101	|0000000|	 SRLI	|I|  | X|  X|   X|  X	 | 1	|01	    |0|  0|	0|X	    |1	|0110	|011|
|0010011|	101	|0100000|	 SRAI	|I|  | X|  X|   X|  X	 | 1	|01	    |0|  0|	0|X	    |1	|0111	|011|
|0110011|	000	|0000000|	 ADD	|R| X|  |  X|   X| X     |  1	|01		|0|  0|	0|X	    |0	|0000	|X|
|0110011|	000	|0100000|	 SUB	|R| X|  |  X|   X| X     |  1	|01		|0|  0|	0|X	    |0	|0001	|X|
|0110011|	001	|0000000|	 SLL	|R| X|  |  X|   X| X     |  1	|01		|0|  0|	0|X	    |0	|0010	|X|
|0110011|	010	|0000000|	 SLT	|R| X|  |  X|   X| X     |  1	|01		|0|  0|	0|X	    |0	|0011	|X|
|0110011|	011	|0000000|	 SLTU	|R|  | X|  X|   X| X	 |	1	|01	    |0|  0|	0|X	    |0	|0100	|X|
|0110011|	100	|0000000|	 XOR	|R| X|  |  X|   X| X     | 1	|01		|0|  0|	0|X	    |0	|0101	|X|
|0110011|	101	|0000000|	 SRL	|R| X|  |  X|   X| X     | 1	|01		|0|  0|	0|X	    |0	|0110	|X|
|0110011|	101	|0100000|	 SRA	|R| X|  |  X|   X| X     | 1	|01		|0|  0|	0|X	    |0	|0111	|X|
|0110011|	110	|0000000|	 OR	R	|X|  | X|  X|   X|		 |  1	|01		|0|  0|	0|X	    |0	|1000	|X|
|0110011|	111	|0000000|	 AND	|R|X |  |  X|   X| X     |1     |01		|0|  0|	0|X	    |0	|1001	|X|


## Outras Ferramentas e Repositórios Úteis
* [RV32I-EMU (Emulador)](https://github.com/marcoadenadai/riscv-emu)
* [RARS - Risc-V Assembler and Runtime Simulator](https://github.com/TheThirdOne/rars)
* [RV32I-ROM-Vhdl-Hardcoder-tool](https://github.com/marcoadenadai/RV32I-ROM-Vhdl-Hardcoder-tool)

## Execução e Configuração

### Requisitos
- QuartusPrime
- ModelSim-Altera

### Passo a passo
- Abrir o arquivo 'Processador.qpf' no quartus prime como 'abrir projeto'
- Compilar o codigo com 'Compile design'
- Abrir o botão de 'pincel' ao lado do nome do projeto na barra superior ou entrar em configurações
- Entrar em 'EDA Tool Settings', e clicar em 'Simulation'
- Entrar em 'NativeLink settings' e selecionar 'Compile test branch'
- Clicar em 'Test Brenches', depois em 'new'
- Em 'file name' clicar em '...' e selecionar o arquivo 'TB_PROCESSADOR.vhd' e clicar em 'add' e seleciona-lo
- Adicionar o nome que quiser no campo 'Test brench name' e clicar em ok
- Selecionar o nome do arquivo que colocou acima, clicar em 'ok'
- 'Clicar em 'apply', e voltar para tela do projeto
- Trocar a compilação para 'RTL simulation', e clicar em 'RTL simulation' e aguardar um pouco para a simulação aparecer no 'model sim'


#### Lista de Componentes
```
    Unidade de Controle
	- C_UNIDADE_CONTROLE
	
	MUX_PCSrc
	- C_MUX_PC

	PC
	- C_PC

	ROM
	- C_ROM

    [IF/DF]
    - C_REG_PIPE_IF_DFAIDA) 

	BancoDeRegistradores
		- C_BANCO_REGISTRADORES
	[ID/EX] 
	- C_REG_PIPE_ID_EX

	Branch_Compare
	- C_BRANCH_COMPARE

	MUX_BranchDoIT (MUX_ALU_1)
	- C_MUX_ALU_1
	
    MUX_AluSRC     (MUX_ALU_2)
	- C_MUX_ALU_2
	
    ULA --OK
	- C_ULA

	Imm_Handler
	- C_IMM_HANDLER
	
    [EX/MEM]
	- C_REGPIPE_EX_MEM
    
    AND_BRANCH 
	- C_AND_BRANCH
	
    RAM (DATA MEMORY) 
	- C_RAM
	
    [MEM/WB]
	- C_REG_PIPE_MEM_WB
	
    MUX_MemToReg  
	- C_MUX_MEM_TO_REG
	
```

## Autores

[@alcidesbeato](https://github.com/alcidesbeato)

[@derekfq](https://github.com/derekfq)

[@marcoadenadai](https://github.com/marcoadenadai)

[@RafaelBarbon](https://github.com/RafaelBarbon)
