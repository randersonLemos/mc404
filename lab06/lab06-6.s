addi zero, zero, 0 # corrigir jumps do simulador 
Prod:
  addi sp, sp, -4  # aloca memoria para endereco de retorno
  sw   ra, sp,  0  # salva endereco de retorno
  
  addi t0, zero, 0
  beq a0, zero, prodFim
    add  t0, t0, a1 # soma valores de a0 e a1
    addi a0, a0, -1

prodFim:
  lw   ra, sp, 0
  addi sp, sp, 4
  ret

main: 

 
fim:
  ret
