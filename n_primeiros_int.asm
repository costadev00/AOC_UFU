#nprimeirosints.asm


.data





.text

	#le da entrada padrao o inteiro n
	addiu	$v0, $zero, 5
	syscall
	
	#1+2+3+4+5+...+n = x
	# n(n+1)/2
	
	#colocar o n em um registrador seguro
	addu	$s0, $zero, $v0		#n
	addiu	$s1, $s0, 1			# n+1
	mulu	$s2, $s0, $s1		#n(n+1)
	
	#srl		$s2, $s2, 1
	
	addiu	$t0, $zero, 2
	divu	$s2, $t0
	mflo	$s2
	
	addiu	$v0, $zero, 10
	syscall
	