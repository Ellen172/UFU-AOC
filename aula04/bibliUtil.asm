.macro return0
	addiu 	$v0, $zero, 10
	syscall 
.end_macro

.macro printInt(%intV)
	addiu 	$v0, $zero, 1
	addiu 	$a0, $zero, %intV
	syscall
.end_macro

.macro print_int (%x) 
	li 	$v0, 1
	add 	$a0, $zero, %x
	syscall
.end_macro

.macro printStr(%strn)
	addiu	$v0, $zero, 4
	la	$a0, %strn
	syscall
.end_macro 

.macro printNL
	addiu	$v0, $zero, 4
	la	$a0, strnl
	syscall
.end_macro

.macro readInt(%reg)
	addiu 	$v0, $zero, 5
	syscall 
	addu	%reg, $zero, $v0
.end_macro

.data
	strnl: 	.asciiz	"\n"
	