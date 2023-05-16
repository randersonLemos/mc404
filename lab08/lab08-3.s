.data
  str0: .space 21
  str1: .string "Hello world!\n"

 
.text
main:
    la a0, str0
    call gets

    la a1, str0
    li a0, 4
    ecall

    li a0, 10
    ecall

gets:
    addi  sp, sp, -8
    sw    s0, 4(sp)
    sw    ra, 0(sp)

    mv    s0, a0
    li    a0, 0x130
    ecall           
loop: 
    li    a0, 0x131 
    ecall

    beq   a0, zero, fim # se for zero, terminou de ler
    li    t0, 1
    beq   a0, t0, loop
    sb    a1, 0(s0)
    addi  s0, s0, 1
    j     loop

fim: 
    sb    zero, 0(s0) # coloca o zero no final da string
    lw    ra, 0(sp)
    lw    s0, 4(sp)
    addi  sp, sp, 8
    ret