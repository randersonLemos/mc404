main:
  addi s9, zero, 32
  addi t0, zero, 4
  ecall
  mv s0, a0
  beq s0, zero, endd
loop:    
    addi s9, s9, -4
    srl  s1, s0, s9
    andi s1, s1, 15
    addi t0, zero, 10
    bge s1, t0, letr
      j nume
nume:
  addi a0, s1, 4
  addi t0, zero, 2
  ecall
  beq s9, zero, main
    j loop
letr:
  addi a0, s1, 55
  addi t0, zero, 2 
  ecall
  beq s9, zero, main
    j loop
endd:
  addi a0, zero, 104
  ecall
  ret
