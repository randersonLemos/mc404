main:
  # Le segredo e escreve em s1
  addi t0, zero, 4
  ecall
  add  s1, a0, zero
  # Le numero e guarda em s2
  addi t0, zero, 4
  ecall
  add  s2, a0, zero
  # Codifica com XOR e atribui resultado em s3
  xor s3, s1, s2
  # Imprime resultados
  add  a0, zero, s3
  addi t0, zero, 1
  ecall
  ret
