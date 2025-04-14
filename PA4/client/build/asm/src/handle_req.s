	.file	"handle_req.c"
	.text
.Ltext0:
	.file 0 "/home/parth/Work/All_data/university/Network System/Assignments/PA4/client" "src/handle_req.c"
	.globl	get_in_addr
	.type	get_in_addr, @function
get_in_addr:
.LFB320:
	.file 1 "src/handle_req.c"
	.loc 1 20 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	.loc 1 21 11
	movq	-8(%rbp), %rax
	movzwl	(%rax), %eax
	.loc 1 21 8
	cmpw	$2, %ax
	jne	.L2
	.loc 1 23 16
	movq	-8(%rbp), %rax
	addq	$4, %rax
	jmp	.L3
.L2:
	.loc 1 26 12
	movq	-8(%rbp), %rax
	addq	$8, %rax
.L3:
	.loc 1 27 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE320:
	.size	get_in_addr, .-get_in_addr
	.section	.rodata
.LC0:
	.string	"hellow "
	.align 8
.LC1:
	.string	"\033[31m[-] Port Value < 1024 ! keep port value higher than 1024 \n\033[0m"
	.align 8
.LC2:
	.string	"server ip %s, server port %s \n"
.LC3:
	.string	"\033[31mgetaddrinfo: %s\n\033[0m"
.LC4:
	.string	"\033[31mserver: socket"
	.align 8
.LC5:
	.string	"\033[31m\n[-] (%d) connect failed for server %d\n\033[0m"
	.align 8
.LC6:
	.string	"\033[32m[+] (%d) Connection established to server: %s\n[+] (%d) Server IP address: %s:%s\n\033[0m"
	.text
	.globl	initialize_and_save
	.type	initialize_and_save, @function
