	.file	"parser.c"
	.text
	.section	.rodata
.LC0:
	.string	"GET"
.LC1:
	.string	"POST"
.LC2:
	.string	"DELETE"
.LC3:
	.string	"PATCH"
.LC4:
	.string	""
	.section	.data.rel.local,"aw"
	.align 32
	.type	reqMethod, @object
	.size	reqMethod, 56
reqMethod:
	.quad	.LC0
	.quad	.LC1
	.quad	.LC2
	.quad	.LC3
	.quad	.LC4
	.quad	.LC4
	.quad	.LC4
	.section	.rodata
.LC5:
	.string	"HTTP/1.0"
.LC6:
	.string	"HTTP/1.1"
	.section	.data.rel.local
	.align 32
	.type	http_type, @object
	.size	http_type, 32
http_type:
	.quad	.LC5
	.quad	.LC6
	.zero	16
	.section	.rodata
.LC7:
	.string	"://"
.LC8:
	.string	"/"
	.text
	.globl	extract_uri_path
	.type	extract_uri_path, @function
extract_uri_path:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	-40(%rbp), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L2
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	jmp	.L3
.L2:
	movq	-24(%rbp), %rax
	addq	$3, %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	$47, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L4
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	jmp	.L3
.L4:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	extract_uri_path, .-extract_uri_path
	.section	.rodata
.LC9:
	.string	"Invalid header pointer"
.LC10:
	.string	"Request exceeds maximum size"
.LC11:
	.string	"Empty request"
	.align 8
.LC12:
	.string	"\033[31m[-] (%d) Parse error: %s\n\033[0m"
.LC13:
	.string	"\r\n"
	.align 8
.LC14:
	.string	"\033[31m\n[-] (%d) ERROR: HTTP request has no valid lines\n------------------------------------------------------------\n\033[0m"
.LC15:
	.string	" "
.LC16:
	.string	"\033[31m[-] (%d) no method \n\033[0m"
	.align 8
.LC17:
	.string	"\033[31m[-] (%d)no valid header \n\033[0m"
	.align 8
.LC18:
	.string	"\033[31m[-] (%d)no valid method \n\033[0m"
	.align 8
.LC19:
	.string	"\033[31m[-] (%d)no valid uri \n\033[0m"
.LC20:
	.string	"\033[31m[-] (%d)uri len =0 \n\033[0m"
.LC21:
	.string	".."
.LC22:
	.string	"\033[31m[-] (%d)uri has .. \n\033[0m"
	.align 8
.LC23:
	.string	"\033[31m[-] (%d)uri str null \n\033[0m"
	.align 8
.LC24:
	.string	"\033[31m[-] (%d)no version found\n\033[0m"
.LC25:
	.string	"HTTP/1."
	.align 8
.LC26:
	.string	"\033[31m[-] (%d)wrong thing found\n\033[0m"
	.align 8
.LC27:
	.string	"\033[31m[-] (%d)somthing wrong in version\n\033[0m"
.LC28:
	.string	":"
.LC29:
	.string	"Host"
.LC30:
	.string	"\033[31m[-] (%d)no host\n\033[0m"
.LC31:
	.string	"\033[31m[-] (%d) no host\n\033[0m"
.LC32:
	.string	"Connection"
.LC33:
	.string	"keep-alive"
.LC34:
	.string	"Close"
.LC35:
	.string	"Cache-Control"
	.align 8
.LC36:
	.string	"[-] (%d) key:value not found in header!\033[0m"
	.align 8
.LC37:
	.string	"\033[31m[-] (%d) Memory allocation failed\n\033[0m"
	.align 8
.LC38:
	.string	"[-] (%d) No host in HTTP/1.1 header\n\033[0m"
	.text
	.globl	parse_request_line_thread_safe
	.type	parse_request_line_thread_safe, @function
