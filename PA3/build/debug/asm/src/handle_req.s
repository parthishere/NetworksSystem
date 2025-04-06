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
	cmpq	$0, -24(%rbp)
	je	.L10
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
	movl	$48, %edi
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
	movq	-32(%rbp), %rax
	movq	32(%rax), %rax
	movq	-56(%rbp), %rdx
	movl	156(%rdx), %edx
	movl	%edx, 156(%rax)
	movl	$0, -44(%rbp)
	jmp	.L12
.L14:
	movl	-44(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L13
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
.L13:
	addl	$1, -44(%rbp)
.L12:
	movl	-44(%rbp), %eax
	cmpl	-60(%rbp), %eax
	jl	.L14
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
	je	.L15
	movq	-80(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	jmp	.L16
.L15:
	movl	$0, %edx
.L16:
	movq	-32(%rbp), %rax
	movq	%rdx, 24(%rax)
	movq	-80(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, 40(%rax)
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
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
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
	.string	"%s 404 Not Found\r\nContent-Type: text/plain\r\n\r\n cannot req proxy"
	.align 8
.LC14:
	.string	"\033[31m[-] send-server failed for server %d\n\033[0m"
.LC15:
	.string	"\033[31mgetaddrinfo\n\033[0m"
	.align 8
.LC16:
	.string	"%s 403 Forbidden\r\nContent-Type: text/plain\r\n\r\nBlocked"
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
	.string	"\033[32m[+] (%d) Connection established to server: %s\n[+] Server IP address: %s:%s\n\033[0m"
.LC21:
	.string	"Connection: close"
.LC22:
	.string	"GET %s %s\r\nHost: %s\r\n%s\r\n%s\r\n"
.LC23:
	.string	"GET %s %s\r\nHost: %s\r\n%s\r\n\r\n"
.LC24:
	.string	"[+] Sent request %s \n\r"
	.align 8
.LC25:
	.string	"\033[31m[-] (%d) send failed for server %d \n\033[0m"
	.align 8
.LC26:
	.string	"[-] Recv failed for proxy <-> server \n\r"
	.align 8
.LC27:
	.string	"[-] Connetion close proxy <-> server \n\r"
.LC28:
	.string	"Content-Length: "
.LC29:
	.string	"content length %s \n"
.LC30:
	.string	"\r\n\r\n"
	.align 8
.LC31:
	.string	"\033[31m[-] (%d) Memory allocation failed for links array (requested %zu bytes)\n\033[0m"
	.align 8
.LC32:
	.string	"\033[32m[+] (%d) Sent %d bytes directly (%s %s) !\n\033[0m"
	.align 8
.LC33:
	.string	"\033[32m[+] (%d) %d bytes Saved to cache ! (%s %s) !\n\033[0m"
	.align 8
.LC34:
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
	subq	$2296, %rsp
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	movq	%rdi, -30968(%rbp)
	movq	%rsi, -30976(%rbp)
	movl	%edx, -30980(%rbp)
	movl	%ecx, -30984(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -40(%rbp)
	xorl	%eax, %eax
	cmpl	$0, -30984(%rbp)
	jne	.L19
	movq	-30968(%rbp), %rax
	movq	16(%rax), %r12
	movq	-30968(%rbp), %rax
	movq	24(%rax), %rbx
	call	gettid@PLT
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L19:
	movl	$0, -30952(%rbp)
	movq	$0, -30904(%rbp)
	movq	-30968(%rbp), %rax
	movq	16(%rax), %r13
	movq	-30968(%rbp), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	je	.L20
	movq	-30968(%rbp), %rax
	movq	32(%rax), %rbx
	jmp	.L21
.L20:
	leaq	.LC8(%rip), %rbx
.L21:
	movq	-30968(%rbp), %rax
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
	movq	-30968(%rbp), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	jne	.L22
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	movq	-30968(%rbp), %rax
	movq	%rdx, 32(%rax)
.L22:
	movq	-30968(%rbp), %rax
	movq	32(%rax), %rax
	leaq	.LC10(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L23
	movq	-30968(%rbp), %rax
	movq	24(%rax), %rax
	leaq	.LC11(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L24
	movq	-30968(%rbp), %rax
	movq	24(%rax), %rax
	leaq	.LC12(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L23
.L24:
	cmpl	$0, -30980(%rbp)
	je	.L23
	movq	-30968(%rbp), %rax
	movq	8(%rax), %rdx
	leaq	-30920(%rbp), %rax
	leaq	.LC13(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	movq	-30920(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-30920(%rbp), %rsi
	movq	-30976(%rbp), %rax
	movl	4(%rax), %eax
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
	movq	-30920(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$-1, %eax
	jmp	.L60
.L23:
	movq	-30968(%rbp), %rax
	movq	32(%rax), %rsi
	movq	-30968(%rbp), %rax
	movq	24(%rax), %rax
	leaq	-30928(%rbp), %rcx
	leaq	-30864(%rbp), %rdx
	movq	%rax, %rdi
	call	getaddrinfo@PLT
	testl	%eax, %eax
	jns	.L27
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movq	-30976(%rbp), %rax
	movl	4(%rax), %eax
	testl	%eax, %eax
	jle	.L28
	cmpl	$0, -30980(%rbp)
	je	.L28
	movq	-30968(%rbp), %rax
	movq	8(%rax), %rdx
	leaq	-30920(%rbp), %rax
	leaq	.LC16(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	movq	-30920(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-30920(%rbp), %rsi
	movq	-30976(%rbp), %rax
	movl	4(%rax), %eax
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
	movq	-30920(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L28:
	movl	$-1, %eax
	jmp	.L60
.L27:
	movq	-30928(%rbp), %rax
	movq	%rax, -30912(%rbp)
	jmp	.L30
.L35:
	movq	-30912(%rbp), %rax
	movl	12(%rax), %edx
	movq	-30912(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-30912(%rbp), %rax
	movl	4(%rax), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	socket@PLT
	movl	%eax, -30956(%rbp)
	cmpl	$0, -30956(%rbp)
	jns	.L31
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	jmp	.L32
.L31:
	movq	-30912(%rbp), %rax
	movl	16(%rax), %edx
	movq	-30912(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	movl	-30956(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	connect@PLT
	testl	%eax, %eax
	jns	.L62
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
	movl	-30956(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	nop
.L32:
	movq	-30912(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -30912(%rbp)
.L30:
	cmpq	$0, -30912(%rbp)
	jne	.L35
	jmp	.L34
.L62:
	nop
.L34:
	cmpq	$0, -30912(%rbp)
	jne	.L36
	movq	-30976(%rbp), %rax
	movl	4(%rax), %eax
	testl	%eax, %eax
	jle	.L37
	cmpl	$0, -30980(%rbp)
	je	.L37
	movq	-30968(%rbp), %rax
	movq	8(%rax), %rdx
	leaq	-30920(%rbp), %rax
	leaq	.LC16(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	movq	-30920(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-30920(%rbp), %rsi
	movq	-30976(%rbp), %rax
	movl	4(%rax), %eax
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
	movl	-30956(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$-1, %eax
	jmp	.L60
.L36:
	movq	-30912(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	get_in_addr
	movq	%rax, %rsi
	movq	-30912(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30816(%rbp), %rdx
	movl	$46, %ecx
	movl	%eax, %edi
	call	inet_ntop@PLT
	movq	-30968(%rbp), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	je	.L39
	movq	-30968(%rbp), %rax
	movq	32(%rax), %rbx
	jmp	.L40
.L39:
	leaq	.LC8(%rip), %rbx
.L40:
	movq	-30968(%rbp), %rax
	movq	24(%rax), %r12
	call	gettid@PLT
	movl	%eax, %esi
	leaq	-30816(%rbp), %rax
	movq	%rbx, %r8
	movq	%rax, %rcx
	movq	%r12, %rdx
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-30928(%rbp), %rax
	movq	%rax, %rdi
	call	freeaddrinfo@PLT
	leaq	.LC21(%rip), %rax
	movq	%rax, -30896(%rbp)
	movq	-30968(%rbp), %rax
	movq	112(%rax), %rax
	testq	%rax, %rax
	je	.L41
	movq	-30968(%rbp), %rax
	movq	112(%rax), %rsi
	movq	-30968(%rbp), %rax
	movq	24(%rax), %rdi
	movq	-30968(%rbp), %rax
	movq	8(%rax), %rcx
	movq	-30968(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-30896(%rbp), %r8
	leaq	-30920(%rbp), %rax
	subq	$8, %rsp
	pushq	%rsi
	movq	%r8, %r9
	movq	%rdi, %r8
	leaq	.LC22(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	addq	$16, %rsp
	jmp	.L42
.L41:
	movq	-30968(%rbp), %rax
	movq	24(%rax), %rsi
	movq	-30968(%rbp), %rax
	movq	8(%rax), %rcx
	movq	-30968(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-30896(%rbp), %rdi
	leaq	-30920(%rbp), %rax
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC23(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
.L42:
	movq	-30920(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-30920(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-30920(%rbp), %rsi
	movl	-30956(%rbp), %eax
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
	leaq	.LC25(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	-30956(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$-1, %eax
	jmp	.L60
.L43:
	movq	-30968(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-30968(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	cache_add_new@PLT
	movl	%eax, -30936(%rbp)
	movq	-30920(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-30976(%rbp), %rax
	addq	$168, %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	movl	$1, -30948(%rbp)
.L55:
	leaq	-30768(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30768(%rbp), %rsi
	movl	-30956(%rbp), %eax
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	movl	%eax, -30932(%rbp)
	cmpl	$0, -30932(%rbp)
	jns	.L44
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$39, %edx
	movl	$1, %esi
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	jmp	.L45
.L44:
	cmpl	$0, -30932(%rbp)
	jne	.L46
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$39, %edx
	movl	$1, %esi
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	jmp	.L45
.L46:
	cmpl	$1, -30948(%rbp)
	jne	.L47
	leaq	-30768(%rbp), %rax
	leaq	.LC28(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	movq	%rax, -30888(%rbp)
	movq	-30888(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-30768(%rbp), %rax
	leaq	.LC30(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	movq	%rax, -30880(%rbp)
	movl	$0, -30948(%rbp)
.L47:
	movl	-30932(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-30768(%rbp), %rcx
	movl	-30936(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movl	$0, -30960(%rbp)
	leaq	-30960(%rbp), %rdx
	leaq	-30768(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	extract_links@PLT
	movq	%rax, -30872(%rbp)
	movl	-30960(%rbp), %eax
	testl	%eax, %eax
	jle	.L48
	cmpq	$0, -30872(%rbp)
	je	.L48
	movl	-30960(%rbp), %edx
	movl	-30952(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30904(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, -30904(%rbp)
	cmpq	$0, -30904(%rbp)
	jne	.L49
	movl	-30960(%rbp), %edx
	movl	-30952(%rbp), %eax
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
	movq	-30872(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-30976(%rbp), %rax
	addq	$168, %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	movl	$-1, %eax
	jmp	.L60
.L49:
	movl	$0, -30944(%rbp)
	jmp	.L51
.L52:
	movl	-30944(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30872(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-30952(%rbp), %ecx
	movl	-30944(%rbp), %edx
	addl	%ecx, %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-30904(%rbp), %rdx
	leaq	(%rcx,%rdx), %rbx
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, (%rbx)
	addl	$1, -30944(%rbp)
.L51:
	movl	-30960(%rbp), %eax
	cmpl	%eax, -30944(%rbp)
	jl	.L52
	movl	-30960(%rbp), %eax
	addl	%eax, -30952(%rbp)
	movq	-30872(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L48:
	cmpl	$0, -30980(%rbp)
	je	.L53
	movl	-30932(%rbp), %eax
	movslq	%eax, %rdx
	movq	-30976(%rbp), %rax
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
	movl	-30936(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	-30956(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movq	-30976(%rbp), %rax
	addq	$168, %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	movl	$-1, %eax
	jmp	.L60
.L54:
	movq	-30968(%rbp), %rax
	movq	16(%rax), %r12
	movq	-30968(%rbp), %rax
	movq	24(%rax), %rbx
	call	gettid@PLT
	movl	%eax, %esi
	movl	-30932(%rbp), %eax
	movq	%r12, %r8
	movq	%rbx, %rcx
	movl	%eax, %edx
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L53:
	movq	-30968(%rbp), %rax
	movq	16(%rax), %r12
	movq	-30968(%rbp), %rax
	movq	24(%rax), %rbx
	call	gettid@PLT
	movl	%eax, %esi
	movl	-30932(%rbp), %eax
	movq	%r12, %r8
	movq	%rbx, %rcx
	movl	%eax, %edx
	leaq	.LC33(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L55
.L45:
	movq	-30976(%rbp), %rax
	addq	$168, %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	movl	-30936(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	-30956(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	cmpq	$0, -30904(%rbp)
	je	.L57
	cmpl	$0, -30984(%rbp)
	je	.L57
	movq	-30968(%rbp), %rax
	movq	16(%rax), %r13
	movq	-30968(%rbp), %rax
	movq	32(%rax), %r12
	movq	-30968(%rbp), %rax
	movq	24(%rax), %rbx
	call	gettid@PLT
	movq	%r13, %r8
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC34(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-30968(%rbp), %rcx
	movq	-30904(%rbp), %rdx
	movl	-30952(%rbp), %esi
	movq	-30976(%rbp), %rax
	movq	%rax, %rdi
	call	prefetch_thread_create
	movl	$0, -30940(%rbp)
	jmp	.L58
.L59:
	movl	-30940(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30904(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	addl	$1, -30940(%rbp)
.L58:
	movl	-30940(%rbp), %eax
	cmpl	-30952(%rbp), %eax
	jl	.L59
.L57:
	movq	-30904(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$1, %eax
.L60:
	movq	-40(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L61
	call	__stack_chk_fail@PLT
.L61:
	leaq	-24(%rbp), %rsp
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
.LC35:
	.string	"\033[35m[+] (%d) Prefetching Cached uri: %s%s\n\033[0m"
	.align 8
.LC36:
	.string	"\033[32m[+] (%d) Serving file from cache: %s%s\n[+] Cache file size: %ld bytes\n\033[0m"
	.align 8
.LC37:
	.string	"\033[31m[-] (%d) Memory allocation failed\n\033[0m"
	.align 8
.LC38:
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
	jne	.L64
	movq	-30824(%rbp), %rax
	movq	16(%rax), %r12
	movq	-30824(%rbp), %rax
	movq	24(%rax), %rbx
	call	gettid@PLT
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC35(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L64:
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
	jle	.L65
	movl	-30836(%rbp), %eax
	movl	$1, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	lseek@PLT
	jmp	.L66
.L65:
	movl	$0, %eax
.L66:
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
	leaq	.LC36(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-30836(%rbp), %eax
	movl	$0, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	lseek@PLT
.L77:
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
	jg	.L67
	movq	-30832(%rbp), %rax
	addq	$168, %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	cmpq	$0, -30792(%rbp)
	jne	.L68
	jmp	.L69
.L67:
	movl	$0, -30812(%rbp)
	leaq	-30812(%rbp), %rdx
	leaq	-30768(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	extract_links@PLT
	movq	%rax, -30776(%rbp)
	movl	-30812(%rbp), %eax
	testl	%eax, %eax
	jle	.L70
	cmpq	$0, -30776(%rbp)
	je	.L70
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
	jne	.L71
	call	gettid@PLT
	movl	%eax, %edx
	movq	stderr(%rip), %rax
	leaq	.LC37(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-30776(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-30832(%rbp), %rax
	addq	$168, %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	movl	$-1, %eax
	jmp	.L83
.L71:
	movl	$0, -30804(%rbp)
	jmp	.L73
.L74:
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
.L73:
	movl	-30812(%rbp), %eax
	cmpl	%eax, -30804(%rbp)
	jl	.L74
	movl	-30812(%rbp), %eax
	addl	%eax, -30808(%rbp)
	movq	-30776(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L70:
	cmpl	$0, -30840(%rbp)
	je	.L77
	movq	-30832(%rbp), %rax
	movl	4(%rax), %eax
	testl	%eax, %eax
	jle	.L77
	movl	-30796(%rbp), %eax
	movslq	%eax, %rdx
	movq	-30832(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30768(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L76
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
	movq	-30832(%rbp), %rax
	addq	$168, %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	movl	$-1, %eax
	jmp	.L83
.L76:
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
	leaq	.LC38(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L77
.L68:
	cmpl	$0, -30844(%rbp)
	je	.L69
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
	leaq	.LC34(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-30824(%rbp), %rcx
	movq	-30792(%rbp), %rdx
	movl	-30808(%rbp), %esi
	movq	-30832(%rbp), %rax
	movq	%rax, %rdi
	call	prefetch_thread_create
.L69:
	movl	-30836(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	cmpq	$0, -30792(%rbp)
	je	.L79
	movl	$0, -30800(%rbp)
	jmp	.L80
.L82:
	movl	-30800(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30792(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L81
	movl	-30800(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30792(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L81:
	addl	$1, -30800(%rbp)
.L80:
	movl	-30800(%rbp), %eax
	cmpl	-30808(%rbp), %eax
	jl	.L82
	movq	-30792(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L79:
	movl	$0, %eax
.L83:
	movq	-40(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L84
	call	__stack_chk_fail@PLT
.L84:
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
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	js	.L86
	cmpl	$0, -36(%rbp)
	je	.L87
.L86:
	movl	-44(%rbp), %ecx
	movl	-40(%rbp), %edx
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	if_not_cached
	movl	%eax, -8(%rbp)
	jmp	.L88
.L87:
	movl	-44(%rbp), %edi
	movl	-40(%rbp), %ecx
	movl	-4(%rbp), %edx
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rax
	movl	%edi, %r8d
	movq	%rax, %rdi
	call	if_cached
	movl	%eax, -8(%rbp)
.L88:
	movl	-8(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	check_and_send_from_cache, .-check_and_send_from_cache
	.section	.rodata
	.align 8
.LC39:
	.string	"\033[31m[-] (%d) Select syscall failed with error: %d (%s)\n\033[0m"
	.align 8
.LC40:
	.string	"\033[33m\n[-] (%d) CONNECTION TIMEOUT:\n[-] Client connection idle for %d seconds\n------------------------------------------------------------\n\033[0m"
	.align 8
.LC41:
	.string	"\033[31m[-] (%d) peer has closed the connection exiting\n"
	.align 8
.LC42:
	.string	"\n\n==============================================================\n[+] (%d) Received request from client [%d bytes]:\n==============================================================\n%s\n"
	.align 8
.LC43:
	.string	"\033[31m[-] (%d) HTTP Parsing Error:\n[-] Error code: 0x%02X\n\033[0m"
	.align 8
.LC44:
	.string	"HTTP/1.0 404 Not Found\r\nContent-Type: text/plain\r\nContent-Length: 19\r\n\r\nSomthing went wrong"
	.align 8
.LC45:
	.string	"\033[31m[-] (%d) ACCESS DENIED: Domain is in blocklist\n[-] Blocked domain: %s\n\033[0m"
	.align 8
.LC46:
	.string	"HTTP/1.0 403 Forbidden\r\nContent-Type: text/plain\r\n\r\nBlocked"
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
	subq	$2400, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -31080(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
.L107:
	leaq	-30880(%rbp), %rax
	movq	%rax, -31048(%rbp)
	movl	$0, -31068(%rbp)
	jmp	.L91
.L92:
	movq	-31048(%rbp), %rax
	movl	-31068(%rbp), %edx
	movq	$0, (%rax,%rdx,8)
	addl	$1, -31068(%rbp)
.L91:
	cmpl	$15, -31068(%rbp)
	jbe	.L92
	movq	-31080(%rbp), %rax
	movl	4(%rax), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	movl	%eax, %esi
	movslq	%esi, %rax
	movq	-30880(%rbp,%rax,8), %rdx
	movq	-31080(%rbp), %rax
	movl	4(%rax), %eax
	andl	$63, %eax
	movl	$1, %edi
	movl	%eax, %ecx
	salq	%cl, %rdi
	movq	%rdi, %rax
	orq	%rax, %rdx
	movslq	%esi, %rax
	movq	%rdx, -30880(%rbp,%rax,8)
	movq	$10, -31024(%rbp)
	movq	$0, -31016(%rbp)
	movq	-31080(%rbp), %rax
	movl	4(%rax), %eax
	leal	1(%rax), %edi
	leaq	-31024(%rbp), %rdx
	leaq	-30880(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	call	select@PLT
	movl	%eax, -31064(%rbp)
	cmpl	$0, -31064(%rbp)
	jns	.L93
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
	leaq	.LC39(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	jmp	.L108
.L93:
	cmpl	$0, -31064(%rbp)
	jne	.L95
	call	gettid@PLT
	movl	$10, %edx
	movl	%eax, %esi
	leaq	.LC40(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L108
.L95:
	movq	-31080(%rbp), %rax
	movl	4(%rax), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	cltq
	movq	-30880(%rbp,%rax,8), %rdx
	movq	-31080(%rbp), %rax
	movl	4(%rax), %eax
	andl	$63, %eax
	movl	$1, %esi
	movl	%eax, %ecx
	salq	%cl, %rsi
	movq	%rsi, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L107
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	$0, -31060(%rbp)
	leaq	-30752(%rbp), %rdx
	movl	-31060(%rbp), %eax
	cltq
	leaq	(%rdx,%rax), %rsi
	movq	-31080(%rbp), %rax
	movl	4(%rax), %eax
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	movl	%eax, -31056(%rbp)
	cmpl	$0, -31056(%rbp)
	js	.L111
	cmpl	$0, -31056(%rbp)
	jne	.L98
	call	gettid@PLT
	movl	%eax, %edx
	movq	stderr(%rip), %rax
	leaq	.LC41(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	jmp	.L108
.L98:
	movl	-31056(%rbp), %eax
	subl	$1, %eax
	addl	%eax, -31060(%rbp)
	call	gettid@PLT
	movl	%eax, %esi
	leaq	-30752(%rbp), %rdx
	movl	-31060(%rbp), %eax
	movq	%rdx, %rcx
	movl	%eax, %edx
	leaq	.LC42(%rip), %rax
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
	jns	.L99
	movl	-30912(%rbp), %ebx
	call	gettid@PLT
	movl	%ebx, %edx
	movl	%eax, %esi
	leaq	.LC43(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC44(%rip), %rax
	movq	%rax, -31032(%rbp)
	movq	-31032(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-31080(%rbp), %rax
	movl	4(%rax), %eax
	movq	-31032(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L112
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
	jmp	.L112
.L99:
	movq	-30984(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	is_blocked@PLT
	testl	%eax, %eax
	je	.L102
	movq	-30984(%rbp), %rbx
	call	gettid@PLT
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC45(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC46(%rip), %rax
	movq	%rax, -31040(%rbp)
	movq	-31040(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-31080(%rbp), %rax
	movl	4(%rax), %eax
	movq	-31040(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L113
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
	jmp	.L108
.L102:
	movq	-30992(%rbp), %rax
	leaq	-30752(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	is_dynamic_content
	movl	%eax, %edx
	movq	-31080(%rbp), %rsi
	leaq	-31008(%rbp), %rax
	movl	$1, %r8d
	movl	$1, %ecx
	movq	%rax, %rdi
	call	check_and_send_from_cache
	movl	%eax, -31052(%rbp)
	movl	-30916(%rbp), %eax
	cmpl	$1, %eax
	jne	.L104
	movl	-30920(%rbp), %eax
	testl	%eax, %eax
	je	.L114
.L104:
	cmpl	$0, -31052(%rbp)
	js	.L114
	leaq	-31008(%rbp), %rax
	movq	%rax, %rdi
	call	cleanup_header@PLT
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	jmp	.L107
.L111:
	nop
	jmp	.L108
.L112:
	nop
	jmp	.L108
.L113:
	nop
	jmp	.L108
.L114:
	nop
.L108:
	leaq	-31008(%rbp), %rax
	movq	%rax, %rdi
	call	cleanup_header@PLT
	movq	-31080(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$0, %eax
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L110
	call	__stack_chk_fail@PLT
.L110:
	addq	$31072, %rsp
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
