.data
string:    
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
.text
main:
  lui  a0, %hi(string)
  addi a0, a0, %lo(string)
  addi a1, zero, 20
  addi t0, zero, 6
  ecall

  
end:
  ret

