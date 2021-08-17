#codigo para fazer a divisao de dois numeros em assembly
# @author: Matheus Costa
.text
	li $t0 32
	li $t1 5
	div $t0, $t1
	
	#na divisao a parte inteira, vai para o registrador lo
	mflo $s0
	li $v0, 1
	move $a0, $s0
	syscall
	
	# e o resto da divisao(mod) vai para o registrador hi
	mfhi $s1
	li, $v0,1
	move $a0, $s1
	syscall
	
	