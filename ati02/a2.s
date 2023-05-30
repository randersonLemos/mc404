.data
.text
main:

addi t0, zero, 4

slli t1, t0, 10

xor t2, t0, t0

xor zero, zero, zero

mul s4, s3, t0

call func

li a0, 10
ecall

func: