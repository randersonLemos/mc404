.data
  str1: .string "Hello World!\n"
  vec1: .word -1, -1, -1, -1, -1, -1, -1, -1, -1, -1

.text
main:
  la s0, vec1
  li s1, 3

  mv a0, s0
  mv a1, s1
  call LeVetor
  
loop:
  beq s1, zero, fim
    li a0, 1
    lw a1, 0(s0)
    ecall
    addi s0, s0, 4
    addi s1, s1, -1
    j loop
  
fim:
  li a0, 10
  ecall

LeVetor:
  addi sp, sp -12
  sw s0, 8(sp)
  sw s1, 4(sp)
  sw ra, 0(sp)

  mv s0, a0
  mv s1, a1

LeVetorLoop:
  beq s1, zero, LeVetorFim
    call LeNumero
    sw a0, 0(s0)

    addi s0, s0,  4
    addi s1, s1, -1    
    j LeVetorLoop

LeVetorFim:
  lw ra, 0(sp)
  lw s1, 4(sp)
  lw s0, 8(sp)
  addi, sp, sp 12
  ret

LeNumero:
  addi sp, sp, -40 # Reservando 32 bytes pra string
  sw s0, 36(sp)
  sw ra, 32(sp)
  mv s0, sp # Comeco da string de 32 bytes

  mv a0, s0
  call LeString
  mv t0, s0
  li a0, 0
  li t2, 10

LeNumeroLoop:
  lbu t1, 0(t0)
  beq t1, zero, LeNumeroFim
    addi t1, t1, -48
    mul a0, a0, t2
    add  a0, a0, t1
    addi t0, t0, 1 
    j LeNumeroLoop 
    
LeNumeroFim:
  lw ra, 32(sp)
  lw s0, 36(sp)
  addi sp, sp, 40
  ret

LeString:
    addi  sp, sp, -8
    sw    s0, 4(sp)
    sw    ra, 0(sp)

    mv    s0, a0
    li    a0, 0x130
    ecall        

LeStringLoop: 
    li    a0, 0x131 
    ecall

    beq   a0, zero, LeStringFim # se for zero, terminou de ler
    li    t0, 1
    beq   a0, t0, LeStringLoop
    sb    a1, 0(s0)
    addi  s0, s0, 1
    j     LeStringLoop

LeStringFim: 
    sb    zero, 0(s0) # coloca o zero no final da string
    lw    ra, 0(sp)
    lw    s0, 4(sp)
    addi  sp, sp, 8
    ret