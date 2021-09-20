#codigo para imprimir um numero inteiro na tela

.data
	idade: .word 21
	frase: .asciiz "A sua idade = "
	
.text
	addiu $s0, $zero, 1
	move $a0, $s0
	li $v0, 1
	syscall