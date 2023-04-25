.data
vetor:
  .word 1
  .word 2
  .word 3
  .word 4
  .word 5

.text
addi zero, zero, 0 # desbugar o simulador
Multiplica:
  addi sp, sp, -4
  sw   ra, sp, 0
 
  addi a2, zero, 0

loop:
  beq a1, zero, multiplicafim 
    add a2, a2, a0
    addi a1, a1, -1
    j loop

multiplicafim:
  addi a0, a2, 0
  lw   ra, sp, 0
  addi sp, sp, 4
  ret

MultiplicaVetor:
  # Movimenta o apontador da pilha 4 posicoes para baixo (16 bytes) e guarda 4 registradores na pilha
  addi sp, sp, -16
  sw   s0, sp, 12
  sw   s1, sp, 8
  sw   s2, sp, 4
  sw   ra, sp, 0

  mv   s0, a0 # tamanho
  mv   s1, a1 # ponteiro
  mv   s2, a2 # fator

for:
  beq  s0, zero, multiplicavetorfim 
    lw   a0, s1, 0
    mv   a1, s2
    call Multiplica
    sw   a0, s1, 0
    addi s1, s1, 4
    addi s0, s0, -1
    j    for

multiplicavetorfim:
    # Movimenta o apontador da pilha 4 posicoes para cima (16 bytes) e recupera 4 registradores da pilha
    lw   ra, sp, 0
    lw   s2, sp, 4
    lw   s1, sp, 8
    lw   s0, sp, 12
    addi sp, sp, 16
    ret


main:
  addi a0, zero, 2

  lui  a1, %hi(vetor)
  addi a1, a1, %lo(vetor)

  addi a2, zero, 2

  call SomaVetor
fim:
  ret

