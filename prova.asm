.macro zerar
	move $t0, $zero
.end_macro

.macro ql
	li $v0, 4
	la $a0, quebra
	syscall
.end_macro

.data
	espaco: .asciiz " "
	quebra: .asciiz "\n\n"
	txt1: "A somatoria do array = "
	txt2: "O maior elemento = "
	txt3: "O menor elemento = "
	
	myArray: .align 2
		 .space 168
	
.text
	move $t0, $zero # $t0 é o indice do array
	addiu $t1, $zero, 12 #valor a ser colocado no array
	move $s1 , $zero # reg a ser acumulado(somatoria)
	move $s4, $zero #reg aux
	li $t2, 168 #posicao do array
	
	
	.main:
		jal preenche
		zerar
		jal imprime
		zerar
		ql
		jal somatoria
		zerar
		jal imprimeSoma
		zerar
		lw $t3, myArray($zero) #temp pra armazenar o maior
		lw $t4, myArray($zero) #temp pra armazenar o menor
		lw $t5, myArray($zero)
	        move $s2, $t3 #reg para guardar o maior numero o array
	        move $s3, $t4 # reg para guardar o menor numero do arra
		jal maior
	        jal imprimiMaior
		zerar
		jal menor
		jal imprimiMenor
		li $v0, 10
		
	
	preenche:
		beq $t0, $t2, volta
		li $v0, 5
		syscall
		move $t1, $v0
		sw $t1, myArray($t0)
		addiu $t0, $t0, 4
		addiu $t1, $t1, 1
		j preenche
		
		imprime:
			beq $t0, $t2, volta
			li $v0, 4
			la $a0, espaco
			syscall
			li $v0, 1
			lw $a0, myArray($t0)
			syscall
			addiu $t0, $t0, 4
			j imprime
		
	somatoria: 
		
		beq $t0, $t2, volta
		lw $s4, myArray($t0)
		addu $s1, $s1, $s4
		addiu $t0, $t0, 4
		addiu $t1, $t1, 1
		j somatoria
	
	imprimeSoma:
		li $v0, 4
		la $a0, txt1
		syscall
		move $a0, $s1
		li $v0, 1
		syscall
		jr $ra
	
	
maior:
     beq $t0, $t2, volta

     lw $t5, myArray($t0)
     bgt $t5, $s2 ,guarda
     addiu $t0, $t0, 4
     j maior
     
imprimiMaior:
	ql
	li $v0, 4
	la $a0, txt2
	syscall
	move $a0, $s2
	li $v0, 1
	syscall
	jr $ra
     
guarda:
     move $s2,$t5
     addiu $t0, $t0, 4
     j maior
     
     
     
     
    menor:
     beq $t0, $t2, volta

     lw $t4, myArray($t0)
     blt $t4, $s3 ,guardaM
     addiu $t0, $t0, 4
     j menor
     
imprimiMenor:
	ql
	li $v0, 4
	la $a0, txt3
	syscall
	move $a0, $s3
	li $v0, 1
	syscall
	jr $ra
     
guardaM:
     move $s3,$t4
     addiu $t0, $t0, 4
     j menor
     
	volta:
		jr $ra	
		
	encerra:
		li $v0, 10
		
	
