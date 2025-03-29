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
	.string	"\r\n"
.LC10:
	.string	" "
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
	pushq	%rbx
	subq	$184, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -184(%rbp)
	movq	%rsi, -192(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %rbx
	cmpq	$0, -184(%rbp)
	je	.L6
	cmpq	$0, -192(%rbp)
	je	.L6
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	cmpq	$30720, %rax
	jbe	.L7
.L6:
	movq	-192(%rbp), %rax
	movl	96(%rax), %eax
	orl	$2, %eax
	movl	%eax, %edx
	movq	-192(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L8
.L7:
	movq	-184(%rbp), %rax
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
	movq	%rax, -128(%rbp)
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-184(%rbp), %rcx
	movq	-128(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	movq	-192(%rbp), %rax
	movl	$112, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movq	-192(%rbp), %rax
	movl	$2, (%rax)
	movq	-192(%rbp), %rax
	movl	$-1, 56(%rax)
	movq	-192(%rbp), %rax
	movl	$0, 100(%rax)
	movl	$0, -176(%rbp)
	movq	$0, -160(%rbp)
	leaq	-160(%rbp), %rdx
	movq	-128(%rbp), %rax
	leaq	.LC9(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strtok_r@PLT
	movq	%rax, -144(%rbp)
	jmp	.L12
.L15:
	movq	-144(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L13
	movl	-176(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -176(%rbp)
	cltq
	movq	-144(%rbp), %rdx
	movq	%rdx, -96(%rbp,%rax,8)
.L13:
	leaq	-160(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC9(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok_r@PLT
	movq	%rax, -144(%rbp)
.L12:
	cmpq	$0, -144(%rbp)
	je	.L14
	cmpl	$6, -176(%rbp)
	jle	.L15
.L14:
	cmpl	$0, -176(%rbp)
	jne	.L16
	movq	-192(%rbp), %rax
	movl	96(%rax), %eax
	orl	$2, %eax
	movl	%eax, %edx
	movq	-192(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L8
.L16:
	movq	$0, -120(%rbp)
	movq	$0, -112(%rbp)
	movq	$0, -104(%rbp)
	movq	$0, -152(%rbp)
	movq	-96(%rbp), %rax
	leaq	-152(%rbp), %rdx
	leaq	.LC10(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strtok_r@PLT
	movq	%rax, -120(%rbp)
	cmpq	$0, -120(%rbp)
	jne	.L17
	movq	-192(%rbp), %rax
	movl	96(%rax), %eax
	orl	$2, %eax
	movl	%eax, %edx
	movq	-192(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L8
.L17:
	movl	$0, -172(%rbp)
	movl	$0, -168(%rbp)
	movl	$0, -164(%rbp)
	jmp	.L18
.L23:
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movl	-164(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	leaq	reqMethod(%rip), %rax
	movq	(%rcx,%rax), %rcx
	movq	-120(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	testl	%eax, %eax
	jne	.L19
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
	jne	.L20
	movl	-164(%rbp), %edx
	movq	-192(%rbp), %rax
	movl	%edx, 56(%rax)
	movl	-164(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	reqMethod(%rip), %rax
	movq	(%rdx,%rax), %rdx
	movq	-192(%rbp), %rax
	movq	%rdx, 64(%rax)
	movl	$1, -172(%rbp)
	movl	$1, -168(%rbp)
	jmp	.L22
.L20:
	movl	$1, -168(%rbp)
	movl	$0, -172(%rbp)
	jmp	.L22
.L19:
	addl	$1, -164(%rbp)
.L18:
	cmpl	$5, -164(%rbp)
	jle	.L23
.L22:
	cmpl	$0, -168(%rbp)
	jne	.L24
	movq	-192(%rbp), %rax
	movl	96(%rax), %eax
	orl	$2, %eax
	movl	%eax, %edx
	movq	-192(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L8
.L24:
	cmpl	$0, -172(%rbp)
	jne	.L25
	movq	-192(%rbp), %rax
	movl	96(%rax), %eax
	orl	$16, %eax
	movl	%eax, %edx
	movq	-192(%rbp), %rax
	movl	%edx, 96(%rax)
	movl	$-1, %eax
	jmp	.L8
.L25:
	movl	$0, %eax
.L8:
	movq	%rbx, %rsp
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L27
	call	__stack_chk_fail@PLT
.L27:
	movq	-8(%rbp), %rbx
	leave
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
	je	.L30
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-8(%rbp), %rax
	movl	$112, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.L30:
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
