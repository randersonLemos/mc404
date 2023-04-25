.data
vetor:
  .word 43
  .word 0x34
  .word 45
  .word 0x4c

addi a1, a1, %lo(vetor)
.text
addi zero, zero, 0 # corrigir jumps do simulador 
Soma:
  addi sp, sp, -4  # aloca memoria para endereco de retorno
  sw   ra, sp,  0  # salva endereco de retorno
  
  add  a0, a0, a1 # soma valores de a0 e a1

  lw   ra, sp, 0
  addi sp, sp, 4
  ret

Subtrai:
  addi sp, sp, -4
  sw   ra, sp, 0

  sub  a0, a0, a1

  lw   ra, sp, 0
  addi sp, sp, -4
  ret

main: 
  lui  s0,     %hi(vetor)
  addi s0, s0, %lo(vetor)

  addi t0, zero, 5
  ecall

  addi t1, zero, 0 
  addi t2, zero, 2
loop:
  beq t2, zero, fim
    add t3, s0, t1 
    lw t4, t3, 0
    beq t4, a0, chamafuncao
    addi t2, t2, -1        
    addi t1, t1, 8
    j loop


chamafuncao:
  lw t5, t3, 4 
  addi t0, zero, 4  
  ecall
  addi t1, a0, 0
  ecall
  addi t2, a0, 0

  addi a0, t1, 0
  addi a1, t2, 0
  
  jalr ra, t5, 0 

 
fim:
  ret
