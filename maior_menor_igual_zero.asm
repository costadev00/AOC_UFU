#codigo em assembly MIPS para saber se um numero é maior, menor ou igual a zero
.data
	msg: .asciiz "Digite um numero \n"
	maior: .asciiz "O numero eh maior que zero\n"
	menor: .asciiz "O numero é menor que zero\n"
	igual: .ascii "O numero eh igual a zero\n"
.text
	#imprimindo a mensagem 
	li, $v0, 4
	la $a0, msg
	syscall
	
	#lendo o numero
	li $v0, 5
	syscall
	
	#movendo o alor de v0(numero lido), para t0
	move $t0, $v0
	
	#comparacao igual
	beqz $t0, imprimeIgual
	#comparacao maior
	bgtz $t0, imprimeMaior
	
	#caso nao seja nem maior, nem igual, logo eh menor 
	li, $v0, 4
	la $a0, menor
	syscall
	li $v0,10
	syscall
	
	#label igual
	imprimeIgual:
		li $v0, 4
		la $a0, igual
		syscall
		li $v0,10
		syscall
		
	#label maior
	imprimeMaior:
		li $v0, 4
		la $a0, maior
		syscall
		li $v0,10
		syscall