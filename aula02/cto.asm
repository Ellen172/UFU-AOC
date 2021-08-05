
.data
	x:	.word 		42
	y:  .space		4
	f:  .space      4
	pi: .float		3.1415
	p:  .space		4
	v:  .space		40     
	v2: .word		0,1,2,3,4,5,6,7,8,9
	str1: .asciiz	"Digite um int: "
	
	str21: .asciiz "A soma de 42 + "
	str22: .asciiz " eh: "
	str23: .asciiz "\n"
.text

	#printf("Digite um int: ");
	addiu	$v0, $zero, 4  #imprimir string
	la		$a0, str1
	syscall
	
	#scanf("%d", &y);
	addiu	$v0, $zero, 5   #le inteiro
	syscall
	la		$at, y
	sw		$v0, 0($at)     # MEM[at] <- v0 
	
	addu	$s0, $zero, $v0 #salva o inteiro lido em s0

	#  printf("A soma de 42 + %d eh: %d\n", y, (x+y) );
	addiu	$v0, $zero, 4  #imprimir string
    la		$a0, str21
	syscall
	
	addiu	$v0, $zero, 1
	addu	$a0, $zero, $s0
	syscall
	
	addiu	$v0, $zero, 4  #imprimir string
	la		$a0, str22
	syscall

	la		$t0, x
	lw		$s1, 0($t0)   	# s1 <- MEM[t0]
	
	addu	$t0, $s1, $s0	# t0 <- x + y
		
	addiu	$v0, $zero, 1
	addu	$a0, $zero, $t0
	syscall
	
	addiu	$v0, $zero, 4  #imprimir string
	la		$a0, str23
	syscall
	
	#return 0;
	addiu	$v0, $zero, 10
	syscall