main:
	# le numero do teclado e salva em a1
	addi t0, zero, 4
	ecall    
	add a1, zero, a0

	# subtrai 10 do numero lido 
	addi t1, zero, 10
	
	blt a1, t1, printnegativo	
	j printpositivo

printpositivo:
	sub  a1, a1, t1
	# imprime a1
	add  a0, zero, a1
	addi t0, zero, 1
	ecall
	j end

printnegativo:
	# imprime sinal de menos
	addi a0, zero, 45
	addi t0, zero, 2
	ecall
	# imprime a1
	add a0, zero, a1
	addi t0, zero, 1
	ecall
	j end

end:
	ret
