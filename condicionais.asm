#codigo em assembly-MIPS para comparar se um numero eh par ou impar
# @author: Matheus Costa
.data
	msg: .asciiz "Forneca um numero\n"
	par: .asciiz "O numero eh par\n"
	impar: .asciiz "O numero eh impar\n"
.text
	#imprmindo a msg para o usuario
	li $v0, 4
	la $a0, msg
	syscall
	
	#lendo o numero
	li $v0, 5
	syscall
	
	#colocando o numero 2 em t0
	li $t0, 2
	div $v0, $t0
	
	#trazendo o valor do resto da divisao para $t1
	mfhi $t1
	
	#comparando se o numero eh par ou impar
	beqz $t1, imprimiPar #se for igual, salte para o label "imprimiPar", se nao continue executando normalmente
	li $v0, 4
	la $a0, impar
	syscall
	#encerra o programa
	li $v0, 10
	syscall
	
	#label par
	imprimiPar:
		li $v0, 4
		la $a0, par
		syscall
	
	