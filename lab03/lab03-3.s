main:
  addi s0, zero, 1
  addi s1, zero, 0
  addi s2, zero, 0
loop:
  addi t0, zero, 4
  ecall
  # Se for zero, vai para o fim
  beq a0, zero, end
    and s3, a0, s0
    beq s3, zero, even
      add s1, s1, a0 # Soma impares
      j loop
even:
    add s2, s2, a0  # Soma pares
    j loop
end:
  sub  a0, s1, s2
  addi t0, zero, 1
  ecall
  ret
