.data
vetor:
  .word 1
  .word 2
  .word 3
  .word 4
  .word 5

.text
addi zero, zero, 0 # desbugar o simulador
SomaVetor:
  #addi sp, sp, -4
  #sw   ra, sp,  0
 
  addi t0, zero, 0
somavetorloop:
  beq a0, zero, somavetorfim
    lw   t1, a1, 0
    add  t0, t0, t1
    addi a1, a1, 4
    addi a0, a0, -1
    j somavetorloop

somavetorfim:
  addi a0, t0, 0
  #lw   ra, sp, 0 
  #addi sp, sp, 4
  ret

main: 
  addi a0, zero, 2

  lui  a1, %hi(vetor)
  addi a1, a1, %lo(vetor)

  addi sp, sp, -8
  sw  a0, sp, 4
  sw  a1, sp, 0

  call SomaVetor

fim:
  addi t0, zero, 1
  ecall

  lw  a1, sp, 0
  lw  a0, sp, 4
  addi sp, sp, 8
  ret

