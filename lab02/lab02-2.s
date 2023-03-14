prep:
	addi s10, zero, 0

main:
	# Le um numero do teclado e armazena em a0
	addi t0, zero, 4 
	ecall
	# Salvando a0 em s0
	add s0, zero, a0
	beq s0, zero, fim
	# Soma 2 ao valor de a0
	addi a0, a0, 2
	
	# Imprima o valor de a0 na tela
	addi t0, zero, 1
	ecall
	## Va novamente para o main e recomece a execucao
	#j main
	# Se o valor lido for diferente de zero, va para o inicio
	bne s0, zero, main
fim:
	ret