initialize_and_save:
.LFB321:
	.loc 1 30 44
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$168, %rsp
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	movq	%rdi, -184(%rbp)
	.loc 1 30 44
	movq	%fs:40, %rax
	movq	%rax, -40(%rbp)
	xorl	%eax, %eax
	.loc 1 31 22
	movq	-184(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -160(%rbp)
	.loc 1 32 10
	jmp	.L5
.L15:
.LBB2:
	.loc 1 33 9
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 42 9
	leaq	-144(%rbp), %rax
	movl	$48, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 43 25
	movl	$0, -140(%rbp)
	.loc 1 44 27
	movl	$1, -136(%rbp)
	.loc 1 46 25
	movq	-160(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 46 13
	movq	%rax, %rdi
	call	atoi@PLT
	.loc 1 46 12 discriminator 1
	cmpl	$1024, %eax
	jg	.L6
	.loc 1 48 13
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$67, %edx
	movl	$1, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 49 13
	movl	$1, %edi
	call	exit@PLT
.L6:
	.loc 1 52 9
	movq	-160(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-160(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 53 23
	movq	-184(%rbp), %rax
	leaq	32(%rax), %rcx
	.loc 1 53 62
	movq	-160(%rbp), %rax
	movq	8(%rax), %rsi
	.loc 1 53 42
	movq	-160(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 53 23
	leaq	-144(%rbp), %rdx
	movq	%rax, %rdi
	call	getaddrinfo@PLT
	movl	%eax, -164(%rbp)
	.loc 1 53 12 discriminator 1
	cmpl	$0, -164(%rbp)
	jns	.L7
	.loc 1 55 13
	movl	-164(%rbp), %eax
	movl	%eax, %edi
	call	gai_strerror@PLT
	movq	%rax, %rdx
	.loc 1 55 13 is_stmt 0 discriminator 1
	movq	stderr(%rip), %rax
	leaq	.LC3(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 56 13 is_stmt 1
	movl	$1, %edi
	call	exit@PLT
.L7:
	.loc 1 59 19
	movq	-184(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -152(%rbp)
	.loc 1 59 9
	jmp	.L8
.L13:
	.loc 1 61 44
	movq	-152(%rbp), %rax
	movl	12(%rax), %edx
	movq	-152(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-152(%rbp), %rax
	movl	4(%rax), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	socket@PLT
	.loc 1 61 42 discriminator 1
	movq	-160(%rbp), %rdx
	movl	%eax, (%rdx)
	.loc 1 61 25 discriminator 1
	movq	-160(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 61 16 discriminator 1
	testl	%eax, %eax
	jns	.L9
	.loc 1 63 17
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	.loc 1 64 17
	jmp	.L10
.L9:
	.loc 1 67 18
	movq	-152(%rbp), %rax
	movl	16(%rax), %edx
	.loc 1 67 55
	movq	-152(%rbp), %rax
	movq	24(%rax), %rax
	.loc 1 67 18
	movq	%rax, %rcx
	movq	-160(%rbp), %rax
	movl	(%rax), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	connect@PLT
	.loc 1 67 16 discriminator 1
	testl	%eax, %eax
	jns	.L17
	.loc 1 69 98
	call	__errno_location@PLT
	.loc 1 69 17 discriminator 1
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	.loc 1 69 17 is_stmt 0 discriminator 2
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 70 17 is_stmt 1
	movq	-160(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 71 17
	nop
.L10:
	.loc 1 59 61 discriminator 2
	movq	-152(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -152(%rbp)
.L8:
	.loc 1 59 47 discriminator 1
	cmpq	$0, -152(%rbp)
	jne	.L13
	jmp	.L12
.L17:
	.loc 1 74 13
	nop
.L12:
	.loc 1 77 12
	cmpq	$0, -152(%rbp)
	jne	.L14
	.loc 1 79 94
	call	__errno_location@PLT
	.loc 1 79 13 discriminator 1
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	.loc 1 79 13 is_stmt 0 discriminator 2
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 80 13 is_stmt 1
	movl	$1, %edi
	call	exit@PLT
.L14:
	.loc 1 84 36
	movq	-152(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	get_in_addr
	movq	%rax, %rsi
	.loc 1 84 9 discriminator 1
	movq	-152(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-96(%rbp), %rdx
	movl	$46, %ecx
	movl	%eax, %edi
	call	inet_ntop@PLT
	.loc 1 85 9
	movq	-160(%rbp), %rax
	movq	8(%rax), %r13
	call	gettid@PLT
	movl	%eax, %r12d
	.loc 1 85 9 is_stmt 0 discriminator 1
	movq	-160(%rbp), %rax
	movq	16(%rax), %rbx
	call	gettid@PLT
	.loc 1 85 9 discriminator 2
	leaq	-96(%rbp), %rdx
	movq	%r13, %r9
	movq	%rdx, %r8
	movl	%r12d, %ecx
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 92 17 is_stmt 1
	movq	-160(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -160(%rbp)
.L5:
.LBE2:
	.loc 1 32 11
	cmpq	$0, -160(%rbp)
	jne	.L15
	.loc 1 94 1
	nop
	movq	-40(%rbp), %rax
	subq	%fs:40, %rax
	je	.L16
	call	__stack_chk_fail@PLT
.L16:
	addq	$168, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE321:
	.size	initialize_and_save, .-initialize_and_save
	.globl	connect_save_and_send
	.type	connect_save_and_send, @function
connect_save_and_send:
.LFB322:
	.loc 1 96 61
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	.loc 1 97 22
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -8(%rbp)
	.loc 1 102 1
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE322:
	.size	connect_save_and_send, .-connect_save_and_send
	.globl	handle_req
	.type	handle_req, @function
handle_req:
.LFB323:
	.loc 1 121 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	-28672(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$2240, %rsp
	movq	%rdi, -30904(%rbp)
	.loc 1 121 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.LBB3:
	.loc 1 128 5
	leaq	-30864(%rbp), %rax
	movq	%rax, -30888(%rbp)
	movl	$0, -30892(%rbp)
	jmp	.L20
.L21:
	.loc 1 128 5 is_stmt 0 discriminator 3
	movq	-30888(%rbp), %rax
	movl	-30892(%rbp), %edx
	movq	$0, (%rax,%rdx,8)
	addl	$1, -30892(%rbp)
.L20:
	.loc 1 128 5 discriminator 1
	cmpl	$15, -30892(%rbp)
	jbe	.L21
.LBE3:
	.loc 1 132 20 is_stmt 1
	movq	$10, -30880(%rbp)
	movq	$0, -30872(%rbp)
	.loc 1 134 5
	movq	-30904(%rbp), %rax
	movq	%rax, %rdi
	call	initialize_and_save
	.loc 1 280 12
	movl	$0, %eax
	.loc 1 281 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L23
	call	__stack_chk_fail@PLT
.L23:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE323:
	.size	handle_req, .-handle_req
.Letext0:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h"
	.file 6 "/usr/include/x86_64-linux-gnu/sys/select.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h"
	.file 9 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.file 10 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h"
	.file 11 "/usr/include/unistd.h"
	.file 12 "/usr/include/x86_64-linux-gnu/bits/sockaddr.h"
	.file 13 "/usr/include/x86_64-linux-gnu/bits/socket.h"
	.file 14 "/usr/include/netinet/in.h"
	.file 15 "/usr/include/x86_64-linux-gnu/sys/socket.h"
	.file 16 "/usr/include/netdb.h"
	.file 17 "./common.h"
	.file 18 "/usr/include/arpa/inet.h"
	.file 19 "/usr/include/x86_64-linux-gnu/bits/unistd_ext.h"
	.file 20 "/usr/include/errno.h"
	.file 21 "/usr/include/stdio.h"
	.file 22 "/usr/include/stdlib.h"
	.file 23 "/usr/include/string.h"
	.file 24 "/usr/include/x86_64-linux-gnu/bits/socket_type.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xb76
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x1b
	.long	.LASF169
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x1c
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
	.byte	0x2
	.byte	0x26
	.byte	0x17
	.long	0x3e
	.uleb128 0x5
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x3
	.long	.LASF9
	.byte	0x2
	.byte	0x28
	.byte	0x1c
	.long	0x45
	.uleb128 0x1d
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.long	.LASF10
	.byte	0x2
	.byte	0x2a
	.byte	0x16
	.long	0x35
	.uleb128 0x5
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
	.uleb128 0x3
	.long	.LASF14
	.byte	0x2
	.byte	0x9a
	.byte	0x19
	.long	0x72
	.uleb128 0x3
	.long	.LASF15
	.byte	0x2
	.byte	0xa0
	.byte	0x1a
	.long	0x85
	.uleb128 0x3
	.long	.LASF16
	.byte	0x2
	.byte	0xa2
	.byte	0x1f
	.long	0x85
	.uleb128 0x4
	.long	0xd2
	.uleb128 0xd
	.long	0xc8
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.long	.LASF17
	.uleb128 0x14
	.long	0xd2
	.uleb128 0x3
	.long	.LASF18
	.byte	0x2
	.byte	0xd2
	.byte	0x17
	.long	0x35
	.uleb128 0xa
	.long	.LASF53
	.byte	0xd8
	.byte	0x3
	.byte	0x31
	.byte	0x8
	.long	0x271
	.uleb128 0x1
	.long	.LASF19
	.byte	0x3
	.byte	0x33
	.byte	0x7
	.long	0x72
	.byte	0
	.uleb128 0x1
	.long	.LASF20
	.byte	0x3
	.byte	0x36
	.byte	0x9
	.long	0xc8
	.byte	0x8
	.uleb128 0x1
	.long	.LASF21
	.byte	0x3
	.byte	0x37
	.byte	0x9
	.long	0xc8
	.byte	0x10
	.uleb128 0x1
	.long	.LASF22
	.byte	0x3
	.byte	0x38
	.byte	0x9
	.long	0xc8
	.byte	0x18
	.uleb128 0x1
	.long	.LASF23
	.byte	0x3
	.byte	0x39
	.byte	0x9
	.long	0xc8
	.byte	0x20
	.uleb128 0x1
	.long	.LASF24
	.byte	0x3
	.byte	0x3a
	.byte	0x9
	.long	0xc8
	.byte	0x28
	.uleb128 0x1
	.long	.LASF25
	.byte	0x3
	.byte	0x3b
	.byte	0x9
	.long	0xc8
	.byte	0x30
	.uleb128 0x1
	.long	.LASF26
	.byte	0x3
	.byte	0x3c
	.byte	0x9
	.long	0xc8
	.byte	0x38
	.uleb128 0x1
	.long	.LASF27
	.byte	0x3
	.byte	0x3d
	.byte	0x9
	.long	0xc8
	.byte	0x40
	.uleb128 0x1
	.long	.LASF28
	.byte	0x3
	.byte	0x40
	.byte	0x9
	.long	0xc8
	.byte	0x48
	.uleb128 0x1
	.long	.LASF29
	.byte	0x3
	.byte	0x41
	.byte	0x9
	.long	0xc8
	.byte	0x50
	.uleb128 0x1
	.long	.LASF30
	.byte	0x3
	.byte	0x42
	.byte	0x9
	.long	0xc8
	.byte	0x58
	.uleb128 0x1
	.long	.LASF31
	.byte	0x3
	.byte	0x44
	.byte	0x16
	.long	0x28a
	.byte	0x60
	.uleb128 0x1
	.long	.LASF32
	.byte	0x3
	.byte	0x46
	.byte	0x14
	.long	0x28f
	.byte	0x68
	.uleb128 0x1
	.long	.LASF33
	.byte	0x3
	.byte	0x48
	.byte	0x7
	.long	0x72
	.byte	0x70
	.uleb128 0x1
	.long	.LASF34
	.byte	0x3
	.byte	0x49
	.byte	0x7
	.long	0x72
	.byte	0x74
	.uleb128 0x1
	.long	.LASF35
	.byte	0x3
	.byte	0x4a
	.byte	0xb
	.long	0x8c
	.byte	0x78
	.uleb128 0x1
	.long	.LASF36
	.byte	0x3
	.byte	0x4d
	.byte	0x12
	.long	0x45
	.byte	0x80
	.uleb128 0x1
	.long	.LASF37
	.byte	0x3
	.byte	0x4e
	.byte	0xf
	.long	0x4c
	.byte	0x82
	.uleb128 0x1
	.long	.LASF38
	.byte	0x3
	.byte	0x4f
	.byte	0x8
	.long	0x294
	.byte	0x83
	.uleb128 0x1
	.long	.LASF39
	.byte	0x3
	.byte	0x51
	.byte	0xf
	.long	0x2a4
	.byte	0x88
	.uleb128 0x1
	.long	.LASF40
	.byte	0x3
	.byte	0x59
	.byte	0xd
	.long	0x98
	.byte	0x90
	.uleb128 0x1
	.long	.LASF41
	.byte	0x3
	.byte	0x5b
	.byte	0x17
	.long	0x2ae
	.byte	0x98
	.uleb128 0x1
	.long	.LASF42
	.byte	0x3
	.byte	0x5c
	.byte	0x19
	.long	0x2b8
	.byte	0xa0
	.uleb128 0x1
	.long	.LASF43
	.byte	0x3
	.byte	0x5d
	.byte	0x14
	.long	0x28f
	.byte	0xa8
	.uleb128 0x1
	.long	.LASF44
	.byte	0x3
	.byte	0x5e
	.byte	0x9
	.long	0x3c
	.byte	0xb0
	.uleb128 0x1
	.long	.LASF45
	.byte	0x3
	.byte	0x5f
	.byte	0x15
	.long	0x2bd
	.byte	0xb8
	.uleb128 0x1
	.long	.LASF46
	.byte	0x3
	.byte	0x60
	.byte	0x7
	.long	0x72
	.byte	0xc0
	.uleb128 0x1
	.long	.LASF47
	.byte	0x3
	.byte	0x62
	.byte	0x8
	.long	0x2c2
	.byte	0xc4
	.byte	0
	.uleb128 0x3
	.long	.LASF48
	.byte	0x4
	.byte	0x7
	.byte	0x19
	.long	0xea
	.uleb128 0x1e
	.long	.LASF170
	.byte	0x3
	.byte	0x2b
	.byte	0xe
	.uleb128 0x11
	.long	.LASF49
	.uleb128 0x4
	.long	0x285
	.uleb128 0x4
	.long	0xea
	.uleb128 0x7
	.long	0xd2
	.long	0x2a4
	.uleb128 0x8
	.long	0x2e
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	0x27d
	.uleb128 0x11
	.long	.LASF50
	.uleb128 0x4
	.long	0x2a9
	.uleb128 0x11
	.long	.LASF51
	.uleb128 0x4
	.long	0x2b3
	.uleb128 0x4
	.long	0x28f
	.uleb128 0x7
	.long	0xd2
	.long	0x2d2
	.uleb128 0x8
	.long	0x2e
	.byte	0x13
	.byte	0
	.uleb128 0x4
	.long	0xd9
	.uleb128 0xd
	.long	0x2d2
	.uleb128 0x4
	.long	0x271
	.uleb128 0x1f
	.long	.LASF171
	.byte	0x15
	.byte	0x97
	.byte	0xe
	.long	0x2dc
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.long	.LASF52
	.uleb128 0xa
	.long	.LASF54
	.byte	0x10
	.byte	0x5
	.byte	0x8
	.byte	0x8
	.long	0x31c
	.uleb128 0x1
	.long	.LASF55
	.byte	0x5
	.byte	0xe
	.byte	0xc
	.long	0xb0
	.byte	0
	.uleb128 0x1
	.long	.LASF56
	.byte	0x5
	.byte	0xf
	.byte	0x11
	.long	0xbc
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	.LASF57
	.byte	0x6
	.byte	0x31
	.byte	0x12
	.long	0x85
	.uleb128 0x15
	.byte	0x80
	.byte	0x6
	.byte	0x3b
	.long	0x33e
	.uleb128 0x1
	.long	.LASF58
	.byte	0x6
	.byte	0x40
	.byte	0xf
	.long	0x33e
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x31c
	.long	0x34e
	.uleb128 0x8
	.long	0x2e
	.byte	0xf
	.byte	0
	.uleb128 0x3
	.long	.LASF59
	.byte	0x6
	.byte	0x46
	.byte	0x5
	.long	0x328
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.long	.LASF60
	.uleb128 0xa
	.long	.LASF61
	.byte	0x10
	.byte	0x7
	.byte	0x33
	.byte	0x10
	.long	0x389
	.uleb128 0x1
	.long	.LASF62
	.byte	0x7
	.byte	0x35
	.byte	0x23
	.long	0x389
	.byte	0
	.uleb128 0x1
	.long	.LASF63
	.byte	0x7
	.byte	0x36
	.byte	0x23
	.long	0x389
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.long	0x361
	.uleb128 0x3
	.long	.LASF64
	.byte	0x7
	.byte	0x37
	.byte	0x3
	.long	0x361
	.uleb128 0xa
	.long	.LASF65
	.byte	0x28
	.byte	0x8
	.byte	0x16
	.byte	0x8
	.long	0x410
	.uleb128 0x1
	.long	.LASF66
	.byte	0x8
	.byte	0x18
	.byte	0x7
	.long	0x72
	.byte	0
	.uleb128 0x1
	.long	.LASF67
	.byte	0x8
	.byte	0x19
	.byte	0x10
	.long	0x35
	.byte	0x4
	.uleb128 0x1
	.long	.LASF68
	.byte	0x8
	.byte	0x1a
	.byte	0x7
	.long	0x72
	.byte	0x8
	.uleb128 0x1
	.long	.LASF69
	.byte	0x8
	.byte	0x1c
	.byte	0x10
	.long	0x35
	.byte	0xc
	.uleb128 0x1
	.long	.LASF70
	.byte	0x8
	.byte	0x20
	.byte	0x7
	.long	0x72
	.byte	0x10
	.uleb128 0x1
	.long	.LASF71
	.byte	0x8
	.byte	0x22
	.byte	0x9
	.long	0x5f
	.byte	0x14
	.uleb128 0x1
	.long	.LASF72
	.byte	0x8
	.byte	0x23
	.byte	0x9
	.long	0x5f
	.byte	0x16
	.uleb128 0x1
	.long	.LASF73
	.byte	0x8
	.byte	0x24
	.byte	0x14
	.long	0x38e
	.byte	0x18
	.byte	0
	.uleb128 0x16
	.byte	0x28
	.byte	0x9
	.byte	0x43
	.byte	0x9
	.long	0x43e
	.uleb128 0xc
	.long	.LASF74
	.byte	0x9
	.byte	0x45
	.byte	0x1c
	.long	0x39a
	.uleb128 0xc
	.long	.LASF75
	.byte	0x9
	.byte	0x46
	.byte	0x8
	.long	0x43e
	.uleb128 0xc
	.long	.LASF76
	.byte	0x9
	.byte	0x47
	.byte	0xc
	.long	0x85
	.byte	0
	.uleb128 0x7
	.long	0xd2
	.long	0x44e
	.uleb128 0x8
	.long	0x2e
	.byte	0x27
	.byte	0
	.uleb128 0x3
	.long	.LASF77
	.byte	0x9
	.byte	0x48
	.byte	0x3
	.long	0x410
	.uleb128 0x4
	.long	0x464
	.uleb128 0xd
	.long	0x45a
	.uleb128 0x20
	.uleb128 0x3
	.long	.LASF78
	.byte	0xa
	.byte	0x18
	.byte	0x13
	.long	0x53
	.uleb128 0x3
	.long	.LASF79
	.byte	0xa
	.byte	0x19
	.byte	0x14
	.long	0x66
	.uleb128 0x3
	.long	.LASF80
	.byte	0xa
	.byte	0x1a
	.byte	0x14
	.long	0x79
	.uleb128 0x21
	.long	.LASF81
	.byte	0xb
	.value	0x112
	.byte	0x15
	.long	0xde
	.uleb128 0x22
	.long	.LASF172
	.byte	0x7
	.byte	0x4
	.long	0x35
	.byte	0x18
	.byte	0x18
	.byte	0x6
	.long	0x4e3
	.uleb128 0xb
	.long	.LASF82
	.byte	0x1
	.uleb128 0xb
	.long	.LASF83
	.byte	0x2
	.uleb128 0xb
	.long	.LASF84
	.byte	0x3
	.uleb128 0xb
	.long	.LASF85
	.byte	0x4
	.uleb128 0xb
	.long	.LASF86
	.byte	0x5
	.uleb128 0xb
	.long	.LASF87
	.byte	0x6
	.uleb128 0xb
	.long	.LASF88
	.byte	0xa
	.uleb128 0x23
	.long	.LASF89
	.long	0x80000
	.uleb128 0x24
	.long	.LASF90
	.value	0x800
	.byte	0
	.uleb128 0x3
	.long	.LASF91
	.byte	0xc
	.byte	0x1c
	.byte	0x1c
	.long	0x45
	.uleb128 0xa
	.long	.LASF92
	.byte	0x10
	.byte	0xd
	.byte	0xb8
	.byte	0x27
	.long	0x517
	.uleb128 0x1
	.long	.LASF93
	.byte	0xd
	.byte	0xba
	.byte	0x5
	.long	0x4e3
	.byte	0
	.uleb128 0x1
	.long	.LASF94
	.byte	0xd
	.byte	0xbb
	.byte	0xa
	.long	0x517
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	0xd2
	.long	0x527
	.uleb128 0x8
	.long	0x2e
	.byte	0xd
	.byte	0
	.uleb128 0x4
	.long	0x4ef
	.uleb128 0xa
	.long	.LASF95
	.byte	0x10
	.byte	0xe
	.byte	0xf7
	.byte	0x27
	.long	0x56e
	.uleb128 0x1
	.long	.LASF96
	.byte	0xe
	.byte	0xf9
	.byte	0x5
	.long	0x4e3
	.byte	0
	.uleb128 0x1
	.long	.LASF97
	.byte	0xe
	.byte	0xfa
	.byte	0xf
	.long	0x5fb
	.byte	0x2
	.uleb128 0x1
	.long	.LASF98
	.byte	0xe
	.byte	0xfb
	.byte	0x14
	.long	0x5e0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF99
	.byte	0xe
	.byte	0xfe
	.byte	0x13
	.long	0x680
	.byte	0x8
	.byte	0
	.uleb128 0x17
	.long	.LASF100
	.byte	0x1c
	.byte	0xe
	.value	0x108
	.byte	0x27
	.long	0x5c3
	.uleb128 0x6
	.long	.LASF101
	.byte	0xe
	.value	0x10a
	.byte	0x5
	.long	0x4e3
	.byte	0
	.uleb128 0x6
	.long	.LASF102
	.byte	0xe
	.value	0x10b
	.byte	0xf
	.long	0x5fb
	.byte	0x2
	.uleb128 0x6
	.long	.LASF103
	.byte	0xe
	.value	0x10c
	.byte	0xe
	.long	0x47d
	.byte	0x4
	.uleb128 0x6
	.long	.LASF104
	.byte	0xe
	.value	0x10d
	.byte	0x15
	.long	0x665
	.byte	0x8
	.uleb128 0x6
	.long	.LASF105
	.byte	0xe
	.value	0x10e
	.byte	0xe
	.long	0x47d
	.byte	0x18
	.byte	0
	.uleb128 0x3
	.long	.LASF106
	.byte	0xf
	.byte	0x54
	.byte	0xa
	.long	0x5cf
	.uleb128 0x25
	.byte	0x8
	.byte	0xf
	.byte	0x53
	.byte	0x9
	.uleb128 0x3
	.long	.LASF107
	.byte	0xe
	.byte	0x1e
	.byte	0x12
	.long	0x47d
	.uleb128 0xa
	.long	.LASF108
	.byte	0x4
	.byte	0xe
	.byte	0x1f
	.byte	0x8
	.long	0x5fb
	.uleb128 0x1
	.long	.LASF109
	.byte	0xe
	.byte	0x21
	.byte	0xf
	.long	0x5d4
	.byte	0
	.byte	0
	.uleb128 0x3
	.long	.LASF110
	.byte	0xe
	.byte	0x7d
	.byte	0x12
	.long	0x471
	.uleb128 0x16
	.byte	0x10
	.byte	0xe
	.byte	0xdf
	.byte	0x5
	.long	0x635
	.uleb128 0xc
	.long	.LASF111
	.byte	0xe
	.byte	0xe1
	.byte	0xa
	.long	0x635
	.uleb128 0xc
	.long	.LASF112
	.byte	0xe
	.byte	0xe2
	.byte	0xb
	.long	0x645
	.uleb128 0xc
	.long	.LASF113
	.byte	0xe
	.byte	0xe3
	.byte	0xb
	.long	0x655
	.byte	0
	.uleb128 0x7
	.long	0x465
	.long	0x645
	.uleb128 0x8
	.long	0x2e
	.byte	0xf
	.byte	0
	.uleb128 0x7
	.long	0x471
	.long	0x655
	.uleb128 0x8
	.long	0x2e
	.byte	0x7
	.byte	0
	.uleb128 0x7
	.long	0x47d
	.long	0x665
	.uleb128 0x8
	.long	0x2e
	.byte	0x3
	.byte	0
	.uleb128 0xa
	.long	.LASF114
	.byte	0x10
	.byte	0xe
	.byte	0xdd
	.byte	0x8
	.long	0x680
	.uleb128 0x1
	.long	.LASF115
	.byte	0xe
	.byte	0xe4
	.byte	0x9
	.long	0x607
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x3e
	.long	0x690
	.uleb128 0x8
	.long	0x2e
	.byte	0x7
	.byte	0
	.uleb128 0x17
	.long	.LASF116
	.byte	0x30
	.byte	0x10
	.value	0x235
	.byte	0x8
	.long	0x70f
	.uleb128 0x6
	.long	.LASF117
	.byte	0x10
	.value	0x237
	.byte	0x7
	.long	0x72
	.byte	0
	.uleb128 0x6
	.long	.LASF118
	.byte	0x10
	.value	0x238
	.byte	0x7
	.long	0x72
	.byte	0x4
	.uleb128 0x6
	.long	.LASF119
	.byte	0x10
	.value	0x239
	.byte	0x7
	.long	0x72
	.byte	0x8
	.uleb128 0x6
	.long	.LASF120
	.byte	0x10
	.value	0x23a
	.byte	0x7
	.long	0x72
	.byte	0xc
	.uleb128 0x6
	.long	.LASF121
	.byte	0x10
	.value	0x23b
	.byte	0xd
	.long	0x489
	.byte	0x10
	.uleb128 0x6
	.long	.LASF122
	.byte	0x10
	.value	0x23c
	.byte	0x14
	.long	0x527
	.byte	0x18
	.uleb128 0x6
	.long	.LASF123
	.byte	0x10
	.value	0x23d
	.byte	0x9
	.long	0xc8
	.byte	0x20
	.uleb128 0x6
	.long	.LASF124
	.byte	0x10
	.value	0x23e
	.byte	0x14
	.long	0x714
	.byte	0x28
	.byte	0
	.uleb128 0x14
	.long	0x690
	.uleb128 0x4
	.long	0x690
	.uleb128 0x4
	.long	0x70f
	.uleb128 0xd
	.long	0x719
	.uleb128 0x5
	.byte	0x10
	.byte	0x5
	.long	.LASF125
	.uleb128 0x5
	.byte	0x10
	.byte	0x7
	.long	.LASF126
	.uleb128 0x5
	.byte	0x10
	.byte	0x4
	.long	.LASF127
	.uleb128 0x4
	.long	0x72
	.uleb128 0xa
	.long	.LASF128
	.byte	0x28
	.byte	0x11
	.byte	0xa3
	.byte	0x10
	.long	0x78c
	.uleb128 0x1
	.long	.LASF129
	.byte	0x11
	.byte	0xa4
	.byte	0x9
	.long	0x72
	.byte	0
	.uleb128 0x1
	.long	.LASF130
	.byte	0x11
	.byte	0xa5
	.byte	0xb
	.long	0xc8
	.byte	0x8
	.uleb128 0x1
	.long	.LASF131
	.byte	0x11
	.byte	0xa6
	.byte	0xb
	.long	0xc8
	.byte	0x10
	.uleb128 0x1
	.long	.LASF132
	.byte	0x11
	.byte	0xa7
	.byte	0x9
	.long	0x72
	.byte	0x18
	.uleb128 0x1
	.long	.LASF133
	.byte	0x11
	.byte	0xa8
	.byte	0x1d
	.long	0x78c
	.byte	0x20
	.byte	0
	.uleb128 0x4
	.long	0x73d
	.uleb128 0x3
	.long	.LASF128
	.byte	0x11
	.byte	0xa9
	.byte	0x2
	.long	0x73d
	.uleb128 0x15
	.byte	0x58
	.byte	0x11
	.byte	0xb2
	.long	0x801
	.uleb128 0x1
	.long	.LASF134
	.byte	0x11
	.byte	0xb4
	.byte	0x9
	.long	0x72
	.byte	0
	.uleb128 0x1
	.long	.LASF135
	.byte	0x11
	.byte	0xb5
	.byte	0xb
	.long	0xc8
	.byte	0x8
	.uleb128 0x1
	.long	.LASF136
	.byte	0x11
	.byte	0xb6
	.byte	0x16
	.long	0x801
	.byte	0x10
	.uleb128 0x1
	.long	.LASF137
	.byte	0x11
	.byte	0xb7
	.byte	0x9
	.long	0x72
	.byte	0x18
	.uleb128 0x1
	.long	.LASF138
	.byte	0x11
	.byte	0xb8
	.byte	0x16
	.long	0x714
	.byte	0x20
	.uleb128 0x1
	.long	.LASF139
	.byte	0x11
	.byte	0xb9
	.byte	0x9
	.long	0x72
	.byte	0x28
	.uleb128 0x1
	.long	.LASF140
	.byte	0x11
	.byte	0xba
	.byte	0x15
	.long	0x44e
	.byte	0x30
	.byte	0
	.uleb128 0x4
	.long	0x791
	.uleb128 0x3
	.long	.LASF141
	.byte	0x11
	.byte	0xbb
	.byte	0x3
	.long	0x79d
	.uleb128 0xe
	.long	.LASF142
	.byte	0x12
	.byte	0x40
	.byte	0x14
	.long	0x2d2
	.long	0x837
	.uleb128 0x2
	.long	0x72
	.uleb128 0x2
	.long	0x45f
	.uleb128 0x2
	.long	0xcd
	.uleb128 0x2
	.long	0x489
	.byte	0
	.uleb128 0xf
	.long	.LASF143
	.byte	0xb
	.value	0x166
	.byte	0xc
	.long	0x72
	.long	0x84e
	.uleb128 0x2
	.long	0x72
	.byte	0
	.uleb128 0x18
	.long	.LASF144
	.byte	0x13
	.byte	0x22
	.byte	0x10
	.long	0xa4
	.uleb128 0x18
	.long	.LASF145
	.byte	0x14
	.byte	0x25
	.byte	0xd
	.long	0x738
	.uleb128 0xe
	.long	.LASF146
	.byte	0xf
	.byte	0x7e
	.byte	0xc
	.long	0x72
	.long	0x886
	.uleb128 0x2
	.long	0x72
	.uleb128 0x2
	.long	0x5c3
	.uleb128 0x2
	.long	0x489
	.byte	0
	.uleb128 0x26
	.long	.LASF173
	.byte	0x15
	.value	0x364
	.byte	0xd
	.long	0x899
	.uleb128 0x2
	.long	0x2d2
	.byte	0
	.uleb128 0xe
	.long	.LASF147
	.byte	0xf
	.byte	0x66
	.byte	0xc
	.long	0x72
	.long	0x8b9
	.uleb128 0x2
	.long	0x72
	.uleb128 0x2
	.long	0x72
	.uleb128 0x2
	.long	0x72
	.byte	0
	.uleb128 0xf
	.long	.LASF148
	.byte	0x15
	.value	0x165
	.byte	0xc
	.long	0x72
	.long	0x8d6
	.uleb128 0x2
	.long	0x2dc
	.uleb128 0x2
	.long	0x2d2
	.uleb128 0x19
	.byte	0
	.uleb128 0xf
	.long	.LASF149
	.byte	0x10
	.value	0x29d
	.byte	0x14
	.long	0x2d2
	.long	0x8ed
	.uleb128 0x2
	.long	0x72
	.byte	0
	.uleb128 0xf
	.long	.LASF150
	.byte	0x10
	.value	0x294
	.byte	0xc
	.long	0x72
	.long	0x913
	.uleb128 0x2
	.long	0x2d7
	.uleb128 0x2
	.long	0x2d7
	.uleb128 0x2
	.long	0x71e
	.uleb128 0x2
	.long	0x918
	.byte	0
	.uleb128 0x4
	.long	0x714
	.uleb128 0xd
	.long	0x913
	.uleb128 0xf
	.long	.LASF151
	.byte	0x15
	.value	0x16b
	.byte	0xc
	.long	0x72
	.long	0x935
	.uleb128 0x2
	.long	0x2d2
	.uleb128 0x19
	.byte	0
	.uleb128 0x27
	.long	.LASF152
	.byte	0x16
	.value	0x2f4
	.byte	0xd
	.long	0x948
	.uleb128 0x2
	.long	0x72
	.byte	0
	.uleb128 0xe
	.long	.LASF153
	.byte	0x16
	.byte	0x69
	.byte	0xc
	.long	0x72
	.long	0x95e
	.uleb128 0x2
	.long	0x2d2
	.byte	0
	.uleb128 0xe
	.long	.LASF154
	.byte	0x17
	.byte	0x3d
	.byte	0xe
	.long	0x3c
	.long	0x97e
	.uleb128 0x2
	.long	0x3c
	.uleb128 0x2
	.long	0x72
	.uleb128 0x2
	.long	0x2e
	.byte	0
	.uleb128 0x28
	.long	.LASF174
	.byte	0x1
	.byte	0x78
	.byte	0x7
	.long	0x3c
	.quad	.LFB323
	.quad	.LFE323-.LFB323
	.uleb128 0x1
	.byte	0x9c
	.long	0xa38
	.uleb128 0x10
	.string	"sd"
	.byte	0x78
	.byte	0x21
	.long	0xa38
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30920
	.uleb128 0x12
	.long	.LASF158
	.byte	0x7a
	.byte	0x9
	.long	0x72
	.uleb128 0x9
	.long	.LASF155
	.byte	0x7b
	.byte	0xa
	.long	0xa3d
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30752
	.uleb128 0x9
	.long	.LASF156
	.byte	0x7c
	.byte	0xa
	.long	0xa3d
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30752
	.uleb128 0x9
	.long	.LASF157
	.byte	0x7d
	.byte	0xc
	.long	0x34e
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30880
	.uleb128 0x12
	.long	.LASF159
	.byte	0x7e
	.byte	0x9
	.long	0x72
	.uleb128 0x9
	.long	.LASF139
	.byte	0x84
	.byte	0x14
	.long	0x2f4
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30896
	.uleb128 0x1a
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x13
	.string	"__i"
	.byte	0x80
	.byte	0x5
	.long	0x35
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30908
	.uleb128 0x9
	.long	.LASF160
	.byte	0x80
	.byte	0x5
	.long	0xa4e
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30904
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	0x806
	.uleb128 0x7
	.long	0xd2
	.long	0xa4e
	.uleb128 0x29
	.long	0x2e
	.value	0x77ff
	.byte	0
	.uleb128 0x4
	.long	0x34e
	.uleb128 0x2a
	.long	.LASF163
	.byte	0x1
	.byte	0x60
	.byte	0x6
	.quad	.LFB322
	.quad	.LFE322-.LFB322
	.uleb128 0x1
	.byte	0x9c
	.long	0xa9c
	.uleb128 0x10
	.string	"sd"
	.byte	0x60
	.byte	0x2b
	.long	0xa38
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2b
	.long	.LASF161
	.byte	0x1
	.byte	0x60
	.byte	0x35
	.long	0xc8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x9
	.long	.LASF162
	.byte	0x61
	.byte	0x16
	.long	0x801
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x2c
	.long	.LASF164
	.byte	0x1
	.byte	0x1e
	.byte	0x6
	.quad	.LFB321
	.quad	.LFE321-.LFB321
	.uleb128 0x1
	.byte	0x9c
	.long	0xb3d
	.uleb128 0x10
	.string	"sd"
	.byte	0x1e
	.byte	0x29
	.long	0xa38
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0x9
	.long	.LASF162
	.byte	0x1f
	.byte	0x16
	.long	0x801
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x1a
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x9
	.long	.LASF165
	.byte	0x23
	.byte	0x19
	.long	0x690
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x9
	.long	.LASF166
	.byte	0x23
	.byte	0x21
	.long	0x714
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x13
	.string	"ip"
	.byte	0x24
	.byte	0xe
	.long	0xb3d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x9
	.long	.LASF167
	.byte	0x26
	.byte	0xd
	.long	0x72
	.uleb128 0x3
	.byte	0x91
	.sleb128 -180
	.uleb128 0x12
	.long	.LASF134
	.byte	0x27
	.byte	0xd
	.long	0x72
	.uleb128 0x13
	.string	"s"
	.byte	0x53
	.byte	0xe
	.long	0xb3d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0xd2
	.long	0xb4d
	.uleb128 0x8
	.long	0x2e
	.byte	0x2d
	.byte	0
	.uleb128 0x2d
	.long	.LASF168
	.byte	0x1
	.byte	0x13
	.byte	0x7
	.long	0x3c
	.quad	.LFB320
	.quad	.LFE320-.LFB320
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x10
	.string	"sa"
	.byte	0x13
	.byte	0x24
	.long	0x527
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
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
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x26
	.byte	0
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
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x23
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x25
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
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x2a
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
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
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
	.uleb128 0x2c
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
	.uleb128 0x2d
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
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF151:
	.string	"printf"
.LASF12:
	.string	"__off_t"
.LASF138:
	.string	"connect_to_info"
.LASF20:
	.string	"_IO_read_ptr"
.LASF32:
	.string	"_chain"
.LASF104:
	.string	"sin6_addr"
.LASF130:
	.string	"server_port"
.LASF115:
	.string	"__in6_u"
.LASF62:
	.string	"__prev"
.LASF147:
	.string	"socket"
.LASF76:
	.string	"__align"
.LASF38:
	.string	"_shortbuf"
.LASF143:
	.string	"close"
.LASF141:
	.string	"sockDetails_t"
.LASF6:
	.string	"signed char"
.LASF8:
	.string	"__uint8_t"
.LASF169:
	.string	"GNU C17 14.2.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF144:
	.string	"gettid"
.LASF26:
	.string	"_IO_buf_base"
.LASF90:
	.string	"SOCK_NONBLOCK"
.LASF60:
	.string	"long long unsigned int"
.LASF107:
	.string	"in_addr_t"
.LASF63:
	.string	"__next"
.LASF159:
	.string	"file_fd"
.LASF81:
	.string	"socklen_t"
.LASF133:
	.string	"next"
.LASF41:
	.string	"_codecvt"
.LASF88:
	.string	"SOCK_PACKET"
.LASF134:
	.string	"sockfd"
.LASF52:
	.string	"long long int"
.LASF136:
	.string	"servers_details"
.LASF168:
	.string	"get_in_addr"
.LASF137:
	.string	"number_of_servers"
.LASF33:
	.string	"_fileno"
.LASF21:
	.string	"_IO_read_end"
.LASF112:
	.string	"__u6_addr16"
.LASF11:
	.string	"long int"
.LASF113:
	.string	"__u6_addr32"
.LASF19:
	.string	"_flags"
.LASF118:
	.string	"ai_family"
.LASF27:
	.string	"_IO_buf_end"
.LASF36:
	.string	"_cur_column"
.LASF82:
	.string	"SOCK_STREAM"
.LASF50:
	.string	"_IO_codecvt"
.LASF102:
	.string	"sin6_port"
.LASF35:
	.string	"_old_offset"
.LASF40:
	.string	"_offset"
.LASF64:
	.string	"__pthread_list_t"
.LASF163:
	.string	"connect_save_and_send"
.LASF155:
	.string	"recieved_buf"
.LASF65:
	.string	"__pthread_mutex_s"
.LASF117:
	.string	"ai_flags"
.LASF10:
	.string	"__uint32_t"
.LASF99:
	.string	"sin_zero"
.LASF166:
	.string	"temp"
.LASF49:
	.string	"_IO_marker"
.LASF85:
	.string	"SOCK_RDM"
.LASF59:
	.string	"fd_set"
.LASF3:
	.string	"unsigned int"
.LASF109:
	.string	"s_addr"
.LASF44:
	.string	"_freeres_buf"
.LASF148:
	.string	"fprintf"
.LASF135:
	.string	"command"
.LASF119:
	.string	"ai_socktype"
.LASF2:
	.string	"long unsigned int"
.LASF160:
	.string	"__arr"
.LASF74:
	.string	"__data"
.LASF24:
	.string	"_IO_write_ptr"
.LASF54:
	.string	"timeval"
.LASF72:
	.string	"__elision"
.LASF5:
	.string	"short unsigned int"
.LASF98:
	.string	"sin_addr"
.LASF28:
	.string	"_IO_save_base"
.LASF128:
	.string	"serverDetails_t"
.LASF116:
	.string	"addrinfo"
.LASF79:
	.string	"uint16_t"
.LASF39:
	.string	"_lock"
.LASF158:
	.string	"numbytes"
.LASF110:
	.string	"in_port_t"
.LASF58:
	.string	"fds_bits"
.LASF106:
	.string	"__CONST_SOCKADDR_ARG"
.LASF68:
	.string	"__owner"
.LASF164:
	.string	"initialize_and_save"
.LASF67:
	.string	"__count"
.LASF173:
	.string	"perror"
.LASF96:
	.string	"sin_family"
.LASF157:
	.string	"readfds"
.LASF101:
	.string	"sin6_family"
.LASF150:
	.string	"getaddrinfo"
.LASF25:
	.string	"_IO_write_end"
.LASF45:
	.string	"_prevchain"
.LASF120:
	.string	"ai_protocol"
.LASF161:
	.string	"message"
.LASF170:
	.string	"_IO_lock_t"
.LASF53:
	.string	"_IO_FILE"
.LASF172:
	.string	"__socket_type"
.LASF162:
	.string	"current"
.LASF87:
	.string	"SOCK_DCCP"
.LASF129:
	.string	"client_sock_fd"
.LASF61:
	.string	"__pthread_internal_list"
.LASF121:
	.string	"ai_addrlen"
.LASF46:
	.string	"_mode"
.LASF131:
	.string	"server_ip"
.LASF97:
	.string	"sin_port"
.LASF93:
	.string	"sa_family"
.LASF55:
	.string	"tv_sec"
.LASF31:
	.string	"_markers"
.LASF165:
	.string	"hints"
.LASF126:
	.string	"__int128 unsigned"
.LASF105:
	.string	"sin6_scope_id"
.LASF153:
	.string	"atoi"
.LASF4:
	.string	"unsigned char"
.LASF57:
	.string	"__fd_mask"
.LASF122:
	.string	"ai_addr"
.LASF7:
	.string	"short int"
.LASF51:
	.string	"_IO_wide_data"
.LASF34:
	.string	"_flags2"
.LASF124:
	.string	"ai_next"
.LASF37:
	.string	"_vtable_offset"
.LASF48:
	.string	"FILE"
.LASF152:
	.string	"exit"
.LASF16:
	.string	"__suseconds_t"
.LASF146:
	.string	"connect"
.LASF114:
	.string	"in6_addr"
.LASF56:
	.string	"tv_usec"
.LASF66:
	.string	"__lock"
.LASF80:
	.string	"uint32_t"
.LASF127:
	.string	"long double"
.LASF17:
	.string	"char"
.LASF18:
	.string	"__socklen_t"
.LASF103:
	.string	"sin6_flowinfo"
.LASF9:
	.string	"__uint16_t"
.LASF111:
	.string	"__u6_addr8"
.LASF145:
	.string	"__errno_location"
.LASF142:
	.string	"inet_ntop"
.LASF13:
	.string	"__off64_t"
.LASF22:
	.string	"_IO_read_base"
.LASF149:
	.string	"gai_strerror"
.LASF30:
	.string	"_IO_save_end"
.LASF125:
	.string	"__int128"
.LASF77:
	.string	"pthread_mutex_t"
.LASF71:
	.string	"__spins"
.LASF15:
	.string	"__time_t"
.LASF91:
	.string	"sa_family_t"
.LASF47:
	.string	"_unused2"
.LASF171:
	.string	"stderr"
.LASF154:
	.string	"memset"
.LASF89:
	.string	"SOCK_CLOEXEC"
.LASF156:
	.string	"transmit_buf"
.LASF100:
	.string	"sockaddr_in6"
.LASF167:
	.string	"status"
.LASF92:
	.string	"sockaddr"
.LASF83:
	.string	"SOCK_DGRAM"
.LASF95:
	.string	"sockaddr_in"
.LASF75:
	.string	"__size"
.LASF78:
	.string	"uint8_t"
.LASF69:
	.string	"__nusers"
.LASF29:
	.string	"_IO_backup_base"
.LASF94:
	.string	"sa_data"
.LASF43:
	.string	"_freeres_list"
.LASF73:
	.string	"__list"
.LASF84:
	.string	"SOCK_RAW"
.LASF123:
	.string	"ai_canonname"
.LASF42:
	.string	"_wide_data"
.LASF174:
	.string	"handle_req"
.LASF70:
	.string	"__kind"
.LASF86:
	.string	"SOCK_SEQPACKET"
.LASF139:
	.string	"timeout"
.LASF140:
	.string	"lock"
.LASF23:
	.string	"_IO_write_base"
.LASF132:
	.string	"dfsno"
.LASF14:
	.string	"__pid_t"
.LASF108:
	.string	"in_addr"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/parth/Work/All_data/university/Network System/Assignments/PA4/client"
.LASF0:
	.string	"src/handle_req.c"
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
