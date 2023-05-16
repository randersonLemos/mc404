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
  addi sp, sp, -4
  sw ra, 0(sp)

  la s1, vec1

  li a0, 1
  lw 
  
  ecall

  lw ra, 0(sp)
  addi sp, sp, 4
  ret