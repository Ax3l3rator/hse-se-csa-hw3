	.intel_syntax noprefix
	.text
	.globl	findSum
	.type	findSum, @function
findSum:
	push	rbp
	mov	rbp, rsp
	push	rbx
	movsd	xmm6, QWORD PTR .LC0[rip] # e = 1
	movsd	xmm7, QWORD PTR .LC0[rip] # prev = 1
	movapd	xmm2, xmm7 
	mov	ebx, 1
	jmp	.L2
.L3:
	movapd	xmm1, xmm2 # val 
	mulsd	xmm1, xmm0 # val
	pxor	xmm2, xmm2 # val
	cvtsi2sd	xmm2, ebx # val
	movapd	xmm4, xmm1 # val
	divsd	xmm4, xmm2 #  = prev * x / i
	addsd	xmm6, xmm4 # e += val
	movapd	xmm2, xmm4 # prev = val
	add	ebx, 1
.L2:
	cmp	ebx, 100 # cmp i, 100
	jle	.L3 
	movsd	xmm0, QWORD PTR .LC0[rip] # 
	movapd	xmm1, xmm0 #
	movapd	xmm3, xmm6 #
	divsd	xmm1, xmm3 #
	movapd	xmm0, xmm3 #
	subsd	xmm0, xmm1 # xmm0 = (e - 1 / e)
	movsd	xmm1, QWORD PTR .LC0[rip]
	divsd	xmm1, xmm3 #
	addsd	xmm1, xmm3 # xmm1 = (e + 1 / e)
	divsd	xmm0, xmm1 # xmm0 = (e - 1 / e) / (e + 1 / e)
	mov	rbx, QWORD PTR -8[rbp]
	leave
	ret
	.size	findSum, .-findSum
    .section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1072693248