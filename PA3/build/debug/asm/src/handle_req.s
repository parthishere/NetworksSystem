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
	.string	"all links[total_links] %s\n"
.LC35:
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
	pushq	%rbx
	leaq	-28672(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$2600, %rsp
	.cfi_offset 3, -24
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
.L67:
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30928(%rbp), %rax
	movq	%rax, -31192(%rbp)
	movl	$0, -31264(%rbp)
	jmp	.L12
.L13:
	movq	-31192(%rbp), %rax
	movl	-31264(%rbp), %edx
	movq	$0, (%rax,%rdx,8)
	addl	$1, -31264(%rbp)
.L12:
	cmpl	$15, -31264(%rbp)
	jbe	.L13
	movl	20(%rbp), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	movl	%eax, %esi
	movslq	%esi, %rax
	movq	-30928(%rbp,%rax,8), %rax
	movl	20(%rbp), %edx
	andl	$63, %edx
	movl	$1, %edi
	movl	%edx, %ecx
	salq	%cl, %rdi
	movq	%rdi, %rdx
	orq	%rax, %rdx
	movslq	%esi, %rax
	movq	%rdx, -30928(%rbp,%rax,8)
	movq	$2, -31120(%rbp)
	movq	$0, -31112(%rbp)
	movl	20(%rbp), %eax
	leal	1(%rax), %edi
	leaq	-31120(%rbp), %rdx
	leaq	-30928(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	call	select@PLT
	movl	%eax, -31240(%rbp)
	cmpl	$0, -31240(%rbp)
	jns	.L14
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	jmp	.L65
.L14:
	cmpl	$0, -31240(%rbp)
	jne	.L16
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L65
.L16:
	movl	20(%rbp), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	cltq
	movq	-30928(%rbp,%rax,8), %rdx
	movl	20(%rbp), %eax
	andl	$63, %eax
	movl	$1, %esi
	movl	%eax, %ecx
	salq	%cl, %rsi
	movq	%rsi, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L67
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	20(%rbp), %eax
	leaq	-30752(%rbp), %rsi
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	movl	%eax, -31236(%rbp)
	cmpl	$0, -31236(%rbp)
	jns	.L18
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$0, %eax
	jmp	.L68
.L18:
	leaq	-31056(%rbp), %rax
	movl	$120, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-31056(%rbp), %rdx
	leaq	-30752(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	parse_request_line_thread_safe@PLT
	testl	%eax, %eax
	jns	.L20
	leaq	.LC10(%rip), %rax
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
	jns	.L70
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
	movq	-31032(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	is_blocked@PLT
	testl	%eax, %eax
	je	.L24
	leaq	.LC12(%rip), %rax
	movq	%rax, -31136(%rbp)
	movq	-31136(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movl	20(%rbp), %eax
	movq	-31136(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L71
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
	movq	-31040(%rbp), %rax
	leaq	-30752(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	is_dynamic_content
	movl	%eax, %esi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	$0, -31208(%rbp)
	movl	$0, -31260(%rbp)
	movq	-31040(%rbp), %rdx
	movq	-31032(%rbp), %rax
	movl	$60, %ecx
	movq	%rax, %rsi
	movl	$0, %edi
	call	cache_lookup@PLT
	movl	%eax, -31268(%rbp)
	cmpl	$0, -31268(%rbp)
	js	.L26
	movq	-31040(%rbp), %rax
	leaq	-30752(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	is_dynamic_content
	testl	%eax, %eax
	je	.L27
.L26:
	leaq	-31104(%rbp), %rax
	movl	$48, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	$0, -31100(%rbp)
	movl	$1, -31096(%rbp)
	movq	-31024(%rbp), %rax
	testq	%rax, %rax
	jne	.L28
	leaq	.LC14(%rip), %rax
	movq	%rax, -31024(%rbp)
.L28:
	movq	-31024(%rbp), %rax
	leaq	.LC15(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L29
	movq	-31032(%rbp), %rax
	leaq	.LC16(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L30
	movq	-31032(%rbp), %rax
	leaq	.LC17(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L29
.L30:
	leaq	.LC18(%rip), %rax
	movq	%rax, -31176(%rbp)
	movq	-31176(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movl	20(%rbp), %eax
	movq	-31176(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L72
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
	movq	-31024(%rbp), %rsi
	movq	-31032(%rbp), %rax
	leaq	-31224(%rbp), %rcx
	leaq	-31104(%rbp), %rdx
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
	jns	.L73
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
	movq	-31224(%rbp), %rax
	movq	%rax, -31200(%rbp)
	jmp	.L36
.L41:
	movq	-31200(%rbp), %rax
	movl	12(%rax), %edx
	movq	-31200(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-31200(%rbp), %rax
	movl	4(%rax), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	socket@PLT
	movl	%eax, -31256(%rbp)
	cmpl	$0, -31256(%rbp)
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
	movq	-31200(%rbp), %rax
	movl	16(%rax), %edx
	movq	-31200(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	movl	-31256(%rbp), %eax
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
	movl	-31256(%rbp), %eax
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
	movq	-31200(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -31200(%rbp)
.L36:
	cmpq	$0, -31200(%rbp)
	jne	.L41
.L40:
	cmpq	$0, -31200(%rbp)
	jne	.L42
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$50, %edx
	movl	$1, %esi
	leaq	.LC25(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	-31256(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$1, %edi
	call	exit@PLT
.L42:
	movq	-31200(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	get_in_addr
	movq	%rax, %rsi
	movq	-31200(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30800(%rbp), %rdx
	movl	$46, %ecx
	movl	%eax, %edi
	call	inet_ntop@PLT
	leaq	-30800(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-31224(%rbp), %rax
	movq	%rax, %rdi
	call	freeaddrinfo@PLT
	movl	-30968(%rbp), %eax
	testl	%eax, %eax
	je	.L43
	leaq	.LC27(%rip), %rax
	jmp	.L44
.L43:
	leaq	.LC28(%rip), %rax
.L44:
	movq	%rax, -31168(%rbp)
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-30944(%rbp), %rsi
	movq	-31032(%rbp), %rcx
	movq	-31040(%rbp), %rdx
	leaq	-31216(%rbp), %rax
	movq	%rsi, %r8
	leaq	.LC30(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	movq	-31216(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC31(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-31216(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-31216(%rbp), %rsi
	movl	-31256(%rbp), %eax
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
	movl	-31256(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$1, %edi
	call	exit@PLT
.L45:
	movq	-31040(%rbp), %rdx
	movq	-31032(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	cache_add_new@PLT
	movl	%eax, -31232(%rbp)
.L52:
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30752(%rbp), %rsi
	movl	-31256(%rbp), %eax
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	movl	%eax, -31228(%rbp)
	cmpl	$0, -31228(%rbp)
	jg	.L46
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$37, %edx
	movl	$1, %esi
	leaq	.LC33(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	-31256(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	-31232(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L47
.L46:
	movl	-31228(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-30752(%rbp), %rcx
	movl	-31232(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movl	$0, -31272(%rbp)
	leaq	-31272(%rbp), %rdx
	leaq	-30752(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	extract_links@PLT
	movq	%rax, -31160(%rbp)
	movl	-31272(%rbp), %eax
	testl	%eax, %eax
	jle	.L48
	cmpq	$0, -31160(%rbp)
	je	.L48
	movl	-31272(%rbp), %edx
	movl	-31260(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-31208(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, -31208(%rbp)
	movl	$0, -31252(%rbp)
	jmp	.L49
.L50:
	movl	-31252(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-31160(%rbp), %rax
	addq	%rdx, %rax
	movl	-31260(%rbp), %ecx
	movl	-31252(%rbp), %edx
	addl	%ecx, %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-31208(%rbp), %rdx
	addq	%rcx, %rdx
	movq	(%rax), %rax
	movq	%rax, (%rdx)
	movl	-31260(%rbp), %edx
	movl	-31252(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-31208(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC34(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -31252(%rbp)
.L49:
	movl	-31272(%rbp), %eax
	cmpl	%eax, -31252(%rbp)
	jl	.L50
	movl	-31272(%rbp), %eax
	addl	%eax, -31260(%rbp)
	movq	-31160(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L48:
	movl	-31228(%rbp), %eax
	movslq	%eax, %rdx
	movl	20(%rbp), %eax
	leaq	-30752(%rbp), %rsi
	movl	$16384, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L52
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC11(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	-31256(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L52
.L32:
	jmp	.L65
.L27:
	leaq	.LC35(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L59:
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30752(%rbp), %rcx
	movl	-31268(%rbp), %eax
	movl	$30720, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	movl	%eax, -31236(%rbp)
	cmpl	$0, -31236(%rbp)
	jle	.L74
	movl	$0, -31104(%rbp)
	leaq	-31104(%rbp), %rdx
	leaq	-30752(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	extract_links@PLT
	movq	%rax, -31184(%rbp)
	movl	-31104(%rbp), %eax
	testl	%eax, %eax
	jle	.L55
	cmpq	$0, -31184(%rbp)
	je	.L55
	movl	-31104(%rbp), %edx
	movl	-31260(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-31208(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, -31208(%rbp)
	movl	$0, -31248(%rbp)
	jmp	.L56
.L57:
	movl	-31248(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-31184(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-31260(%rbp), %ecx
	movl	-31248(%rbp), %edx
	addl	%ecx, %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-31208(%rbp), %rdx
	leaq	(%rcx,%rdx), %rbx
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, (%rbx)
	addl	$1, -31248(%rbp)
.L56:
	movl	-31104(%rbp), %eax
	cmpl	%eax, -31248(%rbp)
	jl	.L57
	movl	-31104(%rbp), %eax
	addl	%eax, -31260(%rbp)
	movq	-31184(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L55:
	movl	-31236(%rbp), %eax
	movslq	%eax, %rdx
	movl	20(%rbp), %eax
	leaq	-30752(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L59
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
	jmp	.L47
.L74:
	nop
.L47:
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -31144(%rbp)
	movl	-31260(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	movq	-31144(%rbp), %rax
	movq	%rdx, 8(%rax)
	movl	$0, -31244(%rbp)
	jmp	.L60
.L61:
	movl	-31244(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-31208(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	-31144(%rbp), %rdx
	movq	8(%rdx), %rdx
	movl	-31244(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	leaq	(%rdx,%rcx), %rbx
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, (%rbx)
	addl	$1, -31244(%rbp)
.L60:
	movl	-31244(%rbp), %eax
	cmpl	-31260(%rbp), %eax
	jl	.L61
	movq	-31144(%rbp), %rax
	movl	-31260(%rbp), %edx
	movl	%edx, (%rax)
	movq	-31040(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	movq	-31144(%rbp), %rax
	movq	%rdx, 16(%rax)
	cmpq	$0, -31208(%rbp)
	je	.L62
	movq	-31144(%rbp), %rdx
	leaq	-31104(%rbp), %rax
	movq	%rdx, %rcx
	movq	prefetch_thread_func@GOTPCREL(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	movq	-31104(%rbp), %rax
	movq	%rax, %rdi
	call	pthread_detach@PLT
.L62:
	movq	-31208(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	-31268(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	-30964(%rbp), %eax
	cmpl	$1, %eax
	je	.L75
	movl	-30968(%rbp), %eax
	testl	%eax, %eax
	je	.L75
	leaq	-31056(%rbp), %rax
	movl	$120, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	jmp	.L67
.L71:
	nop
.L22:
	jmp	.L65
.L70:
	nop
	jmp	.L65
.L72:
	nop
	jmp	.L65
.L73:
	nop
	jmp	.L65
.L75:
	nop
.L65:
	movl	-31268(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	20(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$0, %eax
.L68:
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L69
	call	__stack_chk_fail@PLT
.L69:
	movq	-8(%rbp), %rbx
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
