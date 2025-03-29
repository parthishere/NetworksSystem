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
.LC2:
	.string	"maps.google.com"
.LC3:
	.string	"%d is blocked \n"
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
	pushq	%rbx
	subq	$376, %rsp
	.cfi_offset 3, -24
	movl	%edi, -372(%rbp)
	movq	%rsi, -384(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	leaq	-352(%rbp), %rax
	movl	$152, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-352(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	sigemptyset@PLT
	movl	$0, -216(%rbp)
	leaq	sig_handler(%rip), %rax
	movq	%rax, -352(%rbp)
	leaq	-352(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$2, %edi
	call	sigaction@PLT
	movl	$1, %esi
	movl	$13, %edi
	call	signal@PLT
	cmpl	$2, -372(%rbp)
	jg	.L3
	movl	-372(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %edi
	call	exit@PLT
.L3:
	movl	$128, -48(%rbp)
	movl	$1, %edi
	call	init_cache_table@PLT
	movl	$0, %eax
	call	init_blocklist@PLT
	movq	%rax, -368(%rbp)
	leaq	.LC2(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	is_blocked@PLT
	movl	%eax, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-384(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rcx
	leaq	-192(%rbp), %rax
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	init_socket@PLT
	movl	$1, %edi
	call	create_threadpool@PLT
	movq	%rax, -360(%rbp)
	cmpq	$0, -360(%rbp)
	je	.L12
	jmp	.L6
.L9:
	leaq	-192(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movl	-192(%rbp), %eax
	leaq	-192(%rbp), %rdx
	addq	$144, %rdx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	accept@PLT
	movl	%eax, -188(%rbp)
	movl	-188(%rbp), %eax
	testl	%eax, %eax
	jns	.L7
	call	__errno_location@PLT
	movl	(%rax), %eax
	cmpl	$4, %eax
	je	.L7
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	jmp	.L5
.L7:
	movq	-360(%rbp), %rdx
	subq	$160, %rsp
	movq	%rsp, %rax
	movq	-192(%rbp), %rcx
	movq	-184(%rbp), %rbx
	movq	%rcx, (%rax)
	movq	%rbx, 8(%rax)
	movq	-176(%rbp), %rcx
	movq	-168(%rbp), %rbx
	movq	%rcx, 16(%rax)
	movq	%rbx, 24(%rax)
	movq	-160(%rbp), %rcx
	movq	-152(%rbp), %rbx
	movq	%rcx, 32(%rax)
	movq	%rbx, 40(%rax)
	movq	-144(%rbp), %rcx
	movq	-136(%rbp), %rbx
	movq	%rcx, 48(%rax)
	movq	%rbx, 56(%rax)
	movq	-128(%rbp), %rcx
	movq	-120(%rbp), %rbx
	movq	%rcx, 64(%rax)
	movq	%rbx, 72(%rax)
	movq	-112(%rbp), %rcx
	movq	-104(%rbp), %rbx
	movq	%rcx, 80(%rax)
	movq	%rbx, 88(%rax)
	movq	-96(%rbp), %rcx
	movq	-88(%rbp), %rbx
	movq	%rcx, 96(%rax)
	movq	%rbx, 104(%rax)
	movq	-80(%rbp), %rcx
	movq	-72(%rbp), %rbx
	movq	%rcx, 112(%rax)
	movq	%rbx, 120(%rax)
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rbx
	movq	%rcx, 128(%rax)
	movq	%rbx, 136(%rax)
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %rbx
	movq	%rcx, 144(%rax)
	movq	%rbx, 152(%rax)
	movq	handle_req@GOTPCREL(%rip), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	dispatch@PLT
	addq	$160, %rsp
	leaq	shutdown_mutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	movl	shutdown_flag(%rip), %eax
	testl	%eax, %eax
	jne	.L13
	leaq	shutdown_mutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
.L6:
	movl	shutdown_flag(%rip), %eax
	testl	%eax, %eax
	je	.L9
	jmp	.L5
.L12:
	nop
	jmp	.L5
.L13:
	nop
.L5:
	movl	-188(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	-192(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movq	-360(%rbp), %rax
	movq	%rax, %rdi
	call	destroy_threadpool@PLT
	movl	$0, %eax
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L11
	call	__stack_chk_fail@PLT
.L11:
	movq	-8(%rbp), %rbx
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
