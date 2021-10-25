# basico.asm
# apresenta a estrutura minima de um programa em codigo de montagem 

.data # declarar variaveis
	x: .word 	10
	f: .float 	3.1415
	v: .space 	40
	px: .space 	4
	pc: .space 	4
	s: .asciiz 	"isso eh uma string\n"
.text 
	addi 	$s1, $zero, 42 # s1 = $zero + 42
	li 	$s1, 2147483647
	li	$s2, 1
	add 	$s0, $s1, $s2 	# s0 = s1 + s2
	
	addiu 	$v0, $zero, 10
	syscall