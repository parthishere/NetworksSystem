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
	movl	$32, %edi
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
	movq	-32(%rbp), %rax
	movq	-56(%rbp), %rdx
	movq	%rdx, 24(%rax)
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
	je	.L14
	call	__stack_chk_fail@PLT
.L14:
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
	.string	"\033[35m[+] (%d) Prefetching *not* Cached uri\n\033[0m"
	.align 8
.LC8:
	.string	"\033[33m[+] (%d) Asking file from server \n\r\033[0m"
.LC9:
	.string	"80"
.LC10:
	.string	"8080"
.LC11:
	.string	"localhost"
.LC12:
	.string	"127.0.1.1"
	.align 8
.LC13:
	.string	"HTTP/1.0 404 Not Found\r\nContent-Type: text/plain\n\r\n\r cannot req proxy"
	.align 8
.LC14:
	.string	"\033[31m[-] send-server failed for server %d\n\033[0m"
.LC15:
	.string	"\033[31mgetaddrinfo\n\033[0m"
	.align 8
.LC16:
	.string	"HTTP/1.0 403 Forbidden\n\rContent-Type: text/plain\n\r\n\rBlocked"
	.align 8
.LC17:
	.string	"\033[31m[-] (%d) send-server failed for server %d\n\033[0m"
.LC18:
	.string	"\033[31mserver: socket"
	.align 8
.LC19:
	.string	"\033[31m[-] (%d) connect failed for server %d\n\033[0m"
	.align 8
.LC20:
	.string	"\033[31m[-] (%d) socket connection failed for server \n\033[0m"
	.align 8
.LC21:
	.string	"\033[35m[+] (%d) client: connecting to %s\n\033[0m"
.LC22:
	.string	"Connection: Keep-alive"
.LC23:
	.string	"Connection: close"
	.align 8
.LC24:
	.string	"GET %s HTTP/1.0\r\nHost: %s\r\n%s\r\n"
.LC25:
	.string	"GET %s HTTP/1.0\r\nHost: %s\r\n\r\n"
	.align 8
