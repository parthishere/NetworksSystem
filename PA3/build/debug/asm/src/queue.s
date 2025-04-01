	.file	"queue.c"
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"\033[32m[+] (%d) Thread was created \n\033[0m"
	.align 8
.LC1:
	.string	"\033[32m[+] (%d) Thread waiting for Connection\n\n\033[0m"
	.align 8
.LC2:
	.string	"\033[32m[+] (%d) Thread exiting\n\n\033[0m"
	.text
	.globl	default_thread_func
	.type	default_thread_func, @function
default_thread_func:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -32(%rbp)
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L2
.L6:
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-32(%rbp), %rax
	addq	$160, %rax
	movq	%rax, %rdi
	call	sem_wait@PLT
	movq	-32(%rbp), %rax
	addq	$24, %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	movq	-32(%rbp), %rax
	movq	192(%rax), %rax
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L3
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	leal	-1(%rax), %edx
	movq	-32(%rbp), %rax
	movl	%edx, (%rax)
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, 192(%rax)
	movq	-32(%rbp), %rax
	movq	192(%rax), %rax
	testq	%rax, %rax
	jne	.L4
	movq	-32(%rbp), %rax
	movq	$0, 200(%rax)
.L4:
	movq	-32(%rbp), %rax
	addq	$24, %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	movq	-24(%rbp), %rax
	movq	8(%rax), %rsi
	subq	$8, %rsp
	movq	-24(%rbp), %rax
	subq	$168, %rsp
	movq	%rsp, %rdx
	movq	16(%rax), %rcx
	movq	24(%rax), %rbx
	movq	%rcx, (%rdx)
	movq	%rbx, 8(%rdx)
	movq	32(%rax), %rcx
	movq	40(%rax), %rbx
	movq	%rcx, 16(%rdx)
	movq	%rbx, 24(%rdx)
	movq	48(%rax), %rcx
	movq	56(%rax), %rbx
	movq	%rcx, 32(%rdx)
	movq	%rbx, 40(%rdx)
	movq	64(%rax), %rcx
	movq	72(%rax), %rbx
	movq	%rcx, 48(%rdx)
	movq	%rbx, 56(%rdx)
	movq	80(%rax), %rcx
	movq	88(%rax), %rbx
	movq	%rcx, 64(%rdx)
	movq	%rbx, 72(%rdx)
	movq	96(%rax), %rcx
	movq	104(%rax), %rbx
	movq	%rcx, 80(%rdx)
	movq	%rbx, 88(%rdx)
	movq	112(%rax), %rcx
	movq	120(%rax), %rbx
	movq	%rcx, 96(%rdx)
	movq	%rbx, 104(%rdx)
	movq	128(%rax), %rcx
	movq	136(%rax), %rbx
	movq	%rcx, 112(%rdx)
	movq	%rbx, 120(%rdx)
	movq	144(%rax), %rcx
	movq	152(%rax), %rbx
	movq	%rcx, 128(%rdx)
	movq	%rbx, 136(%rdx)
	movq	160(%rax), %rcx
	movq	168(%rax), %rbx
	movq	%rcx, 144(%rdx)
	movq	%rbx, 152(%rdx)
	movq	176(%rax), %rax
	movq	%rax, 160(%rdx)
	call	*%rsi
	addq	$176, %rsp
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	jmp	.L2
.L3:
	movq	-32(%rbp), %rax
	addq	$24, %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	movq	-32(%rbp), %rax
	movq	$0, 200(%rax)
	movq	-32(%rbp), %rax
	movl	$0, (%rax)
.L2:
	movq	-32(%rbp), %rax
	movl	208(%rax), %eax
	testl	%eax, %eax
	je	.L6
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	default_thread_func, .-default_thread_func
	.globl	dispatch
	.type	dispatch, @function
