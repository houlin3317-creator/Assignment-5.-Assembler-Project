.data

Fizz:.asciiz "Fizz"
Buzz:.asciiz "Buzz"
FizzBuzz:.asciiz "FizzBuzz"

.text

li $t1, 1
li $t4, 101

loop1:

    li $t2, 15
    div $t1, $t2
    mfhi $t3
    beq $t3, $zero, PrintFizzBuzz

    li $t2, 3
    div $t1, $t2
    mfhi $t3
    beq $t3, $zero, PrintFizz

    li $t2, 5
    div $t1, $t2
    mfhi $t3
    beq $t3, $zero, PrintBuzz

    j PrintItem

PrintItemEnd:

    j PrintNewLine

PrintNewLineEnd:

    j next

PrintFizz:
    li $v0, 4
    la $a0, Fizz
    syscall
    j PrintNewLine

PrintBuzz:
    li $v0, 4
    la $a0, Buzz
    syscall
    j PrintNewLine

PrintFizzBuzz:
    li $v0, 4
    la $a0, FizzBuzz
    syscall
    j PrintNewLine

next:
    addi $t1, $t1, 1
    bne $t1, $t4, loop1
    j exit

PrintItem:
    j PrintInt

PrintIntEnd:
    j PrintItemEnd

PrintInt:
    li $v0, 1
    move $a0, $t1
    syscall
    j PrintIntEnd

PrintNewLine:
    li $a0, '\n'
    li $v0, 11
    syscall
    j PrintNewLineEnd

exit:
    li $v0, 10
    syscall