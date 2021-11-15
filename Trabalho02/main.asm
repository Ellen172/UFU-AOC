

.data
	vet: 	.word 	1,2,3,4,5,6,7,8,9,10
.text
	la 	$s5, vet
	add 	$s1, $zero, 1 	#multiplicador
	add 	$s7, $zero, 0	#contador
FOR:
	lw 	$s0, 0($s5)
	mul 	$s1, $s0, $s0
	sw 	$s1, 0($s5)
	addiu 	$s5, $s5, 4 	# proxima posição
	add 	$s7, $s7, 1
	bne 	$s7, 10, FOR
	
	
