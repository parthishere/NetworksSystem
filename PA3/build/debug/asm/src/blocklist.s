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
	subq	$296, %rsp
	.cfi_offset 3, -24
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	$16, %edi
	call	malloc@PLT
	movq	%rax, _blocklist(%rip)
	movq	_blocklist(%rip), %rax
	testq	%rax, %rax
	jne	.L2
	movl	$0, %eax
	jmp	.L7
.L2:
	movq	_blocklist(%rip), %rax
	movq	$0, (%rax)
	movq	_blocklist(%rip), %rax
	movl	$0, 8(%rax)
	leaq	.LC0(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -296(%rbp)
	cmpq	$0, -296(%rbp)
	jne	.L5
	movq	_blocklist(%rip), %rax
	jmp	.L7
.L6:
	leaq	-288(%rbp), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcspn@PLT
	movb	$0, -288(%rbp,%rax)
	movq	_blocklist(%rip), %rax
	movl	8(%rax), %eax
	addl	$1, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	_blocklist(%rip), %rax
	movq	(%rax), %rax
	movq	_blocklist(%rip), %rbx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, (%rbx)
	movq	_blocklist(%rip), %rax
	movq	(%rax), %rdx
	movq	_blocklist(%rip), %rax
	movl	8(%rax), %eax
	cltq
	salq	$3, %rax
	leaq	(%rdx,%rax), %rbx
	leaq	-288(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, (%rbx)
	movq	_blocklist(%rip), %rax
	movl	8(%rax), %edx
	addl	$1, %edx
	movl	%edx, 8(%rax)
.L5:
	movq	-296(%rbp), %rdx
	leaq	-288(%rbp), %rax
	movl	$256, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	testq	%rax, %rax
	jne	.L6
	movq	-296(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movq	_blocklist(%rip), %rax
.L7:
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L8
	call	__stack_chk_fail@PLT
.L8:
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
	jne	.L10
	movq	_blocklist(%rip), %rax
	movq	%rax, -24(%rbp)
.L10:
	movl	$0, -4(%rbp)
	jmp	.L11
.L14:
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
	je	.L12
	movl	$1, %eax
	jmp	.L13
.L12:
	addl	$1, -4(%rbp)
.L11:
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L14
	movl	$0, %eax
.L13:
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
	jne	.L16
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	sete	%al
	movzbl	%al, %eax
	jmp	.L17
.L16:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$42, %al
	jne	.L18
.L21:
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	glob_match
	testl	%eax, %eax
	je	.L19
	movl	$1, %eax
	jmp	.L17
.L19:
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L20
	movl	$0, %eax
	jmp	.L17
.L20:
	addq	$1, -32(%rbp)
	jmp	.L21
.L18:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$91, %al
	jne	.L22
	movl	$0, -8(%rbp)
	addq	$1, -24(%rbp)
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$33, %al
	je	.L23
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$94, %al
	jne	.L24
.L23:
	movl	$1, %eax
	jmp	.L25
.L24:
	movl	$0, %eax
.L25:
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L26
	addq	$1, -24(%rbp)
.L26:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$93, %al
	jne	.L27
	movl	$0, %eax
	jmp	.L17
.L27:
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L28
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, -9(%rbp)
	jmp	.L29
.L36:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L30
	movl	$0, %eax
	jmp	.L17
.L30:
	movq	-24(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$45, %al
	jne	.L31
	movq	-24(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	cmpb	$93, %al
	je	.L31
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	%al, -9(%rbp)
	jl	.L32
	movq	-24(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	cmpb	%al, -9(%rbp)
	jg	.L32
	movl	$1, -8(%rbp)
	jmp	.L33
.L32:
	addq	$3, -24(%rbp)
	jmp	.L29
.L31:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	%al, -9(%rbp)
	jne	.L35
	movl	$1, -8(%rbp)
	jmp	.L33
.L35:
	addq	$1, -24(%rbp)
.L29:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$93, %al
	jne	.L36
.L33:
	jmp	.L37
.L39:
	addq	$1, -24(%rbp)
.L37:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$93, %al
	je	.L38
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L39
.L38:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L40
	movl	$0, %eax
	jmp	.L17
.L40:
	cmpl	$0, -4(%rbp)
	je	.L41
	cmpl	$0, -8(%rbp)
	sete	%al
	movzbl	%al, %eax
	movl	%eax, -8(%rbp)
.L41:
	cmpl	$0, -8(%rbp)
	jne	.L42
	movl	$0, %eax
	jmp	.L17
.L42:
	movl	$1, %eax
	jmp	.L17
.L28:
	movl	$0, %eax
	jmp	.L17
.L22:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$63, %al
	je	.L43
	movq	-24(%rbp), %rax
	movzbl	(%rax), %edx
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	jne	.L44
.L43:
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L46
	movl	$0, %eax
	jmp	.L17
.L44:
	movl	$0, %eax
	jmp	.L17
.L46:
	movq	-32(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	$1, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	glob_match
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	glob_match, .-glob_match
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
