	.file	"fork.c"
	.text
	.section	.rodata
.LC0:
	.string	"Cleaned up child process %d\n"
	.text
	.globl	cleanup_zombie_processes
	.type	cleanup_zombie_processes, @function
cleanup_zombie_processes:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	jmp	.L2
.L3:
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L2:
	movl	$1, %edx
	movl	$0, %esi
	movl	$-1, %edi
	call	waitpid@PLT
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jg	.L3
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	cleanup_zombie_processes, .-cleanup_zombie_processes
	.section	.rodata
.LC1:
	.string	"\033[31mselect error"
	.align 8
.LC2:
	.string	"\033[33m[-] (%d) Connection timed out\n\033[0m"
.LC3:
	.string	"\033[31m[-] read"
	.text
	.globl	use_fork
	.type	use_fork, @function
use_fork:
.LFB7:
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
	subq	$2368, %rsp
	movq	%rdi, -31032(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-31032(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, -31016(%rbp)
	movq	-31032(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -31012(%rbp)
	call	fork@PLT
	testl	%eax, %eax
	jne	.L5
	movl	-31012(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
.L13:
	leaq	-30864(%rbp), %rax
	movq	%rax, -31000(%rbp)
	movl	$0, -31020(%rbp)
	jmp	.L6
.L7:
	movq	-31000(%rbp), %rax
	movl	-31020(%rbp), %edx
	movq	$0, (%rax,%rdx,8)
	addl	$1, -31020(%rbp)
.L6:
	cmpl	$15, -31020(%rbp)
	jbe	.L7
	movl	-31016(%rbp), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	movl	%eax, %esi
	movslq	%esi, %rax
	movq	-30864(%rbp,%rax,8), %rax
	movl	-31016(%rbp), %edx
	andl	$63, %edx
	movl	$1, %edi
	movl	%edx, %ecx
	salq	%cl, %rdi
	movq	%rdi, %rdx
	orq	%rax, %rdx
	movslq	%esi, %rax
	movq	%rdx, -30864(%rbp,%rax,8)
	movq	$2, -30992(%rbp)
	movq	$0, -30984(%rbp)
	movl	-31016(%rbp), %eax
	leal	1(%rax), %edi
	leaq	-30992(%rbp), %rdx
	leaq	-30864(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	call	select@PLT
	movl	%eax, -31008(%rbp)
	cmpl	$0, -31008(%rbp)
	jns	.L8
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	jmp	.L9
.L8:
	cmpl	$0, -31008(%rbp)
	jne	.L10
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L9
.L10:
	movl	-31016(%rbp), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	cltq
	movq	-30864(%rbp,%rax,8), %rdx
	movl	-31016(%rbp), %eax
	andl	$63, %eax
	movl	$1, %esi
	movl	%eax, %ecx
	salq	%cl, %rsi
	movq	%rsi, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L13
	leaq	-30736(%rbp), %rsi
	movl	-31016(%rbp), %eax
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	movl	%eax, -31004(%rbp)
	cmpl	$0, -31004(%rbp)
	jns	.L12
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
.L12:
	leaq	-30976(%rbp), %rax
	movl	$112, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30976(%rbp), %rdx
	leaq	-30736(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	parse_request_line_thread_safe@PLT
	movq	-31032(%rbp), %rdx
	leaq	-30976(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	build_and_send_header@PLT
	movl	-30884(%rbp), %eax
	cmpl	$1, %eax
	je	.L9
	movl	-30888(%rbp), %eax
	testl	%eax, %eax
	je	.L9
	leaq	-30976(%rbp), %rax
	movl	$112, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	jmp	.L13
.L9:
	movl	-31016(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$0, %edi
	call	_exit@PLT
.L5:
	movq	-31032(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L14
	call	__stack_chk_fail@PLT
.L14:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	use_fork, .-use_fork
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
