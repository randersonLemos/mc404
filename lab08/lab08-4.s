.data
  str0: .space 17
  N:    .word 16
 
.text
main:
    la a0, str0
    la a1, N
    lw a1, 0(a1)
    call fgets

    la a1, str0
    li a0, 4
    ecall

    li a0, 10
    ecall

fgets:
    addi  sp, sp, -12
    sw    s1, 8(sp)
    sw    s0, 4(sp)
    sw    ra, 0(sp)

    mv    s0, a0 # apontador para a string
    mv    s1, a1 # tamnho máximo da string

    li    a0, 0x130
    ecall           
loop: 
    li    a0, 0x131
    ecall

    beq   a0, zero, fim # se for zero, terminou de ler
    li    t0, 1
    beq   a0, t0, loop
    sb    a1, 0(s0)    
    addi  s0, s0,  1
    addi  s1, s1, -1
    beq   s1, zero, fim
    j     loop

fim: 
    sb    zero, 0(s0) # coloca o zero no final da string
    lw    ra, 0(sp)
    lw    s0, 4(sp)
    lw    s1, 8(sp)
    addi  sp, sp, 12
    ret