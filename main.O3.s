	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"[ "
.LC1:
	.string	"%d, "
.LC2:
	.string	"]"
.LC3:
	.string	"> "
.LC4:
	.string	"%ms"
.LC5:
	.string	"add"
.LC6:
	.string	"[add].[data].> "
.LC7:
	.string	"%d"
.LC8:
	.string	"Failure activate."
.LC9:
	.string	"sub"
.LC10:
	.string	"[sub].[index].> "
.LC11:
	.string	"ins"
.LC12:
	.string	"[ins].[index].> "
.LC13:
	.string	"[ins].[data].> "
.LC14:
	.string	"set"
.LC15:
	.string	"[set].[index].> "
.LC16:
	.string	"[set].[data].> "
.LC17:
	.string	"Invalid command."
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB22:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leaq	.LC0(%rip), %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	.LC7(%rip), %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	leaq	.LC1(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rdi
	movq	%rdi, 40(%rsp)
	movl	$4, %edi
	leaq	24(%rsp), %rbx
	leaq	20(%rsp), %r13
	call	darray_new@PLT
	movq	%rax, 24(%rsp)
	leaq	32(%rsp), %rax
	movq	%rax, (%rsp)
	leaq	16(%rsp), %rax
	movq	%rax, 8(%rsp)
	.p2align 4
	.p2align 3
.L11:
	xorl	%eax, %eax
	movq	%r15, %rdi
	call	printf@PLT
	movq	24(%rsp), %rax
	cmpq	$0, (%rax)
	je	.L2
	xorl	%r12d, %r12d
	.p2align 4
	.p2align 3
.L3:
	movq	%r12, %rsi
	movq	%rbx, %rdi
	addq	$1, %r12
	call	darray_get@PLT
	movq	%rbp, %rdi
	movl	(%rax), %esi
	xorl	%eax, %eax
	call	printf@PLT
	movq	24(%rsp), %rax
	cmpq	(%rax), %r12
	jb	.L3
.L2:
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	leaq	.LC3(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movq	(%rsp), %rsi
	leaq	.LC4(%rip), %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movq	32(%rsp), %r12
	leaq	.LC5(%rip), %rsi
	movq	%r12, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L4
	leaq	.LC6(%rip), %rdi
	call	printf@PLT
	movq	%r13, %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	darray_add@PLT
	testl	%eax, %eax
	je	.L6
.L5:
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
.L6:
	movq	32(%rsp), %rdi
	call	free@PLT
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L4:
	leaq	.LC9(%rip), %rsi
	movq	%r12, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L16
	leaq	.LC11(%rip), %rsi
	movq	%r12, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L17
	leaq	.LC14(%rip), %rsi
	movq	%r12, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L10
	leaq	.LC15(%rip), %rdi
	call	printf@PLT
	movq	8(%rsp), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC16(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movq	%r13, %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movslq	16(%rsp), %rsi
	movq	%r13, %rdx
	movq	%rbx, %rdi
	call	darray_set@PLT
	testl	%eax, %eax
	je	.L6
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L16:
	leaq	.LC10(%rip), %rdi
	call	printf@PLT
	movq	8(%rsp), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movslq	16(%rsp), %rsi
	movq	%rbx, %rdi
	call	darray_remove@PLT
	testl	%eax, %eax
	je	.L6
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L10:
	leaq	.LC17(%rip), %rdi
	call	puts@PLT
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L17:
	leaq	.LC12(%rip), %rdi
	call	printf@PLT
	movq	8(%rsp), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC13(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movq	%r13, %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movslq	16(%rsp), %rsi
	movq	%r13, %rdx
	movq	%rbx, %rdi
	call	darray_insert@PLT
	testl	%eax, %eax
	je	.L6
	jmp	.L5
	.cfi_endproc
.LFE22:
	.size	main, .-main
	.ident	"GCC: (GNU) 14.2.1 20250207"
	.section	.note.GNU-stack,"",@progbits
