.macro readInt(%n)
	li	$v0, 5
	syscall
	add	%n, $zero, $v0
.end_macro

.macro printStr(%str)
	addiu 	$v0, $zero, 4
	la	$a0, %str
	syscall
.end_macro

.macro printInt(%x)
	addiu	$v0, $zero, 1
	add 	$a0, $zero, %x
	syscall
.end_macro

.data
	vet: 	.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	strln: 		.asciiz		"\n"
	strSoma: 	.asciiz		"Soma = "
	strMaior: 	.asciiz		"Maior = "
	strMenor: 	.asciiz		"Menor = "
.text
	addiu	$s1, $zero, 42
	la	$s5, vet	# s5 aponta para o vetor

	# ler o vetor
FOR1: 	readInt($t1)
	sw	$t1, 0($s5)	# salva t1 no vetor
	addiu	$s5, $s5, -4	# proxima posição
	addiu 	$s1, $s1, -1	# diminui o contador
	bne 	$s1, 0, FOR1	# quando o contador zerar, haverá 42 elementos no vetor
	addiu 	$s5, $s5, 168	# voltar para 1º posição
	
	# soma
	addiu 	$a0, $zero, 42	# inicializando contador
	addiu	$a1, $zero, 0	# inicializando soma
	jal 	SOMA
	add	$s2, $zero, $v0
	printStr(strSoma)
	printInt($s2)
	printStr(strln)
	addiu 	$s5, $s5, 168	# voltar para 1º posição
	
	
	# maior valor
	addiu 	$a0, $zero, 42	# inicializando contador
	addiu 	$a1, $zero, 0	# inicializando maior valor
	jal MAIOR
	add	$s3, $zero, $v0
	printStr(strMaior)
	printInt($s3)
	printStr(strln)
	addiu 	$s5, $s5, 168	# voltar para 1º posição
	
	# menor valor
	addiu 	$a0, $zero, 42	# inicializando contador
	addiu 	$a1, $zero, 10000	# inicializando maior valor
	jal MENOR
	add	$s4, $zero, $v0
	printStr(strMenor)
	printInt($s4)
	printStr(strln)
	addiu 	$s5, $s5, 168	# voltar para 1º posição
	
	
	#return 0
	addiu 	$v0, $zero, 10
	syscall

	# função soma
SOMA: 	lw	$t1, 0($s5)	
	add 	$a1, $a1, $t1		# incrementa na soma o vetor
	add	$s5, $s5, -4		# proxima posição
	add	$a0, $a0, -1		# decrementa o contador
	
	bne	$a0, $zero, SOMA 	# sai do for se contador é zero
	
	addu	$v0, $zero, $a1		# retorna o valor da soma
	jr 	$ra
	

	# função maior valor
MAIOR:	lw	$t1, 0($s5)
	add	$s5, $s5, -4 	# proxima posição
	slt	$t2, $a1, $t1	# a1 < t1 , t2 <- 1
	
	beq	$t2, 0, NOT1
	add	$a1, $zero, $t1	# troca o maior
NOT1:
	add	$a0, $a0, -1	# decrementa contador
	bne	$a0, 0, MAIOR
	
	addu	$v0, $zero, $a1
	jr	$ra
	
	# função menor valor
MENOR:	lw	$t1, 0($s5)
	add	$s5, $s5, -4 	# proxima posição
	slt	$t2, $t1, $a1	# t1 < a1 , t2 <- 1
	
	beq	$t2, 0, NOT2
	add	$a1, $zero, $t1	# troca o menor
NOT2:
	add	$a0, $a0, -1	# decrementa contador
	bne	$a0, 0, MENOR
	
	addu	$v0, $zero, $a1
	jr	$ra
	
