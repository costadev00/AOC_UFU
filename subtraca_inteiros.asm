.text
	li $t0, 56
	li $t1, 44
	sub $t2, $t0, $t1
	sub $t3, $t2, 50
	li $v0, 1
	move $a0, $t3
	syscall