main:
  addi t0, zero, 4   # escolhe a operacao de leitura de inteiro (4)
  ecall              # efetua a operacao de leitura de inteiro
  addi s1, a0, 2       
  add s2, zero, s1
  ret
