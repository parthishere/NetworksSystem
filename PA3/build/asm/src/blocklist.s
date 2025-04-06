	.file	"blocklist.c"
	.text
.Ltext0:
	.file 0 "/home/parth/Work/All_data/university/Network System/Assignments/PA3" "src/blocklist.c"
	.local	_blocklist
	.comm	_blocklist,8,8
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"./blocklist"
.LC2:
	.string	"\n"
	.text
	.globl	init_blocklist
	.type	init_blocklist, @function
init_blocklist:
.LFB6:
	.file 1 "src/blocklist.c"
	.loc 1 6 1
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
	.loc 1 6 1
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 1 8 17
	movl	$16, %edi
	call	malloc@PLT
	movq	%rax, -304(%rbp)
	.loc 1 9 8
	cmpl	$0, -308(%rbp)
	jne	.L2
	.loc 1 10 20
	movq	-304(%rbp), %rax
	movq	%rax, _blocklist(%rip)
.L2:
	.loc 1 12 8
	cmpq	$0, -304(%rbp)
	jne	.L3
	.loc 1 13 16
	movl	$0, %eax
	jmp	.L8
.L3:
	.loc 1 15 25
	movq	-304(%rbp), %rax
	movq	$0, (%rax)
	.loc 1 16 30
	movq	-304(%rbp), %rax
	movl	$0, 8(%rax)
	.loc 1 19 18
	leaq	.LC0(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -296(%rbp)
	.loc 1 20 8
	cmpq	$0, -296(%rbp)
	jne	.L6
	.loc 1 21 16
	movq	-304(%rbp), %rax
	jmp	.L8
.L7:
	.loc 1 27 14
	leaq	-288(%rbp), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcspn@PLT
	.loc 1 27 35 discriminator 1
	movb	$0, -288(%rbp,%rax)
	.loc 1 31 49
	movq	-304(%rbp), %rax
	movl	8(%rax), %eax
	.loc 1 31 65
	addl	$1, %eax
	cltq
	.loc 1 30 31
	leaq	0(,%rax,8), %rdx
	.loc 1 30 48
	movq	-304(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 30 31
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	.loc 1 30 29 discriminator 1
	movq	-304(%rbp), %rdx
	movq	%rax, (%rdx)
	.loc 1 32 18
	movq	-304(%rbp), %rax
	movq	(%rax), %rdx
	.loc 1 32 38
	movq	-304(%rbp), %rax
	movl	8(%rax), %eax
	cltq
	.loc 1 32 28
	salq	$3, %rax
	leaq	(%rdx,%rax), %rbx
	.loc 1 32 57
	leaq	-288(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	.loc 1 32 55 discriminator 1
	movq	%rax, (%rbx)
	.loc 1 33 18
	movq	-304(%rbp), %rax
	movl	8(%rax), %eax
	.loc 1 33 33
	leal	1(%rax), %edx
	movq	-304(%rbp), %rax
	movl	%edx, 8(%rax)
.L6:
	.loc 1 24 12
	movq	-296(%rbp), %rdx
	leaq	-288(%rbp), %rax
	movl	$256, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	.loc 1 24 12 is_stmt 0 discriminator 1
	testq	%rax, %rax
	jne	.L7
	.loc 1 36 5 is_stmt 1
	movq	-296(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	.loc 1 38 12
	movq	-304(%rbp), %rax
.L8:
	.loc 1 39 1
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
	.loc 1 43 1
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
	.loc 1 44 8
	cmpq	$0, -24(%rbp)
	jne	.L11
	.loc 1 45 19
	movq	_blocklist(%rip), %rax
	movq	%rax, -24(%rbp)
.L11:
.LBB2:
	.loc 1 47 14
	movl	$0, -4(%rbp)
	.loc 1 47 5
	jmp	.L12
.L15:
	.loc 1 49 33
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 49 43
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	.loc 1 49 13
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	glob_match
	.loc 1 49 12 discriminator 1
	testl	%eax, %eax
	je	.L13
	.loc 1 51 20
	movl	$1, %eax
	jmp	.L14
.L13:
	.loc 1 47 52 discriminator 2
	addl	$1, -4(%rbp)
.L12:
	.loc 1 47 34 discriminator 1
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	.loc 1 47 23 discriminator 1
	cmpl	%eax, -4(%rbp)
	jl	.L15
.LBE2:
	.loc 1 55 12
	movl	$0, %eax
.L14:
	.loc 1 56 1
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
	.loc 1 71 1
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
	.loc 1 73 9
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 73 8
	testb	%al, %al
	jne	.L17
	.loc 1 75 17
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 75 25
	testb	%al, %al
	sete	%al
	movzbl	%al, %eax
	jmp	.L18
.L17:
	.loc 1 79 9
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 79 8
	cmpb	$42, %al
	jne	.L19
.L22:
	.loc 1 85 17
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	glob_match
	.loc 1 85 16 discriminator 1
	testl	%eax, %eax
	je	.L20
	.loc 1 87 24
	movl	$1, %eax
	jmp	.L18
.L20:
	.loc 1 89 17
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 89 16
	testb	%al, %al
	jne	.L21
	.loc 1 91 24
	movl	$0, %eax
	jmp	.L18
.L21:
	.loc 1 93 19
	addq	$1, -32(%rbp)
	.loc 1 85 16
	jmp	.L22
.L19:
	.loc 1 98 9
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 98 8
	cmpb	$91, %al
	jne	.L23
.LBB3:
	.loc 1 100 13
	movl	$0, -8(%rbp)
	.loc 1 101 16
	addq	$1, -24(%rbp)
	.loc 1 104 23
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 104 39
	cmpb	$33, %al
	je	.L24
	.loc 1 104 42 discriminator 2
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 104 39 discriminator 2
	cmpb	$94, %al
	jne	.L25
.L24:
	.loc 1 104 39 is_stmt 0 discriminator 3
	movl	$1, %eax
	.loc 1 104 39
	jmp	.L26
.L25:
	.loc 1 104 39 discriminator 4
	movl	$0, %eax
.L26:
	.loc 1 104 13 is_stmt 1 discriminator 6
	movl	%eax, -4(%rbp)
	.loc 1 105 12
	cmpl	$0, -4(%rbp)
	je	.L27
	.loc 1 106 20
	addq	$1, -24(%rbp)
.L27:
	.loc 1 109 13
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 109 12
	cmpb	$93, %al
	jne	.L28
	.loc 1 110 20
	movl	$0, %eax
	jmp	.L18
.L28:
	.loc 1 113 13
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 113 12
	testb	%al, %al
	je	.L29
.LBB4:
	.loc 1 115 18
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, -9(%rbp)
	.loc 1 118 19
	jmp	.L30
.L37:
	.loc 1 120 21
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 120 20
	testb	%al, %al
	jne	.L31
	.loc 1 123 28
	movl	$0, %eax
	jmp	.L18
.L31:
	.loc 1 127 28
	movq	-24(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	.loc 1 127 20
	cmpb	$45, %al
	jne	.L32
	.loc 1 127 49 discriminator 1
	movq	-24(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	.loc 1 127 39 discriminator 1
	cmpb	$93, %al
	je	.L32
	.loc 1 129 30
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 129 24
	cmpb	%al, -9(%rbp)
	jl	.L33
	.loc 1 129 54 discriminator 1
	movq	-24(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	.loc 1 129 39 discriminator 1
	cmpb	%al, -9(%rbp)
	jg	.L33
	.loc 1 131 33
	movl	$1, -8(%rbp)
	.loc 1 132 25
	jmp	.L34
.L33:
	.loc 1 134 29
	addq	$3, -24(%rbp)
	jmp	.L30
.L32:
	.loc 1 139 25
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 139 24
	cmpb	%al, -9(%rbp)
	jne	.L36
	.loc 1 141 33
	movl	$1, -8(%rbp)
	.loc 1 142 25
	jmp	.L34
.L36:
	.loc 1 144 28
	addq	$1, -24(%rbp)
.L30:
	.loc 1 118 20
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 118 29
	cmpb	$93, %al
	jne	.L37
.L34:
	.loc 1 149 19
	jmp	.L38
.L40:
	.loc 1 151 24
	addq	$1, -24(%rbp)
.L38:
	.loc 1 149 20
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 149 36
	cmpb	$93, %al
	je	.L39
	.loc 1 149 39 discriminator 1
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 149 36 discriminator 1
	testb	%al, %al
	jne	.L40
.L39:
	.loc 1 155 17
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 155 16
	testb	%al, %al
	jne	.L41
	.loc 1 157 24
	movl	$0, %eax
	jmp	.L18
.L41:
	.loc 1 161 16
	cmpl	$0, -4(%rbp)
	je	.L42
	.loc 1 163 27
	cmpl	$0, -8(%rbp)
	sete	%al
	.loc 1 163 25
	movzbl	%al, %eax
	movl	%eax, -8(%rbp)
.L42:
	.loc 1 167 16
	cmpl	$0, -8(%rbp)
	jne	.L43
	.loc 1 169 24
	movl	$0, %eax
	jmp	.L18
.L43:
	.loc 1 173 24
	movl	$1, %eax
	jmp	.L18
.L29:
.LBE4:
	.loc 1 179 20
	movl	$0, %eax
	jmp	.L18
.L23:
.LBE3:
	.loc 1 186 14
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 186 13
	cmpb	$63, %al
	je	.L44
	.loc 1 186 33 discriminator 1
	movq	-24(%rbp), %rax
	movzbl	(%rax), %edx
	.loc 1 186 45 discriminator 1
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 186 30 discriminator 1
	cmpb	%al, %dl
	jne	.L45
.L44:
	.loc 1 189 13
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 189 12
	testb	%al, %al
	jne	.L47
	.loc 1 191 20
	movl	$0, %eax
	jmp	.L18
.L45:
	.loc 1 196 16
	movl	$0, %eax
	jmp	.L18
.L47:
	.loc 1 200 12
	movq	-32(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	$1, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	glob_match
.L18:
	.loc 1 201 1
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
	.loc 1 204 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 1 205 7
	cmpq	$0, -24(%rbp)
	jne	.L49
	.loc 1 205 23 discriminator 1
	movq	_blocklist(%rip), %rax
	movq	%rax, -24(%rbp)
.L49:
.LBB5:
	.loc 1 207 13
	movl	$0, -4(%rbp)
	.loc 1 207 5
	jmp	.L50
.L51:
	.loc 1 208 16
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 208 26
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	.loc 1 208 9
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 209 11
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 209 21
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	.loc 1 209 25
	movq	$0, (%rax)
	.loc 1 207 42 discriminator 3
	addl	$1, -4(%rbp)
.L50:
	.loc 1 207 24 discriminator 1
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	.loc 1 207 20 discriminator 1
	cmpl	%eax, -4(%rbp)
	jl	.L51
.LBE5:
	.loc 1 212 5
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 213 8
	movq	$0, -24(%rbp)
	.loc 1 215 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	cleanup_blocklist, .-cleanup_blocklist
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/14/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 6 "includes/blocklist.h"
	.file 7 "/usr/include/stdio.h"
	.file 8 "/usr/include/string.h"
	.file 9 "/usr/include/stdlib.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x56a
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x12
	.long	.LASF73
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x6
	.long	.LASF9
	.byte	0x2
	.byte	0xd6
	.byte	0x17
	.long	0x3a
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x13
	.byte	0x8
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x14
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x6
	.long	.LASF10
	.byte	0x3
	.byte	0x98
	.byte	0x19
	.long	0x6d
	.uleb128 0x6
	.long	.LASF11
	.byte	0x3
	.byte	0x99
	.byte	0x1b
	.long	0x6d
	.uleb128 0x4
	.long	0x96
	.uleb128 0xa
	.long	0x8c
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF12
	.uleb128 0x15
	.long	0x96
	.uleb128 0x16
	.long	.LASF74
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x229
	.uleb128 0x1
	.long	.LASF13
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x66
	.byte	0
	.uleb128 0x1
	.long	.LASF14
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0x8c
	.byte	0x8
	.uleb128 0x1
	.long	.LASF15
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0x8c
	.byte	0x10
	.uleb128 0x1
	.long	.LASF16
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0x8c
	.byte	0x18
	.uleb128 0x1
	.long	.LASF17
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0x8c
	.byte	0x20
	.uleb128 0x1
	.long	.LASF18
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0x8c
	.byte	0x28
	.uleb128 0x1
	.long	.LASF19
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0x8c
	.byte	0x30
	.uleb128 0x1
	.long	.LASF20
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0x8c
	.byte	0x38
	.uleb128 0x1
	.long	.LASF21
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0x8c
	.byte	0x40
	.uleb128 0x1
	.long	.LASF22
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0x8c
	.byte	0x48
	.uleb128 0x1
	.long	.LASF23
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0x8c
	.byte	0x50
	.uleb128 0x1
	.long	.LASF24
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0x8c
	.byte	0x58
	.uleb128 0x1
	.long	.LASF25
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x242
	.byte	0x60
	.uleb128 0x1
	.long	.LASF26
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x247
	.byte	0x68
	.uleb128 0x1
	.long	.LASF27
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x66
	.byte	0x70
	.uleb128 0x1
	.long	.LASF28
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x66
	.byte	0x74
	.uleb128 0x1
	.long	.LASF29
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0x74
	.byte	0x78
	.uleb128 0x1
	.long	.LASF30
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x51
	.byte	0x80
	.uleb128 0x1
	.long	.LASF31
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x58
	.byte	0x82
	.uleb128 0x1
	.long	.LASF32
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x24c
	.byte	0x83
	.uleb128 0x1
	.long	.LASF33
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x25c
	.byte	0x88
	.uleb128 0x1
	.long	.LASF34
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0x80
	.byte	0x90
	.uleb128 0x1
	.long	.LASF35
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x266
	.byte	0x98
	.uleb128 0x1
	.long	.LASF36
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x270
	.byte	0xa0
	.uleb128 0x1
	.long	.LASF37
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x247
	.byte	0xa8
	.uleb128 0x1
	.long	.LASF38
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0x48
	.byte	0xb0
	.uleb128 0x1
	.long	.LASF39
	.byte	0x4
	.byte	0x5f
	.byte	0x15
	.long	0x275
	.byte	0xb8
	.uleb128 0x1
	.long	.LASF40
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x66
	.byte	0xc0
	.uleb128 0x1
	.long	.LASF41
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x27a
	.byte	0xc4
	.byte	0
	.uleb128 0x6
	.long	.LASF42
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0xa2
	.uleb128 0x17
	.long	.LASF75
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0xb
	.long	.LASF43
	.uleb128 0x4
	.long	0x23d
	.uleb128 0x4
	.long	0xa2
	.uleb128 0xc
	.long	0x96
	.long	0x25c
	.uleb128 0xd
	.long	0x3a
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	0x235
	.uleb128 0xb
	.long	.LASF44
	.uleb128 0x4
	.long	0x261
	.uleb128 0xb
	.long	.LASF45
	.uleb128 0x4
	.long	0x26b
	.uleb128 0x4
	.long	0x247
	.uleb128 0xc
	.long	0x96
	.long	0x28a
	.uleb128 0xd
	.long	0x3a
	.byte	0x13
	.byte	0
	.uleb128 0x4
	.long	0x9d
	.uleb128 0xa
	.long	0x28a
	.uleb128 0x4
	.long	0x229
	.uleb128 0xa
	.long	0x294
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF46
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF47
	.uleb128 0x4
	.long	0x8c
	.uleb128 0xc
	.long	0x96
	.long	0x2c1
	.uleb128 0xd
	.long	0x3a
	.byte	0xff
	.byte	0
	.uleb128 0x3
	.byte	0x10
	.byte	0x5
	.long	.LASF48
	.uleb128 0x3
	.byte	0x10
	.byte	0x7
	.long	.LASF49
	.uleb128 0x18
	.byte	0x10
	.byte	0x6
	.byte	0x5
	.byte	0x9
	.long	0x2f3
	.uleb128 0x1
	.long	.LASF50
	.byte	0x6
	.byte	0x6
	.byte	0xc
	.long	0x2ac
	.byte	0
	.uleb128 0x1
	.long	.LASF51
	.byte	0x6
	.byte	0x7
	.byte	0x9
	.long	0x66
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.long	.LASF52
	.byte	0x6
	.byte	0x8
	.byte	0x3
	.long	0x2cf
	.uleb128 0x5
	.long	.LASF60
	.byte	0x3
	.byte	0x15
	.long	0x314
	.uleb128 0x9
	.byte	0x3
	.quad	_blocklist
	.uleb128 0x4
	.long	0x2f3
	.uleb128 0x19
	.long	.LASF76
	.byte	0x9
	.value	0x2af
	.byte	0xd
	.long	0x32c
	.uleb128 0x2
	.long	0x48
	.byte	0
	.uleb128 0xf
	.long	.LASF53
	.byte	0x7
	.byte	0xb8
	.byte	0xc
	.long	0x66
	.long	0x342
	.uleb128 0x2
	.long	0x294
	.byte	0
	.uleb128 0x7
	.long	.LASF54
	.byte	0x7
	.value	0x28e
	.byte	0xe
	.long	0x8c
	.long	0x363
	.uleb128 0x2
	.long	0x91
	.uleb128 0x2
	.long	0x66
	.uleb128 0x2
	.long	0x299
	.byte	0
	.uleb128 0xf
	.long	.LASF55
	.byte	0x8
	.byte	0xbb
	.byte	0xe
	.long	0x8c
	.long	0x379
	.uleb128 0x2
	.long	0x28a
	.byte	0
	.uleb128 0x7
	.long	.LASF56
	.byte	0x9
	.value	0x2ab
	.byte	0xe
	.long	0x48
	.long	0x395
	.uleb128 0x2
	.long	0x48
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0x7
	.long	.LASF57
	.byte	0x8
	.value	0x125
	.byte	0xf
	.long	0x2e
	.long	0x3b1
	.uleb128 0x2
	.long	0x28a
	.uleb128 0x2
	.long	0x28a
	.byte	0
	.uleb128 0x7
	.long	.LASF58
	.byte	0x7
	.value	0x108
	.byte	0xe
	.long	0x294
	.long	0x3cd
	.uleb128 0x2
	.long	0x28f
	.uleb128 0x2
	.long	0x28f
	.byte	0
	.uleb128 0x7
	.long	.LASF59
	.byte	0x9
	.value	0x2a0
	.byte	0xe
	.long	0x48
	.long	0x3e4
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0x1a
	.long	.LASF69
	.byte	0x1
	.byte	0xcb
	.byte	0x6
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x42e
	.uleb128 0x10
	.string	"bl"
	.byte	0xcb
	.byte	0x25
	.long	0x314
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x8
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0xe
	.string	"i"
	.byte	0xcf
	.byte	0xd
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x11
	.long	.LASF65
	.byte	0x46
	.long	0x66
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x4b7
	.uleb128 0x9
	.long	.LASF61
	.byte	0x46
	.byte	0x1c
	.long	0x28a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x9
	.long	.LASF62
	.byte	0x46
	.byte	0x31
	.long	0x28a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x8
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x5
	.long	.LASF63
	.byte	0x64
	.byte	0xd
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x5
	.long	.LASF64
	.byte	0x68
	.byte	0xd
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x8
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0xe
	.string	"c"
	.byte	0x73
	.byte	0x12
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x11
	.long	.LASF66
	.byte	0x2a
	.long	0x66
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x512
	.uleb128 0x9
	.long	.LASF67
	.byte	0x2a
	.byte	0x1d
	.long	0x314
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x9
	.long	.LASF68
	.byte	0x2a
	.byte	0x34
	.long	0x28a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x8
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0xe
	.string	"i"
	.byte	0x2f
	.byte	0xe
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x1b
	.long	.LASF70
	.byte	0x1
	.byte	0x5
	.byte	0xe
	.long	0x314
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x10
	.string	"new"
	.byte	0x5
	.byte	0x21
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -324
	.uleb128 0x5
	.long	.LASF67
	.byte	0x7
	.byte	0x12
	.long	0x314
	.uleb128 0x3
	.byte	0x91
	.sleb128 -320
	.uleb128 0x5
	.long	.LASF71
	.byte	0x13
	.byte	0xb
	.long	0x294
	.uleb128 0x3
	.byte	0x91
	.sleb128 -312
	.uleb128 0x5
	.long	.LASF72
	.byte	0x17
	.byte	0xa
	.long	0x2b1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -304
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF66:
	.string	"is_blocked"
.LASF58:
	.string	"fopen"
.LASF29:
	.string	"_old_offset"
.LASF61:
	.string	"pattern"
.LASF49:
	.string	"__int128 unsigned"
.LASF24:
	.string	"_IO_save_end"
.LASF7:
	.string	"short int"
.LASF9:
	.string	"size_t"
.LASF73:
	.string	"GNU C17 14.2.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF75:
	.string	"_IO_lock_t"
.LASF34:
	.string	"_offset"
.LASF63:
	.string	"matched"
.LASF18:
	.string	"_IO_write_ptr"
.LASF13:
	.string	"_flags"
.LASF48:
	.string	"__int128"
.LASF20:
	.string	"_IO_buf_base"
.LASF71:
	.string	"file"
.LASF25:
	.string	"_markers"
.LASF15:
	.string	"_IO_read_end"
.LASF38:
	.string	"_freeres_buf"
.LASF69:
	.string	"cleanup_blocklist"
.LASF54:
	.string	"fgets"
.LASF72:
	.string	"line"
.LASF76:
	.string	"free"
.LASF57:
	.string	"strcspn"
.LASF68:
	.string	"hostname"
.LASF64:
	.string	"negate"
.LASF46:
	.string	"long long int"
.LASF59:
	.string	"malloc"
.LASF33:
	.string	"_lock"
.LASF8:
	.string	"long int"
.LASF62:
	.string	"string"
.LASF30:
	.string	"_cur_column"
.LASF51:
	.string	"pattern_count"
.LASF52:
	.string	"blocklist_t"
.LASF65:
	.string	"glob_match"
.LASF60:
	.string	"_blocklist"
.LASF31:
	.string	"_vtable_offset"
.LASF74:
	.string	"_IO_FILE"
.LASF4:
	.string	"unsigned char"
.LASF39:
	.string	"_prevchain"
.LASF6:
	.string	"signed char"
.LASF35:
	.string	"_codecvt"
.LASF47:
	.string	"long long unsigned int"
.LASF3:
	.string	"unsigned int"
.LASF43:
	.string	"_IO_marker"
.LASF32:
	.string	"_shortbuf"
.LASF17:
	.string	"_IO_write_base"
.LASF41:
	.string	"_unused2"
.LASF14:
	.string	"_IO_read_ptr"
.LASF21:
	.string	"_IO_buf_end"
.LASF50:
	.string	"patterns"
.LASF12:
	.string	"char"
.LASF36:
	.string	"_wide_data"
.LASF37:
	.string	"_freeres_list"
.LASF56:
	.string	"realloc"
.LASF5:
	.string	"short unsigned int"
.LASF2:
	.string	"long unsigned int"
.LASF19:
	.string	"_IO_write_end"
.LASF11:
	.string	"__off64_t"
.LASF10:
	.string	"__off_t"
.LASF26:
	.string	"_chain"
.LASF45:
	.string	"_IO_wide_data"
.LASF67:
	.string	"blocklist"
.LASF23:
	.string	"_IO_backup_base"
.LASF28:
	.string	"_flags2"
.LASF40:
	.string	"_mode"
.LASF16:
	.string	"_IO_read_base"
.LASF53:
	.string	"fclose"
.LASF70:
	.string	"init_blocklist"
.LASF22:
	.string	"_IO_save_base"
.LASF27:
	.string	"_fileno"
.LASF42:
	.string	"FILE"
.LASF55:
	.string	"strdup"
.LASF44:
	.string	"_IO_codecvt"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/parth/Work/All_data/university/Network System/Assignments/PA3"
.LASF0:
	.string	"src/blocklist.c"
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
