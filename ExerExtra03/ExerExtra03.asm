# contagem regressiva

.data
	x:	.word 		5
	str: 	.asciiz 	"\n"


.text
	lw	$s0, x
	
	FOR: 
	
	addiu	$v0, $zero, 1  #imprimir inteiro
	addi	$a0, $s0, 0
	syscall
	
	addiu	$v0, $zero, 4  #imprimir string
	la	$a0, str
	syscall
	
	addiu 	$s0, $s0, -1
	bne	$s0, 0, FOR
	
	EXIT: 
	#return 0;
	addiu	$v0, $zero, 10
	syscall
	
