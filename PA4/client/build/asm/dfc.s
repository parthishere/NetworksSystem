	.file	"dfc.c"
	.text
.Ltext0:
	.file 0 "/home/parth/Work/All_data/university/Network System/Assignments/PA4/client" "dfc.c"
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"./dfc.conf"
.LC2:
	.string	" "
.LC3:
	.string	"dfs%d"
.LC4:
	.string	":"
.LC5:
	.string	"\n"
	.align 8
.LC6:
	.string	"\033[31m[-] ERROR: No servers found in configuration file\n\033[0m"
	.align 8
.LC7:
	.string	"\033[32m[+] SERVER CONFIGURATION: %d server(s) found in config file\n\033[0m"
	.text
	.globl	read_server_conf
	.type	read_server_conf, @function
read_server_conf:
.LFB320:
	.file 1 "dfc.c"
	.loc 1 18 41
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1120, %rsp
	movq	%rdi, -1112(%rbp)
	.loc 1 18 41
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 19 16
	leaq	.LC0(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -1072(%rbp)
	.loc 1 22 9
	movl	$0, -1092(%rbp)
	.loc 1 25 22
	movq	$0, -1064(%rbp)
	.loc 1 26 22
	movq	$0, -1080(%rbp)
	.loc 1 27 10
	jmp	.L2
.L8:
.LBB2:
	.loc 1 30 19
	movl	$40, %edi
	call	malloc@PLT
	movq	%rax, -1064(%rbp)
	.loc 1 31 14
	movq	-1112(%rbp), %rax
	movq	32(%rax), %rax
	.loc 1 31 11
	testq	%rax, %rax
	jne	.L3
	.loc 1 32 33
	movq	-1112(%rbp), %rax
	movq	-1064(%rbp), %rdx
	movq	%rdx, 32(%rax)
	jmp	.L4
.L3:
	.loc 1 35 24
	movq	-1080(%rbp), %rax
	movq	-1064(%rbp), %rdx
	movq	%rdx, 32(%rax)
.L4:
	.loc 1 38 26
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, -1056(%rbp)
	.loc 1 39 21
	leaq	-1088(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	leaq	.LC2(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strtok_r@PLT
	movq	%rax, -1048(%rbp)
	.loc 1 41 15
	leaq	-1088(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok_r@PLT
	movq	%rax, -1048(%rbp)
	.loc 1 42 9
	leaq	-1096(%rbp), %rdx
	movq	-1048(%rbp), %rax
	leaq	.LC3(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc23_sscanf@PLT
	.loc 1 43 15
	leaq	-1088(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC4(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok_r@PLT
	movq	%rax, -1048(%rbp)
	.loc 1 45 30
	movq	-1048(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	.loc 1 45 30 is_stmt 0 discriminator 1
	movq	-1048(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strndup@PLT
	movq	%rax, %rdx
	.loc 1 45 28 is_stmt 1 discriminator 2
	movq	-1064(%rbp), %rax
	movq	%rdx, 16(%rax)
	.loc 1 46 19
	movq	-1064(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 46 11
	testq	%rax, %rax
	jne	.L5
	.loc 1 46 40 discriminator 1
	movl	$1, %edi
	call	exit@PLT
.L5:
	.loc 1 48 15
	leaq	-1088(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC5(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok_r@PLT
	movq	%rax, -1048(%rbp)
	.loc 1 49 32
	movq	-1048(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	.loc 1 49 32 is_stmt 0 discriminator 1
	movq	-1048(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strndup@PLT
	movq	%rax, %rdx
	.loc 1 49 30 is_stmt 1 discriminator 2
	movq	-1064(%rbp), %rax
	movq	%rdx, 8(%rax)
	.loc 1 50 19
	movq	-1064(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 50 11
	testq	%rax, %rax
	jne	.L6
	.loc 1 50 42 discriminator 1
	movl	$1, %edi
	call	exit@PLT
.L6:
	.loc 1 52 24
	movl	-1096(%rbp), %edx
	movq	-1064(%rbp), %rax
	movl	%edx, 24(%rax)
	.loc 1 53 11
	movq	-1112(%rbp), %rax
	movl	64(%rax), %eax
	.loc 1 53 30
	leal	1(%rax), %edx
	movq	-1112(%rbp), %rax
	movl	%edx, 64(%rax)
	.loc 1 55 14
	movq	-1064(%rbp), %rax
	movq	%rax, -1080(%rbp)
	.loc 1 57 9
	movq	-1056(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 58 10
	addl	$1, -1092(%rbp)
.L2:
.LBE2:
	.loc 1 27 11
	movq	-1072(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	movl	$1023, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	.loc 1 27 51 discriminator 1
	testq	%rax, %rax
	je	.L7
	.loc 1 27 56 discriminator 1
	movq	-1112(%rbp), %rax
	movl	64(%rax), %eax
	.loc 1 27 51 discriminator 1
	cmpl	$3, %eax
	jle	.L8
.L7:
	.loc 1 60 10
	movq	-1112(%rbp), %rax
	movl	64(%rax), %eax
	.loc 1 60 7
	testl	%eax, %eax
	jg	.L9
	.loc 1 61 9
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 62 9
	movl	$1, %edi
	call	exit@PLT
.L9:
	.loc 1 65 5
	movq	-1112(%rbp), %rax
	movl	64(%rax), %eax
	movl	%eax, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 66 5
	movq	-1072(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	.loc 1 67 1
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE320:
	.size	read_server_conf, .-read_server_conf
	.section	.rodata
.LC8:
	.string	"./download"
	.align 8
.LC9:
	.string	"\033[32m[+] Directory '%s' created successfully.\n\033[0m"
	.align 8
.LC10:
	.string	"\033[32m[+] Directory '%s' already exists.\n\033[0m"
	.align 8
.LC11:
	.string	"\033[31m[-] Error creating directory"
	.align 8
.LC12:
	.string	"\033[31m[-] ERROR: Invalid command usage\n\033[0m"
	.align 8
.LC13:
	.string	"\033[31m    Usage: ./dfc <COMMAND> [FILENAME]\n\033[0m"
	.text
	.globl	main
	.type	main, @function
main:
.LFB321:
	.loc 1 88 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160, %rsp
	movl	%edi, -148(%rbp)
	movq	%rsi, -160(%rbp)
	.loc 1 88 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 90 24
	movq	$0, -96(%rbp)
	.loc 1 94 22
	movl	$511, %esi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	mkdir@PLT
	movl	%eax, -136(%rbp)
	.loc 1 95 12
	cmpl	$0, -136(%rbp)
	jne	.L12
	.loc 1 96 13
	leaq	.LC8(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L13
.L12:
	.loc 1 97 20
	call	__errno_location@PLT
	.loc 1 97 20 is_stmt 0 discriminator 1
	movl	(%rax), %eax
	.loc 1 97 19 is_stmt 1 discriminator 1
	cmpl	$17, %eax
	jne	.L14
	.loc 1 98 13
	leaq	.LC8(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L13
.L14:
	.loc 1 100 13
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	.loc 1 101 13
	movl	$1, %edi
	call	exit@PLT
.L13:
	.loc 1 106 5
	leaq	-128(%rbp), %rax
	addq	$72, %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_mutex_init@PLT
	.loc 1 109 8
	cmpl	$1, -148(%rbp)
	jg	.L15
	.loc 1 111 9
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 112 9
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 113 9
	movl	$0, %eax
	call	print_menu@PLT
	.loc 1 115 9
	movl	$1, %edi
	call	exit@PLT
.L15:
	.loc 1 118 5
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	read_server_conf
	.loc 1 120 9
	movl	-148(%rbp), %eax
	subl	$2, %eax
	movl	%eax, -132(%rbp)
	.loc 1 121 9
	movl	$2, -144(%rbp)
	.loc 1 122 22
	movq	-160(%rbp), %rdx
	movl	-148(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	whichcmd@PLT
	.loc 1 122 20 discriminator 1
	movl	%eax, -104(%rbp)
	.loc 1 123 10
	movl	-104(%rbp), %eax
	.loc 1 123 7
	cmpl	$2, %eax
	jbe	.L16
	.loc 1 123 29 discriminator 1
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	handle_req@PLT
	jmp	.L17
.L16:
.LBB3:
	.loc 1 125 17
	movl	$0, -140(%rbp)
	.loc 1 125 9
	jmp	.L18
.L19:
	.loc 1 126 31
	movl	-144(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 126 25
	movq	%rax, -112(%rbp)
	.loc 1 127 13
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	handle_req@PLT
	.loc 1 128 27
	addl	$1, -144(%rbp)
	.loc 1 125 46 discriminator 3
	addl	$1, -140(%rbp)
.L18:
	.loc 1 125 26 discriminator 1
	movl	-140(%rbp), %eax
	cmpl	-132(%rbp), %eax
	jl	.L19
.L17:
.LBE3:
	.loc 1 132 5
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	cleanup_connection@PLT
	.loc 1 134 12
	movl	$0, %eax
	.loc 1 135 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L21
	call	__stack_chk_fail@PLT
.L21:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE321:
	.size	main, .-main
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/14/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.file 9 "/usr/include/unistd.h"
	.file 10 "/usr/include/x86_64-linux-gnu/bits/sockaddr.h"
	.file 11 "/usr/include/x86_64-linux-gnu/bits/socket.h"
	.file 12 "/usr/include/netdb.h"
	.file 13 "common.h"
	.file 14 "includes/handle_req.h"
	.file 15 "includes/server_method.h"
	.file 16 "/usr/include/pthread.h"
	.file 17 "/usr/include/stdio.h"
	.file 18 "/usr/include/x86_64-linux-gnu/sys/stat.h"
	.file 19 "/usr/include/stdlib.h"
	.file 20 "/usr/include/string.h"
	.file 21 "/usr/include/errno.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x994
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x19
	.long	.LASF137
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x4
	.long	.LASF9
	.byte	0x2
	.byte	0xd6
	.byte	0x17
	.long	0x3a
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x1a
	.byte	0x8
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x5
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x5
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x1b
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x4
	.long	.LASF10
	.byte	0x3
	.byte	0x96
	.byte	0x1a
	.long	0x41
	.uleb128 0x4
	.long	.LASF11
	.byte	0x3
	.byte	0x98
	.byte	0x19
	.long	0x6d
	.uleb128 0x4
	.long	.LASF12
	.byte	0x3
	.byte	0x99
	.byte	0x1b
	.long	0x6d
	.uleb128 0x3
	.long	0xa2
	.uleb128 0x10
	.long	0x98
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.long	.LASF13
	.uleb128 0x14
	.long	0xa2
	.uleb128 0x4
	.long	.LASF14
	.byte	0x3
	.byte	0xd2
	.byte	0x17
	.long	0x41
	.uleb128 0x9
	.long	0xa2
	.long	0xca
	.uleb128 0xa
	.long	0x3a
	.byte	0x3
	.byte	0
	.uleb128 0xb
	.long	.LASF50
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x251
	.uleb128 0x1
	.long	.LASF15
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x66
	.byte	0
	.uleb128 0x1
	.long	.LASF16
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0x98
	.byte	0x8
	.uleb128 0x1
	.long	.LASF17
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0x98
	.byte	0x10
	.uleb128 0x1
	.long	.LASF18
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0x98
	.byte	0x18
	.uleb128 0x1
	.long	.LASF19
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0x98
	.byte	0x20
	.uleb128 0x1
	.long	.LASF20
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0x98
	.byte	0x28
	.uleb128 0x1
	.long	.LASF21
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0x98
	.byte	0x30
	.uleb128 0x1
	.long	.LASF22
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0x98
	.byte	0x38
	.uleb128 0x1
	.long	.LASF23
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0x98
	.byte	0x40
	.uleb128 0x1
	.long	.LASF24
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0x98
	.byte	0x48
	.uleb128 0x1
	.long	.LASF25
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0x98
	.byte	0x50
	.uleb128 0x1
	.long	.LASF26
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0x98
	.byte	0x58
	.uleb128 0x1
	.long	.LASF27
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x26a
	.byte	0x60
	.uleb128 0x1
	.long	.LASF28
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x26f
	.byte	0x68
	.uleb128 0x1
	.long	.LASF29
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x66
	.byte	0x70
	.uleb128 0x1
	.long	.LASF30
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x66
	.byte	0x74
	.uleb128 0x1
	.long	.LASF31
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0x80
	.byte	0x78
	.uleb128 0x1
	.long	.LASF32
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x51
	.byte	0x80
	.uleb128 0x1
	.long	.LASF33
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x58
	.byte	0x82
	.uleb128 0x1
	.long	.LASF34
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x274
	.byte	0x83
	.uleb128 0x1
	.long	.LASF35
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x284
	.byte	0x88
	.uleb128 0x1
	.long	.LASF36
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0x8c
	.byte	0x90
	.uleb128 0x1
	.long	.LASF37
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x28e
	.byte	0x98
	.uleb128 0x1
	.long	.LASF38
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x298
	.byte	0xa0
	.uleb128 0x1
	.long	.LASF39
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x26f
	.byte	0xa8
	.uleb128 0x1
	.long	.LASF40
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0x48
	.byte	0xb0
	.uleb128 0x1
	.long	.LASF41
	.byte	0x4
	.byte	0x5f
	.byte	0x15
	.long	0x29d
	.byte	0xb8
	.uleb128 0x1
	.long	.LASF42
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x66
	.byte	0xc0
	.uleb128 0x1
	.long	.LASF43
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x2a2
	.byte	0xc4
	.byte	0
	.uleb128 0x4
	.long	.LASF44
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0xca
	.uleb128 0x1c
	.long	.LASF138
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0x11
	.long	.LASF45
	.uleb128 0x3
	.long	0x265
	.uleb128 0x3
	.long	0xca
	.uleb128 0x9
	.long	0xa2
	.long	0x284
	.uleb128 0xa
	.long	0x3a
	.byte	0
	.byte	0
	.uleb128 0x3
	.long	0x25d
	.uleb128 0x11
	.long	.LASF46
	.uleb128 0x3
	.long	0x289
	.uleb128 0x11
	.long	.LASF47
	.uleb128 0x3
	.long	0x293
	.uleb128 0x3
	.long	0x26f
	.uleb128 0x9
	.long	0xa2
	.long	0x2b2
	.uleb128 0xa
	.long	0x3a
	.byte	0x13
	.byte	0
	.uleb128 0x3
	.long	0xa9
	.uleb128 0x10
	.long	0x2b2
	.uleb128 0x3
	.long	0x251
	.uleb128 0x10
	.long	0x2bc
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.long	.LASF48
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.long	.LASF49
	.uleb128 0xb
	.long	.LASF51
	.byte	0x10
	.byte	0x6
	.byte	0x33
	.byte	0x10
	.long	0x2fc
	.uleb128 0x1
	.long	.LASF52
	.byte	0x6
	.byte	0x35
	.byte	0x23
	.long	0x2fc
	.byte	0
	.uleb128 0x1
	.long	.LASF53
	.byte	0x6
	.byte	0x36
	.byte	0x23
	.long	0x2fc
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	0x2d4
	.uleb128 0x4
	.long	.LASF54
	.byte	0x6
	.byte	0x37
	.byte	0x3
	.long	0x2d4
	.uleb128 0xb
	.long	.LASF55
	.byte	0x28
	.byte	0x7
	.byte	0x16
	.byte	0x8
	.long	0x383
	.uleb128 0x1
	.long	.LASF56
	.byte	0x7
	.byte	0x18
	.byte	0x7
	.long	0x66
	.byte	0
	.uleb128 0x1
	.long	.LASF57
	.byte	0x7
	.byte	0x19
	.byte	0x10
	.long	0x41
	.byte	0x4
	.uleb128 0x1
	.long	.LASF58
	.byte	0x7
	.byte	0x1a
	.byte	0x7
	.long	0x66
	.byte	0x8
	.uleb128 0x1
	.long	.LASF59
	.byte	0x7
	.byte	0x1c
	.byte	0x10
	.long	0x41
	.byte	0xc
	.uleb128 0x1
	.long	.LASF60
	.byte	0x7
	.byte	0x20
	.byte	0x7
	.long	0x66
	.byte	0x10
	.uleb128 0x1
	.long	.LASF61
	.byte	0x7
	.byte	0x22
	.byte	0x9
	.long	0x5f
	.byte	0x14
	.uleb128 0x1
	.long	.LASF62
	.byte	0x7
	.byte	0x23
	.byte	0x9
	.long	0x5f
	.byte	0x16
	.uleb128 0x1
	.long	.LASF63
	.byte	0x7
	.byte	0x24
	.byte	0x14
	.long	0x301
	.byte	0x18
	.byte	0
	.uleb128 0x15
	.byte	0x4
	.byte	0x20
	.long	0x3a1
	.uleb128 0xc
	.long	.LASF64
	.byte	0x22
	.byte	0x8
	.long	0xba
	.uleb128 0xc
	.long	.LASF65
	.byte	0x23
	.byte	0x7
	.long	0x66
	.byte	0
	.uleb128 0x4
	.long	.LASF66
	.byte	0x8
	.byte	0x24
	.byte	0x3
	.long	0x383
	.uleb128 0x14
	.long	0x3a1
	.uleb128 0x15
	.byte	0x28
	.byte	0x43
	.long	0x3db
	.uleb128 0xc
	.long	.LASF67
	.byte	0x45
	.byte	0x1c
	.long	0x30d
	.uleb128 0xc
	.long	.LASF64
	.byte	0x46
	.byte	0x8
	.long	0x3db
	.uleb128 0xc
	.long	.LASF65
	.byte	0x47
	.byte	0xc
	.long	0x6d
	.byte	0
	.uleb128 0x9
	.long	0xa2
	.long	0x3eb
	.uleb128 0xa
	.long	0x3a
	.byte	0x27
	.byte	0
	.uleb128 0x4
	.long	.LASF68
	.byte	0x8
	.byte	0x48
	.byte	0x3
	.long	0x3b2
	.uleb128 0x1d
	.long	.LASF69
	.byte	0x9
	.value	0x112
	.byte	0x15
	.long	0xae
	.uleb128 0x3
	.long	0x98
	.uleb128 0x10
	.long	0x404
	.uleb128 0x4
	.long	.LASF70
	.byte	0xa
	.byte	0x1c
	.byte	0x1c
	.long	0x51
	.uleb128 0xb
	.long	.LASF71
	.byte	0x10
	.byte	0xb
	.byte	0xb8
	.byte	0x27
	.long	0x442
	.uleb128 0x1
	.long	.LASF72
	.byte	0xb
	.byte	0xba
	.byte	0x5
	.long	0x40e
	.byte	0
	.uleb128 0x1
	.long	.LASF73
	.byte	0xb
	.byte	0xbb
	.byte	0xa
	.long	0x442
	.byte	0x2
	.byte	0
	.uleb128 0x9
	.long	0xa2
	.long	0x452
	.uleb128 0xa
	.long	0x3a
	.byte	0xd
	.byte	0
	.uleb128 0x3
	.long	0x41a
	.uleb128 0x1e
	.long	.LASF74
	.byte	0x30
	.byte	0xc
	.value	0x235
	.byte	0x8
	.long	0x4ce
	.uleb128 0x7
	.long	.LASF75
	.value	0x237
	.byte	0x7
	.long	0x66
	.byte	0
	.uleb128 0x7
	.long	.LASF76
	.value	0x238
	.byte	0x7
	.long	0x66
	.byte	0x4
	.uleb128 0x7
	.long	.LASF77
	.value	0x239
	.byte	0x7
	.long	0x66
	.byte	0x8
	.uleb128 0x7
	.long	.LASF78
	.value	0x23a
	.byte	0x7
	.long	0x66
	.byte	0xc
	.uleb128 0x7
	.long	.LASF79
	.value	0x23b
	.byte	0xd
	.long	0x3f7
	.byte	0x10
	.uleb128 0x7
	.long	.LASF80
	.value	0x23c
	.byte	0x14
	.long	0x452
	.byte	0x18
	.uleb128 0x7
	.long	.LASF81
	.value	0x23d
	.byte	0x9
	.long	0x98
	.byte	0x20
	.uleb128 0x7
	.long	.LASF82
	.value	0x23e
	.byte	0x14
	.long	0x4ce
	.byte	0x28
	.byte	0
	.uleb128 0x3
	.long	0x457
	.uleb128 0x5
	.byte	0x10
	.byte	0x5
	.long	.LASF83
	.uleb128 0x5
	.byte	0x10
	.byte	0x7
	.long	.LASF84
	.uleb128 0x5
	.byte	0x10
	.byte	0x4
	.long	.LASF85
	.uleb128 0x3
	.long	0x66
	.uleb128 0x1f
	.byte	0x7
	.byte	0x4
	.long	0x41
	.byte	0xd
	.byte	0x72
	.byte	0x1
	.long	0x52b
	.uleb128 0x12
	.string	"GET"
	.byte	0
	.uleb128 0x12
	.string	"PUT"
	.byte	0x1
	.uleb128 0xd
	.long	.LASF86
	.byte	0x2
	.uleb128 0x12
	.string	"LS"
	.byte	0x3
	.uleb128 0xd
	.long	.LASF87
	.byte	0x4
	.uleb128 0xd
	.long	.LASF88
	.byte	0x5
	.uleb128 0xd
	.long	.LASF89
	.byte	0x6
	.uleb128 0xd
	.long	.LASF90
	.byte	0x7
	.byte	0
	.uleb128 0x4
	.long	.LASF91
	.byte	0xd
	.byte	0x7b
	.byte	0x3
	.long	0x4ed
	.uleb128 0xb
	.long	.LASF92
	.byte	0x28
	.byte	0xd
	.byte	0x80
	.byte	0x10
	.long	0x586
	.uleb128 0x1
	.long	.LASF93
	.byte	0xd
	.byte	0x81
	.byte	0x9
	.long	0x66
	.byte	0
	.uleb128 0x1
	.long	.LASF94
	.byte	0xd
	.byte	0x82
	.byte	0xb
	.long	0x98
	.byte	0x8
	.uleb128 0x1
	.long	.LASF95
	.byte	0xd
	.byte	0x83
	.byte	0xb
	.long	0x98
	.byte	0x10
	.uleb128 0x1
	.long	.LASF96
	.byte	0xd
	.byte	0x84
	.byte	0x9
	.long	0x66
	.byte	0x18
	.uleb128 0x1
	.long	.LASF97
	.byte	0xd
	.byte	0x85
	.byte	0x1d
	.long	0x586
	.byte	0x20
	.byte	0
	.uleb128 0x3
	.long	0x537
	.uleb128 0x4
	.long	.LASF92
	.byte	0xd
	.byte	0x86
	.byte	0x2
	.long	0x537
	.uleb128 0x20
	.byte	0x70
	.byte	0xd
	.byte	0x8f
	.byte	0x9
	.long	0x623
	.uleb128 0x1
	.long	.LASF98
	.byte	0xd
	.byte	0x91
	.byte	0x9
	.long	0x66
	.byte	0
	.uleb128 0x1
	.long	.LASF99
	.byte	0xd
	.byte	0x92
	.byte	0xb
	.long	0x98
	.byte	0x8
	.uleb128 0x1
	.long	.LASF100
	.byte	0xd
	.byte	0x93
	.byte	0xb
	.long	0x98
	.byte	0x10
	.uleb128 0x1
	.long	.LASF101
	.byte	0xd
	.byte	0x94
	.byte	0x10
	.long	0x52b
	.byte	0x18
	.uleb128 0x1
	.long	.LASF102
	.byte	0xd
	.byte	0x95
	.byte	0x16
	.long	0x623
	.byte	0x20
	.uleb128 0x1
	.long	.LASF103
	.byte	0xd
	.byte	0x96
	.byte	0x16
	.long	0x4ce
	.byte	0x28
	.uleb128 0x1
	.long	.LASF104
	.byte	0xd
	.byte	0x97
	.byte	0x9
	.long	0x628
	.byte	0x30
	.uleb128 0x1
	.long	.LASF105
	.byte	0xd
	.byte	0x98
	.byte	0x9
	.long	0x66
	.byte	0x40
	.uleb128 0x1
	.long	.LASF106
	.byte	0xd
	.byte	0x99
	.byte	0x9
	.long	0x66
	.byte	0x44
	.uleb128 0x1
	.long	.LASF107
	.byte	0xd
	.byte	0x9b
	.byte	0x15
	.long	0x3eb
	.byte	0x48
	.byte	0
	.uleb128 0x3
	.long	0x58b
	.uleb128 0x9
	.long	0x66
	.long	0x638
	.uleb128 0xa
	.long	0x3a
	.byte	0x3
	.byte	0
	.uleb128 0x4
	.long	.LASF108
	.byte	0xd
	.byte	0x9c
	.byte	0x3
	.long	0x597
	.uleb128 0x21
	.long	.LASF112
	.byte	0xe
	.byte	0x29
	.byte	0x6
	.long	0x656
	.uleb128 0x2
	.long	0x656
	.byte	0
	.uleb128 0x3
	.long	0x638
	.uleb128 0xe
	.long	.LASF109
	.byte	0xe
	.byte	0x27
	.byte	0x7
	.long	0x48
	.long	0x671
	.uleb128 0x2
	.long	0x656
	.byte	0
	.uleb128 0xe
	.long	.LASF110
	.byte	0xf
	.byte	0x5
	.byte	0xc
	.long	0x52b
	.long	0x68c
	.uleb128 0x2
	.long	0x66
	.uleb128 0x2
	.long	0x404
	.byte	0
	.uleb128 0x22
	.long	.LASF139
	.byte	0x1
	.byte	0xd
	.byte	0x6
	.long	0x69a
	.uleb128 0x13
	.byte	0
	.uleb128 0x8
	.long	.LASF111
	.byte	0x10
	.value	0x30d
	.byte	0xc
	.long	0x66
	.long	0x6b6
	.uleb128 0x2
	.long	0x6b6
	.uleb128 0x2
	.long	0x6bb
	.byte	0
	.uleb128 0x3
	.long	0x3eb
	.uleb128 0x3
	.long	0x3ad
	.uleb128 0x16
	.long	.LASF113
	.byte	0x11
	.value	0x364
	.long	0x6d2
	.uleb128 0x2
	.long	0x2b2
	.byte	0
	.uleb128 0x23
	.long	.LASF140
	.byte	0x15
	.byte	0x25
	.byte	0xd
	.long	0x4e8
	.uleb128 0x8
	.long	.LASF114
	.byte	0x12
	.value	0x185
	.byte	0xc
	.long	0x66
	.long	0x6fa
	.uleb128 0x2
	.long	0x2b2
	.uleb128 0x2
	.long	0x74
	.byte	0
	.uleb128 0xe
	.long	.LASF115
	.byte	0x11
	.byte	0xb8
	.byte	0xc
	.long	0x66
	.long	0x710
	.uleb128 0x2
	.long	0x2bc
	.byte	0
	.uleb128 0x8
	.long	.LASF116
	.byte	0x11
	.value	0x16b
	.byte	0xc
	.long	0x66
	.long	0x728
	.uleb128 0x2
	.long	0x2b2
	.uleb128 0x13
	.byte	0
	.uleb128 0x8
	.long	.LASF117
	.byte	0x11
	.value	0x28e
	.byte	0xe
	.long	0x98
	.long	0x749
	.uleb128 0x2
	.long	0x9d
	.uleb128 0x2
	.long	0x66
	.uleb128 0x2
	.long	0x2c1
	.byte	0
	.uleb128 0x16
	.long	.LASF118
	.byte	0x13
	.value	0x2af
	.long	0x75b
	.uleb128 0x2
	.long	0x48
	.byte	0
	.uleb128 0x24
	.long	.LASF119
	.byte	0x13
	.value	0x2f4
	.byte	0xd
	.long	0x76e
	.uleb128 0x2
	.long	0x66
	.byte	0
	.uleb128 0xe
	.long	.LASF120
	.byte	0x14
	.byte	0xc3
	.byte	0xe
	.long	0x98
	.long	0x789
	.uleb128 0x2
	.long	0x2b2
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0x8
	.long	.LASF121
	.byte	0x14
	.value	0x197
	.byte	0xf
	.long	0x2e
	.long	0x7a0
	.uleb128 0x2
	.long	0x2b2
	.byte	0
	.uleb128 0x25
	.long	.LASF141
	.byte	0x11
	.value	0x1bf
	.byte	0xc
	.long	.LASF142
	.long	0x66
	.long	0x7c1
	.uleb128 0x2
	.long	0x2b2
	.uleb128 0x2
	.long	0x2b2
	.uleb128 0x13
	.byte	0
	.uleb128 0x8
	.long	.LASF122
	.byte	0x14
	.value	0x16e
	.byte	0xe
	.long	0x98
	.long	0x7e2
	.uleb128 0x2
	.long	0x9d
	.uleb128 0x2
	.long	0x2b7
	.uleb128 0x2
	.long	0x409
	.byte	0
	.uleb128 0xe
	.long	.LASF123
	.byte	0x14
	.byte	0xbb
	.byte	0xe
	.long	0x98
	.long	0x7f8
	.uleb128 0x2
	.long	0x2b2
	.byte	0
	.uleb128 0x8
	.long	.LASF124
	.byte	0x13
	.value	0x2a0
	.byte	0xe
	.long	0x48
	.long	0x80f
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0x8
	.long	.LASF125
	.byte	0x11
	.value	0x108
	.byte	0xe
	.long	0x2bc
	.long	0x82b
	.uleb128 0x2
	.long	0x2b7
	.uleb128 0x2
	.long	0x2b7
	.byte	0
	.uleb128 0x26
	.long	.LASF143
	.byte	0x1
	.byte	0x57
	.byte	0x5
	.long	0x66
	.quad	.LFB321
	.quad	.LFE321-.LFB321
	.uleb128 0x1
	.byte	0x9c
	.long	0x8c6
	.uleb128 0x17
	.long	.LASF126
	.byte	0x57
	.byte	0xe
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -164
	.uleb128 0x17
	.long	.LASF127
	.byte	0x57
	.byte	0x1a
	.long	0x404
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0xf
	.string	"sd"
	.byte	0x59
	.byte	0x13
	.long	0x638
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x6
	.long	.LASF128
	.byte	0x5e
	.byte	0xd
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x6
	.long	.LASF129
	.byte	0x78
	.byte	0x9
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -148
	.uleb128 0x6
	.long	.LASF130
	.byte	0x79
	.byte	0x9
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x18
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0xf
	.string	"i"
	.byte	0x7d
	.byte	0x11
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -156
	.byte	0
	.byte	0
	.uleb128 0x27
	.long	.LASF144
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.quad	.LFB320
	.quad	.LFE320-.LFB320
	.uleb128 0x1
	.byte	0x9c
	.long	0x98a
	.uleb128 0x28
	.string	"sd"
	.byte	0x1
	.byte	0x12
	.byte	0x26
	.long	0x656
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1128
	.uleb128 0xf
	.string	"fs"
	.byte	0x13
	.byte	0xb
	.long	0x2bc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1088
	.uleb128 0x6
	.long	.LASF131
	.byte	0x14
	.byte	0xa
	.long	0x98a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1056
	.uleb128 0xf
	.string	"i"
	.byte	0x16
	.byte	0x9
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1108
	.uleb128 0x6
	.long	.LASF132
	.byte	0x17
	.byte	0xb
	.long	0x98
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1104
	.uleb128 0x6
	.long	.LASF133
	.byte	0x19
	.byte	0x16
	.long	0x623
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1080
	.uleb128 0x6
	.long	.LASF134
	.byte	0x1a
	.byte	0x16
	.long	0x623
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1096
	.uleb128 0x18
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x6
	.long	.LASF135
	.byte	0x1c
	.byte	0xd
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1112
	.uleb128 0x6
	.long	.LASF136
	.byte	0x26
	.byte	0xf
	.long	0x98
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1072
	.uleb128 0xf
	.string	"tok"
	.byte	0x27
	.byte	0xf
	.long	0x98
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1064
	.byte	0
	.byte	0
	.uleb128 0x29
	.long	0xa2
	.uleb128 0x2a
	.long	0x3a
	.value	0x3ff
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 12
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
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
	.uleb128 0x10
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x21
	.sleb128 13
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0
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
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.uleb128 0x87
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
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
	.uleb128 0x6e
	.uleb128 0xe
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
	.uleb128 0x26
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
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
	.uleb128 0x28
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
	.uleb128 0x29
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
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
.LASF116:
	.string	"printf"
.LASF11:
	.string	"__off_t"
.LASF64:
	.string	"__size"
.LASF16:
	.string	"_IO_read_ptr"
.LASF124:
	.string	"malloc"
.LASF28:
	.string	"_chain"
.LASF75:
	.string	"ai_flags"
.LASF94:
	.string	"server_port"
.LASF9:
	.string	"size_t"
.LASF52:
	.string	"__prev"
.LASF65:
	.string	"__align"
.LASF34:
	.string	"_shortbuf"
.LASF74:
	.string	"addrinfo"
.LASF108:
	.string	"sockDetails_t"
.LASF6:
	.string	"signed char"
.LASF134:
	.string	"prev"
.LASF137:
	.string	"GNU C17 14.2.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF22:
	.string	"_IO_buf_base"
.LASF49:
	.string	"long long unsigned int"
.LASF130:
	.string	"filename_index"
.LASF66:
	.string	"pthread_mutexattr_t"
.LASF69:
	.string	"socklen_t"
.LASF97:
	.string	"next"
.LASF37:
	.string	"_codecvt"
.LASF98:
	.string	"sockfd"
.LASF114:
	.string	"mkdir"
.LASF48:
	.string	"long long int"
.LASF102:
	.string	"servers_details"
.LASF129:
	.string	"total_filenames"
.LASF91:
	.string	"commands_t"
.LASF10:
	.string	"__mode_t"
.LASF104:
	.string	"server_sock_fds"
.LASF105:
	.string	"number_of_servers"
.LASF29:
	.string	"_fileno"
.LASF17:
	.string	"_IO_read_end"
.LASF8:
	.string	"long int"
.LASF15:
	.string	"_flags"
.LASF76:
	.string	"ai_family"
.LASF23:
	.string	"_IO_buf_end"
.LASF32:
	.string	"_cur_column"
.LASF46:
	.string	"_IO_codecvt"
.LASF31:
	.string	"_old_offset"
.LASF36:
	.string	"_offset"
.LASF54:
	.string	"__pthread_list_t"
.LASF143:
	.string	"main"
.LASF55:
	.string	"__pthread_mutex_s"
.LASF131:
	.string	"line"
.LASF53:
	.string	"__next"
.LASF103:
	.string	"connect_to_info"
.LASF45:
	.string	"_IO_marker"
.LASF106:
	.string	"number_of_available_servers"
.LASF3:
	.string	"unsigned int"
.LASF40:
	.string	"_freeres_buf"
.LASF90:
	.string	"number_of_command"
.LASF83:
	.string	"__int128"
.LASF99:
	.string	"command"
.LASF77:
	.string	"ai_socktype"
.LASF2:
	.string	"long unsigned int"
.LASF67:
	.string	"__data"
.LASF20:
	.string	"_IO_write_ptr"
.LASF62:
	.string	"__elision"
.LASF5:
	.string	"short unsigned int"
.LASF121:
	.string	"strlen"
.LASF24:
	.string	"_IO_save_base"
.LASF92:
	.string	"serverDetails_t"
.LASF136:
	.string	"line_dup"
.LASF35:
	.string	"_lock"
.LASF30:
	.string	"_flags2"
.LASF42:
	.string	"_mode"
.LASF117:
	.string	"fgets"
.LASF111:
	.string	"pthread_mutex_init"
.LASF144:
	.string	"read_server_conf"
.LASF58:
	.string	"__owner"
.LASF101:
	.string	"command_int"
.LASF86:
	.string	"DELETE"
.LASF141:
	.string	"sscanf"
.LASF100:
	.string	"filename"
.LASF89:
	.string	"HELP"
.LASF120:
	.string	"strndup"
.LASF88:
	.string	"SERVER_INFO"
.LASF21:
	.string	"_IO_write_end"
.LASF41:
	.string	"_prevchain"
.LASF78:
	.string	"ai_protocol"
.LASF138:
	.string	"_IO_lock_t"
.LASF50:
	.string	"_IO_FILE"
.LASF133:
	.string	"current"
.LASF93:
	.string	"client_sock_fd"
.LASF51:
	.string	"__pthread_internal_list"
.LASF79:
	.string	"ai_addrlen"
.LASF95:
	.string	"server_ip"
.LASF72:
	.string	"sa_family"
.LASF27:
	.string	"_markers"
.LASF135:
	.string	"dfs_no"
.LASF84:
	.string	"__int128 unsigned"
.LASF4:
	.string	"unsigned char"
.LASF112:
	.string	"cleanup_connection"
.LASF80:
	.string	"ai_addr"
.LASF7:
	.string	"short int"
.LASF47:
	.string	"_IO_wide_data"
.LASF142:
	.string	"__isoc23_sscanf"
.LASF82:
	.string	"ai_next"
.LASF33:
	.string	"_vtable_offset"
.LASF44:
	.string	"FILE"
.LASF119:
	.string	"exit"
.LASF57:
	.string	"__count"
.LASF56:
	.string	"__lock"
.LASF87:
	.string	"EXIT"
.LASF85:
	.string	"long double"
.LASF13:
	.string	"char"
.LASF14:
	.string	"__socklen_t"
.LASF71:
	.string	"sockaddr"
.LASF125:
	.string	"fopen"
.LASF140:
	.string	"__errno_location"
.LASF115:
	.string	"fclose"
.LASF12:
	.string	"__off64_t"
.LASF18:
	.string	"_IO_read_base"
.LASF26:
	.string	"_IO_save_end"
.LASF118:
	.string	"free"
.LASF68:
	.string	"pthread_mutex_t"
.LASF110:
	.string	"whichcmd"
.LASF61:
	.string	"__spins"
.LASF70:
	.string	"sa_family_t"
.LASF43:
	.string	"_unused2"
.LASF127:
	.string	"argv"
.LASF128:
	.string	"status"
.LASF122:
	.string	"strtok_r"
.LASF123:
	.string	"strdup"
.LASF59:
	.string	"__nusers"
.LASF25:
	.string	"_IO_backup_base"
.LASF113:
	.string	"perror"
.LASF126:
	.string	"argc"
.LASF73:
	.string	"sa_data"
.LASF39:
	.string	"_freeres_list"
.LASF63:
	.string	"__list"
.LASF81:
	.string	"ai_canonname"
.LASF38:
	.string	"_wide_data"
.LASF109:
	.string	"handle_req"
.LASF60:
	.string	"__kind"
.LASF132:
	.string	"saved_remaining_line"
.LASF107:
	.string	"lock"
.LASF19:
	.string	"_IO_write_base"
.LASF96:
	.string	"dfsno"
.LASF139:
	.string	"print_menu"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/parth/Work/All_data/university/Network System/Assignments/PA4/client"
.LASF0:
	.string	"dfc.c"
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
