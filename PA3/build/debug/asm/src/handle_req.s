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
	.string	"\033[31mselect error"
	.align 8
.LC1:
	.string	"\033[33m[-] (%d) Connection timed out\n\033[0m"
.LC2:
	.string	"\033[31m[-] read"
	.align 8
.LC3:
	.string	"HTTP/1.0 404 Not Found\n\rContent-Type: text/plain\n\r\n\rSomthing went wrong"
	.align 8
.LC4:
	.string	"\033[31m[-] send-server failed for server %d\n\033[0m"
	.align 8
.LC5:
	.string	"HTTP/1.0 404 Not Found\n\rContent-Type: text/plain\n\r\n\rBlocked"
.LC6:
	.string	"80"
.LC7:
	.string	"8080"
	.align 8
.LC8:
	.string	"HTTP/1.0 404 Not Found\n\rContent-Type: text/plain\n\r\n\r cannot req proxy"
.LC9:
	.string	"\033[31mgetaddrinfo\n\033[0m"
	.align 8
.LC10:
	.string	"\033[32m[+] getaddrinfo call successful\n\033[0m"
.LC11:
	.string	"\033[31mserver: socket"
	.align 8
.LC12:
	.string	"\033[32m[+] socket call successful\n\033[0m"
	.align 8
.LC13:
	.string	"\033[31m[-] connect failed for server %d\n\033[0m"
	.align 8
.LC14:
	.string	"\033[32m[+] connect call successful\n\033[0m"
	.align 8
.LC15:
	.string	"\033[31m[-] socket connection failed for server \n\033[0m"
.LC16:
	.string	"client: connecting to %s\n"
.LC17:
	.string	"Connection: Keep-alive"
.LC18:
	.string	"Connection: close"
.LC19:
	.string	"waiting for send ?? "
.LC20:
	.string	"GET %s HTTP/1.0\r\nHost: %s\r\n\r\n"
	.align 8
.LC21:
	.string	"\033[31m[-] send failed for server %d \n\033[0m"
	.align 8
.LC22:
	.string	"\033[31m[-] recv failed for server \n\033[0m"
