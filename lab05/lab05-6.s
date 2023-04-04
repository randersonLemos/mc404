.data
vetor_ponto:
  .word 1
  .word 2  # primeiro x, y
  .word 3
  .word 4  # segundo  x, y
  .word 5
  .word 6  # terceito x, y
  .word 7
  .word 8  # quarto   x, y
  .word 9
  .word 10 # quinto   x, y
.text
main:
  addi s0, zero,  5 
  addi s1, zero, -4

  lui  s2, %hi(vetor_ponto)
  addi s2, s2, %lo(vetor_ponto)   

loop:
  beq s0, zero, end
    addi s1, s1, 4
    add  s3, s1, s2
    lw t1, s3, 0 # carrega x[i]

    addi s1, s1, 4
    add  s3, s1, s2
    lw t2, s3, 0 # carrega y[i]
    
    addi t0, zero, 2

    addi a0, zero, 120
    ecall

    addi a0, zero, 61
    ecall
    
    addi  a0, t1, 48
    ecall

    addi a0, zero, 44
    ecall

    addi a0, zero, 121
    ecall

    addi a0, zero, 61
    ecall

    addi  a0, t2, 48
    ecall

    addi a0, zero, 32
    ecall



    addi s0, s0, -1

    j loop
end:
  ret
# copia o primeiro ponto para os registradores de ponto superior direito
# loop para percorrer os demais pontos do vetor
# compara a coordenada x do ponto atual com a coordenada x do ponto superior direito
# compara a coordenada y do ponto atual com a coordenada y do ponto superior direito
# imprime o ponto superior direito na tela
