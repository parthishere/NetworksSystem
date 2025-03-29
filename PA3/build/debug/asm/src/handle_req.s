	.file	"handle_req.c"
	.text
	.section	.rodata
.LC0:
	.string	"something came "
.LC1:
	.string	"something came %d \n"
.LC2:
	.string	"\033[31mselect error"
	.align 8
.LC3:
	.string	"\033[33m[-] (%d) Connection timed out\n\033[0m"
.LC4:
	.string	"\033[31m[-] read"
.LC5:
	.string	"recieved_buf : %s\n\n"
.LC6:
	.string	"Hostname %s\n"
.LC7:
	.string	"lets see if its working"
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
	subq	$2512, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L12:
	leaq	-31024(%rbp), %rax
	movq	%rax, -31160(%rbp)
	movl	$0, -31172(%rbp)
	jmp	.L2
.L3:
	movq	-31160(%rbp), %rax
	movl	-31172(%rbp), %edx
	movq	$0, (%rax,%rdx,8)
	addl	$1, -31172(%rbp)
.L2:
	cmpl	$15, -31172(%rbp)
	jbe	.L3
	movl	20(%rbp), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	movl	%eax, %esi
	movslq	%esi, %rax
	movq	-31024(%rbp,%rax,8), %rax
	movl	20(%rbp), %edx
	andl	$63, %edx
	movl	$1, %edi
	movl	%edx, %ecx
	salq	%cl, %rdi
	movq	%rdi, %rdx
	orq	%rax, %rdx
	movslq	%esi, %rax
	movq	%rdx, -31024(%rbp,%rax,8)
	movq	$2, -31152(%rbp)
	movq	$0, -31144(%rbp)
	movl	20(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	20(%rbp), %eax
	leal	1(%rax), %edi
	leaq	-31152(%rbp), %rdx
	leaq	-31024(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	call	select@PLT
	movl	%eax, -31168(%rbp)
	cmpl	$0, -31168(%rbp)
	jns	.L4
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	jmp	.L5
.L4:
	cmpl	$0, -31168(%rbp)
	jne	.L6
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC3(%rip), %rax
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
	movq	-31024(%rbp,%rax,8), %rdx
	movl	20(%rbp), %eax
	andl	$63, %eax
	movl	$1, %esi
	movl	%eax, %ecx
	salq	%cl, %rsi
	movq	%rsi, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L12
	movl	20(%rbp), %eax
	leaq	-30736(%rbp), %rsi
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	movl	%eax, -31164(%rbp)
	cmpl	$0, -31164(%rbp)
	jns	.L8
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$0, %eax
	jmp	.L13
.L8:
	leaq	-30736(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-31136(%rbp), %rax
	movl	$112, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	$128, -30752(%rbp)
	movq	-31112(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	-31044(%rbp), %eax
	cmpl	$1, %eax
	je	.L5
	movl	-31048(%rbp), %eax
	testl	%eax, %eax
	je	.L5
	leaq	-31136(%rbp), %rax
	movl	$112, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	jmp	.L12
.L5:
	movl	20(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$0, %eax
.L13:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L14
	call	__stack_chk_fail@PLT
.L14:
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
