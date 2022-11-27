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
	.globl	generate
	.type	generate, @function
generate:
	push	rbp
	mov	rbp, rsp
	call	rand@PLT
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC2[rip]
	divsd	xmm0, xmm1
	movq	rax, xmm0
	movq	xmm0, rax
	pop	rbp
	ret
	.size	generate, .-generate
	.section	.rodata
.LC3:
	.string	"Args count???"
.LC4:
	.string	"--file"
.LC5:
	.string	"r"
.LC6:
	.string	"No such file as %s"
.LC7:
	.string	"w"
.LC8:
	.string	"%lF"
.LC10:
	.string	"%.18F"
.LC11:
	.string	"--rand"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 80
	mov	DWORD PTR -68[rbp], edi
	mov	QWORD PTR -80[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	cmp	DWORD PTR -68[rbp], 1
	jg	.L8
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L9
.L8:
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC4[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L10
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC5[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -56[rbp], rax
	cmp	QWORD PTR -56[rbp], 0
	jne	.L11
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rax, .LC6[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L9
.L11:
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC7[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -48[rbp], rax
	lea	rdx, -64[rbp]
	mov	rax, QWORD PTR -56[rbp]
	lea	rcx, .LC8[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	call	clock@PLT
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -64[rbp]
	movq	xmm0, rax
	call	findSum
	movq	rax, xmm0
	mov	QWORD PTR -64[rbp], rax
	call	clock@PLT
	sub	rax, QWORD PTR -40[rbp]
	mov	QWORD PTR -40[rbp], rax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, QWORD PTR -40[rbp]
	movsd	xmm1, QWORD PTR .LC9[rip]
	divsd	xmm0, xmm1
	movq	rax, xmm0
	movq	xmm0, rax
	lea	rax, .LC8[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -48[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC10[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rax, QWORD PTR -56[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	rax, QWORD PTR -48[rbp]
	mov	rdi, rax
	call	fclose@PLT
.L10:
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC11[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L12
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC7[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax
	call	clock@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	eax, 0
	call	generate
	movq	rax, xmm0
	movq	xmm0, rax
	call	findSum
	movq	rax, xmm0
	mov	QWORD PTR -16[rbp], rax
	call	clock@PLT
	sub	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -32[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC10[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
.L12:
	mov	eax, 0
.L9:
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.align 8
.LC2:
	.long	-4194304
	.long	1105199103
	.align 8
.LC9:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
