# Escreva um programa que calcule o fatorial de N. (sem funcoes)

.include "fatBiblio.asm"

.data 
	n: 	.space  4
	str1: 	.asciiz	"Digite o n: "
.text
	# printf("Digite o n: ");
	printStr(str1)
	
	# lê um inteiro 
	readInt($s1)
	sw	$s1, n 		# salvar o valor lido em n
	
	# variavel fat inicializado com 0
	addu	$s5, $zero, 1

	# soma o fat com o valor de n
FOR:	mul 	$s5, $s5, $s1  

	# se s1 == 0 programa acaba
	beq	$s1, 0, SAI
	
	# diminui 1 do n
	addi	$s1, $s1, -1
	sw	$s1, n
	bne	$s1, 1, FOR

SAI:	printInt($s5)
	return0
