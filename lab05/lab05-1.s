.data
vetor: 
    .word 10
    .word 20
    .word 30
.text
main:
    lui s0, %hi(vetor)
    addi s0, s0, %lo(vetor)
  
    lw t0, s0, 0
    add a0, zero, t0

    addi s0, s0, 4
    lw t0, s0, 0
    add a0, a0, t0

    addi s0, s0, 4
    lw t0, s0, 0
    add a0, a0, t0


    addi t0, zero, 1
    ecall
ret

