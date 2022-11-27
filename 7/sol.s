	.file	"sol.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	findSum
	.type	findSum, @function
findSum:
	movsd	xmm4, QWORD PTR .LC0[rip]
	mov	eax, 1
	movapd	xmm1, xmm4
	movapd	xmm2, xmm4
	.p2align 4,,10
	.p2align 3
.L2:
	mulsd	xmm1, xmm0
	pxor	xmm3, xmm3
	cvtsi2sd	xmm3, eax
	add	eax, 1
	divsd	xmm1, xmm3
	addsd	xmm2, xmm1
	cmp	eax, 101
	jne	.L2
	divsd	xmm4, xmm2
	movapd	xmm0, xmm2
	subsd	xmm0, xmm4
	addsd	xmm4, xmm2
	divsd	xmm0, xmm4
	ret
	.size	findSum, .-findSum
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Args count???"
.LC2:
	.string	"--file"
.LC3:
	.string	"r"
.LC4:
	.string	"No such file as %s"
.LC5:
	.string	"w"
.LC6:
	.string	"%lF"
.LC7:
	.string	"%.18F"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
	push	r13
	push	r12
	push	rbp
	push	rbx
	sub	rsp, 24
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 8[rsp], rax
	xor	eax, eax
	cmp	edi, 3
	jle	.L14
	mov	rdi, QWORD PTR 8[rsi]
	mov	rbx, rsi
	lea	rsi, .LC2[rip]
	call	strcmp@PLT
	mov	r12d, eax
	test	eax, eax
	je	.L15
	xor	r12d, r12d
.L5:
	mov	rax, QWORD PTR 8[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L16
	add	rsp, 24
	mov	eax, r12d
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	ret
.L15:
	mov	rdi, QWORD PTR 16[rbx]
	lea	rsi, .LC3[rip]
	call	fopen@PLT
	mov	rbp, rax
	test	rax, rax
	je	.L17
	mov	rdi, QWORD PTR 24[rbx]
	lea	rsi, .LC5[rip]
	call	fopen@PLT
	mov	rdx, rsp
	lea	rsi, .LC6[rip]
	mov	rdi, rbp
	mov	r13, rax
	xor	eax, eax
	call	__isoc99_fscanf@PLT
	movsd	xmm3, QWORD PTR [rsp]
	mov	eax, 1
	movsd	xmm4, QWORD PTR .LC0[rip]
	movapd	xmm1, xmm4
	movapd	xmm0, xmm4
	.p2align 4,,10
	.p2align 3
.L9:
	mulsd	xmm0, xmm3
	pxor	xmm2, xmm2
	cvtsi2sd	xmm2, eax
	add	eax, 1
	divsd	xmm0, xmm2
	addsd	xmm1, xmm0
	cmp	eax, 101
	jne	.L9
	divsd	xmm4, xmm1
	movapd	xmm0, xmm1
	mov	esi, 1
	mov	rdi, r13
	lea	rdx, .LC7[rip]
	mov	eax, 1
	subsd	xmm0, xmm4
	addsd	xmm1, xmm4
	divsd	xmm0, xmm1
	call	__fprintf_chk@PLT
	mov	rdi, rbp
	call	fclose@PLT
	mov	rdi, r13
	call	fclose@PLT
	jmp	.L5
.L14:
	lea	rsi, .LC1[rip]
	mov	edi, 1
	mov	r12d, 1
	call	__printf_chk@PLT
	jmp	.L5
.L17:
	mov	rdx, QWORD PTR 16[rbx]
	lea	rsi, .LC4[rip]
	mov	edi, 1
	xor	eax, eax
	mov	r12d, 1
	call	__printf_chk@PLT
	jmp	.L5
.L16:
	call	__stack_chk_fail@PLT
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1072693248
