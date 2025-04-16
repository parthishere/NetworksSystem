	.file	"handle_req.c"
	.text
.Ltext0:
	.file 0 "/home/parth/Work/All_data/university/Network System/Assignments/PA4/server" "src/handle_req.c"
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
	.align 8
.LC0:
	.string	"\033[31m[-] (%d) Select syscall failed with error: %d (%s)\n\033[0m"
	.align 8
.LC1:
	.string	"\033[33m\n[-] (%d) CONNECTION TIMEOUT:\n[-] Client connection idle for %d seconds\n------------------------------------------------------------\n\033[0m"
	.align 8
.LC2:
	.string	"\033[31m[-] (%d) peer has closed the connection exiting\n"
	.align 8
.LC3:
	.string	"\n\n==============================================================\n[+] (%d) Received request from client [%d bytes]:\n==============================================================\n%s\n"
	.text
	.globl	handle_req
	.type	handle_req, @function
handle_req:
.LFB321:
	.loc 1 48 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	leaq	-28672(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$2256, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -30936(%rbp)
	.loc 1 48 1
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
.L13:
.LBB2:
.LBB3:
	.loc 1 56 9
	leaq	-30880(%rbp), %rax
	movq	%rax, -30904(%rbp)
	movl	$0, -30920(%rbp)
	jmp	.L5
.L6:
	.loc 1 56 9 is_stmt 0 discriminator 3
	movq	-30904(%rbp), %rax
	movl	-30920(%rbp), %edx
	movq	$0, (%rax,%rdx,8)
	addl	$1, -30920(%rbp)
.L5:
	.loc 1 56 9 discriminator 1
	cmpl	$15, -30920(%rbp)
	jbe	.L6
.LBE3:
	.loc 1 57 9 is_stmt 1
	movq	-30936(%rbp), %rax
	movl	4(%rax), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	movl	%eax, %esi
	movslq	%esi, %rax
	movq	-30880(%rbp,%rax,8), %rdx
	movq	-30936(%rbp), %rax
	movl	4(%rax), %eax
	andl	$63, %eax
	movl	$1, %edi
	movl	%eax, %ecx
	salq	%cl, %rdi
	movq	%rdi, %rax
	orq	%rax, %rdx
	movslq	%esi, %rax
	movq	%rdx, -30880(%rbp,%rax,8)
	.loc 1 60 24
	movq	$10, -30896(%rbp)
	movq	$0, -30888(%rbp)
	.loc 1 63 38
	movq	-30936(%rbp), %rax
	movl	4(%rax), %eax
	.loc 1 63 29
	leal	1(%rax), %edi
	leaq	-30896(%rbp), %rdx
	leaq	-30880(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	call	select@PLT
	movl	%eax, -30916(%rbp)
	.loc 1 65 12
	cmpl	$0, -30916(%rbp)
	jns	.L7
	.loc 1 68 47
	call	__errno_location@PLT
	.loc 1 67 13
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %r12
	.loc 1 68 31
	call	__errno_location@PLT
	.loc 1 67 13
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	.loc 1 67 13 is_stmt 0 discriminator 2
	movq	stderr(%rip), %rax
	movq	%r12, %r8
	movl	%ebx, %ecx
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 69 13 is_stmt 1
	jmp	.L14
.L7:
	.loc 1 73 17
	cmpl	$0, -30916(%rbp)
	jne	.L9
	.loc 1 75 13
	call	gettid@PLT
	.loc 1 75 13 is_stmt 0 discriminator 1
	movl	$10, %edx
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 79 13 is_stmt 1
	jmp	.L14
.L9:
	.loc 1 83 18
	movq	-30936(%rbp), %rax
	movl	4(%rax), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	cltq
	movq	-30880(%rbp,%rax,8), %rdx
	movq	-30936(%rbp), %rax
	movl	4(%rax), %eax
	andl	$63, %eax
	movl	$1, %esi
	movl	%eax, %ecx
	salq	%cl, %rsi
	movq	%rsi, %rax
	andq	%rdx, %rax
	.loc 1 83 17
	testq	%rax, %rax
	je	.L13
.LBB4:
	.loc 1 85 13
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 87 17
	movl	$0, -30912(%rbp)
	.loc 1 89 54
	leaq	-30752(%rbp), %rdx
	movl	-30912(%rbp), %eax
	cltq
	leaq	(%rdx,%rax), %rsi
	.loc 1 89 29
	movq	-30936(%rbp), %rax
	movl	4(%rax), %eax
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 89 27 discriminator 1
	movl	%eax, -30908(%rbp)
	.loc 1 89 16 discriminator 1
	cmpl	$0, -30908(%rbp)
	js	.L17
	.loc 1 96 16
	cmpl	$0, -30908(%rbp)
	jne	.L12
	.loc 1 98 17
	call	gettid@PLT
	movl	%eax, %edx
	.loc 1 98 17 is_stmt 0 discriminator 1
	movq	stderr(%rip), %rax
	leaq	.LC2(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 99 17 is_stmt 1
	jmp	.L14
.L12:
	.loc 1 102 38
	movl	-30908(%rbp), %eax
	subl	$1, %eax
	.loc 1 102 25
	addl	%eax, -30912(%rbp)
	.loc 1 104 13
	call	gettid@PLT
	movl	%eax, %esi
	.loc 1 104 13 is_stmt 0 discriminator 1
	leaq	-30752(%rbp), %rdx
	movl	-30912(%rbp), %eax
	movq	%rdx, %rcx
	movl	%eax, %edx
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 114 13 is_stmt 1
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.LBE4:
.LBE2:
	.loc 1 55 5
	jmp	.L13
.L17:
.LBB6:
.LBB5:
	.loc 1 91 17
	nop
.L14:
.LBE5:
.LBE6:
	.loc 1 123 5
	movq	-30936(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 125 12
	movl	$0, %eax
	.loc 1 126 1
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L16
	call	__stack_chk_fail@PLT
.L16:
	addq	$30928, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE321:
	.size	handle_req, .-handle_req
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/14/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h"
	.file 8 "/usr/include/x86_64-linux-gnu/sys/select.h"
	.file 9 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"
	.file 10 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h"
	.file 11 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.file 12 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h"
	.file 13 "/usr/include/unistd.h"
	.file 14 "/usr/include/x86_64-linux-gnu/bits/sockaddr.h"
	.file 15 "/usr/include/x86_64-linux-gnu/bits/socket.h"
	.file 16 "/usr/include/netinet/in.h"
	.file 17 "/usr/include/netdb.h"
	.file 18 "./common.h"
	.file 19 "/usr/include/x86_64-linux-gnu/sys/socket.h"
	.file 20 "/usr/include/string.h"
	.file 21 "/usr/include/x86_64-linux-gnu/bits/unistd_ext.h"
	.file 22 "/usr/include/errno.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x9eb
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x17
	.long	.LASF151
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
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
	.uleb128 0x18
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
	.uleb128 0x2
	.long	.LASF8
	.byte	0x3
	.byte	0x26
	.byte	0x17
	.long	0x4a
	.uleb128 0x5
	.byte	0x2
	.byte	0x5
	.long	.LASF9
	.uleb128 0x2
	.long	.LASF10
	.byte	0x3
	.byte	0x28
	.byte	0x1c
	.long	0x51
	.uleb128 0x19
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.long	.LASF11
	.byte	0x3
	.byte	0x2a
	.byte	0x16
	.long	0x41
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.long	.LASF12
	.uleb128 0x2
	.long	.LASF13
	.byte	0x3
	.byte	0x98
	.byte	0x19
	.long	0x91
	.uleb128 0x2
	.long	.LASF14
	.byte	0x3
	.byte	0x99
	.byte	0x1b
	.long	0x91
	.uleb128 0x2
	.long	.LASF15
	.byte	0x3
	.byte	0x9a
	.byte	0x19
	.long	0x7e
	.uleb128 0x2
	.long	.LASF16
	.byte	0x3
	.byte	0xa0
	.byte	0x1a
	.long	0x91
	.uleb128 0x2
	.long	.LASF17
	.byte	0x3
	.byte	0xa2
	.byte	0x1f
	.long	0x91
	.uleb128 0x2
	.long	.LASF18
	.byte	0x3
	.byte	0xc2
	.byte	0x1b
	.long	0x91
	.uleb128 0x4
	.long	0xe5
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.long	.LASF19
	.uleb128 0x1a
	.long	0xe5
	.uleb128 0x2
	.long	.LASF20
	.byte	0x3
	.byte	0xd2
	.byte	0x17
	.long	0x41
	.uleb128 0x9
	.long	.LASF56
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x284
	.uleb128 0x1
	.long	.LASF21
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x7e
	.byte	0
	.uleb128 0x1
	.long	.LASF22
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0xe0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF23
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0xe0
	.byte	0x10
	.uleb128 0x1
	.long	.LASF24
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0xe0
	.byte	0x18
	.uleb128 0x1
	.long	.LASF25
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0xe0
	.byte	0x20
	.uleb128 0x1
	.long	.LASF26
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0xe0
	.byte	0x28
	.uleb128 0x1
	.long	.LASF27
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0xe0
	.byte	0x30
	.uleb128 0x1
	.long	.LASF28
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0xe0
	.byte	0x38
	.uleb128 0x1
	.long	.LASF29
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0xe0
	.byte	0x40
	.uleb128 0x1
	.long	.LASF30
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0xe0
	.byte	0x48
	.uleb128 0x1
	.long	.LASF31
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0xe0
	.byte	0x50
	.uleb128 0x1
	.long	.LASF32
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0xe0
	.byte	0x58
	.uleb128 0x1
	.long	.LASF33
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x29d
	.byte	0x60
	.uleb128 0x1
	.long	.LASF34
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x2a2
	.byte	0x68
	.uleb128 0x1
	.long	.LASF35
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x7e
	.byte	0x70
	.uleb128 0x1
	.long	.LASF36
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x7e
	.byte	0x74
	.uleb128 0x1
	.long	.LASF37
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0x98
	.byte	0x78
	.uleb128 0x1
	.long	.LASF38
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x51
	.byte	0x80
	.uleb128 0x1
	.long	.LASF39
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x58
	.byte	0x82
	.uleb128 0x1
	.long	.LASF40
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x2a7
	.byte	0x83
	.uleb128 0x1
	.long	.LASF41
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x2b7
	.byte	0x88
	.uleb128 0x1
	.long	.LASF42
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0xa4
	.byte	0x90
	.uleb128 0x1
	.long	.LASF43
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x2c1
	.byte	0x98
	.uleb128 0x1
	.long	.LASF44
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x2cb
	.byte	0xa0
	.uleb128 0x1
	.long	.LASF45
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x2a2
	.byte	0xa8
	.uleb128 0x1
	.long	.LASF46
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0x48
	.byte	0xb0
	.uleb128 0x1
	.long	.LASF47
	.byte	0x4
	.byte	0x5f
	.byte	0x15
	.long	0x2d0
	.byte	0xb8
	.uleb128 0x1
	.long	.LASF48
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x7e
	.byte	0xc0
	.uleb128 0x1
	.long	.LASF49
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x2d5
	.byte	0xc4
	.byte	0
	.uleb128 0x2
	.long	.LASF50
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0xfd
	.uleb128 0x1b
	.long	.LASF152
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0xd
	.long	.LASF51
	.uleb128 0x4
	.long	0x298
	.uleb128 0x4
	.long	0xfd
	.uleb128 0x7
	.long	0xe5
	.long	0x2b7
	.uleb128 0x8
	.long	0x3a
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	0x290
	.uleb128 0xd
	.long	.LASF52
	.uleb128 0x4
	.long	0x2bc
	.uleb128 0xd
	.long	.LASF53
	.uleb128 0x4
	.long	0x2c6
	.uleb128 0x4
	.long	0x2a2
	.uleb128 0x7
	.long	0xe5
	.long	0x2e5
	.uleb128 0x8
	.long	0x3a
	.byte	0x13
	.byte	0
	.uleb128 0x4
	.long	0xec
	.uleb128 0x2
	.long	.LASF54
	.byte	0x6
	.byte	0x4e
	.byte	0x13
	.long	0xd4
	.uleb128 0x4
	.long	0x284
	.uleb128 0x1c
	.long	.LASF153
	.byte	0x6
	.byte	0x97
	.byte	0xe
	.long	0x2f6
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.long	.LASF55
	.uleb128 0x9
	.long	.LASF57
	.byte	0x10
	.byte	0x7
	.byte	0x8
	.byte	0x8
	.long	0x336
	.uleb128 0x1
	.long	.LASF58
	.byte	0x7
	.byte	0xe
	.byte	0xc
	.long	0xbc
	.byte	0
	.uleb128 0x1
	.long	.LASF59
	.byte	0x7
	.byte	0xf
	.byte	0x11
	.long	0xc8
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.long	.LASF60
	.byte	0x8
	.byte	0x31
	.byte	0x12
	.long	0x91
	.uleb128 0xf
	.byte	0x80
	.byte	0x8
	.byte	0x3b
	.byte	0x9
	.long	0x359
	.uleb128 0x1
	.long	.LASF61
	.byte	0x8
	.byte	0x40
	.byte	0xf
	.long	0x359
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x336
	.long	0x369
	.uleb128 0x8
	.long	0x3a
	.byte	0xf
	.byte	0
	.uleb128 0x2
	.long	.LASF62
	.byte	0x8
	.byte	0x46
	.byte	0x5
	.long	0x342
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.long	.LASF63
	.uleb128 0x9
	.long	.LASF64
	.byte	0x10
	.byte	0x9
	.byte	0x33
	.byte	0x10
	.long	0x3a4
	.uleb128 0x1
	.long	.LASF65
	.byte	0x9
	.byte	0x35
	.byte	0x23
	.long	0x3a4
	.byte	0
	.uleb128 0x1
	.long	.LASF66
	.byte	0x9
	.byte	0x36
	.byte	0x23
	.long	0x3a4
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.long	0x37c
	.uleb128 0x2
	.long	.LASF67
	.byte	0x9
	.byte	0x37
	.byte	0x3
	.long	0x37c
	.uleb128 0x9
	.long	.LASF68
	.byte	0x28
	.byte	0xa
	.byte	0x16
	.byte	0x8
	.long	0x42b
	.uleb128 0x1
	.long	.LASF69
	.byte	0xa
	.byte	0x18
	.byte	0x7
	.long	0x7e
	.byte	0
	.uleb128 0x1
	.long	.LASF70
	.byte	0xa
	.byte	0x19
	.byte	0x10
	.long	0x41
	.byte	0x4
	.uleb128 0x1
	.long	.LASF71
	.byte	0xa
	.byte	0x1a
	.byte	0x7
	.long	0x7e
	.byte	0x8
	.uleb128 0x1
	.long	.LASF72
	.byte	0xa
	.byte	0x1c
	.byte	0x10
	.long	0x41
	.byte	0xc
	.uleb128 0x1
	.long	.LASF73
	.byte	0xa
	.byte	0x20
	.byte	0x7
	.long	0x7e
	.byte	0x10
	.uleb128 0x1
	.long	.LASF74
	.byte	0xa
	.byte	0x22
	.byte	0x9
	.long	0x6b
	.byte	0x14
	.uleb128 0x1
	.long	.LASF75
	.byte	0xa
	.byte	0x23
	.byte	0x9
	.long	0x6b
	.byte	0x16
	.uleb128 0x1
	.long	.LASF76
	.byte	0xa
	.byte	0x24
	.byte	0x14
	.long	0x3a9
	.byte	0x18
	.byte	0
	.uleb128 0x10
	.byte	0x28
	.byte	0xb
	.byte	0x43
	.byte	0x9
	.long	0x459
	.uleb128 0xb
	.long	.LASF77
	.byte	0xb
	.byte	0x45
	.byte	0x1c
	.long	0x3b5
	.uleb128 0xb
	.long	.LASF78
	.byte	0xb
	.byte	0x46
	.byte	0x8
	.long	0x459
	.uleb128 0xb
	.long	.LASF79
	.byte	0xb
	.byte	0x47
	.byte	0xc
	.long	0x91
	.byte	0
	.uleb128 0x7
	.long	0xe5
	.long	0x469
	.uleb128 0x8
	.long	0x3a
	.byte	0x27
	.byte	0
	.uleb128 0x2
	.long	.LASF80
	.byte	0xb
	.byte	0x48
	.byte	0x3
	.long	0x42b
	.uleb128 0x2
	.long	.LASF81
	.byte	0xc
	.byte	0x18
	.byte	0x13
	.long	0x5f
	.uleb128 0x2
	.long	.LASF82
	.byte	0xc
	.byte	0x19
	.byte	0x14
	.long	0x72
	.uleb128 0x2
	.long	.LASF83
	.byte	0xc
	.byte	0x1a
	.byte	0x14
	.long	0x85
	.uleb128 0x1d
	.long	.LASF84
	.byte	0xd
	.value	0x112
	.byte	0x15
	.long	0xf1
	.uleb128 0x2
	.long	.LASF85
	.byte	0xe
	.byte	0x1c
	.byte	0x1c
	.long	0x51
	.uleb128 0x9
	.long	.LASF86
	.byte	0x10
	.byte	0xf
	.byte	0xb8
	.byte	0x27
	.long	0x4da
	.uleb128 0x1
	.long	.LASF87
	.byte	0xf
	.byte	0xba
	.byte	0x5
	.long	0x4a6
	.byte	0
	.uleb128 0x1
	.long	.LASF88
	.byte	0xf
	.byte	0xbb
	.byte	0xa
	.long	0x4da
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	0xe5
	.long	0x4ea
	.uleb128 0x8
	.long	0x3a
	.byte	0xd
	.byte	0
	.uleb128 0x9
	.long	.LASF89
	.byte	0x80
	.byte	0xf
	.byte	0xc5
	.byte	0x27
	.long	0x51f
	.uleb128 0x1
	.long	.LASF90
	.byte	0xf
	.byte	0xc7
	.byte	0x5
	.long	0x4a6
	.byte	0
	.uleb128 0x1
	.long	.LASF91
	.byte	0xf
	.byte	0xc8
	.byte	0xa
	.long	0x51f
	.byte	0x2
	.uleb128 0x1
	.long	.LASF92
	.byte	0xf
	.byte	0xc9
	.byte	0x14
	.long	0x3a
	.byte	0x78
	.byte	0
	.uleb128 0x7
	.long	0xe5
	.long	0x52f
	.uleb128 0x8
	.long	0x3a
	.byte	0x75
	.byte	0
	.uleb128 0x4
	.long	0x4b2
	.uleb128 0x9
	.long	.LASF93
	.byte	0x10
	.byte	0x10
	.byte	0xf7
	.byte	0x27
	.long	0x576
	.uleb128 0x1
	.long	.LASF94
	.byte	0x10
	.byte	0xf9
	.byte	0x5
	.long	0x4a6
	.byte	0
	.uleb128 0x1
	.long	.LASF95
	.byte	0x10
	.byte	0xfa
	.byte	0xf
	.long	0x5f2
	.byte	0x2
	.uleb128 0x1
	.long	.LASF96
	.byte	0x10
	.byte	0xfb
	.byte	0x14
	.long	0x5d7
	.byte	0x4
	.uleb128 0x1
	.long	.LASF97
	.byte	0x10
	.byte	0xfe
	.byte	0x13
	.long	0x677
	.byte	0x8
	.byte	0
	.uleb128 0x11
	.long	.LASF98
	.byte	0x1c
	.byte	0x10
	.value	0x108
	.byte	0x27
	.long	0x5cb
	.uleb128 0x6
	.long	.LASF99
	.byte	0x10
	.value	0x10a
	.byte	0x5
	.long	0x4a6
	.byte	0
	.uleb128 0x6
	.long	.LASF100
	.byte	0x10
	.value	0x10b
	.byte	0xf
	.long	0x5f2
	.byte	0x2
	.uleb128 0x6
	.long	.LASF101
	.byte	0x10
	.value	0x10c
	.byte	0xe
	.long	0x48d
	.byte	0x4
	.uleb128 0x6
	.long	.LASF102
	.byte	0x10
	.value	0x10d
	.byte	0x15
	.long	0x65c
	.byte	0x8
	.uleb128 0x6
	.long	.LASF103
	.byte	0x10
	.value	0x10e
	.byte	0xe
	.long	0x48d
	.byte	0x18
	.byte	0
	.uleb128 0x2
	.long	.LASF104
	.byte	0x10
	.byte	0x1e
	.byte	0x12
	.long	0x48d
	.uleb128 0x9
	.long	.LASF105
	.byte	0x4
	.byte	0x10
	.byte	0x1f
	.byte	0x8
	.long	0x5f2
	.uleb128 0x1
	.long	.LASF106
	.byte	0x10
	.byte	0x21
	.byte	0xf
	.long	0x5cb
	.byte	0
	.byte	0
	.uleb128 0x2
	.long	.LASF107
	.byte	0x10
	.byte	0x7d
	.byte	0x12
	.long	0x481
	.uleb128 0x10
	.byte	0x10
	.byte	0x10
	.byte	0xdf
	.byte	0x5
	.long	0x62c
	.uleb128 0xb
	.long	.LASF108
	.byte	0x10
	.byte	0xe1
	.byte	0xa
	.long	0x62c
	.uleb128 0xb
	.long	.LASF109
	.byte	0x10
	.byte	0xe2
	.byte	0xb
	.long	0x63c
	.uleb128 0xb
	.long	.LASF110
	.byte	0x10
	.byte	0xe3
	.byte	0xb
	.long	0x64c
	.byte	0
	.uleb128 0x7
	.long	0x475
	.long	0x63c
	.uleb128 0x8
	.long	0x3a
	.byte	0xf
	.byte	0
	.uleb128 0x7
	.long	0x481
	.long	0x64c
	.uleb128 0x8
	.long	0x3a
	.byte	0x7
	.byte	0
	.uleb128 0x7
	.long	0x48d
	.long	0x65c
	.uleb128 0x8
	.long	0x3a
	.byte	0x3
	.byte	0
	.uleb128 0x9
	.long	.LASF111
	.byte	0x10
	.byte	0x10
	.byte	0xdd
	.byte	0x8
	.long	0x677
	.uleb128 0x1
	.long	.LASF112
	.byte	0x10
	.byte	0xe4
	.byte	0x9
	.long	0x5fe
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x4a
	.long	0x687
	.uleb128 0x8
	.long	0x3a
	.byte	0x7
	.byte	0
	.uleb128 0x11
	.long	.LASF113
	.byte	0x30
	.byte	0x11
	.value	0x235
	.byte	0x8
	.long	0x706
	.uleb128 0x6
	.long	.LASF114
	.byte	0x11
	.value	0x237
	.byte	0x7
	.long	0x7e
	.byte	0
	.uleb128 0x6
	.long	.LASF115
	.byte	0x11
	.value	0x238
	.byte	0x7
	.long	0x7e
	.byte	0x4
	.uleb128 0x6
	.long	.LASF116
	.byte	0x11
	.value	0x239
	.byte	0x7
	.long	0x7e
	.byte	0x8
	.uleb128 0x6
	.long	.LASF117
	.byte	0x11
	.value	0x23a
	.byte	0x7
	.long	0x7e
	.byte	0xc
	.uleb128 0x6
	.long	.LASF118
	.byte	0x11
	.value	0x23b
	.byte	0xd
	.long	0x499
	.byte	0x10
	.uleb128 0x6
	.long	.LASF119
	.byte	0x11
	.value	0x23c
	.byte	0x14
	.long	0x52f
	.byte	0x18
	.uleb128 0x6
	.long	.LASF120
	.byte	0x11
	.value	0x23d
	.byte	0x9
	.long	0xe0
	.byte	0x20
	.uleb128 0x6
	.long	.LASF121
	.byte	0x11
	.value	0x23e
	.byte	0x14
	.long	0x706
	.byte	0x28
	.byte	0
	.uleb128 0x4
	.long	0x687
	.uleb128 0x5
	.byte	0x10
	.byte	0x5
	.long	.LASF122
	.uleb128 0x5
	.byte	0x10
	.byte	0x7
	.long	.LASF123
	.uleb128 0x5
	.byte	0x10
	.byte	0x4
	.long	.LASF124
	.uleb128 0x4
	.long	0x7e
	.uleb128 0xf
	.byte	0xd0
	.byte	0x12
	.byte	0xae
	.byte	0xa
	.long	0x7b1
	.uleb128 0x1
	.long	.LASF125
	.byte	0x12
	.byte	0xb0
	.byte	0xa
	.long	0x7e
	.byte	0
	.uleb128 0x1
	.long	.LASF126
	.byte	0x12
	.byte	0xb1
	.byte	0xa
	.long	0x7e
	.byte	0x4
	.uleb128 0x1
	.long	.LASF127
	.byte	0x12
	.byte	0xb2
	.byte	0x1e
	.long	0x4ea
	.byte	0x8
	.uleb128 0x1
	.long	.LASF128
	.byte	0x12
	.byte	0xb3
	.byte	0x17
	.long	0x706
	.byte	0x88
	.uleb128 0x1
	.long	.LASF129
	.byte	0x12
	.byte	0xb4
	.byte	0xa
	.long	0x7e
	.byte	0x90
	.uleb128 0x1
	.long	.LASF130
	.byte	0x12
	.byte	0xb5
	.byte	0xa
	.long	0x7e
	.byte	0x94
	.uleb128 0x1
	.long	.LASF131
	.byte	0x12
	.byte	0xb6
	.byte	0xa
	.long	0x7e
	.byte	0x98
	.uleb128 0x1
	.long	.LASF132
	.byte	0x12
	.byte	0xb7
	.byte	0xa
	.long	0x7e
	.byte	0x9c
	.uleb128 0x1
	.long	.LASF133
	.byte	0x12
	.byte	0xb8
	.byte	0xa
	.long	0x7e
	.byte	0xa0
	.uleb128 0x1
	.long	.LASF134
	.byte	0x12
	.byte	0xb9
	.byte	0x16
	.long	0x469
	.byte	0xa8
	.byte	0
	.uleb128 0x2
	.long	.LASF135
	.byte	0x12
	.byte	0xba
	.byte	0x4
	.long	0x725
	.uleb128 0xc
	.long	.LASF136
	.byte	0xd
	.value	0x166
	.byte	0xc
	.long	0x7e
	.long	0x7d4
	.uleb128 0x3
	.long	0x7e
	.byte	0
	.uleb128 0xe
	.long	.LASF137
	.byte	0x13
	.byte	0x91
	.byte	0x10
	.long	0x2ea
	.long	0x7f9
	.uleb128 0x3
	.long	0x7e
	.uleb128 0x3
	.long	0x48
	.uleb128 0x3
	.long	0x2e
	.uleb128 0x3
	.long	0x7e
	.byte	0
	.uleb128 0xe
	.long	.LASF138
	.byte	0x14
	.byte	0x3d
	.byte	0xe
	.long	0x48
	.long	0x819
	.uleb128 0x3
	.long	0x48
	.uleb128 0x3
	.long	0x7e
	.uleb128 0x3
	.long	0x3a
	.byte	0
	.uleb128 0xc
	.long	.LASF139
	.byte	0x6
	.value	0x16b
	.byte	0xc
	.long	0x7e
	.long	0x831
	.uleb128 0x3
	.long	0x2e5
	.uleb128 0x12
	.byte	0
	.uleb128 0xc
	.long	.LASF140
	.byte	0x6
	.value	0x165
	.byte	0xc
	.long	0x7e
	.long	0x84e
	.uleb128 0x3
	.long	0x2f6
	.uleb128 0x3
	.long	0x2e5
	.uleb128 0x12
	.byte	0
	.uleb128 0x13
	.long	.LASF142
	.byte	0x15
	.byte	0x22
	.byte	0x10
	.long	0xb0
	.uleb128 0xc
	.long	.LASF141
	.byte	0x14
	.value	0x1a3
	.byte	0xe
	.long	0xe0
	.long	0x871
	.uleb128 0x3
	.long	0x7e
	.byte	0
	.uleb128 0x13
	.long	.LASF143
	.byte	0x16
	.byte	0x25
	.byte	0xd
	.long	0x720
	.uleb128 0xe
	.long	.LASF144
	.byte	0x8
	.byte	0x66
	.byte	0xc
	.long	0x7e
	.long	0x8a7
	.uleb128 0x3
	.long	0x7e
	.uleb128 0x3
	.long	0x8ac
	.uleb128 0x3
	.long	0x8ac
	.uleb128 0x3
	.long	0x8ac
	.uleb128 0x3
	.long	0x8b6
	.byte	0
	.uleb128 0x4
	.long	0x369
	.uleb128 0x14
	.long	0x8a7
	.uleb128 0x4
	.long	0x30e
	.uleb128 0x14
	.long	0x8b1
	.uleb128 0x1e
	.long	.LASF154
	.byte	0x1
	.byte	0x2f
	.byte	0x7
	.long	0x48
	.quad	.LFB321
	.quad	.LFE321-.LFB321
	.uleb128 0x1
	.byte	0x9c
	.long	0x9ac
	.uleb128 0x15
	.string	"sd"
	.byte	0x2f
	.byte	0x21
	.long	0x9ac
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30952
	.uleb128 0xa
	.long	.LASF145
	.byte	0x31
	.byte	0x9
	.long	0x7e
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30924
	.uleb128 0xa
	.long	.LASF146
	.byte	0x32
	.byte	0xa
	.long	0x9b1
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30768
	.uleb128 0xa
	.long	.LASF147
	.byte	0x33
	.byte	0xc
	.long	0x369
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30896
	.uleb128 0x1f
	.long	.LASF155
	.byte	0x1
	.byte	0x34
	.byte	0x9
	.long	0x7e
	.uleb128 0x20
	.long	.LASF156
	.byte	0x1
	.byte	0x77
	.byte	0x1
	.quad	.L14
	.uleb128 0x16
	.long	.LLRL0
	.uleb128 0xa
	.long	.LASF132
	.byte	0x3c
	.byte	0x18
	.long	0x30e
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30912
	.uleb128 0xa
	.long	.LASF148
	.byte	0x3f
	.byte	0xd
	.long	0x7e
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30932
	.uleb128 0x21
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.long	0x994
	.uleb128 0x22
	.string	"__i"
	.byte	0x1
	.byte	0x38
	.byte	0x9
	.long	0x41
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30936
	.uleb128 0xa
	.long	.LASF149
	.byte	0x38
	.byte	0x9
	.long	0x8a7
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30920
	.byte	0
	.uleb128 0x16
	.long	.LLRL1
	.uleb128 0xa
	.long	.LASF150
	.byte	0x57
	.byte	0x11
	.long	0x7e
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30928
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	0x7b1
	.uleb128 0x7
	.long	0xe5
	.long	0x9c2
	.uleb128 0x23
	.long	0x3a
	.value	0x77ff
	.byte	0
	.uleb128 0x24
	.long	.LASF157
	.byte	0x1
	.byte	0x13
	.byte	0x7
	.long	0x48
	.quad	.LFB320
	.quad	.LFE320-.LFB320
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x15
	.string	"sa"
	.byte	0x13
	.byte	0x24
	.long	0x52f
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.byte	0
	.byte	0
	.uleb128 0x20
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
	.uleb128 0x21
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
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
	.uleb128 0x23
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
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
	.uleb128 .LBB6-.Ltext0
	.uleb128 .LBE6-.Ltext0
	.byte	0
.LLRL1:
	.byte	0x4
	.uleb128 .LBB4-.Ltext0
	.uleb128 .LBE4-.Ltext0
	.byte	0x4
	.uleb128 .LBB5-.Ltext0
	.uleb128 .LBE5-.Ltext0
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF139:
	.string	"printf"
.LASF13:
	.string	"__off_t"
.LASF78:
	.string	"__size"
.LASF22:
	.string	"_IO_read_ptr"
.LASF34:
	.string	"_chain"
.LASF102:
	.string	"sin6_addr"
.LASF112:
	.string	"__in6_u"
.LASF7:
	.string	"size_t"
.LASF65:
	.string	"__prev"
.LASF79:
	.string	"__align"
.LASF40:
	.string	"_shortbuf"
.LASF136:
	.string	"close"
.LASF8:
	.string	"__uint8_t"
.LASF54:
	.string	"ssize_t"
.LASF151:
	.string	"GNU C17 14.2.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF142:
	.string	"gettid"
.LASF28:
	.string	"_IO_buf_base"
.LASF146:
	.string	"recieved_buf"
.LASF63:
	.string	"long long unsigned int"
.LASF104:
	.string	"in_addr_t"
.LASF128:
	.string	"server_info"
.LASF66:
	.string	"__next"
.LASF127:
	.string	"client_info"
.LASF155:
	.string	"file_fd"
.LASF84:
	.string	"socklen_t"
.LASF43:
	.string	"_codecvt"
.LASF125:
	.string	"sockfd"
.LASF55:
	.string	"long long int"
.LASF6:
	.string	"signed char"
.LASF157:
	.string	"get_in_addr"
.LASF35:
	.string	"_fileno"
.LASF23:
	.string	"_IO_read_end"
.LASF109:
	.string	"__u6_addr16"
.LASF12:
	.string	"long int"
.LASF110:
	.string	"__u6_addr32"
.LASF21:
	.string	"_flags"
.LASF115:
	.string	"ai_family"
.LASF18:
	.string	"__ssize_t"
.LASF29:
	.string	"_IO_buf_end"
.LASF38:
	.string	"_cur_column"
.LASF137:
	.string	"recv"
.LASF100:
	.string	"sin6_port"
.LASF37:
	.string	"_old_offset"
.LASF42:
	.string	"_offset"
.LASF67:
	.string	"__pthread_list_t"
.LASF68:
	.string	"__pthread_mutex_s"
.LASF114:
	.string	"ai_flags"
.LASF11:
	.string	"__uint32_t"
.LASF97:
	.string	"sin_zero"
.LASF133:
	.string	"port"
.LASF150:
	.string	"total_bytes"
.LASF51:
	.string	"_IO_marker"
.LASF62:
	.string	"fd_set"
.LASF3:
	.string	"unsigned int"
.LASF106:
	.string	"s_addr"
.LASF46:
	.string	"_freeres_buf"
.LASF130:
	.string	"recvBytes"
.LASF140:
	.string	"fprintf"
.LASF116:
	.string	"ai_socktype"
.LASF2:
	.string	"long unsigned int"
.LASF149:
	.string	"__arr"
.LASF77:
	.string	"__data"
.LASF26:
	.string	"_IO_write_ptr"
.LASF57:
	.string	"timeval"
.LASF131:
	.string	"sentBytes"
.LASF129:
	.string	"addr_len"
.LASF75:
	.string	"__elision"
.LASF5:
	.string	"short unsigned int"
.LASF96:
	.string	"sin_addr"
.LASF30:
	.string	"_IO_save_base"
.LASF113:
	.string	"addrinfo"
.LASF82:
	.string	"uint16_t"
.LASF41:
	.string	"_lock"
.LASF145:
	.string	"numbytes"
.LASF107:
	.string	"in_port_t"
.LASF61:
	.string	"fds_bits"
.LASF71:
	.string	"__owner"
.LASF70:
	.string	"__count"
.LASF94:
	.string	"sin_family"
.LASF147:
	.string	"readfds"
.LASF99:
	.string	"sin6_family"
.LASF58:
	.string	"tv_sec"
.LASF135:
	.string	"sockdetails_t"
.LASF27:
	.string	"_IO_write_end"
.LASF47:
	.string	"_prevchain"
.LASF117:
	.string	"ai_protocol"
.LASF89:
	.string	"sockaddr_storage"
.LASF152:
	.string	"_IO_lock_t"
.LASF156:
	.string	"cleanup"
.LASF56:
	.string	"_IO_FILE"
.LASF144:
	.string	"select"
.LASF64:
	.string	"__pthread_internal_list"
.LASF118:
	.string	"ai_addrlen"
.LASF48:
	.string	"_mode"
.LASF95:
	.string	"sin_port"
.LASF87:
	.string	"sa_family"
.LASF33:
	.string	"_markers"
.LASF123:
	.string	"__int128 unsigned"
.LASF103:
	.string	"sin6_scope_id"
.LASF4:
	.string	"unsigned char"
.LASF60:
	.string	"__fd_mask"
.LASF119:
	.string	"ai_addr"
.LASF9:
	.string	"short int"
.LASF53:
	.string	"_IO_wide_data"
.LASF36:
	.string	"_flags2"
.LASF121:
	.string	"ai_next"
.LASF39:
	.string	"_vtable_offset"
.LASF50:
	.string	"FILE"
.LASF126:
	.string	"client_sock_fd"
.LASF17:
	.string	"__suseconds_t"
.LASF111:
	.string	"in6_addr"
.LASF59:
	.string	"tv_usec"
.LASF69:
	.string	"__lock"
.LASF83:
	.string	"uint32_t"
.LASF124:
	.string	"long double"
.LASF19:
	.string	"char"
.LASF90:
	.string	"ss_family"
.LASF20:
	.string	"__socklen_t"
.LASF101:
	.string	"sin6_flowinfo"
.LASF10:
	.string	"__uint16_t"
.LASF108:
	.string	"__u6_addr8"
.LASF143:
	.string	"__errno_location"
.LASF52:
	.string	"_IO_codecvt"
.LASF14:
	.string	"__off64_t"
.LASF24:
	.string	"_IO_read_base"
.LASF148:
	.string	"select_status"
.LASF32:
	.string	"_IO_save_end"
.LASF122:
	.string	"__int128"
.LASF80:
	.string	"pthread_mutex_t"
.LASF74:
	.string	"__spins"
.LASF16:
	.string	"__time_t"
.LASF85:
	.string	"sa_family_t"
.LASF49:
	.string	"_unused2"
.LASF153:
	.string	"stderr"
.LASF138:
	.string	"memset"
.LASF98:
	.string	"sockaddr_in6"
.LASF92:
	.string	"__ss_align"
.LASF86:
	.string	"sockaddr"
.LASF93:
	.string	"sockaddr_in"
.LASF81:
	.string	"uint8_t"
.LASF72:
	.string	"__nusers"
.LASF31:
	.string	"_IO_backup_base"
.LASF91:
	.string	"__ss_padding"
.LASF88:
	.string	"sa_data"
.LASF45:
	.string	"_freeres_list"
.LASF76:
	.string	"__list"
.LASF120:
	.string	"ai_canonname"
.LASF44:
	.string	"_wide_data"
.LASF154:
	.string	"handle_req"
.LASF73:
	.string	"__kind"
.LASF132:
	.string	"timeout"
.LASF141:
	.string	"strerror"
.LASF134:
	.string	"lock"
.LASF25:
	.string	"_IO_write_base"
.LASF15:
	.string	"__pid_t"
.LASF105:
	.string	"in_addr"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"src/handle_req.c"
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
