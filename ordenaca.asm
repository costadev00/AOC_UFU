.text
		j main	# Chama a funcao principal
.data
	str1:		.asciiz "Digite o tamanho que o array vai possuir \n"
	str2:		.asciiz "Insira os elementos(um por linha)  \n"
	str3:		.asciiz "Array ordenado : \n"
	str5:		.asciiz "\n"

		.text
		.globl	main
main: 
		la	$a0, str1		
		li	$v0, 4			
		syscall				

		#armazena o tamanho do array
		li	$v0, 5			
		syscall				
		move	$s2, $v0		
		sll	$s0, $v0, 2		
		sub	$sp, $sp, $s0		
							
		la	$a0, str2		
		li	$v0, 4			
		syscall				

		#le os elementos
		move	$s1, $zero		
for_get:	bge	$s1, $s2, exit_get	
		sll	$t0, $s1, 2		
		add	$t1, $t0, $sp		
		li	$v0, 5			
		syscall			
		sw	$v0, 0($t1)		
						
		la	$a0, str5
		li	$v0, 4
		syscall
		addi	$s1, $s1, 1		
		j	for_get
exit_get:	move	$a0, $sp		
		move	$a1, $s2		
		jal	isort			
						 
						
		la	$a0, str3		
		li	$v0, 4
		syscall

		move	$s1, $zero		
for_print:	bge	$s1, $s2, exit_print	
		sll	$t0, $s1, 2		
		add	$t1, $sp, $t0		
		lw	$a0, 0($t1)		
		li	$v0, 1			
		syscall				

		la	$a0, str5
		li	$v0, 4
		syscall
		addi	$s1, $s1, 1		
		j	for_print
exit_print:	add	$sp, $sp, $s0		 
              
		li	$v0, 10		
		syscall			
		
		
# SELECTION SORT
isort:		addi	$sp, $sp, -20		
		sw	$ra, 0($sp)
		sw	$s0, 4($sp)
		sw	$s1, 8($sp)
		sw	$s2, 12($sp)
		sw	$s3, 16($sp)

		move 	$s0, $a0		
		move	$s1, $zero		

		subi	$s2, $a1, 1		
isort_for:	bge 	$s1, $s2, isort_exit	
		
		move	$a0, $s0		
		move	$a1, $s1		
		move	$a2, $s2		
		
		jal	mini
		move	$s3, $v0		
		
		move	$a0, $s0		
		move	$a1, $s1		
		move	$a2, $s3		
		
		jal	swap

		addi	$s1, $s1, 1		
		j	isort_for	
		
isort_exit:	lw	$ra, 0($sp)		
		lw	$s0, 4($sp)
		lw	$s1, 8($sp)
		lw	$s2, 12($sp)
		lw	$s3, 16($sp)
		addi	$sp, $sp, 20		
		jr	$ra		


# Seleciona o menor elemento, para fazer a troca
mini:		move	$t0, $a0		
		move	$t1, $a1		
		move	$t2, $a2		
		
		sll	$t3, $t1, 2		
		add	$t3, $t3, $t0				
		lw	$t4, 0($t3)		
		
		addi	$t5, $t1, 1		
mini_for:	bgt	$t5, $t2, mini_end	

		sll	$t6, $t5, 2		
		add	$t6, $t6, $t0				
		lw	$t7, 0($t6)		

		bge	$t7, $t4, mini_if_exit	
		
		move	$t1, $t5		
		move	$t4, $t7		

mini_if_exit:	addi	$t5, $t5, 1		
		j	mini_for

mini_end:	move 	$v0, $t1		
		jr	$ra


# troca os elementos
swap:		sll	$t1, $a1, 2		
		add	$t1, $a0, $t1		
		
		sll	$t2, $a2, 2		
		add	$t2, $a0, $t2		

		lw	$t0, 0($t1)		
		lw	$t3, 0($t2)		

		sw	$t3, 0($t1)		
		sw	$t0, 0($t2)		

		jr	$ra