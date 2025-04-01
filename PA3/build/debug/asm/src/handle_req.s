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
.LC7:
	.string	"PREFETCING"
.LC8:
	.string	"80"
.LC9:
	.string	"8080"
.LC10:
	.string	"localhost"
.LC11:
	.string	"127.0.1.1"
	.align 8
.LC12:
	.string	"HTTP/1.0 404 Not Found\r\nContent-Type: text/plain\n\r\n\r cannot req proxy"
	.align 8
.LC13:
	.string	"\033[31m[-] send-server failed for server %d\n\033[0m"
.LC14:
	.string	"\033[31mgetaddrinfo\n\033[0m"
	.align 8
.LC15:
	.string	"HTTP/1.0 403 Forbidden\n\rContent-Type: text/plain\n\r\n\rBlocked"
.LC16:
	.string	"\033[31mserver: socket"
	.align 8
.LC17:
	.string	"\033[31m[-] connect failed for server %d\n\033[0m"
	.align 8
.LC18:
	.string	"\033[31m[-] socket connection failed for server \n\033[0m"
.LC19:
	.string	"[+] client: connecting to %s\n"
.LC20:
	.string	"Connection: Keep-alive"
.LC21:
	.string	"Connection: close"
	.align 8
.LC22:
	.string	"GET %s HTTP/1.0\r\nHost: %s\r\n%s\r\n"
.LC23:
	.string	"GET %s HTTP/1.0\r\nHost: %s\r\n\r\n"
	.align 8
.LC24:
	.string	"\033[31m[-] send failed for server %d \n\033[0m"
	.align 8
