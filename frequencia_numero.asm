.data 
string:      .space 100                    
.text
main: 
    la $a0, string                             # input string
    li $a1, 100                                # maximum size of string
    li $v0, 8                                  # represents reading string
    syscall                                    # call system

    li $v0, 12                                 # 12 represents reading character
    syscall                                    # call system  
    move $s2, $v0                              # $s2= character
    li $s1, 100                                # $s1= maximum size of string
           
    li  $t4, 0                                 # count (number of occurrances)
    li  $t0, 0                                 # i(index)

    bge $t0, $s1, print                        # i>= string length, exit    

loop:                        

    lb  $s0,($a0)                              # the first character of string into $s0 
    bne $s0, $s2, skip                         # skip increasing the counter if item does not equal               
    add $t4, $t4, 1                            # otherwise increment the counter    
skip: 
    addiu $a0, $a0, 1                            # increment index
    beq $s0,0,print                             # go to print label if $s0=0 so $s0 ='\0' 
    j  loop                                    # go back to loop

print:                                     # print the result

   #addi $v0, $t4, 0                           # $v0= $v4= number of occurrences
   li $v0,1                                   # 1 represents printing integer                   
   move $a0,$t4                               # $a0=$t4 = number of occurances of character
   syscall                                    # call system    

 # Terminate the program
   li $v0, 10                                 # 10 represents exit
   syscall                                    # call system