main:
	# le numero do teclado e salva em a1
	addi t0, zero, 4
	ecall    
	addi a1, a0, -10

  srli a2, a1, 31
	
	beq a2, zero, printpositivo
	  j printnegativo

printpositivo:
	# imprime a1
	add  a0, zero, a1
	addi t0, zero, 1
	ecall
	j end

printnegativo:
	addi a0, zero, 45
	addi t0, zero, 2
	ecall
	# imprime a1
  addi t0, zero,  1
  addi t1, zero, -1
  addi a1, a1, -1
  xor  a0, a1, t1
  ecall
	j end

end:
	ret
