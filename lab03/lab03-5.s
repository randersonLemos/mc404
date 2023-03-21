main:
  # Le segredo do teclado e atribui em s1
  addi t0, zero, 4
  ecall
  add s1, zero, a0
loop:
  # Le numero e codifica 
  addi t0, zero, 4
  ecall
  beq a0, zero, end
    xor a0, s1, a0
    addi t0, zero, 1
    ecall
    j loop
end:
  ret
