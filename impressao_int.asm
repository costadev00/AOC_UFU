#codigo para imprimir um numero inteiro na tela

.data
	idade: .word 21
	frase: .asciiz "A sua idade = "
	
.text
	li $v0,4
	la, $a0 frase
	syscall
	li $v0, 1
	lw $a0 , idade
	syscall