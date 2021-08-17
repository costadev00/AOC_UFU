.text
	addiu $t0, $zero, 10
	addiu $t1, $zero, 5
	
	mul $s0, $t0, $t1
	li $v0, 1
	move $a0, $s0
	syscall