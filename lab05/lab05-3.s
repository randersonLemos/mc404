.rodata
vetorA: 
    .word 10
    .word 20
    .word 30
    .word 40
    .word 50
vetorB:
    .word 10
    .word 20
    .word 30
    .word 40
    .word 50
.data
vetorC:    
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
.text
main:
  addi s0, zero,  5
  addi s1, zero, -4
loop:
  beq s0, zero, print
    addi s0, s0, -1 

    addi s1, s1, 4
    
    lui s2, %hi(vetorA)
    addi s2, s2, %lo(vetorA)
    add  s2, s2, s1 
    lw t0, s2, 0

    lui s2, %hi(vetorB)
    addi s2, s2, %lo(vetorB)
    add  s2, s2, s1 
    lw t1, s2, 0

    add t2, t0, t1

    lui s2, %hi(vetorC)
    addi s2, s2, %lo(vetorC)
    add  s2, s2, s1 
    sw t2, s2, 0

    j loop
print:
  addi s0, zero,  5
  addi s1, zero, -4
loopp:
  beq s0, zero, end
    addi s0, s0, -1
    
    addi s1, s1, 4

    lui s2, %hi(vetorC)
    addi s2, s2, %lo(vetorC)
    add  s2, s2, s1 
    lw t0, s2, 0

    add  a0, zero, t0
    addi t0, zero, 1
    ecall

    j loopp
end:
  ret

