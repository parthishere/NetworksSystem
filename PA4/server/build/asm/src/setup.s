	.file	"setup.c"
	.text
.Ltext0:
	.file 0 "/home/parth/Work/All_data/university/Network System/Assignments/PA4/server" "src/setup.c"
	.globl	getin_addr
	.type	getin_addr, @function
getin_addr:
.LFB309:
	.file 1 "src/setup.c"
	.loc 1 35 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	.loc 1 36 11
	movq	-8(%rbp), %rax
	movzwl	(%rax), %eax
	.loc 1 36 8
	cmpw	$2, %ax
	jne	.L2
	.loc 1 38 17
	movq	-8(%rbp), %rax
	addq	$4, %rax
	jmp	.L3
.L2:
	.loc 1 40 16
	movq	-8(%rbp), %rax
	movzwl	(%rax), %eax
	.loc 1 40 13
	cmpw	$10, %ax
	jne	.L4
	.loc 1 42 17
	movq	-8(%rbp), %rax
	addq	$8, %rax
	jmp	.L3
.L4:
	.loc 1 44 12
	movl	$0, %eax
.L3:
	.loc 1 45 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE309:
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
.LFB310:
	.loc 1 64 1
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
	.loc 1 64 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 72 5
	leaq	-112(%rbp), %rax
	movl	$48, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 73 21
	movl	$0, -108(%rbp)
	.loc 1 74 23
	movl	$1, -104(%rbp)
	.loc 1 75 20
	movl	$1, -112(%rbp)
	.loc 1 77 11
	movq	-160(%rbp), %rax
	movq	%rax, -120(%rbp)
	.loc 1 79 9
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	.loc 1 79 8 discriminator 1
	cmpl	$1024, %eax
	jg	.L6
	.loc 1 81 9
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$67, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 82 9
	movl	$1, %edi
	call	exit@PLT
