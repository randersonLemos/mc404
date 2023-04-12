#lui  a1, %hi(vetor)
#addi a1, a1, %lo(vetor)
.text
addi zero, zero, 0 # corrigir jumps do simulador 
TamanhoString:
  addi sp, sp, -4  # aloca memoria para endereco de retorno
  sw   ra, sp,  0  # salva endereco de retorno

  addi sp, sp, -16 # aloca memoria para string com 32 espacos

  add  a0, zero, sp #  endereco inicial da string
  addi a1, zero, 16 #  tamanho da string
  addi t0, zero, 6
  ecall

  addi t0, sp  , 16
  addi t1, zero, 0 
  addi t2, zero, 17
tamanhostringloop:
  bne t1, zero, tamanhostringfim
    addi t0, t0, -1
    addi t2, t2, -1
    lbu t1, t0, 0
    addi t1, t1, -32
    j tamanhostringloop
    

tamanhostringfim:  
  addi a0, t2, 0
  addi sp, sp, 16
  lw   ra, sp, 0
  addi sp, sp, 4
  ret

main: 
 call TamanhoString

  addi t0, zero, 1
  ecall

fim:
  ret
