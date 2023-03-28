main:
  # Le caracter e guarda na variavel s1
  addi t0, zero, 5
  ecall
  mv s1, a0
  andi s2, s1, 32
  beq s2, zero, maiu
    j minu
maiu:
  # Mascara de 32 em s2
  addi s2, zero, 32
  # Converte caracter para minusculo
  or s1, s1, s2
  j prin
minu:
  # Mascara de 32 em s2
  addi s2, zero, 32
  xori s2, s2, -1
  # Converte caracter para maiusculo
  and s1, s1, s2
  j prin
prin:
  # Imprime caracter
  mv a0, s1
  addi t0, zero, 2
  ecall
end:
  ret