dispatch:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	je	.L16
	cmpq	$0, -48(%rbp)
	je	.L16
	movl	$184, %edi
	call	malloc@PLT
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L17
	movq	-24(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-24(%rbp), %rax
	movq	16(%rbp), %rcx
	movq	24(%rbp), %rbx
	movq	%rcx, 16(%rax)
	movq	%rbx, 24(%rax)
	movq	32(%rbp), %rcx
	movq	40(%rbp), %rbx
	movq	%rcx, 32(%rax)
	movq	%rbx, 40(%rax)
	movq	48(%rbp), %rcx
	movq	56(%rbp), %rbx
	movq	%rcx, 48(%rax)
	movq	%rbx, 56(%rax)
	movq	64(%rbp), %rcx
	movq	72(%rbp), %rbx
	movq	%rcx, 64(%rax)
	movq	%rbx, 72(%rax)
	movq	80(%rbp), %rcx
	movq	88(%rbp), %rbx
	movq	%rcx, 80(%rax)
	movq	%rbx, 88(%rax)
	movq	96(%rbp), %rcx
	movq	104(%rbp), %rbx
	movq	%rcx, 96(%rax)
	movq	%rbx, 104(%rax)
	movq	112(%rbp), %rcx
	movq	120(%rbp), %rbx
	movq	%rcx, 112(%rax)
	movq	%rbx, 120(%rax)
	movq	128(%rbp), %rcx
	movq	136(%rbp), %rbx
	movq	%rcx, 128(%rax)
	movq	%rbx, 136(%rax)
	movq	144(%rbp), %rcx
	movq	152(%rbp), %rbx
	movq	%rcx, 144(%rax)
	movq	%rbx, 152(%rax)
	movq	160(%rbp), %rcx
	movq	168(%rbp), %rbx
	movq	%rcx, 160(%rax)
	movq	%rbx, 168(%rax)
	movq	176(%rbp), %rdx
	movq	%rdx, 176(%rax)
	movq	-24(%rbp), %rax
	movq	$0, (%rax)
	movq	-32(%rbp), %rax
	addq	$24, %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	movq	-32(%rbp), %rax
	movq	200(%rax), %rax
	testq	%rax, %rax
	je	.L13
	movq	-32(%rbp), %rax
	movq	192(%rax), %rax
	testq	%rax, %rax
	jne	.L14
.L13:
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 192(%rax)
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 200(%rax)
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-32(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L15
.L14:
	movq	-32(%rbp), %rax
	movq	200(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 200(%rax)
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-32(%rbp), %rax
	movl	%edx, (%rax)
.L15:
	movq	-32(%rbp), %rax
	addq	$160, %rax
	movq	%rax, %rdi
	call	sem_post@PLT
	movq	-32(%rbp), %rax
	addq	$24, %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	jmp	.L8
.L16:
	nop
	jmp	.L8
.L17:
	nop
.L8:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	dispatch, .-dispatch
	.section	.rodata
	.align 8
.LC3:
	.string	"\033[31m[-] Max thread limit reached, change MAX_THREAD_IN_POOL\n\033[0m"
	.align 8
.LC4:
	.string	"\033[31mError during threadpool creation!\n\033[0m"
	.text
	.globl	create_threadpool
	.type	create_threadpool, @function
create_threadpool:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	cmpl	$200, -20(%rbp)
	jg	.L19
	cmpl	$0, -20(%rbp)
	jg	.L20
.L19:
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	jmp	.L21
.L20:
	movl	$216, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L22
	movl	$0, %eax
	jmp	.L21
.L22:
	movq	-8(%rbp), %rax
	movl	-20(%rbp), %edx
	movl	%edx, 4(%rax)
	movq	-8(%rbp), %rax
	movl	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	$0, 192(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 200(%rax)
	movl	-20(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 208(%rax)
	movq	-8(%rbp), %rax
	addq	$24, %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_mutex_init@PLT
	movq	-8(%rbp), %rax
	addq	$64, %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_cond_init@PLT
	movq	-8(%rbp), %rax
	addq	$112, %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_cond_init@PLT
	movq	-8(%rbp), %rax
	addq	$160, %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	sem_init@PLT
	movl	$0, -12(%rbp)
	jmp	.L23
.L25:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rcx
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	%rax, %rdi
	call	pthread_attr_init@PLT
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	leaq	(%rax,%rdx), %rdi
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	leaq	default_thread_func(%rip), %rax
	movq	%rax, %rdx
	movl	$0, %esi
	call	pthread_create@PLT
	testl	%eax, %eax
	je	.L24
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$43, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	destroy_threadpool
	movl	$1, %edi
	call	exit@PLT
.L24:
	addl	$1, -12(%rbp)
.L23:
	movl	-12(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L25
	movq	-8(%rbp), %rax
.L21:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	create_threadpool, .-create_threadpool
	.globl	destroy_threadpool
	.type	destroy_threadpool, @function
destroy_threadpool:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpq	$0, -56(%rbp)
	je	.L36
	movq	-56(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	addq	$24, %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	movq	-24(%rbp), %rax
	movl	$1, 208(%rax)
	movq	-24(%rbp), %rax
	addq	$24, %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	movl	$0, -40(%rbp)
	jmp	.L29
.L30:
	movq	-24(%rbp), %rax
	addq	$160, %rax
	movq	%rax, %rdi
	call	sem_post@PLT
	addl	$1, -40(%rbp)
.L29:
	cmpl	$0, -40(%rbp)
	jle	.L30
	movl	$0, -36(%rbp)
	jmp	.L31
.L32:
	movl	$1000, %edi
	call	usleep@PLT
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join@PLT
	movq	-24(%rbp), %rax
	leaq	160(%rax), %rdx
	leaq	-44(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	sem_getvalue@PLT
	movq	-24(%rbp), %rax
	movq	16(%rax), %rcx
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	%rax, %rdi
	call	pthread_attr_destroy@PLT
	addl	$1, -36(%rbp)
.L31:
	cmpl	$0, -36(%rbp)
	jle	.L32
	movq	-24(%rbp), %rax
	movq	192(%rax), %rax
	movq	%rax, -32(%rbp)
	jmp	.L33
.L34:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-16(%rbp), %rax
	movq	%rax, -32(%rbp)
.L33:
	cmpq	$0, -32(%rbp)
	jne	.L34
	movq	-24(%rbp), %rax
	addq	$24, %rax
	movq	%rax, %rdi
	call	pthread_mutex_destroy@PLT
	movq	-24(%rbp), %rax
	addq	$64, %rax
	movq	%rax, %rdi
	call	pthread_cond_destroy@PLT
	movq	-24(%rbp), %rax
	addq	$112, %rax
	movq	%rax, %rdi
	call	pthread_cond_destroy@PLT
	movq	-24(%rbp), %rax
	addq	$160, %rax
	movq	%rax, %rdi
	call	sem_destroy@PLT
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	jmp	.L26
.L36:
	nop
.L26:
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L35
	call	__stack_chk_fail@PLT
.L35:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	destroy_threadpool, .-destroy_threadpool
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
