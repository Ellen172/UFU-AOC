# ler 10 inteiros do teclado e calcular a soma, media e o maior numero

.include "bibliUtil.asm"

.data
	.align	2
	arr: 	.space 	40

.text

	# la�o de escrita dos valores (se repete 10 vezes)
	addu 	$s0, $zero, $zero 	# contador
	la	$s7, arr		# ponteiro para o 1� elemento do array
	
FOR1: 	slti 	$t0, $s0, 10 		# s0<10 -> t0 = 1
	beq	$t0, $zero, SAI1 	# se t0 = 0 sai do for
	
	readInt($s1) 			# ler o valor
	
	sw	$s1, 0($s7)		# salvar o valor lido na posi��o do vetor apontado por s7
	addiu 	$s7, $s7, 4		# aponta para a proxima prosi��o -> s7 += 4 
	
	addiu 	$s0, $s0, 1 		# incrementa contador
	j	FOR1

SAI1: 	

	# la�o de leitura de valores (se repete 10 vezes)
	addu 	$s0, $zero, $zero 	# contador
	la	$s7, arr		# ponteiro para o 1� elemento do array
	addu 	$s6, $zero, $zero	# maior
	addu 	$s5, $zero, $zero	# soma
	
FOR2: 	slti 	$t0, $s0, 10 		# s0<10 -> t0 = 1
	beq	$t0, $zero, SAI2 	# se t0 = 0 sai do for
	
	lw	$s1, 0($s7)		# s1 = MEM[s7]
	addiu 	$s7, $s7, 4		# aponta para a proxima posi��o 
	# calcula soma 
	addu 	$s5, $s5, $s1		# soma += s1
	# calcula maior
	slt	$t1, $s1, $s6		# atual (s1) < maior (s6) 
	bne	$t1, $zero, SAIIF1
	addu 	$s6, $zero, $s1		# maior = s1	
	
SAIIF1:	addiu 	$s0, $s0, 1 		# incrementa contador
	j	FOR2

SAI2: 	print_int($s5)		# printa a soma 
	printNL
	print_int($s6)		# printa o maior
	
	return0