parse_request_line_thread_safe:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$240, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -248(%rbp)
	movq	%rsi, -256(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %r12
	cmpq	$0, -248(%rbp)
	je	.L6
	cmpq	$0, -256(%rbp)
	je	.L6
	movq	-248(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	cmpq	$30720, %rax
	jbe	.L7
.L6:
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	orl	$2, %eax
	movl	%eax, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 96(%rax)
	cmpq	$0, -248(%rbp)
	je	.L8
	cmpq	$0, -256(%rbp)
	jne	.L9
	leaq	.LC9(%rip), %rbx
	jmp	.L11
.L9:
	leaq	.LC10(%rip), %rbx
	jmp	.L11
.L8:
	leaq	.LC11(%rip), %rbx
.L11:
	call	gettid@PLT
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %eax
	jmp	.L12
.L7:
	movq	-248(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	addq	$1, %rax
	movq	%rax, %rdx
	subq	$1, %rdx
	movq	%rdx, -184(%rbp)
	movl	$16, %edx
	subq	$1, %rdx
	addq	%rdx, %rax
	movl	$16, %ebx
	movl	$0, %edx
	divq	%rbx
	imulq	$16, %rax, %rax
	movq	%rax, %rcx
	andq	$-4096, %rcx
	movq	%rsp, %rdx
	subq	%rcx, %rdx
.L13:
	cmpq	%rdx, %rsp
	je	.L14
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L13
.L14:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L15
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L15:
	movq	%rsp, %rax
	movq	%rax, -176(%rbp)
	movq	-248(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-248(%rbp), %rcx
	movq	-176(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	movq	-256(%rbp), %rax
	movl	$120, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movq	-256(%rbp), %rax
	movl	$2, (%rax)
	movq	-256(%rbp), %rax
	movl	$-1, 56(%rax)
	movq	-256(%rbp), %rax
	movl	$0, 100(%rax)
	movl	$0, -236(%rbp)
	movq	$0, -216(%rbp)
	leaq	-216(%rbp), %rdx
	movq	-176(%rbp), %rax
	leaq	.LC13(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strtok_r@PLT
	movq	%rax, -200(%rbp)
	jmp	.L16
.L19:
	movq	-200(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L17
	movl	-236(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -236(%rbp)
	cltq
	movq	-200(%rbp), %rdx
	movq	%rdx, -96(%rbp,%rax,8)
.L17:
	leaq	-216(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok_r@PLT
	movq	%rax, -200(%rbp)
.L16:
	cmpq	$0, -200(%rbp)
	je	.L18
	cmpl	$6, -236(%rbp)
	jle	.L19
.L18:
	cmpl	$0, -236(%rbp)
	jne	.L20
	movq	-248(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	testq	%rax, %rax
	jne	.L20
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	orl	$2, %eax
	movl	%eax, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L12
.L20:
	movq	$0, -168(%rbp)
	movq	$0, -160(%rbp)
	movq	$0, -152(%rbp)
	movq	$0, -208(%rbp)
	movq	-96(%rbp), %rax
	leaq	-208(%rbp), %rdx
	leaq	.LC15(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strtok_r@PLT
	movq	%rax, -168(%rbp)
	cmpq	$0, -168(%rbp)
	jne	.L21
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	orl	$2, %eax
	movl	%eax, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L12
.L21:
	movl	$0, -232(%rbp)
	movl	$0, -228(%rbp)
	movl	$0, -224(%rbp)
	jmp	.L22
.L27:
	movq	-168(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movl	-224(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	leaq	reqMethod(%rip), %rax
	movq	(%rcx,%rax), %rcx
	movq	-168(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	testl	%eax, %eax
	jne	.L23
	movq	-168(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	reqMethod(%rip), %rcx
	movq	-168(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	testl	%eax, %eax
	jne	.L24
	movl	-224(%rbp), %edx
	movq	-256(%rbp), %rax
	movl	%edx, 56(%rax)
	movl	-224(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	reqMethod(%rip), %rax
	movq	(%rdx,%rax), %rdx
	movq	-256(%rbp), %rax
	movq	%rdx, 64(%rax)
	movl	$1, -232(%rbp)
	movl	$1, -228(%rbp)
	jmp	.L26
.L24:
	movl	$1, -228(%rbp)
	movl	$0, -232(%rbp)
	jmp	.L26
.L23:
	addl	$1, -224(%rbp)
.L22:
	cmpl	$5, -224(%rbp)
	jle	.L27
.L26:
	cmpl	$0, -228(%rbp)
	jne	.L28
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	orl	$2, %eax
	movl	%eax, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L12
.L28:
	cmpl	$0, -232(%rbp)
	jne	.L29
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	orl	$16, %eax
	movl	%eax, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L12
.L29:
	leaq	-208(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok_r@PLT
	movq	%rax, -160(%rbp)
	cmpq	$0, -160(%rbp)
	jne	.L30
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	orl	$-2, %eax
	movl	%eax, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L12
.L30:
	movq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, -144(%rbp)
	cmpq	$0, -144(%rbp)
	jne	.L31
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	orl	$2, %eax
	movl	%eax, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L12
.L31:
	movq	-160(%rbp), %rax
	leaq	.LC21(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	testq	%rax, %rax
	je	.L32
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	orl	$4, %eax
	movl	%eax, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L12
.L32:
	movq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	extract_uri_path
	movq	-256(%rbp), %rdx
	movq	%rax, 16(%rdx)
	movq	-256(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L33
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	orl	$2, %eax
	movl	%eax, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L12
.L33:
	leaq	-208(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok_r@PLT
	movq	%rax, -152(%rbp)
	cmpq	$0, -152(%rbp)
	jne	.L34
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	orl	$2, %eax
	movl	%eax, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L12
.L34:
	movq	-152(%rbp), %rax
	movl	$7, %edx
	leaq	.LC25(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	testl	%eax, %eax
	je	.L35
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	orl	$2, %eax
	movl	%eax, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L12
.L35:
	movq	-152(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	cmpq	$8, %rax
	ja	.L36
	movq	-152(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	cmpq	$6, %rax
	ja	.L37
.L36:
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	orl	$2, %eax
	movl	%eax, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L12
.L37:
	movq	-152(%rbp), %rax
	addq	$7, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	cmpl	$48, %eax
	je	.L38
	cmpl	$49, %eax
	jne	.L39
	movq	-256(%rbp), %rax
	movl	$1, (%rax)
	movq	8+http_type(%rip), %rdx
	movq	-256(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L40
.L38:
	movq	-256(%rbp), %rax
	movl	$0, (%rax)
	movq	http_type(%rip), %rdx
	movq	-256(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L40
.L39:
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	orl	$32, %eax
	movl	%eax, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L12
.L40:
	movq	-256(%rbp), %rax
	movl	$1, 100(%rax)
	movq	-256(%rbp), %rax
	movl	$1, 92(%rax)
	movl	$1, -220(%rbp)
	jmp	.L41
.L59:
	movl	-220(%rbp), %eax
	cltq
	movq	-96(%rbp,%rax,8), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, -136(%rbp)
	movl	-220(%rbp), %eax
	cltq
	movq	-96(%rbp,%rax,8), %rax
	leaq	-208(%rbp), %rdx
	leaq	.LC28(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strtok_r@PLT
	movq	%rax, -128(%rbp)
	leaq	-208(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok_r@PLT
	movq	%rax, -192(%rbp)
	cmpq	$0, -128(%rbp)
	je	.L63
	cmpq	$0, -192(%rbp)
	je	.L63
	jmp	.L45
.L46:
	addq	$1, -192(%rbp)
.L45:
	movq	-192(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$32, %al
	je	.L46
	movq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-128(%rbp), %rax
	leaq	.LC29(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncasecmp@PLT
	testl	%eax, %eax
	jne	.L47
	leaq	-208(%rbp), %rdx
	movq	-192(%rbp), %rax
	leaq	.LC28(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strtok_r@PLT
	movq	%rax, -128(%rbp)
	leaq	-208(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok_r@PLT
	movq	%rax, -192(%rbp)
	cmpq	$0, -128(%rbp)
	jne	.L48
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	orl	$2, %eax
	movl	%eax, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L12
.L48:
	movq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	movq	-256(%rbp), %rax
	movq	%rdx, 24(%rax)
	movq	-256(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	jne	.L49
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC31(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	orl	$2, %eax
	movl	%eax, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L12
.L49:
	cmpq	$0, -192(%rbp)
	je	.L50
	movq	-192(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	movq	-256(%rbp), %rax
	movq	%rdx, 32(%rax)
.L50:
	movq	-256(%rbp), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	jne	.L51
	movq	-256(%rbp), %rax
	movq	$0, 32(%rax)
	jmp	.L51
.L47:
	movq	-128(%rbp), %rax
	leaq	.LC32(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcasecmp@PLT
	testl	%eax, %eax
	jne	.L52
	movq	-192(%rbp), %rax
	leaq	.LC33(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcasecmp@PLT
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 88(%rax)
	movq	-192(%rbp), %rax
	leaq	.LC34(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcasecmp@PLT
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 92(%rax)
	jmp	.L51
.L52:
	movq	-128(%rbp), %rax
	leaq	.LC35(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcasecmp@PLT
	testl	%eax, %eax
	je	.L51
	cmpq	$0, -136(%rbp)
	je	.L53
	movq	-136(%rbp), %rax
	movl	$58, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	testq	%rax, %rax
	jne	.L54
.L53:
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC36(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	orl	$2, %eax
	movl	%eax, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L12
.L54:
	movq	-256(%rbp), %rax
	movq	112(%rax), %rax
	testq	%rax, %rax
	jne	.L55
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	addq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	movq	-256(%rbp), %rax
	movq	%rdx, 112(%rax)
	movq	-256(%rbp), %rax
	movq	112(%rax), %rax
	testq	%rax, %rax
	jne	.L56
	call	gettid@PLT
	movl	%eax, %edx
	movq	stderr(%rip), %rax
	leaq	.LC37(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	jmp	.L57
.L56:
	movq	-256(%rbp), %rax
	movq	112(%rax), %rax
	movq	-136(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movq	-256(%rbp), %rax
	movq	112(%rax), %rbx
	movq	%rbx, %rdi
	call	strlen@PLT
	addq	%rbx, %rax
	movw	$2573, (%rax)
	movb	$0, 2(%rax)
	jmp	.L51
.L55:
	movq	-256(%rbp), %rax
	movq	112(%rax), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L51
	cmpq	$0, -136(%rbp)
	je	.L51
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L51
	movq	-256(%rbp), %rax
	movq	112(%rax), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, -120(%rbp)
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, -112(%rbp)
	movq	-120(%rbp), %rdx
	movq	-112(%rbp), %rax
	addq	%rdx, %rax
	leaq	3(%rax), %rdx
	movq	-256(%rbp), %rax
	movq	112(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, -104(%rbp)
	cmpq	$0, -104(%rbp)
	jne	.L58
	call	gettid@PLT
	movl	%eax, %edx
	movq	stderr(%rip), %rax
	leaq	.LC37(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	jmp	.L57
.L58:
	movq	-256(%rbp), %rax
	movq	-104(%rbp), %rdx
	movq	%rdx, 112(%rax)
	movq	-256(%rbp), %rax
	movq	112(%rax), %rax
	movq	-136(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	movq	-256(%rbp), %rax
	movq	112(%rax), %rbx
	movq	%rbx, %rdi
	call	strlen@PLT
	addq	%rbx, %rax
	movw	$2573, (%rax)
	movb	$0, 2(%rax)
.L51:
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	jmp	.L44
.L63:
	nop
.L44:
	addl	$1, -220(%rbp)
.L41:
	movl	-220(%rbp), %eax
	cmpl	-236(%rbp), %eax
	jl	.L59
.L57:
	movq	-256(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L60
	movq	-256(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	jne	.L60
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC38(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	orl	$2, %eax
	movl	%eax, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L12
.L60:
	movl	$0, %eax
.L12:
	movq	%r12, %rsp
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L62
	call	__stack_chk_fail@PLT
.L62:
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	parse_request_line_thread_safe, .-parse_request_line_thread_safe
	.globl	cleanup_header
	.type	cleanup_header, @function
cleanup_header:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L71
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L66
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L66:
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L67
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L67:
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	je	.L68
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L68:
	movq	-8(%rbp), %rax
	movq	80(%rax), %rax
	testq	%rax, %rax
	je	.L69
	movq	-8(%rbp), %rax
	movq	80(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L69:
	movq	-8(%rbp), %rax
	movq	112(%rax), %rax
	testq	%rax, %rax
	je	.L70
	movq	-8(%rbp), %rax
	movq	112(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L70:
	movq	-8(%rbp), %rax
	movl	$120, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.L71:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	cleanup_header, .-cleanup_header
	.globl	str_equals
	.type	str_equals, @function
str_equals:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	str_equals, .-str_equals
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
