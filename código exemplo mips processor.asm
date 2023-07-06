#loop simples para teste no processador multicyle
#contendo todos os tipos de instrucoes

	addi $s0, $0, 0 #contador
	addi $s1, $0, 6 #limite do contador
	addi $s3, $0, 0x1 #endereco de memoria para variaveis 

LOOP:	slt $t0, $s0, $s1
	beq $t0, $0, ENDLP
		sw $s0, 0($s3)
		addi $s0, $s0, 1
	j LOOP
ENDLP:	lw $s0, 0($s3)
	sw $s0, 0($0) #endereco io do display 7 segmentos
	
END:	j END
