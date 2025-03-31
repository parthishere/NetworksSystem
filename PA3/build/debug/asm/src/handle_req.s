	.file	"handle_req.c"
	.text
	.globl	get_in_addr
	.type	get_in_addr, @function
get_in_addr:
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
	addq	$8, %rax
.L3:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	get_in_addr, .-get_in_addr
	.globl	prefetcher_thread
	.type	prefetcher_thread, @function
prefetcher_thread:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	prefetcher_thread, .-prefetcher_thread
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
	.align 8
.LC7:
	.string	"HTTP/1.0 404 Not Found\n\rContent-Type: text/plain\n\r\n\rBlocked"
	.align 8
.LC8:
	.string	"\033[31m[-] send-server failed for server %d\n\033[0m"
	.align 8
.LC9:
	.string	"hostname str %s, hostname port %s\n"
.LC10:
	.string	"80"
.LC11:
	.string	"\033[31mgetaddrinfo\n\033[0m"
	.align 8
.LC12:
	.string	"\033[32m[+] getaddrinfo call successful\n\033[0m"
.LC13:
	.string	"\033[31mserver: socket"
	.align 8
.LC14:
	.string	"\033[32m[+] socket call successful\n\033[0m"
	.align 8
.LC15:
	.string	"\033[31m[-] connect failed for server %d\n\033[0m"
	.align 8
.LC16:
	.string	"\033[32m[+] connect call successful\n\033[0m"
	.align 8
.LC17:
	.string	"\033[31m[-] socket connection failed for server \n\033[0m"
.LC18:
	.string	"client: connecting to %s\n"
.LC19:
	.string	"Connection: Keep-alive"
.LC20:
	.string	"Connection: close"
.LC21:
	.string	"waiting for send ?? "
.LC22:
	.string	"GET %s HTTP/1.0\r\nHost: %s\r\n\r\n"
	.align 8
.LC23:
	.string	"\033[31m[-] send failed for server %d \n\033[0m"
.LC24:
	.string	"Sent\n\r"
	.align 8
.LC25:
	.string	"\033[31m[-] recv failed for server \n\033[0m"
	.align 8
.LC26:
	.string	"\033[31mSent form the fucking cache %d\n\r\033[0m"
.LC27:
	.string	"%s"
.LC28:
	.string	"lets see if its working"
	.text
	.globl	handle_req
	.type	handle_req, @function
