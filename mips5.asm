.data
    vetor: .word 0,2,3,4,5,6,7,8,19,10
    ler1: .asciiz"\nMaior elemento do vetor: "
    ler2: .asciiz"\nMenor elemento do Vetor: "
    ler3: .asciiz"\nElementos do Vetor que foram inseridos direto na memoria:  "
    pula_linha: .asciiz"  "

.text
    la $t0,vetor
    li $t1, 0
    la $t8,vetor
    li $t3,10
    lw $t5,0($t0) #maior
    lw $t6,0($t0) #menor
principal:
    la $a0,ler3
    li $v0,4
    syscall
loop:
     beq $t1,$t3,saida
     lw $t4,0($t0)

     lw $t7,0($t8)
     addi $t1,$t1,1
     addi $t0,$t0,4
     addi $t8,$t8,4
     bgt $t4,$t5,guarda
     blt $t7,$t6,guardaMenor
     j loop
guarda:
     move $t5,$t4
     j loop
guardaMenor:
    move $t6,$t7
    j loop
saida:
    la $a0,ler1
    li $v0,4
    syscall

        move $a0, $t5
        li $v0,1
        syscall

       la $a0,ler2
    li $v0,4
    syscall

        move $a0, $t6
        li $v0,1
        syscall