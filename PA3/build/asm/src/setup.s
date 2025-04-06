	.file	"setup.c"
	.text
.Ltext0:
	.globl	getin_addr
	.type	getin_addr, @function
getin_addr:
.LFB6:
	.file 1 "src/setup.c"
	.loc 1 26 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	.loc 1 27 11
	movq	-8(%rbp), %rax
	movzwl	(%rax), %eax
	.loc 1 27 8
	cmpw	$2, %ax
	jne	.L2
	.loc 1 29 17
	movq	-8(%rbp), %rax
	addq	$4, %rax
	jmp	.L3
.L2:
	.loc 1 31 16
	movq	-8(%rbp), %rax
	movzwl	(%rax), %eax
	.loc 1 31 13
	cmpw	$10, %ax
	jne	.L4
	.loc 1 33 17
	movq	-8(%rbp), %rax
	addq	$8, %rax
	jmp	.L3
.L4:
	.loc 1 35 12
	movl	$0, %eax
.L3:
	.loc 1 36 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	getin_addr, .-getin_addr
	.section	.rodata
	.align 8
.LC0:
	.string	"\033[31m[-] Port Value < 1024 ! keep port value higher than 1024 \n\033[0m"
.LC1:
	.string	"\033[31mgetaddrinfo: %s\n\033[0m"
	.align 8
.LC2:
	.string	"\033[32m[+] getaddrinfo call successful\n\033[0m"
.LC3:
	.string	"\033[31mserver: socket"
	.align 8
.LC4:
	.string	"\033[32m[+] socket call successful\n\033[0m"
.LC5:
	.string	"\033[31msetsockopt"
.LC6:
	.string	"\033[31mserver: bind"
	.align 8
.LC7:
	.string	"\033[31m[-] socket connection failed for server \n\033[0m"
	.align 8
.LC8:
	.string	"\033[32m[+] Server recieving TCP/HTTP1.0 packet to : %s\n\033[0m"
.LC9:
	.string	"listen"
	.text
	.globl	init_socket
	.type	init_socket, @function
init_socket:
.LFB7:
	.loc 1 55 1
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
	.loc 1 55 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 63 5
	leaq	-112(%rbp), %rax
	movl	$48, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 64 21
	movl	$0, -108(%rbp)
	.loc 1 65 23
	movl	$1, -104(%rbp)
	.loc 1 66 20
	movl	$1, -112(%rbp)
	.loc 1 68 11
	movq	-160(%rbp), %rax
	movq	%rax, -120(%rbp)
	.loc 1 70 9
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	.loc 1 70 8
	cmpl	$1024, %eax
	jg	.L6
	.loc 1 72 9
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$67, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	fwrite@PLT
	.loc 1 73 9
	movl	$1, %edi
	call	exit@PLT
