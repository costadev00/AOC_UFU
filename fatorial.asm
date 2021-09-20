#programa para calcular a fatorial de um numero n i.e n=5, fat = 120
# @author: Matheus Costa


#fat = 1;
 #   v = n;
  #  while (v > 1)
   # {
    #    // printf("%d * %d\n", n, fat);
     #   fat = fat * v;
      #  printf("%d x %d = %d\n", n, v, fat);
       # v--;
    #
    #}
    
.data
	msg: .asciiz "Digite um numero a ser calculado a fatorial: \n"
	res: .asciiz "O fatorial  = "

.text

	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	#t0 = n
	#t1 = fat
	addiu $t1, $zero, 1
	addiu $t2, $zero, 1
	while:
		blt $t0, $t2, saida
		mul  $t1, $t1, $t0
		sub $t0, $t0, 1
		j while
		
	saida:
		li $v0, 4
		la $a0, res
		syscall
		move $a0, $t1
		
		li $v0, 1
		syscall
		li $v0, 10
		syscall	
		
