 .data
 	a: 1 1 2 3 2 4 5 6 5 4 8 9 1 1 14
 .text
 	li $v0, 0

    loop1:
        bgt $t0, 15, exit
        addi $t0, $t0, 1 #counter
        addi $t3, $zero, 5
	beq $t1,$t3,contar 
        lw $t1, a

        li  $v0, 1      
        move $a0, $t0
        syscall
     contar:
     	addiu $t0, $t0, 1
    exit:
        li  $v0, 10
        syscall