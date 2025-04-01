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
	.string	"80"
.LC8:
	.string	"8080"
.LC9:
	.string	"localhost"
.LC10:
	.string	"127.0.1.1"
	.align 8
.LC11:
	.string	"HTTP/1.0 404 Not Found\r\nContent-Type: text/plain\n\r\n\r cannot req proxy"
	.align 8
.LC12:
	.string	"\033[31m[-] send-server failed for server %d\n\033[0m"
.LC13:
	.string	"\033[31mgetaddrinfo\n\033[0m"
	.align 8
.LC14:
	.string	"HTTP/1.0 403 Forbidden\n\rContent-Type: text/plain\n\r\n\rBlocked"
.LC15:
	.string	"\033[31mserver: socket"
	.align 8
.LC16:
	.string	"\033[31m[-] connect failed for server %d\n\033[0m"
	.align 8
.LC17:
	.string	"\033[31m[-] socket connection failed for server \n\033[0m"
.LC18:
	.string	"[+] client: connecting to %s\n"
.LC19:
	.string	"Connection: Keep-alive"
.LC20:
	.string	"Connection: close"
	.align 8
.LC21:
	.string	"GET %s HTTP/1.0\r\nHost: %s\r\n%s\r\n"
	.align 8
.LC22:
	.string	"\033[31m[-] send failed for server %d \n\033[0m"
	.align 8
.LC23:
	.string	"\033[31m[-] recv failed for server \n\033[0m"
.LC24:
	.string	"all links[total_links] %s\n"
	.text
	.globl	if_not_cached
	.type	if_not_cached, @function
