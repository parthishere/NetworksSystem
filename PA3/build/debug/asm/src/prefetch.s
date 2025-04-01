	.file	"prefetch.c"
	.text
	.globl	prefetch_thread_func
	.type	prefetch_thread_func, @function
prefetch_thread_func:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
.L2:
	nop
	jmp	.L2
	.cfi_endproc
.LFE6:
	.size	prefetch_thread_func, .-prefetch_thread_func
	.section	.rodata
.LC0:
	.string	"href=[\"']([^\"']+)[\"']"
.LC1:
	.string	"#"
.LC2:
	.string	"Links %s \n"
	.text
	.globl	extract_links
	.type	extract_links, @function
extract_links:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160, %rsp
	movq	%rdi, -152(%rbp)
	movq	%rsi, -160(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -128(%rbp)
	movq	-160(%rbp), %rax
	movl	$0, (%rax)
	leaq	.LC0(%rip), %rax
	movq	%rax, -112(%rbp)
	movq	-112(%rbp), %rcx
	leaq	-96(%rbp), %rax
	movl	$1, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	regcomp@PLT
	testl	%eax, %eax
	je	.L4
	movl	$0, %eax
	jmp	.L9
.L4:
	movq	-152(%rbp), %rax
	movq	%rax, -120(%rbp)
	jmp	.L6
.L8:
	movl	-24(%rbp), %eax
	movl	%eax, -140(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, -136(%rbp)
	movl	-136(%rbp), %eax
	subl	-140(%rbp), %eax
	movl	%eax, -132(%rbp)
	movl	-132(%rbp), %eax
	addl	$1, %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -104(%rbp)
	movl	-132(%rbp), %eax
	movslq	%eax, %rdx
	movl	-140(%rbp), %eax
	movslq	%eax, %rcx
	movq	-120(%rbp), %rax
	addq	%rax, %rcx
	movq	-104(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	movl	-132(%rbp), %eax
	movslq	%eax, %rdx
	movq	-104(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-160(%rbp), %rax
	movl	(%rax), %eax
	addl	$1, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-128(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, -128(%rbp)
	movq	-160(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-128(%rbp), %rax
	addq	%rax, %rdx
	movq	-104(%rbp), %rax
	movq	%rax, (%rdx)
	movq	-104(%rbp), %rax
	leaq	.LC1(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L7
	movq	-104(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-160(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-160(%rbp), %rax
	movl	%edx, (%rax)
.L7:
	movl	-28(%rbp), %eax
	cltq
	addq	%rax, -120(%rbp)
.L6:
	leaq	-32(%rbp), %rdx
	movq	-120(%rbp), %rsi
	leaq	-96(%rbp), %rax
	movl	$0, %r8d
	movq	%rdx, %rcx
	movl	$2, %edx
	movq	%rax, %rdi
	call	regexec@PLT
	testl	%eax, %eax
	je	.L8
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	regfree@PLT
	movq	-128(%rbp), %rax
.L9:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	extract_links, .-extract_links
	.ident	"GCC: (Ubuntu 14.2.0-4ubuntu2) 14.2.0"
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
