	.file	"proxy.c"
	.text
	.local	shutdown_flag
	.comm	shutdown_flag,4,4
	.local	shutdown_mutex
	.comm	shutdown_mutex,40,32
	.section	.rodata
.LC0:
	.string	"\n\nCleaning up resources...\n"
	.text
	.globl	sig_handler
	.type	sig_handler, @function
sig_handler:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	leaq	.LC0(%rip), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	write@PLT
	movl	$1, shutdown_flag(%rip)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	sig_handler, .-sig_handler
	.section	.rodata
	.align 8
.LC1:
	.string	"\033[31m[-] You messed up, command is ./proxy <PORT> <TIMEOUT> | (passed numer of args: %d) \n\033[0m"
	.align 8
.LC2:
	.string	"[+] Cache Timeout is set to %d\n"
.LC3:
	.string	"[+] Block list updated!"
.LC4:
	.string	"\033[31maccept\033[0m"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$416, %rsp
	movl	%edi, -404(%rbp)
	movq	%rsi, -416(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-384(%rbp), %rax
	movl	$152, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-384(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	sigemptyset@PLT
	movl	$0, -248(%rbp)
	leaq	sig_handler(%rip), %rax
	movq	%rax, -384(%rbp)
	leaq	-384(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$2, %edi
	call	sigaction@PLT
	movl	$1, %esi
	movl	$13, %edi
	call	signal@PLT
	leaq	-224(%rbp), %rax
	addq	$168, %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_mutex_init@PLT
	cmpl	$3, -404(%rbp)
	je	.L3
	cmpl	$2, -404(%rbp)
	jne	.L4
	movl	$60, -68(%rbp)
	jmp	.L3
.L4:
	movl	-404(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %edi
	call	exit@PLT
.L3:
	movq	-416(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -68(%rbp)
	movl	-68(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$128, -80(%rbp)
	movl	$1, %edi
	call	init_cache_table@PLT
	movl	$0, %edi
	call	init_cache@PLT
	movl	$0, %edi
	call	init_blocklist@PLT
	movq	%rax, -400(%rbp)
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-416(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rdx
	leaq	-224(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	init_socket@PLT
	movl	$10, %edi
	call	create_threadpool@PLT
	movq	%rax, -392(%rbp)
	cmpq	$0, -392(%rbp)
	je	.L13
	jmp	.L7
.L10:
	leaq	-224(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movl	-224(%rbp), %eax
	leaq	-224(%rbp), %rdx
	addq	$144, %rdx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	accept@PLT
	movl	%eax, -220(%rbp)
	movl	-220(%rbp), %eax
	testl	%eax, %eax
	jns	.L8
	call	__errno_location@PLT
	movl	(%rax), %eax
	cmpl	$4, %eax
	je	.L8
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	jmp	.L6
.L8:
	leaq	-224(%rbp), %rdx
	movq	-392(%rbp), %rax
	movq	handle_req@GOTPCREL(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	dispatch@PLT
	leaq	shutdown_mutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	movl	shutdown_flag(%rip), %eax
	testl	%eax, %eax
	jne	.L14
	leaq	shutdown_mutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
.L7:
	movl	shutdown_flag(%rip), %eax
	testl	%eax, %eax
	je	.L10
	jmp	.L6
.L13:
	nop
	jmp	.L6
.L14:
	nop
.L6:
	movl	-224(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$0, %edi
	call	cleanup_cache@PLT
	movl	$0, %edi
	call	cleanup_blocklist@PLT
	movq	-392(%rbp), %rax
	movq	%rax, %rdi
	call	destroy_threadpool@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L12
	call	__stack_chk_fail@PLT
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
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
