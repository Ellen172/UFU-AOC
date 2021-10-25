# fibonacci

.data
	n: 		.space 		4
	i: 		.space 		4
	anterior: 	.space		4
	atual: 		.space		4
	str1: 		.asciiz		"Digite o num de termos: "
	strerr: 	.asciiz		"o num de termos deve ser um n positivo"
	str21: 		.asciiz		"O fibonacci de "
	str22: 		.asciiz		" eh: 1"
	str31: 		.asciiz		"O fibonacci de "
	str32:		.asciiz		" eh: "
.text
	# printf("Digite o num de termos: ");
	addiu 	$v0, $zero, 4
	la	$a0, str1
	syscall
	
	# scanf("%d", &n);
	addiu 	$v0, $zero, 5
	syscall 
	
	addu 	$s0, $zero, $v0 	#s0 = n
	la 	$t0, n
	sw	$s0, 0($t0) 		#mem[t0+0] = s0
	
	# if (n<=0)
	slt	$t0, $zero, $s0 	# se ($zero < $s0) (0 < n) t0 = 1 ; senão t0 = 0
	bne	$t0, $zero, SAI1
	
	# printf("O num de termos deve ser positivos");
	addiu 	$v0, $zero, 4
	la	$a0, strerr
	syscall
	# return 0;
	j	EXIT 
	
	# jumps
SAI1: 
	# if(n==1 || n==2)
	# printf("O fibonacci de %d eh: 1", n)
	# return 0
	addiu 	$t1, $zero, 1
	addiu 	$t2, $zero, 2
	
	beq 	$s0, $t1, IF2
	bne	$s0, $t2, SAI2
	
	#corpo do if
IF2: 



SAI2:


	#return 0
EXIT:
	addiu 	$v0, $zero, 10
	syscall