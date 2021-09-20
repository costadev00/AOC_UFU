.data
	msg: .asciiz "Digite um numero positivo \n"
	par: .asciiz "O numero é par\n"
	impar: .asciiz "O numero é impar\n"

.text

	.main: 
		li $v0, 4
		la $a0, msg
		syscall
		li $v0, 5
		syscall
		move $t0, $v0
		addiu $t1, $zero, 2
		div $t0, $t1
		jal verifica
		jal encerra	
	verifica:
		mfhi $s0
		beq $s0, $zero, fpar
		li $v0,4
		la $a0, impar
		syscall
		jr, $ra
	
	fpar:
		li $v0,4
		la $a0, par
		syscall
		jal encerra
	encerra:
		li $v0, 10
		syscall
		
		
		