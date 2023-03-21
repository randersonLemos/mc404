main:
  # Atribui 3 em s1
  addi s1, zero,  3 
  # Le do teclado e atribui em s2 
  addi t0, zero, 4
  ecall
  mv s2, a0
  # Aplica AND e atribui em s3
  and s3, s1, s2

  beq s3, zero, even
    addi a0, zero, 78
    addi t0, zero, 2 
    ecall
    j end
even:
    addi a0, zero, 83
    addi t0, zero, 2
    ecall
    j end
end:
  ret
