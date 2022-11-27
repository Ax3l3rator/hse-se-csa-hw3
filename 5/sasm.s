	.file	"sol.c"
	.intel_syntax noprefix
	.text
	.globl	findSum
	.type	findSum, @function
findSum:
.LFB0:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	movsd	QWORD PTR -40[rbp], xmm0 # save x
	movsd	xmm0, QWORD PTR .LC0[rip] 
	movsd	QWORD PTR -24[rbp], xmm0 # e = 1
	movsd	xmm0, QWORD PTR .LC0[rip] 
	movsd	QWORD PTR -16[rbp], xmm0 # prev = 1
	pxor	xmm0, xmm0 
	movsd	QWORD PTR -8[rbp], xmm0 # val = 0
	mov	DWORD PTR -28[rbp], 1 # i = 1
	jmp	.L2
.L3:
	movsd	xmm0, QWORD PTR -16[rbp] # xmm0 = prev
	mulsd	xmm0, QWORD PTR -40[rbp] # xmm0 = prev * x
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, DWORD PTR -28[rbp] # xmm1 = i
	divsd	xmm0, xmm1 # xmm0 = prev * x / i
	movsd	QWORD PTR -8[rbp], xmm0 # val = prev * x / i
	movsd	xmm0, QWORD PTR -24[rbp] # xmm0 = e
	addsd	xmm0, QWORD PTR -8[rbp] # xmm0 = e + val
	movsd	QWORD PTR -24[rbp], xmm0 # e = e + val
	movsd	xmm0, QWORD PTR -8[rbp] # xmm0 = val
	movsd	QWORD PTR -16[rbp], xmm0 # prev = val
	add	DWORD PTR -28[rbp], 1 # ++i
.L2:
	cmp	DWORD PTR -28[rbp], 100 # i <= 100
	jle	.L3
	movsd	xmm0, QWORD PTR .LC0[rip] # xmm0 = 1
	movapd	xmm1, xmm0 # xmm1 = 1
	divsd	xmm1, QWORD PTR -24[rbp] # xmm1 = 1 / e
	movsd	xmm0, QWORD PTR -24[rbp] # xmm0 = e
	subsd	xmm0, xmm1 # xmm0 = e - 1 / e
	movsd	xmm1, QWORD PTR .LC0[rip] # xmm1 = 1
	divsd	xmm1, QWORD PTR -24[rbp] # xmm1 = 1 / e
	addsd	xmm1, QWORD PTR -24[rbp] # xmm1 = e + 1 / e
	divsd	xmm0, xmm1 # xmm0 = (e - 1 / e) / (e + 1 / e)
	movq	rax, xmm0
	movq	xmm0, rax # return (e - 1 / e) / (e + 1 / e)
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	findSum, .-findSum
	.section	.rodata
.LC2:
	.string	"%lF"
.LC3:
	.string	"%.18F"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	lea	rax, -24[rbp] # rax -> input
	mov	rsi, rax # arg2 -> input
	lea	rax, .LC2[rip] # rax -> "%lF"
	mov	rdi, rax # arg1 -> "%lF"
	mov	eax, 0
	call	__isoc99_scanf@PLT 
	mov	rax, QWORD PTR -24[rbp] # rax = input
	movq	xmm0, rax # arg1 = input
	call	findSum 
	movq	rax, xmm0 # rax = returned
	mov	QWORD PTR -16[rbp], rax # result = returned
	mov	rax, QWORD PTR -16[rbp] # rax = result
	movq	xmm0, rax # arg2 = result
	lea	rax, .LC3[rip] # rax -> "%.18F"
	mov	rdi, rax # arg1 -> "%.18F"
	mov	eax, 1
	call	printf@PLT
	mov	eax, 0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
