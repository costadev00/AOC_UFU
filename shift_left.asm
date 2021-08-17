.text 
	addiu $t1, $zero, 6
	
	sll $s1, $t1, 3 #multipica o t1 2^3
	
	li $v0, 1
	move $a0, $s1
	syscall