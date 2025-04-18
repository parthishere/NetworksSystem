	.file	"server_method.c"
	.text
.Ltext0:
	.file 0 "/home/parth/Work/All_data/university/Network System/Assignments/PA4/client" "src/server_method.c"
	.section	.rodata
.LC0:
	.string	"ls"
.LC1:
	.string	"list"
.LC2:
	.string	"get"
.LC3:
	.string	"put"
.LC4:
	.string	"exit"
.LC5:
	.string	"delete"
.LC6:
	.string	"serverinfo"
.LC7:
	.string	"help"
	.align 8
.LC8:
	.string	"\033[31m[-] Wrong command ! \n\r\033[0m"
	.text
	.globl	whichcmd
	.type	whichcmd, @function
whichcmd:
.LFB320:
	.file 1 "src/server_method.c"
	.loc 1 24 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	.loc 1 25 11
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	.loc 1 26 9
	movq	-8(%rbp), %rax
	movl	$2, %edx
	leaq	.LC0(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 26 8 discriminator 1
	testl	%eax, %eax
	je	.L2
	.loc 1 26 50 discriminator 1
	movq	-8(%rbp), %rax
	movl	$4, %edx
	leaq	.LC1(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 26 47 discriminator 1
	testl	%eax, %eax
	jne	.L3
.L2:
	.loc 1 28 16
	movl	$3, %eax
	jmp	.L4
.L3:
	.loc 1 30 14
	movq	-8(%rbp), %rax
	movl	$3, %edx
	leaq	.LC2(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 30 13 discriminator 1
	testl	%eax, %eax
	jne	.L5
	.loc 1 30 57 discriminator 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 30 54 discriminator 1
	cmpq	$3, %rax
	jne	.L5
	.loc 1 32 11
	cmpl	$3, -20(%rbp)
	jne	.L14
	.loc 1 33 19
	movq	-32(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 34 16
	movl	$0, %eax
	jmp	.L4
.L5:
	.loc 1 36 14
	movq	-8(%rbp), %rax
	movl	$3, %edx
	leaq	.LC3(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 36 13 discriminator 1
	testl	%eax, %eax
	jne	.L8
	.loc 1 36 57 discriminator 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 36 54 discriminator 1
	cmpq	$3, %rax
	jne	.L8
	.loc 1 38 11
	cmpl	$3, -20(%rbp)
	jne	.L15
	.loc 1 39 19
	movq	-32(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 40 16
	movl	$1, %eax
	jmp	.L4
.L8:
	.loc 1 42 14
	movq	-8(%rbp), %rax
	movl	$4, %edx
	leaq	.LC4(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 42 13 discriminator 1
	testl	%eax, %eax
	jne	.L10
	.loc 1 42 59 discriminator 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 42 56 discriminator 1
	cmpq	$4, %rax
	jne	.L10
	.loc 1 44 16
	movl	$4, %eax
	jmp	.L4
.L10:
	.loc 1 46 14
	movq	-8(%rbp), %rax
	movl	$6, %edx
	leaq	.LC5(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 46 13 discriminator 1
	testl	%eax, %eax
	jne	.L11
	.loc 1 46 63 discriminator 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 46 60 discriminator 1
	cmpq	$6, %rax
	jne	.L11
	.loc 1 48 11
	cmpl	$3, -20(%rbp)
	jne	.L16
	.loc 1 49 19
	movq	-32(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 50 16
	movl	$2, %eax
	jmp	.L4
.L11:
	.loc 1 52 14
	movq	-8(%rbp), %rax
	movl	$10, %edx
	leaq	.LC6(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 52 13 discriminator 1
	testl	%eax, %eax
	jne	.L13
	.loc 1 52 71 discriminator 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 52 68 discriminator 1
	cmpq	$10, %rax
	jne	.L13
	.loc 1 54 16
	movl	$5, %eax
	jmp	.L4
.L13:
	.loc 1 56 14
	movq	-8(%rbp), %rax
	movl	$4, %edx
	leaq	.LC7(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 56 13 discriminator 1
	testl	%eax, %eax
	jne	.L17
	.loc 1 56 59 discriminator 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 56 56 discriminator 1
	cmpq	$4, %rax
	jne	.L17
	.loc 1 58 16
	movl	$6, %eax
	jmp	.L4
.L14:
	.loc 1 32 23
	nop
	jmp	.L7
.L15:
	.loc 1 38 23
	nop
	jmp	.L7
.L16:
	.loc 1 48 23
	nop
	jmp	.L7
.L17:
	.loc 1 63 1
	nop
.L7:
	.loc 1 64 5
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 65 12
	movl	$-1, %eax
.L4:
	.loc 1 66 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE320:
	.size	whichcmd, .-whichcmd
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/14/include/stddef.h"
	.file 3 "./common.h"
	.file 4 "/usr/include/stdio.h"
	.file 5 "/usr/include/string.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1ab
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x9
	.long	.LASF28
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x7
	.long	.LASF20
	.byte	0x2
	.byte	0xd6
	.byte	0x17
	.long	0x3a
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0xa
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x4
	.long	0x77
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF9
	.uleb128 0xb
	.long	0x77
	.uleb128 0x4
	.long	0x7e
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.long	.LASF10
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.long	.LASF11
	.uleb128 0x4
	.long	0x72
	.uleb128 0x1
	.byte	0x10
	.byte	0x5
	.long	.LASF12
	.uleb128 0x1
	.byte	0x10
	.byte	0x7
	.long	.LASF13
	.uleb128 0x1
	.byte	0x10
	.byte	0x4
	.long	.LASF14
	.uleb128 0xc
	.byte	0x7
	.byte	0x4
	.long	0x41
	.byte	0x3
	.byte	0x78
	.byte	0x1
	.long	0xee
	.uleb128 0x5
	.string	"GET"
	.byte	0
	.uleb128 0x5
	.string	"PUT"
	.byte	0x1
	.uleb128 0x2
	.long	.LASF15
	.byte	0x2
	.uleb128 0x5
	.string	"LS"
	.byte	0x3
	.uleb128 0x2
	.long	.LASF16
	.byte	0x4
	.uleb128 0x2
	.long	.LASF17
	.byte	0x5
	.uleb128 0x2
	.long	.LASF18
	.byte	0x6
	.uleb128 0x2
	.long	.LASF19
	.byte	0x7
	.byte	0
	.uleb128 0x7
	.long	.LASF21
	.byte	0x3
	.byte	0x81
	.byte	0x3
	.long	0xb0
	.uleb128 0x8
	.long	.LASF22
	.byte	0x4
	.value	0x16b
	.byte	0xc
	.long	0x64
	.long	0x112
	.uleb128 0x3
	.long	0x83
	.uleb128 0xd
	.byte	0
	.uleb128 0x8
	.long	.LASF23
	.byte	0x5
	.value	0x197
	.byte	0xf
	.long	0x2e
	.long	0x129
	.uleb128 0x3
	.long	0x83
	.byte	0
	.uleb128 0xe
	.long	.LASF24
	.byte	0x5
	.byte	0x9f
	.byte	0xc
	.long	0x64
	.long	0x149
	.uleb128 0x3
	.long	0x83
	.uleb128 0x3
	.long	0x83
	.uleb128 0x3
	.long	0x3a
	.byte	0
	.uleb128 0xf
	.long	.LASF29
	.byte	0x1
	.byte	0x17
	.byte	0xc
	.long	0xee
	.quad	.LFB320
	.quad	.LFE320-.LFB320
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.long	.LASF25
	.byte	0x19
	.long	0x64
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x6
	.long	.LASF26
	.byte	0x25
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x6
	.long	.LASF27
	.byte	0x34
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x10
	.string	"cmd"
	.byte	0x1
	.byte	0x19
	.byte	0xb
	.long	0x72
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.long	.LASF30
	.byte	0x1
	.byte	0x3f
	.byte	0x1
	.quad	.L7
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
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
	.uleb128 0x2
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 23
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xd
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
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
	.string	"HELP"
.LASF13:
	.string	"__int128 unsigned"
.LASF20:
	.string	"size_t"
.LASF3:
	.string	"unsigned int"
.LASF29:
	.string	"whichcmd"
.LASF23:
	.string	"strlen"
.LASF11:
	.string	"long long unsigned int"
.LASF4:
	.string	"unsigned char"
.LASF19:
	.string	"number_of_command"
.LASF21:
	.string	"commands_t"
.LASF2:
	.string	"long unsigned int"
.LASF5:
	.string	"short unsigned int"
.LASF12:
	.string	"__int128"
.LASF15:
	.string	"DELETE"
.LASF27:
	.string	"filename"
.LASF9:
	.string	"char"
.LASF25:
	.string	"argc"
.LASF30:
	.string	"error"
.LASF10:
	.string	"long long int"
.LASF24:
	.string	"strncmp"
.LASF22:
	.string	"printf"
.LASF16:
	.string	"EXIT"
.LASF7:
	.string	"short int"
.LASF26:
	.string	"argv"
.LASF8:
	.string	"long int"
.LASF28:
	.string	"GNU C17 14.2.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF14:
	.string	"long double"
.LASF6:
	.string	"signed char"
.LASF17:
	.string	"SERVER_INFO"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"src/server_method.c"
.LASF1:
	.string	"/home/parth/Work/All_data/university/Network System/Assignments/PA4/client"
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
