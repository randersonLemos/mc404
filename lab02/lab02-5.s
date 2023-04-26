main:
loop:
	# Read numbers from keyboard and write in s0, s1
	addi t0, zero, 4 
	ecall
	add s0, zero, a0

	addi t0, zero, 4
	ecall
	add s1, zero, a0

	# Terminate program when s0 or s1 is 0
	beq s0, zero, end
	beq s1, zero, end

	bge s0, s1, prints0
  	j prints1
	
prints0:
	add a0, zero, s0
	addi t0, zero, 1
	ecall
	j loop

prints1:
	add a0, zero, s1
	addi t0, zero, 1
	ecall
	j loop

end:
	ret
