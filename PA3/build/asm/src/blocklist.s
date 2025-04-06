	.file	"blocklist.c"
	.text
.Ltext0:
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
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
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
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	strcspn@PLT
	.loc 1 27 35
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
	.loc 1 30 29
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
	.loc 1 32 55
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
	.loc 1 24 11
	testq	%rax, %rax
	jne	.L7
	.loc 1 36 5
	movq	-296(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	.loc 1 38 12
	movq	-304(%rbp), %rax
.L8:
	.loc 1 39 1 discriminator 1
	movq	-24(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L9
	.loc 1 39 1 is_stmt 0
	call	__stack_chk_fail@PLT
.L9:
	addq	$312, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	init_blocklist, .-init_blocklist
	.globl	is_blocked
	.type	is_blocked, @function
is_blocked:
.LFB7:
	.loc 1 43 1 is_stmt 1
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
	.loc 1 49 12
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
	.loc 1 47 5 discriminator 1
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
	.loc 1 85 16
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
	jmp	.L26
.L25:
	.loc 1 104 39 discriminator 4
	movl	$0, %eax
.L26:
	.loc 1 104 13 is_stmt 1 discriminator 6
	movl	%eax, -4(%rbp)
	.loc 1 105 12 discriminator 6
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
.L36:
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
	jne	.L35
	.loc 1 141 33
	movl	$1, -8(%rbp)
	.loc 1 142 25
	jmp	.L34
.L35:
	.loc 1 144 28
	addq	$1, -24(%rbp)
.L30:
	.loc 1 118 20
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 118 19
	cmpb	$93, %al
	jne	.L36
.L34:
	.loc 1 149 19
	jmp	.L37
.L39:
	.loc 1 151 24
	addq	$1, -24(%rbp)
.L37:
	.loc 1 149 20
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 149 19
	cmpb	$93, %al
	je	.L38
	.loc 1 149 39 discriminator 1
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 149 36 discriminator 1
	testb	%al, %al
	jne	.L39
.L38:
	.loc 1 155 17
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 155 16
	testb	%al, %al
	jne	.L40
	.loc 1 157 24
	movl	$0, %eax
	jmp	.L18
.L40:
	.loc 1 161 16
	cmpl	$0, -4(%rbp)
	je	.L41
	.loc 1 163 27
	cmpl	$0, -8(%rbp)
	sete	%al
	.loc 1 163 25
	movzbl	%al, %eax
	movl	%eax, -8(%rbp)
.L41:
	.loc 1 167 16
	cmpl	$0, -8(%rbp)
	jne	.L42
	.loc 1 169 24
	movl	$0, %eax
	jmp	.L18
.L42:
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
	je	.L43
	.loc 1 186 33 discriminator 1
	movq	-24(%rbp), %rax
	movzbl	(%rax), %edx
	.loc 1 186 45 discriminator 1
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 186 30 discriminator 1
	cmpb	%al, %dl
	jne	.L44
.L43:
	.loc 1 189 13
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 189 12
	testb	%al, %al
	jne	.L46
	.loc 1 191 20
	movl	$0, %eax
	jmp	.L18
.L44:
	.loc 1 196 16
	movl	$0, %eax
	jmp	.L18
.L46:
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
	jne	.L48
	.loc 1 205 23 discriminator 1
	movq	_blocklist(%rip), %rax
	movq	%rax, -24(%rbp)
.L48:
.LBB5:
	.loc 1 207 13
	movl	$0, -4(%rbp)
	.loc 1 207 5
	jmp	.L49
.L50:
	.loc 1 208 16 discriminator 3
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 208 26 discriminator 3
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	.loc 1 208 9 discriminator 3
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 209 11 discriminator 3
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 209 21 discriminator 3
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	.loc 1 209 25 discriminator 3
	movq	$0, (%rax)
	.loc 1 207 42 discriminator 3
	addl	$1, -4(%rbp)
.L49:
	.loc 1 207 24 discriminator 1
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	.loc 1 207 5 discriminator 1
	cmpl	%eax, -4(%rbp)
	jl	.L50
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
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h"
	.file 9 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h"
	.file 10 "/usr/include/unistd.h"
	.file 11 "/usr/include/x86_64-linux-gnu/bits/getopt_core.h"
	.file 12 "/usr/include/errno.h"
	.file 13 "/usr/include/x86_64-linux-gnu/bits/sockaddr.h"
	.file 14 "/usr/include/x86_64-linux-gnu/bits/socket.h"
	.file 15 "/usr/include/netinet/in.h"
	.file 16 "/usr/include/x86_64-linux-gnu/bits/stat.h"
	.file 17 "/usr/include/signal.h"
	.file 18 "/usr/include/time.h"
	.file 19 "includes/blocklist.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xc08
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF161
	.byte	0xc
	.long	.LASF162
	.long	.LASF163
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF5
	.byte	0x2
	.byte	0xd1
	.byte	0x17
	.long	0x39
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF1
	.uleb128 0x4
	.byte	0x8
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF2
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x2
	.long	.LASF6
	.byte	0x3
	.byte	0x26
	.byte	0x17
	.long	0x49
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x2
	.long	.LASF8
	.byte	0x3
	.byte	0x28
	.byte	0x1c
	.long	0x50
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.long	.LASF9
	.byte	0x3
	.byte	0x2a
	.byte	0x16
	.long	0x40
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF10
	.uleb128 0x2
	.long	.LASF11
	.byte	0x3
	.byte	0x91
	.byte	0x19
	.long	0x39
	.uleb128 0x2
	.long	.LASF12
	.byte	0x3
	.byte	0x92
	.byte	0x19
	.long	0x40
	.uleb128 0x2
	.long	.LASF13
	.byte	0x3
	.byte	0x93
	.byte	0x19
	.long	0x40
	.uleb128 0x2
	.long	.LASF14
	.byte	0x3
	.byte	0x94
	.byte	0x19
	.long	0x39
	.uleb128 0x2
	.long	.LASF15
	.byte	0x3
	.byte	0x95
	.byte	0x1b
	.long	0x39
	.uleb128 0x2
	.long	.LASF16
	.byte	0x3
	.byte	0x96
	.byte	0x1a
	.long	0x40
	.uleb128 0x2
	.long	.LASF17
	.byte	0x3
	.byte	0x97
	.byte	0x1b
	.long	0x39
	.uleb128 0x2
	.long	.LASF18
	.byte	0x3
	.byte	0x98
	.byte	0x19
	.long	0x90
	.uleb128 0x2
	.long	.LASF19
	.byte	0x3
	.byte	0x99
	.byte	0x1b
	.long	0x90
	.uleb128 0x2
	.long	.LASF20
	.byte	0x3
	.byte	0xa0
	.byte	0x1a
	.long	0x90
	.uleb128 0x2
	.long	.LASF21
	.byte	0x3
	.byte	0xae
	.byte	0x1d
	.long	0x90
	.uleb128 0x2
	.long	.LASF22
	.byte	0x3
	.byte	0xb3
	.byte	0x1c
	.long	0x90
	.uleb128 0x2
	.long	.LASF23
	.byte	0x3
	.byte	0xb4
	.byte	0x1e
	.long	0x90
	.uleb128 0x2
	.long	.LASF24
	.byte	0x3
	.byte	0xc4
	.byte	0x21
	.long	0x90
	.uleb128 0x6
	.byte	0x8
	.long	0x145
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF25
	.uleb128 0x7
	.long	0x145
	.uleb128 0x8
	.long	.LASF67
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x2d8
	.uleb128 0x9
	.long	.LASF26
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x7d
	.byte	0
	.uleb128 0x9
	.long	.LASF27
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0x13f
	.byte	0x8
	.uleb128 0x9
	.long	.LASF28
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0x13f
	.byte	0x10
	.uleb128 0x9
	.long	.LASF29
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0x13f
	.byte	0x18
	.uleb128 0x9
	.long	.LASF30
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0x13f
	.byte	0x20
	.uleb128 0x9
	.long	.LASF31
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0x13f
	.byte	0x28
	.uleb128 0x9
	.long	.LASF32
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0x13f
	.byte	0x30
	.uleb128 0x9
	.long	.LASF33
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0x13f
	.byte	0x38
	.uleb128 0x9
	.long	.LASF34
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0x13f
	.byte	0x40
	.uleb128 0x9
	.long	.LASF35
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0x13f
	.byte	0x48
	.uleb128 0x9
	.long	.LASF36
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0x13f
	.byte	0x50
	.uleb128 0x9
	.long	.LASF37
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0x13f
	.byte	0x58
	.uleb128 0x9
	.long	.LASF38
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x2f1
	.byte	0x60
	.uleb128 0x9
	.long	.LASF39
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x2f7
	.byte	0x68
	.uleb128 0x9
	.long	.LASF40
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x7d
	.byte	0x70
	.uleb128 0x9
	.long	.LASF41
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x7d
	.byte	0x74
	.uleb128 0x9
	.long	.LASF42
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0xeb
	.byte	0x78
	.uleb128 0x9
	.long	.LASF43
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x50
	.byte	0x80
	.uleb128 0x9
	.long	.LASF44
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x57
	.byte	0x82
	.uleb128 0x9
	.long	.LASF45
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x2fd
	.byte	0x83
	.uleb128 0x9
	.long	.LASF46
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x30d
	.byte	0x88
	.uleb128 0x9
	.long	.LASF47
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0xf7
	.byte	0x90
	.uleb128 0x9
	.long	.LASF48
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x318
	.byte	0x98
	.uleb128 0x9
	.long	.LASF49
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x323
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF50
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x2f7
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF51
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0x47
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF52
	.byte	0x4
	.byte	0x5f
	.byte	0xa
	.long	0x2d
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF53
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x7d
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF54
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x329
	.byte	0xc4
	.byte	0
	.uleb128 0x2
	.long	.LASF55
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0x151
	.uleb128 0xa
	.long	.LASF164
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0xb
	.long	.LASF56
	.uleb128 0x6
	.byte	0x8
	.long	0x2ec
	.uleb128 0x6
	.byte	0x8
	.long	0x151
	.uleb128 0xc
	.long	0x145
	.long	0x30d
	.uleb128 0xd
	.long	0x39
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x2e4
	.uleb128 0xb
	.long	.LASF57
	.uleb128 0x6
	.byte	0x8
	.long	0x313
	.uleb128 0xb
	.long	.LASF58
	.uleb128 0x6
	.byte	0x8
	.long	0x31e
	.uleb128 0xc
	.long	0x145
	.long	0x339
	.uleb128 0xd
	.long	0x39
	.byte	0x13
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x14c
	.uleb128 0x7
	.long	0x339
	.uleb128 0xe
	.long	0x339
	.uleb128 0xf
	.long	.LASF59
	.byte	0x6
	.byte	0x89
	.byte	0xe
	.long	0x355
	.uleb128 0x6
	.byte	0x8
	.long	0x2d8
	.uleb128 0xf
	.long	.LASF60
	.byte	0x6
	.byte	0x8a
	.byte	0xe
	.long	0x355
	.uleb128 0xf
	.long	.LASF61
	.byte	0x6
	.byte	0x8b
	.byte	0xe
	.long	0x355
	.uleb128 0xf
	.long	.LASF62
	.byte	0x7
	.byte	0x1a
	.byte	0xc
	.long	0x7d
	.uleb128 0xc
	.long	0x33f
	.long	0x38a
	.uleb128 0x10
	.byte	0
	.uleb128 0x7
	.long	0x37f
	.uleb128 0xf
	.long	.LASF63
	.byte	0x7
	.byte	0x1b
	.byte	0x1a
	.long	0x38a
	.uleb128 0xf
	.long	.LASF64
	.byte	0x7
	.byte	0x1e
	.byte	0xc
	.long	0x7d
	.uleb128 0xf
	.long	.LASF65
	.byte	0x7
	.byte	0x1f
	.byte	0x1a
	.long	0x38a
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF66
	.uleb128 0x8
	.long	.LASF68
	.byte	0x10
	.byte	0x8
	.byte	0xa
	.byte	0x8
	.long	0x3e2
	.uleb128 0x9
	.long	.LASF69
	.byte	0x8
	.byte	0xc
	.byte	0xc
	.long	0x103
	.byte	0
	.uleb128 0x9
	.long	.LASF70
	.byte	0x8
	.byte	0x10
	.byte	0x15
	.long	0x133
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF71
	.uleb128 0x2
	.long	.LASF72
	.byte	0x9
	.byte	0x18
	.byte	0x13
	.long	0x5e
	.uleb128 0x2
	.long	.LASF73
	.byte	0x9
	.byte	0x19
	.byte	0x14
	.long	0x71
	.uleb128 0x2
	.long	.LASF74
	.byte	0x9
	.byte	0x1a
	.byte	0x14
	.long	0x84
	.uleb128 0x11
	.long	.LASF75
	.byte	0xa
	.value	0x21f
	.byte	0xf
	.long	0x41a
	.uleb128 0x6
	.byte	0x8
	.long	0x13f
	.uleb128 0x11
	.long	.LASF76
	.byte	0xa
	.value	0x221
	.byte	0xf
	.long	0x41a
	.uleb128 0xf
	.long	.LASF77
	.byte	0xb
	.byte	0x24
	.byte	0xe
	.long	0x13f
	.uleb128 0xf
	.long	.LASF78
	.byte	0xb
	.byte	0x32
	.byte	0xc
	.long	0x7d
	.uleb128 0xf
	.long	.LASF79
	.byte	0xb
	.byte	0x37
	.byte	0xc
	.long	0x7d
	.uleb128 0xf
	.long	.LASF80
	.byte	0xb
	.byte	0x3b
	.byte	0xc
	.long	0x7d
	.uleb128 0xf
	.long	.LASF81
	.byte	0xc
	.byte	0x2d
	.byte	0xe
	.long	0x13f
	.uleb128 0xf
	.long	.LASF82
	.byte	0xc
	.byte	0x2e
	.byte	0xe
	.long	0x13f
	.uleb128 0xc
	.long	0x145
	.long	0x485
	.uleb128 0xd
	.long	0x39
	.byte	0xff
	.byte	0
	.uleb128 0x2
	.long	.LASF83
	.byte	0xd
	.byte	0x1c
	.byte	0x1c
	.long	0x50
	.uleb128 0x8
	.long	.LASF84
	.byte	0x10
	.byte	0xe
	.byte	0xb2
	.byte	0x8
	.long	0x4b9
	.uleb128 0x9
	.long	.LASF85
	.byte	0xe
	.byte	0xb4
	.byte	0x5
	.long	0x485
	.byte	0
	.uleb128 0x9
	.long	.LASF86
	.byte	0xe
	.byte	0xb5
	.byte	0xa
	.long	0x4be
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	0x491
	.uleb128 0xc
	.long	0x145
	.long	0x4ce
	.uleb128 0xd
	.long	0x39
	.byte	0xd
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x491
	.uleb128 0xe
	.long	0x4ce
	.uleb128 0xb
	.long	.LASF87
	.uleb128 0x7
	.long	0x4d9
	.uleb128 0x6
	.byte	0x8
	.long	0x4d9
	.uleb128 0xe
	.long	0x4e3
	.uleb128 0xb
	.long	.LASF88
	.uleb128 0x7
	.long	0x4ee
	.uleb128 0x6
	.byte	0x8
	.long	0x4ee
	.uleb128 0xe
	.long	0x4f8
	.uleb128 0xb
	.long	.LASF89
	.uleb128 0x7
	.long	0x503
	.uleb128 0x6
	.byte	0x8
	.long	0x503
	.uleb128 0xe
	.long	0x50d
	.uleb128 0xb
	.long	.LASF90
	.uleb128 0x7
	.long	0x518
	.uleb128 0x6
	.byte	0x8
	.long	0x518
	.uleb128 0xe
	.long	0x522
	.uleb128 0x8
	.long	.LASF91
	.byte	0x10
	.byte	0xf
	.byte	0xee
	.byte	0x8
	.long	0x56f
	.uleb128 0x9
	.long	.LASF92
	.byte	0xf
	.byte	0xf0
	.byte	0x5
	.long	0x485
	.byte	0
	.uleb128 0x9
	.long	.LASF93
	.byte	0xf
	.byte	0xf1
	.byte	0xf
	.long	0x716
	.byte	0x2
	.uleb128 0x9
	.long	.LASF94
	.byte	0xf
	.byte	0xf2
	.byte	0x14
	.long	0x6fb
	.byte	0x4
	.uleb128 0x9
	.long	.LASF95
	.byte	0xf
	.byte	0xf5
	.byte	0x13
	.long	0x7b8
	.byte	0x8
	.byte	0
	.uleb128 0x7
	.long	0x52d
	.uleb128 0x6
	.byte	0x8
	.long	0x52d
	.uleb128 0xe
	.long	0x574
	.uleb128 0x8
	.long	.LASF96
	.byte	0x1c
	.byte	0xf
	.byte	0xfd
	.byte	0x8
	.long	0x5d2
	.uleb128 0x9
	.long	.LASF97
	.byte	0xf
	.byte	0xff
	.byte	0x5
	.long	0x485
	.byte	0
	.uleb128 0x12
	.long	.LASF98
	.byte	0xf
	.value	0x100
	.byte	0xf
	.long	0x716
	.byte	0x2
	.uleb128 0x12
	.long	.LASF99
	.byte	0xf
	.value	0x101
	.byte	0xe
	.long	0x401
	.byte	0x4
	.uleb128 0x12
	.long	.LASF100
	.byte	0xf
	.value	0x102
	.byte	0x15
	.long	0x780
	.byte	0x8
	.uleb128 0x12
	.long	.LASF101
	.byte	0xf
	.value	0x103
	.byte	0xe
	.long	0x401
	.byte	0x18
	.byte	0
	.uleb128 0x7
	.long	0x57f
	.uleb128 0x6
	.byte	0x8
	.long	0x57f
	.uleb128 0xe
	.long	0x5d7
	.uleb128 0xb
	.long	.LASF102
	.uleb128 0x7
	.long	0x5e2
	.uleb128 0x6
	.byte	0x8
	.long	0x5e2
	.uleb128 0xe
	.long	0x5ec
	.uleb128 0xb
	.long	.LASF103
	.uleb128 0x7
	.long	0x5f7
	.uleb128 0x6
	.byte	0x8
	.long	0x5f7
	.uleb128 0xe
	.long	0x601
	.uleb128 0xb
	.long	.LASF104
	.uleb128 0x7
	.long	0x60c
	.uleb128 0x6
	.byte	0x8
	.long	0x60c
	.uleb128 0xe
	.long	0x616
	.uleb128 0xb
	.long	.LASF105
	.uleb128 0x7
	.long	0x621
	.uleb128 0x6
	.byte	0x8
	.long	0x621
	.uleb128 0xe
	.long	0x62b
	.uleb128 0xb
	.long	.LASF106
	.uleb128 0x7
	.long	0x636
	.uleb128 0x6
	.byte	0x8
	.long	0x636
	.uleb128 0xe
	.long	0x640
	.uleb128 0xb
	.long	.LASF107
	.uleb128 0x7
	.long	0x64b
	.uleb128 0x6
	.byte	0x8
	.long	0x64b
	.uleb128 0xe
	.long	0x655
	.uleb128 0x6
	.byte	0x8
	.long	0x4b9
	.uleb128 0xe
	.long	0x660
	.uleb128 0x6
	.byte	0x8
	.long	0x4de
	.uleb128 0xe
	.long	0x66b
	.uleb128 0x6
	.byte	0x8
	.long	0x4f3
	.uleb128 0xe
	.long	0x676
	.uleb128 0x6
	.byte	0x8
	.long	0x508
	.uleb128 0xe
	.long	0x681
	.uleb128 0x6
	.byte	0x8
	.long	0x51d
	.uleb128 0xe
	.long	0x68c
	.uleb128 0x6
	.byte	0x8
	.long	0x56f
	.uleb128 0xe
	.long	0x697
	.uleb128 0x6
	.byte	0x8
	.long	0x5d2
	.uleb128 0xe
	.long	0x6a2
	.uleb128 0x6
	.byte	0x8
	.long	0x5e7
	.uleb128 0xe
	.long	0x6ad
	.uleb128 0x6
	.byte	0x8
	.long	0x5fc
	.uleb128 0xe
	.long	0x6b8
	.uleb128 0x6
	.byte	0x8
	.long	0x611
	.uleb128 0xe
	.long	0x6c3
	.uleb128 0x6
	.byte	0x8
	.long	0x626
	.uleb128 0xe
	.long	0x6ce
	.uleb128 0x6
	.byte	0x8
	.long	0x63b
	.uleb128 0xe
	.long	0x6d9
	.uleb128 0x6
	.byte	0x8
	.long	0x650
	.uleb128 0xe
	.long	0x6e4
	.uleb128 0x2
	.long	.LASF108
	.byte	0xf
	.byte	0x1e
	.byte	0x12
	.long	0x401
	.uleb128 0x8
	.long	.LASF109
	.byte	0x4
	.byte	0xf
	.byte	0x1f
	.byte	0x8
	.long	0x716
	.uleb128 0x9
	.long	.LASF110
	.byte	0xf
	.byte	0x21
	.byte	0xf
	.long	0x6ef
	.byte	0
	.byte	0
	.uleb128 0x2
	.long	.LASF111
	.byte	0xf
	.byte	0x77
	.byte	0x12
	.long	0x3f5
	.uleb128 0x13
	.byte	0x10
	.byte	0xf
	.byte	0xd6
	.byte	0x5
	.long	0x750
	.uleb128 0x14
	.long	.LASF112
	.byte	0xf
	.byte	0xd8
	.byte	0xa
	.long	0x750
	.uleb128 0x14
	.long	.LASF113
	.byte	0xf
	.byte	0xd9
	.byte	0xb
	.long	0x760
	.uleb128 0x14
	.long	.LASF114
	.byte	0xf
	.byte	0xda
	.byte	0xb
	.long	0x770
	.byte	0
	.uleb128 0xc
	.long	0x3e9
	.long	0x760
	.uleb128 0xd
	.long	0x39
	.byte	0xf
	.byte	0
	.uleb128 0xc
	.long	0x3f5
	.long	0x770
	.uleb128 0xd
	.long	0x39
	.byte	0x7
	.byte	0
	.uleb128 0xc
	.long	0x401
	.long	0x780
	.uleb128 0xd
	.long	0x39
	.byte	0x3
	.byte	0
	.uleb128 0x8
	.long	.LASF115
	.byte	0x10
	.byte	0xf
	.byte	0xd4
	.byte	0x8
	.long	0x79b
	.uleb128 0x9
	.long	.LASF116
	.byte	0xf
	.byte	0xdb
	.byte	0x9
	.long	0x722
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x780
	.uleb128 0xf
	.long	.LASF117
	.byte	0xf
	.byte	0xe4
	.byte	0x1e
	.long	0x79b
	.uleb128 0xf
	.long	.LASF118
	.byte	0xf
	.byte	0xe5
	.byte	0x1e
	.long	0x79b
	.uleb128 0xc
	.long	0x49
	.long	0x7c8
	.uleb128 0xd
	.long	0x39
	.byte	0x7
	.byte	0
	.uleb128 0x8
	.long	.LASF119
	.byte	0x90
	.byte	0x10
	.byte	0x2e
	.byte	0x8
	.long	0x899
	.uleb128 0x9
	.long	.LASF120
	.byte	0x10
	.byte	0x30
	.byte	0xd
	.long	0x97
	.byte	0
	.uleb128 0x9
	.long	.LASF121
	.byte	0x10
	.byte	0x35
	.byte	0xd
	.long	0xbb
	.byte	0x8
	.uleb128 0x9
	.long	.LASF122
	.byte	0x10
	.byte	0x3d
	.byte	0xf
	.long	0xdf
	.byte	0x10
	.uleb128 0x9
	.long	.LASF123
	.byte	0x10
	.byte	0x3e
	.byte	0xe
	.long	0xd3
	.byte	0x18
	.uleb128 0x9
	.long	.LASF124
	.byte	0x10
	.byte	0x40
	.byte	0xd
	.long	0xa3
	.byte	0x1c
	.uleb128 0x9
	.long	.LASF125
	.byte	0x10
	.byte	0x41
	.byte	0xd
	.long	0xaf
	.byte	0x20
	.uleb128 0x9
	.long	.LASF126
	.byte	0x10
	.byte	0x43
	.byte	0x9
	.long	0x7d
	.byte	0x24
	.uleb128 0x9
	.long	.LASF127
	.byte	0x10
	.byte	0x45
	.byte	0xd
	.long	0x97
	.byte	0x28
	.uleb128 0x9
	.long	.LASF128
	.byte	0x10
	.byte	0x4a
	.byte	0xd
	.long	0xeb
	.byte	0x30
	.uleb128 0x9
	.long	.LASF129
	.byte	0x10
	.byte	0x4e
	.byte	0x11
	.long	0x10f
	.byte	0x38
	.uleb128 0x9
	.long	.LASF130
	.byte	0x10
	.byte	0x50
	.byte	0x10
	.long	0x11b
	.byte	0x40
	.uleb128 0x9
	.long	.LASF131
	.byte	0x10
	.byte	0x5b
	.byte	0x15
	.long	0x3ba
	.byte	0x48
	.uleb128 0x9
	.long	.LASF132
	.byte	0x10
	.byte	0x5c
	.byte	0x15
	.long	0x3ba
	.byte	0x58
	.uleb128 0x9
	.long	.LASF133
	.byte	0x10
	.byte	0x5d
	.byte	0x15
	.long	0x3ba
	.byte	0x68
	.uleb128 0x9
	.long	.LASF134
	.byte	0x10
	.byte	0x6a
	.byte	0x17
	.long	0x899
	.byte	0x78
	.byte	0
	.uleb128 0xc
	.long	0x133
	.long	0x8a9
	.uleb128 0xd
	.long	0x39
	.byte	0x2
	.byte	0
	.uleb128 0x8
	.long	.LASF135
	.byte	0x90
	.byte	0x10
	.byte	0x77
	.byte	0x8
	.long	0x97a
	.uleb128 0x9
	.long	.LASF120
	.byte	0x10
	.byte	0x79
	.byte	0xd
	.long	0x97
	.byte	0
	.uleb128 0x9
	.long	.LASF121
	.byte	0x10
	.byte	0x7b
	.byte	0xf
	.long	0xc7
	.byte	0x8
	.uleb128 0x9
	.long	.LASF122
	.byte	0x10
	.byte	0x7c
	.byte	0xf
	.long	0xdf
	.byte	0x10
	.uleb128 0x9
	.long	.LASF123
	.byte	0x10
	.byte	0x7d
	.byte	0xe
	.long	0xd3
	.byte	0x18
	.uleb128 0x9
	.long	.LASF124
	.byte	0x10
	.byte	0x84
	.byte	0xd
	.long	0xa3
	.byte	0x1c
	.uleb128 0x9
	.long	.LASF125
	.byte	0x10
	.byte	0x85
	.byte	0xd
	.long	0xaf
	.byte	0x20
	.uleb128 0x9
	.long	.LASF126
	.byte	0x10
	.byte	0x87
	.byte	0x9
	.long	0x7d
	.byte	0x24
	.uleb128 0x9
	.long	.LASF127
	.byte	0x10
	.byte	0x88
	.byte	0xd
	.long	0x97
	.byte	0x28
	.uleb128 0x9
	.long	.LASF128
	.byte	0x10
	.byte	0x89
	.byte	0xd
	.long	0xeb
	.byte	0x30
	.uleb128 0x9
	.long	.LASF129
	.byte	0x10
	.byte	0x8f
	.byte	0x11
	.long	0x10f
	.byte	0x38
	.uleb128 0x9
	.long	.LASF130
	.byte	0x10
	.byte	0x90
	.byte	0x12
	.long	0x127
	.byte	0x40
	.uleb128 0x9
	.long	.LASF131
	.byte	0x10
	.byte	0x98
	.byte	0x15
	.long	0x3ba
	.byte	0x48
	.uleb128 0x9
	.long	.LASF132
	.byte	0x10
	.byte	0x99
	.byte	0x15
	.long	0x3ba
	.byte	0x58
	.uleb128 0x9
	.long	.LASF133
	.byte	0x10
	.byte	0x9a
	.byte	0x15
	.long	0x3ba
	.byte	0x68
	.uleb128 0x9
	.long	.LASF134
	.byte	0x10
	.byte	0xa4
	.byte	0x17
	.long	0x899
	.byte	0x78
	.byte	0
	.uleb128 0xc
	.long	0x33f
	.long	0x98a
	.uleb128 0xd
	.long	0x39
	.byte	0x40
	.byte	0
	.uleb128 0x7
	.long	0x97a
	.uleb128 0x11
	.long	.LASF136
	.byte	0x11
	.value	0x11e
	.byte	0x1a
	.long	0x98a
	.uleb128 0x11
	.long	.LASF137
	.byte	0x11
	.value	0x11f
	.byte	0x1a
	.long	0x98a
	.uleb128 0xc
	.long	0x13f
	.long	0x9b9
	.uleb128 0xd
	.long	0x39
	.byte	0x1
	.byte	0
	.uleb128 0xf
	.long	.LASF138
	.byte	0x12
	.byte	0x9f
	.byte	0xe
	.long	0x9a9
	.uleb128 0xf
	.long	.LASF139
	.byte	0x12
	.byte	0xa0
	.byte	0xc
	.long	0x7d
	.uleb128 0xf
	.long	.LASF140
	.byte	0x12
	.byte	0xa1
	.byte	0x11
	.long	0x90
	.uleb128 0xf
	.long	.LASF141
	.byte	0x12
	.byte	0xa6
	.byte	0xe
	.long	0x9a9
	.uleb128 0xf
	.long	.LASF142
	.byte	0x12
	.byte	0xae
	.byte	0xc
	.long	0x7d
	.uleb128 0xf
	.long	.LASF143
	.byte	0x12
	.byte	0xaf
	.byte	0x11
	.long	0x90
	.uleb128 0x11
	.long	.LASF144
	.byte	0x12
	.value	0x112
	.byte	0xc
	.long	0x7d
	.uleb128 0x6
	.byte	0x8
	.long	0x7c8
	.uleb128 0xe
	.long	0xa0e
	.uleb128 0x6
	.byte	0x8
	.long	0x8a9
	.uleb128 0xe
	.long	0xa19
	.uleb128 0x15
	.byte	0x10
	.byte	0x13
	.byte	0x5
	.byte	0x9
	.long	0xa48
	.uleb128 0x9
	.long	.LASF145
	.byte	0x13
	.byte	0x6
	.byte	0xc
	.long	0x41a
	.byte	0
	.uleb128 0x9
	.long	.LASF146
	.byte	0x13
	.byte	0x7
	.byte	0x9
	.long	0x7d
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.long	.LASF147
	.byte	0x13
	.byte	0x8
	.byte	0x3
	.long	0xa24
	.uleb128 0x16
	.long	.LASF148
	.byte	0x1
	.byte	0x3
	.byte	0x15
	.long	0xa6a
	.uleb128 0x9
	.byte	0x3
	.quad	_blocklist
	.uleb128 0x6
	.byte	0x8
	.long	0xa48
	.uleb128 0x17
	.long	.LASF157
	.byte	0x1
	.byte	0xcb
	.byte	0x6
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0xabc
	.uleb128 0x18
	.string	"bl"
	.byte	0x1
	.byte	0xcb
	.byte	0x25
	.long	0xa6a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x19
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x1a
	.string	"i"
	.byte	0x1
	.byte	0xcf
	.byte	0xd
	.long	0x7d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x1b
	.long	.LASF153
	.byte	0x1
	.byte	0x46
	.byte	0x5
	.long	0x7d
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0xb4c
	.uleb128 0x1c
	.long	.LASF149
	.byte	0x1
	.byte	0x46
	.byte	0x1c
	.long	0x339
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.long	.LASF150
	.byte	0x1
	.byte	0x46
	.byte	0x31
	.long	0x339
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x19
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x16
	.long	.LASF151
	.byte	0x1
	.byte	0x64
	.byte	0xd
	.long	0x7d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.long	.LASF152
	.byte	0x1
	.byte	0x68
	.byte	0xd
	.long	0x7d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x1a
	.string	"c"
	.byte	0x1
	.byte	0x73
	.byte	0x12
	.long	0x145
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1b
	.long	.LASF154
	.byte	0x1
	.byte	0x2a
	.byte	0x5
	.long	0x7d
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0xbac
	.uleb128 0x1c
	.long	.LASF155
	.byte	0x1
	.byte	0x2a
	.byte	0x1d
	.long	0xa6a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.long	.LASF156
	.byte	0x1
	.byte	0x2a
	.byte	0x34
	.long	0x339
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x19
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x1a
	.string	"i"
	.byte	0x1
	.byte	0x2f
	.byte	0xe
	.long	0x7d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x1d
	.long	.LASF158
	.byte	0x1
	.byte	0x5
	.byte	0xe
	.long	0xa6a
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x18
	.string	"new"
	.byte	0x1
	.byte	0x5
	.byte	0x21
	.long	0x7d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -324
	.uleb128 0x16
	.long	.LASF155
	.byte	0x1
	.byte	0x7
	.byte	0x12
	.long	0xa6a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -320
	.uleb128 0x16
	.long	.LASF159
	.byte	0x1
	.byte	0x13
	.byte	0xb
	.long	0x355
	.uleb128 0x3
	.byte	0x91
	.sleb128 -312
	.uleb128 0x16
	.long	.LASF160
	.byte	0x1
	.byte	0x17
	.byte	0xa
	.long	0x475
	.uleb128 0x3
	.byte	0x91
	.sleb128 -304
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
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
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x17
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
	.uleb128 0x14
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
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0x34
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
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
	.uleb128 0x19
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x5
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.uleb128 0x2116
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
.LASF18:
	.string	"__off_t"
.LASF13:
	.string	"__gid_t"
.LASF27:
	.string	"_IO_read_ptr"
.LASF39:
	.string	"_chain"
.LASF133:
	.string	"st_ctim"
.LASF100:
	.string	"sin6_addr"
.LASF116:
	.string	"__in6_u"
.LASF5:
	.string	"size_t"
.LASF45:
	.string	"_shortbuf"
.LASF150:
	.string	"string"
.LASF6:
	.string	"__uint8_t"
.LASF33:
	.string	"_IO_buf_base"
.LASF71:
	.string	"long long unsigned int"
.LASF108:
	.string	"in_addr_t"
.LASF48:
	.string	"_codecvt"
.LASF119:
	.string	"stat"
.LASF66:
	.string	"long long int"
.LASF4:
	.string	"signed char"
.LASF102:
	.string	"sockaddr_inarp"
.LASF121:
	.string	"st_ino"
.LASF16:
	.string	"__mode_t"
.LASF40:
	.string	"_fileno"
.LASF28:
	.string	"_IO_read_end"
.LASF164:
	.string	"_IO_lock_t"
.LASF140:
	.string	"__timezone"
.LASF22:
	.string	"__blkcnt_t"
.LASF137:
	.string	"sys_siglist"
.LASF10:
	.string	"long int"
.LASF114:
	.string	"__u6_addr32"
.LASF26:
	.string	"_flags"
.LASF49:
	.string	"_wide_data"
.LASF155:
	.string	"blocklist"
.LASF43:
	.string	"_cur_column"
.LASF82:
	.string	"program_invocation_short_name"
.LASF57:
	.string	"_IO_codecvt"
.LASF89:
	.string	"sockaddr_dl"
.LASF98:
	.string	"sin6_port"
.LASF73:
	.string	"uint16_t"
.LASF131:
	.string	"st_atim"
.LASF81:
	.string	"program_invocation_name"
.LASF42:
	.string	"_old_offset"
.LASF47:
	.string	"_offset"
.LASF118:
	.string	"in6addr_loopback"
.LASF157:
	.string	"cleanup_blocklist"
.LASF107:
	.string	"sockaddr_x25"
.LASF103:
	.string	"sockaddr_ipx"
.LASF163:
	.string	"/home/user/Desktop/NetworksSystem/PA3"
.LASF160:
	.string	"line"
.LASF9:
	.string	"__uint32_t"
.LASF143:
	.string	"timezone"
.LASF95:
	.string	"sin_zero"
.LASF52:
	.string	"__pad5"
.LASF130:
	.string	"st_blocks"
.LASF124:
	.string	"st_uid"
.LASF56:
	.string	"_IO_marker"
.LASF59:
	.string	"stdin"
.LASF1:
	.string	"unsigned int"
.LASF110:
	.string	"s_addr"
.LASF51:
	.string	"_freeres_buf"
.LASF0:
	.string	"long unsigned int"
.LASF158:
	.string	"init_blocklist"
.LASF31:
	.string	"_IO_write_ptr"
.LASF142:
	.string	"daylight"
.LASF62:
	.string	"sys_nerr"
.LASF3:
	.string	"short unsigned int"
.LASF94:
	.string	"sin_addr"
.LASF35:
	.string	"_IO_save_base"
.LASF17:
	.string	"__nlink_t"
.LASF162:
	.string	"src/blocklist.c"
.LASF76:
	.string	"environ"
.LASF46:
	.string	"_lock"
.LASF41:
	.string	"_flags2"
.LASF53:
	.string	"_mode"
.LASF60:
	.string	"stdout"
.LASF135:
	.string	"stat64"
.LASF128:
	.string	"st_size"
.LASF106:
	.string	"sockaddr_un"
.LASF123:
	.string	"st_mode"
.LASF92:
	.string	"sin_family"
.LASF161:
	.string	"GNU C17 9.4.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF77:
	.string	"optarg"
.LASF70:
	.string	"tv_nsec"
.LASF144:
	.string	"getdate_err"
.LASF11:
	.string	"__dev_t"
.LASF97:
	.string	"sin6_family"
.LASF78:
	.string	"optind"
.LASF24:
	.string	"__syscall_slong_t"
.LASF32:
	.string	"_IO_write_end"
.LASF152:
	.string	"negate"
.LASF117:
	.string	"in6addr_any"
.LASF67:
	.string	"_IO_FILE"
.LASF21:
	.string	"__blksize_t"
.LASF149:
	.string	"pattern"
.LASF75:
	.string	"__environ"
.LASF139:
	.string	"__daylight"
.LASF105:
	.string	"sockaddr_ns"
.LASF93:
	.string	"sin_port"
.LASF85:
	.string	"sa_family"
.LASF63:
	.string	"sys_errlist"
.LASF38:
	.string	"_markers"
.LASF151:
	.string	"matched"
.LASF23:
	.string	"__blkcnt64_t"
.LASF134:
	.string	"__glibc_reserved"
.LASF101:
	.string	"sin6_scope_id"
.LASF122:
	.string	"st_nlink"
.LASF2:
	.string	"unsigned char"
.LASF104:
	.string	"sockaddr_iso"
.LASF34:
	.string	"_IO_buf_end"
.LASF7:
	.string	"short int"
.LASF159:
	.string	"file"
.LASF129:
	.string	"st_blksize"
.LASF113:
	.string	"__u6_addr16"
.LASF64:
	.string	"_sys_nerr"
.LASF68:
	.string	"timespec"
.LASF44:
	.string	"_vtable_offset"
.LASF141:
	.string	"tzname"
.LASF88:
	.string	"sockaddr_ax25"
.LASF55:
	.string	"FILE"
.LASF126:
	.string	"__pad0"
.LASF14:
	.string	"__ino_t"
.LASF80:
	.string	"optopt"
.LASF74:
	.string	"uint32_t"
.LASF115:
	.string	"in6_addr"
.LASF127:
	.string	"st_rdev"
.LASF148:
	.string	"_blocklist"
.LASF25:
	.string	"char"
.LASF145:
	.string	"patterns"
.LASF69:
	.string	"tv_sec"
.LASF99:
	.string	"sin6_flowinfo"
.LASF8:
	.string	"__uint16_t"
.LASF112:
	.string	"__u6_addr8"
.LASF65:
	.string	"_sys_errlist"
.LASF79:
	.string	"opterr"
.LASF12:
	.string	"__uid_t"
.LASF19:
	.string	"__off64_t"
.LASF29:
	.string	"_IO_read_base"
.LASF37:
	.string	"_IO_save_end"
.LASF136:
	.string	"_sys_siglist"
.LASF146:
	.string	"pattern_count"
.LASF125:
	.string	"st_gid"
.LASF90:
	.string	"sockaddr_eon"
.LASF87:
	.string	"sockaddr_at"
.LASF20:
	.string	"__time_t"
.LASF83:
	.string	"sa_family_t"
.LASF54:
	.string	"_unused2"
.LASF61:
	.string	"stderr"
.LASF96:
	.string	"sockaddr_in6"
.LASF84:
	.string	"sockaddr"
.LASF91:
	.string	"sockaddr_in"
.LASF72:
	.string	"uint8_t"
.LASF36:
	.string	"_IO_backup_base"
.LASF132:
	.string	"st_mtim"
.LASF147:
	.string	"blocklist_t"
.LASF153:
	.string	"glob_match"
.LASF154:
	.string	"is_blocked"
.LASF86:
	.string	"sa_data"
.LASF50:
	.string	"_freeres_list"
.LASF156:
	.string	"hostname"
.LASF120:
	.string	"st_dev"
.LASF58:
	.string	"_IO_wide_data"
.LASF15:
	.string	"__ino64_t"
.LASF138:
	.string	"__tzname"
.LASF30:
	.string	"_IO_write_base"
.LASF111:
	.string	"in_port_t"
.LASF109:
	.string	"in_addr"
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
