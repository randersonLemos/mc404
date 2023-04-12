#lui  a1, %hi(vetor)
#addi a1, a1, %lo(vetor)
.text
addi zero, zero, 0 # corrigir jumps do simulador 
Funcao:
  addi sp, sp, -4  # aloca memoria para endereco de retorno
  sw   ra, sp,  0  # salva endereco de retorno

  lw   ra, sp, 0
  addi sp, sp, 4
  ret

main: 
  lui  s0, %hi(Funcao)
  addi s0, s0, %lo(Funcao)
  jalr ra, s0, 0

fim:
  ret
