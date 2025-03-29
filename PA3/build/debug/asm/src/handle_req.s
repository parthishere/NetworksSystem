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
	.string	"Error !"
.LC7:
	.string	"\033[31mgetaddrinfo\n\033[0m"
	.align 8
.LC8:
	.string	"\033[32m[+] getaddrinfo call successful\n\033[0m"
.LC9:
	.string	" Host name %s, port name %s\n\r"
.LC10:
	.string	"\033[31mserver: socket"
	.align 8
.LC11:
	.string	"\033[32m[+] socket call successful\n\033[0m"
	.align 8
.LC12:
	.string	"\033[31m[-] socket connection failed for server \n\033[0m"
	.align 8
.LC13:
	.string	"\033[31m[-] connect failed for server %d\n\033[0m"
.LC14:
	.string	"Connection: Keep-alive"
.LC15:
	.string	"Connection: close"
.LC16:
	.string	"waiting for send ?? "
	.align 8
.LC17:
	.string	"GET  /index.html HTTP/1.1\r\nHost: localhost:8080"
	.align 8
.LC18:
	.string	"\033[31m[-] send failed for server %d \n\033[0m"
.LC19:
	.string	"Sent\n\r"
	.align 8
.LC20:
	.string	"\033[31m[-] recv failed for server \n\033[0m"
.LC21:
	.string	"recv buf %s\n"
.LC22:
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
	leaq	-61440(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$528, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L25:
	leaq	-61744(%rbp), %rax
	movq	%rax, -61944(%rbp)
	movl	$0, -61968(%rbp)
	jmp	.L2
.L3:
	movq	-61944(%rbp), %rax
	movl	-61968(%rbp), %edx
	movq	$0, (%rax,%rdx,8)
	addl	$1, -61968(%rbp)
.L2:
	cmpl	$15, -61968(%rbp)
	jbe	.L3
	movl	20(%rbp), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	movl	%eax, %esi
	movslq	%esi, %rax
	movq	-61744(%rbp,%rax,8), %rax
	movl	20(%rbp), %edx
	andl	$63, %edx
	movl	$1, %edi
	movl	%edx, %ecx
	salq	%cl, %rdi
	movq	%rdi, %rdx
	orq	%rax, %rdx
	movslq	%esi, %rax
	movq	%rdx, -61744(%rbp,%rax,8)
	movq	$2, -61920(%rbp)
	movq	$0, -61912(%rbp)
	movl	20(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	20(%rbp), %eax
	leal	1(%rax), %edi
	leaq	-61920(%rbp), %rdx
	leaq	-61744(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	call	select@PLT
	movl	%eax, -61964(%rbp)
	cmpl	$0, -61964(%rbp)
	jns	.L4
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	jmp	.L5
.L4:
	cmpl	$0, -61964(%rbp)
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
	movq	-61744(%rbp,%rax,8), %rdx
	movl	20(%rbp), %eax
	andl	$63, %eax
	movl	$1, %esi
	movl	%eax, %ecx
	salq	%cl, %rsi
	movq	%rsi, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L25
	movl	20(%rbp), %eax
	leaq	-61456(%rbp), %rsi
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	movl	%eax, -61960(%rbp)
	cmpl	$0, -61960(%rbp)
	jns	.L8
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$0, %eax
	jmp	.L26
.L8:
	leaq	-61456(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-61856(%rbp), %rax
	movl	$112, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-61856(%rbp), %rdx
	leaq	-61456(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	parse_request_line_thread_safe@PLT
	testl	%eax, %eax
	jns	.L10
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L5
.L10:
	movq	-61832(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	is_blocked@PLT
	testl	%eax, %eax
	jne	.L29
	movq	-61840(%rbp), %rdx
	movq	-61832(%rbp), %rax
	movl	$10, %ecx
	movq	%rax, %rsi
	movl	$0, %edi
	call	cache_lookup@PLT
	shrl	$31, %eax
	movzbl	%al, %eax
	movl	%eax, -61956(%rbp)
	cmpl	$0, -61956(%rbp)
	je	.L12
	movl	$128, -61472(%rbp)
	leaq	-61904(%rbp), %rax
	movl	$48, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	$0, -61900(%rbp)
	movl	$1, -61896(%rbp)
	movq	-61824(%rbp), %rsi
	movq	-61832(%rbp), %rax
	leaq	-61616(%rbp), %rdx
	leaq	136(%rdx), %rcx
	leaq	-61904(%rbp), %rdx
	movq	%rax, %rdi
	call	getaddrinfo@PLT
	testl	%eax, %eax
	jns	.L13
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$1, %edi
	call	exit@PLT
.L13:
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-61824(%rbp), %rdx
	movq	-61832(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-61480(%rbp), %rax
	movq	%rax, -61952(%rbp)
	jmp	.L14
.L18:
	movq	-61952(%rbp), %rax
	movl	12(%rax), %edx
	movq	-61952(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-61952(%rbp), %rax
	movl	4(%rax), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	socket@PLT
	movl	%eax, -61616(%rbp)
	movl	-61616(%rbp), %eax
	testl	%eax, %eax
	jns	.L15
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	jmp	.L28
.L15:
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L17
.L28:
	movq	-61952(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -61952(%rbp)
.L14:
	cmpq	$0, -61952(%rbp)
	jne	.L18
.L17:
	cmpq	$0, -61952(%rbp)
	jne	.L19
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$50, %edx
	movl	$1, %esi
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	-61616(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$1, %edi
	call	exit@PLT
.L19:
	movq	-61480(%rbp), %rax
	movl	16(%rax), %edx
	movq	-61480(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	movl	-61616(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	connect@PLT
	movl	%eax, -61612(%rbp)
	movl	-61612(%rbp), %eax
	testl	%eax, %eax
	jns	.L20
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC13(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	-61616(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$1, %edi
	call	exit@PLT
.L20:
	movl	-61768(%rbp), %eax
	testl	%eax, %eax
	je	.L21
	leaq	.LC14(%rip), %rax
	jmp	.L22
.L21:
	leaq	.LC15(%rip), %rax
.L22:
	movq	%rax, -61936(%rbp)
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC17(%rip), %rax
	movq	%rax, -61928(%rbp)
	movq	-61928(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movl	-61612(%rbp), %eax
	movq	-61928(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L23
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC18(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	-61616(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	-61612(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$1, %edi
	call	exit@PLT
.L23:
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-61612(%rbp), %eax
	leaq	-30736(%rbp), %rsi
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	testq	%rax, %rax
	jns	.L24
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$37, %edx
	movl	$1, %esi
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	-61616(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	-61612(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$1, %edi
	call	exit@PLT
.L24:
	leaq	-30736(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L12:
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	-61764(%rbp), %eax
	cmpl	$1, %eax
	je	.L5
	movl	-61768(%rbp), %eax
	testl	%eax, %eax
	je	.L5
	leaq	-61856(%rbp), %rax
	movl	$112, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	jmp	.L25
.L29:
	nop
.L5:
	movl	20(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$0, %eax
.L26:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L27
	call	__stack_chk_fail@PLT
.L27:
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
