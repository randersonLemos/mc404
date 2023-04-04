.data
string:    
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
.text
main:
  lui  s0, %hi(string)
  addi s0, s0, %lo(string)
  
  add  a0, zero, s0
  addi a1, zero, 20
  addi t0, zero, 6
  ecall

  addi s1, zero, 20
  addi t0, zero, 0
loop:
  bne t0, zero, end
    addi s1, s1, -1
    add  t1, s0, s1
    lbu  t0, t1, 0
    addi t0, t0, -32
    j loop
   
end:
  addi a0, s1, 1
  addi t0, zero, 1
  ecall
  ret