.LC23:
	.string	"\033[33mSent from cache \n\r\033[0m"
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
	subq	$2528, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.L47:
	leaq	-30736(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30912(%rbp), %rax
	movq	%rax, -31136(%rbp)
	movl	$0, -31188(%rbp)
	jmp	.L7
.L8:
	movq	-31136(%rbp), %rax
	movl	-31188(%rbp), %edx
	movq	$0, (%rax,%rdx,8)
	addl	$1, -31188(%rbp)
.L7:
	cmpl	$15, -31188(%rbp)
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
	leal	1(%rax), %edi
	leaq	-31088(%rbp), %rdx
	leaq	-30912(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	call	select@PLT
	movl	%eax, -31176(%rbp)
	cmpl	$0, -31176(%rbp)
	jns	.L9
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	jmp	.L48
.L9:
	cmpl	$0, -31176(%rbp)
	jne	.L11
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L48
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
	je	.L47
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
	movl	%eax, -31172(%rbp)
	cmpl	$0, -31172(%rbp)
	jns	.L13
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$0, %eax
	jmp	.L49
.L13:
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
	leaq	.LC3(%rip), %rax
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
	jns	.L51
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC4(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	20(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L48
.L15:
	movq	-31000(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	is_blocked@PLT
	testl	%eax, %eax
	je	.L18
	leaq	.LC5(%rip), %rax
	movq	%rax, -31104(%rbp)
	movq	-31104(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movl	20(%rbp), %eax
	movq	-31104(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L52
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC4(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	20(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L48
.L18:
	movq	-31008(%rbp), %rdx
	movq	-31000(%rbp), %rax
	movl	$60, %ecx
	movq	%rax, %rsi
	movl	$0, %edi
	call	cache_lookup@PLT
	movl	%eax, -31192(%rbp)
	cmpl	$0, -31192(%rbp)
	jns	.L20
	leaq	-31072(%rbp), %rax
	movl	$48, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	$0, -31068(%rbp)
	movl	$1, -31064(%rbp)
	movq	-30992(%rbp), %rax
	testq	%rax, %rax
	jne	.L21
	leaq	.LC6(%rip), %rax
	movq	%rax, -30992(%rbp)
.L21:
	movq	-30992(%rbp), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L22
	leaq	.LC8(%rip), %rax
	movq	%rax, -31112(%rbp)
	movq	-31112(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movl	20(%rbp), %eax
	movq	-31112(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L53
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC4(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	20(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	nop
	jmp	.L48
.L22:
	movq	-30992(%rbp), %rsi
	movq	-31000(%rbp), %rax
	leaq	-31160(%rbp), %rcx
	leaq	-31072(%rbp), %rdx
	movq	%rax, %rdi
	call	getaddrinfo@PLT
	testl	%eax, %eax
	jns	.L25
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$1, %edi
	call	exit@PLT
.L25:
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-31160(%rbp), %rax
	movq	%rax, -31144(%rbp)
	jmp	.L26
.L31:
	movq	-31144(%rbp), %rax
	movl	12(%rax), %edx
	movq	-31144(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-31144(%rbp), %rax
	movl	4(%rax), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	socket@PLT
	movl	%eax, -31184(%rbp)
	cmpl	$0, -31184(%rbp)
	jns	.L27
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	jmp	.L28
.L27:
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-31144(%rbp), %rax
	movl	16(%rax), %edx
	movq	-31144(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	movl	-31184(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	connect@PLT
	testl	%eax, %eax
	jns	.L29
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC13(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	-31184(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L28
.L29:
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L30
.L28:
	movq	-31144(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -31144(%rbp)
.L26:
	cmpq	$0, -31144(%rbp)
	jne	.L31
.L30:
	cmpq	$0, -31144(%rbp)
	jne	.L32
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$50, %edx
	movl	$1, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	-31184(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$1, %edi
	call	exit@PLT
.L32:
	movq	-31144(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	get_in_addr
	movq	%rax, %rsi
	movq	-31144(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30784(%rbp), %rdx
	movl	$46, %ecx
	movl	%eax, %edi
	call	inet_ntop@PLT
	leaq	-30784(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-31160(%rbp), %rax
	movq	%rax, %rdi
	call	freeaddrinfo@PLT
	movl	-30936(%rbp), %eax
	testl	%eax, %eax
	je	.L33
	leaq	.LC17(%rip), %rax
	jmp	.L34
.L33:
	leaq	.LC18(%rip), %rax
.L34:
	movq	%rax, -31128(%rbp)
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-31000(%rbp), %rcx
	movq	-31008(%rbp), %rdx
	leaq	-31152(%rbp), %rax
	leaq	.LC20(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	movq	-31152(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-31152(%rbp), %rsi
	movl	-31184(%rbp), %eax
	movl	$16384, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L35
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC21(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	-31184(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$1, %edi
	call	exit@PLT
.L35:
	movq	-31008(%rbp), %rdx
	movq	-31000(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	cache_add_new@PLT
	movl	%eax, -31168(%rbp)
.L39:
	leaq	-30736(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30736(%rbp), %rsi
	movl	-31184(%rbp), %eax
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	movl	%eax, -31164(%rbp)
	cmpl	$0, -31164(%rbp)
	jg	.L36
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$37, %edx
	movl	$1, %esi
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	-31184(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	nop
	movl	-31168(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L40
.L36:
	movl	-31164(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-30736(%rbp), %rcx
	movl	-31168(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	leaq	-31196(%rbp), %rdx
	leaq	-30736(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	extract_links@PLT
	movq	%rax, -31120(%rbp)
	movl	-31196(%rbp), %eax
	addl	%eax, -31180(%rbp)
	movl	-31196(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	%rax, -31120(%rbp)
	movl	-31164(%rbp), %eax
	movslq	%eax, %rdx
	movl	20(%rbp), %eax
	leaq	-30736(%rbp), %rsi
	movl	$16384, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L39
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC4(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	-31184(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L39
.L20:
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L44:
	leaq	-30736(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30736(%rbp), %rcx
	movl	-31192(%rbp), %eax
	movl	$30720, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	movl	%eax, -31172(%rbp)
	cmpl	$0, -31172(%rbp)
	jle	.L54
	movl	-31172(%rbp), %eax
	movslq	%eax, %rdx
	movl	20(%rbp), %eax
	leaq	-30736(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L44
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC4(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	20(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L42
.L54:
	nop
.L42:
	movl	-31192(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
.L40:
	movl	-30932(%rbp), %eax
	cmpl	$1, %eax
	je	.L55
	movl	-30936(%rbp), %eax
	testl	%eax, %eax
	je	.L55
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
	jmp	.L47
.L51:
	nop
	jmp	.L48
.L52:
	nop
	jmp	.L48
.L53:
	nop
	jmp	.L48
.L55:
	nop
.L48:
	movl	-31192(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	20(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$0, %eax
.L49:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L50
	call	__stack_chk_fail@PLT
.L50:
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