.LC25:
	.string	"\033[31m[-] recv failed for server \n\033[0m"
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
	leaq	-28672(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$2288, %rsp
	movq	%rdi, -30936(%rbp)
	movq	%rsi, -30944(%rbp)
	movl	%edx, -30948(%rbp)
	movl	%ecx, -30952(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpl	$0, -30952(%rbp)
	jne	.L16
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L16:
	movl	$0, -30912(%rbp)
	movq	$0, -30872(%rbp)
	leaq	-30832(%rbp), %rax
	movl	$48, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	$0, -30828(%rbp)
	movl	$1, -30824(%rbp)
	movq	-30936(%rbp), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	jne	.L17
	movq	-30936(%rbp), %rax
	leaq	.LC8(%rip), %rdx
	movq	%rdx, 32(%rax)
.L17:
	movq	-30936(%rbp), %rax
	movq	32(%rax), %rax
	leaq	.LC9(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L18
	movq	-30936(%rbp), %rax
	movq	24(%rax), %rax
	leaq	.LC10(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L19
	movq	-30936(%rbp), %rax
	movq	24(%rax), %rax
	leaq	.LC11(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L18
.L19:
	leaq	.LC12(%rip), %rax
	movq	%rax, -30864(%rbp)
	movq	-30864(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-30944(%rbp), %rax
	movl	4(%rax), %eax
	movq	-30864(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L18
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC13(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-30944(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
.L18:
	movq	-30936(%rbp), %rax
	movq	32(%rax), %rsi
	movq	-30936(%rbp), %rax
	movq	24(%rax), %rax
	leaq	-30896(%rbp), %rcx
	leaq	-30832(%rbp), %rdx
	movq	%rax, %rdi
	call	getaddrinfo@PLT
	testl	%eax, %eax
	jns	.L20
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	leaq	.LC15(%rip), %rax
	movq	%rax, -30856(%rbp)
	movq	-30856(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-30944(%rbp), %rax
	movl	4(%rax), %eax
	movq	-30856(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L20
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC13(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-30944(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
.L20:
	movq	-30896(%rbp), %rax
	movq	%rax, -30880(%rbp)
	jmp	.L21
.L26:
	movq	-30880(%rbp), %rax
	movl	12(%rax), %edx
	movq	-30880(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-30880(%rbp), %rax
	movl	4(%rax), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	socket@PLT
	movl	%eax, -30916(%rbp)
	cmpl	$0, -30916(%rbp)
	jns	.L22
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	jmp	.L23
.L22:
	movq	-30880(%rbp), %rax
	movl	16(%rax), %edx
	movq	-30880(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	movl	-30916(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	connect@PLT
	testl	%eax, %eax
	jns	.L42
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC17(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	-30916(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	nop
.L23:
	movq	-30880(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -30880(%rbp)
.L21:
	cmpq	$0, -30880(%rbp)
	jne	.L26
	jmp	.L25
.L42:
	nop
.L25:
	cmpq	$0, -30880(%rbp)
	jne	.L27
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$50, %edx
	movl	$1, %esi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	-30916(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$1, %edi
	call	exit@PLT
.L27:
	movq	-30880(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	get_in_addr
	movq	%rax, %rsi
	movq	-30880(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30784(%rbp), %rdx
	movl	$46, %ecx
	movl	%eax, %edi
	call	inet_ntop@PLT
	leaq	-30784(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-30896(%rbp), %rax
	movq	%rax, %rdi
	call	freeaddrinfo@PLT
	movq	-30936(%rbp), %rax
	movl	88(%rax), %eax
	testl	%eax, %eax
	je	.L28
	leaq	.LC20(%rip), %rax
	jmp	.L29
.L28:
	leaq	.LC21(%rip), %rax
.L29:
	movq	%rax, -30848(%rbp)
	movq	-30936(%rbp), %rax
	movq	112(%rax), %rax
	testq	%rax, %rax
	je	.L30
	movq	-30936(%rbp), %rax
	movq	112(%rax), %rsi
	movq	-30936(%rbp), %rax
	movq	24(%rax), %rcx
	movq	-30936(%rbp), %rax
	movq	16(%rax), %rdx
	leaq	-30888(%rbp), %rax
	movq	%rsi, %r8
	leaq	.LC22(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	jmp	.L31
.L30:
	movq	-30936(%rbp), %rax
	movq	24(%rax), %rcx
	movq	-30936(%rbp), %rax
	movq	16(%rax), %rdx
	leaq	-30888(%rbp), %rax
	leaq	.LC23(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
.L31:
	movq	-30888(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-30888(%rbp), %rsi
	movl	-30916(%rbp), %eax
	movl	$16384, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L32
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC24(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	-30916(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$1, %edi
	call	exit@PLT
.L32:
	movq	-30936(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-30936(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	cache_add_new@PLT
	movl	%eax, -30904(%rbp)
	movq	-30888(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L40:
	leaq	-30736(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30736(%rbp), %rsi
	movl	-30916(%rbp), %eax
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	movl	%eax, -30900(%rbp)
	cmpl	$0, -30900(%rbp)
	jg	.L33
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$37, %edx
	movl	$1, %esi
	leaq	.LC25(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	-30916(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	cmpq	$0, -30872(%rbp)
	jne	.L34
	jmp	.L35
.L33:
	movl	-30900(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-30736(%rbp), %rcx
	movl	-30904(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movl	$0, -30920(%rbp)
	leaq	-30920(%rbp), %rdx
	leaq	-30736(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	extract_links@PLT
	movq	%rax, -30840(%rbp)
	movl	-30920(%rbp), %eax
	testl	%eax, %eax
	jle	.L36
	cmpq	$0, -30840(%rbp)
	je	.L36
	movl	-30920(%rbp), %edx
	movl	-30912(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30872(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, -30872(%rbp)
	movl	$0, -30908(%rbp)
	jmp	.L37
.L38:
	movl	-30908(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30840(%rbp), %rax
	addq	%rdx, %rax
	movl	-30912(%rbp), %ecx
	movl	-30908(%rbp), %edx
	addl	%ecx, %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-30872(%rbp), %rdx
	addq	%rcx, %rdx
	movq	(%rax), %rax
	movq	%rax, (%rdx)
	addl	$1, -30908(%rbp)
.L37:
	movl	-30920(%rbp), %eax
	cmpl	%eax, -30908(%rbp)
	jl	.L38
	movl	-30920(%rbp), %eax
	addl	%eax, -30912(%rbp)
	movq	-30840(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L36:
	cmpl	$0, -30948(%rbp)
	je	.L40
	movl	-30900(%rbp), %eax
	movslq	%eax, %rdx
	movq	-30944(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30736(%rbp), %rsi
	movl	$16384, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L40
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC13(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	-30916(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L40
.L34:
	cmpl	$0, -30952(%rbp)
	je	.L35
	movq	-30936(%rbp), %rcx
	movq	-30872(%rbp), %rdx
	movl	-30912(%rbp), %esi
	movq	-30944(%rbp), %rax
	movq	%rax, %rdi
	call	prefetch_thread_create
.L35:
	movq	-30872(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	-30904(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L41
	call	__stack_chk_fail@PLT
.L41:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	if_not_cached, .-if_not_cached
	.section	.rodata
.LC26:
	.string	"PREFETCING\n\r"
.LC27:
	.string	"\033[33mSent from cache \n\r\033[0m"
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
	cmpl	$0, -30812(%rbp)
	jne	.L44
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L44:
	movq	$0, -30768(%rbp)
	movl	$0, -30780(%rbp)
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L51:
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
	jle	.L54
	movl	$0, -30784(%rbp)
	leaq	-30784(%rbp), %rdx
	leaq	-30752(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	extract_links@PLT
	movq	%rax, -30760(%rbp)
	movl	-30784(%rbp), %eax
	testl	%eax, %eax
	jle	.L47
	cmpq	$0, -30760(%rbp)
	je	.L47
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
	jmp	.L48
.L49:
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
.L48:
	movl	-30784(%rbp), %eax
	cmpl	%eax, -30776(%rbp)
	jl	.L49
	movl	-30784(%rbp), %eax
	addl	%eax, -30780(%rbp)
	movq	-30760(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L47:
	cmpl	$0, -30808(%rbp)
	je	.L51
	movl	-30772(%rbp), %eax
	movslq	%eax, %rdx
	movq	-30800(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30752(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L51
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC13(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-30800(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L46
.L54:
	nop
.L46:
	cmpq	$0, -30768(%rbp)
	je	.L52
	cmpl	$0, -30812(%rbp)
	je	.L52
	movq	-30792(%rbp), %rcx
	movq	-30768(%rbp), %rdx
	movl	-30780(%rbp), %esi
	movq	-30800(%rbp), %rax
	movq	%rax, %rdi
	call	prefetch_thread_create
.L52:
	movq	-30768(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	-30804(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	nop
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L53
	call	__stack_chk_fail@PLT
.L53:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	if_cached, .-if_cached
	.section	.rodata
	.align 8
.LC28:
	.string	"header->hostname %s, header->uri_str %s \n"
	.text
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
	movq	-24(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC28(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
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
	js	.L56
	cmpl	$0, -36(%rbp)
	je	.L57
.L56:
	movl	-44(%rbp), %ecx
	movl	-40(%rbp), %edx
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	if_not_cached
	jmp	.L58
.L57:
	movl	-44(%rbp), %edi
	movl	-40(%rbp), %ecx
	movl	-4(%rbp), %edx
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rax
	movl	%edi, %r8d
	movq	%rax, %rdi
	call	if_cached
.L58:
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
	.string	"\033[31m[-] read"
	.align 8
.LC32:
	.string	"HTTP/1.0 404 Not Found\n\rContent-Type: text/plain\n\r\n\rSomthing went wrong"
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
	leaq	-28672(%rsp), %r11
.LPSRL2:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL2
	subq	$2384, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.L75:
	leaq	-30736(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30864(%rbp), %rax
	movq	%rax, -31032(%rbp)
	movl	$0, -31048(%rbp)
	jmp	.L60
.L61:
	movq	-31032(%rbp), %rax
	movl	-31048(%rbp), %edx
	movq	$0, (%rax,%rdx,8)
	addl	$1, -31048(%rbp)
.L60:
	cmpl	$15, -31048(%rbp)
	jbe	.L61
	movl	20(%rbp), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	movl	%eax, %esi
	movslq	%esi, %rax
	movq	-30864(%rbp,%rax,8), %rax
	movl	20(%rbp), %edx
	andl	$63, %edx
	movl	$1, %edi
	movl	%edx, %ecx
	salq	%cl, %rdi
	movq	%rdi, %rdx
	orq	%rax, %rdx
	movslq	%esi, %rax
	movq	%rdx, -30864(%rbp,%rax,8)
	movq	$2, -31008(%rbp)
	movq	$0, -31000(%rbp)
	movl	20(%rbp), %eax
	leal	1(%rax), %edi
	leaq	-31008(%rbp), %rdx
	leaq	-30864(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	call	select@PLT
	movl	%eax, -31044(%rbp)
	cmpl	$0, -31044(%rbp)
	jns	.L62
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	jmp	.L76
.L62:
	cmpl	$0, -31044(%rbp)
	jne	.L64
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L76
.L64:
	movl	20(%rbp), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	cltq
	movq	-30864(%rbp,%rax,8), %rdx
	movl	20(%rbp), %eax
	andl	$63, %eax
	movl	$1, %esi
	movl	%eax, %ecx
	salq	%cl, %rsi
	movq	%rsi, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L75
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
	movl	%eax, -31040(%rbp)
	cmpl	$0, -31040(%rbp)
	jns	.L66
	leaq	.LC31(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$0, %eax
	jmp	.L77
.L66:
	leaq	-30992(%rbp), %rax
	movl	$120, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30992(%rbp), %rdx
	leaq	-30736(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	parse_request_line_thread_safe@PLT
	testl	%eax, %eax
	jns	.L68
	leaq	.LC32(%rip), %rax
	movq	%rax, -31016(%rbp)
	movq	-31016(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movl	20(%rbp), %eax
	movq	-31016(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L79
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC13(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	jmp	.L79
.L68:
	movq	-30968(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	is_blocked@PLT
	testl	%eax, %eax
	je	.L71
	leaq	.LC15(%rip), %rax
	movq	%rax, -31024(%rbp)
	movq	-31024(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movl	20(%rbp), %eax
	movq	-31024(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L80
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC13(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	jmp	.L76
.L71:
	movq	-30976(%rbp), %rax
	leaq	-30736(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	is_dynamic_content
	movl	%eax, %edx
	leaq	-30992(%rbp), %rax
	movl	$1, %r8d
	movl	$1, %ecx
	leaq	16(%rbp), %rsi
	movq	%rax, %rdi
	call	check_and_send_from_cache
	movl	-30900(%rbp), %eax
	cmpl	$1, %eax
	je	.L81
	movl	-30904(%rbp), %eax
	testl	%eax, %eax
	je	.L81
	leaq	-30992(%rbp), %rax
	movl	$120, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30736(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	jmp	.L75
.L79:
	nop
	jmp	.L76
.L80:
	nop
	jmp	.L76
.L81:
	nop
.L76:
	movl	-31036(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	20(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$0, %eax
.L77:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L78
	call	__stack_chk_fail@PLT
.L78:
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
