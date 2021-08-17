.macro printStr(%str)
	addiu	$v0, $zero, 4
	la	$a0, %str
	syscall
.end_macro

.macro printInt (%x) 
	li 	$v0, 1
	add 	$a0, $zero, %x
	syscall
.end_macro

.macro readInt(%n)
	addiu 	$v0, $zero, 5
	syscall 
	addu	%n, $zero, $v0
.end_macro

.macro return0
	addiu 	$v0, $zero, 10
	syscall 
.end_macro