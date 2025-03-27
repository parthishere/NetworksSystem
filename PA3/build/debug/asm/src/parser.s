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
	.section	.data.rel.local,"aw"
	.align 32
	.type	reqMethod, @object
	.size	reqMethod, 56
reqMethod:
	.quad	.LC0
	.quad	.LC1
	.quad	.LC2
	.quad	.LC3
	.zero	24
	.section	.rodata
.LC4:
	.string	"HTTP/1.0"
.LC5:
	.string	"HTTP/1.1"
	.section	.data.rel.local
	.align 32
	.type	http_type, @object
	.size	http_type, 32
http_type:
	.quad	.LC4
	.quad	.LC5
	.zero	16
	.section	.rodata
.LC6:
	.string	"\r\n"
.LC7:
	.string	" "
.LC8:
	.string	".."
.LC9:
	.string	"HTTP/1."
.LC10:
	.string	":"
.LC11:
	.string	"Host"
.LC12:
	.string	"Connection"
.LC13:
	.string	"keep-alive"
.LC14:
	.string	"Close"
.LC15:
	.string	"Cache-Control"
	.text
	.globl	parse_request_line_thread_safe
	.type	parse_request_line_thread_safe, @function
parse_request_line_thread_safe:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$200, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -200(%rbp)
	movq	%rsi, -208(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %rbx
	cmpq	$0, -200(%rbp)
	je	.L2
	cmpq	$0, -208(%rbp)
	je	.L2
	movq	-200(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	cmpq	$30720, %rax
	jbe	.L3
.L2:
	movq	-208(%rbp), %rax
	movl	88(%rax), %eax
	leal	2(%rax), %edx
	movq	-208(%rbp), %rax
	movl	%edx, 88(%rax)
	movl	$-1, %eax
	jmp	.L4
.L3:
	movq	-200(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	addq	$1, %rax
	movq	%rax, %rdx
	subq	$1, %rdx
	movq	%rdx, -136(%rbp)
	movl	$16, %edx
	subq	$1, %rdx
	addq	%rdx, %rax
	movl	$16, %esi
	movl	$0, %edx
	divq	%rsi
	imulq	$16, %rax, %rax
	movq	%rax, %rcx
	andq	$-4096, %rcx
	movq	%rsp, %rdx
	subq	%rcx, %rdx
.L5:
	cmpq	%rdx, %rsp
	je	.L6
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L5
.L6:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L7
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L7:
	movq	%rsp, %rax
	movq	%rax, -128(%rbp)
	movq	-200(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-200(%rbp), %rcx
	movq	-128(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	movq	-208(%rbp), %rax
	movl	$104, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movq	-208(%rbp), %rax
	movl	$2, (%rax)
	movq	-208(%rbp), %rax
	movl	$-1, 48(%rax)
	movq	-208(%rbp), %rax
	movl	$0, 92(%rax)
	movl	$0, -188(%rbp)
	movq	$0, -168(%rbp)
	leaq	-168(%rbp), %rdx
	movq	-128(%rbp), %rax
	leaq	.LC6(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strtok_r@PLT
	movq	%rax, -152(%rbp)
	jmp	.L8
.L11:
	movq	-152(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L9
	movl	-188(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -188(%rbp)
	cltq
	movq	-152(%rbp), %rdx
	movq	%rdx, -80(%rbp,%rax,8)
.L9:
	leaq	-168(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC6(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok_r@PLT
	movq	%rax, -152(%rbp)
.L8:
	cmpq	$0, -152(%rbp)
	je	.L10
	cmpl	$4, -188(%rbp)
	jle	.L11
.L10:
	cmpl	$0, -188(%rbp)
	jne	.L12
	movq	-208(%rbp), %rax
	movl	88(%rax), %eax
	leal	2(%rax), %edx
	movq	-208(%rbp), %rax
	movl	%edx, 88(%rax)
	movl	$-1, %eax
	jmp	.L4
.L12:
	movq	$0, -120(%rbp)
	movq	$0, -112(%rbp)
	movq	$0, -104(%rbp)
	movq	$0, -160(%rbp)
	movq	-80(%rbp), %rax
	leaq	-160(%rbp), %rdx
	leaq	.LC7(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strtok_r@PLT
	movq	%rax, -120(%rbp)
	cmpq	$0, -120(%rbp)
	jne	.L13
	movq	-208(%rbp), %rax
	movl	88(%rax), %eax
	leal	2(%rax), %edx
	movq	-208(%rbp), %rax
	movl	%edx, 88(%rax)
	movl	$-1, %eax
	jmp	.L4
.L13:
	movl	$0, -184(%rbp)
	movl	$0, -180(%rbp)
	movl	$0, -176(%rbp)
	jmp	.L14
.L19:
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movl	-176(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	leaq	reqMethod(%rip), %rax
	movq	(%rcx,%rax), %rcx
	movq	-120(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	testl	%eax, %eax
	jne	.L15
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	reqMethod(%rip), %rcx
	movq	-120(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	testl	%eax, %eax
	jne	.L16
	movl	-176(%rbp), %edx
	movq	-208(%rbp), %rax
	movl	%edx, 48(%rax)
	movl	-176(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	reqMethod(%rip), %rax
	movq	(%rdx,%rax), %rdx
	movq	-208(%rbp), %rax
	movq	%rdx, 56(%rax)
	movl	$1, -184(%rbp)
	movl	$1, -180(%rbp)
	jmp	.L18
.L16:
	movl	$1, -180(%rbp)
	movl	$0, -184(%rbp)
	jmp	.L18
.L15:
	addl	$1, -176(%rbp)
.L14:
	cmpl	$5, -176(%rbp)
	jle	.L19
.L18:
	cmpl	$0, -180(%rbp)
	jne	.L20
	movq	-208(%rbp), %rax
	movl	88(%rax), %eax
	leal	2(%rax), %edx
	movq	-208(%rbp), %rax
	movl	%edx, 88(%rax)
	movl	$-1, %eax
	jmp	.L4
.L20:
	cmpl	$0, -184(%rbp)
	jne	.L21
	movq	-208(%rbp), %rax
	movl	88(%rax), %eax
	leal	16(%rax), %edx
	movq	-208(%rbp), %rax
	movl	%edx, 88(%rax)
	movl	$-1, %eax
	jmp	.L4
.L21:
	leaq	-160(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC7(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok_r@PLT
	movq	%rax, -112(%rbp)
	cmpq	$0, -112(%rbp)
	jne	.L22
	movq	-208(%rbp), %rax
	movl	88(%rax), %eax
	leal	-2(%rax), %edx
	movq	-208(%rbp), %rax
	movl	%edx, 88(%rax)
	movl	$-1, %eax
	jmp	.L4
.L22:
	movq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, -96(%rbp)
	cmpq	$0, -96(%rbp)
	jne	.L23
	movq	-208(%rbp), %rax
	movl	88(%rax), %eax
	leal	2(%rax), %edx
	movq	-208(%rbp), %rax
	movl	%edx, 88(%rax)
	movl	$-1, %eax
	jmp	.L4
.L23:
	movq	-112(%rbp), %rax
	leaq	.LC8(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	testq	%rax, %rax
	je	.L24
	movq	-208(%rbp), %rax
	movl	88(%rax), %eax
	leal	4(%rax), %edx
	movq	-208(%rbp), %rax
	movl	%edx, 88(%rax)
	movl	$-1, %eax
	jmp	.L4
.L24:
	movq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	movq	-208(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-208(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L25
	movq	-208(%rbp), %rax
	movl	88(%rax), %eax
	leal	2(%rax), %edx
	movq	-208(%rbp), %rax
	movl	%edx, 88(%rax)
	movl	$-1, %eax
	jmp	.L4
.L25:
	leaq	-160(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC7(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok_r@PLT
	movq	%rax, -104(%rbp)
	cmpq	$0, -104(%rbp)
	jne	.L26
	movq	-208(%rbp), %rax
	movl	88(%rax), %eax
	leal	2(%rax), %edx
	movq	-208(%rbp), %rax
	movl	%edx, 88(%rax)
	movl	$-1, %eax
	jmp	.L4
.L26:
	movq	-104(%rbp), %rax
	movl	$7, %edx
	leaq	.LC9(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	testl	%eax, %eax
	je	.L27
	movq	-208(%rbp), %rax
	movl	$2, 88(%rax)
	movl	$-1, %eax
	jmp	.L4
.L27:
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	cmpq	$8, %rax
	jbe	.L28
	movq	-208(%rbp), %rax
	movl	$2, 88(%rax)
	movl	$-1, %eax
	jmp	.L4
.L28:
	movq	-104(%rbp), %rax
	addq	$7, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	cmpl	$48, %eax
	je	.L29
	cmpl	$49, %eax
	jne	.L30
	movq	-208(%rbp), %rax
	movl	$1, (%rax)
	movq	8+http_type(%rip), %rdx
	movq	-208(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L31
.L29:
	movq	-208(%rbp), %rax
	movl	$0, (%rax)
	movq	http_type(%rip), %rdx
	movq	-208(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L31
.L30:
	movq	-208(%rbp), %rax
	movl	$32, 88(%rax)
	movl	$-1, %eax
	jmp	.L4
.L31:
	movq	-208(%rbp), %rax
	movl	$1, 92(%rax)
	movl	$1, -172(%rbp)
	jmp	.L32
.L40:
	movl	-172(%rbp), %eax
	cltq
	movq	-80(%rbp,%rax,8), %rax
	leaq	-160(%rbp), %rdx
	leaq	.LC10(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strtok_r@PLT
	movq	%rax, -88(%rbp)
	leaq	-160(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC7(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok_r@PLT
	movq	%rax, -144(%rbp)
	cmpq	$0, -88(%rbp)
	je	.L44
	cmpq	$0, -144(%rbp)
	je	.L44
	jmp	.L36
.L37:
	addq	$1, -144(%rbp)
.L36:
	movq	-144(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$32, %al
	je	.L37
	movq	-88(%rbp), %rax
	leaq	.LC11(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcasecmp@PLT
	testl	%eax, %eax
	jne	.L38
	movq	-144(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	movq	-208(%rbp), %rax
	movq	%rdx, 24(%rax)
	jmp	.L35
.L38:
	movq	-88(%rbp), %rax
	leaq	.LC12(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcasecmp@PLT
	testl	%eax, %eax
	jne	.L39
	movq	-144(%rbp), %rax
	leaq	.LC13(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcasecmp@PLT
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %edx
	movq	-208(%rbp), %rax
	movl	%edx, 80(%rax)
	movq	-144(%rbp), %rax
	leaq	.LC14(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcasecmp@PLT
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %edx
	movq	-208(%rbp), %rax
	movl	%edx, 84(%rax)
	jmp	.L35
.L39:
	movq	-88(%rbp), %rax
	leaq	.LC15(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcasecmp@PLT
	jmp	.L35
.L44:
	nop
.L35:
	addl	$1, -172(%rbp)
.L32:
	movl	-172(%rbp), %eax
	cmpl	-188(%rbp), %eax
	jl	.L40
	movq	-208(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L41
	movq	-208(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	jne	.L41
	movq	-208(%rbp), %rax
	movl	$2, 88(%rax)
	movl	$-1, %eax
	jmp	.L4
.L41:
	movl	$0, %eax
.L4:
	movq	%rbx, %rsp
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L43
	call	__stack_chk_fail@PLT
.L43:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	parse_request_line_thread_safe, .-parse_request_line_thread_safe
	.globl	cleanup_header
	.type	cleanup_header, @function
cleanup_header:
.LFB7:
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
	je	.L47
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-8(%rbp), %rax
	movl	$104, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.L47:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	cleanup_header, .-cleanup_header
	.globl	str_equals
	.type	str_equals, @function
str_equals:
.LFB8:
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
.LFE8:
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
