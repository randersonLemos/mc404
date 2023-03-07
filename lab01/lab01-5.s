main:
  addi t0, zero, 4   # escolhe a operacao de leitura de inteiro (4)
  ecall              # efetua a operacao de leitura de inteiro
  add s1, a0, zero
  ecall              # efetua a operacao de leitura de inteiro   (4)
  add s2, a0, zero
  add a0, s1, s2
  addi t0, zero, 1
  ecall
  ret
