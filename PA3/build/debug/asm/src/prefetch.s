	.file	"prefetch.c"
	.text
	.section	.rodata
.LC0:
	.string	"http://"
.LC1:
	.string	"https://"
.LC2:
	.string	"://"
.LC3:
	.string	"/"
	.align 8
.LC4:
	.string	"\033[35m[+] Absolute URL: host=%s, path=%s\n\033[0m"
.LC5:
	.string	"/%s"
	.align 8
.LC6:
	.string	"\033[35m[+] Relative URL: host=%s, path=%s\n\033[0m"
.LC7:
	.string	"80"
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
	subq	$208, %rsp
	movq	%rdi, -200(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-200(%rbp), %rax
	movq	%rax, -168(%rbp)
	movl	$0, -188(%rbp)
	jmp	.L2
.L15:
	movq	-168(%rbp), %rax
	movq	8(%rax), %rax
	movl	-188(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L23
	movq	-168(%rbp), %rax
	movq	8(%rax), %rax
	movl	-188(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L23
	leaq	-128(%rbp), %rax
	movl	$120, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movq	-168(%rbp), %rax
	movq	8(%rax), %rax
	movl	-188(%rbp), %edx
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
	je	.L6
	movq	-168(%rbp), %rax
	movq	8(%rax), %rax
	movl	-188(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$8, %edx
	leaq	.LC1(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	testl	%eax, %eax
	jne	.L7
.L6:
	movq	-168(%rbp), %rax
	movq	8(%rax), %rax
	movl	-188(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -160(%rbp)
	movq	-160(%rbp), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	movq	%rax, -152(%rbp)
	cmpq	$0, -152(%rbp)
	jne	.L8
	movq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	jmp	.L14
.L8:
	movq	-152(%rbp), %rax
	addq	$3, %rax
	movq	%rax, -144(%rbp)
	movq	-144(%rbp), %rax
	movl	$47, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	movq	%rax, -136(%rbp)
	cmpq	$0, -136(%rbp)
	jne	.L9
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, -112(%rbp)
	movq	-144(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, -104(%rbp)
	jmp	.L10
.L9:
	movq	-136(%rbp), %rax
	movb	$0, (%rax)
	movq	-144(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, -104(%rbp)
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, -112(%rbp)
	movq	-136(%rbp), %rax
	movb	$47, (%rax)
.L10:
	movq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-112(%rbp), %rdx
	movq	-104(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L11
.L7:
	movq	-168(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, -104(%rbp)
	movq	-168(%rbp), %rax
	movq	8(%rax), %rax
	movl	-188(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L12
	movq	-168(%rbp), %rax
	movq	8(%rax), %rax
	movl	-188(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, -112(%rbp)
	jmp	.L13
.L12:
	movq	-168(%rbp), %rax
	movq	8(%rax), %rax
	movl	-188(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rdx
	leaq	-176(%rbp), %rax
	leaq	.LC5(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	movq	-176(%rbp), %rax
	movq	%rax, -112(%rbp)
.L13:
	movq	-112(%rbp), %rdx
	movq	-104(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L11:
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, -96(%rbp)
	movq	-112(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	is_dynamic_content@PLT
	movl	%eax, -180(%rbp)
	movq	-168(%rbp), %rax
	movq	24(%rax), %rsi
	movl	-180(%rbp), %edx
	leaq	-128(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdi
	call	check_and_send_from_cache@PLT
	movq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	jmp	.L14
.L23:
	nop
.L14:
	addl	$1, -188(%rbp)
.L2:
	movq	-168(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -188(%rbp)
	jl	.L15
	movl	$0, -184(%rbp)
	jmp	.L16
.L18:
	movq	-168(%rbp), %rax
	movq	8(%rax), %rax
	movl	-184(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L17
	movq	-168(%rbp), %rax
	movq	8(%rax), %rax
	movl	-184(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L17:
	addl	$1, -184(%rbp)
.L16:
	movq	-168(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -184(%rbp)
	jl	.L18
	movq	-168(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L19
	movq	-168(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L19:
	movq	-168(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L20
	movq	-168(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L20:
	movq	-168(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L22
	call	__stack_chk_fail@PLT
.L22:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	prefetch_thread_func, .-prefetch_thread_func
	.section	.rodata
.LC8:
	.string	"href=[\"']([^\"']+)[\"']"
.LC9:
	.string	"#"
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
	leaq	.LC8(%rip), %rax
	movq	%rax, -112(%rbp)
	movq	-112(%rbp), %rcx
	leaq	-96(%rbp), %rax
	movl	$1, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	regcomp@PLT
	testl	%eax, %eax
	je	.L25
	movl	$0, %eax
	jmp	.L30
.L25:
	movq	-152(%rbp), %rax
	movq	%rax, -120(%rbp)
	jmp	.L27
.L29:
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
	movq	-160(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-128(%rbp), %rax
	addq	%rax, %rdx
	movq	-104(%rbp), %rax
	movq	%rax, (%rdx)
	movq	-104(%rbp), %rax
	leaq	.LC9(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L28
	movq	-104(%rbp), %rax
	leaq	.LC1(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	testq	%rax, %rax
	jne	.L28
	movq	-160(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-160(%rbp), %rax
	movl	%edx, (%rax)
.L28:
	movl	-28(%rbp), %eax
	cltq
	addq	%rax, -120(%rbp)
.L27:
	leaq	-32(%rbp), %rdx
	movq	-120(%rbp), %rsi
	leaq	-96(%rbp), %rax
	movl	$0, %r8d
	movq	%rdx, %rcx
	movl	$2, %edx
	movq	%rax, %rdi
	call	regexec@PLT
	testl	%eax, %eax
	je	.L29
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	regfree@PLT
	movq	-128(%rbp), %rax
.L30:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L31
	call	__stack_chk_fail@PLT
.L31:
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
	jmp	.L33
.L34:
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
.L33:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L34
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
