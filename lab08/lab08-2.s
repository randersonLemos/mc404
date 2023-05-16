.data
  str0: .space 21
  str1: .string "Hello world!\n"

 
.text
main:
    la s0, str0
    la s1, str1

    mv a0, s0
    mv a1, s1
    call strcpy

    mv a1, a0
    li a0, 4
    ecall

    li a0, 10
    ecall

strcpy:   
    mv a2, a0
0:
    lbu t1, 0(a1)
    sb  t1, 0(a0)
    beq t1, zero, 1f
    addi a0, a0, 1
    addi a1, a1, 1
    j 0b
1:
    mv a0, a2
    ret




