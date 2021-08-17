#codigo para a soma de 2 numeros inteiros

.text
	li $t0, 5
	li $t1, 5
	add $s0,$t0, $t1
	addiu $s1, $s0,100
	li $v0, 1
	# o move vai mover o valor de s0 para a0
	move $a0, $s0
	syscall