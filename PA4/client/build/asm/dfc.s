	.file	"dfc.c"
	.text
.Ltext0:
	.file 0 "/home/parth/Work/All_data/university/Network System/Assignments/PA4/client" "dfc.c"
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"./dfc.conf"
	.align 8
.LC2:
	.string	"[-] Could not open conf file %s \n\r"
.LC3:
	.string	"ls"
.LC4:
	.string	" "
.LC5:
	.string	"dfs%d"
.LC6:
	.string	":"
.LC7:
	.string	"\n"
	.align 8
.LC8:
	.string	"\033[31m[-] ERROR: No servers found in configuration file\n\033[0m"
	.align 8
.LC9:
	.string	"\033[32m[+] SERVER CONFIGURATION: %d server(s) found in config file\n\033[0m"
	.text
	.globl	read_server_conf
	.type	read_server_conf, @function
read_server_conf:
.LFB309:
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
	.loc 1 20 7
	cmpq	$0, -1072(%rbp)
	jne	.L2
	.loc 1 21 9
	movq	stderr(%rip), %rax
	leaq	.LC1(%rip), %rdx
	leaq	.LC2(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 22 9
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	system@PLT
	.loc 1 23 9
	movl	$1, %edi
	call	exit@PLT
.L2:
	.loc 1 27 9
	movl	$0, -1092(%rbp)
	.loc 1 30 22
	movq	$0, -1064(%rbp)
	.loc 1 31 22
	movq	$0, -1080(%rbp)
	.loc 1 32 10
	jmp	.L3
.L9:
.LBB2:
	.loc 1 35 19
	movl	$40, %edi
	call	malloc@PLT
	movq	%rax, -1064(%rbp)
	.loc 1 36 14
	movq	-1112(%rbp), %rax
	movq	32(%rax), %rax
	.loc 1 36 11
	testq	%rax, %rax
	jne	.L4
	.loc 1 37 33
	movq	-1112(%rbp), %rax
	movq	-1064(%rbp), %rdx
	movq	%rdx, 32(%rax)
	jmp	.L5
.L4:
	.loc 1 40 24
	movq	-1080(%rbp), %rax
	movq	-1064(%rbp), %rdx
	movq	%rdx, 32(%rax)
.L5:
	.loc 1 43 26
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, -1056(%rbp)
	.loc 1 44 21
	leaq	-1088(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	leaq	.LC4(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strtok_r@PLT
	movq	%rax, -1048(%rbp)
	.loc 1 46 15
	leaq	-1088(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC4(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok_r@PLT
	movq	%rax, -1048(%rbp)
	.loc 1 47 9
	leaq	-1096(%rbp), %rdx
	movq	-1048(%rbp), %rax
	leaq	.LC5(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc23_sscanf@PLT
	.loc 1 48 15
	leaq	-1088(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC6(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok_r@PLT
	movq	%rax, -1048(%rbp)
	.loc 1 50 30
	movq	-1048(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	.loc 1 50 30 is_stmt 0 discriminator 1
	movq	-1048(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strndup@PLT
	movq	%rax, %rdx
	.loc 1 50 28 is_stmt 1 discriminator 2
	movq	-1064(%rbp), %rax
	movq	%rdx, 16(%rax)
	.loc 1 51 19
	movq	-1064(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 51 11
	testq	%rax, %rax
	jne	.L6
	.loc 1 51 40 discriminator 1
	movl	$1, %edi
	call	exit@PLT
.L6:
	.loc 1 53 15
	leaq	-1088(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC7(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok_r@PLT
	movq	%rax, -1048(%rbp)
	.loc 1 54 32
	movq	-1048(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	.loc 1 54 32 is_stmt 0 discriminator 1
	movq	-1048(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strndup@PLT
	movq	%rax, %rdx
	.loc 1 54 30 is_stmt 1 discriminator 2
	movq	-1064(%rbp), %rax
	movq	%rdx, 8(%rax)
	.loc 1 55 19
	movq	-1064(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 55 11
	testq	%rax, %rax
	jne	.L7
	.loc 1 55 42 discriminator 1
	movl	$1, %edi
	call	exit@PLT
.L7:
	.loc 1 57 24
	movl	-1096(%rbp), %edx
	movq	-1064(%rbp), %rax
	movl	%edx, 24(%rax)
	.loc 1 58 11
	movq	-1112(%rbp), %rax
	movl	64(%rax), %eax
	.loc 1 58 30
	leal	1(%rax), %edx
	movq	-1112(%rbp), %rax
	movl	%edx, 64(%rax)
	.loc 1 60 14
	movq	-1064(%rbp), %rax
	movq	%rax, -1080(%rbp)
	.loc 1 62 9
	movq	-1056(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 63 10
	addl	$1, -1092(%rbp)
.L3:
.LBE2:
	.loc 1 32 11
	movq	-1072(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	movl	$1023, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	.loc 1 32 51 discriminator 1
	testq	%rax, %rax
	je	.L8
	.loc 1 32 56 discriminator 1
	movq	-1112(%rbp), %rax
	movl	64(%rax), %eax
	.loc 1 32 51 discriminator 1
	cmpl	$3, %eax
	jle	.L9
.L8:
	.loc 1 65 10
	movq	-1112(%rbp), %rax
	movl	64(%rax), %eax
	.loc 1 65 7
	testl	%eax, %eax
	jg	.L10
	.loc 1 66 9
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 67 9
	movl	$1, %edi
	call	exit@PLT
.L10:
	.loc 1 70 5
	movq	-1112(%rbp), %rax
	movl	64(%rax), %eax
	movl	%eax, %esi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 71 5
	movq	-1072(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	.loc 1 72 1
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L11
	call	__stack_chk_fail@PLT
.L11:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE309:
	.size	read_server_conf, .-read_server_conf
	.section	.rodata
	.align 8
.LC10:
	.string	"\033[31m[-] ERROR: Invalid command usage\n\033[0m"
	.align 8
.LC11:
	.string	"\033[31m    Usage: ./dfc <COMMAND> [FILENAME]\n\033[0m"
.LC12:
	.string	"DELETE"
.LC13:
	.string	"this"
.LC14:
	.string	"PUT"
.LC15:
	.string	"GET"
	.align 8
.LC16:
	.string	"\033[31m[-] ERROR: No filename specified for %s command\n\033[0m"
	.align 8
.LC17:
	.string	"\033[32m[+] Processing file %d of %d: %s\n\033[0m"
	.text
	.globl	main
	.type	main, @function
main:
.LFB310:
	.loc 1 93 1
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
	.loc 1 93 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 95 24
	movq	$0, -96(%rbp)
	.loc 1 111 5
	leaq	-128(%rbp), %rax
	addq	$72, %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_mutex_init@PLT
	.loc 1 114 8
	cmpl	$1, -148(%rbp)
	jg	.L13
	.loc 1 116 9
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 117 9
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 118 9
	movl	$0, %eax
	call	print_menu@PLT
	.loc 1 120 9
	movl	$1, %edi
	call	exit@PLT
.L13:
	.loc 1 123 5
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	read_server_conf
	.loc 1 125 9
	movl	$2, -140(%rbp)
	.loc 1 126 9
	movl	-148(%rbp), %eax
	subl	-140(%rbp), %eax
	movl	%eax, -132(%rbp)
	.loc 1 128 22
	movq	-160(%rbp), %rdx
	movl	-148(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	whichcmd@PLT
	.loc 1 128 20 discriminator 1
	movl	%eax, -104(%rbp)
	.loc 1 130 10
	movl	-104(%rbp), %eax
	.loc 1 130 7
	cmpl	$2, %eax
	jbe	.L14
	.loc 1 132 21
	movq	$0, -112(%rbp)
	.loc 1 133 9
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	handle_req@PLT
	jmp	.L15
.L14:
	.loc 1 134 15
	cmpl	$0, -132(%rbp)
	jg	.L16
	.loc 1 137 15
	movl	-104(%rbp), %eax
	.loc 1 136 9
	testl	%eax, %eax
	je	.L17
	.loc 1 138 15
	movl	-104(%rbp), %eax
	.loc 1 138 43
	cmpl	$1, %eax
	je	.L18
	.loc 1 139 15
	movl	-104(%rbp), %eax
	.loc 1 139 49
	cmpl	$2, %eax
	jne	.L19
	.loc 1 139 49 is_stmt 0 discriminator 1
	leaq	.LC12(%rip), %rax
	jmp	.L22
.L19:
	.loc 1 139 49 discriminator 2
	leaq	.LC13(%rip), %rax
	jmp	.L22
.L18:
	.loc 1 138 43 is_stmt 1 discriminator 1
	leaq	.LC14(%rip), %rax
	jmp	.L22
.L17:
	.loc 1 136 9 discriminator 1
	leaq	.LC15(%rip), %rax
.L22:
	.loc 1 136 9 is_stmt 0 discriminator 3
	movq	%rax, %rsi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 140 9 is_stmt 1
	movl	$0, %eax
	call	print_menu@PLT
	.loc 1 141 9
	movl	$1, %edi
	call	exit@PLT
.L16:
.LBB3:
	.loc 1 144 17
	movl	$0, -136(%rbp)
	.loc 1 144 9
	jmp	.L23
.L24:
	.loc 1 145 31
	movl	-140(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 145 25
	movq	%rax, -112(%rbp)
	.loc 1 146 13
	movq	-112(%rbp), %rdx
	movl	-136(%rbp), %eax
	leal	1(%rax), %esi
	movl	-132(%rbp), %eax
	movq	%rdx, %rcx
	movl	%eax, %edx
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 148 13
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	handle_req@PLT
	.loc 1 149 27
	addl	$1, -140(%rbp)
	.loc 1 144 46 discriminator 3
	addl	$1, -136(%rbp)
.L23:
	.loc 1 144 26 discriminator 1
	movl	-136(%rbp), %eax
	cmpl	-132(%rbp), %eax
	jl	.L24
.L15:
.LBE3:
	.loc 1 153 5
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	cleanup_connection@PLT
	.loc 1 155 12
	movl	$0, %eax
	.loc 1 156 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L26
	call	__stack_chk_fail@PLT
.L26:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE310:
	.size	main, .-main
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/13/include/stddef.h"
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
	.file 18 "/usr/include/stdlib.h"
	.file 19 "/usr/include/string.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x988
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x18
	.long	.LASF135
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x5
	.long	.LASF9
	.byte	0x2
	.byte	0xd6
	.byte	0x17
	.long	0x3a
	.uleb128 0x4
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x19
	.byte	0x8
	.uleb128 0x4
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x4
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x4
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x1a
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x4
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x5
	.long	.LASF10
	.byte	0x3
	.byte	0x98
	.byte	0x19
	.long	0x6d
	.uleb128 0x5
	.long	.LASF11
	.byte	0x3
	.byte	0x99
	.byte	0x1b
	.long	0x6d
	.uleb128 0x3
	.long	0x96
	.uleb128 0x10
	.long	0x8c
	.uleb128 0x4
	.byte	0x1
	.byte	0x6
	.long	.LASF12
	.uleb128 0x14
	.long	0x96
	.uleb128 0x5
	.long	.LASF13
	.byte	0x3
	.byte	0xd2
	.byte	0x17
	.long	0x41
	.uleb128 0x9
	.long	0x96
	.long	0xbe
	.uleb128 0xa
	.long	0x3a
	.byte	0x3
	.byte	0
	.uleb128 0xb
	.long	.LASF49
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x245
	.uleb128 0x1
	.long	.LASF14
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x66
	.byte	0
	.uleb128 0x1
	.long	.LASF15
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0x8c
	.byte	0x8
	.uleb128 0x1
	.long	.LASF16
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0x8c
	.byte	0x10
	.uleb128 0x1
	.long	.LASF17
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0x8c
	.byte	0x18
	.uleb128 0x1
	.long	.LASF18
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0x8c
	.byte	0x20
	.uleb128 0x1
	.long	.LASF19
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0x8c
	.byte	0x28
	.uleb128 0x1
	.long	.LASF20
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0x8c
	.byte	0x30
	.uleb128 0x1
	.long	.LASF21
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0x8c
	.byte	0x38
	.uleb128 0x1
	.long	.LASF22
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0x8c
	.byte	0x40
	.uleb128 0x1
	.long	.LASF23
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0x8c
	.byte	0x48
	.uleb128 0x1
	.long	.LASF24
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0x8c
	.byte	0x50
	.uleb128 0x1
	.long	.LASF25
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0x8c
	.byte	0x58
	.uleb128 0x1
	.long	.LASF26
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x25e
	.byte	0x60
	.uleb128 0x1
	.long	.LASF27
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x263
	.byte	0x68
	.uleb128 0x1
	.long	.LASF28
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x66
	.byte	0x70
	.uleb128 0x1
	.long	.LASF29
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x66
	.byte	0x74
	.uleb128 0x1
	.long	.LASF30
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0x74
	.byte	0x78
	.uleb128 0x1
	.long	.LASF31
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x51
	.byte	0x80
	.uleb128 0x1
	.long	.LASF32
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x58
	.byte	0x82
	.uleb128 0x1
	.long	.LASF33
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x268
	.byte	0x83
	.uleb128 0x1
	.long	.LASF34
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x278
	.byte	0x88
	.uleb128 0x1
	.long	.LASF35
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0x80
	.byte	0x90
	.uleb128 0x1
	.long	.LASF36
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x282
	.byte	0x98
	.uleb128 0x1
	.long	.LASF37
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x28c
	.byte	0xa0
	.uleb128 0x1
	.long	.LASF38
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x263
	.byte	0xa8
	.uleb128 0x1
	.long	.LASF39
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0x48
	.byte	0xb0
	.uleb128 0x1
	.long	.LASF40
	.byte	0x4
	.byte	0x5f
	.byte	0xa
	.long	0x2e
	.byte	0xb8
	.uleb128 0x1
	.long	.LASF41
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x66
	.byte	0xc0
	.uleb128 0x1
	.long	.LASF42
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x291
	.byte	0xc4
	.byte	0
	.uleb128 0x5
	.long	.LASF43
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0xbe
	.uleb128 0x1b
	.long	.LASF136
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0x12
	.long	.LASF44
	.uleb128 0x3
	.long	0x259
	.uleb128 0x3
	.long	0xbe
	.uleb128 0x9
	.long	0x96
	.long	0x278
	.uleb128 0xa
	.long	0x3a
	.byte	0
	.byte	0
	.uleb128 0x3
	.long	0x251
	.uleb128 0x12
	.long	.LASF45
	.uleb128 0x3
	.long	0x27d
	.uleb128 0x12
	.long	.LASF46
	.uleb128 0x3
	.long	0x287
	.uleb128 0x9
	.long	0x96
	.long	0x2a1
	.uleb128 0xa
	.long	0x3a
	.byte	0x13
	.byte	0
	.uleb128 0x3
	.long	0x9d
	.uleb128 0x10
	.long	0x2a1
	.uleb128 0x3
	.long	0x245
	.uleb128 0x10
	.long	0x2ab
	.uleb128 0x1c
	.long	.LASF137
	.byte	0x11
	.byte	0x97
	.byte	0xe
	.long	0x2ab
	.uleb128 0x4
	.byte	0x8
	.byte	0x5
	.long	.LASF47
	.uleb128 0x4
	.byte	0x8
	.byte	0x7
	.long	.LASF48
	.uleb128 0xb
	.long	.LASF50
	.byte	0x10
	.byte	0x6
	.byte	0x33
	.byte	0x10
	.long	0x2f7
	.uleb128 0x1
	.long	.LASF51
	.byte	0x6
	.byte	0x35
	.byte	0x23
	.long	0x2f7
	.byte	0
	.uleb128 0x1
	.long	.LASF52
	.byte	0x6
	.byte	0x36
	.byte	0x23
	.long	0x2f7
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	0x2cf
	.uleb128 0x5
	.long	.LASF53
	.byte	0x6
	.byte	0x37
	.byte	0x3
	.long	0x2cf
	.uleb128 0xb
	.long	.LASF54
	.byte	0x28
	.byte	0x7
	.byte	0x16
	.byte	0x8
	.long	0x37e
	.uleb128 0x1
	.long	.LASF55
	.byte	0x7
	.byte	0x18
	.byte	0x7
	.long	0x66
	.byte	0
	.uleb128 0x1
	.long	.LASF56
	.byte	0x7
	.byte	0x19
	.byte	0x10
	.long	0x41
	.byte	0x4
	.uleb128 0x1
	.long	.LASF57
	.byte	0x7
	.byte	0x1a
	.byte	0x7
	.long	0x66
	.byte	0x8
	.uleb128 0x1
	.long	.LASF58
	.byte	0x7
	.byte	0x1c
	.byte	0x10
	.long	0x41
	.byte	0xc
	.uleb128 0x1
	.long	.LASF59
	.byte	0x7
	.byte	0x20
	.byte	0x7
	.long	0x66
	.byte	0x10
	.uleb128 0x1
	.long	.LASF60
	.byte	0x7
	.byte	0x22
	.byte	0x9
	.long	0x5f
	.byte	0x14
	.uleb128 0x1
	.long	.LASF61
	.byte	0x7
	.byte	0x23
	.byte	0x9
	.long	0x5f
	.byte	0x16
	.uleb128 0x1
	.long	.LASF62
	.byte	0x7
	.byte	0x24
	.byte	0x14
	.long	0x2fc
	.byte	0x18
	.byte	0
	.uleb128 0x15
	.byte	0x4
	.byte	0x20
	.long	0x39c
	.uleb128 0xc
	.long	.LASF63
	.byte	0x22
	.byte	0x8
	.long	0xae
	.uleb128 0xc
	.long	.LASF64
	.byte	0x23
	.byte	0x7
	.long	0x66
	.byte	0
	.uleb128 0x5
	.long	.LASF65
	.byte	0x8
	.byte	0x24
	.byte	0x3
	.long	0x37e
	.uleb128 0x14
	.long	0x39c
	.uleb128 0x15
	.byte	0x28
	.byte	0x43
	.long	0x3d6
	.uleb128 0xc
	.long	.LASF66
	.byte	0x45
	.byte	0x1c
	.long	0x308
	.uleb128 0xc
	.long	.LASF63
	.byte	0x46
	.byte	0x8
	.long	0x3d6
	.uleb128 0xc
	.long	.LASF64
	.byte	0x47
	.byte	0xc
	.long	0x6d
	.byte	0
	.uleb128 0x9
	.long	0x96
	.long	0x3e6
	.uleb128 0xa
	.long	0x3a
	.byte	0x27
	.byte	0
	.uleb128 0x5
	.long	.LASF67
	.byte	0x8
	.byte	0x48
	.byte	0x3
	.long	0x3ad
	.uleb128 0x1d
	.long	.LASF68
	.byte	0x9
	.value	0x112
	.byte	0x15
	.long	0xa2
	.uleb128 0x3
	.long	0x8c
	.uleb128 0x10
	.long	0x3ff
	.uleb128 0x5
	.long	.LASF69
	.byte	0xa
	.byte	0x1c
	.byte	0x1c
	.long	0x51
	.uleb128 0xb
	.long	.LASF70
	.byte	0x10
	.byte	0xb
	.byte	0xb7
	.byte	0x8
	.long	0x43d
	.uleb128 0x1
	.long	.LASF71
	.byte	0xb
	.byte	0xb9
	.byte	0x5
	.long	0x409
	.byte	0
	.uleb128 0x1
	.long	.LASF72
	.byte	0xb
	.byte	0xba
	.byte	0xa
	.long	0x43d
	.byte	0x2
	.byte	0
	.uleb128 0x9
	.long	0x96
	.long	0x44d
	.uleb128 0xa
	.long	0x3a
	.byte	0xd
	.byte	0
	.uleb128 0x3
	.long	0x415
	.uleb128 0x1e
	.long	.LASF73
	.byte	0x30
	.byte	0xc
	.value	0x235
	.byte	0x8
	.long	0x4c9
	.uleb128 0x7
	.long	.LASF74
	.value	0x237
	.byte	0x7
	.long	0x66
	.byte	0
	.uleb128 0x7
	.long	.LASF75
	.value	0x238
	.byte	0x7
	.long	0x66
	.byte	0x4
	.uleb128 0x7
	.long	.LASF76
	.value	0x239
	.byte	0x7
	.long	0x66
	.byte	0x8
	.uleb128 0x7
	.long	.LASF77
	.value	0x23a
	.byte	0x7
	.long	0x66
	.byte	0xc
	.uleb128 0x7
	.long	.LASF78
	.value	0x23b
	.byte	0xd
	.long	0x3f2
	.byte	0x10
	.uleb128 0x7
	.long	.LASF79
	.value	0x23c
	.byte	0x14
	.long	0x44d
	.byte	0x18
	.uleb128 0x7
	.long	.LASF80
	.value	0x23d
	.byte	0x9
	.long	0x8c
	.byte	0x20
	.uleb128 0x7
	.long	.LASF81
	.value	0x23e
	.byte	0x14
	.long	0x4c9
	.byte	0x28
	.byte	0
	.uleb128 0x3
	.long	0x452
	.uleb128 0x4
	.byte	0x10
	.byte	0x5
	.long	.LASF82
	.uleb128 0x4
	.byte	0x10
	.byte	0x7
	.long	.LASF83
	.uleb128 0x4
	.byte	0x10
	.byte	0x4
	.long	.LASF84
	.uleb128 0x1f
	.byte	0x7
	.byte	0x4
	.long	0x41
	.byte	0xd
	.byte	0x71
	.byte	0x1
	.long	0x521
	.uleb128 0x13
	.string	"GET"
	.byte	0
	.uleb128 0x13
	.string	"PUT"
	.byte	0x1
	.uleb128 0xd
	.long	.LASF85
	.byte	0x2
	.uleb128 0x13
	.string	"LS"
	.byte	0x3
	.uleb128 0xd
	.long	.LASF86
	.byte	0x4
	.uleb128 0xd
	.long	.LASF87
	.byte	0x5
	.uleb128 0xd
	.long	.LASF88
	.byte	0x6
	.uleb128 0xd
	.long	.LASF89
	.byte	0x7
	.byte	0
	.uleb128 0x5
	.long	.LASF90
	.byte	0xd
	.byte	0x7a
	.byte	0x3
	.long	0x4e3
	.uleb128 0xb
	.long	.LASF91
	.byte	0x28
	.byte	0xd
	.byte	0x7f
	.byte	0x10
	.long	0x57c
	.uleb128 0x1
	.long	.LASF92
	.byte	0xd
	.byte	0x80
	.byte	0x9
	.long	0x66
	.byte	0
	.uleb128 0x1
	.long	.LASF93
	.byte	0xd
	.byte	0x81
	.byte	0xb
	.long	0x8c
	.byte	0x8
	.uleb128 0x1
	.long	.LASF94
	.byte	0xd
	.byte	0x82
	.byte	0xb
	.long	0x8c
	.byte	0x10
	.uleb128 0x1
	.long	.LASF95
	.byte	0xd
	.byte	0x83
	.byte	0x9
	.long	0x66
	.byte	0x18
	.uleb128 0x1
	.long	.LASF96
	.byte	0xd
	.byte	0x84
	.byte	0x1d
	.long	0x57c
	.byte	0x20
	.byte	0
	.uleb128 0x3
	.long	0x52d
	.uleb128 0x5
	.long	.LASF91
	.byte	0xd
	.byte	0x85
	.byte	0x2
	.long	0x52d
	.uleb128 0x20
	.byte	0x70
	.byte	0xd
	.byte	0x8e
	.byte	0x9
	.long	0x619
	.uleb128 0x1
	.long	.LASF97
	.byte	0xd
	.byte	0x90
	.byte	0x9
	.long	0x66
	.byte	0
	.uleb128 0x1
	.long	.LASF98
	.byte	0xd
	.byte	0x91
	.byte	0xb
	.long	0x8c
	.byte	0x8
	.uleb128 0x1
	.long	.LASF99
	.byte	0xd
	.byte	0x92
	.byte	0xb
	.long	0x8c
	.byte	0x10
	.uleb128 0x1
	.long	.LASF100
	.byte	0xd
	.byte	0x93
	.byte	0x10
	.long	0x521
	.byte	0x18
	.uleb128 0x1
	.long	.LASF101
	.byte	0xd
	.byte	0x94
	.byte	0x16
	.long	0x619
	.byte	0x20
	.uleb128 0x1
	.long	.LASF102
	.byte	0xd
	.byte	0x95
	.byte	0x16
	.long	0x4c9
	.byte	0x28
	.uleb128 0x1
	.long	.LASF103
	.byte	0xd
	.byte	0x96
	.byte	0x9
	.long	0x61e
	.byte	0x30
	.uleb128 0x1
	.long	.LASF104
	.byte	0xd
	.byte	0x97
	.byte	0x9
	.long	0x66
	.byte	0x40
	.uleb128 0x1
	.long	.LASF105
	.byte	0xd
	.byte	0x98
	.byte	0x9
	.long	0x66
	.byte	0x44
	.uleb128 0x1
	.long	.LASF106
	.byte	0xd
	.byte	0x9a
	.byte	0x15
	.long	0x3e6
	.byte	0x48
	.byte	0
	.uleb128 0x3
	.long	0x581
	.uleb128 0x9
	.long	0x66
	.long	0x62e
	.uleb128 0xa
	.long	0x3a
	.byte	0x3
	.byte	0
	.uleb128 0x5
	.long	.LASF107
	.byte	0xd
	.byte	0x9b
	.byte	0x3
	.long	0x58d
	.uleb128 0x21
	.long	.LASF114
	.byte	0xe
	.byte	0x28
	.byte	0x6
	.long	0x64c
	.uleb128 0x2
	.long	0x64c
	.byte	0
	.uleb128 0x3
	.long	0x62e
	.uleb128 0xe
	.long	.LASF108
	.byte	0xe
	.byte	0x26
	.byte	0x7
	.long	0x48
	.long	0x667
	.uleb128 0x2
	.long	0x64c
	.byte	0
	.uleb128 0xe
	.long	.LASF109
	.byte	0xf
	.byte	0x5
	.byte	0xc
	.long	0x521
	.long	0x682
	.uleb128 0x2
	.long	0x66
	.uleb128 0x2
	.long	0x3ff
	.byte	0
	.uleb128 0x22
	.long	.LASF138
	.byte	0x1
	.byte	0xd
	.byte	0x6
	.long	0x690
	.uleb128 0x11
	.byte	0
	.uleb128 0x6
	.long	.LASF110
	.byte	0x10
	.value	0x30d
	.byte	0xc
	.long	0x66
	.long	0x6ac
	.uleb128 0x2
	.long	0x6ac
	.uleb128 0x2
	.long	0x6b1
	.byte	0
	.uleb128 0x3
	.long	0x3e6
	.uleb128 0x3
	.long	0x3a8
	.uleb128 0xe
	.long	.LASF111
	.byte	0x11
	.byte	0xb8
	.byte	0xc
	.long	0x66
	.long	0x6cc
	.uleb128 0x2
	.long	0x2ab
	.byte	0
	.uleb128 0x6
	.long	.LASF112
	.byte	0x11
	.value	0x16b
	.byte	0xc
	.long	0x66
	.long	0x6e4
	.uleb128 0x2
	.long	0x2a1
	.uleb128 0x11
	.byte	0
	.uleb128 0x6
	.long	.LASF113
	.byte	0x11
	.value	0x28e
	.byte	0xe
	.long	0x8c
	.long	0x705
	.uleb128 0x2
	.long	0x91
	.uleb128 0x2
	.long	0x66
	.uleb128 0x2
	.long	0x2b0
	.byte	0
	.uleb128 0x23
	.long	.LASF115
	.byte	0x12
	.value	0x2af
	.byte	0xd
	.long	0x718
	.uleb128 0x2
	.long	0x48
	.byte	0
	.uleb128 0xe
	.long	.LASF116
	.byte	0x13
	.byte	0xc3
	.byte	0xe
	.long	0x8c
	.long	0x733
	.uleb128 0x2
	.long	0x2a1
	.uleb128 0x2
	.long	0x2e
	.byte	0
	.uleb128 0x6
	.long	.LASF117
	.byte	0x13
	.value	0x197
	.byte	0xf
	.long	0x2e
	.long	0x74a
	.uleb128 0x2
	.long	0x2a1
	.byte	0
	.uleb128 0x24
	.long	.LASF139
	.byte	0x11
	.value	0x1bf
	.byte	0xc
	.long	.LASF140
	.long	0x66
	.long	0x76b
	.uleb128 0x2
	.long	0x2a1
	.uleb128 0x2
	.long	0x2a1
	.uleb128 0x11
	.byte	0
	.uleb128 0x6
	.long	.LASF118
	.byte	0x13
	.value	0x16e
	.byte	0xe
	.long	0x8c
	.long	0x78c
	.uleb128 0x2
	.long	0x91
	.uleb128 0x2
	.long	0x2a6
	.uleb128 0x2
	.long	0x404
	.byte	0
	.uleb128 0xe
	.long	.LASF119
	.byte	0x13
	.byte	0xbb
	.byte	0xe
	.long	0x8c
	.long	0x7a2
	.uleb128 0x2
	.long	0x2a1
	.byte	0
	.uleb128 0x6
	.long	.LASF120
	.byte	0x12
	.value	0x2a0
	.byte	0xe
	.long	0x48
	.long	0x7b9
	.uleb128 0x2
	.long	0x2e
	.byte	0
	.uleb128 0x25
	.long	.LASF121
	.byte	0x12
	.value	0x2f4
	.byte	0xd
	.long	0x7cc
	.uleb128 0x2
	.long	0x66
	.byte	0
	.uleb128 0x6
	.long	.LASF122
	.byte	0x12
	.value	0x39b
	.byte	0xc
	.long	0x66
	.long	0x7e3
	.uleb128 0x2
	.long	0x2a1
	.byte	0
	.uleb128 0x6
	.long	.LASF123
	.byte	0x11
	.value	0x165
	.byte	0xc
	.long	0x66
	.long	0x800
	.uleb128 0x2
	.long	0x2b0
	.uleb128 0x2
	.long	0x2a6
	.uleb128 0x11
	.byte	0
	.uleb128 0x6
	.long	.LASF124
	.byte	0x11
	.value	0x108
	.byte	0xe
	.long	0x2ab
	.long	0x81c
	.uleb128 0x2
	.long	0x2a6
	.uleb128 0x2
	.long	0x2a6
	.byte	0
	.uleb128 0x26
	.long	.LASF141
	.byte	0x1
	.byte	0x5c
	.byte	0x5
	.long	0x66
	.quad	.LFB310
	.quad	.LFE310-.LFB310
	.uleb128 0x1
	.byte	0x9c
	.long	0x8ba
	.uleb128 0x16
	.long	.LASF125
	.byte	0x5c
	.byte	0xe
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -164
	.uleb128 0x16
	.long	.LASF126
	.byte	0x5c
	.byte	0x1a
	.long	0x3ff
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0xf
	.string	"sd"
	.byte	0x5e
	.byte	0x13
	.long	0x62e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x8
	.long	.LASF127
	.byte	0x7d
	.byte	0x9
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -156
	.uleb128 0x8
	.long	.LASF128
	.byte	0x7e
	.byte	0x9
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -148
	.uleb128 0x27
	.long	0x89a
	.uleb128 0x28
	.long	.LASF142
	.byte	0x1
	.byte	0x63
	.byte	0xd
	.long	0x66
	.byte	0
	.uleb128 0x17
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0xf
	.string	"i"
	.byte	0x90
	.byte	0x11
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.byte	0
	.byte	0
	.uleb128 0x29
	.long	.LASF143
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.quad	.LFB309
	.quad	.LFE309-.LFB309
	.uleb128 0x1
	.byte	0x9c
	.long	0x97e
	.uleb128 0x2a
	.string	"sd"
	.byte	0x1
	.byte	0x12
	.byte	0x26
	.long	0x64c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1128
	.uleb128 0xf
	.string	"fs"
	.byte	0x13
	.byte	0xb
	.long	0x2ab
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1088
	.uleb128 0x8
	.long	.LASF129
	.byte	0x19
	.byte	0xa
	.long	0x97e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1056
	.uleb128 0xf
	.string	"i"
	.byte	0x1b
	.byte	0x9
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1108
	.uleb128 0x8
	.long	.LASF130
	.byte	0x1c
	.byte	0xb
	.long	0x8c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1104
	.uleb128 0x8
	.long	.LASF131
	.byte	0x1e
	.byte	0x16
	.long	0x619
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1080
	.uleb128 0x8
	.long	.LASF132
	.byte	0x1f
	.byte	0x16
	.long	0x619
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1096
	.uleb128 0x17
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x8
	.long	.LASF133
	.byte	0x21
	.byte	0xd
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1112
	.uleb128 0x8
	.long	.LASF134
	.byte	0x2b
	.byte	0xf
	.long	0x8c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1072
	.uleb128 0xf
	.string	"tok"
	.byte	0x2c
	.byte	0xf
	.long	0x8c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1064
	.byte	0
	.byte	0
	.uleb128 0x2b
	.long	0x96
	.uleb128 0x2c
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
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
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
	.uleb128 0x17
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
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
	.byte	0
	.byte	0
	.uleb128 0x29
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
	.uleb128 0x2a
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
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
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
.LASF112:
	.string	"printf"
.LASF10:
	.string	"__off_t"
.LASF15:
	.string	"_IO_read_ptr"
.LASF120:
	.string	"malloc"
.LASF27:
	.string	"_chain"
.LASF74:
	.string	"ai_flags"
.LASF93:
	.string	"server_port"
.LASF9:
	.string	"size_t"
.LASF51:
	.string	"__prev"
.LASF64:
	.string	"__align"
.LASF33:
	.string	"_shortbuf"
.LASF73:
	.string	"addrinfo"
.LASF107:
	.string	"sockDetails_t"
.LASF6:
	.string	"signed char"
.LASF132:
	.string	"prev"
.LASF63:
	.string	"__size"
.LASF21:
	.string	"_IO_buf_base"
.LASF48:
	.string	"long long unsigned int"
.LASF127:
	.string	"filename_index"
.LASF65:
	.string	"pthread_mutexattr_t"
.LASF68:
	.string	"socklen_t"
.LASF96:
	.string	"next"
.LASF36:
	.string	"_codecvt"
.LASF97:
	.string	"sockfd"
.LASF47:
	.string	"long long int"
.LASF101:
	.string	"servers_details"
.LASF128:
	.string	"total_filenames"
.LASF90:
	.string	"commands_t"
.LASF103:
	.string	"server_sock_fds"
.LASF104:
	.string	"number_of_servers"
.LASF28:
	.string	"_fileno"
.LASF16:
	.string	"_IO_read_end"
.LASF8:
	.string	"long int"
.LASF135:
	.string	"GNU C17 13.3.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF14:
	.string	"_flags"
.LASF22:
	.string	"_IO_buf_end"
.LASF31:
	.string	"_cur_column"
.LASF45:
	.string	"_IO_codecvt"
.LASF30:
	.string	"_old_offset"
.LASF35:
	.string	"_offset"
.LASF53:
	.string	"__pthread_list_t"
.LASF141:
	.string	"main"
.LASF54:
	.string	"__pthread_mutex_s"
.LASF129:
	.string	"line"
.LASF52:
	.string	"__next"
.LASF102:
	.string	"connect_to_info"
.LASF44:
	.string	"_IO_marker"
.LASF105:
	.string	"number_of_available_servers"
.LASF3:
	.string	"unsigned int"
.LASF39:
	.string	"_freeres_buf"
.LASF89:
	.string	"number_of_command"
.LASF123:
	.string	"fprintf"
.LASF98:
	.string	"command"
.LASF76:
	.string	"ai_socktype"
.LASF2:
	.string	"long unsigned int"
.LASF66:
	.string	"__data"
.LASF19:
	.string	"_IO_write_ptr"
.LASF61:
	.string	"__elision"
.LASF5:
	.string	"short unsigned int"
.LASF117:
	.string	"strlen"
.LASF23:
	.string	"_IO_save_base"
.LASF91:
	.string	"serverDetails_t"
.LASF134:
	.string	"line_dup"
.LASF34:
	.string	"_lock"
.LASF29:
	.string	"_flags2"
.LASF41:
	.string	"_mode"
.LASF113:
	.string	"fgets"
.LASF110:
	.string	"pthread_mutex_init"
.LASF143:
	.string	"read_server_conf"
.LASF57:
	.string	"__owner"
.LASF100:
	.string	"command_int"
.LASF85:
	.string	"DELETE"
.LASF139:
	.string	"sscanf"
.LASF99:
	.string	"filename"
.LASF88:
	.string	"HELP"
.LASF116:
	.string	"strndup"
.LASF87:
	.string	"SERVER_INFO"
.LASF20:
	.string	"_IO_write_end"
.LASF77:
	.string	"ai_protocol"
.LASF136:
	.string	"_IO_lock_t"
.LASF49:
	.string	"_IO_FILE"
.LASF131:
	.string	"current"
.LASF92:
	.string	"client_sock_fd"
.LASF50:
	.string	"__pthread_internal_list"
.LASF78:
	.string	"ai_addrlen"
.LASF94:
	.string	"server_ip"
.LASF71:
	.string	"sa_family"
.LASF26:
	.string	"_markers"
.LASF133:
	.string	"dfs_no"
.LASF83:
	.string	"__int128 unsigned"
.LASF4:
	.string	"unsigned char"
.LASF114:
	.string	"cleanup_connection"
.LASF79:
	.string	"ai_addr"
.LASF7:
	.string	"short int"
.LASF46:
	.string	"_IO_wide_data"
.LASF140:
	.string	"__isoc23_sscanf"
.LASF81:
	.string	"ai_next"
.LASF32:
	.string	"_vtable_offset"
.LASF43:
	.string	"FILE"
.LASF121:
	.string	"exit"
.LASF56:
	.string	"__count"
.LASF55:
	.string	"__lock"
.LASF86:
	.string	"EXIT"
.LASF84:
	.string	"long double"
.LASF12:
	.string	"char"
.LASF13:
	.string	"__socklen_t"
.LASF70:
	.string	"sockaddr"
.LASF124:
	.string	"fopen"
.LASF75:
	.string	"ai_family"
.LASF111:
	.string	"fclose"
.LASF11:
	.string	"__off64_t"
.LASF17:
	.string	"_IO_read_base"
.LASF25:
	.string	"_IO_save_end"
.LASF82:
	.string	"__int128"
.LASF115:
	.string	"free"
.LASF67:
	.string	"pthread_mutex_t"
.LASF109:
	.string	"whichcmd"
.LASF60:
	.string	"__spins"
.LASF40:
	.string	"__pad5"
.LASF69:
	.string	"sa_family_t"
.LASF42:
	.string	"_unused2"
.LASF137:
	.string	"stderr"
.LASF126:
	.string	"argv"
.LASF142:
	.string	"status"
.LASF118:
	.string	"strtok_r"
.LASF119:
	.string	"strdup"
.LASF58:
	.string	"__nusers"
.LASF24:
	.string	"_IO_backup_base"
.LASF122:
	.string	"system"
.LASF125:
	.string	"argc"
.LASF72:
	.string	"sa_data"
.LASF38:
	.string	"_freeres_list"
.LASF62:
	.string	"__list"
.LASF80:
	.string	"ai_canonname"
.LASF37:
	.string	"_wide_data"
.LASF108:
	.string	"handle_req"
.LASF59:
	.string	"__kind"
.LASF130:
	.string	"saved_remaining_line"
.LASF106:
	.string	"lock"
.LASF18:
	.string	"_IO_write_base"
.LASF95:
	.string	"dfsno"
.LASF138:
	.string	"print_menu"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/parth/Work/All_data/university/Network System/Assignments/PA4/client"
.LASF0:
	.string	"dfc.c"
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
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
