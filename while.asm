.data
	msg: .asciiz "O valor de i = "
.text
	move $t0, $zero
	
	while:
		beq $t0, 10, saida
		addi $t0, $t0, 1
		j while
	saida:
		li $v0, 4
		la $a0,msg
		syscall
		li $v0, 1
		move $a0, $t0
		syscall