.L6:
	.loc 1 88 19
	movq	-152(%rbp), %rax
	leaq	144(%rax), %rcx
	leaq	-112(%rbp), %rdx
	movq	-120(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	getaddrinfo@PLT
	movl	%eax, -132(%rbp)
	.loc 1 88 8 discriminator 1
	cmpl	$0, -132(%rbp)
	jns	.L7
	.loc 1 90 9
	movl	-132(%rbp), %eax
	movl	%eax, %edi
	call	gai_strerror@PLT
	movq	%rax, %rdx
	.loc 1 90 9 is_stmt 0 discriminator 1
	movq	stderr(%rip), %rax
	leaq	.LC1(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 91 9 is_stmt 1
	movl	$1, %edi
	call	exit@PLT
.L7:
	.loc 1 93 5
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 96 15
	movq	-152(%rbp), %rax
	movq	144(%rax), %rax
	movq	%rax, -128(%rbp)
	.loc 1 96 5
	jmp	.L8
.L14:
.LBB2:
	.loc 1 104 23
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
	.loc 1 104 12 discriminator 1
	cmpl	$0, -136(%rbp)
	jns	.L9
	.loc 1 106 13
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	.loc 1 107 13
	jmp	.L10
.L9:
	.loc 1 109 9
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 111 13
	movl	$1, -140(%rbp)
	.loc 1 113 13
	leaq	-140(%rbp), %rdx
	movl	-136(%rbp), %eax
	movl	$4, %r8d
	movq	%rdx, %rcx
	movl	$2, %edx
	movl	$1, %esi
	movl	%eax, %edi
	call	setsockopt@PLT
	.loc 1 113 12 discriminator 1
	cmpl	$-1, %eax
	jne	.L11
	.loc 1 115 13
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	.loc 1 116 13
	movl	$1, %edi
	call	exit@PLT
.L11:
	.loc 1 123 13
	movq	-128(%rbp), %rax
	movl	16(%rax), %edx
	.loc 1 123 30
	movq	-128(%rbp), %rax
	movq	24(%rax), %rax
	.loc 1 123 13
	movq	%rax, %rcx
	movl	-136(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	bind@PLT
	.loc 1 123 12 discriminator 1
	testl	%eax, %eax
	jns	.L18
	.loc 1 125 13
	movl	-136(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 126 13
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	.loc 1 127 13
	nop
.L10:
.LBE2:
	.loc 1 96 53 discriminator 2
	movq	-128(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -128(%rbp)
.L8:
	.loc 1 96 39 discriminator 1
	cmpq	$0, -128(%rbp)
	jne	.L14
	jmp	.L13
.L18:
.LBB3:
	.loc 1 130 9
	nop
.L13:
.LBE3:
	.loc 1 134 8
	cmpq	$0, -128(%rbp)
	jne	.L15
	.loc 1 136 9
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$50, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 137 9
	movl	-136(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 138 9
	movl	$1, %edi
	call	exit@PLT
.L15:
	.loc 1 140 16
	movq	-152(%rbp), %rax
	movl	-136(%rbp), %edx
	movl	%edx, (%rax)
	.loc 1 143 32
	movq	-128(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	getin_addr
	movq	%rax, %rsi
	.loc 1 143 5 discriminator 1
	movq	-128(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-64(%rbp), %rdx
	movl	$46, %ecx
	movl	%eax, %edi
	call	inet_ntop@PLT
	.loc 1 144 5
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 146 5
	movq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	freeaddrinfo@PLT
	.loc 1 148 9
	movl	-136(%rbp), %eax
	movl	$20, %esi
	movl	%eax, %edi
	call	listen@PLT
	.loc 1 148 8 discriminator 1
	testl	%eax, %eax
	jns	.L19
	.loc 1 150 9
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	.loc 1 151 9
	movl	$1, %edi
	call	exit@PLT
.L19:
	.loc 1 153 1
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE310:
	.size	init_socket, .-init_socket
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/13/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.file 9 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h"
	.file 10 "/usr/include/unistd.h"
	.file 11 "/usr/include/x86_64-linux-gnu/bits/sockaddr.h"
	.file 12 "/usr/include/x86_64-linux-gnu/bits/socket.h"
	.file 13 "/usr/include/netinet/in.h"
	.file 14 "/usr/include/x86_64-linux-gnu/sys/socket.h"
	.file 15 "/usr/include/netdb.h"
	.file 16 "./common.h"
	.file 17 "/usr/include/arpa/inet.h"
	.file 18 "/usr/include/stdio.h"
	.file 19 "/usr/include/stdlib.h"
	.file 20 "/usr/include/string.h"
	.file 21 "/usr/include/x86_64-linux-gnu/bits/socket_type.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xa03
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x18
	.long	.LASF154
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x3
	.long	.LASF7
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
	.uleb128 0x19
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
	.uleb128 0x3
	.long	.LASF8
	.byte	0x3
	.byte	0x26
	.byte	0x17
	.long	0x4a
	.uleb128 0x5
	.byte	0x2
	.byte	0x5
	.long	.LASF9
	.uleb128 0x3
	.long	.LASF10
	.byte	0x3
	.byte	0x28
	.byte	0x1c
	.long	0x51
	.uleb128 0x1a
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.long	.LASF11
	.byte	0x3
	.byte	0x2a
	.byte	0x16
	.long	0x41
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.long	.LASF12
	.uleb128 0x3
	.long	.LASF13
	.byte	0x3
	.byte	0x98
	.byte	0x19
	.long	0x91
	.uleb128 0x3
	.long	.LASF14
	.byte	0x3
	.byte	0x99
	.byte	0x1b
	.long	0x91
	.uleb128 0x4
	.long	0xba
	.uleb128 0xc
	.long	0xb0
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.long	.LASF15
	.uleb128 0x11
	.long	0xba
	.uleb128 0x3
	.long	.LASF16
	.byte	0x3
	.byte	0xd2
	.byte	0x17
	.long	0x41
	.uleb128 0x9
	.long	.LASF52
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x259
	.uleb128 0x1
	.long	.LASF17
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x7e
	.byte	0
	.uleb128 0x1
	.long	.LASF18
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0xb0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF19
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0xb0
	.byte	0x10
	.uleb128 0x1
	.long	.LASF20
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0xb0
	.byte	0x18
	.uleb128 0x1
	.long	.LASF21
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0xb0
	.byte	0x20
	.uleb128 0x1
	.long	.LASF22
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0xb0
	.byte	0x28
	.uleb128 0x1
	.long	.LASF23
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0xb0
	.byte	0x30
	.uleb128 0x1
	.long	.LASF24
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0xb0
	.byte	0x38
	.uleb128 0x1
	.long	.LASF25
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0xb0
	.byte	0x40
	.uleb128 0x1
	.long	.LASF26
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0xb0
	.byte	0x48
	.uleb128 0x1
	.long	.LASF27
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0xb0
	.byte	0x50
	.uleb128 0x1
	.long	.LASF28
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0xb0
	.byte	0x58
	.uleb128 0x1
	.long	.LASF29
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x272
	.byte	0x60
	.uleb128 0x1
	.long	.LASF30
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x277
	.byte	0x68
	.uleb128 0x1
	.long	.LASF31
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x7e
	.byte	0x70
	.uleb128 0x1
	.long	.LASF32
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x7e
	.byte	0x74
	.uleb128 0x1
	.long	.LASF33
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0x98
	.byte	0x78
	.uleb128 0x1
	.long	.LASF34
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x51
	.byte	0x80
	.uleb128 0x1
	.long	.LASF35
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x58
	.byte	0x82
	.uleb128 0x1
	.long	.LASF36
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x27c
	.byte	0x83
	.uleb128 0x1
	.long	.LASF37
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x28c
	.byte	0x88
	.uleb128 0x1
	.long	.LASF38
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0xa4
	.byte	0x90
	.uleb128 0x1
	.long	.LASF39
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x296
	.byte	0x98
	.uleb128 0x1
	.long	.LASF40
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x2a0
	.byte	0xa0
	.uleb128 0x1
	.long	.LASF41
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x277
	.byte	0xa8
	.uleb128 0x1
	.long	.LASF42
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0x48
	.byte	0xb0
	.uleb128 0x1
	.long	.LASF43
	.byte	0x4
	.byte	0x5f
	.byte	0xa
	.long	0x2e
	.byte	0xb8
	.uleb128 0x1
	.long	.LASF44
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x7e
	.byte	0xc0
	.uleb128 0x1
	.long	.LASF45
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x2a5
	.byte	0xc4
	.byte	0
	.uleb128 0x3
	.long	.LASF46
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0xd2
	.uleb128 0x1b
	.long	.LASF155
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0x10
	.long	.LASF47
	.uleb128 0x4
	.long	0x26d
	.uleb128 0x4
	.long	0xd2
	.uleb128 0x7
	.long	0xba
	.long	0x28c
	.uleb128 0x8
	.long	0x3a
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	0x265
	.uleb128 0x10
	.long	.LASF48
	.uleb128 0x4
	.long	0x291
	.uleb128 0x10
	.long	.LASF49
	.uleb128 0x4
	.long	0x29b
	.uleb128 0x7
	.long	0xba
	.long	0x2b5
	.uleb128 0x8
	.long	0x3a
	.byte	0x13
	.byte	0
	.uleb128 0x4
	.long	0xc1
	.uleb128 0xc
	.long	0x2b5
	.uleb128 0x4
	.long	0x259
	.uleb128 0xc
	.long	0x2bf
	.uleb128 0x1c
	.long	.LASF156
	.byte	0x12
	.byte	0x97
	.byte	0xe
	.long	0x2bf
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.long	.LASF50
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.long	.LASF51
	.uleb128 0x9
	.long	.LASF53
	.byte	0x10
	.byte	0x6
	.byte	0x33
	.byte	0x10
	.long	0x30b
	.uleb128 0x1
	.long	.LASF54
	.byte	0x6
	.byte	0x35
	.byte	0x23
	.long	0x30b
	.byte	0
	.uleb128 0x1
	.long	.LASF55
	.byte	0x6
	.byte	0x36
	.byte	0x23
	.long	0x30b
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.long	0x2e3
	.uleb128 0x3
	.long	.LASF56
	.byte	0x6
	.byte	0x37
	.byte	0x3
	.long	0x2e3
	.uleb128 0x9
	.long	.LASF57
	.byte	0x28
	.byte	0x7
	.byte	0x16
	.byte	0x8
	.long	0x392
	.uleb128 0x1
	.long	.LASF58
	.byte	0x7
	.byte	0x18
	.byte	0x7
	.long	0x7e
	.byte	0
	.uleb128 0x1
	.long	.LASF59
	.byte	0x7
	.byte	0x19
	.byte	0x10
	.long	0x41
	.byte	0x4
	.uleb128 0x1
	.long	.LASF60
	.byte	0x7
	.byte	0x1a
	.byte	0x7
	.long	0x7e
	.byte	0x8
	.uleb128 0x1
	.long	.LASF61
	.byte	0x7
	.byte	0x1c
	.byte	0x10
	.long	0x41
	.byte	0xc
	.uleb128 0x1
	.long	.LASF62
	.byte	0x7
	.byte	0x20
	.byte	0x7
	.long	0x7e
	.byte	0x10
	.uleb128 0x1
	.long	.LASF63
	.byte	0x7
	.byte	0x22
	.byte	0x9
	.long	0x6b
	.byte	0x14
	.uleb128 0x1
	.long	.LASF64
	.byte	0x7
	.byte	0x23
	.byte	0x9
	.long	0x6b
	.byte	0x16
	.uleb128 0x1
	.long	.LASF65
	.byte	0x7
	.byte	0x24
	.byte	0x14
	.long	0x310
	.byte	0x18
	.byte	0
	.uleb128 0x12
	.byte	0x28
	.byte	0x8
	.byte	0x43
	.byte	0x9
	.long	0x3c0
	.uleb128 0xd
	.long	.LASF66
	.byte	0x8
	.byte	0x45
	.byte	0x1c
	.long	0x31c
	.uleb128 0xd
	.long	.LASF67
	.byte	0x8
	.byte	0x46
	.byte	0x8
	.long	0x3c0
	.uleb128 0xd
	.long	.LASF68
	.byte	0x8
	.byte	0x47
	.byte	0xc
	.long	0x91
	.byte	0
	.uleb128 0x7
	.long	0xba
	.long	0x3d0
	.uleb128 0x8
	.long	0x3a
	.byte	0x27
	.byte	0
	.uleb128 0x3
	.long	.LASF69
	.byte	0x8
	.byte	0x48
	.byte	0x3
	.long	0x392
	.uleb128 0x4
	.long	0x3e6
	.uleb128 0xc
	.long	0x3dc
	.uleb128 0x1d
	.uleb128 0x3
	.long	.LASF70
	.byte	0x9
	.byte	0x18
	.byte	0x13
	.long	0x5f
	.uleb128 0x3
	.long	.LASF71
	.byte	0x9
	.byte	0x19
	.byte	0x14
	.long	0x72
	.uleb128 0x3
	.long	.LASF72
	.byte	0x9
	.byte	0x1a
	.byte	0x14
	.long	0x85
	.uleb128 0x1e
	.long	.LASF73
	.byte	0xa
	.value	0x112
	.byte	0x15
	.long	0xc6
	.uleb128 0x1f
	.long	.LASF157
	.byte	0x7
	.byte	0x4
	.long	0x41
	.byte	0x15
	.byte	0x18
	.byte	0x6
	.long	0x465
	.uleb128 0xa
	.long	.LASF74
	.byte	0x1
	.uleb128 0xa
	.long	.LASF75
	.byte	0x2
	.uleb128 0xa
	.long	.LASF76
	.byte	0x3
	.uleb128 0xa
	.long	.LASF77
	.byte	0x4
	.uleb128 0xa
	.long	.LASF78
	.byte	0x5
	.uleb128 0xa
	.long	.LASF79
	.byte	0x6
	.uleb128 0xa
	.long	.LASF80
	.byte	0xa
	.uleb128 0x20
	.long	.LASF81
	.long	0x80000
	.uleb128 0x21
	.long	.LASF82
	.value	0x800
	.byte	0
	.uleb128 0x3
	.long	.LASF83
	.byte	0xb
	.byte	0x1c
	.byte	0x1c
	.long	0x51
	.uleb128 0x9
	.long	.LASF84
	.byte	0x10
	.byte	0xc
	.byte	0xb7
	.byte	0x8
	.long	0x499
	.uleb128 0x1
	.long	.LASF85
	.byte	0xc
	.byte	0xb9
	.byte	0x5
	.long	0x465
	.byte	0
	.uleb128 0x1
	.long	.LASF86
	.byte	0xc
	.byte	0xba
	.byte	0xa
	.long	0x499
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	0xba
	.long	0x4a9
	.uleb128 0x8
	.long	0x3a
	.byte	0xd
	.byte	0
	.uleb128 0x9
	.long	.LASF87
	.byte	0x80
	.byte	0xc
	.byte	0xc4
	.byte	0x8
	.long	0x4de
	.uleb128 0x1
	.long	.LASF88
	.byte	0xc
	.byte	0xc6
	.byte	0x5
	.long	0x465
	.byte	0
	.uleb128 0x1
	.long	.LASF89
	.byte	0xc
	.byte	0xc7
	.byte	0xa
	.long	0x4de
	.byte	0x2
	.uleb128 0x1
	.long	.LASF90
	.byte	0xc
	.byte	0xc8
	.byte	0x14
	.long	0x3a
	.byte	0x78
	.byte	0
	.uleb128 0x7
	.long	0xba
	.long	0x4ee
	.uleb128 0x8
	.long	0x3a
	.byte	0x75
	.byte	0
	.uleb128 0x4
	.long	0x471
	.uleb128 0x9
	.long	.LASF91
	.byte	0x10
	.byte	0xd
	.byte	0xf7
	.byte	0x8
	.long	0x535
	.uleb128 0x1
	.long	.LASF92
	.byte	0xd
	.byte	0xf9
	.byte	0x5
	.long	0x465
	.byte	0
	.uleb128 0x1
	.long	.LASF93
	.byte	0xd
	.byte	0xfa
	.byte	0xf
	.long	0x5c1
	.byte	0x2
	.uleb128 0x1
	.long	.LASF94
	.byte	0xd
	.byte	0xfb
	.byte	0x14
	.long	0x5a6
	.byte	0x4
	.uleb128 0x1
	.long	.LASF95
	.byte	0xd
	.byte	0xfe
	.byte	0x13
	.long	0x646
	.byte	0x8
	.byte	0
	.uleb128 0x13
	.long	.LASF96
	.byte	0x1c
	.byte	0xd
	.value	0x106
	.long	0x589
	.uleb128 0x6
	.long	.LASF97
	.byte	0xd
	.value	0x108
	.byte	0x5
	.long	0x465
	.byte	0
	.uleb128 0x6
	.long	.LASF98
	.byte	0xd
	.value	0x109
	.byte	0xf
	.long	0x5c1
	.byte	0x2
	.uleb128 0x6
	.long	.LASF99
	.byte	0xd
	.value	0x10a
	.byte	0xe
	.long	0x3ff
	.byte	0x4
	.uleb128 0x6
	.long	.LASF100
	.byte	0xd
	.value	0x10b
	.byte	0x15
	.long	0x62b
	.byte	0x8
	.uleb128 0x6
	.long	.LASF101
	.byte	0xd
	.value	0x10c
	.byte	0xe
	.long	0x3ff
	.byte	0x18
	.byte	0
	.uleb128 0x3
	.long	.LASF102
	.byte	0xe
	.byte	0x54
	.byte	0xa
	.long	0x595
	.uleb128 0x22
	.byte	0x8
	.byte	0xe
	.byte	0x53
	.byte	0x9
	.uleb128 0x3
	.long	.LASF103
	.byte	0xd
	.byte	0x1e
	.byte	0x12
	.long	0x3ff
	.uleb128 0x9
	.long	.LASF104
	.byte	0x4
	.byte	0xd
	.byte	0x1f
	.byte	0x8
	.long	0x5c1
	.uleb128 0x1
	.long	.LASF105
	.byte	0xd
	.byte	0x21
	.byte	0xf
	.long	0x59a
	.byte	0
	.byte	0
	.uleb128 0x3
	.long	.LASF106
	.byte	0xd
	.byte	0x7d
	.byte	0x12
	.long	0x3f3
	.uleb128 0x12
	.byte	0x10
	.byte	0xd
	.byte	0xdf
	.byte	0x5
	.long	0x5fb
	.uleb128 0xd
	.long	.LASF107
	.byte	0xd
	.byte	0xe1
	.byte	0xa
	.long	0x5fb
	.uleb128 0xd
	.long	.LASF108
	.byte	0xd
	.byte	0xe2
	.byte	0xb
	.long	0x60b
	.uleb128 0xd
	.long	.LASF109
	.byte	0xd
	.byte	0xe3
	.byte	0xb
	.long	0x61b
	.byte	0
	.uleb128 0x7
	.long	0x3e7
	.long	0x60b
	.uleb128 0x8
	.long	0x3a
	.byte	0xf
	.byte	0
	.uleb128 0x7
	.long	0x3f3
	.long	0x61b
	.uleb128 0x8
	.long	0x3a
	.byte	0x7
	.byte	0
	.uleb128 0x7
	.long	0x3ff
	.long	0x62b
	.uleb128 0x8
	.long	0x3a
	.byte	0x3
	.byte	0
	.uleb128 0x9
	.long	.LASF110
	.byte	0x10
	.byte	0xd
	.byte	0xdd
	.byte	0x8
	.long	0x646
	.uleb128 0x1
	.long	.LASF111
	.byte	0xd
	.byte	0xe4
	.byte	0x9
	.long	0x5cd
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x4a
	.long	0x656
	.uleb128 0x8
	.long	0x3a
	.byte	0x7
	.byte	0
	.uleb128 0x13
	.long	.LASF112
	.byte	0x30
	.byte	0xf
	.value	0x235
	.long	0x6d4
	.uleb128 0x6
	.long	.LASF113
	.byte	0xf
	.value	0x237
	.byte	0x7
	.long	0x7e
	.byte	0
	.uleb128 0x6
	.long	.LASF114
	.byte	0xf
	.value	0x238
	.byte	0x7
	.long	0x7e
	.byte	0x4
	.uleb128 0x6
	.long	.LASF115
	.byte	0xf
	.value	0x239
	.byte	0x7
	.long	0x7e
	.byte	0x8
	.uleb128 0x6
	.long	.LASF116
	.byte	0xf
	.value	0x23a
	.byte	0x7
	.long	0x7e
	.byte	0xc
	.uleb128 0x6
	.long	.LASF117
	.byte	0xf
	.value	0x23b
	.byte	0xd
	.long	0x40b
	.byte	0x10
	.uleb128 0x6
	.long	.LASF118
	.byte	0xf
	.value	0x23c
	.byte	0x14
	.long	0x4ee
	.byte	0x18
	.uleb128 0x6
	.long	.LASF119
	.byte	0xf
	.value	0x23d
	.byte	0x9
	.long	0xb0
	.byte	0x20
	.uleb128 0x6
	.long	.LASF120
	.byte	0xf
	.value	0x23e
	.byte	0x14
	.long	0x6d9
	.byte	0x28
	.byte	0
	.uleb128 0x11
	.long	0x656
	.uleb128 0x4
	.long	0x656
	.uleb128 0x4
	.long	0x6d4
	.uleb128 0xc
	.long	0x6de
	.uleb128 0x5
	.byte	0x10
	.byte	0x5
	.long	.LASF121
	.uleb128 0x5
	.byte	0x10
	.byte	0x7
	.long	.LASF122
	.uleb128 0x5
	.byte	0x10
	.byte	0x4
	.long	.LASF123
	.uleb128 0x23
	.byte	0xc8
	.byte	0x10
	.byte	0x7f
	.byte	0x9
	.long	0x762
	.uleb128 0x1
	.long	.LASF124
	.byte	0x10
	.byte	0x81
	.byte	0x9
	.long	0x7e
	.byte	0
	.uleb128 0x1
	.long	.LASF125
	.byte	0x10
	.byte	0x82
	.byte	0x9
	.long	0x7e
	.byte	0x4
	.uleb128 0x1
	.long	.LASF126
	.byte	0x10
	.byte	0x84
	.byte	0xb
	.long	0xb0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF127
	.byte	0x10
	.byte	0x86
	.byte	0x1d
	.long	0x4a9
	.byte	0x10
	.uleb128 0x1
	.long	.LASF128
	.byte	0x10
	.byte	0x87
	.byte	0x16
	.long	0x6d9
	.byte	0x90
	.uleb128 0x1
	.long	.LASF129
	.byte	0x10
	.byte	0x88
	.byte	0x9
	.long	0x7e
	.byte	0x98
	.uleb128 0x1
	.long	.LASF130
	.byte	0x10
	.byte	0x89
	.byte	0x15
	.long	0x3d0
	.byte	0xa0
	.byte	0
	.uleb128 0x3
	.long	.LASF131
	.byte	0x10
	.byte	0x8a
	.byte	0x3
	.long	0x6fd
	.uleb128 0xb
	.long	.LASF132
	.byte	0xe
	.value	0x128
	.byte	0xc
	.long	0x7e
	.long	0x78a
	.uleb128 0x2
	.long	0x7e
	.uleb128 0x2
	.long	0x7e
	.byte	0
	.uleb128 0x14
	.long	.LASF137
	.byte	0xf
	.value	0x29a
	.long	0x79c
	.uleb128 0x2
	.long	0x6d9
	.byte	0
	.uleb128 0xe
	.long	.LASF133
	.byte	0x11
	.byte	0x40
	.byte	0x14
	.long	0x2b5
	.long	0x7c1
	.uleb128 0x2
	.long	0x7e
	.uleb128 0x2
	.long	0x3e1
	.uleb128 0x2
	.long	0xb5
	.uleb128 0x2
	.long	0x40b
	.byte	0
	.uleb128 0xb
	.long	.LASF134
	.byte	0xa
	.value	0x166
	.byte	0xc
	.long	0x7e
	.long	0x7d8
	.uleb128 0x2
	.long	0x7e
	.byte	0
	.uleb128 0xe
	.long	.LASF135
	.byte	0xe
	.byte	0x70
	.byte	0xc
	.long	0x7e
	.long	0x7f8
	.uleb128 0x2
	.long	0x7e
	.uleb128 0x2
	.long	0x589
	.uleb128 0x2
	.long	0x40b
	.byte	0
	.uleb128 0xb
	.long	.LASF136
	.byte	0xe
	.value	0x115
	.byte	0xc
	.long	0x7e
	.long	0x823
	.uleb128 0x2
	.long	0x7e
	.uleb128 0x2
	.long	0x7e
	.uleb128 0x2
	.long	0x7e
	.uleb128 0x2
	.long	0x3dc
	.uleb128 0x2
	.long	0x40b
	.byte	0
	.uleb128 0x14
	.long	.LASF138
	.byte	0x12
	.value	0x36e
	.long	0x835
	.uleb128 0x2
	.long	0x2b5
	.byte	0
	.uleb128 0xe
	.long	.LASF139
	.byte	0xe
	.byte	0x66
	.byte	0xc
	.long	0x7e
	.long	0x855
	.uleb128 0x2
	.long	0x7e
	.uleb128 0x2
	.long	0x7e
	.uleb128 0x2
	.long	0x7e
	.byte	0
	.uleb128 0xb
	.long	.LASF140
	.byte	0x12
	.value	0x16b
	.byte	0xc
	.long	0x7e
	.long	0x86d
	.uleb128 0x2
	.long	0x2b5
	.uleb128 0x15
	.byte	0
	.uleb128 0xb
	.long	.LASF141
	.byte	0x12
	.value	0x165
	.byte	0xc
	.long	0x7e
	.long	0x88a
	.uleb128 0x2
	.long	0x2c4
	.uleb128 0x2
	.long	0x2ba
	.uleb128 0x15
	.byte	0
	.uleb128 0xb
	.long	.LASF142
	.byte	0xf
	.value	0x29d
	.byte	0x14
	.long	0x2b5
	.long	0x8a1
	.uleb128 0x2
	.long	0x7e
	.byte	0
	.uleb128 0xb
	.long	.LASF143
	.byte	0xf
	.value	0x294
	.byte	0xc
	.long	0x7e
	.long	0x8c7
	.uleb128 0x2
	.long	0x2ba
	.uleb128 0x2
	.long	0x2ba
	.uleb128 0x2
	.long	0x6e3
	.uleb128 0x2
	.long	0x8cc
	.byte	0
	.uleb128 0x4
	.long	0x6d9
	.uleb128 0xc
	.long	0x8c7
	.uleb128 0x24
	.long	.LASF144
	.byte	0x13
	.value	0x2f4
	.byte	0xd
	.long	0x8e4
	.uleb128 0x2
	.long	0x7e
	.byte	0
	.uleb128 0xe
	.long	.LASF145
	.byte	0x13
	.byte	0x69
	.byte	0xc
	.long	0x7e
	.long	0x8fa
	.uleb128 0x2
	.long	0x2b5
	.byte	0
	.uleb128 0xe
	.long	.LASF146
	.byte	0x14
	.byte	0x3d
	.byte	0xe
	.long	0x48
	.long	0x91a
	.uleb128 0x2
	.long	0x48
	.uleb128 0x2
	.long	0x7e
	.uleb128 0x2
	.long	0x2e
	.byte	0
	.uleb128 0x25
	.long	.LASF152
	.byte	0x1
	.byte	0x3f
	.byte	0x6
	.quad	.LFB310
	.quad	.LFE310-.LFB310
	.uleb128 0x1
	.byte	0x9c
	.long	0x9c5
	.uleb128 0x16
	.string	"sd"
	.byte	0x3f
	.byte	0x21
	.long	0x9c5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x26
	.long	.LASF147
	.byte	0x1
	.byte	0x3f
	.byte	0x2b
	.long	0xb0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0xf
	.long	.LASF148
	.byte	0x41
	.byte	0x15
	.long	0x656
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0xf
	.long	.LASF149
	.byte	0x41
	.byte	0x1d
	.long	0x6d9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x17
	.string	"ip"
	.byte	0x42
	.byte	0xa
	.long	0x9ca
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0xf
	.long	.LASF150
	.byte	0x44
	.byte	0x9
	.long	0x7e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -148
	.uleb128 0xf
	.long	.LASF124
	.byte	0x45
	.byte	0x9
	.long	0x7e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0xf
	.long	.LASF151
	.byte	0x4d
	.byte	0xb
	.long	0xb0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x27
	.long	.LLRL0
	.uleb128 0x17
	.string	"yes"
	.byte	0x6f
	.byte	0xd
	.long	0x7e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -156
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	0x762
	.uleb128 0x7
	.long	0xba
	.long	0x9da
	.uleb128 0x8
	.long	0x3a
	.byte	0x2d
	.byte	0
	.uleb128 0x28
	.long	.LASF153
	.byte	0x1
	.byte	0x22
	.byte	0x7
	.long	0x48
	.quad	.LFB309
	.quad	.LFE309-.LFB309
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x16
	.string	"sa"
	.byte	0x22
	.byte	0x23
	.long	0x4ee
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
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
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
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0x10
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x17
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x23
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
	.uleb128 0x26
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
	.uleb128 0x27
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x28
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
	.uleb128 0x7a
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
	.section	.debug_rnglists,"",@progbits
.Ldebug_ranges0:
	.long	.Ldebug_ranges3-.Ldebug_ranges2
.Ldebug_ranges2:
	.value	0x5
	.byte	0x8
	.byte	0
	.long	0
.LLRL0:
	.byte	0x4
	.uleb128 .LBB2-.Ltext0
	.uleb128 .LBE2-.Ltext0
	.byte	0x4
	.uleb128 .LBB3-.Ltext0
	.uleb128 .LBE3-.Ltext0
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF140:
	.string	"printf"
.LASF13:
	.string	"__off_t"
.LASF18:
	.string	"_IO_read_ptr"
.LASF30:
	.string	"_chain"
.LASF100:
	.string	"sin6_addr"
.LASF151:
	.string	"server_port"
.LASF111:
	.string	"__in6_u"
.LASF7:
	.string	"size_t"
.LASF54:
	.string	"__prev"
.LASF139:
	.string	"socket"
.LASF68:
	.string	"__align"
.LASF36:
	.string	"_shortbuf"
.LASF134:
	.string	"close"
.LASF131:
	.string	"sockDetails_t"
.LASF8:
	.string	"__uint8_t"
.LASF67:
	.string	"__size"
.LASF24:
	.string	"_IO_buf_base"
.LASF82:
	.string	"SOCK_NONBLOCK"
.LASF51:
	.string	"long long unsigned int"
.LASF103:
	.string	"in_addr_t"
.LASF128:
	.string	"server_info"
.LASF55:
	.string	"__next"
.LASF127:
	.string	"client_info"
.LASF73:
	.string	"socklen_t"
.LASF39:
	.string	"_codecvt"
.LASF124:
	.string	"sockfd"
.LASF50:
	.string	"long long int"
.LASF6:
	.string	"signed char"
.LASF150:
	.string	"status"
.LASF152:
	.string	"init_socket"
.LASF31:
	.string	"_fileno"
.LASF19:
	.string	"_IO_read_end"
.LASF108:
	.string	"__u6_addr16"
.LASF12:
	.string	"long int"
.LASF154:
	.string	"GNU C17 13.3.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF17:
	.string	"_flags"
.LASF25:
	.string	"_IO_buf_end"
.LASF34:
	.string	"_cur_column"
.LASF74:
	.string	"SOCK_STREAM"
.LASF48:
	.string	"_IO_codecvt"
.LASF98:
	.string	"sin6_port"
.LASF33:
	.string	"_old_offset"
.LASF38:
	.string	"_offset"
.LASF56:
	.string	"__pthread_list_t"
.LASF57:
	.string	"__pthread_mutex_s"
.LASF113:
	.string	"ai_flags"
.LASF11:
	.string	"__uint32_t"
.LASF95:
	.string	"sin_zero"
.LASF147:
	.string	"port"
.LASF149:
	.string	"temp"
.LASF47:
	.string	"_IO_marker"
.LASF77:
	.string	"SOCK_RDM"
.LASF3:
	.string	"unsigned int"
.LASF105:
	.string	"s_addr"
.LASF71:
	.string	"uint16_t"
.LASF141:
	.string	"fprintf"
.LASF115:
	.string	"ai_socktype"
.LASF2:
	.string	"long unsigned int"
.LASF66:
	.string	"__data"
.LASF22:
	.string	"_IO_write_ptr"
.LASF135:
	.string	"bind"
.LASF129:
	.string	"addr_len"
.LASF64:
	.string	"__elision"
.LASF5:
	.string	"short unsigned int"
.LASF94:
	.string	"sin_addr"
.LASF132:
	.string	"listen"
.LASF26:
	.string	"_IO_save_base"
.LASF112:
	.string	"addrinfo"
.LASF126:
	.string	"dirname"
.LASF37:
	.string	"_lock"
.LASF109:
	.string	"__u6_addr32"
.LASF106:
	.string	"in_port_t"
.LASF102:
	.string	"__CONST_SOCKADDR_ARG"
.LASF60:
	.string	"__owner"
.LASF138:
	.string	"perror"
.LASF92:
	.string	"sin_family"
.LASF97:
	.string	"sin6_family"
.LASF143:
	.string	"getaddrinfo"
.LASF23:
	.string	"_IO_write_end"
.LASF116:
	.string	"ai_protocol"
.LASF137:
	.string	"freeaddrinfo"
.LASF87:
	.string	"sockaddr_storage"
.LASF155:
	.string	"_IO_lock_t"
.LASF153:
	.string	"getin_addr"
.LASF52:
	.string	"_IO_FILE"
.LASF157:
	.string	"__socket_type"
.LASF79:
	.string	"SOCK_DCCP"
.LASF125:
	.string	"client_sock_fd"
.LASF53:
	.string	"__pthread_internal_list"
.LASF117:
	.string	"ai_addrlen"
.LASF44:
	.string	"_mode"
.LASF93:
	.string	"sin_port"
.LASF85:
	.string	"sa_family"
.LASF29:
	.string	"_markers"
.LASF148:
	.string	"hints"
.LASF122:
	.string	"__int128 unsigned"
.LASF101:
	.string	"sin6_scope_id"
.LASF145:
	.string	"atoi"
.LASF4:
	.string	"unsigned char"
.LASF118:
	.string	"ai_addr"
.LASF9:
	.string	"short int"
.LASF49:
	.string	"_IO_wide_data"
.LASF32:
	.string	"_flags2"
.LASF120:
	.string	"ai_next"
.LASF35:
	.string	"_vtable_offset"
.LASF46:
	.string	"FILE"
.LASF144:
	.string	"exit"
.LASF80:
	.string	"SOCK_PACKET"
.LASF110:
	.string	"in6_addr"
.LASF59:
	.string	"__count"
.LASF58:
	.string	"__lock"
.LASF72:
	.string	"uint32_t"
.LASF123:
	.string	"long double"
.LASF15:
	.string	"char"
.LASF88:
	.string	"ss_family"
.LASF16:
	.string	"__socklen_t"
.LASF99:
	.string	"sin6_flowinfo"
.LASF10:
	.string	"__uint16_t"
.LASF107:
	.string	"__u6_addr8"
.LASF114:
	.string	"ai_family"
.LASF133:
	.string	"inet_ntop"
.LASF14:
	.string	"__off64_t"
.LASF20:
	.string	"_IO_read_base"
.LASF142:
	.string	"gai_strerror"
.LASF28:
	.string	"_IO_save_end"
.LASF121:
	.string	"__int128"
.LASF69:
	.string	"pthread_mutex_t"
.LASF63:
	.string	"__spins"
.LASF43:
	.string	"__pad5"
.LASF83:
	.string	"sa_family_t"
.LASF45:
	.string	"_unused2"
.LASF156:
	.string	"stderr"
.LASF146:
	.string	"memset"
.LASF81:
	.string	"SOCK_CLOEXEC"
.LASF96:
	.string	"sockaddr_in6"
.LASF90:
	.string	"__ss_align"
.LASF84:
	.string	"sockaddr"
.LASF75:
	.string	"SOCK_DGRAM"
.LASF136:
	.string	"setsockopt"
.LASF91:
	.string	"sockaddr_in"
.LASF42:
	.string	"_freeres_buf"
.LASF70:
	.string	"uint8_t"
.LASF61:
	.string	"__nusers"
.LASF27:
	.string	"_IO_backup_base"
.LASF89:
	.string	"__ss_padding"
.LASF86:
	.string	"sa_data"
.LASF41:
	.string	"_freeres_list"
.LASF65:
	.string	"__list"
.LASF76:
	.string	"SOCK_RAW"
.LASF119:
	.string	"ai_canonname"
.LASF40:
	.string	"_wide_data"
.LASF62:
	.string	"__kind"
.LASF78:
	.string	"SOCK_SEQPACKET"
.LASF130:
	.string	"lock"
.LASF21:
	.string	"_IO_write_base"
.LASF104:
	.string	"in_addr"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/parth/Work/All_data/university/Network System/Assignments/PA4/server"
.LASF0:
	.string	"src/setup.c"
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
