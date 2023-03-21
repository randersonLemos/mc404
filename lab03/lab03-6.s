main:
  # Numero a ser impresso em binario
  addi s1, zero, 1
  addi t0, zero, 4
  ecall
  add  s2, zero, a0
  # Contador
  addi s3, zero, 32
loop:
  addi t1, s3, -1
  sll  t2, s1, t1
  and  a0, s2, t2
  beq a0, zero, printzero
    addi a0, zero, 49
    addi t0, zero, 2
    ecall
    beq s3, zero, end
    j loop
printzero:
  addi a0, zero, 48
  addi t0, zero, 2
  ecall
  addi s3, s3, -1
  beq s3, zero, end
  j loop
end:
  ret
