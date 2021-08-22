# 
# FILE *f
#
# f = fopen("arquivo.txt", "rt");
# fscanf(f, "%d", &x);
#
# fclose(f);
#

.data
	str1: 	.asciiz 	"numeros.txt"
.text
	# abrir arquivo
	addiu	$v0, $zero, 13
	la	$a0, str1
	addiu	$a1, $zero, 0
	# addiu	$a2, $zero, 0
	syscall
	
	addu 	$s0, $zero, $v0
	addiu 	$v0, $zero, 1
	addu	$a0, $zero, $s0
	
	# return 0
	li 	$v0, 10
	syscall	
