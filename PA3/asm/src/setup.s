	.file	"setup.c"
	.text
.Ltext0:
	.file 0 "/home/parth/Work/All_data/university/Network System/Assignments/PA3" "src/setup.c"
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
	.loc 1 70 8 discriminator 1
	cmpl	$1024, %eax
	jg	.L6
	.loc 1 72 9
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$67, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
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
	.loc 1 79 8 discriminator 1
	cmpl	$0, -132(%rbp)
	jns	.L7
	.loc 1 81 9
	movl	-132(%rbp), %eax
	movl	%eax, %edi
	call	gai_strerror@PLT
	movq	%rax, %rdx
	.loc 1 81 9 is_stmt 0 discriminator 1
	movq	stderr(%rip), %rax
	leaq	.LC1(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 82 9 is_stmt 1
	movl	$1, %edi
	call	exit@PLT
.L7:
	.loc 1 84 5
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
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
	.loc 1 95 12 discriminator 1
	cmpl	$0, -136(%rbp)
	jns	.L9
	.loc 1 97 13
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	.loc 1 98 13
	jmp	.L10
.L9:
	.loc 1 100 9
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
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
	.loc 1 104 12 discriminator 1
	cmpl	$-1, %eax
	jne	.L11
	.loc 1 106 13
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
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
	.loc 1 114 12 discriminator 1
	testl	%eax, %eax
	jns	.L18
	.loc 1 116 13
	movl	-136(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 117 13
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	.loc 1 118 13
	nop
.L10:
.LBE2:
	.loc 1 87 53 discriminator 2
	movq	-128(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -128(%rbp)
.L8:
	.loc 1 87 39 discriminator 1
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
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
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
	.loc 1 134 5 discriminator 1
	movq	-128(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-64(%rbp), %rdx
	movl	$46, %ecx
	movl	%eax, %edi
	call	inet_ntop@PLT
	.loc 1 135 5
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
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
	.loc 1 139 8 discriminator 1
	testl	%eax, %eax
	jns	.L19
	.loc 1 141 9
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	.loc 1 142 9
	movl	$1, %edi
	call	exit@PLT
.L19:
	.loc 1 144 1
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
.LFE7:
	.size	init_socket, .-init_socket
.Letext0:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h"
	.file 9 "/usr/include/unistd.h"
	.file 10 "/usr/include/x86_64-linux-gnu/bits/sockaddr.h"
	.file 11 "/usr/include/x86_64-linux-gnu/bits/socket.h"
	.file 12 "/usr/include/netinet/in.h"
	.file 13 "/usr/include/x86_64-linux-gnu/sys/socket.h"
	.file 14 "/usr/include/netdb.h"
	.file 15 "./common.h"
	.file 16 "/usr/include/arpa/inet.h"
	.file 17 "/usr/include/stdio.h"
	.file 18 "/usr/include/stdlib.h"
	.file 19 "/usr/include/string.h"
	.file 20 "/usr/include/x86_64-linux-gnu/bits/socket_type.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xa19
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
	.uleb128 0x6
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x19
	.byte	0x8
	.uleb128 0x6
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x6
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x6
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x3
	.long	.LASF8
	.byte	0x2
	.byte	0x26
	.byte	0x17
	.long	0x3e
	.uleb128 0x6
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x3
	.long	.LASF9
	.byte	0x2
	.byte	0x28
	.byte	0x1c
	.long	0x45
	.uleb128 0x1a
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.long	.LASF10
	.byte	0x2
	.byte	0x2a
	.byte	0x16
	.long	0x35
	.uleb128 0x6
	.byte	0x8
	.byte	0x5
	.long	.LASF11
	.uleb128 0x3
	.long	.LASF12
	.byte	0x2
	.byte	0x98
	.byte	0x19
	.long	0x85
	.uleb128 0x3
	.long	.LASF13
	.byte	0x2
	.byte	0x99
	.byte	0x1b
	.long	0x85
	.uleb128 0x4
	.long	0xae
	.uleb128 0xd
	.long	0xa4
	.uleb128 0x6
	.byte	0x1
	.byte	0x6
	.long	.LASF14
	.uleb128 0x11
	.long	0xae
	.uleb128 0x3
	.long	.LASF15
	.byte	0x2
	.byte	0xd2
	.byte	0x17
	.long	0x35
	.uleb128 0x9
	.long	.LASF51
	.byte	0xd8
	.byte	0x3
	.byte	0x31
	.byte	0x8
	.long	0x24d
	.uleb128 0x1
	.long	.LASF16
	.byte	0x3
	.byte	0x33
	.byte	0x7
	.long	0x72
	.byte	0
	.uleb128 0x1
	.long	.LASF17
	.byte	0x3
	.byte	0x36
	.byte	0x9
	.long	0xa4
	.byte	0x8
	.uleb128 0x1
	.long	.LASF18
	.byte	0x3
	.byte	0x37
	.byte	0x9
	.long	0xa4
	.byte	0x10
	.uleb128 0x1
	.long	.LASF19
	.byte	0x3
	.byte	0x38
	.byte	0x9
	.long	0xa4
	.byte	0x18
	.uleb128 0x1
	.long	.LASF20
	.byte	0x3
	.byte	0x39
	.byte	0x9
	.long	0xa4
	.byte	0x20
	.uleb128 0x1
	.long	.LASF21
	.byte	0x3
	.byte	0x3a
	.byte	0x9
	.long	0xa4
	.byte	0x28
	.uleb128 0x1
	.long	.LASF22
	.byte	0x3
	.byte	0x3b
	.byte	0x9
	.long	0xa4
	.byte	0x30
	.uleb128 0x1
	.long	.LASF23
	.byte	0x3
	.byte	0x3c
	.byte	0x9
	.long	0xa4
	.byte	0x38
	.uleb128 0x1
	.long	.LASF24
	.byte	0x3
	.byte	0x3d
	.byte	0x9
	.long	0xa4
	.byte	0x40
	.uleb128 0x1
	.long	.LASF25
	.byte	0x3
	.byte	0x40
	.byte	0x9
	.long	0xa4
	.byte	0x48
	.uleb128 0x1
	.long	.LASF26
	.byte	0x3
	.byte	0x41
	.byte	0x9
	.long	0xa4
	.byte	0x50
	.uleb128 0x1
	.long	.LASF27
	.byte	0x3
	.byte	0x42
	.byte	0x9
	.long	0xa4
	.byte	0x58
	.uleb128 0x1
	.long	.LASF28
	.byte	0x3
	.byte	0x44
	.byte	0x16
	.long	0x266
	.byte	0x60
	.uleb128 0x1
	.long	.LASF29
	.byte	0x3
	.byte	0x46
	.byte	0x14
	.long	0x26b
	.byte	0x68
	.uleb128 0x1
	.long	.LASF30
	.byte	0x3
	.byte	0x48
	.byte	0x7
	.long	0x72
	.byte	0x70
	.uleb128 0x1
	.long	.LASF31
	.byte	0x3
	.byte	0x49
	.byte	0x7
	.long	0x72
	.byte	0x74
	.uleb128 0x1
	.long	.LASF32
	.byte	0x3
	.byte	0x4a
	.byte	0xb
	.long	0x8c
	.byte	0x78
	.uleb128 0x1
	.long	.LASF33
	.byte	0x3
	.byte	0x4d
	.byte	0x12
	.long	0x45
	.byte	0x80
	.uleb128 0x1
	.long	.LASF34
	.byte	0x3
	.byte	0x4e
	.byte	0xf
	.long	0x4c
	.byte	0x82
	.uleb128 0x1
	.long	.LASF35
	.byte	0x3
	.byte	0x4f
	.byte	0x8
	.long	0x270
	.byte	0x83
	.uleb128 0x1
	.long	.LASF36
	.byte	0x3
	.byte	0x51
	.byte	0xf
	.long	0x280
	.byte	0x88
	.uleb128 0x1
	.long	.LASF37
	.byte	0x3
	.byte	0x59
	.byte	0xd
	.long	0x98
	.byte	0x90
	.uleb128 0x1
	.long	.LASF38
	.byte	0x3
	.byte	0x5b
	.byte	0x17
	.long	0x28a
	.byte	0x98
	.uleb128 0x1
	.long	.LASF39
	.byte	0x3
	.byte	0x5c
	.byte	0x19
	.long	0x294
	.byte	0xa0
	.uleb128 0x1
	.long	.LASF40
	.byte	0x3
	.byte	0x5d
	.byte	0x14
	.long	0x26b
	.byte	0xa8
	.uleb128 0x1
	.long	.LASF41
	.byte	0x3
	.byte	0x5e
	.byte	0x9
	.long	0x3c
	.byte	0xb0
	.uleb128 0x1
	.long	.LASF42
	.byte	0x3
	.byte	0x5f
	.byte	0x15
	.long	0x299
	.byte	0xb8
	.uleb128 0x1
	.long	.LASF43
	.byte	0x3
	.byte	0x60
	.byte	0x7
	.long	0x72
	.byte	0xc0
	.uleb128 0x1
	.long	.LASF44
	.byte	0x3
	.byte	0x62
	.byte	0x8
	.long	0x29e
	.byte	0xc4
	.byte	0
	.uleb128 0x3
	.long	.LASF45
	.byte	0x4
	.byte	0x7
	.byte	0x19
	.long	0xc6
	.uleb128 0x1b
	.long	.LASF155
	.byte	0x3
	.byte	0x2b
	.byte	0xe
	.uleb128 0x10
	.long	.LASF46
	.uleb128 0x4
	.long	0x261
	.uleb128 0x4
	.long	0xc6
	.uleb128 0x7
	.long	0xae
	.long	0x280
	.uleb128 0x8
	.long	0x2e
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	0x259
	.uleb128 0x10
	.long	.LASF47
	.uleb128 0x4
	.long	0x285
	.uleb128 0x10
	.long	.LASF48
	.uleb128 0x4
	.long	0x28f
	.uleb128 0x4
	.long	0x26b
	.uleb128 0x7
	.long	0xae
	.long	0x2ae
	.uleb128 0x8
	.long	0x2e
	.byte	0x13
	.byte	0
	.uleb128 0x4
	.long	0xb5
	.uleb128 0xd
	.long	0x2ae
	.uleb128 0x4
	.long	0x24d
	.uleb128 0x1c
	.long	.LASF156
	.byte	0x11
	.byte	0x97
	.byte	0xe
	.long	0x2b8
	.uleb128 0x6
	.byte	0x8
	.byte	0x5
	.long	.LASF49
	.uleb128 0x6
	.byte	0x8
	.byte	0x7
	.long	.LASF50
	.uleb128 0x9
	.long	.LASF52
	.byte	0x10
	.byte	0x5
	.byte	0x33
	.byte	0x10
	.long	0x2ff
	.uleb128 0x1
	.long	.LASF53
	.byte	0x5
	.byte	0x35
	.byte	0x23
	.long	0x2ff
	.byte	0
	.uleb128 0x1
	.long	.LASF54
	.byte	0x5
	.byte	0x36
	.byte	0x23
	.long	0x2ff
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.long	0x2d7
	.uleb128 0x3
	.long	.LASF55
	.byte	0x5
	.byte	0x37
	.byte	0x3
	.long	0x2d7
	.uleb128 0x9
	.long	.LASF56
	.byte	0x28
	.byte	0x6
	.byte	0x16
	.byte	0x8
	.long	0x386
	.uleb128 0x1
	.long	.LASF57
	.byte	0x6
	.byte	0x18
	.byte	0x7
	.long	0x72
	.byte	0
	.uleb128 0x1
	.long	.LASF58
	.byte	0x6
	.byte	0x19
	.byte	0x10
	.long	0x35
	.byte	0x4
	.uleb128 0x1
	.long	.LASF59
	.byte	0x6
	.byte	0x1a
	.byte	0x7
	.long	0x72
	.byte	0x8
	.uleb128 0x1
	.long	.LASF60
	.byte	0x6
	.byte	0x1c
	.byte	0x10
	.long	0x35
	.byte	0xc
	.uleb128 0x1
	.long	.LASF61
	.byte	0x6
	.byte	0x20
	.byte	0x7
	.long	0x72
	.byte	0x10
	.uleb128 0x1
	.long	.LASF62
	.byte	0x6
	.byte	0x22
	.byte	0x9
	.long	0x5f
	.byte	0x14
	.uleb128 0x1
	.long	.LASF63
	.byte	0x6
	.byte	0x23
	.byte	0x9
	.long	0x5f
	.byte	0x16
	.uleb128 0x1
	.long	.LASF64
	.byte	0x6
	.byte	0x24
	.byte	0x14
	.long	0x304
	.byte	0x18
	.byte	0
	.uleb128 0x12
	.byte	0x28
	.byte	0x7
	.byte	0x43
	.byte	0x9
	.long	0x3b4
	.uleb128 0xc
	.long	.LASF65
	.byte	0x7
	.byte	0x45
	.byte	0x1c
	.long	0x310
	.uleb128 0xc
	.long	.LASF66
	.byte	0x7
	.byte	0x46
	.byte	0x8
	.long	0x3b4
	.uleb128 0xc
	.long	.LASF67
	.byte	0x7
	.byte	0x47
	.byte	0xc
	.long	0x85
	.byte	0
	.uleb128 0x7
	.long	0xae
	.long	0x3c4
	.uleb128 0x8
	.long	0x2e
	.byte	0x27
	.byte	0
	.uleb128 0x3
	.long	.LASF68
	.byte	0x7
	.byte	0x48
	.byte	0x3
	.long	0x386
	.uleb128 0x4
	.long	0x3da
	.uleb128 0xd
	.long	0x3d0
	.uleb128 0x1d
	.uleb128 0x3
	.long	.LASF69
	.byte	0x8
	.byte	0x18
	.byte	0x13
	.long	0x53
	.uleb128 0x3
	.long	.LASF70
	.byte	0x8
	.byte	0x19
	.byte	0x14
	.long	0x66
	.uleb128 0x3
	.long	.LASF71
	.byte	0x8
	.byte	0x1a
	.byte	0x14
	.long	0x79
	.uleb128 0x1e
	.long	.LASF72
	.byte	0x9
	.value	0x112
	.byte	0x15
	.long	0xba
	.uleb128 0x1f
	.long	.LASF157
	.byte	0x7
	.byte	0x4
	.long	0x35
	.byte	0x14
	.byte	0x18
	.byte	0x6
	.long	0x459
	.uleb128 0xa
	.long	.LASF73
	.byte	0x1
	.uleb128 0xa
	.long	.LASF74
	.byte	0x2
	.uleb128 0xa
	.long	.LASF75
	.byte	0x3
	.uleb128 0xa
	.long	.LASF76
	.byte	0x4
	.uleb128 0xa
	.long	.LASF77
	.byte	0x5
	.uleb128 0xa
	.long	.LASF78
	.byte	0x6
	.uleb128 0xa
	.long	.LASF79
	.byte	0xa
	.uleb128 0x20
	.long	.LASF80
	.long	0x80000
	.uleb128 0x21
	.long	.LASF81
	.value	0x800
	.byte	0
	.uleb128 0x3
	.long	.LASF82
	.byte	0xa
	.byte	0x1c
	.byte	0x1c
	.long	0x45
	.uleb128 0x9
	.long	.LASF83
	.byte	0x10
	.byte	0xb
	.byte	0xb8
	.byte	0x27
	.long	0x48d
	.uleb128 0x1
	.long	.LASF84
	.byte	0xb
	.byte	0xba
	.byte	0x5
	.long	0x459
	.byte	0
	.uleb128 0x1
	.long	.LASF85
	.byte	0xb
	.byte	0xbb
	.byte	0xa
	.long	0x48d
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	0xae
	.long	0x49d
	.uleb128 0x8
	.long	0x2e
	.byte	0xd
	.byte	0
	.uleb128 0x9
	.long	.LASF86
	.byte	0x80
	.byte	0xb
	.byte	0xc5
	.byte	0x27
	.long	0x4d2
	.uleb128 0x1
	.long	.LASF87
	.byte	0xb
	.byte	0xc7
	.byte	0x5
	.long	0x459
	.byte	0
	.uleb128 0x1
	.long	.LASF88
	.byte	0xb
	.byte	0xc8
	.byte	0xa
	.long	0x4d2
	.byte	0x2
	.uleb128 0x1
	.long	.LASF89
	.byte	0xb
	.byte	0xc9
	.byte	0x14
	.long	0x2e
	.byte	0x78
	.byte	0
	.uleb128 0x7
	.long	0xae
	.long	0x4e2
	.uleb128 0x8
	.long	0x2e
	.byte	0x75
	.byte	0
	.uleb128 0x4
	.long	0x465
	.uleb128 0x9
	.long	.LASF90
	.byte	0x10
	.byte	0xc
	.byte	0xf7
	.byte	0x27
	.long	0x529
	.uleb128 0x1
	.long	.LASF91
	.byte	0xc
	.byte	0xf9
	.byte	0x5
	.long	0x459
	.byte	0
	.uleb128 0x1
	.long	.LASF92
	.byte	0xc
	.byte	0xfa
	.byte	0xf
	.long	0x5b6
	.byte	0x2
	.uleb128 0x1
	.long	.LASF93
	.byte	0xc
	.byte	0xfb
	.byte	0x14
	.long	0x59b
	.byte	0x4
	.uleb128 0x1
	.long	.LASF94
	.byte	0xc
	.byte	0xfe
	.byte	0x13
	.long	0x63b
	.byte	0x8
	.byte	0
	.uleb128 0x13
	.long	.LASF95
	.byte	0x1c
	.byte	0xc
	.value	0x108
	.byte	0x27
	.long	0x57e
	.uleb128 0x5
	.long	.LASF96
	.byte	0xc
	.value	0x10a
	.byte	0x5
	.long	0x459
	.byte	0
	.uleb128 0x5
	.long	.LASF97
	.byte	0xc
	.value	0x10b
	.byte	0xf
	.long	0x5b6
	.byte	0x2
	.uleb128 0x5
	.long	.LASF98
	.byte	0xc
	.value	0x10c
	.byte	0xe
	.long	0x3f3
	.byte	0x4
	.uleb128 0x5
	.long	.LASF99
	.byte	0xc
	.value	0x10d
	.byte	0x15
	.long	0x620
	.byte	0x8
	.uleb128 0x5
	.long	.LASF100
	.byte	0xc
	.value	0x10e
	.byte	0xe
	.long	0x3f3
	.byte	0x18
	.byte	0
	.uleb128 0x3
	.long	.LASF101
	.byte	0xd
	.byte	0x54
	.byte	0xa
	.long	0x58a
	.uleb128 0x22
	.byte	0x8
	.byte	0xd
	.byte	0x53
	.byte	0x9
	.uleb128 0x3
	.long	.LASF102
	.byte	0xc
	.byte	0x1e
	.byte	0x12
	.long	0x3f3
	.uleb128 0x9
	.long	.LASF103
	.byte	0x4
	.byte	0xc
	.byte	0x1f
	.byte	0x8
	.long	0x5b6
	.uleb128 0x1
	.long	.LASF104
	.byte	0xc
	.byte	0x21
	.byte	0xf
	.long	0x58f
	.byte	0
	.byte	0
	.uleb128 0x3
	.long	.LASF105
	.byte	0xc
	.byte	0x7d
	.byte	0x12
	.long	0x3e7
	.uleb128 0x12
	.byte	0x10
	.byte	0xc
	.byte	0xdf
	.byte	0x5
	.long	0x5f0
	.uleb128 0xc
	.long	.LASF106
	.byte	0xc
	.byte	0xe1
	.byte	0xa
	.long	0x5f0
	.uleb128 0xc
	.long	.LASF107
	.byte	0xc
	.byte	0xe2
	.byte	0xb
	.long	0x600
	.uleb128 0xc
	.long	.LASF108
	.byte	0xc
	.byte	0xe3
	.byte	0xb
	.long	0x610
	.byte	0
	.uleb128 0x7
	.long	0x3db
	.long	0x600
	.uleb128 0x8
	.long	0x2e
	.byte	0xf
	.byte	0
	.uleb128 0x7
	.long	0x3e7
	.long	0x610
	.uleb128 0x8
	.long	0x2e
	.byte	0x7
	.byte	0
	.uleb128 0x7
	.long	0x3f3
	.long	0x620
	.uleb128 0x8
	.long	0x2e
	.byte	0x3
	.byte	0
	.uleb128 0x9
	.long	.LASF109
	.byte	0x10
	.byte	0xc
	.byte	0xdd
	.byte	0x8
	.long	0x63b
	.uleb128 0x1
	.long	.LASF110
	.byte	0xc
	.byte	0xe4
	.byte	0x9
	.long	0x5c2
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x3e
	.long	0x64b
	.uleb128 0x8
	.long	0x2e
	.byte	0x7
	.byte	0
	.uleb128 0x13
	.long	.LASF111
	.byte	0x30
	.byte	0xe
	.value	0x235
	.byte	0x8
	.long	0x6ca
	.uleb128 0x5
	.long	.LASF112
	.byte	0xe
	.value	0x237
	.byte	0x7
	.long	0x72
	.byte	0
	.uleb128 0x5
	.long	.LASF113
	.byte	0xe
	.value	0x238
	.byte	0x7
	.long	0x72
	.byte	0x4
	.uleb128 0x5
	.long	.LASF114
	.byte	0xe
	.value	0x239
	.byte	0x7
	.long	0x72
	.byte	0x8
	.uleb128 0x5
	.long	.LASF115
	.byte	0xe
	.value	0x23a
	.byte	0x7
	.long	0x72
	.byte	0xc
	.uleb128 0x5
	.long	.LASF116
	.byte	0xe
	.value	0x23b
	.byte	0xd
	.long	0x3ff
	.byte	0x10
	.uleb128 0x5
	.long	.LASF117
	.byte	0xe
	.value	0x23c
	.byte	0x14
	.long	0x4e2
	.byte	0x18
	.uleb128 0x5
	.long	.LASF118
	.byte	0xe
	.value	0x23d
	.byte	0x9
	.long	0xa4
	.byte	0x20
	.uleb128 0x5
	.long	.LASF119
	.byte	0xe
	.value	0x23e
	.byte	0x14
	.long	0x6cf
	.byte	0x28
	.byte	0
	.uleb128 0x11
	.long	0x64b
	.uleb128 0x4
	.long	0x64b
	.uleb128 0x4
	.long	0x6ca
	.uleb128 0xd
	.long	0x6d4
	.uleb128 0x6
	.byte	0x10
	.byte	0x5
	.long	.LASF120
	.uleb128 0x6
	.byte	0x10
	.byte	0x7
	.long	.LASF121
	.uleb128 0x23
	.byte	0xd0
	.byte	0xf
	.byte	0xe3
	.byte	0x9
	.long	0x778
	.uleb128 0x1
	.long	.LASF122
	.byte	0xf
	.byte	0xe5
	.byte	0x9
	.long	0x72
	.byte	0
	.uleb128 0x1
	.long	.LASF123
	.byte	0xf
	.byte	0xe6
	.byte	0x9
	.long	0x72
	.byte	0x4
	.uleb128 0x1
	.long	.LASF124
	.byte	0xf
	.byte	0xe7
	.byte	0x1d
	.long	0x49d
	.byte	0x8
	.uleb128 0x1
	.long	.LASF125
	.byte	0xf
	.byte	0xe8
	.byte	0x16
	.long	0x6cf
	.byte	0x88
	.uleb128 0x1
	.long	.LASF126
	.byte	0xf
	.byte	0xe9
	.byte	0x9
	.long	0x72
	.byte	0x90
	.uleb128 0x1
	.long	.LASF127
	.byte	0xf
	.byte	0xea
	.byte	0x9
	.long	0x72
	.byte	0x94
	.uleb128 0x1
	.long	.LASF128
	.byte	0xf
	.byte	0xeb
	.byte	0x9
	.long	0x72
	.byte	0x98
	.uleb128 0x1
	.long	.LASF129
	.byte	0xf
	.byte	0xec
	.byte	0x9
	.long	0x72
	.byte	0x9c
	.uleb128 0x1
	.long	.LASF130
	.byte	0xf
	.byte	0xed
	.byte	0x9
	.long	0x72
	.byte	0xa0
	.uleb128 0x1
	.long	.LASF131
	.byte	0xf
	.byte	0xee
	.byte	0x15
	.long	0x3c4
	.byte	0xa8
	.byte	0
	.uleb128 0x3
	.long	.LASF132
	.byte	0xf
	.byte	0xef
	.byte	0x3
	.long	0x6ec
	.uleb128 0xb
	.long	.LASF133
	.byte	0xd
	.value	0x128
	.byte	0xc
	.long	0x72
	.long	0x7a0
	.uleb128 0x2
	.long	0x72
	.uleb128 0x2
	.long	0x72
	.byte	0
	.uleb128 0x14
	.long	.LASF138
	.byte	0xe
	.value	0x29a
	.long	0x7b2
	.uleb128 0x2
	.long	0x6cf
	.byte	0
	.uleb128 0xe
	.long	.LASF134
	.byte	0x10
	.byte	0x40
	.byte	0x14
	.long	0x2ae
	.long	0x7d7
	.uleb128 0x2
	.long	0x72
	.uleb128 0x2
	.long	0x3d5
	.uleb128 0x2
	.long	0xa9
	.uleb128 0x2
	.long	0x3ff
	.byte	0
	.uleb128 0xb
	.long	.LASF135
	.byte	0x9
	.value	0x166
	.byte	0xc
	.long	0x72
	.long	0x7ee
	.uleb128 0x2
	.long	0x72
	.byte	0
	.uleb128 0xe
	.long	.LASF136
	.byte	0xd
	.byte	0x70
	.byte	0xc
	.long	0x72
	.long	0x80e
	.uleb128 0x2
	.long	0x72
	.uleb128 0x2
	.long	0x57e
	.uleb128 0x2
	.long	0x3ff
	.byte	0
	.uleb128 0xb
	.long	.LASF137
	.byte	0xd
	.value	0x115
	.byte	0xc
	.long	0x72
	.long	0x839
	.uleb128 0x2
	.long	0x72
	.uleb128 0x2
	.long	0x72
	.uleb128 0x2
	.long	0x72
	.uleb128 0x2
	.long	0x3d0
	.uleb128 0x2
	.long	0x3ff
	.byte	0
	.uleb128 0x14
	.long	.LASF139
	.byte	0x11
	.value	0x364
	.long	0x84b
	.uleb128 0x2
	.long	0x2ae
	.byte	0
	.uleb128 0xe
	.long	.LASF140
	.byte	0xd
	.byte	0x66
	.byte	0xc
	.long	0x72
	.long	0x86b
	.uleb128 0x2
	.long	0x72
	.uleb128 0x2
	.long	0x72
	.uleb128 0x2
	.long	0x72
	.byte	0
	.uleb128 0xb
	.long	.LASF141
	.byte	0x11
	.value	0x16b
	.byte	0xc
	.long	0x72
	.long	0x883
	.uleb128 0x2
	.long	0x2ae
	.uleb128 0x15
	.byte	0
	.uleb128 0xb
	.long	.LASF142
	.byte	0x11
	.value	0x165
	.byte	0xc
	.long	0x72
	.long	0x8a0
	.uleb128 0x2
	.long	0x2b8
	.uleb128 0x2
	.long	0x2ae
	.uleb128 0x15
	.byte	0
	.uleb128 0xb
	.long	.LASF143
	.byte	0xe
	.value	0x29d
	.byte	0x14
	.long	0x2ae
	.long	0x8b7
	.uleb128 0x2
	.long	0x72
	.byte	0
	.uleb128 0xb
	.long	.LASF144
	.byte	0xe
	.value	0x294
	.byte	0xc
	.long	0x72
	.long	0x8dd
	.uleb128 0x2
	.long	0x2b3
	.uleb128 0x2
	.long	0x2b3
	.uleb128 0x2
	.long	0x6d9
	.uleb128 0x2
	.long	0x8e2
	.byte	0
	.uleb128 0x4
	.long	0x6cf
	.uleb128 0xd
	.long	0x8dd
	.uleb128 0x24
	.long	.LASF145
	.byte	0x12
	.value	0x2f4
	.byte	0xd
	.long	0x8fa
	.uleb128 0x2
	.long	0x72
	.byte	0
	.uleb128 0xe
	.long	.LASF146
	.byte	0x12
	.byte	0x69
	.byte	0xc
	.long	0x72
	.long	0x910
	.uleb128 0x2
	.long	0x2ae
	.byte	0
	.uleb128 0xe
	.long	.LASF147
	.byte	0x13
	.byte	0x3d
	.byte	0xe
	.long	0x3c
	.long	0x930
	.uleb128 0x2
	.long	0x3c
	.uleb128 0x2
	.long	0x72
	.uleb128 0x2
	.long	0x2e
	.byte	0
	.uleb128 0x25
	.long	.LASF152
	.byte	0x1
	.byte	0x36
	.byte	0x6
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x9db
	.uleb128 0x16
	.string	"sd"
	.byte	0x36
	.byte	0x21
	.long	0x9db
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x26
	.long	.LASF130
	.byte	0x1
	.byte	0x36
	.byte	0x2b
	.long	0xa4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0xf
	.long	.LASF148
	.byte	0x38
	.byte	0x15
	.long	0x64b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0xf
	.long	.LASF149
	.byte	0x38
	.byte	0x1d
	.long	0x6cf
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x17
	.string	"ip"
	.byte	0x39
	.byte	0xa
	.long	0x9e0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0xf
	.long	.LASF150
	.byte	0x3b
	.byte	0x9
	.long	0x72
	.uleb128 0x3
	.byte	0x91
	.sleb128 -148
	.uleb128 0xf
	.long	.LASF122
	.byte	0x3c
	.byte	0x9
	.long	0x72
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0xf
	.long	.LASF151
	.byte	0x44
	.byte	0xb
	.long	0xa4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x27
	.long	.LLRL0
	.uleb128 0x17
	.string	"yes"
	.byte	0x66
	.byte	0xd
	.long	0x72
	.uleb128 0x3
	.byte	0x91
	.sleb128 -156
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	0x778
	.uleb128 0x7
	.long	0xae
	.long	0x9f0
	.uleb128 0x8
	.long	0x2e
	.byte	0x2d
	.byte	0
	.uleb128 0x28
	.long	.LASF153
	.byte	0x1
	.byte	0x19
	.byte	0x7
	.long	0x3c
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x16
	.string	"sa"
	.byte	0x19
	.byte	0x23
	.long	0x4e2
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
	.uleb128 0x6
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
	.uleb128 0xd
	.uleb128 0x37
	.byte	0
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
	.uleb128 0xb
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
.LASF141:
	.string	"printf"
.LASF12:
	.string	"__off_t"
.LASF66:
	.string	"__size"
.LASF17:
	.string	"_IO_read_ptr"
.LASF29:
	.string	"_chain"
.LASF112:
	.string	"ai_flags"
.LASF151:
	.string	"server_port"
.LASF110:
	.string	"__in6_u"
.LASF53:
	.string	"__prev"
.LASF140:
	.string	"socket"
.LASF67:
	.string	"__align"
.LASF35:
	.string	"_shortbuf"
.LASF111:
	.string	"addrinfo"
.LASF8:
	.string	"__uint8_t"
.LASF154:
	.string	"GNU C17 14.2.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF23:
	.string	"_IO_buf_base"
.LASF81:
	.string	"SOCK_NONBLOCK"
.LASF50:
	.string	"long long unsigned int"
.LASF102:
	.string	"in_addr_t"
.LASF54:
	.string	"__next"
.LASF124:
	.string	"client_info"
.LASF72:
	.string	"socklen_t"
.LASF38:
	.string	"_codecvt"
.LASF128:
	.string	"sentBytes"
.LASF49:
	.string	"long long int"
.LASF6:
	.string	"signed char"
.LASF150:
	.string	"status"
.LASF135:
	.string	"close"
.LASF122:
	.string	"sockfd"
.LASF152:
	.string	"init_socket"
.LASF30:
	.string	"_fileno"
.LASF18:
	.string	"_IO_read_end"
.LASF107:
	.string	"__u6_addr16"
.LASF11:
	.string	"long int"
.LASF108:
	.string	"__u6_addr32"
.LASF16:
	.string	"_flags"
.LASF39:
	.string	"_wide_data"
.LASF24:
	.string	"_IO_buf_end"
.LASF33:
	.string	"_cur_column"
.LASF73:
	.string	"SOCK_STREAM"
.LASF47:
	.string	"_IO_codecvt"
.LASF97:
	.string	"sin6_port"
.LASF32:
	.string	"_old_offset"
.LASF37:
	.string	"_offset"
.LASF55:
	.string	"__pthread_list_t"
.LASF56:
	.string	"__pthread_mutex_s"
.LASF10:
	.string	"__uint32_t"
.LASF94:
	.string	"sin_zero"
.LASF130:
	.string	"port"
.LASF149:
	.string	"temp"
.LASF46:
	.string	"_IO_marker"
.LASF76:
	.string	"SOCK_RDM"
.LASF3:
	.string	"unsigned int"
.LASF104:
	.string	"s_addr"
.LASF70:
	.string	"uint16_t"
.LASF127:
	.string	"recvBytes"
.LASF120:
	.string	"__int128"
.LASF114:
	.string	"ai_socktype"
.LASF2:
	.string	"long unsigned int"
.LASF61:
	.string	"__kind"
.LASF65:
	.string	"__data"
.LASF148:
	.string	"hints"
.LASF136:
	.string	"bind"
.LASF126:
	.string	"addr_len"
.LASF125:
	.string	"server_info"
.LASF5:
	.string	"short unsigned int"
.LASF93:
	.string	"sin_addr"
.LASF133:
	.string	"listen"
.LASF25:
	.string	"_IO_save_base"
.LASF36:
	.string	"_lock"
.LASF31:
	.string	"_flags2"
.LASF43:
	.string	"_mode"
.LASF101:
	.string	"__CONST_SOCKADDR_ARG"
.LASF59:
	.string	"__owner"
.LASF139:
	.string	"perror"
.LASF91:
	.string	"sin_family"
.LASF96:
	.string	"sin6_family"
.LASF144:
	.string	"getaddrinfo"
.LASF132:
	.string	"sockdetails_t"
.LASF22:
	.string	"_IO_write_end"
.LASF42:
	.string	"_prevchain"
.LASF115:
	.string	"ai_protocol"
.LASF138:
	.string	"freeaddrinfo"
.LASF86:
	.string	"sockaddr_storage"
.LASF155:
	.string	"_IO_lock_t"
.LASF153:
	.string	"getin_addr"
.LASF51:
	.string	"_IO_FILE"
.LASF78:
	.string	"SOCK_DCCP"
.LASF52:
	.string	"__pthread_internal_list"
.LASF116:
	.string	"ai_addrlen"
.LASF92:
	.string	"sin_port"
.LASF84:
	.string	"sa_family"
.LASF28:
	.string	"_markers"
.LASF157:
	.string	"__socket_type"
.LASF121:
	.string	"__int128 unsigned"
.LASF100:
	.string	"sin6_scope_id"
.LASF146:
	.string	"atoi"
.LASF4:
	.string	"unsigned char"
.LASF117:
	.string	"ai_addr"
.LASF7:
	.string	"short int"
.LASF119:
	.string	"ai_next"
.LASF34:
	.string	"_vtable_offset"
.LASF45:
	.string	"FILE"
.LASF123:
	.string	"client_sock_fd"
.LASF79:
	.string	"SOCK_PACKET"
.LASF109:
	.string	"in6_addr"
.LASF58:
	.string	"__count"
.LASF57:
	.string	"__lock"
.LASF71:
	.string	"uint32_t"
.LASF142:
	.string	"fprintf"
.LASF14:
	.string	"char"
.LASF87:
	.string	"ss_family"
.LASF15:
	.string	"__socklen_t"
.LASF98:
	.string	"sin6_flowinfo"
.LASF9:
	.string	"__uint16_t"
.LASF63:
	.string	"__elision"
.LASF106:
	.string	"__u6_addr8"
.LASF113:
	.string	"ai_family"
.LASF134:
	.string	"inet_ntop"
.LASF13:
	.string	"__off64_t"
.LASF19:
	.string	"_IO_read_base"
.LASF143:
	.string	"gai_strerror"
.LASF27:
	.string	"_IO_save_end"
.LASF68:
	.string	"pthread_mutex_t"
.LASF62:
	.string	"__spins"
.LASF82:
	.string	"sa_family_t"
.LASF44:
	.string	"_unused2"
.LASF156:
	.string	"stderr"
.LASF147:
	.string	"memset"
.LASF80:
	.string	"SOCK_CLOEXEC"
.LASF145:
	.string	"exit"
.LASF95:
	.string	"sockaddr_in6"
.LASF89:
	.string	"__ss_align"
.LASF83:
	.string	"sockaddr"
.LASF74:
	.string	"SOCK_DGRAM"
.LASF137:
	.string	"setsockopt"
.LASF90:
	.string	"sockaddr_in"
.LASF41:
	.string	"_freeres_buf"
.LASF69:
	.string	"uint8_t"
.LASF60:
	.string	"__nusers"
.LASF26:
	.string	"_IO_backup_base"
.LASF88:
	.string	"__ss_padding"
.LASF85:
	.string	"sa_data"
.LASF40:
	.string	"_freeres_list"
.LASF64:
	.string	"__list"
.LASF75:
	.string	"SOCK_RAW"
.LASF118:
	.string	"ai_canonname"
.LASF48:
	.string	"_IO_wide_data"
.LASF99:
	.string	"sin6_addr"
.LASF77:
	.string	"SOCK_SEQPACKET"
.LASF129:
	.string	"timeout"
.LASF131:
	.string	"lock"
.LASF20:
	.string	"_IO_write_base"
.LASF105:
	.string	"in_port_t"
.LASF21:
	.string	"_IO_write_ptr"
.LASF103:
	.string	"in_addr"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/parth/Work/All_data/university/Network System/Assignments/PA3"
.LASF0:
	.string	"src/setup.c"
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
