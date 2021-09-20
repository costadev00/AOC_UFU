.data
	saudacao: .asciiz "Olá por favor digite sua idade: "
	res: .asciiz "Sua idade é: "
.text

	li $v0, 4 #imprime uma string
	la $a0, saudacao
	syscall
	
	li $v0, 5
	syscall #o valor que o usuario fornecer vai para $v0
	
	move $s0, $v0 # o valor fornecido esta em $s0
	
	li $v0, 4 #imprime uma string
	la $a0, res
	syscall
	
	move $a0, $s0 #move o valor de s0 para a0 para imprimirmos ele
	
	li $v0, 1
	syscall
	