if_not_cached:
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
	subq	$2296, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -30968(%rbp)
	movq	%rsi, -30976(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	$0, -30948(%rbp)
	movq	$0, -30896(%rbp)
	leaq	-30848(%rbp), %rax
	movl	$48, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	$0, -30844(%rbp)
	movl	$1, -30840(%rbp)
	movq	-30968(%rbp), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	jne	.L12
	movq	-30968(%rbp), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rdx, 32(%rax)
.L12:
	movq	-30968(%rbp), %rax
	movq	32(%rax), %rax
	leaq	.LC8(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L13
	movq	-30968(%rbp), %rax
	movq	24(%rax), %rax
	leaq	.LC9(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L14
	movq	-30968(%rbp), %rax
	movq	24(%rax), %rax
	leaq	.LC10(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L13
.L14:
	leaq	.LC11(%rip), %rax
	movq	%rax, -30888(%rbp)
	movq	-30888(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-30976(%rbp), %rax
	movl	4(%rax), %eax
	movq	-30888(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L13
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC12(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-30976(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
.L13:
	movq	-30968(%rbp), %rax
	movq	32(%rax), %rsi
	movq	-30968(%rbp), %rax
	movq	24(%rax), %rax
	leaq	-30928(%rbp), %rcx
	leaq	-30848(%rbp), %rdx
	movq	%rax, %rdi
	call	getaddrinfo@PLT
	testl	%eax, %eax
	jns	.L15
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	leaq	.LC14(%rip), %rax
	movq	%rax, -30880(%rbp)
	movq	-30880(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-30976(%rbp), %rax
	movl	4(%rax), %eax
	movq	-30880(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L15
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC12(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-30976(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
.L15:
	movq	-30928(%rbp), %rax
	movq	%rax, -30904(%rbp)
	jmp	.L16
.L21:
	movq	-30904(%rbp), %rax
	movl	12(%rax), %edx
	movq	-30904(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-30904(%rbp), %rax
	movl	4(%rax), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	socket@PLT
	movl	%eax, -30952(%rbp)
	cmpl	$0, -30952(%rbp)
	jns	.L17
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	jmp	.L18
.L17:
	movq	-30904(%rbp), %rax
	movl	16(%rax), %edx
	movq	-30904(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	movl	-30952(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	connect@PLT
	testl	%eax, %eax
	jns	.L37
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC16(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	-30952(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	nop
.L18:
	movq	-30904(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -30904(%rbp)
.L16:
	cmpq	$0, -30904(%rbp)
	jne	.L21
	jmp	.L20
.L37:
	nop
.L20:
	cmpq	$0, -30904(%rbp)
	jne	.L22
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$50, %edx
	movl	$1, %esi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	-30952(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$1, %edi
	call	exit@PLT
.L22:
	movq	-30904(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	get_in_addr
	movq	%rax, %rsi
	movq	-30904(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30800(%rbp), %rdx
	movl	$46, %ecx
	movl	%eax, %edi
	call	inet_ntop@PLT
	leaq	-30800(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-30928(%rbp), %rax
	movq	%rax, %rdi
	call	freeaddrinfo@PLT
	movq	-30968(%rbp), %rax
	movl	88(%rax), %eax
	testl	%eax, %eax
	je	.L23
	leaq	.LC19(%rip), %rax
	jmp	.L24
.L23:
	leaq	.LC20(%rip), %rax
.L24:
	movq	%rax, -30872(%rbp)
	movq	-30968(%rbp), %rax
	movq	112(%rax), %rsi
	movq	-30968(%rbp), %rax
	movq	24(%rax), %rcx
	movq	-30968(%rbp), %rax
	movq	16(%rax), %rdx
	leaq	-30920(%rbp), %rax
	movq	%rsi, %r8
	leaq	.LC21(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	movq	-30920(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-30920(%rbp), %rsi
	movl	-30952(%rbp), %eax
	movl	$16384, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L25
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC22(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	-30952(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$1, %edi
	call	exit@PLT
.L25:
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
.L33:
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30752(%rbp), %rsi
	movl	-30952(%rbp), %eax
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	movl	%eax, -30932(%rbp)
	cmpl	$0, -30932(%rbp)
	jg	.L26
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$37, %edx
	movl	$1, %esi
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	-30952(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	cmpq	$0, -30896(%rbp)
	jne	.L27
	jmp	.L28
.L26:
	movl	-30932(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-30752(%rbp), %rcx
	movl	-30936(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movl	$0, -30912(%rbp)
	leaq	-30912(%rbp), %rdx
	leaq	-30752(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	extract_links@PLT
	movq	%rax, -30864(%rbp)
	movl	-30912(%rbp), %eax
	testl	%eax, %eax
	jle	.L29
	cmpq	$0, -30864(%rbp)
	je	.L29
	movl	-30912(%rbp), %edx
	movl	-30948(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30896(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, -30896(%rbp)
	movl	$0, -30944(%rbp)
	jmp	.L30
.L31:
	movl	-30944(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30864(%rbp), %rax
	addq	%rdx, %rax
	movl	-30948(%rbp), %ecx
	movl	-30944(%rbp), %edx
	addl	%ecx, %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-30896(%rbp), %rdx
	addq	%rcx, %rdx
	movq	(%rax), %rax
	movq	%rax, (%rdx)
	movl	-30948(%rbp), %edx
	movl	-30944(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30896(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -30944(%rbp)
.L30:
	movl	-30912(%rbp), %eax
	cmpl	%eax, -30944(%rbp)
	jl	.L31
	movl	-30912(%rbp), %eax
	addl	%eax, -30948(%rbp)
	movq	-30864(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L29:
	movl	-30932(%rbp), %eax
	movslq	%eax, %rdx
	movq	-30976(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30752(%rbp), %rsi
	movl	$16384, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L33
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC12(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	-30952(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L33
.L27:
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -30856(%rbp)
	movl	-30948(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	movq	-30856(%rbp), %rax
	movq	%rdx, 8(%rax)
	movl	$0, -30940(%rbp)
	jmp	.L34
.L35:
	movl	-30940(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30896(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	-30856(%rbp), %rdx
	movq	8(%rdx), %rdx
	movl	-30940(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	leaq	(%rdx,%rcx), %rbx
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, (%rbx)
	addl	$1, -30940(%rbp)
.L34:
	movl	-30940(%rbp), %eax
	cmpl	-30948(%rbp), %eax
	jl	.L35
	movq	-30856(%rbp), %rax
	movl	-30948(%rbp), %edx
	movl	%edx, (%rax)
	movq	-30968(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	movq	-30856(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-30856(%rbp), %rdx
	leaq	-30912(%rbp), %rax
	movq	%rdx, %rcx
	movq	prefetch_thread_func@GOTPCREL(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	movq	-30912(%rbp), %rax
	movq	%rax, %rdi
	call	pthread_detach@PLT
.L28:
	movq	-30896(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	-30936(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	nop
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L36
	call	__stack_chk_fail@PLT
.L36:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	if_not_cached, .-if_not_cached
	.section	.rodata
.LC25:
	.string	"\033[33mSent from cache \n\r\033[0m"
	.text
	.globl	if_cached
	.type	if_cached, @function
if_cached:
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
.LPSRL1:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL1
	subq	$2152, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -30808(%rbp)
	movq	%rsi, -30816(%rbp)
	movl	%edx, -30820(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movq	$0, -30776(%rbp)
	movl	$0, -30800(%rbp)
	leaq	.LC25(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L45:
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
	movl	%eax, -30788(%rbp)
	cmpl	$0, -30788(%rbp)
	jle	.L50
	movl	$0, -30784(%rbp)
	leaq	-30784(%rbp), %rdx
	leaq	-30752(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	extract_links@PLT
	movq	%rax, -30768(%rbp)
	movl	-30784(%rbp), %eax
	testl	%eax, %eax
	jle	.L41
	cmpq	$0, -30768(%rbp)
	je	.L41
	movl	-30784(%rbp), %edx
	movl	-30800(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30776(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, -30776(%rbp)
	movl	$0, -30796(%rbp)
	jmp	.L42
.L43:
	movl	-30796(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30768(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-30800(%rbp), %ecx
	movl	-30796(%rbp), %edx
	addl	%ecx, %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-30776(%rbp), %rdx
	leaq	(%rcx,%rdx), %rbx
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, (%rbx)
	addl	$1, -30796(%rbp)
.L42:
	movl	-30784(%rbp), %eax
	cmpl	%eax, -30796(%rbp)
	jl	.L43
	movl	-30784(%rbp), %eax
	addl	%eax, -30800(%rbp)
	movq	-30768(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L41:
	movl	-30788(%rbp), %eax
	movslq	%eax, %rdx
	movq	-30816(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30752(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L45
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC12(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-30816(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L40
.L50:
	nop
.L40:
	cmpq	$0, -30776(%rbp)
	je	.L46
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -30760(%rbp)
	movl	-30800(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	movq	-30760(%rbp), %rax
	movq	%rdx, 8(%rax)
	movl	$0, -30792(%rbp)
	jmp	.L47
.L48:
	movl	-30792(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30776(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	-30760(%rbp), %rdx
	movq	8(%rdx), %rdx
	movl	-30792(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	leaq	(%rdx,%rcx), %rbx
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, (%rbx)
	addl	$1, -30792(%rbp)
.L47:
	movl	-30792(%rbp), %eax
	cmpl	-30800(%rbp), %eax
	jl	.L48
	movq	-30760(%rbp), %rax
	movl	-30800(%rbp), %edx
	movl	%edx, (%rax)
	movq	-30808(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	movq	-30760(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-30760(%rbp), %rdx
	leaq	-30784(%rbp), %rax
	movq	%rdx, %rcx
	movq	prefetch_thread_func@GOTPCREL(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	movq	-30784(%rbp), %rax
	movq	%rax, %rdi
	call	pthread_detach@PLT
.L46:
	movq	-30776(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	-30820(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	nop
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L49
	call	__stack_chk_fail@PLT
.L49:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	if_cached, .-if_cached
	.section	.rodata
.LC26:
	.string	"\033[31mselect error"
	.align 8
.LC27:
	.string	"\033[33m[-] (%d) Connection timed out\n\033[0m"
.LC28:
	.string	"\033[31m[-] read"
	.align 8
.LC29:
	.string	"HTTP/1.0 404 Not Found\n\rContent-Type: text/plain\n\r\n\rSomthing went wrong"
	.text
	.globl	handle_req
	.type	handle_req, @function
handle_req:
.LFB10:
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
.L70:
	leaq	-30736(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30864(%rbp), %rax
	movq	%rax, -31032(%rbp)
	movl	$0, -31044(%rbp)
	jmp	.L52
.L53:
	movq	-31032(%rbp), %rax
	movl	-31044(%rbp), %edx
	movq	$0, (%rax,%rdx,8)
	addl	$1, -31044(%rbp)
.L52:
	cmpl	$15, -31044(%rbp)
	jbe	.L53
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
	movl	%eax, -31040(%rbp)
	cmpl	$0, -31040(%rbp)
	jns	.L54
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	jmp	.L71
.L54:
	cmpl	$0, -31040(%rbp)
	jne	.L56
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L71
.L56:
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
	je	.L70
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
	movl	%eax, -31036(%rbp)
	cmpl	$0, -31036(%rbp)
	jns	.L58
	leaq	.LC28(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$0, %eax
	jmp	.L72
.L58:
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
	jns	.L60
	leaq	.LC29(%rip), %rax
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
	jns	.L74
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC12(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	jmp	.L74
.L60:
	movq	-30968(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	is_blocked@PLT
	testl	%eax, %eax
	je	.L63
	leaq	.LC14(%rip), %rax
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
	jns	.L75
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC12(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	jmp	.L71
.L63:
	movq	-30976(%rbp), %rdx
	movq	-30968(%rbp), %rax
	movl	$60, %ecx
	movq	%rax, %rsi
	movl	$0, %edi
	call	cache_lookup@PLT
	movl	%eax, -31048(%rbp)
	cmpl	$0, -31048(%rbp)
	js	.L65
	movq	-30976(%rbp), %rax
	leaq	-30736(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	is_dynamic_content
	testl	%eax, %eax
	je	.L66
.L65:
	leaq	-30992(%rbp), %rax
	leaq	16(%rbp), %rsi
	movq	%rax, %rdi
	call	if_not_cached
	jmp	.L67
.L66:
	movl	-31048(%rbp), %edx
	leaq	-30992(%rbp), %rax
	leaq	16(%rbp), %rsi
	movq	%rax, %rdi
	call	if_cached
.L67:
	movl	-31048(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	-30900(%rbp), %eax
	cmpl	$1, %eax
	je	.L76
	movl	-30904(%rbp), %eax
	testl	%eax, %eax
	je	.L76
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
	jmp	.L70
.L74:
	nop
	jmp	.L71
.L75:
	nop
	jmp	.L71
.L76:
	nop
.L71:
	movl	-31048(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	20(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$0, %eax
.L72:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L73
	call	__stack_chk_fail@PLT
.L73:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
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
