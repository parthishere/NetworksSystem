	.file	"handle_req.c"
	.text
	.section	.rodata
.LC0:
	.string	"\033[31mselect error"
	.align 8
.LC1:
	.string	"\033[33m[-] (%d) Connection timed out\n\033[0m"
.LC2:
	.string	"\033[31m[-] read"
	.text
	.globl	handle_req
	.type	handle_req, @function
handle_req:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	-28672(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$2336, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.L10:
	leaq	-30864(%rbp), %rax
	movq	%rax, -30984(%rbp)
	movl	$0, -30996(%rbp)
	jmp	.L2
.L3:
	movq	-30984(%rbp), %rax
	movl	-30996(%rbp), %edx
	movq	$0, (%rax,%rdx,8)
	addl	$1, -30996(%rbp)
.L2:
	cmpl	$15, -30996(%rbp)
	jbe	.L3
	movl	20(%rbp), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	movl	%eax, %esi
	movslq	%esi, %rax
	movq	-30864(%rbp,%rax,8), %rax
	movl	20(%rbp), %edx
	andl	$63, %edx
	movl	$1, %edi
	movl	%edx, %ecx
	salq	%cl, %rdi
	movq	%rdi, %rdx
	orq	%rax, %rdx
	movslq	%esi, %rax
	movq	%rdx, -30864(%rbp,%rax,8)
	movq	$2, -30976(%rbp)
	movq	$0, -30968(%rbp)
	movl	20(%rbp), %eax
	leal	1(%rax), %edi
	leaq	-30976(%rbp), %rdx
	leaq	-30864(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	call	select@PLT
	movl	%eax, -30992(%rbp)
	cmpl	$0, -30992(%rbp)
	jns	.L4
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	jmp	.L5
.L4:
	cmpl	$0, -30992(%rbp)
	jne	.L6
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L5
.L6:
	movl	20(%rbp), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	cltq
	movq	-30864(%rbp,%rax,8), %rdx
	movl	20(%rbp), %eax
	andl	$63, %eax
	movl	$1, %esi
	movl	%eax, %ecx
	salq	%cl, %rsi
	movq	%rsi, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L10
	movl	20(%rbp), %eax
	leaq	-30736(%rbp), %rsi
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	movl	%eax, -30988(%rbp)
	cmpl	$0, -30988(%rbp)
	jns	.L8
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$0, %eax
	jmp	.L11
.L8:
	leaq	-30960(%rbp), %rax
	movl	$96, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30960(%rbp), %rdx
	leaq	-30736(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	parse_request_line_thread_safe@PLT
	leaq	-30960(%rbp), %rax
	leaq	16(%rbp), %rsi
	movq	%rax, %rdi
	call	build_and_send_header@PLT
	movl	-30876(%rbp), %eax
	cmpl	$1, %eax
	je	.L5
	movl	-30880(%rbp), %eax
	testl	%eax, %eax
	je	.L5
	leaq	-30960(%rbp), %rax
	movl	$96, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	jmp	.L10
.L5:
	movl	20(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$0, %eax
.L11:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L12
	call	__stack_chk_fail@PLT
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	handle_req, .-handle_req
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
