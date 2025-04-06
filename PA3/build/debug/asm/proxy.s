	.file	"proxy.c"
	.text
.Ltext0:
	.file 0 "/home/parth/Work/All_data/university/Network System/Assignments/PA3" "proxy.c"
	.local	shutdown_flag
	.comm	shutdown_flag,4,4
	.local	shutdown_mutex
	.comm	shutdown_mutex,40,32
	.section	.rodata
.LC0:
	.string	"\n\nCleaning up resources...\n"
	.text
	.globl	sig_handler
	.type	sig_handler, @function
sig_handler:
.LFB6:
	.file 1 "proxy.c"
	.loc 1 14 27
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	.loc 1 15 11
	leaq	.LC0(%rip), %rax
	movq	%rax, -8(%rbp)
	.loc 1 16 5
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	.loc 1 16 5 is_stmt 0 discriminator 1
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	write@PLT
	.loc 1 17 19 is_stmt 1
	movl	$1, shutdown_flag(%rip)
	.loc 1 18 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	sig_handler, .-sig_handler
	.section	.rodata
	.align 8
.LC1:
	.string	"\033[31m[-] You messed up, command is ./proxy <PORT> <TIMEOUT> | (passed numer of args: %d) \n\033[0m"
	.align 8
.LC2:
	.string	"[+] Cache Timeout is set to %d\n"
.LC3:
	.string	"[+] Block list updated!"
