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
	movl	$208, %edi
	call	malloc@PLT
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, 32(%rax)
	movq	-32(%rbp), %rax
	movq	32(%rax), %rax
	movl	$-1, 4(%rax)
	cmpq	$0, -72(%rbp)
	je	.L12
	movl	$0, -44(%rbp)
	jmp	.L13
.L15:
	movl	-44(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L14
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
.L14:
	addl	$1, -44(%rbp)
.L13:
	movl	-44(%rbp), %eax
	cmpl	-60(%rbp), %eax
	jl	.L15
.L12:
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
	je	.L16
	movq	-80(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	jmp	.L17
.L16:
	movl	$0, %edx
.L17:
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
	je	.L18
	call	__stack_chk_fail@PLT
.L18:
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
	.string	"\033[35m[+] (%d) Prefetching *not* Cached uri: %s%s\n\033[0m"
.LC8:
	.string	"80"
	.align 8
.LC9:
	.string	"\033[33m[+] (%d) Requesting file from server: %s:%s%s\n\033[0m"
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
.LC15:
	.string	"\033[31mgetaddrinfo\n\033[0m"
	.align 8
.LC16:
	.string	"HTTP/1.0 403 Forbidden\r\nContent-Type: text/plain\r\n\r\nBlocked"
	.align 8
.LC17:
	.string	"\033[31m[-] (%d) send-server failed for server %d\n\033[0m"
.LC18:
	.string	"\033[31mserver: socket"
	.align 8
.LC19:
	.string	"\033[31m\n[-] (%d) connect failed for server %d\n\033[0m"
	.align 8
.LC20:
	.string	"HTTP/1.0 403 Forbidden\r\nContent-Type: text/plain\r\n\r\nConnect Failed"
	.align 8
.LC21:
	.string	"\033[32m[+] (%d) Connection established to server: %s\n[+] Server IP address: %s:%s\n\033[0m"
.LC22:
	.string	"Connection: Keep-alive"
.LC23:
	.string	"Connection: close"
	.align 8
.LC24:
	.string	"GET %s HTTP/1.0\r\nHost: %s\r\n%s\r\n"
.LC25:
	.string	"GET %s HTTP/1.0\r\nHost: %s\r\r\n\n"
	.align 8
.LC26:
	.string	"\033[31m[-] (%d) send failed for server %d \n\033[0m"
	.align 8
.LC27:
	.string	"\033[31m[-] (%d) Memory allocation failed for links array (requested %zu bytes)\n\033[0m"
	.align 8
.LC28:
	.string	"\033[32m[+] (%d) Sent %d bytes directly (%s/%s) !\n\033[0m"
	.align 8
.LC29:
	.string	"\033[32m[+] (%d) %d bytes Saved to cache ! (%s/%s) !\n\033[0m"
	.align 8
.LC30:
	.string	"\033[32m[+] (%d) Prefetching for %s:%s/%s \n\033[0m"
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
	jne	.L20
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
.L20:
	movl	$0, -30956(%rbp)
	movq	$0, -30912(%rbp)
	movq	-30984(%rbp), %rax
	movq	16(%rax), %r13
	movq	-30984(%rbp), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	je	.L21
	movq	-30984(%rbp), %rax
	movq	32(%rax), %rbx
	jmp	.L22
.L21:
	leaq	.LC8(%rip), %rbx
.L22:
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
	je	.L23
	movq	-30984(%rbp), %rax
	movq	32(%rax), %rax
	leaq	.LC10(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L23
	movq	-30984(%rbp), %rax
	movq	24(%rax), %rax
	leaq	.LC11(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L24
	movq	-30984(%rbp), %rax
	movq	24(%rax), %rax
	leaq	.LC12(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L23
.L24:
	cmpl	$0, -30996(%rbp)
	je	.L23
	movq	-30992(%rbp), %rax
	movl	4(%rax), %eax
	testl	%eax, %eax
	jle	.L23
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
	jns	.L25
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC14(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L25:
	movl	$-1, %eax
	jmp	.L58
.L23:
	movq	-30984(%rbp), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	jne	.L27
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	movq	-30984(%rbp), %rax
	movq	%rdx, 32(%rax)
.L27:
	movq	-30984(%rbp), %rax
	movq	32(%rax), %rsi
	movq	-30984(%rbp), %rax
	movq	24(%rax), %rax
	leaq	-30936(%rbp), %rcx
	leaq	-30864(%rbp), %rdx
	movq	%rax, %rdi
	call	getaddrinfo@PLT
	testl	%eax, %eax
	jns	.L28
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movq	-30992(%rbp), %rax
	movl	4(%rax), %eax
	testl	%eax, %eax
	jle	.L29
	cmpl	$0, -30996(%rbp)
	je	.L29
	leaq	.LC16(%rip), %rax
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
	jns	.L29
	call	__errno_location@PLT
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC17(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L29:
	movl	$-1, %eax
	jmp	.L58
.L28:
	movq	-30936(%rbp), %rax
	movq	%rax, -30920(%rbp)
	jmp	.L30
.L35:
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
	jns	.L31
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	jmp	.L32
.L31:
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
	jns	.L60
	call	__errno_location@PLT
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC19(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	-30960(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	nop
.L32:
	movq	-30920(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -30920(%rbp)
.L30:
	cmpq	$0, -30920(%rbp)
	jne	.L35
	jmp	.L34
.L60:
	nop
.L34:
	cmpq	$0, -30920(%rbp)
	jne	.L36
	movq	-30992(%rbp), %rax
	movl	4(%rax), %eax
	testl	%eax, %eax
	jle	.L37
	cmpl	$0, -30996(%rbp)
	je	.L37
	leaq	.LC20(%rip), %rax
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
	jns	.L37
	call	__errno_location@PLT
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC17(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L37:
	movl	-30960(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$-1, %eax
	jmp	.L58
.L36:
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
	je	.L38
	movq	-30984(%rbp), %rax
	movq	32(%rax), %rbx
	jmp	.L39
.L38:
	leaq	.LC8(%rip), %rbx
.L39:
	movq	-30984(%rbp), %rax
	movq	24(%rax), %r12
	call	gettid@PLT
	movl	%eax, %esi
	leaq	-30816(%rbp), %rax
	movq	%rbx, %r8
	movq	%rax, %rcx
	movq	%r12, %rdx
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-30936(%rbp), %rax
	movq	%rax, %rdi
	call	freeaddrinfo@PLT
	movq	-30984(%rbp), %rax
	movl	88(%rax), %eax
	testl	%eax, %eax
	je	.L40
	leaq	.LC22(%rip), %rax
	jmp	.L41
.L40:
	leaq	.LC23(%rip), %rax
.L41:
	movq	%rax, -30896(%rbp)
	movq	-30984(%rbp), %rax
	movq	112(%rax), %rax
	testq	%rax, %rax
	je	.L42
	movq	-30984(%rbp), %rax
	movq	112(%rax), %rsi
	movq	-30984(%rbp), %rax
	movq	24(%rax), %rcx
	movq	-30984(%rbp), %rax
	movq	16(%rax), %rdx
	leaq	-30928(%rbp), %rax
	movq	%rsi, %r8
	leaq	.LC24(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	jmp	.L43
.L42:
	movq	-30984(%rbp), %rax
	movq	24(%rax), %rcx
	movq	-30984(%rbp), %rax
	movq	16(%rax), %rdx
	leaq	-30928(%rbp), %rax
	leaq	.LC25(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
.L43:
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
	jns	.L44
	call	__errno_location@PLT
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC26(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	-30960(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$-1, %eax
	jmp	.L58
.L44:
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
.L55:
	movq	-30992(%rbp), %rax
	addq	$168, %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
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
	jg	.L45
	movq	-30992(%rbp), %rax
	addq	$168, %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	movq	-30912(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	-30944(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	-30960(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	cmpq	$0, -30912(%rbp)
	jne	.L46
	jmp	.L47
.L45:
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
	jle	.L48
	cmpq	$0, -30888(%rbp)
	je	.L48
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
	jne	.L49
	movl	-30964(%rbp), %edx
	movl	-30956(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rbx
	call	gettid@PLT
	movl	%eax, %edx
	movq	stderr(%rip), %rax
	movq	%rbx, %rcx
	leaq	.LC27(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-30888(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-30992(%rbp), %rax
	addq	$168, %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	movl	$-1, %eax
	jmp	.L58
.L49:
	movl	$0, -30952(%rbp)
	jmp	.L51
.L52:
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
.L51:
	movl	-30964(%rbp), %eax
	cmpl	%eax, -30952(%rbp)
	jl	.L52
	movl	-30964(%rbp), %eax
	addl	%eax, -30956(%rbp)
	movq	-30888(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L48:
	cmpl	$0, -30996(%rbp)
	je	.L53
	movq	-30992(%rbp), %rax
	movl	4(%rax), %eax
	testl	%eax, %eax
	jle	.L53
	movl	-30940(%rbp), %eax
	movslq	%eax, %rdx
	movq	-30992(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30768(%rbp), %rsi
	movl	$16384, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L54
	call	__errno_location@PLT
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC17(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	-30944(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	-30960(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movq	-30992(%rbp), %rax
	addq	$168, %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	movl	$-1, %eax
	jmp	.L58
.L54:
	movq	-30984(%rbp), %rax
	movq	16(%rax), %r12
	movq	-30984(%rbp), %rax
	movq	24(%rax), %rbx
	call	gettid@PLT
	movl	%eax, %esi
	movl	-30940(%rbp), %eax
	movq	%r12, %r8
	movq	%rbx, %rcx
	movl	%eax, %edx
	leaq	.LC28(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L53:
	movq	-30984(%rbp), %rax
	movq	16(%rax), %r12
	movq	-30984(%rbp), %rax
	movq	24(%rax), %rbx
	call	gettid@PLT
	movl	%eax, %esi
	movl	-30940(%rbp), %eax
	movq	%r12, %r8
	movq	%rbx, %rcx
	movl	%eax, %edx
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-30992(%rbp), %rax
	addq	$168, %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	jmp	.L55
.L46:
	cmpl	$0, -31000(%rbp)
	je	.L47
	movq	-30984(%rbp), %rax
	movq	16(%rax), %r13
	movq	-30984(%rbp), %rax
	movq	32(%rax), %r12
	movq	-30984(%rbp), %rax
	movq	24(%rax), %rbx
	call	gettid@PLT
	movq	%r13, %r8
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-30984(%rbp), %rcx
	movq	-30912(%rbp), %rdx
	movl	-30956(%rbp), %esi
	movq	-30992(%rbp), %rax
	movq	%rax, %rdi
	call	prefetch_thread_create
	movl	$0, -30948(%rbp)
	jmp	.L56
.L57:
	movl	-30948(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30912(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	addl	$1, -30948(%rbp)
.L56:
	movl	-30948(%rbp), %eax
	cmpl	-30956(%rbp), %eax
	jl	.L57
.L47:
	movl	$1, %eax
.L58:
	movq	-40(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L59
	call	__stack_chk_fail@PLT
.L59:
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
.LC31:
	.string	"\033[35m[+] (%d) Prefetching Cached uri: %s%s\n\033[0m"
	.align 8
.LC32:
	.string	"\033[32m[+] (%d) Serving file from cache: %s%s\n[+] Cache file size: %ld bytes\n\033[0m"
	.align 8
.LC33:
	.string	"\033[31m[-] (%d) Memory allocation failed\n\033[0m"
	.align 8
.LC34:
	.string	"\033[32m[+] (%d) Sent %d bytes from cache (%s/%s) !\n\033[0m"
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
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	leaq	-28672(%rsp), %r11
.LPSRL1:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL1
	subq	$2152, %rsp
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	movq	%rdi, -30824(%rbp)
	movq	%rsi, -30832(%rbp)
	movl	%edx, -30836(%rbp)
	movl	%ecx, -30840(%rbp)
	movl	%r8d, -30844(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -40(%rbp)
	xorl	%eax, %eax
	cmpl	$0, -30844(%rbp)
	jne	.L62
	movq	-30824(%rbp), %rax
	movq	16(%rax), %r12
	movq	-30824(%rbp), %rax
	movq	24(%rax), %rbx
	call	gettid@PLT
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC31(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L62:
	movq	$0, -30792(%rbp)
	movl	$0, -30808(%rbp)
	movq	-30832(%rbp), %rax
	addq	$168, %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	movl	-30836(%rbp), %eax
	movl	$2, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	lseek@PLT
	testq	%rax, %rax
	jle	.L63
	movl	-30836(%rbp), %eax
	movl	$1, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	lseek@PLT
	jmp	.L64
.L63:
	movl	$0, %eax
.L64:
	movq	%rax, -30784(%rbp)
	movq	-30824(%rbp), %rax
	movq	16(%rax), %r12
	movq	-30824(%rbp), %rax
	movq	24(%rax), %rbx
	call	gettid@PLT
	movq	-30784(%rbp), %rdx
	movq	%rdx, %r8
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-30836(%rbp), %eax
	movl	$0, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	lseek@PLT
.L75:
	leaq	-30768(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30768(%rbp), %rcx
	movl	-30836(%rbp), %eax
	movl	$30720, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	movl	%eax, -30796(%rbp)
	cmpl	$0, -30796(%rbp)
	jg	.L65
	movq	-30832(%rbp), %rax
	addq	$168, %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	cmpq	$0, -30792(%rbp)
	jne	.L66
	jmp	.L67
.L65:
	movl	$0, -30812(%rbp)
	leaq	-30812(%rbp), %rdx
	leaq	-30768(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	extract_links@PLT
	movq	%rax, -30776(%rbp)
	movl	-30812(%rbp), %eax
	testl	%eax, %eax
	jle	.L68
	cmpq	$0, -30776(%rbp)
	je	.L68
	movl	-30812(%rbp), %edx
	movl	-30808(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30792(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, -30792(%rbp)
	cmpq	$0, -30792(%rbp)
	jne	.L69
	call	gettid@PLT
	movl	%eax, %edx
	movq	stderr(%rip), %rax
	leaq	.LC33(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-30776(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$-1, %eax
	jmp	.L81
.L69:
	movl	$0, -30804(%rbp)
	jmp	.L71
.L72:
	movl	-30804(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30776(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-30808(%rbp), %ecx
	movl	-30804(%rbp), %edx
	addl	%ecx, %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-30792(%rbp), %rdx
	leaq	(%rcx,%rdx), %rbx
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, (%rbx)
	addl	$1, -30804(%rbp)
.L71:
	movl	-30812(%rbp), %eax
	cmpl	%eax, -30804(%rbp)
	jl	.L72
	movl	-30812(%rbp), %eax
	addl	%eax, -30808(%rbp)
	movq	-30776(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L68:
	cmpl	$0, -30840(%rbp)
	je	.L75
	movq	-30832(%rbp), %rax
	movl	4(%rax), %eax
	testl	%eax, %eax
	jle	.L75
	movl	-30796(%rbp), %eax
	movslq	%eax, %rdx
	movq	-30832(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30768(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L74
	call	__errno_location@PLT
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC17(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$-1, %eax
	jmp	.L81
.L74:
	movq	-30824(%rbp), %rax
	movq	16(%rax), %r12
	movq	-30824(%rbp), %rax
	movq	24(%rax), %rbx
	call	gettid@PLT
	movl	%eax, %esi
	movl	-30796(%rbp), %eax
	movq	%r12, %r8
	movq	%rbx, %rcx
	movl	%eax, %edx
	leaq	.LC34(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L75
.L66:
	cmpl	$0, -30844(%rbp)
	je	.L67
	movq	-30824(%rbp), %rax
	movq	16(%rax), %r13
	movq	-30824(%rbp), %rax
	movq	32(%rax), %r12
	movq	-30824(%rbp), %rax
	movq	24(%rax), %rbx
	call	gettid@PLT
	movq	%r13, %r8
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-30824(%rbp), %rcx
	movq	-30792(%rbp), %rdx
	movl	-30808(%rbp), %esi
	movq	-30832(%rbp), %rax
	movq	%rax, %rdi
	call	prefetch_thread_create
.L67:
	movl	-30836(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	cmpq	$0, -30792(%rbp)
	je	.L77
	movl	$0, -30800(%rbp)
	jmp	.L78
.L80:
	movl	-30800(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30792(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L79
	movl	-30800(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30792(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L79:
	addl	$1, -30800(%rbp)
.L78:
	movl	-30800(%rbp), %eax
	cmpl	-30808(%rbp), %eax
	jl	.L80
	movq	-30792(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L77:
	movl	$0, %eax
.L81:
	movq	-40(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L82
	call	__stack_chk_fail@PLT
.L82:
	addq	$30824, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
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
	js	.L84
	cmpl	$0, -36(%rbp)
	je	.L85
.L84:
	movl	-44(%rbp), %ecx
	movl	-40(%rbp), %edx
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	if_not_cached
	movl	%eax, -4(%rbp)
	jmp	.L86
.L85:
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
.L86:
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
	.string	"\033[31m[-] (%d) peer has closed the connection exiting\n"
	.align 8
.LC38:
	.string	"\n\n==============================================================\n[+] (%d) Received request from client [%d bytes]:\n==============================================================\n%s\n"
	.align 8
.LC39:
	.string	"\033[31m[-] (%d) HTTP Parsing Error:\n[-] Error code: 0x%02X\n\033[0m"
	.align 8
.LC40:
	.string	"HTTP/1.0 404 Not Found\r\nContent-Type: text/plain\r\n\r\nSomthing went wrong"
	.align 8
.LC41:
	.string	"\033[31m[-] (%d) ACCESS DENIED: Domain is in blocklist\n[-] Blocked domain: %s\n\033[0m"
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
	leaq	184(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_mutex_init@PLT
.L101:
	leaq	-30880(%rbp), %rax
	movq	%rax, -31048(%rbp)
	movl	$0, -31064(%rbp)
	jmp	.L88
.L89:
	movq	-31048(%rbp), %rax
	movl	-31064(%rbp), %edx
	movq	$0, (%rax,%rdx,8)
	addl	$1, -31064(%rbp)
.L88:
	cmpl	$15, -31064(%rbp)
	jbe	.L89
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
	movq	$10, -31024(%rbp)
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
	jns	.L90
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
	jmp	.L102
.L90:
	cmpl	$0, -31060(%rbp)
	jne	.L92
	call	gettid@PLT
	movl	$10, %edx
	movl	%eax, %esi
	leaq	.LC36(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L102
.L92:
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
	je	.L101
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
	js	.L105
	cmpl	$0, -31052(%rbp)
	jne	.L95
	call	gettid@PLT
	movl	%eax, %edx
	movq	stderr(%rip), %rax
	leaq	.LC37(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	jmp	.L102
.L95:
	movl	-31052(%rbp), %eax
	subl	$1, %eax
	addl	%eax, -31056(%rbp)
	call	gettid@PLT
	movl	%eax, %esi
	leaq	-30752(%rbp), %rdx
	movl	-31056(%rbp), %eax
	movq	%rdx, %rcx
	movl	%eax, %edx
	leaq	.LC38(%rip), %rax
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
	jns	.L96
	movl	-30912(%rbp), %ebx
	call	gettid@PLT
	movl	%ebx, %edx
	movl	%eax, %esi
	leaq	.LC39(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC40(%rip), %rax
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
	jns	.L106
	call	__errno_location@PLT
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC17(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	jmp	.L106
.L96:
	movq	-30984(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	is_blocked@PLT
	testl	%eax, %eax
	je	.L99
	movq	-30984(%rbp), %rbx
	call	gettid@PLT
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC41(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC16(%rip), %rax
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
	jns	.L99
	call	__errno_location@PLT
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC17(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	jmp	.L102
.L99:
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
	jne	.L100
	movl	-30920(%rbp), %eax
	testl	%eax, %eax
	je	.L107
.L100:
	leaq	-31008(%rbp), %rax
	movq	%rax, %rdi
	call	cleanup_header@PLT
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	jmp	.L101
.L105:
	nop
	jmp	.L102
.L106:
	nop
	jmp	.L102
.L107:
	nop
.L102:
	leaq	-31008(%rbp), %rax
	movq	%rax, %rdi
	call	cleanup_header@PLT
	movl	20(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$0, %eax
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L104
	call	__stack_chk_fail@PLT
.L104:
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
