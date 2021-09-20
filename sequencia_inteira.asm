.data
	espaco: .byte ' '
.text

	#le um numero inteiro(limite da sequencia)
	li $v0, 5
	syscall
	move $t0, $v0
	
	addi $t1, $zero,0
	
	while:
		bgt $t1, $t0, saida
		move $a0, $t1
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, espaco
		syscall
		addi $t1, $t1, 1
		j while
		
	saida:
		li $v0, 10 