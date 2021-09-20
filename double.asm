#codigo para demonstar a utilizacao de variaveis do tipo double no MIPS-Assembly
# @author: Matheus Costa

.data
	msg: .asciiz "Digite um numero decimal: "
	#variavel para manipularmos valores double
	zero: .double 0.0
.text
	#imprimindo a mensagem
	li $v0, 4
	la $a0,msg
	syscall

	#lendo um valor double, o valor armazenado estara em $f0
	li $v0, 7
	syscall
	
	# jogando o valor de f0 para f12, fazendo a soma com zero 
	ldc1 $f2,zero
	add.d $f12, $f2,$f0
	
	#imprimindo o double
	li $v0, 3
	syscall