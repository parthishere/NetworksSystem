	.file	"prefetch.c"
	.text
	.section	.rodata
.LC0:
	.string	"http://"
.LC1:
	.string	"://"
.LC2:
	.string	"/"
	.align 8
.LC3:
	.string	"\033[35m\n---------------------------------------------------------------\n[+] (%d) Prefetching absolute URL:\n[+] Host: %s\n[+] Path: %s\n---------------------------------------------------------------\n\033[0m"
.LC4:
	.string	"/%s"
	.align 8
.LC5:
	.string	"\033[35m\n---------------------------------------------------------------\n[+] (%d) Prefetching relative URL:\n[+] Host: %s\n[+] Path: %s\n---------------------------------------------------------------\n\033[0m"
	.text
	.globl	prefetch_thread_func
	.type	prefetch_thread_func, @function
prefetch_thread_func:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$400, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -408(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movq	-408(%rbp), %rax
	movq	%rax, -368(%rbp)
	cmpq	$0, -368(%rbp)
	jne	.L2
	movl	$0, %eax
	jmp	.L3
.L2:
	movl	$0, -388(%rbp)
	jmp	.L4
.L18:
	movq	-368(%rbp), %rax
	movq	8(%rax), %rax
	movl	-388(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L26
	movq	-368(%rbp), %rax
	movq	8(%rax), %rax
	movl	-388(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L26
	leaq	-320(%rbp), %rax
	movl	$120, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-192(%rbp), %rax
	movl	$168, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movq	-368(%rbp), %rax
	movq	32(%rax), %rax
	movl	156(%rax), %eax
	movl	%eax, -36(%rbp)
	movl	$-1, -188(%rbp)
	movq	-368(%rbp), %rax
	movq	8(%rax), %rax
	movl	-388(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$7, %edx
	leaq	.LC0(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	testl	%eax, %eax
	jne	.L8
	movq	-368(%rbp), %rax
	movq	8(%rax), %rax
	movl	-388(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -360(%rbp)
	movq	-360(%rbp), %rax
	leaq	.LC1(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	movq	%rax, -352(%rbp)
	cmpq	$0, -352(%rbp)
	je	.L27
	movq	-352(%rbp), %rax
	addq	$3, %rax
	movq	%rax, -344(%rbp)
	movq	-344(%rbp), %rax
	movl	$47, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	movq	%rax, -336(%rbp)
	movq	-344(%rbp), %rax
	movl	$58, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	movq	%rax, -328(%rbp)
	cmpq	$0, -336(%rbp)
	jne	.L10
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, -304(%rbp)
	movq	-344(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, -296(%rbp)
	jmp	.L11
.L10:
	movq	-336(%rbp), %rax
	movb	$0, (%rax)
	movq	-344(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, -296(%rbp)
	movq	-336(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, -304(%rbp)
	movq	-336(%rbp), %rax
	movb	$47, (%rax)
.L11:
	movq	-304(%rbp), %r12
	movq	-296(%rbp), %rbx
	call	gettid@PLT
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L12
.L8:
	movq	-368(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, -296(%rbp)
	movq	-368(%rbp), %rax
	movq	8(%rax), %rax
	movl	-388(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L13
	movq	-368(%rbp), %rax
	movq	8(%rax), %rax
	movl	-388(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, -304(%rbp)
	jmp	.L14
.L13:
	movq	-368(%rbp), %rax
	movq	8(%rax), %rax
	movl	-388(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rdx
	leaq	-376(%rbp), %rax
	leaq	.LC4(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	movq	-376(%rbp), %rax
	movq	%rax, -304(%rbp)
.L14:
	movq	-304(%rbp), %r12
	movq	-296(%rbp), %rbx
	call	gettid@PLT
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L12:
	movq	-368(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L15
	movq	-368(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	jmp	.L16
.L15:
	movl	$0, %eax
.L16:
	movq	%rax, -288(%rbp)
	movq	-304(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	is_dynamic_content@PLT
	movl	%eax, -380(%rbp)
	movl	-380(%rbp), %edx
	leaq	-192(%rbp), %rsi
	leaq	-320(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdi
	call	check_and_send_from_cache@PLT
	leaq	-320(%rbp), %rax
	movq	%rax, %rdi
	call	cleanup_header@PLT
	jmp	.L17
.L26:
	nop
	jmp	.L17
.L27:
	nop
.L17:
	addl	$1, -388(%rbp)
.L4:
	movq	-368(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -388(%rbp)
	jl	.L18
	movl	$0, -384(%rbp)
	jmp	.L19
.L21:
	movq	-368(%rbp), %rax
	movq	8(%rax), %rax
	movl	-384(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L20
	movq	-368(%rbp), %rax
	movq	8(%rax), %rax
	movl	-384(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L20:
	addl	$1, -384(%rbp)
.L19:
	movq	-368(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -384(%rbp)
	jl	.L21
	movq	-368(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L22
	movq	-368(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L22:
	movq	-368(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L23
	movq	-368(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L23:
	movq	-368(%rbp), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	je	.L24
	movq	-368(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L24:
	movq	-368(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, %eax
.L3:
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L25
	call	__stack_chk_fail@PLT
.L25:
	addq	$400, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	prefetch_thread_func, .-prefetch_thread_func
	.section	.rodata
.LC6:
	.string	"href=[\"']([^\"']+)[\"']"
.LC7:
	.string	"#"
.LC8:
	.string	"https://"
	.align 8
.LC9:
	.string	"\033[31m[-] (%d) Memory allocation failed for links array\n\033[0m"
	.text
	.globl	extract_links
	.type	extract_links, @function
extract_links:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160, %rsp
	movq	%rdi, -152(%rbp)
	movq	%rsi, -160(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -128(%rbp)
	movq	-160(%rbp), %rax
	movl	$0, (%rax)
	leaq	.LC6(%rip), %rax
	movq	%rax, -112(%rbp)
	movq	-112(%rbp), %rcx
	leaq	-96(%rbp), %rax
	movl	$1, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	regcomp@PLT
	testl	%eax, %eax
	je	.L29
	movl	$0, %eax
	jmp	.L36
.L29:
	movq	-152(%rbp), %rax
	movq	%rax, -120(%rbp)
	jmp	.L31
.L35:
	movl	-24(%rbp), %eax
	movl	%eax, -140(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, -136(%rbp)
	movl	-136(%rbp), %eax
	subl	-140(%rbp), %eax
	movl	%eax, -132(%rbp)
	movl	-132(%rbp), %eax
	addl	$1, %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -104(%rbp)
	movl	-132(%rbp), %eax
	movslq	%eax, %rdx
	movl	-140(%rbp), %eax
	movslq	%eax, %rcx
	movq	-120(%rbp), %rax
	addq	%rax, %rcx
	movq	-104(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	movl	-132(%rbp), %eax
	movslq	%eax, %rdx
	movq	-104(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-104(%rbp), %rax
	movzbl	(%rax), %edx
	movzbl	.LC7(%rip), %eax
	movzbl	%dl, %edx
	movzbl	%al, %eax
	subl	%eax, %edx
	testl	%edx, %edx
	je	.L32
	movq	-104(%rbp), %rax
	leaq	.LC8(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	testq	%rax, %rax
	jne	.L32
	movq	-160(%rbp), %rax
	movl	(%rax), %eax
	addl	$1, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-128(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, -128(%rbp)
	cmpq	$0, -128(%rbp)
	jne	.L33
	call	gettid@PLT
	movl	%eax, %edx
	movq	stderr(%rip), %rax
	leaq	.LC9(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, %eax
	jmp	.L36
.L33:
	movq	-160(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-128(%rbp), %rax
	addq	%rax, %rdx
	movq	-104(%rbp), %rax
	movq	%rax, (%rdx)
	movq	-160(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-160(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L34
.L32:
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L34:
	movl	-28(%rbp), %eax
	cltq
	addq	%rax, -120(%rbp)
.L31:
	leaq	-32(%rbp), %rdx
	movq	-120(%rbp), %rsi
	leaq	-96(%rbp), %rax
	movl	$0, %r8d
	movq	%rdx, %rcx
	movl	$2, %edx
	movq	%rax, %rdi
	call	regexec@PLT
	testl	%eax, %eax
	je	.L35
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	regfree@PLT
	movq	-128(%rbp), %rax
.L36:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L37
	call	__stack_chk_fail@PLT
.L37:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	extract_links, .-extract_links
	.globl	free_links
	.type	free_links, @function
free_links:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L39
.L40:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	$0, (%rax)
	addl	$1, -4(%rbp)
.L39:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L40
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	free_links, .-free_links
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
