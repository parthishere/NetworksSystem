	.file	"server_method.c"
	.text
.Ltext0:
	.file 0 "/home/parth/Work/All_data/university/Network System/Assignments/PA4/server" "src/server_method.c"
	.section	.rodata
.LC0:
	.string	"ls\n"
.LC1:
	.string	"get "
.LC2:
	.string	"put "
.LC3:
	.string	"exit\n"
.LC4:
	.string	"exit"
.LC5:
	.string	"delete "
	.align 8
.LC6:
	.string	"\033[31m[-] Wrong command try again \n\r\033[0m"
	.text
	.globl	whichcmd
	.type	whichcmd, @function
whichcmd:
.LFB320:
	.file 1 "src/server_method.c"
	.loc 1 26 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 27 9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	.loc 1 27 9 is_stmt 0 discriminator 1
	movq	-8(%rbp), %rax
	leaq	.LC0(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 27 8 is_stmt 1 discriminator 2
	testl	%eax, %eax
	jne	.L2
	.loc 1 29 16
	movl	$3, %eax
	jmp	.L3
.L2:
	.loc 1 31 14
	movq	-8(%rbp), %rax
	movl	$4, %edx
	leaq	.LC1(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 31 13 discriminator 1
	testl	%eax, %eax
	jne	.L4
	.loc 1 33 16
	movl	$0, %eax
	jmp	.L3
.L4:
	.loc 1 35 14
	movq	-8(%rbp), %rax
	movl	$4, %edx
	leaq	.LC2(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 35 13 discriminator 1
	testl	%eax, %eax
	jne	.L5
	.loc 1 37 16
	movl	$1, %eax
	jmp	.L3
.L5:
	.loc 1 39 14
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	.loc 1 39 14 is_stmt 0 discriminator 1
	movq	-8(%rbp), %rax
	leaq	.LC3(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 39 13 is_stmt 1 discriminator 2
	testl	%eax, %eax
	jne	.L6
	.loc 1 41 9
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 42 16
	movl	$4, %eax
	jmp	.L3
.L6:
	.loc 1 44 14
	movq	-8(%rbp), %rax
	movl	$7, %edx
	leaq	.LC5(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 44 13 discriminator 1
	testl	%eax, %eax
	jne	.L7
	.loc 1 46 16
	movl	$2, %eax
	jmp	.L3
.L7:
	.loc 1 50 9
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 51 16
	movl	$-1, %eax
.L3:
	.loc 1 53 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE320:
	.size	whichcmd, .-whichcmd
	.section	.rodata
.LC7:
	.string	"\n\nLS\n"
	.text
	.globl	list_files
	.type	list_files, @function
list_files:
.LFB321:
	.loc 1 72 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 74 5
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 141 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE321:
	.size	list_files, .-list_files
	.section	.rodata
.LC8:
	.string	"\n\nGET\n"
	.text
	.globl	get_file
	.type	get_file, @function
get_file:
.LFB322:
	.loc 1 159 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	.loc 1 161 5
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 253 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE322:
	.size	get_file, .-get_file
	.section	.rodata
.LC9:
	.string	"\n\nDELETE\n"
	.text
	.globl	delete_file
	.type	delete_file, @function
delete_file:
.LFB323:
	.loc 1 265 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	.loc 1 268 5
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 318 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE323:
	.size	delete_file, .-delete_file
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/14/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.file 7 "/usr/include/unistd.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/sockaddr.h"
	.file 9 "/usr/include/x86_64-linux-gnu/bits/socket.h"
	.file 10 "/usr/include/netdb.h"
	.file 11 "./common.h"
	.file 12 "/usr/include/stdio.h"
	.file 13 "/usr/include/string.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x499
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x10
	.long	.LASF73
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x4
	.long	.LASF10
	.byte	0x2
	.byte	0xd6
	.byte	0x17
	.long	0x3a
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x11
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x5
	.long	0x77
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF9
	.uleb128 0x12
	.long	0x77
	.uleb128 0x4
	.long	.LASF11
	.byte	0x3
	.byte	0xd2
	.byte	0x17
	.long	0x41
	.uleb128 0x5
	.long	0x7e
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF12
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF13
	.uleb128 0x7
	.long	.LASF17
	.byte	0x10
	.byte	0x4
	.byte	0x33
	.byte	0x10
	.long	0xca
	.uleb128 0x1
	.long	.LASF14
	.byte	0x4
	.byte	0x35
	.byte	0x23
	.long	0xca
	.byte	0
	.uleb128 0x1
	.long	.LASF15
	.byte	0x4
	.byte	0x36
	.byte	0x23
	.long	0xca
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.long	0xa2
	.uleb128 0x4
	.long	.LASF16
	.byte	0x4
	.byte	0x37
	.byte	0x3
	.long	0xa2
	.uleb128 0x7
	.long	.LASF18
	.byte	0x28
	.byte	0x5
	.byte	0x16
	.byte	0x8
	.long	0x151
	.uleb128 0x1
	.long	.LASF19
	.byte	0x5
	.byte	0x18
	.byte	0x7
	.long	0x64
	.byte	0
	.uleb128 0x1
	.long	.LASF20
	.byte	0x5
	.byte	0x19
	.byte	0x10
	.long	0x41
	.byte	0x4
	.uleb128 0x1
	.long	.LASF21
	.byte	0x5
	.byte	0x1a
	.byte	0x7
	.long	0x64
	.byte	0x8
	.uleb128 0x1
	.long	.LASF22
	.byte	0x5
	.byte	0x1c
	.byte	0x10
	.long	0x41
	.byte	0xc
	.uleb128 0x1
	.long	.LASF23
	.byte	0x5
	.byte	0x20
	.byte	0x7
	.long	0x64
	.byte	0x10
	.uleb128 0x1
	.long	.LASF24
	.byte	0x5
	.byte	0x22
	.byte	0x9
	.long	0x5d
	.byte	0x14
	.uleb128 0x1
	.long	.LASF25
	.byte	0x5
	.byte	0x23
	.byte	0x9
	.long	0x5d
	.byte	0x16
	.uleb128 0x1
	.long	.LASF26
	.byte	0x5
	.byte	0x24
	.byte	0x14
	.long	0xcf
	.byte	0x18
	.byte	0
	.uleb128 0x13
	.byte	0x28
	.byte	0x6
	.byte	0x43
	.byte	0x9
	.long	0x17c
	.uleb128 0x9
	.long	.LASF27
	.byte	0x45
	.byte	0x1c
	.long	0xdb
	.uleb128 0x9
	.long	.LASF28
	.byte	0x46
	.byte	0x8
	.long	0x17c
	.uleb128 0x9
	.long	.LASF29
	.byte	0x47
	.byte	0xc
	.long	0x6b
	.byte	0
	.uleb128 0xa
	.long	0x77
	.long	0x18c
	.uleb128 0xb
	.long	0x3a
	.byte	0x27
	.byte	0
	.uleb128 0x4
	.long	.LASF30
	.byte	0x6
	.byte	0x48
	.byte	0x3
	.long	0x151
	.uleb128 0x14
	.long	.LASF31
	.byte	0x7
	.value	0x112
	.byte	0x15
	.long	0x83
	.uleb128 0x4
	.long	.LASF32
	.byte	0x8
	.byte	0x1c
	.byte	0x1c
	.long	0x4f
	.uleb128 0x7
	.long	.LASF33
	.byte	0x10
	.byte	0x9
	.byte	0xb8
	.byte	0x27
	.long	0x1d9
	.uleb128 0x1
	.long	.LASF34
	.byte	0x9
	.byte	0xba
	.byte	0x5
	.long	0x1a5
	.byte	0
	.uleb128 0x1
	.long	.LASF35
	.byte	0x9
	.byte	0xbb
	.byte	0xa
	.long	0x1d9
	.byte	0x2
	.byte	0
	.uleb128 0xa
	.long	0x77
	.long	0x1e9
	.uleb128 0xb
	.long	0x3a
	.byte	0xd
	.byte	0
	.uleb128 0x7
	.long	.LASF36
	.byte	0x80
	.byte	0x9
	.byte	0xc5
	.byte	0x27
	.long	0x21e
	.uleb128 0x1
	.long	.LASF37
	.byte	0x9
	.byte	0xc7
	.byte	0x5
	.long	0x1a5
	.byte	0
	.uleb128 0x1
	.long	.LASF38
	.byte	0x9
	.byte	0xc8
	.byte	0xa
	.long	0x21e
	.byte	0x2
	.uleb128 0x1
	.long	.LASF39
	.byte	0x9
	.byte	0xc9
	.byte	0x14
	.long	0x3a
	.byte	0x78
	.byte	0
	.uleb128 0xa
	.long	0x77
	.long	0x22e
	.uleb128 0xb
	.long	0x3a
	.byte	0x75
	.byte	0
	.uleb128 0x5
	.long	0x1b1
	.uleb128 0x15
	.long	.LASF40
	.byte	0x30
	.byte	0xa
	.value	0x235
	.byte	0x8
	.long	0x2aa
	.uleb128 0x3
	.long	.LASF41
	.value	0x237
	.byte	0x7
	.long	0x64
	.byte	0
	.uleb128 0x3
	.long	.LASF42
	.value	0x238
	.byte	0x7
	.long	0x64
	.byte	0x4
	.uleb128 0x3
	.long	.LASF43
	.value	0x239
	.byte	0x7
	.long	0x64
	.byte	0x8
	.uleb128 0x3
	.long	.LASF44
	.value	0x23a
	.byte	0x7
	.long	0x64
	.byte	0xc
	.uleb128 0x3
	.long	.LASF45
	.value	0x23b
	.byte	0xd
	.long	0x198
	.byte	0x10
	.uleb128 0x3
	.long	.LASF46
	.value	0x23c
	.byte	0x14
	.long	0x22e
	.byte	0x18
	.uleb128 0x3
	.long	.LASF47
	.value	0x23d
	.byte	0x9
	.long	0x72
	.byte	0x20
	.uleb128 0x3
	.long	.LASF48
	.value	0x23e
	.byte	0x14
	.long	0x2aa
	.byte	0x28
	.byte	0
	.uleb128 0x5
	.long	0x233
	.uleb128 0x2
	.byte	0x10
	.byte	0x5
	.long	.LASF49
	.uleb128 0x2
	.byte	0x10
	.byte	0x7
	.long	.LASF50
	.uleb128 0x2
	.byte	0x10
	.byte	0x4
	.long	.LASF51
	.uleb128 0x16
	.byte	0x7
	.byte	0x4
	.long	0x41
	.byte	0xb
	.byte	0x75
	.byte	0x1
	.long	0x2fc
	.uleb128 0xc
	.string	"GET"
	.byte	0
	.uleb128 0xc
	.string	"PUT"
	.byte	0x1
	.uleb128 0x8
	.long	.LASF52
	.byte	0x2
	.uleb128 0xc
	.string	"LS"
	.byte	0x3
	.uleb128 0x8
	.long	.LASF53
	.byte	0x4
	.uleb128 0x8
	.long	.LASF54
	.byte	0x5
	.uleb128 0x8
	.long	.LASF55
	.byte	0x6
	.byte	0
	.uleb128 0x4
	.long	.LASF56
	.byte	0xb
	.byte	0x7e
	.byte	0x3
	.long	0x2c4
	.uleb128 0x17
	.byte	0xc8
	.byte	0xb
	.byte	0x87
	.byte	0x9
	.long	0x36d
	.uleb128 0x1
	.long	.LASF57
	.byte	0xb
	.byte	0x89
	.byte	0x9
	.long	0x64
	.byte	0
	.uleb128 0x1
	.long	.LASF58
	.byte	0xb
	.byte	0x8a
	.byte	0x9
	.long	0x64
	.byte	0x4
	.uleb128 0x1
	.long	.LASF59
	.byte	0xb
	.byte	0x8c
	.byte	0xb
	.long	0x72
	.byte	0x8
	.uleb128 0x1
	.long	.LASF60
	.byte	0xb
	.byte	0x8e
	.byte	0x1d
	.long	0x1e9
	.byte	0x10
	.uleb128 0x1
	.long	.LASF61
	.byte	0xb
	.byte	0x8f
	.byte	0x16
	.long	0x2aa
	.byte	0x90
	.uleb128 0x1
	.long	.LASF62
	.byte	0xb
	.byte	0x90
	.byte	0x9
	.long	0x64
	.byte	0x98
	.uleb128 0x1
	.long	.LASF63
	.byte	0xb
	.byte	0x91
	.byte	0x15
	.long	0x18c
	.byte	0xa0
	.byte	0
	.uleb128 0x4
	.long	.LASF64
	.byte	0xb
	.byte	0x92
	.byte	0x3
	.long	0x308
	.uleb128 0xe
	.long	.LASF65
	.byte	0xc
	.value	0x16b
	.byte	0xc
	.long	0x64
	.long	0x391
	.uleb128 0x6
	.long	0x8f
	.uleb128 0x18
	.byte	0
	.uleb128 0x19
	.long	.LASF66
	.byte	0xd
	.byte	0x9f
	.byte	0xc
	.long	0x64
	.long	0x3b1
	.uleb128 0x6
	.long	0x8f
	.uleb128 0x6
	.long	0x8f
	.uleb128 0x6
	.long	0x3a
	.byte	0
	.uleb128 0xe
	.long	.LASF67
	.byte	0xd
	.value	0x197
	.byte	0xf
	.long	0x2e
	.long	0x3c8
	.uleb128 0x6
	.long	0x8f
	.byte	0
	.uleb128 0x1a
	.long	.LASF69
	.byte	0x1
	.value	0x108
	.byte	0x6
	.quad	.LFB323
	.quad	.LFE323-.LFB323
	.uleb128 0x1
	.byte	0x9c
	.long	0x407
	.uleb128 0x1b
	.string	"sd"
	.byte	0x1
	.value	0x108
	.byte	0x21
	.long	0x407
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.long	.LASF68
	.byte	0x1
	.value	0x108
	.byte	0x2b
	.long	0x72
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x5
	.long	0x36d
	.uleb128 0xf
	.long	.LASF70
	.byte	0x9e
	.quad	.LFB322
	.quad	.LFE322-.LFB322
	.uleb128 0x1
	.byte	0x9c
	.long	0x445
	.uleb128 0xd
	.string	"sd"
	.byte	0x9e
	.byte	0x1e
	.long	0x407
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1d
	.long	.LASF68
	.byte	0x1
	.byte	0x9e
	.byte	0x28
	.long	0x72
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0xf
	.long	.LASF71
	.byte	0x47
	.quad	.LFB321
	.quad	.LFE321-.LFB321
	.uleb128 0x1
	.byte	0x9c
	.long	0x46f
	.uleb128 0xd
	.string	"sd"
	.byte	0x47
	.byte	0x20
	.long	0x407
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1e
	.long	.LASF72
	.byte	0x1
	.byte	0x19
	.byte	0xc
	.long	0x2fc
	.quad	.LFB320
	.quad	.LFE320-.LFB320
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xd
	.string	"cmd"
	.byte	0x19
	.byte	0x1b
	.long	0x72
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
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
	.uleb128 0x3
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 10
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
	.uleb128 0x4
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
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xf
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
	.sleb128 6
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x16
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
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x5
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
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
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
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.uleb128 0x1e
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
.LASF72:
	.string	"whichcmd"
.LASF11:
	.string	"__socklen_t"
.LASF27:
	.string	"__data"
.LASF37:
	.string	"ss_family"
.LASF45:
	.string	"ai_addrlen"
.LASF71:
	.string	"list_files"
.LASF10:
	.string	"size_t"
.LASF73:
	.string	"GNU C17 14.2.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF17:
	.string	"__pthread_internal_list"
.LASF68:
	.string	"recieve_buffer"
.LASF12:
	.string	"long long int"
.LASF30:
	.string	"pthread_mutex_t"
.LASF49:
	.string	"__int128"
.LASF20:
	.string	"__count"
.LASF66:
	.string	"strncmp"
.LASF53:
	.string	"EXIT"
.LASF29:
	.string	"__align"
.LASF57:
	.string	"sockfd"
.LASF52:
	.string	"DELETE"
.LASF61:
	.string	"server_info"
.LASF14:
	.string	"__prev"
.LASF32:
	.string	"sa_family_t"
.LASF7:
	.string	"short int"
.LASF15:
	.string	"__next"
.LASF59:
	.string	"dirname"
.LASF43:
	.string	"ai_socktype"
.LASF3:
	.string	"unsigned int"
.LASF23:
	.string	"__kind"
.LASF50:
	.string	"__int128 unsigned"
.LASF39:
	.string	"__ss_align"
.LASF8:
	.string	"long int"
.LASF65:
	.string	"printf"
.LASF54:
	.string	"SERVER_INFO"
.LASF42:
	.string	"ai_family"
.LASF51:
	.string	"long double"
.LASF4:
	.string	"unsigned char"
.LASF31:
	.string	"socklen_t"
.LASF6:
	.string	"signed char"
.LASF13:
	.string	"long long unsigned int"
.LASF38:
	.string	"__ss_padding"
.LASF40:
	.string	"addrinfo"
.LASF55:
	.string	"number_of_command"
.LASF48:
	.string	"ai_next"
.LASF62:
	.string	"addr_len"
.LASF35:
	.string	"sa_data"
.LASF28:
	.string	"__size"
.LASF5:
	.string	"short unsigned int"
.LASF9:
	.string	"char"
.LASF22:
	.string	"__nusers"
.LASF67:
	.string	"strlen"
.LASF63:
	.string	"lock"
.LASF36:
	.string	"sockaddr_storage"
.LASF69:
	.string	"delete_file"
.LASF18:
	.string	"__pthread_mutex_s"
.LASF2:
	.string	"long unsigned int"
.LASF25:
	.string	"__elision"
.LASF64:
	.string	"sockDetails_t"
.LASF47:
	.string	"ai_canonname"
.LASF16:
	.string	"__pthread_list_t"
.LASF41:
	.string	"ai_flags"
.LASF34:
	.string	"sa_family"
.LASF21:
	.string	"__owner"
.LASF60:
	.string	"client_info"
.LASF26:
	.string	"__list"
.LASF58:
	.string	"client_sock_fd"
.LASF70:
	.string	"get_file"
.LASF56:
	.string	"commands_t"
.LASF24:
	.string	"__spins"
.LASF46:
	.string	"ai_addr"
.LASF33:
	.string	"sockaddr"
.LASF19:
	.string	"__lock"
.LASF44:
	.string	"ai_protocol"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"src/server_method.c"
.LASF1:
	.string	"/home/parth/Work/All_data/university/Network System/Assignments/PA4/server"
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
