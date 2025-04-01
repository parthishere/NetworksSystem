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
	.section	.rodata
.LC0:
	.string	"Cache-Control: no-cache"
.LC1:
	.string	"Cache-Control: no-store"
.LC2:
	.string	"Pragma: no-cache"
.LC3:
	.string	"Content-Type:"
.LC4:
	.string	"application/json"
.LC5:
	.string	"text/javascript"
.LC6:
	.string	"application/xml"
	.text
	.globl	is_dynamic_content
	.type	is_dynamic_content, @function
is_dynamic_content:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	leaq	.LC0(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	testq	%rax, %rax
	jne	.L5
	movq	-32(%rbp), %rax
	leaq	.LC1(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	testq	%rax, %rax
	jne	.L5
	movq	-32(%rbp), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	testq	%rax, %rax
	je	.L6
.L5:
	movl	$1, %eax
	jmp	.L7
.L6:
	movq	-32(%rbp), %rax
	leaq	.LC3(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L8
	movq	-8(%rbp), %rax
	leaq	.LC4(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	testq	%rax, %rax
	jne	.L9
	movq	-8(%rbp), %rax
	leaq	.LC5(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	testq	%rax, %rax
	jne	.L9
	movq	-8(%rbp), %rax
	leaq	.LC6(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	testq	%rax, %rax
	je	.L8
.L9:
	movl	$1, %eax
	jmp	.L7
.L8:
	movq	-24(%rbp), %rax
	movl	$63, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	testq	%rax, %rax
	je	.L10
	movl	$1, %eax
	jmp	.L7
.L10:
	movl	$0, %eax
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	is_dynamic_content, .-is_dynamic_content
	.section	.rodata
.LC7:
	.string	"\033[31mselect error"
	.align 8
.LC8:
	.string	"\033[33m[-] (%d) Connection timed out\n\033[0m"
.LC9:
	.string	"\033[31m[-] read"
	.align 8
.LC10:
	.string	"HTTP/1.0 404 Not Found\n\rContent-Type: text/plain\n\r\n\rSomthing went wrong"
	.align 8
.LC11:
	.string	"\033[31m[-] send-server failed for server %d\n\033[0m"
	.align 8
.LC12:
	.string	"HTTP/1.0 403 Forbidden\n\rContent-Type: text/plain\n\r\n\rBlocked"
.LC13:
	.string	"is dynamic content %d\n\r"
.LC14:
	.string	"80"
.LC15:
	.string	"8080"
.LC16:
	.string	"localhost"
.LC17:
	.string	"127.0.1.1"
	.align 8
.LC18:
	.string	"HTTP/1.0 404 Not Found\r\nContent-Type: text/plain\n\r\n\r cannot req proxy"
.LC19:
	.string	"\033[31mgetaddrinfo\n\033[0m"
	.align 8
.LC20:
	.string	"\033[32m[+] getaddrinfo call successful\n\033[0m"
.LC21:
	.string	"\033[31mserver: socket"
	.align 8
.LC22:
	.string	"\033[32m[+] socket call successful\n\033[0m"
	.align 8
.LC23:
	.string	"\033[31m[-] connect failed for server %d\n\033[0m"
	.align 8
.LC24:
	.string	"\033[32m[+] connect call successful\n\033[0m"
	.align 8
.LC25:
	.string	"\033[31m[-] socket connection failed for server \n\033[0m"
.LC26:
	.string	"client: connecting to %s\n"
.LC27:
	.string	"Connection: Keep-alive"
.LC28:
	.string	"Connection: close"
.LC29:
	.string	"waiting for send ?? "
	.align 8
.LC30:
	.string	"GET %s HTTP/1.0\r\nHost: %s\r\n%s\r\n"
.LC31:
	.string	"header -> %s"
	.align 8
.LC32:
	.string	"\033[31m[-] send failed for server %d \n\033[0m"
	.align 8
.LC33:
	.string	"\033[31m[-] recv failed for server \n\033[0m"
.LC34:
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
	subq	$2560, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.L59:
	leaq	-30736(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30912(%rbp), %rax
	movq	%rax, -31160(%rbp)
	movl	$0, -31212(%rbp)
	jmp	.L12
.L13:
	movq	-31160(%rbp), %rax
	movl	-31212(%rbp), %edx
	movq	$0, (%rax,%rdx,8)
	addl	$1, -31212(%rbp)
.L12:
	cmpl	$15, -31212(%rbp)
	jbe	.L13
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
	movq	$2, -31104(%rbp)
	movq	$0, -31096(%rbp)
	movl	20(%rbp), %eax
	leal	1(%rax), %edi
	leaq	-31104(%rbp), %rdx
	leaq	-30912(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	call	select@PLT
	movl	%eax, -31200(%rbp)
	cmpl	$0, -31200(%rbp)
	jns	.L14
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	jmp	.L57
.L14:
	cmpl	$0, -31200(%rbp)
	jne	.L16
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L57
.L16:
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
	je	.L59
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
	movl	%eax, -31196(%rbp)
	cmpl	$0, -31196(%rbp)
	jns	.L18
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$0, %eax
	jmp	.L60
.L18:
	leaq	-31040(%rbp), %rax
	movl	$120, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-31040(%rbp), %rdx
	leaq	-30736(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	parse_request_line_thread_safe@PLT
	testl	%eax, %eax
	jns	.L20
	leaq	.LC10(%rip), %rax
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
	jns	.L63
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC11(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	20(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L22
.L20:
	movq	-31016(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	is_blocked@PLT
	testl	%eax, %eax
	je	.L24
	leaq	.LC12(%rip), %rax
	movq	%rax, -31120(%rbp)
	movq	-31120(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movl	20(%rbp), %eax
	movq	-31120(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L64
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC11(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	20(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L22
.L24:
	movq	-31024(%rbp), %rax
	leaq	-30736(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	is_dynamic_content
	movl	%eax, %esi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-31024(%rbp), %rdx
	movq	-31016(%rbp), %rax
	movl	$60, %ecx
	movq	%rax, %rsi
	movl	$0, %edi
	call	cache_lookup@PLT
	movl	%eax, -31216(%rbp)
	cmpl	$0, -31216(%rbp)
	js	.L26
	movq	-31024(%rbp), %rax
	leaq	-30736(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	is_dynamic_content
	testl	%eax, %eax
	je	.L27
.L26:
	leaq	-31088(%rbp), %rax
	movl	$48, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	$0, -31084(%rbp)
	movl	$1, -31080(%rbp)
	movq	-31008(%rbp), %rax
	testq	%rax, %rax
	jne	.L28
	leaq	.LC14(%rip), %rax
	movq	%rax, -31008(%rbp)
.L28:
	movq	-31008(%rbp), %rax
	leaq	.LC15(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L29
	movq	-31016(%rbp), %rax
	leaq	.LC16(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L30
	movq	-31016(%rbp), %rax
	leaq	.LC17(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L29
.L30:
	leaq	.LC18(%rip), %rax
	movq	%rax, -31152(%rbp)
	movq	-31152(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movl	20(%rbp), %eax
	movq	-31152(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L65
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC11(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	20(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L32
.L29:
	movq	-31008(%rbp), %rsi
	movq	-31016(%rbp), %rax
	leaq	-31184(%rbp), %rcx
	leaq	-31088(%rbp), %rdx
	movq	%rax, %rdi
	call	getaddrinfo@PLT
	testl	%eax, %eax
	jns	.L34
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	leaq	.LC12(%rip), %rax
	movq	%rax, -31128(%rbp)
	movq	-31128(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movl	20(%rbp), %eax
	movq	-31128(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L66
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC11(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	20(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L32
.L34:
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-31184(%rbp), %rax
	movq	%rax, -31168(%rbp)
	jmp	.L36
.L41:
	movq	-31168(%rbp), %rax
	movl	12(%rax), %edx
	movq	-31168(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-31168(%rbp), %rax
	movl	4(%rax), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	socket@PLT
	movl	%eax, -31204(%rbp)
	cmpl	$0, -31204(%rbp)
	jns	.L37
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	jmp	.L38
.L37:
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-31168(%rbp), %rax
	movl	16(%rax), %edx
	movq	-31168(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	movl	-31204(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	connect@PLT
	testl	%eax, %eax
	jns	.L39
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC23(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	-31204(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L38
.L39:
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L40
.L38:
	movq	-31168(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -31168(%rbp)
.L36:
	cmpq	$0, -31168(%rbp)
	jne	.L41
.L40:
	cmpq	$0, -31168(%rbp)
	jne	.L42
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$50, %edx
	movl	$1, %esi
	leaq	.LC25(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	-31204(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$1, %edi
	call	exit@PLT
.L42:
	movq	-31168(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	get_in_addr
	movq	%rax, %rsi
	movq	-31168(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30784(%rbp), %rdx
	movl	$46, %ecx
	movl	%eax, %edi
	call	inet_ntop@PLT
	leaq	-30784(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-31184(%rbp), %rax
	movq	%rax, %rdi
	call	freeaddrinfo@PLT
	movl	-30952(%rbp), %eax
	testl	%eax, %eax
	je	.L43
	leaq	.LC27(%rip), %rax
	jmp	.L44
.L43:
	leaq	.LC28(%rip), %rax
.L44:
	movq	%rax, -31144(%rbp)
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-30928(%rbp), %rsi
	movq	-31016(%rbp), %rcx
	movq	-31024(%rbp), %rdx
	leaq	-31176(%rbp), %rax
	movq	%rsi, %r8
	leaq	.LC30(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	movq	-31176(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC31(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-31176(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-31176(%rbp), %rsi
	movl	-31204(%rbp), %eax
	movl	$16384, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L45
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC32(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	-31204(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$1, %edi
	call	exit@PLT
.L45:
	movq	-31024(%rbp), %rdx
	movq	-31016(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	cache_add_new@PLT
	movl	%eax, -31192(%rbp)
.L49:
	leaq	-30736(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30736(%rbp), %rsi
	movl	-31204(%rbp), %eax
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	movl	%eax, -31188(%rbp)
	cmpl	$0, -31188(%rbp)
	jg	.L46
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$37, %edx
	movl	$1, %esi
	leaq	.LC33(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	-31204(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	nop
	movl	-31192(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L62
.L46:
	movl	-31188(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-30736(%rbp), %rcx
	movl	-31192(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	leaq	-31220(%rbp), %rdx
	leaq	-30736(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	extract_links@PLT
	movq	%rax, -31136(%rbp)
	movl	-31220(%rbp), %eax
	addl	%eax, -31208(%rbp)
	movl	-31220(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	%rax, -31136(%rbp)
	movl	-31188(%rbp), %eax
	movslq	%eax, %rdx
	movl	20(%rbp), %eax
	leaq	-30736(%rbp), %rsi
	movl	$16384, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L49
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC11(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	-31204(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L49
.L32:
	jmp	.L57
.L27:
	leaq	.LC34(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L54:
	leaq	-30736(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30736(%rbp), %rcx
	movl	-31216(%rbp), %eax
	movl	$30720, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	movl	%eax, -31196(%rbp)
	cmpl	$0, -31196(%rbp)
	jle	.L67
	movl	-31196(%rbp), %eax
	movslq	%eax, %rdx
	movl	20(%rbp), %eax
	leaq	-30736(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L54
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC11(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	20(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L52
.L67:
	nop
.L52:
	movl	-31216(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
.L62:
	movl	-30948(%rbp), %eax
	cmpl	$1, %eax
	je	.L68
	movl	-30952(%rbp), %eax
	testl	%eax, %eax
	je	.L68
	leaq	-31040(%rbp), %rax
	movl	$120, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30736(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	jmp	.L59
.L64:
	nop
.L22:
	jmp	.L57
.L63:
	nop
	jmp	.L57
.L65:
	nop
	jmp	.L57
.L66:
	nop
	jmp	.L57
.L68:
	nop
.L57:
	movl	-31216(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	20(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$0, %eax
.L60:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L61
	call	__stack_chk_fail@PLT
.L61:
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
