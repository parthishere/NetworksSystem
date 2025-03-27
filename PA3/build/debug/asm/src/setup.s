	.file	"setup.c"
	.text
	.globl	getin_addr
	.type	getin_addr, @function
getin_addr:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movzwl	(%rax), %eax
	cmpw	$2, %ax
	jne	.L2
	movq	-8(%rbp), %rax
	addq	$4, %rax
	jmp	.L3
.L2:
	movq	-8(%rbp), %rax
	movzwl	(%rax), %eax
	cmpw	$10, %ax
	jne	.L4
	movq	-8(%rbp), %rax
	addq	$8, %rax
	jmp	.L3
.L4:
	movl	$0, %eax
.L3:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	getin_addr, .-getin_addr
	.section	.rodata
.LC0:
	.string	"Passed Server Port %s\n"
	.align 8
.LC1:
	.string	"\033[31m[-] Port Value < 1024 ! keep port value higher than 1024 \n\033[0m"
.LC2:
	.string	"\033[31mgetaddrinfo: %s\n\033[0m"
	.align 8
.LC3:
	.string	"\033[32m[+] getaddrinfo call successful\n\033[0m"
.LC4:
	.string	"\033[31mserver: socket"
	.align 8
.LC5:
	.string	"\033[32m[+] socket call successful\n\033[0m"
.LC6:
	.string	"\033[31msetsockopt"
.LC7:
	.string	"\033[31mserver: bind"
	.align 8
.LC8:
	.string	"\033[31m[-] socket connection failed for server \n\033[0m"
	.align 8
.LC9:
	.string	"\033[32m[+] Server recieving TCP/HTTP1.0 packet to : %s\n\033[0m"
.LC10:
	.string	"listen"
	.text
	.globl	init_socket
	.type	init_socket, @function
init_socket:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$192, %rsp
	movq	%rdi, -168(%rbp)
	movq	%rsi, -176(%rbp)
	movq	%rdx, -184(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-112(%rbp), %rax
	movl	$48, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	$0, -108(%rbp)
	movl	$1, -104(%rbp)
	movq	$0, -128(%rbp)
	movq	-176(%rbp), %rax
	movq	%rax, -120(%rbp)
	movq	-120(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	cmpl	$1024, %eax
	jg	.L6
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$67, %edx
	movl	$1, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$1, %edi
	call	exit@PLT
.L6:
	cmpq	$0, -184(%rbp)
	jne	.L7
	movl	$1, -112(%rbp)
	jmp	.L8
.L7:
	movq	-184(%rbp), %rax
	movq	%rax, -128(%rbp)
.L8:
	movq	-168(%rbp), %rax
	leaq	136(%rax), %rcx
	leaq	-112(%rbp), %rdx
	movq	-120(%rbp), %rsi
	movq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	getaddrinfo@PLT
	movl	%eax, -140(%rbp)
	cmpl	$0, -140(%rbp)
	jns	.L9
	movl	-140(%rbp), %eax
	movl	%eax, %edi
	call	gai_strerror@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC2(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$1, %edi
	call	exit@PLT
.L9:
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-168(%rbp), %rax
	movq	136(%rax), %rax
	movq	%rax, -136(%rbp)
	jmp	.L10
.L17:
	movq	-136(%rbp), %rax
	movl	12(%rax), %edx
	movq	-136(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-136(%rbp), %rax
	movl	4(%rax), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	socket@PLT
	movl	%eax, -144(%rbp)
	cmpl	$0, -144(%rbp)
	jns	.L11
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	jmp	.L12
.L11:
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpq	$0, -184(%rbp)
	jne	.L21
	movl	$1, -148(%rbp)
	leaq	-148(%rbp), %rdx
	movl	-144(%rbp), %eax
	movl	$4, %r8d
	movq	%rdx, %rcx
	movl	$2, %edx
	movl	$1, %esi
	movl	%eax, %edi
	call	setsockopt@PLT
	cmpl	$-1, %eax
	jne	.L14
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L14:
	movq	-136(%rbp), %rax
	movl	16(%rax), %edx
	movq	-136(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	movl	-144(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	bind@PLT
	testl	%eax, %eax
	jns	.L21
	movl	-144(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
.L12:
	movq	-136(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -136(%rbp)
.L10:
	cmpq	$0, -136(%rbp)
	jne	.L17
	jmp	.L16
.L21:
	nop
.L16:
	cmpq	$0, -136(%rbp)
	jne	.L18
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$50, %edx
	movl	$1, %esi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	-144(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$1, %edi
	call	exit@PLT
.L18:
	movq	-168(%rbp), %rax
	movl	-144(%rbp), %edx
	movl	%edx, (%rax)
	movq	-136(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	getin_addr
	movq	%rax, %rsi
	movq	-136(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-64(%rbp), %rdx
	movl	$46, %ecx
	movl	%eax, %edi
	call	inet_ntop@PLT
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	freeaddrinfo@PLT
	cmpq	$0, -184(%rbp)
	jne	.L22
	movl	-144(%rbp), %eax
	movl	$2, %esi
	movl	%eax, %edi
	call	listen@PLT
	testl	%eax, %eax
	jns	.L22
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L22:
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L20
	call	__stack_chk_fail@PLT
.L20:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	init_socket, .-init_socket
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
