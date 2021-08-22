#2) escreva um programa que calcule a frequencia de um elemento em um
#array  [1 1 2 3 2 4 5 6 5 4 8 9 1 1 14] freq(5)


.include	"freqBiblio.asm"

.data
	.align	2
	vet: 	.space	60
	str1: 	.asciiz	"Digite de qual numero quer a frequencia?\n"
	str2: 	.asciiz	"Digite os 15 valores no vetor: \n"

.text
	print_str(str2)
	la	$s7, vet	# s7 aponta para vet

	# ler vet
	addiu	$s4, $zero, 15 	# contador
	
FOR1:	read_int($t1) 		# ler um inteiro 
	sw	$t1, 0($s7)	# salvar na memoria s7 (vetor)
	addiu 	$s7, $s7, -4	# passa pra proxima posição
	addu	$s4, $s4, -1
	bne	$s4, 0, FOR1	# repete for1 ate o contador chegar a 0
	
	addiu	$s7, $s7,60	# volta para a posição inicial do vetor
	print_str(str1)
	read_int($s1) 	# ler nro para freq
	
	addiu	$s4, $zero, 15 	# contador
	addiu	$s5, $zero, 0 	# freq-contador

FOR2:	lw	$t1, 0($s7)	# salva o 1º valor em t1
	addiu 	$s7, $s7, -4	# passa pra proxima posição
	addu	$s4, $s4, -1	# diminuir 1 do contador
	
	bne	$t1, $s1, IF	# se o nro-freq não for igual ao valor de vetor
	addu	$s5, $s5, 1	# somar 1 ao contador da frequencia
	
IF:	bne	$s4, 0, FOR2	# se contador diferente de zero
	
	print_int($s5)
	return0
