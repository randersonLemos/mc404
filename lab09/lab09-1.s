.data
  str1: .string "Hello World!\n"
  vec1: .word 5, 10, 15

.text
main:
  call LeNumero
  li a0, 10
  ecall          # Encerra o programa
  ret

LeNumero:
  addi sp, sp, -40 # Reservando 32 bytes pra string
  sw s0, 36(sp)
  sw ra, 32(sp)
  mv s0, sp # Comeco da string de 32 bytes

  mv a0, s0
  call LeString

  mv t0, s0
LoopLeNumero:
  lbu t1, 0(t0)
  beq t1, zero, FimLeNumero
    li a0, 11
    mv a1, t1
    ecall
    addi t0, t0, 1 
    j LoopLeNumero 

    
FimLeNumero:
  lw ra, 32(sp)
  lw s0, 36(sp)
  addi sp, sp, 440
  ret

LeString:
    addi  sp, sp, -8
    sw    s0, 4(sp)
    sw    ra, 0(sp)

    mv    s0, a0
    li    a0, 0x130
    ecall        

LoopLeString: 
    li    a0, 0x131 
    ecall

    beq   a0, zero, FimLeString # se for zero, terminou de ler
    li    t0, 1
    beq   a0, t0, LoopLeString
    sb    a1, 0(s0)
    addi  s0, s0, 1
    j     LoopLeString

FimLeString: 
    sb    zero, 0(s0) # coloca o zero no final da string
    lw    ra, 0(sp)
    lw    s0, 4(sp)
    addi  sp, sp, 8
    ret