.L6:
	.loc 1 79 19
	movq	-152(%rbp), %rax
	leaq	136(%rax), %rcx
	leaq	-112(%rbp), %rdx
	movq	-120(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	getaddrinfo@PLT
	movl	%eax, -132(%rbp)
	.loc 1 79 8
	cmpl	$0, -132(%rbp)
	jns	.L7
	.loc 1 81 9
	movl	-132(%rbp), %eax
	movl	%eax, %edi
	call	gai_strerror@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 82 9
	movl	$1, %edi
	call	exit@PLT
.L7:
	.loc 1 84 5
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 87 15
	movq	-152(%rbp), %rax
	movq	136(%rax), %rax
	movq	%rax, -128(%rbp)
	.loc 1 87 5
	jmp	.L8
.L14:
.LBB2:
	.loc 1 95 23
	movq	-128(%rbp), %rax
	movl	12(%rax), %edx
	movq	-128(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-128(%rbp), %rax
	movl	4(%rax), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	socket@PLT
	movl	%eax, -136(%rbp)
	.loc 1 95 12
	cmpl	$0, -136(%rbp)
	jns	.L9
	.loc 1 97 13
	leaq	.LC3(%rip), %rdi
	call	perror@PLT
	.loc 1 98 13
	jmp	.L10
.L9:
	.loc 1 100 9
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 102 13
	movl	$1, -140(%rbp)
	.loc 1 104 13
	leaq	-140(%rbp), %rdx
	movl	-136(%rbp), %eax
	movl	$4, %r8d
	movq	%rdx, %rcx
	movl	$2, %edx
	movl	$1, %esi
	movl	%eax, %edi
	call	setsockopt@PLT
	.loc 1 104 12
	cmpl	$-1, %eax
	jne	.L11
	.loc 1 106 13
	leaq	.LC5(%rip), %rdi
	call	perror@PLT
	.loc 1 107 13
	movl	$1, %edi
	call	exit@PLT
.L11:
	.loc 1 114 13
	movq	-128(%rbp), %rax
	movl	16(%rax), %edx
	.loc 1 114 30
	movq	-128(%rbp), %rax
	movq	24(%rax), %rax
	.loc 1 114 13
	movq	%rax, %rcx
	movl	-136(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	bind@PLT
	.loc 1 114 12
	testl	%eax, %eax
	jns	.L18
	.loc 1 116 13
	movl	-136(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 117 13
	leaq	.LC6(%rip), %rdi
	call	perror@PLT
	.loc 1 118 13
	nop
.L10:
.LBE2:
	.loc 1 87 53 discriminator 1
	movq	-128(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -128(%rbp)
.L8:
	.loc 1 87 5 discriminator 1
	cmpq	$0, -128(%rbp)
	jne	.L14
	jmp	.L13
.L18:
.LBB3:
	.loc 1 121 9
	nop
.L13:
.LBE3:
	.loc 1 125 8
	cmpq	$0, -128(%rbp)
	jne	.L15
	.loc 1 127 9
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$50, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rdi
	call	fwrite@PLT
	.loc 1 128 9
	movl	-136(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 129 9
	movl	$1, %edi
	call	exit@PLT
.L15:
	.loc 1 131 16
	movq	-152(%rbp), %rax
	movl	-136(%rbp), %edx
	movl	%edx, (%rax)
	.loc 1 134 32
	movq	-128(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	getin_addr
	movq	%rax, %rsi
	.loc 1 134 5
	movq	-128(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-64(%rbp), %rdx
	movl	$46, %ecx
	movl	%eax, %edi
	call	inet_ntop@PLT
	.loc 1 135 5
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 137 5
	movq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	freeaddrinfo@PLT
	.loc 1 139 9
	movl	-136(%rbp), %eax
	movl	$20, %esi
	movl	%eax, %edi
	call	listen@PLT
	.loc 1 139 8
	testl	%eax, %eax
	jns	.L19
	.loc 1 141 9
	leaq	.LC9(%rip), %rdi
	call	perror@PLT
	.loc 1 142 9
	movl	$1, %edi
	call	exit@PLT
.L19:
	.loc 1 144 1
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	init_socket, .-init_socket
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h"
	.file 9 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"
	.file 10 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h"
	.file 11 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.file 12 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h"
	.file 13 "/usr/include/unistd.h"
	.file 14 "/usr/include/x86_64-linux-gnu/bits/getopt_core.h"
	.file 15 "/usr/include/errno.h"
	.file 16 "/usr/include/x86_64-linux-gnu/bits/sockaddr.h"
	.file 17 "/usr/include/x86_64-linux-gnu/bits/socket.h"
	.file 18 "/usr/include/netinet/in.h"
	.file 19 "/usr/include/netdb.h"
	.file 20 "/usr/include/x86_64-linux-gnu/bits/stat.h"
	.file 21 "/usr/include/signal.h"
	.file 22 "/usr/include/time.h"
	.file 23 "./common.h"
	.file 24 "/usr/include/x86_64-linux-gnu/bits/socket_type.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xdc9
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF203
	.byte	0xc
	.long	.LASF204
	.long	.LASF205
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
	.uleb128 0x2
	.long	.LASF26
	.byte	0x3
	.byte	0xd1
	.byte	0x17
	.long	0x40
	.uleb128 0x8
	.long	.LASF68
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x2e4
	.uleb128 0x9
	.long	.LASF27
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x7d
	.byte	0
	.uleb128 0x9
	.long	.LASF28
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0x13f
	.byte	0x8
	.uleb128 0x9
	.long	.LASF29
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0x13f
	.byte	0x10
	.uleb128 0x9
	.long	.LASF30
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0x13f
	.byte	0x18
	.uleb128 0x9
	.long	.LASF31
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0x13f
	.byte	0x20
	.uleb128 0x9
	.long	.LASF32
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0x13f
	.byte	0x28
	.uleb128 0x9
	.long	.LASF33
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0x13f
	.byte	0x30
	.uleb128 0x9
	.long	.LASF34
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0x13f
	.byte	0x38
	.uleb128 0x9
	.long	.LASF35
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0x13f
	.byte	0x40
	.uleb128 0x9
	.long	.LASF36
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0x13f
	.byte	0x48
	.uleb128 0x9
	.long	.LASF37
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0x13f
	.byte	0x50
	.uleb128 0x9
	.long	.LASF38
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0x13f
	.byte	0x58
	.uleb128 0x9
	.long	.LASF39
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x2fd
	.byte	0x60
	.uleb128 0x9
	.long	.LASF40
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x303
	.byte	0x68
	.uleb128 0x9
	.long	.LASF41
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x7d
	.byte	0x70
	.uleb128 0x9
	.long	.LASF42
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x7d
	.byte	0x74
	.uleb128 0x9
	.long	.LASF43
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0xeb
	.byte	0x78
	.uleb128 0x9
	.long	.LASF44
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x50
	.byte	0x80
	.uleb128 0x9
	.long	.LASF45
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x57
	.byte	0x82
	.uleb128 0x9
	.long	.LASF46
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x309
	.byte	0x83
	.uleb128 0x9
	.long	.LASF47
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x319
	.byte	0x88
	.uleb128 0x9
	.long	.LASF48
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0xf7
	.byte	0x90
	.uleb128 0x9
	.long	.LASF49
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x324
	.byte	0x98
	.uleb128 0x9
	.long	.LASF50
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x32f
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF51
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x303
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF52
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0x47
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF53
	.byte	0x4
	.byte	0x5f
	.byte	0xa
	.long	0x2d
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF54
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x7d
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF55
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x335
	.byte	0xc4
	.byte	0
	.uleb128 0x2
	.long	.LASF56
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0x15d
	.uleb128 0xa
	.long	.LASF206
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0xb
	.long	.LASF57
	.uleb128 0x6
	.byte	0x8
	.long	0x2f8
	.uleb128 0x6
	.byte	0x8
	.long	0x15d
	.uleb128 0xc
	.long	0x145
	.long	0x319
	.uleb128 0xd
	.long	0x39
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x2f0
	.uleb128 0xb
	.long	.LASF58
	.uleb128 0x6
	.byte	0x8
	.long	0x31f
	.uleb128 0xb
	.long	.LASF59
	.uleb128 0x6
	.byte	0x8
	.long	0x32a
	.uleb128 0xc
	.long	0x145
	.long	0x345
	.uleb128 0xd
	.long	0x39
	.byte	0x13
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x14c
	.uleb128 0x7
	.long	0x345
	.uleb128 0xe
	.long	0x345
	.uleb128 0xf
	.long	.LASF60
	.byte	0x6
	.byte	0x89
	.byte	0xe
	.long	0x361
	.uleb128 0x6
	.byte	0x8
	.long	0x2e4
	.uleb128 0xf
	.long	.LASF61
	.byte	0x6
	.byte	0x8a
	.byte	0xe
	.long	0x361
	.uleb128 0xf
	.long	.LASF62
	.byte	0x6
	.byte	0x8b
	.byte	0xe
	.long	0x361
	.uleb128 0xf
	.long	.LASF63
	.byte	0x7
	.byte	0x1a
	.byte	0xc
	.long	0x7d
	.uleb128 0xc
	.long	0x34b
	.long	0x396
	.uleb128 0x10
	.byte	0
	.uleb128 0x7
	.long	0x38b
	.uleb128 0xf
	.long	.LASF64
	.byte	0x7
	.byte	0x1b
	.byte	0x1a
	.long	0x396
	.uleb128 0xf
	.long	.LASF65
	.byte	0x7
	.byte	0x1e
	.byte	0xc
	.long	0x7d
	.uleb128 0xf
	.long	.LASF66
	.byte	0x7
	.byte	0x1f
	.byte	0x1a
	.long	0x396
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF67
	.uleb128 0x8
	.long	.LASF69
	.byte	0x10
	.byte	0x8
	.byte	0xa
	.byte	0x8
	.long	0x3ee
	.uleb128 0x9
	.long	.LASF70
	.byte	0x8
	.byte	0xc
	.byte	0xc
	.long	0x103
	.byte	0
	.uleb128 0x9
	.long	.LASF71
	.byte	0x8
	.byte	0x10
	.byte	0x15
	.long	0x133
	.byte	0x8
	.byte	0
	.uleb128 0x8
	.long	.LASF72
	.byte	0x10
	.byte	0x9
	.byte	0x31
	.byte	0x10
	.long	0x416
	.uleb128 0x9
	.long	.LASF73
	.byte	0x9
	.byte	0x33
	.byte	0x23
	.long	0x416
	.byte	0
	.uleb128 0x9
	.long	.LASF74
	.byte	0x9
	.byte	0x34
	.byte	0x23
	.long	0x416
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x3ee
	.uleb128 0x2
	.long	.LASF75
	.byte	0x9
	.byte	0x35
	.byte	0x3
	.long	0x3ee
	.uleb128 0x8
	.long	.LASF76
	.byte	0x28
	.byte	0xa
	.byte	0x16
	.byte	0x8
	.long	0x49e
	.uleb128 0x9
	.long	.LASF77
	.byte	0xa
	.byte	0x18
	.byte	0x7
	.long	0x7d
	.byte	0
	.uleb128 0x9
	.long	.LASF78
	.byte	0xa
	.byte	0x19
	.byte	0x10
	.long	0x40
	.byte	0x4
	.uleb128 0x9
	.long	.LASF79
	.byte	0xa
	.byte	0x1a
	.byte	0x7
	.long	0x7d
	.byte	0x8
	.uleb128 0x9
	.long	.LASF80
	.byte	0xa
	.byte	0x1c
	.byte	0x10
	.long	0x40
	.byte	0xc
	.uleb128 0x9
	.long	.LASF81
	.byte	0xa
	.byte	0x20
	.byte	0x7
	.long	0x7d
	.byte	0x10
	.uleb128 0x9
	.long	.LASF82
	.byte	0xa
	.byte	0x22
	.byte	0x9
	.long	0x6a
	.byte	0x14
	.uleb128 0x9
	.long	.LASF83
	.byte	0xa
	.byte	0x23
	.byte	0x9
	.long	0x6a
	.byte	0x16
	.uleb128 0x9
	.long	.LASF84
	.byte	0xa
	.byte	0x24
	.byte	0x14
	.long	0x41c
	.byte	0x18
	.byte	0
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF85
	.uleb128 0x11
	.byte	0x28
	.byte	0xb
	.byte	0x43
	.byte	0x9
	.long	0x4d3
	.uleb128 0x12
	.long	.LASF86
	.byte	0xb
	.byte	0x45
	.byte	0x1c
	.long	0x428
	.uleb128 0x12
	.long	.LASF87
	.byte	0xb
	.byte	0x46
	.byte	0x8
	.long	0x4d3
	.uleb128 0x12
	.long	.LASF88
	.byte	0xb
	.byte	0x47
	.byte	0xc
	.long	0x90
	.byte	0
	.uleb128 0xc
	.long	0x145
	.long	0x4e3
	.uleb128 0xd
	.long	0x39
	.byte	0x27
	.byte	0
	.uleb128 0x2
	.long	.LASF89
	.byte	0xb
	.byte	0x48
	.byte	0x3
	.long	0x4a5
	.uleb128 0x2
	.long	.LASF90
	.byte	0xc
	.byte	0x18
	.byte	0x13
	.long	0x5e
	.uleb128 0x2
	.long	.LASF91
	.byte	0xc
	.byte	0x19
	.byte	0x14
	.long	0x71
	.uleb128 0x2
	.long	.LASF92
	.byte	0xc
	.byte	0x1a
	.byte	0x14
	.long	0x84
	.uleb128 0x13
	.long	.LASF93
	.byte	0xd
	.value	0x112
	.byte	0x15
	.long	0x151
	.uleb128 0x14
	.long	.LASF94
	.byte	0xd
	.value	0x21f
	.byte	0xf
	.long	0x52d
	.uleb128 0x6
	.byte	0x8
	.long	0x13f
	.uleb128 0x14
	.long	.LASF95
	.byte	0xd
	.value	0x221
	.byte	0xf
	.long	0x52d
	.uleb128 0xf
	.long	.LASF96
	.byte	0xe
	.byte	0x24
	.byte	0xe
	.long	0x13f
	.uleb128 0xf
	.long	.LASF97
	.byte	0xe
	.byte	0x32
	.byte	0xc
	.long	0x7d
	.uleb128 0xf
	.long	.LASF98
	.byte	0xe
	.byte	0x37
	.byte	0xc
	.long	0x7d
	.uleb128 0xf
	.long	.LASF99
	.byte	0xe
	.byte	0x3b
	.byte	0xc
	.long	0x7d
	.uleb128 0xf
	.long	.LASF100
	.byte	0xf
	.byte	0x2d
	.byte	0xe
	.long	0x13f
	.uleb128 0xf
	.long	.LASF101
	.byte	0xf
	.byte	0x2e
	.byte	0xe
	.long	0x13f
	.uleb128 0x15
	.long	.LASF207
	.byte	0x7
	.byte	0x4
	.long	0x40
	.byte	0x18
	.byte	0x18
	.byte	0x6
	.long	0x5d5
	.uleb128 0x16
	.long	.LASF102
	.byte	0x1
	.uleb128 0x16
	.long	.LASF103
	.byte	0x2
	.uleb128 0x16
	.long	.LASF104
	.byte	0x3
	.uleb128 0x16
	.long	.LASF105
	.byte	0x4
	.uleb128 0x16
	.long	.LASF106
	.byte	0x5
	.uleb128 0x16
	.long	.LASF107
	.byte	0x6
	.uleb128 0x16
	.long	.LASF108
	.byte	0xa
	.uleb128 0x17
	.long	.LASF109
	.long	0x80000
	.uleb128 0x18
	.long	.LASF110
	.value	0x800
	.byte	0
	.uleb128 0x2
	.long	.LASF111
	.byte	0x10
	.byte	0x1c
	.byte	0x1c
	.long	0x50
	.uleb128 0x8
	.long	.LASF112
	.byte	0x10
	.byte	0x11
	.byte	0xb2
	.byte	0x8
	.long	0x609
	.uleb128 0x9
	.long	.LASF113
	.byte	0x11
	.byte	0xb4
	.byte	0x5
	.long	0x5d5
	.byte	0
	.uleb128 0x9
	.long	.LASF114
	.byte	0x11
	.byte	0xb5
	.byte	0xa
	.long	0x60e
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	0x5e1
	.uleb128 0xc
	.long	0x145
	.long	0x61e
	.uleb128 0xd
	.long	0x39
	.byte	0xd
	.byte	0
	.uleb128 0x8
	.long	.LASF115
	.byte	0x80
	.byte	0x11
	.byte	0xbf
	.byte	0x8
	.long	0x653
	.uleb128 0x9
	.long	.LASF116
	.byte	0x11
	.byte	0xc1
	.byte	0x5
	.long	0x5d5
	.byte	0
	.uleb128 0x9
	.long	.LASF117
	.byte	0x11
	.byte	0xc2
	.byte	0xa
	.long	0x653
	.byte	0x2
	.uleb128 0x9
	.long	.LASF118
	.byte	0x11
	.byte	0xc3
	.byte	0x14
	.long	0x39
	.byte	0x78
	.byte	0
	.uleb128 0xc
	.long	0x145
	.long	0x663
	.uleb128 0xd
	.long	0x39
	.byte	0x75
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x5e1
	.uleb128 0xe
	.long	0x663
	.uleb128 0xb
	.long	.LASF119
	.uleb128 0x7
	.long	0x66e
	.uleb128 0x6
	.byte	0x8
	.long	0x66e
	.uleb128 0xe
	.long	0x678
	.uleb128 0xb
	.long	.LASF120
	.uleb128 0x7
	.long	0x683
	.uleb128 0x6
	.byte	0x8
	.long	0x683
	.uleb128 0xe
	.long	0x68d
	.uleb128 0xb
	.long	.LASF121
	.uleb128 0x7
	.long	0x698
	.uleb128 0x6
	.byte	0x8
	.long	0x698
	.uleb128 0xe
	.long	0x6a2
	.uleb128 0xb
	.long	.LASF122
	.uleb128 0x7
	.long	0x6ad
	.uleb128 0x6
	.byte	0x8
	.long	0x6ad
	.uleb128 0xe
	.long	0x6b7
	.uleb128 0x8
	.long	.LASF123
	.byte	0x10
	.byte	0x12
	.byte	0xee
	.byte	0x8
	.long	0x704
	.uleb128 0x9
	.long	.LASF124
	.byte	0x12
	.byte	0xf0
	.byte	0x5
	.long	0x5d5
	.byte	0
	.uleb128 0x9
	.long	.LASF125
	.byte	0x12
	.byte	0xf1
	.byte	0xf
	.long	0x8ab
	.byte	0x2
	.uleb128 0x9
	.long	.LASF126
	.byte	0x12
	.byte	0xf2
	.byte	0x14
	.long	0x890
	.byte	0x4
	.uleb128 0x9
	.long	.LASF127
	.byte	0x12
	.byte	0xf5
	.byte	0x13
	.long	0x94d
	.byte	0x8
	.byte	0
	.uleb128 0x7
	.long	0x6c2
	.uleb128 0x6
	.byte	0x8
	.long	0x6c2
	.uleb128 0xe
	.long	0x709
	.uleb128 0x8
	.long	.LASF128
	.byte	0x1c
	.byte	0x12
	.byte	0xfd
	.byte	0x8
	.long	0x767
	.uleb128 0x9
	.long	.LASF129
	.byte	0x12
	.byte	0xff
	.byte	0x5
	.long	0x5d5
	.byte	0
	.uleb128 0x19
	.long	.LASF130
	.byte	0x12
	.value	0x100
	.byte	0xf
	.long	0x8ab
	.byte	0x2
	.uleb128 0x19
	.long	.LASF131
	.byte	0x12
	.value	0x101
	.byte	0xe
	.long	0x507
	.byte	0x4
	.uleb128 0x19
	.long	.LASF132
	.byte	0x12
	.value	0x102
	.byte	0x15
	.long	0x915
	.byte	0x8
	.uleb128 0x19
	.long	.LASF133
	.byte	0x12
	.value	0x103
	.byte	0xe
	.long	0x507
	.byte	0x18
	.byte	0
	.uleb128 0x7
	.long	0x714
	.uleb128 0x6
	.byte	0x8
	.long	0x714
	.uleb128 0xe
	.long	0x76c
	.uleb128 0xb
	.long	.LASF134
	.uleb128 0x7
	.long	0x777
	.uleb128 0x6
	.byte	0x8
	.long	0x777
	.uleb128 0xe
	.long	0x781
	.uleb128 0xb
	.long	.LASF135
	.uleb128 0x7
	.long	0x78c
	.uleb128 0x6
	.byte	0x8
	.long	0x78c
	.uleb128 0xe
	.long	0x796
	.uleb128 0xb
	.long	.LASF136
	.uleb128 0x7
	.long	0x7a1
	.uleb128 0x6
	.byte	0x8
	.long	0x7a1
	.uleb128 0xe
	.long	0x7ab
	.uleb128 0xb
	.long	.LASF137
	.uleb128 0x7
	.long	0x7b6
	.uleb128 0x6
	.byte	0x8
	.long	0x7b6
	.uleb128 0xe
	.long	0x7c0
	.uleb128 0xb
	.long	.LASF138
	.uleb128 0x7
	.long	0x7cb
	.uleb128 0x6
	.byte	0x8
	.long	0x7cb
	.uleb128 0xe
	.long	0x7d5
	.uleb128 0xb
	.long	.LASF139
	.uleb128 0x7
	.long	0x7e0
	.uleb128 0x6
	.byte	0x8
	.long	0x7e0
	.uleb128 0xe
	.long	0x7ea
	.uleb128 0x6
	.byte	0x8
	.long	0x609
	.uleb128 0xe
	.long	0x7f5
	.uleb128 0x6
	.byte	0x8
	.long	0x673
	.uleb128 0xe
	.long	0x800
	.uleb128 0x6
	.byte	0x8
	.long	0x688
	.uleb128 0xe
	.long	0x80b
	.uleb128 0x6
	.byte	0x8
	.long	0x69d
	.uleb128 0xe
	.long	0x816
	.uleb128 0x6
	.byte	0x8
	.long	0x6b2
	.uleb128 0xe
	.long	0x821
	.uleb128 0x6
	.byte	0x8
	.long	0x704
	.uleb128 0xe
	.long	0x82c
	.uleb128 0x6
	.byte	0x8
	.long	0x767
	.uleb128 0xe
	.long	0x837
	.uleb128 0x6
	.byte	0x8
	.long	0x77c
	.uleb128 0xe
	.long	0x842
	.uleb128 0x6
	.byte	0x8
	.long	0x791
	.uleb128 0xe
	.long	0x84d
	.uleb128 0x6
	.byte	0x8
	.long	0x7a6
	.uleb128 0xe
	.long	0x858
	.uleb128 0x6
	.byte	0x8
	.long	0x7bb
	.uleb128 0xe
	.long	0x863
	.uleb128 0x6
	.byte	0x8
	.long	0x7d0
	.uleb128 0xe
	.long	0x86e
	.uleb128 0x6
	.byte	0x8
	.long	0x7e5
	.uleb128 0xe
	.long	0x879
	.uleb128 0x2
	.long	.LASF140
	.byte	0x12
	.byte	0x1e
	.byte	0x12
	.long	0x507
	.uleb128 0x8
	.long	.LASF141
	.byte	0x4
	.byte	0x12
	.byte	0x1f
	.byte	0x8
	.long	0x8ab
	.uleb128 0x9
	.long	.LASF142
	.byte	0x12
	.byte	0x21
	.byte	0xf
	.long	0x884
	.byte	0
	.byte	0
	.uleb128 0x2
	.long	.LASF143
	.byte	0x12
	.byte	0x77
	.byte	0x12
	.long	0x4fb
	.uleb128 0x11
	.byte	0x10
	.byte	0x12
	.byte	0xd6
	.byte	0x5
	.long	0x8e5
	.uleb128 0x12
	.long	.LASF144
	.byte	0x12
	.byte	0xd8
	.byte	0xa
	.long	0x8e5
	.uleb128 0x12
	.long	.LASF145
	.byte	0x12
	.byte	0xd9
	.byte	0xb
	.long	0x8f5
	.uleb128 0x12
	.long	.LASF146
	.byte	0x12
	.byte	0xda
	.byte	0xb
	.long	0x905
	.byte	0
	.uleb128 0xc
	.long	0x4ef
	.long	0x8f5
	.uleb128 0xd
	.long	0x39
	.byte	0xf
	.byte	0
	.uleb128 0xc
	.long	0x4fb
	.long	0x905
	.uleb128 0xd
	.long	0x39
	.byte	0x7
	.byte	0
	.uleb128 0xc
	.long	0x507
	.long	0x915
	.uleb128 0xd
	.long	0x39
	.byte	0x3
	.byte	0
	.uleb128 0x8
	.long	.LASF147
	.byte	0x10
	.byte	0x12
	.byte	0xd4
	.byte	0x8
	.long	0x930
	.uleb128 0x9
	.long	.LASF148
	.byte	0x12
	.byte	0xdb
	.byte	0x9
	.long	0x8b7
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x915
	.uleb128 0xf
	.long	.LASF149
	.byte	0x12
	.byte	0xe4
	.byte	0x1e
	.long	0x930
	.uleb128 0xf
	.long	.LASF150
	.byte	0x12
	.byte	0xe5
	.byte	0x1e
	.long	0x930
	.uleb128 0xc
	.long	0x49
	.long	0x95d
	.uleb128 0xd
	.long	0x39
	.byte	0x7
	.byte	0
	.uleb128 0x1a
	.long	.LASF151
	.byte	0x30
	.byte	0x13
	.value	0x235
	.byte	0x8
	.long	0x9dc
	.uleb128 0x19
	.long	.LASF152
	.byte	0x13
	.value	0x237
	.byte	0x7
	.long	0x7d
	.byte	0
	.uleb128 0x19
	.long	.LASF153
	.byte	0x13
	.value	0x238
	.byte	0x7
	.long	0x7d
	.byte	0x4
	.uleb128 0x19
	.long	.LASF154
	.byte	0x13
	.value	0x239
	.byte	0x7
	.long	0x7d
	.byte	0x8
	.uleb128 0x19
	.long	.LASF155
	.byte	0x13
	.value	0x23a
	.byte	0x7
	.long	0x7d
	.byte	0xc
	.uleb128 0x19
	.long	.LASF156
	.byte	0x13
	.value	0x23b
	.byte	0xd
	.long	0x513
	.byte	0x10
	.uleb128 0x19
	.long	.LASF157
	.byte	0x13
	.value	0x23c
	.byte	0x14
	.long	0x663
	.byte	0x18
	.uleb128 0x19
	.long	.LASF158
	.byte	0x13
	.value	0x23d
	.byte	0x9
	.long	0x13f
	.byte	0x20
	.uleb128 0x19
	.long	.LASF159
	.byte	0x13
	.value	0x23e
	.byte	0x14
	.long	0x9dc
	.byte	0x28
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x95d
	.uleb128 0x8
	.long	.LASF160
	.byte	0x90
	.byte	0x14
	.byte	0x2e
	.byte	0x8
	.long	0xab3
	.uleb128 0x9
	.long	.LASF161
	.byte	0x14
	.byte	0x30
	.byte	0xd
	.long	0x97
	.byte	0
	.uleb128 0x9
	.long	.LASF162
	.byte	0x14
	.byte	0x35
	.byte	0xd
	.long	0xbb
	.byte	0x8
	.uleb128 0x9
	.long	.LASF163
	.byte	0x14
	.byte	0x3d
	.byte	0xf
	.long	0xdf
	.byte	0x10
	.uleb128 0x9
	.long	.LASF164
	.byte	0x14
	.byte	0x3e
	.byte	0xe
	.long	0xd3
	.byte	0x18
	.uleb128 0x9
	.long	.LASF165
	.byte	0x14
	.byte	0x40
	.byte	0xd
	.long	0xa3
	.byte	0x1c
	.uleb128 0x9
	.long	.LASF166
	.byte	0x14
	.byte	0x41
	.byte	0xd
	.long	0xaf
	.byte	0x20
	.uleb128 0x9
	.long	.LASF167
	.byte	0x14
	.byte	0x43
	.byte	0x9
	.long	0x7d
	.byte	0x24
	.uleb128 0x9
	.long	.LASF168
	.byte	0x14
	.byte	0x45
	.byte	0xd
	.long	0x97
	.byte	0x28
	.uleb128 0x9
	.long	.LASF169
	.byte	0x14
	.byte	0x4a
	.byte	0xd
	.long	0xeb
	.byte	0x30
	.uleb128 0x9
	.long	.LASF170
	.byte	0x14
	.byte	0x4e
	.byte	0x11
	.long	0x10f
	.byte	0x38
	.uleb128 0x9
	.long	.LASF171
	.byte	0x14
	.byte	0x50
	.byte	0x10
	.long	0x11b
	.byte	0x40
	.uleb128 0x9
	.long	.LASF172
	.byte	0x14
	.byte	0x5b
	.byte	0x15
	.long	0x3c6
	.byte	0x48
	.uleb128 0x9
	.long	.LASF173
	.byte	0x14
	.byte	0x5c
	.byte	0x15
	.long	0x3c6
	.byte	0x58
	.uleb128 0x9
	.long	.LASF174
	.byte	0x14
	.byte	0x5d
	.byte	0x15
	.long	0x3c6
	.byte	0x68
	.uleb128 0x9
	.long	.LASF175
	.byte	0x14
	.byte	0x6a
	.byte	0x17
	.long	0xab3
	.byte	0x78
	.byte	0
	.uleb128 0xc
	.long	0x133
	.long	0xac3
	.uleb128 0xd
	.long	0x39
	.byte	0x2
	.byte	0
	.uleb128 0x8
	.long	.LASF176
	.byte	0x90
	.byte	0x14
	.byte	0x77
	.byte	0x8
	.long	0xb94
	.uleb128 0x9
	.long	.LASF161
	.byte	0x14
	.byte	0x79
	.byte	0xd
	.long	0x97
	.byte	0
	.uleb128 0x9
	.long	.LASF162
	.byte	0x14
	.byte	0x7b
	.byte	0xf
	.long	0xc7
	.byte	0x8
	.uleb128 0x9
	.long	.LASF163
	.byte	0x14
	.byte	0x7c
	.byte	0xf
	.long	0xdf
	.byte	0x10
	.uleb128 0x9
	.long	.LASF164
	.byte	0x14
	.byte	0x7d
	.byte	0xe
	.long	0xd3
	.byte	0x18
	.uleb128 0x9
	.long	.LASF165
	.byte	0x14
	.byte	0x84
	.byte	0xd
	.long	0xa3
	.byte	0x1c
	.uleb128 0x9
	.long	.LASF166
	.byte	0x14
	.byte	0x85
	.byte	0xd
	.long	0xaf
	.byte	0x20
	.uleb128 0x9
	.long	.LASF167
	.byte	0x14
	.byte	0x87
	.byte	0x9
	.long	0x7d
	.byte	0x24
	.uleb128 0x9
	.long	.LASF168
	.byte	0x14
	.byte	0x88
	.byte	0xd
	.long	0x97
	.byte	0x28
	.uleb128 0x9
	.long	.LASF169
	.byte	0x14
	.byte	0x89
	.byte	0xd
	.long	0xeb
	.byte	0x30
	.uleb128 0x9
	.long	.LASF170
	.byte	0x14
	.byte	0x8f
	.byte	0x11
	.long	0x10f
	.byte	0x38
	.uleb128 0x9
	.long	.LASF171
	.byte	0x14
	.byte	0x90
	.byte	0x12
	.long	0x127
	.byte	0x40
	.uleb128 0x9
	.long	.LASF172
	.byte	0x14
	.byte	0x98
	.byte	0x15
	.long	0x3c6
	.byte	0x48
	.uleb128 0x9
	.long	.LASF173
	.byte	0x14
	.byte	0x99
	.byte	0x15
	.long	0x3c6
	.byte	0x58
	.uleb128 0x9
	.long	.LASF174
	.byte	0x14
	.byte	0x9a
	.byte	0x15
	.long	0x3c6
	.byte	0x68
	.uleb128 0x9
	.long	.LASF175
	.byte	0x14
	.byte	0xa4
	.byte	0x17
	.long	0xab3
	.byte	0x78
	.byte	0
	.uleb128 0xc
	.long	0x34b
	.long	0xba4
	.uleb128 0xd
	.long	0x39
	.byte	0x40
	.byte	0
	.uleb128 0x7
	.long	0xb94
	.uleb128 0x14
	.long	.LASF177
	.byte	0x15
	.value	0x11e
	.byte	0x1a
	.long	0xba4
	.uleb128 0x14
	.long	.LASF178
	.byte	0x15
	.value	0x11f
	.byte	0x1a
	.long	0xba4
	.uleb128 0xc
	.long	0x13f
	.long	0xbd3
	.uleb128 0xd
	.long	0x39
	.byte	0x1
	.byte	0
	.uleb128 0xf
	.long	.LASF179
	.byte	0x16
	.byte	0x9f
	.byte	0xe
	.long	0xbc3
	.uleb128 0xf
	.long	.LASF180
	.byte	0x16
	.byte	0xa0
	.byte	0xc
	.long	0x7d
	.uleb128 0xf
	.long	.LASF181
	.byte	0x16
	.byte	0xa1
	.byte	0x11
	.long	0x90
	.uleb128 0xf
	.long	.LASF182
	.byte	0x16
	.byte	0xa6
	.byte	0xe
	.long	0xbc3
	.uleb128 0xf
	.long	.LASF183
	.byte	0x16
	.byte	0xae
	.byte	0xc
	.long	0x7d
	.uleb128 0xf
	.long	.LASF184
	.byte	0x16
	.byte	0xaf
	.byte	0x11
	.long	0x90
	.uleb128 0x14
	.long	.LASF185
	.byte	0x16
	.value	0x112
	.byte	0xc
	.long	0x7d
	.uleb128 0x6
	.byte	0x8
	.long	0x9e2
	.uleb128 0xe
	.long	0xc28
	.uleb128 0x6
	.byte	0x8
	.long	0xac3
	.uleb128 0xe
	.long	0xc33
	.uleb128 0x1b
	.byte	0xd0
	.byte	0x17
	.byte	0xe2
	.byte	0x9
	.long	0xcca
	.uleb128 0x9
	.long	.LASF186
	.byte	0x17
	.byte	0xe4
	.byte	0x9
	.long	0x7d
	.byte	0
	.uleb128 0x9
	.long	.LASF187
	.byte	0x17
	.byte	0xe5
	.byte	0x9
	.long	0x7d
	.byte	0x4
	.uleb128 0x9
	.long	.LASF188
	.byte	0x17
	.byte	0xe6
	.byte	0x1d
	.long	0x61e
	.byte	0x8
	.uleb128 0x9
	.long	.LASF189
	.byte	0x17
	.byte	0xe7
	.byte	0x16
	.long	0x9dc
	.byte	0x88
	.uleb128 0x9
	.long	.LASF190
	.byte	0x17
	.byte	0xe8
	.byte	0x9
	.long	0x7d
	.byte	0x90
	.uleb128 0x9
	.long	.LASF191
	.byte	0x17
	.byte	0xe9
	.byte	0x9
	.long	0x7d
	.byte	0x94
	.uleb128 0x9
	.long	.LASF192
	.byte	0x17
	.byte	0xea
	.byte	0x9
	.long	0x7d
	.byte	0x98
	.uleb128 0x9
	.long	.LASF193
	.byte	0x17
	.byte	0xeb
	.byte	0x9
	.long	0x7d
	.byte	0x9c
	.uleb128 0x9
	.long	.LASF194
	.byte	0x17
	.byte	0xec
	.byte	0x9
	.long	0x7d
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF195
	.byte	0x17
	.byte	0xed
	.byte	0x15
	.long	0x4e3
	.byte	0xa8
	.byte	0
	.uleb128 0x2
	.long	.LASF196
	.byte	0x17
	.byte	0xee
	.byte	0x3
	.long	0xc3e
	.uleb128 0x1c
	.long	.LASF201
	.byte	0x1
	.byte	0x36
	.byte	0x6
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0xd89
	.uleb128 0x1d
	.string	"sd"
	.byte	0x1
	.byte	0x36
	.byte	0x21
	.long	0xd89
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x1e
	.long	.LASF194
	.byte	0x1
	.byte	0x36
	.byte	0x2b
	.long	0x13f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x1f
	.long	.LASF197
	.byte	0x1
	.byte	0x38
	.byte	0x15
	.long	0x95d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x1f
	.long	.LASF198
	.byte	0x1
	.byte	0x38
	.byte	0x1d
	.long	0x9dc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x20
	.string	"ip"
	.byte	0x1
	.byte	0x39
	.byte	0xa
	.long	0xd8f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1f
	.long	.LASF199
	.byte	0x1
	.byte	0x3b
	.byte	0x9
	.long	0x7d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -148
	.uleb128 0x1f
	.long	.LASF186
	.byte	0x1
	.byte	0x3c
	.byte	0x9
	.long	0x7d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x1f
	.long	.LASF200
	.byte	0x1
	.byte	0x44
	.byte	0xb
	.long	0x13f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x21
	.long	.Ldebug_ranges0+0
	.uleb128 0x20
	.string	"yes"
	.byte	0x1
	.byte	0x66
	.byte	0xd
	.long	0x7d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -156
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xcca
	.uleb128 0xc
	.long	0x145
	.long	0xd9f
	.uleb128 0xd
	.long	0x39
	.byte	0x2d
	.byte	0
	.uleb128 0x22
	.long	.LASF202
	.byte	0x1
	.byte	0x19
	.byte	0x7
	.long	0x47
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1d
	.string	"sa"
	.byte	0x1
	.byte	0x19
	.byte	0x23
	.long	0x663
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0x16
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
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
	.uleb128 0x2117
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
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB2-.Ltext0
	.quad	.LBE2-.Ltext0
	.quad	.LBB3-.Ltext0
	.quad	.LBE3-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF161:
	.string	"st_dev"
.LASF18:
	.string	"__off_t"
.LASF13:
	.string	"__gid_t"
.LASF28:
	.string	"_IO_read_ptr"
.LASF183:
	.string	"daylight"
.LASF40:
	.string	"_chain"
.LASF174:
	.string	"st_ctim"
.LASF152:
	.string	"ai_flags"
.LASF200:
	.string	"server_port"
.LASF148:
	.string	"__in6_u"
.LASF5:
	.string	"size_t"
.LASF73:
	.string	"__prev"
.LASF88:
	.string	"__align"
.LASF46:
	.string	"_shortbuf"
.LASF151:
	.string	"addrinfo"
.LASF6:
	.string	"__uint8_t"
.LASF87:
	.string	"__size"
.LASF34:
	.string	"_IO_buf_base"
.LASF110:
	.string	"SOCK_NONBLOCK"
.LASF85:
	.string	"long long unsigned int"
.LASF140:
	.string	"in_addr_t"
.LASF74:
	.string	"__next"
.LASF188:
	.string	"client_info"
.LASF93:
	.string	"socklen_t"
.LASF135:
	.string	"sockaddr_ipx"
.LASF49:
	.string	"_codecvt"
.LASF160:
	.string	"stat"
.LASF67:
	.string	"long long int"
.LASF4:
	.string	"signed char"
.LASF199:
	.string	"status"
.LASF134:
	.string	"sockaddr_inarp"
.LASF186:
	.string	"sockfd"
.LASF16:
	.string	"__mode_t"
.LASF201:
	.string	"init_socket"
.LASF41:
	.string	"_fileno"
.LASF29:
	.string	"_IO_read_end"
.LASF181:
	.string	"__timezone"
.LASF22:
	.string	"__blkcnt_t"
.LASF178:
	.string	"sys_siglist"
.LASF10:
	.string	"long int"
.LASF146:
	.string	"__u6_addr32"
.LASF27:
	.string	"_flags"
.LASF50:
	.string	"_wide_data"
.LASF35:
	.string	"_IO_buf_end"
.LASF44:
	.string	"_cur_column"
.LASF101:
	.string	"program_invocation_short_name"
.LASF102:
	.string	"SOCK_STREAM"
.LASF58:
	.string	"_IO_codecvt"
.LASF121:
	.string	"sockaddr_dl"
.LASF130:
	.string	"sin6_port"
.LASF172:
	.string	"st_atim"
.LASF100:
	.string	"program_invocation_name"
.LASF43:
	.string	"_old_offset"
.LASF48:
	.string	"_offset"
.LASF75:
	.string	"__pthread_list_t"
.LASF150:
	.string	"in6addr_loopback"
.LASF139:
	.string	"sockaddr_x25"
.LASF76:
	.string	"__pthread_mutex_s"
.LASF205:
	.string	"/home/user/Desktop/NetworksSystem/PA3"
.LASF9:
	.string	"__uint32_t"
.LASF184:
	.string	"timezone"
.LASF127:
	.string	"sin_zero"
.LASF53:
	.string	"__pad5"
.LASF171:
	.string	"st_blocks"
.LASF194:
	.string	"port"
.LASF165:
	.string	"st_uid"
.LASF198:
	.string	"temp"
.LASF57:
	.string	"_IO_marker"
.LASF105:
	.string	"SOCK_RDM"
.LASF1:
	.string	"unsigned int"
.LASF142:
	.string	"s_addr"
.LASF91:
	.string	"uint16_t"
.LASF191:
	.string	"recvBytes"
.LASF99:
	.string	"optopt"
.LASF204:
	.string	"src/setup.c"
.LASF154:
	.string	"ai_socktype"
.LASF0:
	.string	"long unsigned int"
.LASF81:
	.string	"__kind"
.LASF86:
	.string	"__data"
.LASF197:
	.string	"hints"
.LASF192:
	.string	"sentBytes"
.LASF63:
	.string	"sys_nerr"
.LASF189:
	.string	"server_info"
.LASF3:
	.string	"short unsigned int"
.LASF126:
	.string	"sin_addr"
.LASF36:
	.string	"_IO_save_base"
.LASF17:
	.string	"__nlink_t"
.LASF60:
	.string	"stdin"
.LASF95:
	.string	"environ"
.LASF47:
	.string	"_lock"
.LASF42:
	.string	"_flags2"
.LASF54:
	.string	"_mode"
.LASF61:
	.string	"stdout"
.LASF176:
	.string	"stat64"
.LASF169:
	.string	"st_size"
.LASF138:
	.string	"sockaddr_un"
.LASF79:
	.string	"__owner"
.LASF164:
	.string	"st_mode"
.LASF124:
	.string	"sin_family"
.LASF203:
	.string	"GNU C17 9.4.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF96:
	.string	"optarg"
.LASF71:
	.string	"tv_nsec"
.LASF185:
	.string	"getdate_err"
.LASF11:
	.string	"__dev_t"
.LASF129:
	.string	"sin6_family"
.LASF97:
	.string	"optind"
.LASF24:
	.string	"__syscall_slong_t"
.LASF196:
	.string	"sockdetails_t"
.LASF33:
	.string	"_IO_write_end"
.LASF155:
	.string	"ai_protocol"
.LASF115:
	.string	"sockaddr_storage"
.LASF206:
	.string	"_IO_lock_t"
.LASF202:
	.string	"getin_addr"
.LASF68:
	.string	"_IO_FILE"
.LASF21:
	.string	"__blksize_t"
.LASF94:
	.string	"__environ"
.LASF107:
	.string	"SOCK_DCCP"
.LASF72:
	.string	"__pthread_internal_list"
.LASF156:
	.string	"ai_addrlen"
.LASF137:
	.string	"sockaddr_ns"
.LASF125:
	.string	"sin_port"
.LASF113:
	.string	"sa_family"
.LASF64:
	.string	"sys_errlist"
.LASF32:
	.string	"_IO_write_ptr"
.LASF39:
	.string	"_markers"
.LASF207:
	.string	"__socket_type"
.LASF23:
	.string	"__blkcnt64_t"
.LASF175:
	.string	"__glibc_reserved"
.LASF133:
	.string	"sin6_scope_id"
.LASF163:
	.string	"st_nlink"
.LASF2:
	.string	"unsigned char"
.LASF136:
	.string	"sockaddr_iso"
.LASF149:
	.string	"in6addr_any"
.LASF162:
	.string	"st_ino"
.LASF157:
	.string	"ai_addr"
.LASF7:
	.string	"short int"
.LASF190:
	.string	"addr_len"
.LASF170:
	.string	"st_blksize"
.LASF145:
	.string	"__u6_addr16"
.LASF65:
	.string	"_sys_nerr"
.LASF159:
	.string	"ai_next"
.LASF69:
	.string	"timespec"
.LASF45:
	.string	"_vtable_offset"
.LASF182:
	.string	"tzname"
.LASF120:
	.string	"sockaddr_ax25"
.LASF56:
	.string	"FILE"
.LASF187:
	.string	"client_sock_fd"
.LASF108:
	.string	"SOCK_PACKET"
.LASF167:
	.string	"__pad0"
.LASF14:
	.string	"__ino_t"
.LASF180:
	.string	"__daylight"
.LASF78:
	.string	"__count"
.LASF77:
	.string	"__lock"
.LASF92:
	.string	"uint32_t"
.LASF147:
	.string	"in6_addr"
.LASF168:
	.string	"st_rdev"
.LASF25:
	.string	"char"
.LASF116:
	.string	"ss_family"
.LASF26:
	.string	"__socklen_t"
.LASF131:
	.string	"sin6_flowinfo"
.LASF8:
	.string	"__uint16_t"
.LASF83:
	.string	"__elision"
.LASF144:
	.string	"__u6_addr8"
.LASF66:
	.string	"_sys_errlist"
.LASF153:
	.string	"ai_family"
.LASF98:
	.string	"opterr"
.LASF12:
	.string	"__uid_t"
.LASF19:
	.string	"__off64_t"
.LASF30:
	.string	"_IO_read_base"
.LASF38:
	.string	"_IO_save_end"
.LASF177:
	.string	"_sys_siglist"
.LASF89:
	.string	"pthread_mutex_t"
.LASF166:
	.string	"st_gid"
.LASF122:
	.string	"sockaddr_eon"
.LASF82:
	.string	"__spins"
.LASF119:
	.string	"sockaddr_at"
.LASF70:
	.string	"tv_sec"
.LASF20:
	.string	"__time_t"
.LASF111:
	.string	"sa_family_t"
.LASF55:
	.string	"_unused2"
.LASF62:
	.string	"stderr"
.LASF109:
	.string	"SOCK_CLOEXEC"
.LASF128:
	.string	"sockaddr_in6"
.LASF118:
	.string	"__ss_align"
.LASF112:
	.string	"sockaddr"
.LASF103:
	.string	"SOCK_DGRAM"
.LASF123:
	.string	"sockaddr_in"
.LASF52:
	.string	"_freeres_buf"
.LASF90:
	.string	"uint8_t"
.LASF80:
	.string	"__nusers"
.LASF37:
	.string	"_IO_backup_base"
.LASF117:
	.string	"__ss_padding"
.LASF173:
	.string	"st_mtim"
.LASF114:
	.string	"sa_data"
.LASF51:
	.string	"_freeres_list"
.LASF84:
	.string	"__list"
.LASF104:
	.string	"SOCK_RAW"
.LASF158:
	.string	"ai_canonname"
.LASF59:
	.string	"_IO_wide_data"
.LASF132:
	.string	"sin6_addr"
.LASF106:
	.string	"SOCK_SEQPACKET"
.LASF193:
	.string	"timeout"
.LASF179:
	.string	"__tzname"
.LASF195:
	.string	"lock"
.LASF31:
	.string	"_IO_write_base"
.LASF143:
	.string	"in_port_t"
.LASF15:
	.string	"__ino64_t"
.LASF141:
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
