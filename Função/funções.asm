

.data

.text
	addiu 	$a0, $zero, 42	
	addiu 	$a1, $zero, 10
	jal	FUNC1
	
	addu 	$a0, $zero, $v0
	addiu 	$v0, $zero, 1
	syscall
	
	# return 0
	addiu 	$v0, $zero, 10
	syscall
	
FUNC1: 	addu 	$t0, $a0, $a1		# função de soma
	addu 	$v0, $zero, $t0 	# retorna $v0
	jr	$ra	