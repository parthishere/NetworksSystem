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
	cmpq	$0, -32(%rbp)
	je	.L5
	movq	-32(%rbp), %rax
	leaq	.LC0(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	testq	%rax, %rax
	jne	.L6
	movq	-32(%rbp), %rax
	leaq	.LC1(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	testq	%rax, %rax
	jne	.L6
	movq	-32(%rbp), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	testq	%rax, %rax
	je	.L7
.L6:
	movl	$1, %eax
	jmp	.L8
.L7:
	movq	-32(%rbp), %rax
	leaq	.LC3(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L5
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
	je	.L5
.L9:
	movl	$1, %eax
	jmp	.L8
.L5:
	movq	-24(%rbp), %rax
	movl	$63, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	testq	%rax, %rax
	je	.L10
	movl	$1, %eax
	jmp	.L8
.L10:
	movl	$0, %eax
.L8:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	is_dynamic_content, .-is_dynamic_content
	.globl	prefetch_thread_create
	.type	prefetch_thread_create, @function
prefetch_thread_create:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -56(%rbp)
	movl	%esi, -60(%rbp)
	movq	%rdx, -72(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	$40, %edi
	call	malloc@PLT
	movq	%rax, -32(%rbp)
	movl	-60(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, 8(%rax)
	movl	$168, %edi
	call	malloc@PLT
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, 32(%rax)
	movq	-32(%rbp), %rax
	movq	32(%rax), %rax
	movq	-56(%rbp), %rcx
	movl	$168, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	movq	-32(%rbp), %rax
	movq	32(%rax), %rax
	movl	$-1, 4(%rax)
	movl	$0, -44(%rbp)
	jmp	.L12
.L13:
	movl	-44(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	8(%rdx), %rdx
	movl	-44(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	leaq	(%rdx,%rcx), %rbx
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, (%rbx)
	addl	$1, -44(%rbp)
.L12:
	movl	-44(%rbp), %eax
	cmpl	-60(%rbp), %eax
	jl	.L13
	movq	-32(%rbp), %rax
	movl	-60(%rbp), %edx
	movl	%edx, (%rax)
	movq	-80(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-80(%rbp), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	je	.L14
	movq	-80(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	jmp	.L15
.L14:
	movl	$0, %edx
.L15:
	movq	-32(%rbp), %rax
	movq	%rdx, 24(%rax)
	movq	-32(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movq	%rdx, %rcx
	movq	prefetch_thread_func@GOTPCREL(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	pthread_detach@PLT
	nop
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L16
	call	__stack_chk_fail@PLT
.L16:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	prefetch_thread_create, .-prefetch_thread_create
	.section	.rodata
	.align 8
.LC7:
	.string	"\033[35m\n===============================================================\n[+] (%d) Prefetching *not* Cached uri: %s%s\n===============================================================\n\033[0m"
.LC8:
	.string	"80"
	.align 8
.LC9:
	.string	"\033[33m\n[+] (%d) Requesting file from server: %s:%s%s\n\033[0m"
.LC10:
	.string	"8080"
.LC11:
	.string	"localhost"
.LC12:
	.string	"127.0.1.1"
	.align 8
.LC13:
	.string	"HTTP/1.0 404 Not Found\r\nContent-Type: text/plain\r\n\r\n cannot req proxy"
	.align 8
.LC14:
	.string	"\033[31m[-] send-server failed for server %d\n\033[0m"
	.align 8
.LC15:
	.string	"header ->hostname %s hostname port str %s\n"
.LC16:
	.string	"\033[31mgetaddrinfo\n\033[0m"
	.align 8
.LC17:
	.string	"HTTP/1.0 403 Forbidden\r\nContent-Type: text/plain\r\n\r\nBlocked"
	.align 8
.LC18:
	.string	"\033[31m[-] (%d) send-server failed for server %d\n\033[0m"
.LC19:
	.string	"[+] getaddrinfo, "
.LC20:
	.string	"\033[31mserver: socket"
.LC21:
	.string	"[+] socket,  "
	.align 8
.LC22:
	.string	"\033[31m\n[-] (%d) connect failed for server %d\n\033[0m"
.LC23:
	.string	"[+] connect,  sucessefull "
	.align 8
.LC24:
	.string	"HTTP/1.0 403 Forbidden\r\nContent-Type: text/plain\r\n\r\nConnect Failed"
	.align 8
.LC25:
	.string	"\033[35m\n[+] (%d) Connection established to server: %s\n[+] Server IP address: %s:%s\n---------------------------------------------------------------\n\033[0m"
.LC26:
	.string	"Connection: Keep-alive"
.LC27:
	.string	"Connection: close"
	.align 8
.LC28:
	.string	"GET %s HTTP/1.0\r\nHost: %s\r\n%s\r\n"
.LC29:
	.string	"GET %s HTTP/1.0\r\nHost: %s\r\r\n\n"
	.align 8
.LC30:
	.string	"\033[31m[-] (%d) send failed for server %d \n\033[0m"
	.align 8
.LC31:
	.string	"\033[31m[-] (%d) Memory allocation failed for links array (requested %zu bytes)\n\033[0m"
	.text
	.globl	if_not_cached
	.type	if_not_cached, @function
if_not_cached:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	leaq	-28672(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$2312, %rsp
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	movq	%rdi, -30984(%rbp)
	movq	%rsi, -30992(%rbp)
	movl	%edx, -30996(%rbp)
	movl	%ecx, -31000(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -40(%rbp)
	xorl	%eax, %eax
	cmpl	$0, -31000(%rbp)
	jne	.L18
	movq	-30984(%rbp), %rax
	movq	16(%rax), %r12
	movq	-30984(%rbp), %rax
	movq	24(%rax), %rbx
	call	gettid@PLT
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L18:
	movl	$0, -30956(%rbp)
	movq	$0, -30912(%rbp)
	movq	-30984(%rbp), %rax
	movq	16(%rax), %r13
	movq	-30984(%rbp), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	je	.L19
	movq	-30984(%rbp), %rax
	movq	32(%rax), %rbx
	jmp	.L20
.L19:
	leaq	.LC8(%rip), %rbx
.L20:
	movq	-30984(%rbp), %rax
	movq	24(%rax), %r12
	call	gettid@PLT
	movq	%r13, %r8
	movq	%rbx, %rcx
	movq	%r12, %rdx
	movl	%eax, %esi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-30864(%rbp), %rax
	movl	$48, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	$0, -30860(%rbp)
	movl	$1, -30856(%rbp)
	movq	-30984(%rbp), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	je	.L21
	movq	-30984(%rbp), %rax
	movq	32(%rax), %rax
	leaq	.LC10(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L21
	movq	-30984(%rbp), %rax
	movq	24(%rax), %rax
	leaq	.LC11(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L22
	movq	-30984(%rbp), %rax
	movq	24(%rax), %rax
	leaq	.LC12(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L21
.L22:
	cmpl	$0, -30996(%rbp)
	je	.L21
	movq	-30992(%rbp), %rax
	movl	4(%rax), %eax
	testl	%eax, %eax
	jle	.L21
	leaq	.LC13(%rip), %rax
	movq	%rax, -30904(%rbp)
	movq	-30904(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-30992(%rbp), %rax
	movl	4(%rax), %eax
	movq	-30904(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L23
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC14(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L23:
	movl	$-1, %eax
	jmp	.L54
.L21:
	movq	-30984(%rbp), %rax
	movq	32(%rax), %rdx
	movq	-30984(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-30984(%rbp), %rax
	movq	32(%rax), %rsi
	movq	-30984(%rbp), %rax
	movq	24(%rax), %rax
	leaq	-30936(%rbp), %rcx
	leaq	-30864(%rbp), %rdx
	movq	%rax, %rdi
	call	getaddrinfo@PLT
	testl	%eax, %eax
	jns	.L25
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movq	-30992(%rbp), %rax
	movl	4(%rax), %eax
	testl	%eax, %eax
	jle	.L26
	cmpl	$0, -30996(%rbp)
	je	.L26
	leaq	.LC17(%rip), %rax
	movq	%rax, -30872(%rbp)
	movq	-30872(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-30992(%rbp), %rax
	movl	4(%rax), %eax
	movq	-30872(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L26
	call	__errno_location@PLT
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC18(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L26:
	movl	$-1, %eax
	jmp	.L54
.L25:
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-30936(%rbp), %rax
	movq	%rax, -30920(%rbp)
	jmp	.L27
.L32:
	movq	-30920(%rbp), %rax
	movl	12(%rax), %edx
	movq	-30920(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-30920(%rbp), %rax
	movl	4(%rax), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	socket@PLT
	movl	%eax, -30960(%rbp)
	cmpl	$0, -30960(%rbp)
	jns	.L28
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	jmp	.L29
.L28:
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-30920(%rbp), %rax
	movl	16(%rax), %edx
	movq	-30920(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	movl	-30960(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	connect@PLT
	testl	%eax, %eax
	jns	.L30
	call	__errno_location@PLT
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC22(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	-30960(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L29
.L30:
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L31
.L29:
	movq	-30920(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -30920(%rbp)
.L27:
	cmpq	$0, -30920(%rbp)
	jne	.L32
.L31:
	cmpq	$0, -30920(%rbp)
	jne	.L33
	movq	-30992(%rbp), %rax
	movl	4(%rax), %eax
	testl	%eax, %eax
	jle	.L34
	cmpl	$0, -30996(%rbp)
	je	.L34
	leaq	.LC24(%rip), %rax
	movq	%rax, -30880(%rbp)
	movq	-30880(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-30992(%rbp), %rax
	movl	4(%rax), %eax
	movq	-30880(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L34
	call	__errno_location@PLT
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC18(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L34:
	movl	-30960(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$-1, %eax
	jmp	.L54
.L33:
	movq	-30920(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	get_in_addr
	movq	%rax, %rsi
	movq	-30920(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30816(%rbp), %rdx
	movl	$46, %ecx
	movl	%eax, %edi
	call	inet_ntop@PLT
	movq	-30984(%rbp), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	je	.L35
	movq	-30984(%rbp), %rax
	movq	32(%rax), %rbx
	jmp	.L36
.L35:
	leaq	.LC8(%rip), %rbx
.L36:
	movq	-30984(%rbp), %rax
	movq	24(%rax), %r12
	call	gettid@PLT
	movl	%eax, %esi
	leaq	-30816(%rbp), %rax
	movq	%rbx, %r8
	movq	%rax, %rcx
	movq	%r12, %rdx
	leaq	.LC25(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-30936(%rbp), %rax
	movq	%rax, %rdi
	call	freeaddrinfo@PLT
	movq	-30984(%rbp), %rax
	movl	88(%rax), %eax
	testl	%eax, %eax
	je	.L37
	leaq	.LC26(%rip), %rax
	jmp	.L38
.L37:
	leaq	.LC27(%rip), %rax
.L38:
	movq	%rax, -30896(%rbp)
	movq	-30984(%rbp), %rax
	movq	112(%rax), %rax
	testq	%rax, %rax
	je	.L39
	movq	-30984(%rbp), %rax
	movq	112(%rax), %rsi
	movq	-30984(%rbp), %rax
	movq	24(%rax), %rcx
	movq	-30984(%rbp), %rax
	movq	16(%rax), %rdx
	leaq	-30928(%rbp), %rax
	movq	%rsi, %r8
	leaq	.LC28(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	jmp	.L40
.L39:
	movq	-30984(%rbp), %rax
	movq	24(%rax), %rcx
	movq	-30984(%rbp), %rax
	movq	16(%rax), %rdx
	leaq	-30928(%rbp), %rax
	leaq	.LC29(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
.L40:
	movq	-30928(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-30928(%rbp), %rsi
	movl	-30960(%rbp), %eax
	movl	$16384, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L41
	call	__errno_location@PLT
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC30(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	-30960(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$-1, %eax
	jmp	.L54
.L41:
	movq	-30984(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-30984(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	cache_add_new@PLT
	movl	%eax, -30944(%rbp)
	movq	-30928(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L51:
	leaq	-30768(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30768(%rbp), %rsi
	movl	-30960(%rbp), %eax
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	movl	%eax, -30940(%rbp)
	cmpl	$0, -30940(%rbp)
	jg	.L42
	cmpq	$0, -30912(%rbp)
	jne	.L43
	jmp	.L44
.L42:
	movl	-30940(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-30768(%rbp), %rcx
	movl	-30944(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movl	$0, -30964(%rbp)
	leaq	-30964(%rbp), %rdx
	leaq	-30768(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	extract_links@PLT
	movq	%rax, -30888(%rbp)
	movl	-30964(%rbp), %eax
	testl	%eax, %eax
	jle	.L45
	cmpq	$0, -30888(%rbp)
	je	.L45
	movl	-30964(%rbp), %edx
	movl	-30956(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30912(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, -30912(%rbp)
	cmpq	$0, -30912(%rbp)
	jne	.L46
	movl	-30964(%rbp), %edx
	movl	-30956(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rbx
	call	gettid@PLT
	movl	%eax, %edx
	movq	stderr(%rip), %rax
	movq	%rbx, %rcx
	leaq	.LC31(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-30888(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$-1, %eax
	jmp	.L54
.L46:
	movl	$0, -30952(%rbp)
	jmp	.L48
.L49:
	movl	-30952(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30888(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-30956(%rbp), %ecx
	movl	-30952(%rbp), %edx
	addl	%ecx, %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-30912(%rbp), %rdx
	leaq	(%rcx,%rdx), %rbx
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, (%rbx)
	addl	$1, -30952(%rbp)
.L48:
	movl	-30964(%rbp), %eax
	cmpl	%eax, -30952(%rbp)
	jl	.L49
	movl	-30964(%rbp), %eax
	addl	%eax, -30956(%rbp)
	movq	-30888(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L45:
	cmpl	$0, -30996(%rbp)
	je	.L51
	movq	-30992(%rbp), %rax
	movl	4(%rax), %eax
	testl	%eax, %eax
	jle	.L51
	movl	-30940(%rbp), %eax
	movslq	%eax, %rdx
	movq	-30992(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30768(%rbp), %rsi
	movl	$16384, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L51
	call	__errno_location@PLT
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC18(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	-30944(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	-30960(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$-1, %eax
	jmp	.L54
.L43:
	cmpl	$0, -31000(%rbp)
	je	.L44
	movq	-30984(%rbp), %rcx
	movq	-30912(%rbp), %rdx
	movl	-30956(%rbp), %esi
	movq	-30992(%rbp), %rax
	movq	%rax, %rdi
	call	prefetch_thread_create
	movl	$0, -30948(%rbp)
	jmp	.L52
.L53:
	movl	-30948(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30912(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	addl	$1, -30948(%rbp)
.L52:
	movl	-30948(%rbp), %eax
	cmpl	-30956(%rbp), %eax
	jl	.L53
.L44:
	movq	-30912(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	-30944(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	-30960(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$1, %eax
.L54:
	movq	-40(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L55
	call	__stack_chk_fail@PLT
.L55:
	addq	$30984, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	if_not_cached, .-if_not_cached
	.section	.rodata
	.align 8
.LC32:
	.string	"\033[35m\n===============================================================\n[+] (%d) Prefetching Cached uri: %s%s\n===============================================================\n\033[0m"
	.align 8
.LC33:
	.string	"\033[33m\n[+] (%d) Serving file from cache: %s%s\n[+] Cache file size: %ld bytes\n\033[0m"
	.align 8
.LC34:
	.string	"\033[31m[-] (%d) Memory allocation failed\n\033[0m"
	.text
	.globl	if_cached
	.type	if_cached, @function
if_cached:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	leaq	-28672(%rsp), %r11
.LPSRL1:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL1
	subq	$2144, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -30808(%rbp)
	movq	%rsi, -30816(%rbp)
	movl	%edx, -30820(%rbp)
	movl	%ecx, -30824(%rbp)
	movl	%r8d, -30828(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	cmpl	$0, -30828(%rbp)
	jne	.L57
	movq	-30808(%rbp), %rax
	movq	16(%rax), %r12
	movq	-30808(%rbp), %rax
	movq	24(%rax), %rbx
	call	gettid@PLT
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L57:
	movq	$0, -30776(%rbp)
	movl	$0, -30792(%rbp)
	movl	-30820(%rbp), %eax
	movl	$2, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	lseek@PLT
	testq	%rax, %rax
	jle	.L58
	movl	-30820(%rbp), %eax
	movl	$1, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	lseek@PLT
	jmp	.L59
.L58:
	movl	$0, %eax
.L59:
	movq	%rax, -30768(%rbp)
	movq	-30808(%rbp), %rax
	movq	16(%rax), %r12
	movq	-30808(%rbp), %rax
	movq	24(%rax), %rbx
	call	gettid@PLT
	movq	-30768(%rbp), %rdx
	movq	%rdx, %r8
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC33(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-30820(%rbp), %eax
	movl	$0, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	lseek@PLT
.L69:
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30752(%rbp), %rcx
	movl	-30820(%rbp), %eax
	movl	$30720, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	movl	%eax, -30780(%rbp)
	cmpl	$0, -30780(%rbp)
	jg	.L60
	cmpq	$0, -30776(%rbp)
	jne	.L61
	jmp	.L62
.L60:
	movl	$0, -30796(%rbp)
	leaq	-30796(%rbp), %rdx
	leaq	-30752(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	extract_links@PLT
	movq	%rax, -30760(%rbp)
	movl	-30796(%rbp), %eax
	testl	%eax, %eax
	jle	.L63
	cmpq	$0, -30760(%rbp)
	je	.L63
	movl	-30796(%rbp), %edx
	movl	-30792(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30776(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, -30776(%rbp)
	cmpq	$0, -30776(%rbp)
	jne	.L64
	call	gettid@PLT
	movl	%eax, %edx
	movq	stderr(%rip), %rax
	leaq	.LC34(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-30760(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$-1, %eax
	jmp	.L75
.L64:
	movl	$0, -30788(%rbp)
	jmp	.L66
.L67:
	movl	-30788(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30760(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-30792(%rbp), %ecx
	movl	-30788(%rbp), %edx
	addl	%ecx, %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-30776(%rbp), %rdx
	leaq	(%rcx,%rdx), %rbx
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, (%rbx)
	addl	$1, -30788(%rbp)
.L66:
	movl	-30796(%rbp), %eax
	cmpl	%eax, -30788(%rbp)
	jl	.L67
	movl	-30796(%rbp), %eax
	addl	%eax, -30792(%rbp)
	movq	-30760(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L63:
	cmpl	$0, -30824(%rbp)
	je	.L69
	movq	-30816(%rbp), %rax
	movl	4(%rax), %eax
	testl	%eax, %eax
	jle	.L69
	movl	-30780(%rbp), %eax
	movslq	%eax, %rdx
	movq	-30816(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30752(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L69
	call	__errno_location@PLT
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC18(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$-1, %eax
	jmp	.L75
.L61:
	cmpl	$0, -30828(%rbp)
	je	.L62
	movq	-30808(%rbp), %rcx
	movq	-30776(%rbp), %rdx
	movl	-30792(%rbp), %esi
	movq	-30816(%rbp), %rax
	movq	%rax, %rdi
	call	prefetch_thread_create
.L62:
	cmpq	$0, -30776(%rbp)
	je	.L71
	movl	$0, -30784(%rbp)
	jmp	.L72
.L74:
	movl	-30784(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30776(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L73
	movl	-30784(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30776(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L73:
	addl	$1, -30784(%rbp)
.L72:
	movl	-30784(%rbp), %eax
	cmpl	-30792(%rbp), %eax
	jl	.L74
	movq	-30776(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L71:
	movl	-30820(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$0, %eax
.L75:
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L76
	call	__stack_chk_fail@PLT
.L76:
	addq	$30816, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	if_cached, .-if_cached
	.globl	check_and_send_from_cache
	.type	check_and_send_from_cache, @function
check_and_send_from_cache:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movl	%ecx, -40(%rbp)
	movl	%r8d, -44(%rbp)
	movq	-32(%rbp), %rax
	movl	156(%rax), %eax
	movslq	%eax, %rcx
	movq	-24(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	cache_lookup@PLT
	movl	%eax, -8(%rbp)
	cmpl	$0, -8(%rbp)
	js	.L78
	cmpl	$0, -36(%rbp)
	je	.L79
.L78:
	movl	-44(%rbp), %ecx
	movl	-40(%rbp), %edx
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	if_not_cached
	movl	%eax, -4(%rbp)
	jmp	.L80
.L79:
	movl	-44(%rbp), %edi
	movl	-40(%rbp), %ecx
	movl	-8(%rbp), %edx
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rax
	movl	%edi, %r8d
	movq	%rax, %rdi
	call	if_cached
	movl	%eax, -4(%rbp)
	nop
.L80:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	check_and_send_from_cache, .-check_and_send_from_cache
	.section	.rodata
	.align 8
.LC35:
	.string	"\033[31m[-] (%d) Select syscall failed with error: %d (%s)\n\033[0m"
	.align 8
.LC36:
	.string	"\033[33m\n[-] (%d) CONNECTION TIMEOUT:\n[-] Client connection idle for %d seconds\n------------------------------------------------------------\n\033[0m"
	.align 8
.LC37:
	.string	"\n==============================================================\n[+] (%d) Received request from client [%d bytes]:\n==============================================================\n%s\n--------------------------------------------------------------\n"
	.align 8
.LC38:
	.string	"\033[31m\n[-] (%d) HTTP Parsing Error:\n[-] Error code: 0x%02X\n------------------------------------------------------------\n\033[0m"
	.align 8
.LC39:
	.string	"HTTP/1.0 404 Not Found\r\nContent-Type: text/plain\r\n\r\nSomthing went wrong"
	.align 8
.LC40:
	.string	"\033[31m\n[-] (%d) ACCESS DENIED: Domain is in blocklist\n[-] Blocked domain: %s\n------------------------------------------------------------\n\033[0m"
	.text
	.globl	handle_req
	.type	handle_req, @function
handle_req:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	leaq	-28672(%rsp), %r11
.LPSRL2:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL2
	subq	$2384, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
.L96:
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30880(%rbp), %rax
	movq	%rax, -31048(%rbp)
	movl	$0, -31064(%rbp)
	jmp	.L82
.L83:
	movq	-31048(%rbp), %rax
	movl	-31064(%rbp), %edx
	movq	$0, (%rax,%rdx,8)
	addl	$1, -31064(%rbp)
.L82:
	cmpl	$15, -31064(%rbp)
	jbe	.L83
	movl	20(%rbp), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	movl	%eax, %esi
	movslq	%esi, %rax
	movq	-30880(%rbp,%rax,8), %rax
	movl	20(%rbp), %edx
	andl	$63, %edx
	movl	$1, %edi
	movl	%edx, %ecx
	salq	%cl, %rdi
	movq	%rdi, %rdx
	orq	%rax, %rdx
	movslq	%esi, %rax
	movq	%rdx, -30880(%rbp,%rax,8)
	movq	$2, -31024(%rbp)
	movq	$0, -31016(%rbp)
	movl	20(%rbp), %eax
	leal	1(%rax), %edi
	leaq	-31024(%rbp), %rdx
	leaq	-30880(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	call	select@PLT
	movl	%eax, -31060(%rbp)
	cmpl	$0, -31060(%rbp)
	jns	.L84
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %r12
	call	__errno_location@PLT
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	movq	stderr(%rip), %rax
	movq	%r12, %r8
	movl	%ebx, %ecx
	leaq	.LC35(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	jmp	.L97
.L84:
	cmpl	$0, -31060(%rbp)
	jne	.L86
	call	gettid@PLT
	movl	$2, %edx
	movl	%eax, %esi
	leaq	.LC36(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L97
.L86:
	movl	20(%rbp), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	cltq
	movq	-30880(%rbp,%rax,8), %rdx
	movl	20(%rbp), %eax
	andl	$63, %eax
	movl	$1, %esi
	movl	%eax, %ecx
	salq	%cl, %rsi
	movq	%rsi, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L96
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	$0, -31056(%rbp)
	leaq	-30752(%rbp), %rdx
	movl	-31056(%rbp), %eax
	cltq
	leaq	(%rdx,%rax), %rsi
	movl	20(%rbp), %eax
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	movl	%eax, -31052(%rbp)
	cmpl	$0, -31052(%rbp)
	jle	.L100
	movl	-31052(%rbp), %eax
	subl	$1, %eax
	addl	%eax, -31056(%rbp)
	call	gettid@PLT
	movl	%eax, %esi
	leaq	-30752(%rbp), %rdx
	movl	-31056(%rbp), %eax
	movq	%rdx, %rcx
	movl	%eax, %edx
	leaq	.LC37(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-31008(%rbp), %rax
	movl	$120, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-31008(%rbp), %rdx
	leaq	-30752(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	parse_request_line_thread_safe@PLT
	testl	%eax, %eax
	jns	.L89
	movl	-30912(%rbp), %ebx
	call	gettid@PLT
	movl	%ebx, %edx
	movl	%eax, %esi
	leaq	.LC38(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC39(%rip), %rax
	movq	%rax, -31032(%rbp)
	movq	-31032(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movl	20(%rbp), %eax
	movq	-31032(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L101
	call	__errno_location@PLT
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC18(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	jmp	.L101
.L89:
	movq	-30984(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	is_blocked@PLT
	testl	%eax, %eax
	je	.L92
	movq	-30984(%rbp), %rbx
	call	gettid@PLT
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC40(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC17(%rip), %rax
	movq	%rax, -31040(%rbp)
	movq	-31040(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movl	20(%rbp), %eax
	movq	-31040(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L102
	call	__errno_location@PLT
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC18(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	jmp	.L97
.L92:
	movq	-30992(%rbp), %rax
	leaq	-30752(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	is_dynamic_content
	movl	%eax, %edx
	leaq	-31008(%rbp), %rax
	movl	$1, %r8d
	movl	$1, %ecx
	leaq	16(%rbp), %rsi
	movq	%rax, %rdi
	call	check_and_send_from_cache
	movl	-30916(%rbp), %eax
	cmpl	$1, %eax
	je	.L103
	movl	-30920(%rbp), %eax
	testl	%eax, %eax
	je	.L103
	leaq	-31008(%rbp), %rax
	movq	%rax, %rdi
	call	cleanup_header@PLT
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	jmp	.L96
.L100:
	nop
	jmp	.L97
.L101:
	nop
	jmp	.L97
.L102:
	nop
	jmp	.L97
.L103:
	nop
.L97:
	leaq	-31008(%rbp), %rax
	movq	%rax, %rdi
	call	cleanup_header@PLT
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	20(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$0, %eax
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L99
	call	__stack_chk_fail@PLT
.L99:
	addq	$31056, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
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
