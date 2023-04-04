.data
matrix:    
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
.text
main:
  addi s0, zero,  6 # contador
  addi s1, zero, -4 # incremento para acesso de memoria
  addi s2, zero,  0 # i
  addi s3, zero,  0 # j
  addi s4, zero,  3 # numero de colunas
loop:
  beq s0, zero, print
    addi s0, s0, -1 
    addi s1, s1,  4
    
    lui s5, %hi(matrix)
    addi s5, s5, %lo(matrix)
    add  s5, s5, s1 
    add  t0, s2, s3 
    sw t0, s5, 0
    
    addi s3, s3, 1
    beq  s3, s4, incLinha 

    j loop
incLinha:
    addi s2, s2, 3
    addi s3, zero, 0
    j loop

print:
  addi s0, zero,  6
  addi s1, zero, -4
loopp:
  beq s0, zero, end
    addi s0, s0, -1
    addi s1, s1, 4

    lui s2, %hi(matrix)
    addi s2, s2, %lo(matrix)
    add  s2, s2, s1 
    lw t0, s2, 0

    add  a0, zero, t0
    addi t0, zero, 1
    ecall

    j loopp
end:
  ret

