main:
	addi s10, zero, 0

loop:
	# Le um numero do teclado e armazena em a0
	addi t0, zero, 4 
	ecall

	# Salva a0 em s0
	add s0, zero, a0

	# Soma 2 a a0
	addi a0, a0, 2
	
	# Imprime a0 na tela
	addi t0, zero, 1
	ecall

	# Termina programa qunado s10 for maior que 10
	addi s10, s10, 1
	addi t6, zero, 10
	bge s10, t6, fim
	j loop

fim:
	ret