.LC4:
	.string	"\033[31maccept\033[0m"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.loc 1 21 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$416, %rsp
	movl	%edi, -404(%rbp)
	movq	%rsi, -416(%rbp)
	.loc 1 21 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 23 5
	leaq	-384(%rbp), %rax
	movl	$152, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 24 5
	leaq	-384(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	sigemptyset@PLT
	.loc 1 25 17
	movl	$0, -248(%rbp)
	.loc 1 26 19
	leaq	sig_handler(%rip), %rax
	movq	%rax, -384(%rbp)
	.loc 1 28 5
	leaq	-384(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$2, %edi
	call	sigaction@PLT
	.loc 1 29 5
	movl	$1, %esi
	movl	$13, %edi
	call	signal@PLT
	.loc 1 32 5
	leaq	-224(%rbp), %rax
	addq	$168, %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_mutex_init@PLT
	.loc 1 35 8
	cmpl	$3, -404(%rbp)
	je	.L3
	.loc 1 37 11
	cmpl	$2, -404(%rbp)
	jne	.L4
	.loc 1 38 24
	movl	$60, -68(%rbp)
	jmp	.L3
.L4:
	.loc 1 41 13
	movl	-404(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 42 13
	movl	$1, %edi
	call	exit@PLT
.L3:
	.loc 1 47 27
	movq	-416(%rbp), %rax
	addq	$16, %rax
	.loc 1 47 18
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	.loc 1 47 16 discriminator 1
	movl	%eax, -68(%rbp)
	.loc 1 48 5
	movl	-68(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 49 17
	movl	$128, -80(%rbp)
	.loc 1 51 5
	movl	$1, %edi
	call	init_cache_table@PLT
	.loc 1 52 5
	movl	$1, %edi
	call	init_connection_table@PLT
	.loc 1 53 5
	movl	$0, %edi
	call	init_cache@PLT
	.loc 1 54 23
	movl	$0, %edi
	call	init_blocklist@PLT
	movq	%rax, -400(%rbp)
	.loc 1 55 5
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 56 26
	movq	-416(%rbp), %rax
	addq	$8, %rax
	.loc 1 56 5
	movq	(%rax), %rdx
	leaq	-224(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	init_socket@PLT
	.loc 1 59 21
	movl	$10, %edi
	call	create_threadpool@PLT
	movq	%rax, -392(%rbp)
	.loc 1 60 8
	cmpq	$0, -392(%rbp)
	je	.L13
	.loc 1 64 11
	jmp	.L7
.L10:
	.loc 1 66 34
	leaq	-224(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movl	-224(%rbp), %eax
	leaq	-224(%rbp), %rdx
	addq	$144, %rdx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	accept@PLT
	.loc 1 66 32 discriminator 1
	movl	%eax, -220(%rbp)
	.loc 1 66 16 discriminator 1
	movl	-220(%rbp), %eax
	.loc 1 66 12 discriminator 1
	testl	%eax, %eax
	jns	.L8
	.loc 1 66 110 discriminator 1
	call	__errno_location@PLT
	movl	(%rax), %eax
	.loc 1 66 107 discriminator 1
	cmpl	$4, %eax
	je	.L8
	.loc 1 68 13
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	.loc 1 69 13
	jmp	.L6
.L8:
	.loc 1 74 9
	leaq	-224(%rbp), %rdx
	movq	-392(%rbp), %rax
	movq	handle_req@GOTPCREL(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	dispatch@PLT
	.loc 1 77 9
	leaq	shutdown_mutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	.loc 1 78 12
	movl	shutdown_flag(%rip), %eax
	.loc 1 78 11
	testl	%eax, %eax
	jne	.L14
	.loc 1 81 9
	leaq	shutdown_mutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
.L7:
	.loc 1 64 12
	movl	shutdown_flag(%rip), %eax
	testl	%eax, %eax
	je	.L10
	.loc 1 85 1
	jmp	.L6
.L13:
	.loc 1 61 9
	nop
	jmp	.L6
.L14:
	.loc 1 79 13
	nop
.L6:
	.loc 1 87 5
	movl	-224(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 88 5
	movl	$0, %edi
	call	cleanup_cache@PLT
	.loc 1 89 5
	movl	$0, %edi
	call	cleanup_blocklist@PLT
	.loc 1 90 5
	movl	$0, %edi
	call	cleanup_connection_table@PLT
	.loc 1 93 5
	movq	-392(%rbp), %rax
	movq	%rax, %rdi
	call	destroy_threadpool@PLT
	.loc 1 98 12
	movl	$0, %eax
	.loc 1 99 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L12
	call	__stack_chk_fail@PLT
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/14/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/stdio.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/time_t.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/types/__sigset_t.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/types/sigset_t.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"
	.file 9 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h"
	.file 10 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.file 11 "/usr/include/unistd.h"
	.file 12 "/usr/include/x86_64-linux-gnu/bits/sockaddr.h"
	.file 13 "/usr/include/x86_64-linux-gnu/bits/socket.h"
	.file 14 "/usr/include/x86_64-linux-gnu/sys/socket.h"
	.file 15 "/usr/include/x86_64-linux-gnu/bits/types/__sigval_t.h"
	.file 16 "/usr/include/netdb.h"
	.file 17 "/usr/include/x86_64-linux-gnu/bits/types/sig_atomic_t.h"
	.file 18 "/usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h"
	.file 19 "/usr/include/signal.h"
	.file 20 "/usr/include/x86_64-linux-gnu/bits/sigaction.h"
	.file 21 "common.h"
	.file 22 "includes/queue.h"
	.file 23 "includes/cache.h"
	.file 24 "includes/blocklist.h"
	.file 25 "includes/connections.h"
	.file 26 "/usr/include/pthread.h"
	.file 27 "includes/handle_req.h"
	.file 28 "includes/setup.h"
	.file 29 "/usr/include/stdlib.h"
	.file 30 "/usr/include/string.h"
	.file 31 "/usr/include/errno.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xd52
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x1a
	.long	.LASF179
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x3
	.long	.LASF8
	.byte	0x2
	.byte	0xd6
	.byte	0x17
	.long	0x3a
	.uleb128 0x6
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x1b
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
	.uleb128 0x6
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x1c
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.long	.LASF9
	.byte	0x3
	.byte	0x2a
	.byte	0x16
	.long	0x41
	.uleb128 0x6
	.byte	0x8
	.byte	0x5
	.long	.LASF10
	.uleb128 0x3
	.long	.LASF11
	.byte	0x3
	.byte	0x92
	.byte	0x19
	.long	0x41
	.uleb128 0x3
	.long	.LASF12
	.byte	0x3
	.byte	0x9a
	.byte	0x19
	.long	0x66
	.uleb128 0x3
	.long	.LASF13
	.byte	0x3
	.byte	0x9c
	.byte	0x1b
	.long	0x79
	.uleb128 0x3
	.long	.LASF14
	.byte	0x3
	.byte	0xa0
	.byte	0x1a
	.long	0x79
	.uleb128 0x3
	.long	.LASF15
	.byte	0x3
	.byte	0xc2
	.byte	0x1b
	.long	0x79
	.uleb128 0x4
	.long	0xc1
	.uleb128 0x6
	.byte	0x1
	.byte	0x6
	.long	.LASF16
	.uleb128 0x12
	.long	0xc1
	.uleb128 0x3
	.long	.LASF17
	.byte	0x3
	.byte	0xd2
	.byte	0x17
	.long	0x41
	.uleb128 0x3
	.long	.LASF18
	.byte	0x3
	.byte	0xd7
	.byte	0xd
	.long	0x66
	.uleb128 0x9
	.long	0xc1
	.long	0xf5
	.uleb128 0xd
	.long	0x3a
	.byte	0x3
	.byte	0
	.uleb128 0x4
	.long	0xc8
	.uleb128 0x3
	.long	.LASF19
	.byte	0x4
	.byte	0x4e
	.byte	0x13
	.long	0xb0
	.uleb128 0x6
	.byte	0x8
	.byte	0x5
	.long	.LASF20
	.uleb128 0x3
	.long	.LASF21
	.byte	0x5
	.byte	0xa
	.byte	0x12
	.long	0xa4
	.uleb128 0x7
	.byte	0x80
	.byte	0x6
	.byte	0x5
	.byte	0x9
	.long	0x130
	.uleb128 0x1
	.long	.LASF25
	.byte	0x6
	.byte	0x7
	.byte	0x15
	.long	0x130
	.byte	0
	.byte	0
	.uleb128 0x9
	.long	0x3a
	.long	0x140
	.uleb128 0xd
	.long	0x3a
	.byte	0xf
	.byte	0
	.uleb128 0x3
	.long	.LASF22
	.byte	0x6
	.byte	0x8
	.byte	0x3
	.long	0x119
	.uleb128 0x3
	.long	.LASF23
	.byte	0x7
	.byte	0x7
	.byte	0x14
	.long	0x140
	.uleb128 0x6
	.byte	0x8
	.byte	0x7
	.long	.LASF24
	.uleb128 0xe
	.long	.LASF29
	.byte	0x10
	.byte	0x8
	.byte	0x33
	.byte	0x10
	.long	0x187
	.uleb128 0x1
	.long	.LASF26
	.byte	0x8
	.byte	0x35
	.byte	0x23
	.long	0x187
	.byte	0
	.uleb128 0x1
	.long	.LASF27
	.byte	0x8
	.byte	0x36
	.byte	0x23
	.long	0x187
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.long	0x15f
	.uleb128 0x3
	.long	.LASF28
	.byte	0x8
	.byte	0x37
	.byte	0x3
	.long	0x15f
	.uleb128 0xe
	.long	.LASF30
	.byte	0x28
	.byte	0x9
	.byte	0x16
	.byte	0x8
	.long	0x20e
	.uleb128 0x1
	.long	.LASF31
	.byte	0x9
	.byte	0x18
	.byte	0x7
	.long	0x66
	.byte	0
	.uleb128 0x1
	.long	.LASF32
	.byte	0x9
	.byte	0x19
	.byte	0x10
	.long	0x41
	.byte	0x4
	.uleb128 0x1
	.long	.LASF33
	.byte	0x9
	.byte	0x1a
	.byte	0x7
	.long	0x66
	.byte	0x8
	.uleb128 0x1
	.long	.LASF34
	.byte	0x9
	.byte	0x1c
	.byte	0x10
	.long	0x41
	.byte	0xc
	.uleb128 0x1
	.long	.LASF35
	.byte	0x9
	.byte	0x20
	.byte	0x7
	.long	0x66
	.byte	0x10
	.uleb128 0x1
	.long	.LASF36
	.byte	0x9
	.byte	0x22
	.byte	0x9
	.long	0x5f
	.byte	0x14
	.uleb128 0x1
	.long	.LASF37
	.byte	0x9
	.byte	0x23
	.byte	0x9
	.long	0x5f
	.byte	0x16
	.uleb128 0x1
	.long	.LASF38
	.byte	0x9
	.byte	0x24
	.byte	0x14
	.long	0x18c
	.byte	0x18
	.byte	0
	.uleb128 0x10
	.byte	0x4
	.byte	0xa
	.byte	0x20
	.byte	0x9
	.long	0x230
	.uleb128 0x5
	.long	.LASF39
	.byte	0xa
	.byte	0x22
	.byte	0x8
	.long	0xe5
	.uleb128 0x5
	.long	.LASF40
	.byte	0xa
	.byte	0x23
	.byte	0x7
	.long	0x66
	.byte	0
	.uleb128 0x3
	.long	.LASF41
	.byte	0xa
	.byte	0x24
	.byte	0x3
	.long	0x20e
	.uleb128 0x12
	.long	0x230
	.uleb128 0x10
	.byte	0x28
	.byte	0xa
	.byte	0x43
	.byte	0x9
	.long	0x26f
	.uleb128 0x5
	.long	.LASF42
	.byte	0xa
	.byte	0x45
	.byte	0x1c
	.long	0x198
	.uleb128 0x5
	.long	.LASF39
	.byte	0xa
	.byte	0x46
	.byte	0x8
	.long	0x26f
	.uleb128 0x5
	.long	.LASF40
	.byte	0xa
	.byte	0x47
	.byte	0xc
	.long	0x79
	.byte	0
	.uleb128 0x9
	.long	0xc1
	.long	0x27f
	.uleb128 0xd
	.long	0x3a
	.byte	0x27
	.byte	0
	.uleb128 0x3
	.long	.LASF43
	.byte	0xa
	.byte	0x48
	.byte	0x3
	.long	0x241
	.uleb128 0x4
	.long	0x290
	.uleb128 0x1d
	.uleb128 0x1e
	.long	.LASF44
	.byte	0xb
	.value	0x112
	.byte	0x15
	.long	0xcd
	.uleb128 0x4
	.long	0xbc
	.uleb128 0x3
	.long	.LASF45
	.byte	0xc
	.byte	0x1c
	.byte	0x1c
	.long	0x51
	.uleb128 0xe
	.long	.LASF46
	.byte	0x10
	.byte	0xd
	.byte	0xb8
	.byte	0x27
	.long	0x2d7
	.uleb128 0x1
	.long	.LASF47
	.byte	0xd
	.byte	0xba
	.byte	0x5
	.long	0x2a3
	.byte	0
	.uleb128 0x1
	.long	.LASF48
	.byte	0xd
	.byte	0xbb
	.byte	0xa
	.long	0x2d7
	.byte	0x2
	.byte	0
	.uleb128 0x9
	.long	0xc1
	.long	0x2e7
	.uleb128 0xd
	.long	0x3a
	.byte	0xd
	.byte	0
	.uleb128 0xe
	.long	.LASF49
	.byte	0x80
	.byte	0xd
	.byte	0xc5
	.byte	0x27
	.long	0x31c
	.uleb128 0x1
	.long	.LASF50
	.byte	0xd
	.byte	0xc7
	.byte	0x5
	.long	0x2a3
	.byte	0
	.uleb128 0x1
	.long	.LASF51
	.byte	0xd
	.byte	0xc8
	.byte	0xa
	.long	0x31c
	.byte	0x2
	.uleb128 0x1
	.long	.LASF52
	.byte	0xd
	.byte	0xc9
	.byte	0x14
	.long	0x3a
	.byte	0x78
	.byte	0
	.uleb128 0x9
	.long	0xc1
	.long	0x32c
	.uleb128 0xd
	.long	0x3a
	.byte	0x75
	.byte	0
	.uleb128 0x4
	.long	0x331
	.uleb128 0x17
	.long	0x33c
	.uleb128 0x2
	.long	0x66
	.byte	0
	.uleb128 0x4
	.long	0x2af
	.uleb128 0x3
	.long	.LASF53
	.byte	0xe
	.byte	0x50
	.byte	0xa
	.long	0x34d
	.uleb128 0x1f
	.byte	0x8
	.byte	0xe
	.byte	0x4f
	.byte	0x9
	.uleb128 0x20
	.long	.LASF180
	.byte	0x8
	.byte	0xf
	.byte	0x18
	.byte	0x7
	.long	0x378
	.uleb128 0x5
	.long	.LASF54
	.byte	0xf
	.byte	0x1a
	.byte	0x7
	.long	0x66
	.uleb128 0x5
	.long	.LASF55
	.byte	0xf
	.byte	0x1b
	.byte	0x9
	.long	0x48
	.byte	0
	.uleb128 0x3
	.long	.LASF56
	.byte	0xf
	.byte	0x1e
	.byte	0x16
	.long	0x352
	.uleb128 0x21
	.long	.LASF57
	.byte	0x30
	.byte	0x10
	.value	0x235
	.byte	0x8
	.long	0x3fb
	.uleb128 0xb
	.long	.LASF58
	.value	0x237
	.byte	0x7
	.long	0x66
	.byte	0
	.uleb128 0xb
	.long	.LASF59
	.value	0x238
	.byte	0x7
	.long	0x66
	.byte	0x4
	.uleb128 0xb
	.long	.LASF60
	.value	0x239
	.byte	0x7
	.long	0x66
	.byte	0x8
	.uleb128 0xb
	.long	.LASF61
	.value	0x23a
	.byte	0x7
	.long	0x66
	.byte	0xc
	.uleb128 0xb
	.long	.LASF62
	.value	0x23b
	.byte	0xd
	.long	0x291
	.byte	0x10
	.uleb128 0xb
	.long	.LASF63
	.value	0x23c
	.byte	0x14
	.long	0x33c
	.byte	0x18
	.uleb128 0xb
	.long	.LASF64
	.value	0x23d
	.byte	0x9
	.long	0xbc
	.byte	0x20
	.uleb128 0xb
	.long	.LASF65
	.value	0x23e
	.byte	0x14
	.long	0x3fb
	.byte	0x28
	.byte	0
	.uleb128 0x4
	.long	0x384
	.uleb128 0x6
	.byte	0x10
	.byte	0x5
	.long	.LASF66
	.uleb128 0x6
	.byte	0x10
	.byte	0x7
	.long	.LASF67
	.uleb128 0x3
	.long	.LASF68
	.byte	0x11
	.byte	0x8
	.byte	0x18
	.long	0xd9
	.uleb128 0x22
	.long	0x40e
	.uleb128 0x7
	.byte	0x8
	.byte	0x12
	.byte	0x38
	.byte	0x2
	.long	0x443
	.uleb128 0x1
	.long	.LASF69
	.byte	0x12
	.byte	0x3a
	.byte	0xe
	.long	0x8c
	.byte	0
	.uleb128 0x1
	.long	.LASF70
	.byte	0x12
	.byte	0x3b
	.byte	0xe
	.long	0x80
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.byte	0x10
	.byte	0x12
	.byte	0x3f
	.byte	0x2
	.long	0x474
	.uleb128 0x1
	.long	.LASF71
	.byte	0x12
	.byte	0x41
	.byte	0xa
	.long	0x66
	.byte	0
	.uleb128 0x1
	.long	.LASF72
	.byte	0x12
	.byte	0x42
	.byte	0xa
	.long	0x66
	.byte	0x4
	.uleb128 0x1
	.long	.LASF73
	.byte	0x12
	.byte	0x43
	.byte	0x11
	.long	0x378
	.byte	0x8
	.byte	0
	.uleb128 0x7
	.byte	0x10
	.byte	0x12
	.byte	0x47
	.byte	0x2
	.long	0x4a5
	.uleb128 0x1
	.long	.LASF69
	.byte	0x12
	.byte	0x49
	.byte	0xe
	.long	0x8c
	.byte	0
	.uleb128 0x1
	.long	.LASF70
	.byte	0x12
	.byte	0x4a
	.byte	0xe
	.long	0x80
	.byte	0x4
	.uleb128 0x1
	.long	.LASF73
	.byte	0x12
	.byte	0x4b
	.byte	0x11
	.long	0x378
	.byte	0x8
	.byte	0
	.uleb128 0x7
	.byte	0x20
	.byte	0x12
	.byte	0x4f
	.byte	0x2
	.long	0x4f0
	.uleb128 0x1
	.long	.LASF69
	.byte	0x12
	.byte	0x51
	.byte	0xe
	.long	0x8c
	.byte	0
	.uleb128 0x1
	.long	.LASF70
	.byte	0x12
	.byte	0x52
	.byte	0xe
	.long	0x80
	.byte	0x4
	.uleb128 0x1
	.long	.LASF74
	.byte	0x12
	.byte	0x53
	.byte	0xa
	.long	0x66
	.byte	0x8
	.uleb128 0x1
	.long	.LASF75
	.byte	0x12
	.byte	0x54
	.byte	0x13
	.long	0x98
	.byte	0x10
	.uleb128 0x1
	.long	.LASF76
	.byte	0x12
	.byte	0x55
	.byte	0x13
	.long	0x98
	.byte	0x18
	.byte	0
	.uleb128 0x7
	.byte	0x10
	.byte	0x12
	.byte	0x61
	.byte	0x3
	.long	0x514
	.uleb128 0x1
	.long	.LASF77
	.byte	0x12
	.byte	0x63
	.byte	0xd
	.long	0x48
	.byte	0
	.uleb128 0x1
	.long	.LASF78
	.byte	0x12
	.byte	0x64
	.byte	0xd
	.long	0x48
	.byte	0x8
	.byte	0
	.uleb128 0x10
	.byte	0x10
	.byte	0x12
	.byte	0x5e
	.byte	0x6
	.long	0x536
	.uleb128 0x5
	.long	.LASF79
	.byte	0x12
	.byte	0x65
	.byte	0x7
	.long	0x4f0
	.uleb128 0x5
	.long	.LASF80
	.byte	0x12
	.byte	0x67
	.byte	0xe
	.long	0x6d
	.byte	0
	.uleb128 0x7
	.byte	0x20
	.byte	0x12
	.byte	0x59
	.byte	0x2
	.long	0x567
	.uleb128 0x1
	.long	.LASF81
	.byte	0x12
	.byte	0x5b
	.byte	0xc
	.long	0x48
	.byte	0
	.uleb128 0x1
	.long	.LASF82
	.byte	0x12
	.byte	0x5d
	.byte	0x10
	.long	0x5f
	.byte	0x8
	.uleb128 0x1
	.long	.LASF83
	.byte	0x12
	.byte	0x68
	.byte	0xa
	.long	0x514
	.byte	0x10
	.byte	0
	.uleb128 0x7
	.byte	0x10
	.byte	0x12
	.byte	0x6c
	.byte	0x2
	.long	0x58b
	.uleb128 0x1
	.long	.LASF84
	.byte	0x12
	.byte	0x6e
	.byte	0x15
	.long	0x79
	.byte	0
	.uleb128 0x1
	.long	.LASF85
	.byte	0x12
	.byte	0x6f
	.byte	0xa
	.long	0x66
	.byte	0x8
	.byte	0
	.uleb128 0x7
	.byte	0x10
	.byte	0x12
	.byte	0x74
	.byte	0x2
	.long	0x5bc
	.uleb128 0x1
	.long	.LASF86
	.byte	0x12
	.byte	0x76
	.byte	0xc
	.long	0x48
	.byte	0
	.uleb128 0x1
	.long	.LASF87
	.byte	0x12
	.byte	0x77
	.byte	0xa
	.long	0x66
	.byte	0x8
	.uleb128 0x1
	.long	.LASF88
	.byte	0x12
	.byte	0x78
	.byte	0x13
	.long	0x41
	.byte	0xc
	.byte	0
	.uleb128 0x10
	.byte	0x70
	.byte	0x12
	.byte	0x33
	.byte	0x5
	.long	0x626
	.uleb128 0x5
	.long	.LASF89
	.byte	0x12
	.byte	0x35
	.byte	0x6
	.long	0x626
	.uleb128 0x5
	.long	.LASF90
	.byte	0x12
	.byte	0x3c
	.byte	0x6
	.long	0x41f
	.uleb128 0x5
	.long	.LASF91
	.byte	0x12
	.byte	0x44
	.byte	0x6
	.long	0x443
	.uleb128 0x23
	.string	"_rt"
	.byte	0x12
	.byte	0x4c
	.byte	0x6
	.long	0x474
	.uleb128 0x5
	.long	.LASF92
	.byte	0x12
	.byte	0x56
	.byte	0x6
	.long	0x4a5
	.uleb128 0x5
	.long	.LASF93
	.byte	0x12
	.byte	0x69
	.byte	0x6
	.long	0x536
	.uleb128 0x5
	.long	.LASF94
	.byte	0x12
	.byte	0x70
	.byte	0x6
	.long	0x567
	.uleb128 0x5
	.long	.LASF95
	.byte	0x12
	.byte	0x79
	.byte	0x6
	.long	0x58b
	.byte	0
	.uleb128 0x9
	.long	0x66
	.long	0x636
	.uleb128 0xd
	.long	0x3a
	.byte	0x1b
	.byte	0
	.uleb128 0x7
	.byte	0x80
	.byte	0x12
	.byte	0x24
	.byte	0x9
	.long	0x681
	.uleb128 0x1
	.long	.LASF96
	.byte	0x12
	.byte	0x26
	.byte	0x9
	.long	0x66
	.byte	0
	.uleb128 0x1
	.long	.LASF97
	.byte	0x12
	.byte	0x28
	.byte	0x9
	.long	0x66
	.byte	0x4
	.uleb128 0x1
	.long	.LASF98
	.byte	0x12
	.byte	0x2a
	.byte	0x9
	.long	0x66
	.byte	0x8
	.uleb128 0x1
	.long	.LASF99
	.byte	0x12
	.byte	0x30
	.byte	0x9
	.long	0x66
	.byte	0xc
	.uleb128 0x1
	.long	.LASF100
	.byte	0x12
	.byte	0x7b
	.byte	0x9
	.long	0x5bc
	.byte	0x10
	.byte	0
	.uleb128 0x3
	.long	.LASF101
	.byte	0x12
	.byte	0x7c
	.byte	0x5
	.long	0x636
	.uleb128 0x3
	.long	.LASF102
	.byte	0x13
	.byte	0x48
	.byte	0x10
	.long	0x32c
	.uleb128 0x10
	.byte	0x8
	.byte	0x14
	.byte	0x1f
	.byte	0x5
	.long	0x6bb
	.uleb128 0x5
	.long	.LASF103
	.byte	0x14
	.byte	0x22
	.byte	0x11
	.long	0x68d
	.uleb128 0x5
	.long	.LASF104
	.byte	0x14
	.byte	0x24
	.byte	0x9
	.long	0x6d5
	.byte	0
	.uleb128 0x17
	.long	0x6d0
	.uleb128 0x2
	.long	0x66
	.uleb128 0x2
	.long	0x6d0
	.uleb128 0x2
	.long	0x48
	.byte	0
	.uleb128 0x4
	.long	0x681
	.uleb128 0x4
	.long	0x6bb
	.uleb128 0xe
	.long	.LASF105
	.byte	0x98
	.byte	0x14
	.byte	0x1b
	.byte	0x8
	.long	0x71c
	.uleb128 0x1
	.long	.LASF106
	.byte	0x14
	.byte	0x26
	.byte	0x5
	.long	0x699
	.byte	0
	.uleb128 0x1
	.long	.LASF107
	.byte	0x14
	.byte	0x2e
	.byte	0x10
	.long	0x140
	.byte	0x8
	.uleb128 0x1
	.long	.LASF108
	.byte	0x14
	.byte	0x31
	.byte	0x9
	.long	0x66
	.byte	0x88
	.uleb128 0x1
	.long	.LASF109
	.byte	0x14
	.byte	0x34
	.byte	0xc
	.long	0x722
	.byte	0x90
	.byte	0
	.uleb128 0x12
	.long	0x6da
	.uleb128 0x24
	.uleb128 0x4
	.long	0x721
	.uleb128 0x25
	.byte	0x7
	.byte	0x4
	.long	0x41
	.byte	0x1a
	.byte	0x30
	.byte	0x1
	.long	0x76c
	.uleb128 0xa
	.long	.LASF110
	.byte	0
	.uleb128 0xa
	.long	.LASF111
	.byte	0x1
	.uleb128 0xa
	.long	.LASF112
	.byte	0x2
	.uleb128 0xa
	.long	.LASF113
	.byte	0x3
	.uleb128 0xa
	.long	.LASF114
	.byte	0
	.uleb128 0xa
	.long	.LASF115
	.byte	0x1
	.uleb128 0xa
	.long	.LASF116
	.byte	0x2
	.uleb128 0xa
	.long	.LASF117
	.byte	0
	.uleb128 0xa
	.long	.LASF118
	.byte	0
	.byte	0
	.uleb128 0x7
	.byte	0xd0
	.byte	0x15
	.byte	0xe3
	.byte	0x9
	.long	0x7f8
	.uleb128 0x1
	.long	.LASF119
	.byte	0x15
	.byte	0xe5
	.byte	0x9
	.long	0x66
	.byte	0
	.uleb128 0x1
	.long	.LASF120
	.byte	0x15
	.byte	0xe6
	.byte	0x9
	.long	0x66
	.byte	0x4
	.uleb128 0x1
	.long	.LASF121
	.byte	0x15
	.byte	0xe7
	.byte	0x1d
	.long	0x2e7
	.byte	0x8
	.uleb128 0x1
	.long	.LASF122
	.byte	0x15
	.byte	0xe8
	.byte	0x16
	.long	0x3fb
	.byte	0x88
	.uleb128 0x1
	.long	.LASF123
	.byte	0x15
	.byte	0xe9
	.byte	0x9
	.long	0x66
	.byte	0x90
	.uleb128 0x1
	.long	.LASF124
	.byte	0x15
	.byte	0xea
	.byte	0x9
	.long	0x66
	.byte	0x94
	.uleb128 0x1
	.long	.LASF125
	.byte	0x15
	.byte	0xeb
	.byte	0x9
	.long	0x66
	.byte	0x98
	.uleb128 0x1
	.long	.LASF126
	.byte	0x15
	.byte	0xec
	.byte	0x9
	.long	0x66
	.byte	0x9c
	.uleb128 0x1
	.long	.LASF127
	.byte	0x15
	.byte	0xed
	.byte	0x9
	.long	0x66
	.byte	0xa0
	.uleb128 0x1
	.long	.LASF128
	.byte	0x15
	.byte	0xee
	.byte	0x15
	.long	0x27f
	.byte	0xa8
	.byte	0
	.uleb128 0x3
	.long	.LASF129
	.byte	0x15
	.byte	0xef
	.byte	0x3
	.long	0x76c
	.uleb128 0x3
	.long	.LASF130
	.byte	0x16
	.byte	0x25
	.byte	0xf
	.long	0x48
	.uleb128 0x3
	.long	.LASF131
	.byte	0x16
	.byte	0x31
	.byte	0x11
	.long	0x81c
	.uleb128 0x4
	.long	0x821
	.uleb128 0x26
	.long	0x48
	.long	0x830
	.uleb128 0x2
	.long	0x830
	.byte	0
	.uleb128 0x4
	.long	0x7f8
	.uleb128 0x27
	.long	.LASF132
	.value	0x1038
	.byte	0x17
	.byte	0x5
	.byte	0x10
	.long	0x878
	.uleb128 0x1
	.long	.LASF133
	.byte	0x17
	.byte	0x7
	.byte	0xa
	.long	0x878
	.byte	0
	.uleb128 0x1
	.long	.LASF134
	.byte	0x17
	.byte	0x8
	.byte	0xa
	.long	0x888
	.byte	0x21
	.uleb128 0x13
	.long	.LASF135
	.byte	0x9
	.byte	0x13
	.long	0x3a
	.value	0x1028
	.uleb128 0x13
	.long	.LASF136
	.byte	0xa
	.byte	0x19
	.long	0x899
	.value	0x1030
	.byte	0
	.uleb128 0x9
	.long	0xc1
	.long	0x888
	.uleb128 0xd
	.long	0x3a
	.byte	0x20
	.byte	0
	.uleb128 0x9
	.long	0xc1
	.long	0x899
	.uleb128 0x14
	.long	0x3a
	.value	0xfff
	.byte	0
	.uleb128 0x4
	.long	0x835
	.uleb128 0x3
	.long	.LASF137
	.byte	0x17
	.byte	0xb
	.byte	0x3
	.long	0x835
	.uleb128 0x18
	.value	0x2028
	.byte	0x17
	.byte	0xd
	.long	0x8ce
	.uleb128 0x1
	.long	.LASF138
	.byte	0x17
	.byte	0xf
	.byte	0x14
	.long	0x8ce
	.byte	0
	.uleb128 0x13
	.long	.LASF128
	.byte	0x10
	.byte	0x15
	.long	0x27f
	.value	0x2000
	.byte	0
	.uleb128 0x9
	.long	0x8df
	.long	0x8df
	.uleb128 0x14
	.long	0x3a
	.value	0x3ff
	.byte	0
	.uleb128 0x4
	.long	0x89e
	.uleb128 0x3
	.long	.LASF139
	.byte	0x17
	.byte	0x11
	.byte	0x3
	.long	0x8aa
	.uleb128 0x7
	.byte	0x10
	.byte	0x18
	.byte	0x5
	.byte	0x9
	.long	0x914
	.uleb128 0x1
	.long	.LASF140
	.byte	0x18
	.byte	0x6
	.byte	0xc
	.long	0x29e
	.byte	0
	.uleb128 0x1
	.long	.LASF141
	.byte	0x18
	.byte	0x7
	.byte	0x9
	.long	0x66
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	.LASF142
	.byte	0x18
	.byte	0x8
	.byte	0x3
	.long	0x8f0
	.uleb128 0xe
	.long	.LASF143
	.byte	0x40
	.byte	0x19
	.byte	0x5
	.byte	0x10
	.long	0x962
	.uleb128 0x1
	.long	.LASF144
	.byte	0x19
	.byte	0x6
	.byte	0xa
	.long	0x878
	.byte	0
	.uleb128 0x1
	.long	.LASF145
	.byte	0x19
	.byte	0x7
	.byte	0xb
	.long	0xbc
	.byte	0x28
	.uleb128 0x1
	.long	.LASF119
	.byte	0x19
	.byte	0x8
	.byte	0x9
	.long	0x66
	.byte	0x30
	.uleb128 0x1
	.long	.LASF135
	.byte	0x19
	.byte	0x9
	.byte	0xc
	.long	0x10d
	.byte	0x38
	.byte	0
	.uleb128 0x3
	.long	.LASF146
	.byte	0x19
	.byte	0xa
	.byte	0x3
	.long	0x920
	.uleb128 0x18
	.value	0x2000
	.byte	0x19
	.byte	0xc
	.long	0x985
	.uleb128 0x1
	.long	.LASF138
	.byte	0x19
	.byte	0xd
	.byte	0x19
	.long	0x985
	.byte	0
	.byte	0
	.uleb128 0x9
	.long	0x996
	.long	0x996
	.uleb128 0x14
	.long	0x3a
	.value	0x3ff
	.byte	0
	.uleb128 0x4
	.long	0x962
	.uleb128 0x3
	.long	.LASF147
	.byte	0x19
	.byte	0xe
	.byte	0x3
	.long	0x96e
	.uleb128 0x15
	.long	.LASF148
	.byte	0xa
	.byte	0x1e
	.long	0x41a
	.uleb128 0x9
	.byte	0x3
	.quad	shutdown_flag
	.uleb128 0x15
	.long	.LASF149
	.byte	0xb
	.byte	0x18
	.long	0x27f
	.uleb128 0x9
	.byte	0x3
	.quad	shutdown_mutex
	.uleb128 0xf
	.long	.LASF150
	.byte	0x16
	.byte	0x3f
	.long	0x9e2
	.uleb128 0x2
	.long	0x804
	.byte	0
	.uleb128 0xf
	.long	.LASF151
	.byte	0x19
	.byte	0x16
	.long	0x9f3
	.uleb128 0x2
	.long	0x9f3
	.byte	0
	.uleb128 0x4
	.long	0x99b
	.uleb128 0xf
	.long	.LASF152
	.byte	0x18
	.byte	0xd
	.long	0xa09
	.uleb128 0x2
	.long	0xa09
	.byte	0
	.uleb128 0x4
	.long	0x914
	.uleb128 0xf
	.long	.LASF153
	.byte	0x17
	.byte	0x1c
	.long	0xa1f
	.uleb128 0x2
	.long	0xa1f
	.byte	0
	.uleb128 0x4
	.long	0x8e4
	.uleb128 0xc
	.long	.LASF154
	.byte	0xb
	.value	0x166
	.byte	0xc
	.long	0x66
	.long	0xa3b
	.uleb128 0x2
	.long	0x66
	.byte	0
	.uleb128 0xc
	.long	.LASF155
	.byte	0x1a
	.value	0x343
	.byte	0xc
	.long	0x66
	.long	0xa52
	.uleb128 0x2
	.long	0xa52
	.byte	0
	.uleb128 0x4
	.long	0x27f
	.uleb128 0xc
	.long	.LASF156
	.byte	0x1a
	.value	0x31a
	.byte	0xc
	.long	0x66
	.long	0xa6e
	.uleb128 0x2
	.long	0xa52
	.byte	0
	.uleb128 0x8
	.long	.LASF157
	.byte	0x1b
	.byte	0x2d
	.byte	0x7
	.long	0x48
	.long	0xa84
	.uleb128 0x2
	.long	0x830
	.byte	0
	.uleb128 0xf
	.long	.LASF158
	.byte	0x16
	.byte	0x4d
	.long	0xa9f
	.uleb128 0x2
	.long	0x804
	.uleb128 0x2
	.long	0x810
	.uleb128 0x2
	.long	0x830
	.byte	0
	.uleb128 0x28
	.long	.LASF159
	.byte	0x4
	.value	0x364
	.byte	0xd
	.long	0xab2
	.uleb128 0x2
	.long	0xf5
	.byte	0
	.uleb128 0x29
	.long	.LASF181
	.byte	0x1f
	.byte	0x25
	.byte	0xd
	.long	0xabe
	.uleb128 0x4
	.long	0x66
	.uleb128 0xc
	.long	.LASF160
	.byte	0xe
	.value	0x132
	.byte	0xc
	.long	0x66
	.long	0xae4
	.uleb128 0x2
	.long	0x66
	.uleb128 0x2
	.long	0x341
	.uleb128 0x2
	.long	0xae9
	.byte	0
	.uleb128 0x4
	.long	0x291
	.uleb128 0x16
	.long	0xae4
	.uleb128 0x8
	.long	.LASF161
	.byte	0x16
	.byte	0x5d
	.byte	0xc
	.long	0x804
	.long	0xb04
	.uleb128 0x2
	.long	0x66
	.byte	0
	.uleb128 0xf
	.long	.LASF162
	.byte	0x1c
	.byte	0xf
	.long	0xb1a
	.uleb128 0x2
	.long	0x830
	.uleb128 0x2
	.long	0xbc
	.byte	0
	.uleb128 0x8
	.long	.LASF163
	.byte	0x18
	.byte	0xa
	.byte	0xe
	.long	0xa09
	.long	0xb30
	.uleb128 0x2
	.long	0x66
	.byte	0
	.uleb128 0x8
	.long	.LASF164
	.byte	0x17
	.byte	0x17
	.byte	0x5
	.long	0x66
	.long	0xb46
	.uleb128 0x2
	.long	0xa1f
	.byte	0
	.uleb128 0x8
	.long	.LASF165
	.byte	0x19
	.byte	0x11
	.byte	0x15
	.long	0x9f3
	.long	0xb5c
	.uleb128 0x2
	.long	0x66
	.byte	0
	.uleb128 0x8
	.long	.LASF166
	.byte	0x17
	.byte	0x15
	.byte	0x10
	.long	0xa1f
	.long	0xb72
	.uleb128 0x2
	.long	0x66
	.byte	0
	.uleb128 0x8
	.long	.LASF167
	.byte	0x1d
	.byte	0x69
	.byte	0xc
	.long	0x66
	.long	0xb88
	.uleb128 0x2
	.long	0xf5
	.byte	0
	.uleb128 0x2a
	.long	.LASF168
	.byte	0x1d
	.value	0x2f4
	.byte	0xd
	.long	0xb9b
	.uleb128 0x2
	.long	0x66
	.byte	0
	.uleb128 0xc
	.long	.LASF169
	.byte	0x4
	.value	0x16b
	.byte	0xc
	.long	0x66
	.long	0xbb3
	.uleb128 0x2
	.long	0xf5
	.uleb128 0x2b
	.byte	0
	.uleb128 0xc
	.long	.LASF170
	.byte	0x1a
	.value	0x30d
	.byte	0xc
	.long	0x66
	.long	0xbcf
	.uleb128 0x2
	.long	0xa52
	.uleb128 0x2
	.long	0xbcf
	.byte	0
	.uleb128 0x4
	.long	0x23c
	.uleb128 0x8
	.long	.LASF171
	.byte	0x13
	.byte	0x58
	.byte	0x17
	.long	0x68d
	.long	0xbef
	.uleb128 0x2
	.long	0x66
	.uleb128 0x2
	.long	0x68d
	.byte	0
	.uleb128 0x8
	.long	.LASF105
	.byte	0x13
	.byte	0xf3
	.byte	0xc
	.long	0x66
	.long	0xc0f
	.uleb128 0x2
	.long	0x66
	.uleb128 0x2
	.long	0xc14
	.uleb128 0x2
	.long	0xc1e
	.byte	0
	.uleb128 0x4
	.long	0x71c
	.uleb128 0x16
	.long	0xc0f
	.uleb128 0x4
	.long	0x6da
	.uleb128 0x16
	.long	0xc19
	.uleb128 0x8
	.long	.LASF172
	.byte	0x13
	.byte	0xc7
	.byte	0xc
	.long	0x66
	.long	0xc39
	.uleb128 0x2
	.long	0xc39
	.byte	0
	.uleb128 0x4
	.long	0x14c
	.uleb128 0x8
	.long	.LASF173
	.byte	0x1e
	.byte	0x3d
	.byte	0xe
	.long	0x48
	.long	0xc5e
	.uleb128 0x2
	.long	0x48
	.uleb128 0x2
	.long	0x66
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0xc
	.long	.LASF174
	.byte	0xb
	.value	0x17a
	.byte	0x10
	.long	0xfa
	.long	0xc7f
	.uleb128 0x2
	.long	0x66
	.uleb128 0x2
	.long	0x28b
	.uleb128 0x2
	.long	0x2e
	.byte	0
	.uleb128 0xc
	.long	.LASF175
	.byte	0x1e
	.value	0x197
	.byte	0xf
	.long	0x2e
	.long	0xc96
	.uleb128 0x2
	.long	0xf5
	.byte	0
	.uleb128 0x2c
	.long	.LASF182
	.byte	0x1
	.byte	0x14
	.byte	0x5
	.long	0x66
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0xd1d
	.uleb128 0x19
	.long	.LASF176
	.byte	0xe
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -420
	.uleb128 0x19
	.long	.LASF177
	.byte	0x1a
	.long	0x29e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -432
	.uleb128 0x11
	.string	"sa"
	.byte	0x16
	.byte	0x16
	.long	0x6da
	.uleb128 0x3
	.byte	0x91
	.sleb128 -400
	.uleb128 0x11
	.string	"sd"
	.byte	0x1f
	.byte	0x13
	.long	0x7f8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.uleb128 0x11
	.string	"bl"
	.byte	0x36
	.byte	0x12
	.long	0xa09
	.uleb128 0x3
	.byte	0x91
	.sleb128 -416
	.uleb128 0x11
	.string	"tp"
	.byte	0x3b
	.byte	0x10
	.long	0x804
	.uleb128 0x3
	.byte	0x91
	.sleb128 -408
	.uleb128 0x2d
	.long	.LASF183
	.byte	0x1
	.byte	0x55
	.byte	0x1
	.quad	.L6
	.byte	0
	.uleb128 0x2e
	.long	.LASF184
	.byte	0x1
	.byte	0xe
	.byte	0x6
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2f
	.string	"num"
	.byte	0x1
	.byte	0xe
	.byte	0x16
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x15
	.long	.LASF178
	.byte	0xf
	.byte	0xb
	.long	0xbc
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
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 16
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
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
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
	.uleb128 0x12
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 23
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0x5
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
	.uleb128 0x19
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 20
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1b
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x20
	.uleb128 0x17
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
	.uleb128 0x21
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
	.uleb128 0x22
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0xd
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
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x25
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
	.uleb128 0x26
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
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
	.uleb128 0x29
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
	.uleb128 0x2b
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x2d
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
	.uleb128 0x2e
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
	.byte	0
	.byte	0
	.uleb128 0x2f
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
.LASF169:
	.string	"printf"
.LASF59:
	.string	"ai_family"
.LASF144:
	.string	"host_hash"
.LASF39:
	.string	"__size"
.LASF166:
	.string	"init_cache_table"
.LASF80:
	.string	"_pkey"
.LASF160:
	.string	"accept"
.LASF58:
	.string	"ai_flags"
.LASF8:
	.string	"size_t"
.LASF81:
	.string	"si_addr"
.LASF26:
	.string	"__prev"
.LASF40:
	.string	"__align"
.LASF49:
	.string	"sockaddr_storage"
.LASF154:
	.string	"close"
.LASF19:
	.string	"ssize_t"
.LASF179:
	.string	"GNU C17 14.2.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF68:
	.string	"sig_atomic_t"
.LASF102:
	.string	"__sighandler_t"
.LASF24:
	.string	"long long unsigned int"
.LASF76:
	.string	"si_stime"
.LASF122:
	.string	"server_info"
.LASF88:
	.string	"_arch"
.LASF27:
	.string	"__next"
.LASF121:
	.string	"client_info"
.LASF41:
	.string	"pthread_mutexattr_t"
.LASF44:
	.string	"socklen_t"
.LASF136:
	.string	"next"
.LASF135:
	.string	"timestamp"
.LASF34:
	.string	"__nusers"
.LASF156:
	.string	"pthread_mutex_lock"
.LASF119:
	.string	"sockfd"
.LASF56:
	.string	"__sigval_t"
.LASF20:
	.string	"long long int"
.LASF6:
	.string	"signed char"
.LASF162:
	.string	"init_socket"
.LASF158:
	.string	"dispatch"
.LASF92:
	.string	"_sigchld"
.LASF138:
	.string	"buckets"
.LASF10:
	.string	"long int"
.LASF15:
	.string	"__ssize_t"
.LASF78:
	.string	"_upper"
.LASF72:
	.string	"si_overrun"
.LASF134:
	.string	"filepath"
.LASF83:
	.string	"_bounds"
.LASF28:
	.string	"__pthread_list_t"
.LASF182:
	.string	"main"
.LASF152:
	.string	"cleanup_blocklist"
.LASF30:
	.string	"__pthread_mutex_s"
.LASF73:
	.string	"si_sigval"
.LASF97:
	.string	"si_errno"
.LASF9:
	.string	"__uint32_t"
.LASF69:
	.string	"si_pid"
.LASF137:
	.string	"cache_entry_t"
.LASF180:
	.string	"sigval"
.LASF87:
	.string	"_syscall"
.LASF127:
	.string	"port"
.LASF116:
	.string	"PTHREAD_MUTEX_ERRORCHECK"
.LASF3:
	.string	"unsigned int"
.LASF124:
	.string	"recvBytes"
.LASF66:
	.string	"__int128"
.LASF25:
	.string	"__val"
.LASF60:
	.string	"ai_socktype"
.LASF75:
	.string	"si_utime"
.LASF2:
	.string	"long unsigned int"
.LASF42:
	.string	"__data"
.LASF22:
	.string	"__sigset_t"
.LASF125:
	.string	"sentBytes"
.LASF93:
	.string	"_sigfault"
.LASF36:
	.string	"__spins"
.LASF178:
	.string	"data"
.LASF37:
	.string	"__elision"
.LASF5:
	.string	"short unsigned int"
.LASF57:
	.string	"addrinfo"
.LASF70:
	.string	"si_uid"
.LASF77:
	.string	"_lower"
.LASF108:
	.string	"sa_flags"
.LASF54:
	.string	"sival_int"
.LASF13:
	.string	"__clock_t"
.LASF95:
	.string	"_sigsys"
.LASF38:
	.string	"__list"
.LASF130:
	.string	"threadpool"
.LASF170:
	.string	"pthread_mutex_init"
.LASF84:
	.string	"si_band"
.LASF172:
	.string	"sigemptyset"
.LASF118:
	.string	"PTHREAD_MUTEX_FAST_NP"
.LASF33:
	.string	"__owner"
.LASF175:
	.string	"strlen"
.LASF146:
	.string	"connection_entry_t"
.LASF159:
	.string	"perror"
.LASF114:
	.string	"PTHREAD_MUTEX_NORMAL"
.LASF94:
	.string	"_sigpoll"
.LASF86:
	.string	"_call_addr"
.LASF23:
	.string	"sigset_t"
.LASF129:
	.string	"sockdetails_t"
.LASF100:
	.string	"_sifields"
.LASF61:
	.string	"ai_protocol"
.LASF105:
	.string	"sigaction"
.LASF153:
	.string	"cleanup_cache"
.LASF183:
	.string	"cleanup"
.LASF163:
	.string	"init_blocklist"
.LASF71:
	.string	"si_tid"
.LASF103:
	.string	"sa_handler"
.LASF111:
	.string	"PTHREAD_MUTEX_RECURSIVE_NP"
.LASF21:
	.string	"time_t"
.LASF120:
	.string	"client_sock_fd"
.LASF29:
	.string	"__pthread_internal_list"
.LASF62:
	.string	"ai_addrlen"
.LASF151:
	.string	"cleanup_connection_table"
.LASF47:
	.string	"sa_family"
.LASF174:
	.string	"write"
.LASF139:
	.string	"cache_table_t"
.LASF112:
	.string	"PTHREAD_MUTEX_ERRORCHECK_NP"
.LASF167:
	.string	"atoi"
.LASF4:
	.string	"unsigned char"
.LASF113:
	.string	"PTHREAD_MUTEX_ADAPTIVE_NP"
.LASF131:
	.string	"dispatch_fn"
.LASF150:
	.string	"destroy_threadpool"
.LASF79:
	.string	"_addr_bnd"
.LASF12:
	.string	"__pid_t"
.LASF63:
	.string	"ai_addr"
.LASF147:
	.string	"connection_table_t"
.LASF165:
	.string	"init_connection_table"
.LASF82:
	.string	"si_addr_lsb"
.LASF65:
	.string	"ai_next"
.LASF143:
	.string	"connection_entry"
.LASF168:
	.string	"exit"
.LASF161:
	.string	"create_threadpool"
.LASF89:
	.string	"_pad"
.LASF32:
	.string	"__count"
.LASF31:
	.string	"__lock"
.LASF171:
	.string	"signal"
.LASF128:
	.string	"lock"
.LASF16:
	.string	"char"
.LASF164:
	.string	"init_cache"
.LASF50:
	.string	"ss_family"
.LASF140:
	.string	"patterns"
.LASF17:
	.string	"__socklen_t"
.LASF46:
	.string	"sockaddr"
.LASF7:
	.string	"short int"
.LASF181:
	.string	"__errno_location"
.LASF11:
	.string	"__uid_t"
.LASF106:
	.string	"__sigaction_handler"
.LASF96:
	.string	"si_signo"
.LASF90:
	.string	"_kill"
.LASF141:
	.string	"pattern_count"
.LASF117:
	.string	"PTHREAD_MUTEX_DEFAULT"
.LASF43:
	.string	"pthread_mutex_t"
.LASF107:
	.string	"sa_mask"
.LASF99:
	.string	"__pad0"
.LASF74:
	.string	"si_status"
.LASF14:
	.string	"__time_t"
.LASF45:
	.string	"sa_family_t"
.LASF109:
	.string	"sa_restorer"
.LASF173:
	.string	"memset"
.LASF148:
	.string	"shutdown_flag"
.LASF52:
	.string	"__ss_align"
.LASF149:
	.string	"shutdown_mutex"
.LASF115:
	.string	"PTHREAD_MUTEX_RECURSIVE"
.LASF133:
	.string	"url_hash"
.LASF91:
	.string	"_timer"
.LASF110:
	.string	"PTHREAD_MUTEX_TIMED_NP"
.LASF51:
	.string	"__ss_padding"
.LASF85:
	.string	"si_fd"
.LASF142:
	.string	"blocklist_t"
.LASF176:
	.string	"argc"
.LASF48:
	.string	"sa_data"
.LASF145:
	.string	"hostname"
.LASF55:
	.string	"sival_ptr"
.LASF64:
	.string	"ai_canonname"
.LASF157:
	.string	"handle_req"
.LASF35:
	.string	"__kind"
.LASF155:
	.string	"pthread_mutex_unlock"
.LASF123:
	.string	"addr_len"
.LASF126:
	.string	"timeout"
.LASF53:
	.string	"__SOCKADDR_ARG"
.LASF177:
	.string	"argv"
.LASF18:
	.string	"__sig_atomic_t"
.LASF101:
	.string	"siginfo_t"
.LASF67:
	.string	"__int128 unsigned"
.LASF184:
	.string	"sig_handler"
.LASF132:
	.string	"cache_entry"
.LASF104:
	.string	"sa_sigaction"
.LASF98:
	.string	"si_code"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"proxy.c"
.LASF1:
	.string	"/home/parth/Work/All_data/university/Network System/Assignments/PA3"
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
