	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"[ "
.LC2:
	.string	"]"
.LC3:
	.string	"> "
.LC4:
	.string	"%ms"
.LC5:
	.string	"add"
.LC6:
	.string	"%d, "
.LC7:
	.string	"[add].[data].> "
.LC8:
	.string	"%d"
.LC9:
	.string	"Failure activate."
.LC10:
	.string	"sub"
.LC11:
	.string	"[sub].[index].> "
.LC12:
	.string	"ins"
.LC13:
	.string	"[ins].[index].> "
.LC14:
	.string	"[ins].[data].> "
.LC15:
	.string	"set"
.LC16:
	.string	"[set].[index].> "
.LC17:
	.string	"[set].[data].> "
.LC18:
	.string	"Invalid command."
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB31:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	%fs:40, %rdi
	movq	%rdi, 56(%rsp)
	movl	$16, %edi
	call	malloc@PLT
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L2
	movdqa	.LC0(%rip), %xmm0
	movups	%xmm0, (%rax)
.L2:
	leaq	48(%rsp), %rax
	leaq	.LC6(%rip), %r12
	movq	%rax, 8(%rsp)
	leaq	44(%rsp), %rax
	movq	%rax, 16(%rsp)
	leaq	40(%rsp), %rax
	movq	%rax, 24(%rsp)
	.p2align 4
	.p2align 3
.L18:
	leaq	.LC1(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movq	(%r15), %rbx
	testq	%rbx, %rbx
	je	.L7
	movq	8(%r15), %rbp
	leaq	16(%r15), %r13
	xorl	%r14d, %r14d
	.p2align 4
	.p2align 3
.L6:
	movl	0(%r13), %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	addq	$1, %r14
	addq	%rbp, %r13
	call	printf@PLT
	cmpq	%r14, %rbx
	jne	.L6
.L7:
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	leaq	.LC3(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movq	8(%rsp), %rsi
	leaq	.LC4(%rip), %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movq	48(%rsp), %rbp
	leaq	.LC5(%rip), %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L37
	leaq	.LC7(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movq	16(%rsp), %r14
	leaq	.LC8(%rip), %rdi
	xorl	%eax, %eax
	movq	%r14, %rsi
	call	__isoc99_scanf@PLT
	leaq	1(%rbx), %rsi
	movq	8(%r15), %rbx
	movq	%r15, %rdi
	imulq	%rsi, %rbx
	leaq	16(%rbx), %rsi
	call	realloc@PLT
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L8
	movq	(%rax), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, (%r15)
.L35:
	movq	8(%r15), %rdx
	movq	%r14, %rsi
	imulq	%rdx, %rax
	leaq	16(%r15,%rax), %rdi
	call	memcpy@PLT
.L9:
	movq	48(%rsp), %rdi
	call	free@PLT
	jmp	.L18
	.p2align 4,,10
	.p2align 3
.L37:
	leaq	.LC10(%rip), %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L38
	leaq	.LC12(%rip), %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L39
	leaq	.LC15(%rip), %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L15
	leaq	.LC16(%rip), %rdi
	call	printf@PLT
	movq	24(%rsp), %rsi
	leaq	.LC8(%rip), %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC17(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movq	16(%rsp), %r14
	leaq	.LC8(%rip), %rdi
	xorl	%eax, %eax
	movq	%r14, %rsi
	call	__isoc99_scanf@PLT
	movslq	40(%rsp), %rax
	cmpq	%rbx, %rax
	jb	.L35
.L16:
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	jmp	.L9
.L8:
	leaq	.LC9(%rip), %rdi
	xorl	%r15d, %r15d
	call	puts@PLT
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L38:
	leaq	.LC11(%rip), %rdi
	call	printf@PLT
	movq	24(%rsp), %rsi
	leaq	.LC8(%rip), %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movslq	40(%rsp), %rax
	cmpq	%rbx, %rax
	jnb	.L16
	movq	8(%r15), %rsi
	leaq	1(%rax), %rcx
	subq	%rax, %rbx
	imulq	%rsi, %rcx
	movq	%rcx, %rdx
	subq	%rsi, %rdx
	leaq	16(%r15,%rdx), %rdi
	leaq	-1(%rbx), %rdx
	imulq	%rsi, %rdx
	leaq	16(%r15,%rcx), %rsi
	call	memcpy@PLT
	movq	(%r15), %rax
	movq	%r15, %rdi
	leaq	-1(%rax), %rsi
	imulq	8(%r15), %rsi
	addq	$16, %rsi
	call	realloc@PLT
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L16
	subq	$1, (%rax)
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L15:
	leaq	.LC18(%rip), %rdi
	call	puts@PLT
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L39:
	leaq	.LC13(%rip), %rdi
	call	printf@PLT
	movq	24(%rsp), %rsi
	leaq	.LC8(%rip), %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC14(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movq	16(%rsp), %rsi
	leaq	.LC8(%rip), %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movslq	40(%rsp), %rbp
	cmpq	%rbx, %rbp
	jb	.L40
	leaq	1(%rbp), %rax
	movq	%rax, %r13
	subq	%rbx, %r13
.L14:
	imulq	8(%r15), %rax
	movq	%r15, %rdi
	leaq	16(%rax), %rsi
	call	realloc@PLT
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L8
	movq	(%rax), %rax
	movq	8(%r15), %rsi
	movq	%rbp, %r8
	addq	%r13, %rax
	imulq	%rsi, %r8
	movq	%rax, (%r15)
	subq	%rbp, %rax
	leaq	-1(%rax), %rdx
	imulq	%rsi, %rdx
	leaq	16(%rsi,%r8), %rdi
	addq	%r15, %rdi
	leaq	16(%r15,%r8), %rsi
	call	memcpy@PLT
	movq	8(%r15), %rdx
	movq	%rbp, %rcx
	movq	16(%rsp), %rsi
	imulq	%rdx, %rcx
	leaq	16(%r15,%rcx), %rdi
	call	memcpy@PLT
	jmp	.L9
.L40:
	leaq	1(%rbx), %rax
	movl	$1, %r13d
	jmp	.L14
	.cfi_endproc
.LFE31:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.quad	0
	.quad	4
	.ident	"GCC: (GNU) 14.2.1 20250207"
	.section	.note.GNU-stack,"",@progbits
