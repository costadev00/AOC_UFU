.data

	perg: .asciiz "Qual é o seu nome? "
	saud: .asciiz "Olá, "
	nome: .space 25
.text
	#impressao da pergunta
	li $v0, 4
	la $a0, perg
	syscall
	
	#leitura do nome
	li $v0, 8
	la $a0, nome
	la $a1, 25
	syscall
	#move $t0, $a0
	# poderiamos mover o valor de a0 para t0 para utilizarmos ele novamente na hora da impressao, porem conseguimos recuperar o valor de nome QUE ESTA NA RAM sem fazer isso
	#impressao da frase
	li $v0, 4
	la $a0, saud
	syscall
	
	#impressao do nome
	#move $a0, $t0	
	li, $v0, 4
	la, $a0, nome
	la, $a1, 25
	syscall