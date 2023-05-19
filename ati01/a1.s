.data
  n1: .word 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1  
  n2: .word 31, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 31
.text
main:
  la a0, n1 # number 
  call printNumberShift
  
  li a0, 100
  call pausa

  la a0, n2
  call printNumberShift

  li a0, 10
  ecall

printNumberShift:
  addi sp, sp, -16
  sw s0, 12(sp)
  sw s1,  8(sp)
  sw s2,  4(sp)
  sw ra,  0(sp)

  mv s0, a0
  li s1, 17
  li s2, -1
printNumberShiftLoop:
  beq s1, zero, printNumberShiftFim
    addi s1, s1, -1
    addi s2, s2,  1
    mv a0, s0
    mv a1, s2  # shift
    call printNumber
    li a0, 100
    call pausa
    j printNumberShiftLoop

printNumberShiftFim:
  lw ra,  0(sp)
  lw s2,  4(sp)
  lw s1,  8(sp)
  lw s0, 12(sp)
  addi sp, sp, 16
  ret

printNumber:
  addi sp, sp, -12
  sw s0, 8(sp)
  sw s1, 4(sp)
  sw ra, 0(sp)

  mv s0, a0
  mv t1, a1 #  shift
  li s1, 12

printNumberLoop:
  beq s1, zero, printNumberFim
    addi s1, s1, -1   

    li a0, 0x110
	  mv a1, s1
	  lw a2, 0(s0) # colune
    sll a2, a2, t1
	  ecall
    
    addi s0, s0,  4

    j printNumberLoop

printNumberFim:
  lw ra, 0(sp)
  lw s1, 4(sp)
  lw s0, 8(sp)
  addi sp, sp, 12
  ret

pausa:
pausaLoop:
  beq a0, zero, pausaFim
    addi a0, a0, -1
    j pausaLoop
pausaFim:
  ret

