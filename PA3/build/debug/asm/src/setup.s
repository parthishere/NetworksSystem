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
	.globl	init_server_side_socket
	.type	init_server_side_socket, @function
init_server_side_socket:
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
	leaq	-112(%rbp), %rax
	movl	$48, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	$0, -108(%rbp)
	movl	$1, -104(%rbp)
	movl	$1, -112(%rbp)
	movq	-160(%rbp), %rax
	movq	8(%rax), %rax
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
	movq	-152(%rbp), %rax
	leaq	136(%rax), %rcx
	leaq	-112(%rbp), %rdx
	movq	-120(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	getaddrinfo@PLT
	movl	%eax, -132(%rbp)
	cmpl	$0, -132(%rbp)
	jns	.L7
	movl	-132(%rbp), %eax
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
.L7:
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-152(%rbp), %rax
	movq	136(%rax), %rax
	movq	%rax, -128(%rbp)
	jmp	.L8
.L14:
	movq	-128(%rbp), %rax
	movl	12(%rax), %edx
	movq	-128(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-128(%rbp), %rax
	movl	4(%rax), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	socket@PLT
	movl	%eax, -136(%rbp)
	cmpl	$0, -136(%rbp)
	jns	.L9
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	jmp	.L10
.L9:
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, -140(%rbp)
	leaq	-140(%rbp), %rdx
	movl	-136(%rbp), %eax
	movl	$4, %r8d
	movq	%rdx, %rcx
	movl	$2, %edx
	movl	$1, %esi
	movl	%eax, %edi
	call	setsockopt@PLT
	cmpl	$-1, %eax
	jne	.L11
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L11:
	movq	-128(%rbp), %rax
	movl	16(%rax), %edx
	movq	-128(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	movl	-136(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	bind@PLT
	testl	%eax, %eax
	jns	.L18
	movl	-136(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	nop
.L10:
	movq	-128(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -128(%rbp)
.L8:
	cmpq	$0, -128(%rbp)
	jne	.L14
	jmp	.L13
.L18:
	nop
.L13:
	cmpq	$0, -128(%rbp)
	jne	.L15
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$50, %edx
	movl	$1, %esi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	-136(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$1, %edi
	call	exit@PLT
.L15:
	movq	-152(%rbp), %rax
	movl	-136(%rbp), %edx
	movl	%edx, (%rax)
	movq	-128(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	getin_addr
	movq	%rax, %rsi
	movq	-128(%rbp), %rax
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
	movq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	freeaddrinfo@PLT
	movl	-136(%rbp), %eax
	movl	$300, %esi
	movl	%eax, %edi
	call	listen@PLT
	testl	%eax, %eax
	jns	.L19
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L19:
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	init_server_side_socket, .-init_server_side_socket
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
