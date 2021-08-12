.include "bibliUtil.asm"

.data
	str1: 	.asciiz		"Oi Mundo"

.text
	printInt(42)
	printNL
	printStr(str1)
	printNL
	
	return0
	