handle_req:
.LFB8:
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
.L40:
	leaq	-30736(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30912(%rbp), %rax
	movq	%rax, -31120(%rbp)
	movl	$0, -31176(%rbp)
	jmp	.L7
.L8:
	movq	-31120(%rbp), %rax
	movl	-31176(%rbp), %edx
	movq	$0, (%rax,%rdx,8)
	addl	$1, -31176(%rbp)
.L7:
	cmpl	$15, -31176(%rbp)
	jbe	.L8
	movl	20(%rbp), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	movl	%eax, %esi
	movslq	%esi, %rax
	movq	-30912(%rbp,%rax,8), %rax
	movl	20(%rbp), %edx
	andl	$63, %edx
	movl	$1, %edi
	movl	%edx, %ecx
	salq	%cl, %rdi
	movq	%rdi, %rdx
	orq	%rax, %rdx
	movslq	%esi, %rax
	movq	%rdx, -30912(%rbp,%rax,8)
	movq	$2, -31088(%rbp)
	movq	$0, -31080(%rbp)
	movl	20(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	20(%rbp), %eax
	leal	1(%rax), %edi
	leaq	-31088(%rbp), %rdx
	leaq	-30912(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	call	select@PLT
	movl	%eax, -31164(%rbp)
	cmpl	$0, -31164(%rbp)
	jns	.L9
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	jmp	.L10
.L9:
	cmpl	$0, -31164(%rbp)
	jne	.L11
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L10
.L11:
	movl	20(%rbp), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	cltq
	movq	-30912(%rbp,%rax,8), %rdx
	movl	20(%rbp), %eax
	andl	$63, %eax
	movl	$1, %esi
	movl	%eax, %ecx
	salq	%cl, %rsi
	movq	%rsi, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L40
	leaq	-30736(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	20(%rbp), %eax
	leaq	-30736(%rbp), %rsi
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	movl	%eax, -31160(%rbp)
	cmpl	$0, -31160(%rbp)
	jns	.L13
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$0, %eax
	jmp	.L41
.L13:
	leaq	-30736(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-31024(%rbp), %rax
	movl	$112, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-31024(%rbp), %rdx
	leaq	-30736(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	parse_request_line_thread_safe@PLT
	testl	%eax, %eax
	jns	.L15
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L10
.L15:
	movq	-31000(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	is_blocked@PLT
	testl	%eax, %eax
	je	.L16
	leaq	.LC7(%rip), %rax
	movq	%rax, -31096(%rbp)
	movq	-31096(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movl	20(%rbp), %eax
	movq	-31096(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L43
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC8(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	20(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L10
.L16:
	movq	-31008(%rbp), %rdx
	movq	-31000(%rbp), %rax
	movl	$60, %ecx
	movq	%rax, %rsi
	movl	$0, %edi
	call	cache_lookup@PLT
	movl	%eax, -31156(%rbp)
	cmpl	$0, -31156(%rbp)
	jns	.L18
	leaq	-31072(%rbp), %rax
	movl	$48, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	$0, -31068(%rbp)
	movl	$1, -31064(%rbp)
	movq	-30992(%rbp), %rdx
	movq	-31000(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-30992(%rbp), %rax
	testq	%rax, %rax
	jne	.L19
	leaq	.LC10(%rip), %rax
	movq	%rax, -30992(%rbp)
.L19:
	movq	-30992(%rbp), %rsi
	movq	-31000(%rbp), %rax
	leaq	-31144(%rbp), %rcx
	leaq	-31072(%rbp), %rdx
	movq	%rax, %rdi
	call	getaddrinfo@PLT
	testl	%eax, %eax
	jns	.L20
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$1, %edi
	call	exit@PLT
.L20:
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-31144(%rbp), %rax
	movq	%rax, -31128(%rbp)
	jmp	.L21
.L26:
	movq	-31128(%rbp), %rax
	movl	12(%rax), %edx
	movq	-31128(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-31128(%rbp), %rax
	movl	4(%rax), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	socket@PLT
	movl	%eax, -31172(%rbp)
	cmpl	$0, -31172(%rbp)
	jns	.L22
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	jmp	.L23
.L22:
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-31128(%rbp), %rax
	movl	16(%rax), %edx
	movq	-31128(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	movl	-31172(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	connect@PLT
	testl	%eax, %eax
	jns	.L24
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC15(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	-31172(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L23
.L24:
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L25
.L23:
	movq	-31128(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -31128(%rbp)
.L21:
	cmpq	$0, -31128(%rbp)
	jne	.L26
.L25:
	cmpq	$0, -31128(%rbp)
	jne	.L27
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$50, %edx
	movl	$1, %esi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	-31172(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$1, %edi
	call	exit@PLT
.L27:
	movq	-31128(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	get_in_addr
	movq	%rax, %rsi
	movq	-31128(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30784(%rbp), %rdx
	movl	$46, %ecx
	movl	%eax, %edi
	call	inet_ntop@PLT
	leaq	-30784(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-31144(%rbp), %rax
	movq	%rax, %rdi
	call	freeaddrinfo@PLT
	movl	-30936(%rbp), %eax
	testl	%eax, %eax
	je	.L28
	leaq	.LC19(%rip), %rax
	jmp	.L29
.L28:
	leaq	.LC20(%rip), %rax
.L29:
	movq	%rax, -31112(%rbp)
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-31000(%rbp), %rcx
	movq	-31008(%rbp), %rdx
	leaq	-31136(%rbp), %rax
	leaq	.LC22(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	movq	-31136(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-31136(%rbp), %rsi
	movl	-31172(%rbp), %eax
	movl	$16384, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L30
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC23(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	-31172(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$1, %edi
	call	exit@PLT
.L30:
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-31008(%rbp), %rdx
	movq	-31000(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	cache_add_new@PLT
	movl	%eax, -31152(%rbp)
.L34:
	leaq	-30736(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30736(%rbp), %rsi
	movl	-31172(%rbp), %eax
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	movl	%eax, -31148(%rbp)
	cmpl	$0, -31148(%rbp)
	jg	.L31
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$37, %edx
	movl	$1, %esi
	leaq	.LC25(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	-31172(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	nop
	movl	-31152(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L35
.L31:
	movl	-31148(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-30736(%rbp), %rcx
	movl	-31152(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	leaq	-31180(%rbp), %rdx
	leaq	-30736(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	extract_links@PLT
	movq	%rax, -31104(%rbp)
	movl	-31180(%rbp), %eax
	addl	%eax, -31168(%rbp)
	movl	-31180(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	%rax, -31104(%rbp)
	movl	-31148(%rbp), %eax
	movslq	%eax, %rdx
	movl	20(%rbp), %eax
	leaq	-30736(%rbp), %rsi
	movl	$16384, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L34
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC8(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	-31172(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L34
.L18:
	movl	-31156(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L39:
	leaq	-30736(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30736(%rbp), %rcx
	movl	-31156(%rbp), %eax
	movl	$30720, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	movl	%eax, -31160(%rbp)
	cmpl	$0, -31160(%rbp)
	jle	.L44
	leaq	-30736(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-31160(%rbp), %eax
	movslq	%eax, %rdx
	movl	20(%rbp), %eax
	leaq	-30736(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L39
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC8(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	20(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L37
.L44:
	nop
.L37:
	movl	-31156(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
.L35:
	leaq	.LC28(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	-30932(%rbp), %eax
	cmpl	$1, %eax
	je	.L10
	movl	-30936(%rbp), %eax
	testl	%eax, %eax
	je	.L10
	leaq	-31024(%rbp), %rax
	movl	$112, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30736(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	jmp	.L40
.L43:
	nop
.L10:
	movl	20(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$0, %eax
.L41:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L42
	call	__stack_chk_fail@PLT
.L42:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
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
