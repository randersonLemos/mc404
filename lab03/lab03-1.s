main:
  # Le do teclado e guarda na variavel s1
  addi t0, zero, 4
  ecall
  mv s1, a0
  # Colada 1 na vairavel s2
  addi s2, zero, 1
  # AND logico para verificar paridade de s1 
  and s3, s1, s2
  beq s3, zero, even
    addi a0, zero, 73
    addi t0, zero, 2 
    ecall
    j end
even:
    addi a0, zero, 80
    addi t0, zero, 2
    ecall
    j end
end:
  ret