.LC26:
	.string	"\033[31m[-] (%d) send failed for server %d \n\033[0m"
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
	pushq	%rbx
	leaq	-28672(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$2296, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -30952(%rbp)
	movq	%rsi, -30960(%rbp)
	movl	%edx, -30964(%rbp)
	movl	%ecx, -30968(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	$10, %edi
	call	putchar@PLT
	cmpl	$0, -30968(%rbp)
	jne	.L16
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L16:
	movl	$0, -30928(%rbp)
	movq	$0, -30888(%rbp)
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-30848(%rbp), %rax
	movl	$48, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	$0, -30844(%rbp)
	movl	$1, -30840(%rbp)
	movq	-30952(%rbp), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	jne	.L17
	movq	-30952(%rbp), %rax
	leaq	.LC9(%rip), %rdx
	movq	%rdx, 32(%rax)
.L17:
	movq	-30952(%rbp), %rax
	movq	32(%rax), %rax
	leaq	.LC10(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L18
	movq	-30952(%rbp), %rax
	movq	24(%rax), %rax
	leaq	.LC11(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L19
	movq	-30952(%rbp), %rax
	movq	24(%rax), %rax
	leaq	.LC12(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L18
.L19:
	leaq	.LC13(%rip), %rax
	movq	%rax, -30880(%rbp)
	movq	-30880(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-30960(%rbp), %rax
	movl	4(%rax), %eax
	movq	-30880(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L20
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC14(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-30960(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
.L20:
	movl	$-1, %eax
	jmp	.L44
.L18:
	movq	-30952(%rbp), %rax
	movq	32(%rax), %rsi
	movq	-30952(%rbp), %rax
	movq	24(%rax), %rax
	leaq	-30912(%rbp), %rcx
	leaq	-30848(%rbp), %rdx
	movq	%rax, %rdi
	call	getaddrinfo@PLT
	testl	%eax, %eax
	jns	.L22
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	leaq	.LC16(%rip), %rax
	movq	%rax, -30856(%rbp)
	movq	-30856(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-30960(%rbp), %rax
	movl	4(%rax), %eax
	movq	-30856(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L23
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
	movq	-30960(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
.L23:
	movl	$-1, %eax
	jmp	.L44
.L22:
	movq	-30912(%rbp), %rax
	movq	%rax, -30896(%rbp)
	jmp	.L24
.L29:
	movq	-30896(%rbp), %rax
	movl	12(%rax), %edx
	movq	-30896(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-30896(%rbp), %rax
	movl	4(%rax), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	socket@PLT
	movl	%eax, -30932(%rbp)
	cmpl	$0, -30932(%rbp)
	jns	.L25
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	jmp	.L26
.L25:
	movq	-30896(%rbp), %rax
	movl	16(%rax), %edx
	movq	-30896(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	movl	-30932(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	connect@PLT
	testl	%eax, %eax
	jns	.L46
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
	movl	-30932(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	nop
.L26:
	movq	-30896(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -30896(%rbp)
.L24:
	cmpq	$0, -30896(%rbp)
	jne	.L29
	jmp	.L28
.L46:
	nop
.L28:
	cmpq	$0, -30896(%rbp)
	jne	.L30
	call	gettid@PLT
	movl	%eax, %edx
	movq	stderr(%rip), %rax
	leaq	.LC20(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	-30932(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$-1, %eax
	jmp	.L44
.L30:
	movq	-30896(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	get_in_addr
	movq	%rax, %rsi
	movq	-30896(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30800(%rbp), %rdx
	movl	$46, %ecx
	movl	%eax, %edi
	call	inet_ntop@PLT
	call	gettid@PLT
	movl	%eax, %ecx
	leaq	-30800(%rbp), %rax
	movq	%rax, %rdx
	movl	%ecx, %esi
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-30912(%rbp), %rax
	movq	%rax, %rdi
	call	freeaddrinfo@PLT
	movq	-30952(%rbp), %rax
	movl	88(%rax), %eax
	testl	%eax, %eax
	je	.L31
	leaq	.LC22(%rip), %rax
	jmp	.L32
.L31:
	leaq	.LC23(%rip), %rax
.L32:
	movq	%rax, -30872(%rbp)
	movq	-30952(%rbp), %rax
	movq	112(%rax), %rax
	testq	%rax, %rax
	je	.L33
	movq	-30952(%rbp), %rax
	movq	112(%rax), %rsi
	movq	-30952(%rbp), %rax
	movq	24(%rax), %rcx
	movq	-30952(%rbp), %rax
	movq	16(%rax), %rdx
	leaq	-30904(%rbp), %rax
	movq	%rsi, %r8
	leaq	.LC24(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	jmp	.L34
.L33:
	movq	-30952(%rbp), %rax
	movq	24(%rax), %rcx
	movq	-30952(%rbp), %rax
	movq	16(%rax), %rdx
	leaq	-30904(%rbp), %rax
	leaq	.LC25(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
.L34:
	movq	-30904(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-30904(%rbp), %rsi
	movl	-30932(%rbp), %eax
	movl	$16384, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L35
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
	movl	-30932(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$-1, %eax
	jmp	.L44
.L35:
	movq	-30952(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-30952(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	cache_add_new@PLT
	movl	%eax, -30920(%rbp)
	movq	-30904(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L43:
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30752(%rbp), %rsi
	movl	-30932(%rbp), %eax
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	movl	%eax, -30916(%rbp)
	cmpl	$0, -30916(%rbp)
	jg	.L36
	cmpq	$0, -30888(%rbp)
	jne	.L37
	jmp	.L38
.L36:
	movl	-30916(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-30752(%rbp), %rcx
	movl	-30920(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movl	$0, -30936(%rbp)
	leaq	-30936(%rbp), %rdx
	leaq	-30752(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	extract_links@PLT
	movq	%rax, -30864(%rbp)
	movl	-30936(%rbp), %eax
	testl	%eax, %eax
	jle	.L39
	cmpq	$0, -30864(%rbp)
	je	.L39
	movl	-30936(%rbp), %edx
	movl	-30928(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30888(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, -30888(%rbp)
	movl	$0, -30924(%rbp)
	jmp	.L40
.L41:
	movl	-30924(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30864(%rbp), %rax
	addq	%rdx, %rax
	movl	-30928(%rbp), %ecx
	movl	-30924(%rbp), %edx
	addl	%ecx, %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-30888(%rbp), %rdx
	addq	%rcx, %rdx
	movq	(%rax), %rax
	movq	%rax, (%rdx)
	addl	$1, -30924(%rbp)
.L40:
	movl	-30936(%rbp), %eax
	cmpl	%eax, -30924(%rbp)
	jl	.L41
	movl	-30936(%rbp), %eax
	addl	%eax, -30928(%rbp)
	movq	-30864(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L39:
	cmpl	$0, -30964(%rbp)
	je	.L43
	movl	-30916(%rbp), %eax
	movslq	%eax, %rdx
	movq	-30960(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30752(%rbp), %rsi
	movl	$16384, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L43
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
	movl	-30920(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	-30932(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$-1, %eax
	jmp	.L44
.L37:
	cmpl	$0, -30968(%rbp)
	je	.L38
	movq	-30952(%rbp), %rcx
	movq	-30888(%rbp), %rdx
	movl	-30928(%rbp), %esi
	movq	-30960(%rbp), %rax
	movq	%rax, %rdi
	call	prefetch_thread_create
.L38:
	movl	-30920(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	-30932(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$1, %eax
.L44:
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L45
	call	__stack_chk_fail@PLT
.L45:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	if_not_cached, .-if_not_cached
	.section	.rodata
	.align 8
.LC27:
	.string	"\033[35m[+] (%d) Prefetching Cached uri\n\r\033[0m"
	.align 8
.LC28:
	.string	"\033[33m[+] (%d) Sent file from cache \n\r\033[0m"
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
	pushq	%rbx
	leaq	-28672(%rsp), %r11
.LPSRL1:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL1
	subq	$2136, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -30792(%rbp)
	movq	%rsi, -30800(%rbp)
	movl	%edx, -30804(%rbp)
	movl	%ecx, -30808(%rbp)
	movl	%r8d, -30812(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	$10, %edi
	call	putchar@PLT
	cmpl	$0, -30812(%rbp)
	jne	.L48
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L48:
	movq	$0, -30768(%rbp)
	movl	$0, -30780(%rbp)
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC28(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L57:
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30752(%rbp), %rcx
	movl	-30804(%rbp), %eax
	movl	$30720, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	movl	%eax, -30772(%rbp)
	cmpl	$0, -30772(%rbp)
	jg	.L49
	cmpq	$0, -30768(%rbp)
	jne	.L50
	jmp	.L51
.L49:
	movl	$0, -30784(%rbp)
	leaq	-30784(%rbp), %rdx
	leaq	-30752(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	extract_links@PLT
	movq	%rax, -30760(%rbp)
	movl	-30784(%rbp), %eax
	testl	%eax, %eax
	jle	.L52
	cmpq	$0, -30760(%rbp)
	je	.L52
	movl	-30784(%rbp), %edx
	movl	-30780(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30768(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, -30768(%rbp)
	movl	$0, -30776(%rbp)
	jmp	.L53
.L54:
	movl	-30776(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30760(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-30780(%rbp), %ecx
	movl	-30776(%rbp), %edx
	addl	%ecx, %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-30768(%rbp), %rdx
	leaq	(%rcx,%rdx), %rbx
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, (%rbx)
	addl	$1, -30776(%rbp)
.L53:
	movl	-30784(%rbp), %eax
	cmpl	%eax, -30776(%rbp)
	jl	.L54
	movl	-30784(%rbp), %eax
	addl	%eax, -30780(%rbp)
	movq	-30760(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L52:
	cmpl	$0, -30808(%rbp)
	je	.L57
	movl	-30772(%rbp), %eax
	movslq	%eax, %rdx
	movq	-30800(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30752(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L57
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
	movq	-30800(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$-1, %eax
	jmp	.L47
.L50:
	cmpl	$0, -30812(%rbp)
	je	.L51
	movq	-30792(%rbp), %rcx
	movq	-30768(%rbp), %rdx
	movl	-30780(%rbp), %esi
	movq	-30800(%rbp), %rax
	movq	%rax, %rdi
	call	prefetch_thread_create
.L51:
	movq	-30768(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	-30804(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
.L47:
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L58
	call	__stack_chk_fail@PLT
.L58:
	movq	-8(%rbp), %rbx
	leave
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
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	js	.L60
	cmpl	$0, -36(%rbp)
	je	.L61
.L60:
	movl	-44(%rbp), %ecx
	movl	-40(%rbp), %edx
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	if_not_cached
	jmp	.L62
.L61:
	movl	-44(%rbp), %edi
	movl	-40(%rbp), %ecx
	movl	-4(%rbp), %edx
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rax
	movl	%edi, %r8d
	movq	%rax, %rdi
	call	if_cached
.L62:
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	check_and_send_from_cache, .-check_and_send_from_cache
	.section	.rodata
.LC29:
	.string	"\033[31mselect error"
	.align 8
.LC30:
	.string	"\033[33m[-] (%d) Connection timed out\n\033[0m"
.LC31:
	.string	"\033[31m[-] (%d) read"
	.align 8
.LC32:
	.string	"\033[31m[-] (%d) Parsing went wrong : 0x%02X \n\r\033[0m"
	.align 8
.LC33:
	.string	"HTTP/1.0 404 Not Found\n\rContent-Type: text/plain\n\r\n\rSomthing went wrong"
	.align 8
.LC34:
	.string	"\033[31m[-] (%d) Blocked Domain \n\r\033[0m"
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
	pushq	%rbx
	leaq	-28672(%rsp), %r11
.LPSRL2:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL2
	subq	$2392, %rsp
	.cfi_offset 3, -24
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
.L78:
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30880(%rbp), %rax
	movq	%rax, -31048(%rbp)
	movl	$0, -31064(%rbp)
	jmp	.L64
.L65:
	movq	-31048(%rbp), %rax
	movl	-31064(%rbp), %edx
	movq	$0, (%rax,%rdx,8)
	addl	$1, -31064(%rbp)
.L64:
	cmpl	$15, -31064(%rbp)
	jbe	.L65
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
	jns	.L66
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	jmp	.L79
.L66:
	cmpl	$0, -31060(%rbp)
	jne	.L68
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L79
.L68:
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
	je	.L78
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
	movl	%eax, -31056(%rbp)
	cmpl	$0, -31056(%rbp)
	jns	.L70
	call	gettid@PLT
	movl	%eax, %edx
	movq	stderr(%rip), %rax
	leaq	.LC31(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
	jmp	.L80
.L70:
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
	jns	.L72
	movl	-30912(%rbp), %ebx
	call	gettid@PLT
	movl	%ebx, %edx
	movl	%eax, %esi
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC33(%rip), %rax
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
	jns	.L82
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
	jmp	.L82
.L72:
	movq	-30984(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	is_blocked@PLT
	testl	%eax, %eax
	je	.L75
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC34(%rip), %rax
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
	jns	.L83
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
	jmp	.L79
.L75:
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
	leaq	-31008(%rbp), %rax
	movl	$120, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	-30916(%rbp), %eax
	cmpl	$1, %eax
	je	.L84
	movl	-30920(%rbp), %eax
	testl	%eax, %eax
	je	.L84
	jmp	.L78
.L82:
	nop
	jmp	.L79
.L83:
	nop
	jmp	.L79
.L84:
	nop
.L79:
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	-31052(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	20(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$0, %eax
.L80:
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L81
	call	__stack_chk_fail@PLT
.L81:
	movq	-8(%rbp), %rbx
	leave
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
