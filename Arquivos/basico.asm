# FILE *f;
# 
# abrir arquivo:
# 	f = fopen("arquivo.txt", "rt");
# ler arquivo: 
# 	fscanf(f, "%d", &x);
# 
# fechar arquivo:
# 	fclose(f);

.data
	.align 	2
	# FILE *f;
	strFileName: 	.asciiz		"numeros.csv"
	buff: 		.space		4

.text
	# abrir arquivo:
	# f = fopen("numeros.csv", "rt");
	addiu 	$v0, $zero, 13
	la	$a0, strFileName
	addiu 	$a1, $zero, 0 	#leitura
	syscall 
	
	# salva o descritor do arquivo
	addu 	$s0, $zero, $v0
	
	# ler um caracter
	addiu 	$v0, $zero, 14
	addiu	$a0, $s0, $zero
	la	$a1, buff
	addiu	$a2, $zero, 1 	# leitura para 1 caracter 
	
	# fclose
	addu 	$v0, $zero, 16
	addiu 	$a0, $zero, $s0
	
	li	$v0, 10
	syscall
	
	