#codigo em linguagem assembly para imprimir um caracter na tela 

.data
	caracter: .byte 'A'

.text
	li $v0, 4
	la $a0, caracter
	syscall