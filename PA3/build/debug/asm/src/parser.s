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
	.string	"no reqest, no header, no len "
.LC10:
	.string	"\r\n"
.LC11:
	.string	"line count error "
.LC12:
	.string	" "
.LC13:
	.string	"no method "
.LC14:
	.string	"no valid header "
.LC15:
	.string	"no valid method "
.LC16:
	.string	"no valid uri "
.LC17:
	.string	"uri len =0 "
.LC18:
	.string	".."
.LC19:
	.string	"uri has .. "
.LC20:
	.string	"uri str null "
.LC21:
	.string	"no version found"
.LC22:
	.string	"HTTP/1."
.LC23:
	.string	"wrong thing found"
.LC24:
	.string	"somthing wrong in version"
.LC25:
	.string	":"
.LC26:
	.string	"Host"
.LC27:
	.string	"no host"
.LC28:
	.string	"Connection"
.LC29:
	.string	"keep-alive"
.LC30:
	.string	"Close"
.LC31:
	.string	"Cache-Control"
	.align 8
.LC32:
	.string	"[-] key:value not found in header!"
	.align 8
.LC33:
	.string	"\033[31m[-] (%d) Memory allocation failed\n\033[0m"
	.align 8
.LC34:
	.string	"[-] No host in HTTP/1.1 header"
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
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$-1, %eax
	jmp	.L8
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
.L9:
	cmpq	%rdx, %rsp
	je	.L10
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L9
.L10:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L11
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L11:
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
	leaq	.LC10(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strtok_r@PLT
	movq	%rax, -200(%rbp)
	jmp	.L12
.L15:
	movq	-200(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L13
	movl	-236(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -236(%rbp)
	cltq
	movq	-200(%rbp), %rdx
	movq	%rdx, -96(%rbp,%rax,8)
.L13:
	leaq	-216(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC10(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok_r@PLT
	movq	%rax, -200(%rbp)
.L12:
	cmpq	$0, -200(%rbp)
	je	.L14
	cmpl	$6, -236(%rbp)
	jle	.L15
.L14:
	cmpl	$0, -236(%rbp)
	jne	.L16
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	orl	$2, %eax
	movl	%eax, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L8
.L16:
	movq	$0, -168(%rbp)
	movq	$0, -160(%rbp)
	movq	$0, -152(%rbp)
	movq	$0, -208(%rbp)
	movq	-96(%rbp), %rax
	leaq	-208(%rbp), %rdx
	leaq	.LC12(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strtok_r@PLT
	movq	%rax, -168(%rbp)
	cmpq	$0, -168(%rbp)
	jne	.L17
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	orl	$2, %eax
	movl	%eax, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L8
.L17:
	movl	$0, -232(%rbp)
	movl	$0, -228(%rbp)
	movl	$0, -224(%rbp)
	jmp	.L18
.L23:
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
	jne	.L19
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
	jne	.L20
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
	jmp	.L22
.L20:
	movl	$1, -228(%rbp)
	movl	$0, -232(%rbp)
	jmp	.L22
.L19:
	addl	$1, -224(%rbp)
.L18:
	cmpl	$5, -224(%rbp)
	jle	.L23
.L22:
	cmpl	$0, -228(%rbp)
	jne	.L24
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	orl	$2, %eax
	movl	%eax, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L8
.L24:
	cmpl	$0, -232(%rbp)
	jne	.L25
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	orl	$16, %eax
	movl	%eax, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L8
.L25:
	leaq	-208(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC12(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok_r@PLT
	movq	%rax, -160(%rbp)
	cmpq	$0, -160(%rbp)
	jne	.L26
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	orl	$-2, %eax
	movl	%eax, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L8
.L26:
	movq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, -144(%rbp)
	cmpq	$0, -144(%rbp)
	jne	.L27
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	orl	$2, %eax
	movl	%eax, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L8
.L27:
	movq	-160(%rbp), %rax
	leaq	.LC18(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	testq	%rax, %rax
	je	.L28
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	orl	$4, %eax
	movl	%eax, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L8
.L28:
	movq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	extract_uri_path
	movq	-256(%rbp), %rdx
	movq	%rax, 16(%rdx)
	movq	-256(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L29
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	orl	$2, %eax
	movl	%eax, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L8
.L29:
	leaq	-208(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC12(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok_r@PLT
	movq	%rax, -152(%rbp)
	cmpq	$0, -152(%rbp)
	jne	.L30
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	orl	$2, %eax
	movl	%eax, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L8
.L30:
	movq	-152(%rbp), %rax
	movl	$7, %edx
	leaq	.LC22(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	testl	%eax, %eax
	je	.L31
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	orl	$2, %eax
	movl	%eax, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L8
.L31:
	movq	-152(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	cmpq	$8, %rax
	ja	.L32
	movq	-152(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	cmpq	$6, %rax
	ja	.L33
.L32:
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	orl	$2, %eax
	movl	%eax, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L8
.L33:
	movq	-152(%rbp), %rax
	addq	$7, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	cmpl	$48, %eax
	je	.L34
	cmpl	$49, %eax
	jne	.L35
	movq	-256(%rbp), %rax
	movl	$1, (%rax)
	movq	8+http_type(%rip), %rdx
	movq	-256(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L36
.L34:
	movq	-256(%rbp), %rax
	movl	$0, (%rax)
	movq	http_type(%rip), %rdx
	movq	-256(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L36
.L35:
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	orl	$32, %eax
	movl	%eax, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L8
.L36:
	movq	-256(%rbp), %rax
	movl	$1, 100(%rax)
	movq	-256(%rbp), %rax
	movl	$1, 92(%rax)
	movl	$1, -220(%rbp)
	jmp	.L37
.L55:
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
	leaq	.LC25(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strtok_r@PLT
	movq	%rax, -128(%rbp)
	leaq	-208(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC12(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok_r@PLT
	movq	%rax, -192(%rbp)
	cmpq	$0, -128(%rbp)
	je	.L59
	cmpq	$0, -192(%rbp)
	je	.L59
	jmp	.L41
.L42:
	addq	$1, -192(%rbp)
.L41:
	movq	-192(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$32, %al
	je	.L42
	movq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-128(%rbp), %rax
	leaq	.LC26(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncasecmp@PLT
	testl	%eax, %eax
	jne	.L43
	leaq	-208(%rbp), %rdx
	movq	-192(%rbp), %rax
	leaq	.LC25(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strtok_r@PLT
	movq	%rax, -128(%rbp)
	leaq	-208(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC12(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok_r@PLT
	movq	%rax, -192(%rbp)
	cmpq	$0, -128(%rbp)
	jne	.L44
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	orl	$2, %eax
	movl	%eax, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L8
.L44:
	movq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	movq	-256(%rbp), %rax
	movq	%rdx, 24(%rax)
	movq	-256(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	jne	.L45
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	orl	$2, %eax
	movl	%eax, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L8
.L45:
	cmpq	$0, -192(%rbp)
	je	.L46
	movq	-192(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	movq	-256(%rbp), %rax
	movq	%rdx, 32(%rax)
.L46:
	movq	-256(%rbp), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	jne	.L47
	movq	-256(%rbp), %rax
	movq	$0, 32(%rax)
	jmp	.L47
.L43:
	movq	-128(%rbp), %rax
	leaq	.LC28(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcasecmp@PLT
	testl	%eax, %eax
	jne	.L48
	movq	-192(%rbp), %rax
	leaq	.LC29(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcasecmp@PLT
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 88(%rax)
	movq	-192(%rbp), %rax
	leaq	.LC30(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcasecmp@PLT
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 92(%rax)
	jmp	.L47
.L48:
	movq	-128(%rbp), %rax
	leaq	.LC31(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcasecmp@PLT
	testl	%eax, %eax
	je	.L47
	cmpq	$0, -136(%rbp)
	je	.L49
	movq	-136(%rbp), %rax
	movl	$58, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	testq	%rax, %rax
	jne	.L50
.L49:
	leaq	.LC32(%rip), %rax
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
	jmp	.L8
.L50:
	movq	-256(%rbp), %rax
	movq	112(%rax), %rax
	testq	%rax, %rax
	jne	.L51
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
	jne	.L52
	call	gettid@PLT
	movl	%eax, %edx
	movq	stderr(%rip), %rax
	leaq	.LC33(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	jmp	.L53
.L52:
	movq	-256(%rbp), %rax
	movq	112(%rax), %rax
	movq	-136(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movq	-256(%rbp), %rax
	movq	112(%rax), %rax
	movw	$2573, (%rax)
	movb	$0, 2(%rax)
	jmp	.L47
.L51:
	movq	-256(%rbp), %rax
	movq	112(%rax), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L47
	cmpq	$0, -136(%rbp)
	je	.L47
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L47
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
	jne	.L54
	call	gettid@PLT
	movl	%eax, %edx
	movq	stderr(%rip), %rax
	leaq	.LC33(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	jmp	.L53
.L54:
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
.L47:
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	jmp	.L40
.L59:
	nop
.L40:
	addl	$1, -220(%rbp)
.L37:
	movl	-220(%rbp), %eax
	cmpl	-236(%rbp), %eax
	jl	.L55
.L53:
	movq	-256(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L56
	movq	-256(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	jne	.L56
	leaq	.LC34(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	orl	$2, %eax
	movl	%eax, %edx
	movq	-256(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L8
.L56:
	movl	$0, %eax
.L8:
	movq	%r12, %rsp
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L58
	call	__stack_chk_fail@PLT
.L58:
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
	je	.L67
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L62
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L62:
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L63
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L63:
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	je	.L64
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L64:
	movq	-8(%rbp), %rax
	movq	80(%rax), %rax
	testq	%rax, %rax
	je	.L65
	movq	-8(%rbp), %rax
	movq	80(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L65:
	movq	-8(%rbp), %rax
	movq	112(%rax), %rax
	testq	%rax, %rax
	je	.L66
	movq	-8(%rbp), %rax
	movq	112(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L66:
	movq	-8(%rbp), %rax
	movl	$120, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.L67:
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
