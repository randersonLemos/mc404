main:
  # Le numero entre 0 e 15 e guarda em s1
  addi t0, zero, 4
  ecall
  mv s1, a0
  # Escreve 10 em s2
  addi s2, zero, 10
  bge s1, s2, letr
    j nume
nume:
  # Imprime numero
  addi a0, s1, 48
  addi t0, zero, 2
  ecall
  addi a0, zero, 104
  ecall
  j endd

letr:
  addi a0, s1, 55
  addi t0, zero, 2 
  ecall
  addi a0, zero, 104
  ecall
  j endd
endd:
  ret
