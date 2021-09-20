#codigo para demonstar o uso de variaveis floats no MIPS-Assembly
# @author: Matheus Costa

.data 
	msg: .asciiz "Digite um numero decimal: "
	
	#variavel para manipularmos valores flutuantes
	zero: .float 0.0
	
.text
	#imprimindo a mensagem para o usuario
	li $v0,4
	la $a0, msg
	syscall
	
	#lendo o numero float
	li $v0, 6
	syscall #este valor lido estara em $f0
	
	#atribuimos zero a $f1	
	lwc1 $f1,zero
	
	#colocamos o valor de $f0 em $f12(fazendo uma soma com 0)
	add.s $f12, $f1, $f0
	
	#imprimimos o numero float
	li  $v0, 2
	syscall