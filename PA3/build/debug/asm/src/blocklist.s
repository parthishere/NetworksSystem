	.file	"blocklist.c"
	.text
	.local	_blocklist
	.comm	_blocklist,8,8
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"./blocklist.cfg"
.LC2:
	.string	"\n"
	.text
	.globl	init_blocklist
	.type	init_blocklist, @function
init_blocklist:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$312, %rsp
	.cfi_offset 3, -24
	movl	%edi, -308(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	$16, %edi
	call	malloc@PLT
	movq	%rax, -304(%rbp)
	cmpl	$0, -308(%rbp)
	jne	.L2
	movq	-304(%rbp), %rax
	movq	%rax, _blocklist(%rip)
.L2:
	cmpq	$0, -304(%rbp)
	jne	.L3
	movl	$0, %eax
	jmp	.L8
.L3:
	movq	-304(%rbp), %rax
	movq	$0, (%rax)
	movq	-304(%rbp), %rax
	movl	$0, 8(%rax)
	leaq	.LC0(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -296(%rbp)
	cmpq	$0, -296(%rbp)
	jne	.L6
	movq	-304(%rbp), %rax
	jmp	.L8
.L7:
	leaq	-288(%rbp), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcspn@PLT
	movb	$0, -288(%rbp,%rax)
	movq	-304(%rbp), %rax
	movl	8(%rax), %eax
	addl	$1, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-304(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	-304(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	-304(%rbp), %rax
	movq	(%rax), %rdx
	movq	-304(%rbp), %rax
	movl	8(%rax), %eax
	cltq
	salq	$3, %rax
	leaq	(%rdx,%rax), %rbx
	leaq	-288(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, (%rbx)
	movq	-304(%rbp), %rax
	movl	8(%rax), %eax
	leal	1(%rax), %edx
	movq	-304(%rbp), %rax
	movl	%edx, 8(%rax)
.L6:
	movq	-296(%rbp), %rdx
	leaq	-288(%rbp), %rax
	movl	$256, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	testq	%rax, %rax
	jne	.L7
	movq	-296(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movq	-304(%rbp), %rax
.L8:
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	init_blocklist, .-init_blocklist
	.globl	is_blocked
	.type	is_blocked, @function
is_blocked:
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
	cmpq	$0, -24(%rbp)
	jne	.L11
	movq	_blocklist(%rip), %rax
	movq	%rax, -24(%rbp)
.L11:
	movl	$0, -4(%rbp)
	jmp	.L12
.L15:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	glob_match
	testl	%eax, %eax
	je	.L13
	movl	$1, %eax
	jmp	.L14
.L13:
	addl	$1, -4(%rbp)
.L12:
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L15
	movl	$0, %eax
.L14:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	is_blocked, .-is_blocked
	.globl	glob_match
	.type	glob_match, @function
glob_match:
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
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L17
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	sete	%al
	movzbl	%al, %eax
	jmp	.L18
.L17:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$42, %al
	jne	.L19
.L22:
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	glob_match
	testl	%eax, %eax
	je	.L20
	movl	$1, %eax
	jmp	.L18
.L20:
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L21
	movl	$0, %eax
	jmp	.L18
.L21:
	addq	$1, -32(%rbp)
	jmp	.L22
.L19:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$91, %al
	jne	.L23
	movl	$0, -8(%rbp)
	addq	$1, -24(%rbp)
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$33, %al
	je	.L24
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$94, %al
	jne	.L25
.L24:
	movl	$1, %eax
	jmp	.L26
.L25:
	movl	$0, %eax
.L26:
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L27
	addq	$1, -24(%rbp)
.L27:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$93, %al
	jne	.L28
	movl	$0, %eax
	jmp	.L18
.L28:
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L29
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, -9(%rbp)
	jmp	.L30
.L37:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L31
	movl	$0, %eax
	jmp	.L18
.L31:
	movq	-24(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$45, %al
	jne	.L32
	movq	-24(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	cmpb	$93, %al
	je	.L32
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	%al, -9(%rbp)
	jl	.L33
	movq	-24(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	cmpb	%al, -9(%rbp)
	jg	.L33
	movl	$1, -8(%rbp)
	jmp	.L34
.L33:
	addq	$3, -24(%rbp)
	jmp	.L30
.L32:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	%al, -9(%rbp)
	jne	.L36
	movl	$1, -8(%rbp)
	jmp	.L34
.L36:
	addq	$1, -24(%rbp)
.L30:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$93, %al
	jne	.L37
.L34:
	jmp	.L38
.L40:
	addq	$1, -24(%rbp)
.L38:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$93, %al
	je	.L39
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L40
.L39:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L41
	movl	$0, %eax
	jmp	.L18
.L41:
	cmpl	$0, -4(%rbp)
	je	.L42
	cmpl	$0, -8(%rbp)
	sete	%al
	movzbl	%al, %eax
	movl	%eax, -8(%rbp)
.L42:
	cmpl	$0, -8(%rbp)
	jne	.L43
	movl	$0, %eax
	jmp	.L18
.L43:
	movl	$1, %eax
	jmp	.L18
.L29:
	movl	$0, %eax
	jmp	.L18
.L23:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$63, %al
	je	.L44
	movq	-24(%rbp), %rax
	movzbl	(%rax), %edx
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	jne	.L45
.L44:
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L47
	movl	$0, %eax
	jmp	.L18
.L45:
	movl	$0, %eax
	jmp	.L18
.L47:
	movq	-32(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	$1, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	glob_match
.L18:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	glob_match, .-glob_match
	.globl	cleanup_blocklist
	.type	cleanup_blocklist, @function
cleanup_blocklist:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L49
	movq	_blocklist(%rip), %rax
	movq	%rax, -24(%rbp)
.L49:
	movl	$0, -4(%rbp)
	jmp	.L50
.L51:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	$0, (%rax)
	addl	$1, -4(%rbp)
.L50:
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L51
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	$0, -24(%rbp)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	cleanup_blocklist, .-cleanup_blocklist
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
