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
	leaq	-28672(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$2224, %rsp
	movq	%rdi, -30888(%rbp)
	movq	%rsi, -30896(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpq	$0, -30888(%rbp)
	je	.L2
	cmpq	$0, -30896(%rbp)
	jne	.L3
.L2:
	movl	$-4, %eax
	jmp	.L35
.L3:
	movq	-30888(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	cmpq	$30719, %rax
	jbe	.L5
	movq	-30896(%rbp), %rax
	movl	$-5, 88(%rax)
	movl	$-5, %eax
	jmp	.L35
.L5:
	movq	-30888(%rbp), %rcx
	leaq	-30736(%rbp), %rax
	movl	$30719, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	movb	$0, -17(%rbp)
	movq	-30896(%rbp), %rax
	movl	$96, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movq	-30896(%rbp), %rax
	movl	$2, (%rax)
	movq	-30896(%rbp), %rax
	movl	$-1, 48(%rax)
	movl	$0, -30872(%rbp)
	movq	$0, -30856(%rbp)
	leaq	-30856(%rbp), %rdx
	leaq	-30736(%rbp), %rax
	leaq	.LC6(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strtok_r@PLT
	movq	%rax, -30840(%rbp)
	jmp	.L6
.L9:
	movq	-30840(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L7
	movl	-30872(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -30872(%rbp)
	cltq
	movq	-30840(%rbp), %rdx
	movq	%rdx, -30784(%rbp,%rax,8)
.L7:
	leaq	-30856(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC6(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok_r@PLT
	movq	%rax, -30840(%rbp)
.L6:
	cmpq	$0, -30840(%rbp)
	je	.L8
	cmpl	$4, -30872(%rbp)
	jle	.L9
.L8:
	cmpl	$0, -30872(%rbp)
	jne	.L10
	movq	-30896(%rbp), %rax
	movl	$-4, 88(%rax)
	movl	$-4, %eax
	jmp	.L35
.L10:
	movq	$0, -30824(%rbp)
	movq	$0, -30816(%rbp)
	movq	$0, -30808(%rbp)
	movq	$0, -30848(%rbp)
	movq	-30784(%rbp), %rax
	leaq	-30848(%rbp), %rdx
	leaq	.LC7(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strtok_r@PLT
	movq	%rax, -30824(%rbp)
	cmpq	$0, -30824(%rbp)
	jne	.L11
	movq	-30896(%rbp), %rax
	movl	$-4, 88(%rax)
	movl	$-4, %eax
	jmp	.L35
.L11:
	movl	$0, -30868(%rbp)
	movl	$0, -30864(%rbp)
	jmp	.L12
.L15:
	movl	-30864(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	reqMethod(%rip), %rax
	movq	(%rdx,%rax), %rdx
	movq	-30824(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L13
	movl	-30864(%rbp), %edx
	movq	-30896(%rbp), %rax
	movl	%edx, 48(%rax)
	movl	-30864(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	reqMethod(%rip), %rax
	movq	(%rdx,%rax), %rdx
	movq	-30896(%rbp), %rax
	movq	%rdx, 56(%rax)
	movl	$1, -30868(%rbp)
	jmp	.L14
.L13:
	addl	$1, -30864(%rbp)
.L12:
	cmpl	$5, -30864(%rbp)
	jle	.L15
.L14:
	cmpl	$0, -30868(%rbp)
	jne	.L16
	movq	-30896(%rbp), %rax
	movl	$-1, 88(%rax)
	movl	$-1, %eax
	jmp	.L35
.L16:
	leaq	-30848(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC7(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok_r@PLT
	movq	%rax, -30816(%rbp)
	cmpq	$0, -30816(%rbp)
	jne	.L17
	movq	-30896(%rbp), %rax
	movl	$-2, 88(%rax)
	movl	$-2, %eax
	jmp	.L35
.L17:
	movq	-30816(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, -30800(%rbp)
	cmpq	$0, -30800(%rbp)
	jne	.L18
	movq	-30896(%rbp), %rax
	movl	$-2, 88(%rax)
	movl	$-2, %eax
	jmp	.L35
.L18:
	movq	-30816(%rbp), %rax
	leaq	.LC8(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	testq	%rax, %rax
	je	.L19
	movq	-30896(%rbp), %rax
	movl	$-2, 88(%rax)
	movl	$-2, %eax
	jmp	.L35
.L19:
	movq	-30816(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	movq	-30896(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-30896(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L20
	movq	-30896(%rbp), %rax
	movl	$-5, 88(%rax)
	movl	$-5, %eax
	jmp	.L35
.L20:
	leaq	-30848(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC7(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok_r@PLT
	movq	%rax, -30808(%rbp)
	cmpq	$0, -30808(%rbp)
	jne	.L21
	movq	-30896(%rbp), %rax
	movl	$-3, 88(%rax)
	movl	$-3, %eax
	jmp	.L35
.L21:
	movq	-30808(%rbp), %rax
	movl	$7, %edx
	leaq	.LC9(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	testl	%eax, %eax
	je	.L22
	movq	-30896(%rbp), %rax
	movl	$-3, 88(%rax)
	movq	-30896(%rbp), %rax
	movl	$2, (%rax)
	movl	$-3, %eax
	jmp	.L35
.L22:
	movq	-30808(%rbp), %rax
	addq	$7, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	cmpl	$48, %eax
	je	.L23
	cmpl	$49, %eax
	jne	.L24
	movq	-30896(%rbp), %rax
	movl	$1, (%rax)
	movq	8+http_type(%rip), %rdx
	movq	-30896(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L25
.L23:
	movq	-30896(%rbp), %rax
	movl	$0, (%rax)
	movq	http_type(%rip), %rdx
	movq	-30896(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L25
.L24:
	movq	-30896(%rbp), %rax
	movl	$2, (%rax)
	movq	-30896(%rbp), %rax
	movl	$-3, 88(%rax)
	movl	$-3, %eax
	jmp	.L35
.L25:
	movl	$1, -30860(%rbp)
	jmp	.L26
.L33:
	movl	-30860(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rax
	leaq	-30848(%rbp), %rdx
	leaq	.LC10(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strtok_r@PLT
	movq	%rax, -30792(%rbp)
	leaq	-30848(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC7(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok_r@PLT
	movq	%rax, -30832(%rbp)
	cmpq	$0, -30792(%rbp)
	je	.L37
	cmpq	$0, -30832(%rbp)
	je	.L37
	jmp	.L30
.L31:
	addq	$1, -30832(%rbp)
.L30:
	movq	-30832(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$32, %al
	je	.L31
	movq	-30792(%rbp), %rax
	leaq	.LC11(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcasecmp@PLT
	testl	%eax, %eax
	jne	.L32
	movq	-30832(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	movq	-30896(%rbp), %rax
	movq	%rdx, 24(%rax)
	jmp	.L29
.L32:
	movq	-30792(%rbp), %rax
	leaq	.LC12(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcasecmp@PLT
	testl	%eax, %eax
	jne	.L29
	movq	-30832(%rbp), %rax
	leaq	.LC13(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcasecmp@PLT
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %edx
	movq	-30896(%rbp), %rax
	movl	%edx, 80(%rax)
	movq	-30832(%rbp), %rax
	leaq	.LC14(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcasecmp@PLT
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %edx
	movq	-30896(%rbp), %rax
	movl	%edx, 84(%rax)
	jmp	.L29
.L37:
	nop
.L29:
	addl	$1, -30860(%rbp)
.L26:
	movl	-30860(%rbp), %eax
	cmpl	-30872(%rbp), %eax
	jl	.L33
	movq	-30896(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L34
	movq	-30896(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	jne	.L34
	movq	-30896(%rbp), %rax
	movl	$-4, 88(%rax)
	movl	$-4, %eax
	jmp	.L35
.L34:
	movl	$0, %eax
.L35:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L36
	call	__stack_chk_fail@PLT
.L36:
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
	je	.L40
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-8(%rbp), %rax
	movl	$96, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.L40:
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
	.section	.rodata
.LC15:
	.string	"Keep-alive"
	.text
	.globl	parse_request_line_thread_unsafe
	.type	parse_request_line_thread_unsafe, @function
parse_request_line_thread_unsafe:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movq	%rdi, -104(%rbp)
	movq	%rsi, -112(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpq	$0, -104(%rbp)
	je	.L65
	cmpq	$0, -112(%rbp)
	je	.L65
	movq	-104(%rbp), %rax
	movq	%rax, -80(%rbp)
	movl	$-1, -96(%rbp)
	addl	$1, -96(%rbp)
	movq	-80(%rbp), %rax
	leaq	.LC6(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movl	-96(%rbp), %edx
	movslq	%edx, %rdx
	movq	%rax, -64(%rbp,%rdx,8)
	nop
.L48:
	addl	$1, -96(%rbp)
	leaq	.LC6(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok@PLT
	movl	-96(%rbp), %edx
	movslq	%edx, %rdx
	movq	%rax, -64(%rbp,%rdx,8)
	movl	-96(%rbp), %eax
	cltq
	movq	-64(%rbp,%rax,8), %rax
	testq	%rax, %rax
	je	.L47
	cmpl	$4, -96(%rbp)
	jle	.L48
.L47:
	movl	$-1, -96(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, -88(%rbp)
	jmp	.L49
.L63:
	addl	$1, -96(%rbp)
	movl	-96(%rbp), %eax
	cltq
	movq	-64(%rbp,%rax,8), %rax
	movq	%rax, -88(%rbp)
	movl	$0, -92(%rbp)
	movq	-88(%rbp), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -72(%rbp)
	cmpl	$0, -92(%rbp)
	jne	.L50
	cmpq	$0, -72(%rbp)
	je	.L50
	movq	reqMethod(%rip), %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L50
	movq	reqMethod(%rip), %rdx
	movq	-112(%rbp), %rax
	movq	%rdx, 56(%rax)
	movq	-112(%rbp), %rax
	movl	$0, 48(%rax)
.L50:
	addl	$1, -92(%rbp)
	jmp	.L51
.L61:
	cmpl	$0, -96(%rbp)
	jne	.L52
	cmpl	$1, -92(%rbp)
	jne	.L53
	movq	-112(%rbp), %rax
	movq	-72(%rbp), %rdx
	movq	%rdx, 16(%rax)
	jmp	.L52
.L53:
	cmpl	$2, -92(%rbp)
	jne	.L52
	movq	-72(%rbp), %rax
	movl	$7, %edx
	leaq	.LC9(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	testl	%eax, %eax
	je	.L54
	movq	-112(%rbp), %rax
	movl	$2, (%rax)
	jmp	.L51
.L54:
	movq	-72(%rbp), %rax
	addq	$7, %rax
	movzbl	(%rax), %eax
	cmpb	$49, %al
	jne	.L56
	movq	8+http_type(%rip), %rdx
	movq	-112(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-112(%rbp), %rax
	movl	$1, (%rax)
	jmp	.L52
.L56:
	movq	-72(%rbp), %rax
	addq	$7, %rax
	movzbl	(%rax), %eax
	cmpb	$48, %al
	jne	.L57
	movq	http_type(%rip), %rdx
	movq	-112(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-112(%rbp), %rax
	movl	$0, (%rax)
	jmp	.L52
.L57:
	movq	-112(%rbp), %rax
	movl	$2, (%rax)
.L52:
	cmpl	$1, -96(%rbp)
	jne	.L58
	cmpl	$1, -92(%rbp)
	jne	.L58
	movq	-112(%rbp), %rax
	movq	-72(%rbp), %rdx
	movq	%rdx, 24(%rax)
.L58:
	cmpl	$2, -96(%rbp)
	jne	.L59
	cmpl	$1, -92(%rbp)
	jne	.L59
	movq	-72(%rbp), %rax
	movl	$8, %edx
	leaq	.LC15(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	testl	%eax, %eax
	je	.L60
	movq	-112(%rbp), %rax
	movl	$1, 80(%rax)
	jmp	.L59
.L60:
	movq	-72(%rbp), %rax
	leaq	.LC14(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L59
	movq	-112(%rbp), %rax
	movl	$1, 84(%rax)
.L59:
	addl	$1, -92(%rbp)
.L51:
	leaq	.LC7(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -72(%rbp)
	cmpq	$0, -72(%rbp)
	jne	.L61
.L49:
	cmpl	$4, -96(%rbp)
	jg	.L43
	cmpq	$0, -88(%rbp)
	je	.L43
	movq	-88(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L63
	jmp	.L43
.L65:
	nop
.L43:
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L64
	call	__stack_chk_fail@PLT
.L64:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	parse_request_line_thread_unsafe, .-parse_request_line_thread_unsafe
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
