	.file	"sol.c"
	.intel_syntax noprefix
	.text
	.globl	findSum
	.type	findSum, @function
findSum:
	push	rbp
	mov	rbp, rsp
	movsd	QWORD PTR -40[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC0[rip]
	movsd	QWORD PTR -24[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC0[rip]
	movsd	QWORD PTR -16[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -8[rbp], xmm0
	mov	DWORD PTR -28[rbp], 1
	jmp	.L2
.L3:
	movsd	xmm0, QWORD PTR -16[rbp]
	mulsd	xmm0, QWORD PTR -40[rbp]
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, DWORD PTR -28[rbp]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm0, QWORD PTR -24[rbp]
	addsd	xmm0, QWORD PTR -8[rbp]
	movsd	QWORD PTR -24[rbp], xmm0
	movsd	xmm0, QWORD PTR -8[rbp]
	movsd	QWORD PTR -16[rbp], xmm0
	add	DWORD PTR -28[rbp], 1
.L2:
	cmp	DWORD PTR -28[rbp], 100
	jle	.L3
	movsd	xmm0, QWORD PTR .LC0[rip]
	movapd	xmm1, xmm0
	divsd	xmm1, QWORD PTR -24[rbp]
	movsd	xmm0, QWORD PTR -24[rbp]
	subsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC0[rip]
	divsd	xmm1, QWORD PTR -24[rbp]
	addsd	xmm1, QWORD PTR -24[rbp]
	divsd	xmm0, xmm1
	movq	rax, xmm0
	movq	xmm0, rax
	pop	rbp
	ret
	.size	findSum, .-findSum
	.section	.rodata
.LC2:
	.string	"Args count???"
.LC3:
	.string	"--file"
.LC4:
	.string	"r"
.LC5:
	.string	"No such file as %s"
.LC6:
	.string	"w"
.LC7:
	.string	"%lF"
.LC8:
	.string	"%.18F"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	DWORD PTR -36[rbp], edi
	mov	QWORD PTR -48[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	cmp	DWORD PTR -36[rbp], 3
	jg	.L6
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L7
.L6:
	mov	rax, QWORD PTR -48[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC3[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L8
	mov	rax, QWORD PTR -48[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC4[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax
	cmp	QWORD PTR -24[rbp], 0
	jne	.L9
	mov	rax, QWORD PTR -48[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L7
.L9:
	mov	rax, QWORD PTR -48[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC6[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax
	lea	rdx, -32[rbp]
	mov	rax, QWORD PTR -24[rbp]
	lea	rcx, .LC7[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	rax, QWORD PTR -32[rbp]
	movq	xmm0, rax
	call	findSum
	movq	rax, xmm0
	mov	rdx, QWORD PTR -16[rbp]
	movq	xmm0, rax
	lea	rax, .LC8[rip]
	mov	rsi, rax
	mov	rdi, rdx
	mov	eax, 1
	call	fprintf@PLT
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	fclose@PLT
.L8:
	mov	eax, 0
.L7:
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
