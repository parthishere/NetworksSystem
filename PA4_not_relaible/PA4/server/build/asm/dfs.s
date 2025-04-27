	.file	"dfs.c"
	.text
.Ltext0:
	.file 0 "/home/parth/Work/All_data/university/Network System/Assignments/PA4_not_relaible/PA4/server" "dfs.c"
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
.LFB320:
	.file 1 "dfs.c"
	.loc 1 11 27
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	.loc 1 12 11
	leaq	.LC0(%rip), %rax
	movq	%rax, -8(%rbp)
	.loc 1 13 5
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	.loc 1 13 5 is_stmt 0 discriminator 1
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	write@PLT
	.loc 1 14 19 is_stmt 1
	movl	$1, shutdown_flag(%rip)
	.loc 1 16 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE320:
	.size	sig_handler, .-sig_handler
	.section	.rodata
	.align 8
.LC1:
	.string	"\033[31m[-] You messed up, command is ./dfs <DFS_DIR> <PORT> | (passed numer of args: %d) \n\033[0m"
	.align 8
.LC2:
	.string	"\033[32m[+] Directory '%s' created successfully.\n\033[0m"
	.align 8
.LC3:
	.string	"\033[32m[+] Directory '%s' already exists.\n\033[0m"
	.align 8
.LC4:
	.string	"\033[31m[-] Error creating directory"
.LC5:
	.string	"\033[31maccept\033[0m"
	.text
	.globl	main
	.type	main, @function
main:
.LFB321:
	.loc 1 19 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$400, %rsp
	movl	%edi, -388(%rbp)
	movq	%rsi, -400(%rbp)
	.loc 1 19 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 21 5
	leaq	-368(%rbp), %rax
	movl	$152, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 22 5
	leaq	-368(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	sigemptyset@PLT
	.loc 1 23 17
	movl	$0, -232(%rbp)
	.loc 1 24 19
	leaq	sig_handler(%rip), %rax
	movq	%rax, -368(%rbp)
	.loc 1 27 5
	movl	$1, %esi
	movl	$13, %edi
	call	signal@PLT
	.loc 1 30 8
	cmpl	$3, -388(%rbp)
	je	.L3
	.loc 1 32 9
	movl	-388(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 33 9
	movl	$1, %edi
	call	exit@PLT
.L3:
	.loc 1 37 5
	leaq	-208(%rbp), %rax
	addq	$160, %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_mutex_init@PLT
	.loc 1 38 16
	movq	-400(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -200(%rbp)
	.loc 1 40 28
	movq	-400(%rbp), %rax
	addq	$8, %rax
	.loc 1 40 18
	movq	(%rax), %rax
	movl	$511, %esi
	movq	%rax, %rdi
	call	mkdir@PLT
	movl	%eax, -380(%rbp)
	.loc 1 41 8
	cmpl	$0, -380(%rbp)
	jne	.L4
	.loc 1 42 74
	movq	-400(%rbp), %rax
	addq	$8, %rax
	.loc 1 42 9
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L5
.L4:
	.loc 1 43 16
	call	__errno_location@PLT
	.loc 1 43 16 is_stmt 0 discriminator 1
	movl	(%rax), %eax
	.loc 1 43 15 is_stmt 1 discriminator 1
	cmpl	$17, %eax
	jne	.L6
	.loc 1 44 68
	movq	-400(%rbp), %rax
	addq	$8, %rax
	.loc 1 44 9
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L5
.L6:
	.loc 1 46 9
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	.loc 1 47 9
	movl	$1, %edi
	call	exit@PLT
.L5:
	.loc 1 50 17
	movl	$128, -56(%rbp)
	.loc 1 53 26
	movq	-400(%rbp), %rax
	addq	$16, %rax
	.loc 1 53 5
	movq	(%rax), %rdx
	leaq	-208(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	init_socket@PLT
	.loc 1 56 21
	movl	$10, %edi
	call	create_threadpool@PLT
	movq	%rax, -376(%rbp)
	.loc 1 57 8
	cmpq	$0, -376(%rbp)
	je	.L15
	.loc 1 65 11
	jmp	.L9
.L12:
	.loc 1 67 34
	leaq	-208(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rcx
	movl	-208(%rbp), %eax
	leaq	-208(%rbp), %rdx
	addq	$152, %rdx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	accept@PLT
	.loc 1 67 32 discriminator 1
	movl	%eax, -204(%rbp)
	.loc 1 67 16 discriminator 1
	movl	-204(%rbp), %eax
	.loc 1 67 12 discriminator 1
	testl	%eax, %eax
	jns	.L10
	.loc 1 67 123 discriminator 1
	call	__errno_location@PLT
	movl	(%rax), %eax
	.loc 1 67 120 discriminator 1
	cmpl	$4, %eax
	je	.L10
	.loc 1 69 13
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	.loc 1 70 13
	jmp	.L8
.L10:
	.loc 1 73 9
	leaq	-208(%rbp), %rdx
	movq	-376(%rbp), %rax
	movq	handle_req@GOTPCREL(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	dispatch@PLT
	.loc 1 76 9
	leaq	shutdown_mutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	.loc 1 77 12
	movl	shutdown_flag(%rip), %eax
	.loc 1 77 11
	testl	%eax, %eax
	jne	.L16
	.loc 1 80 9
	leaq	shutdown_mutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
.L9:
	.loc 1 65 12
	movl	shutdown_flag(%rip), %eax
	testl	%eax, %eax
	je	.L12
	.loc 1 84 1
	jmp	.L8
.L15:
	.loc 1 58 9
	nop
	jmp	.L8
.L16:
	.loc 1 78 13
	nop
.L8:
	.loc 1 86 5
	movl	-208(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 88 5
	movq	-376(%rbp), %rax
	movq	%rax, %rdi
	call	destroy_threadpool@PLT
	.loc 1 91 12
	movl	$0, %eax
	.loc 1 92 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L14
	call	__stack_chk_fail@PLT
.L14:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE321:
	.size	main, .-main
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/14/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/stdio.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/__sigset_t.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/types/sigset_t.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h"
	.file 9 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.file 10 "/usr/include/unistd.h"
	.file 11 "/usr/include/x86_64-linux-gnu/bits/sockaddr.h"
	.file 12 "/usr/include/x86_64-linux-gnu/bits/socket.h"
	.file 13 "/usr/include/x86_64-linux-gnu/sys/socket.h"
	.file 14 "/usr/include/x86_64-linux-gnu/bits/types/__sigval_t.h"
	.file 15 "/usr/include/netdb.h"
	.file 16 "/usr/include/x86_64-linux-gnu/bits/types/sig_atomic_t.h"
	.file 17 "/usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h"
	.file 18 "/usr/include/signal.h"
	.file 19 "/usr/include/x86_64-linux-gnu/bits/sigaction.h"
	.file 20 "common.h"
	.file 21 "includes/queue.h"
	.file 22 "/usr/include/pthread.h"
	.file 23 "includes/handle_req.h"
	.file 24 "includes/setup.h"
	.file 25 "/usr/include/x86_64-linux-gnu/sys/stat.h"
	.file 26 "/usr/include/stdlib.h"
	.file 27 "/usr/include/string.h"
	.file 28 "/usr/include/errno.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xae8
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x16
	.long	.LASF154
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.byte	0x96
	.byte	0x1a
	.long	0x41
	.uleb128 0x3
	.long	.LASF13
	.byte	0x3
	.byte	0x9a
	.byte	0x19
	.long	0x66
	.uleb128 0x3
	.long	.LASF14
	.byte	0x3
	.byte	0x9c
	.byte	0x1b
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
	.uleb128 0x13
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
	.uleb128 0xb
	.long	0xc1
	.long	0xf5
	.uleb128 0xc
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
	.uleb128 0x7
	.byte	0x80
	.byte	0x5
	.byte	0x5
	.byte	0x9
	.long	0x124
	.uleb128 0x1
	.long	.LASF24
	.byte	0x5
	.byte	0x7
	.byte	0x15
	.long	0x124
	.byte	0
	.byte	0
	.uleb128 0xb
	.long	0x3a
	.long	0x134
	.uleb128 0xc
	.long	0x3a
	.byte	0xf
	.byte	0
	.uleb128 0x3
	.long	.LASF21
	.byte	0x5
	.byte	0x8
	.byte	0x3
	.long	0x10d
	.uleb128 0x3
	.long	.LASF22
	.byte	0x6
	.byte	0x7
	.byte	0x14
	.long	0x134
	.uleb128 0x6
	.byte	0x8
	.byte	0x7
	.long	.LASF23
	.uleb128 0xd
	.long	.LASF28
	.byte	0x10
	.byte	0x7
	.byte	0x33
	.byte	0x10
	.long	0x17b
	.uleb128 0x1
	.long	.LASF25
	.byte	0x7
	.byte	0x35
	.byte	0x23
	.long	0x17b
	.byte	0
	.uleb128 0x1
	.long	.LASF26
	.byte	0x7
	.byte	0x36
	.byte	0x23
	.long	0x17b
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.long	0x153
	.uleb128 0x3
	.long	.LASF27
	.byte	0x7
	.byte	0x37
	.byte	0x3
	.long	0x153
	.uleb128 0xd
	.long	.LASF29
	.byte	0x28
	.byte	0x8
	.byte	0x16
	.byte	0x8
	.long	0x202
	.uleb128 0x1
	.long	.LASF30
	.byte	0x8
	.byte	0x18
	.byte	0x7
	.long	0x66
	.byte	0
	.uleb128 0x1
	.long	.LASF31
	.byte	0x8
	.byte	0x19
	.byte	0x10
	.long	0x41
	.byte	0x4
	.uleb128 0x1
	.long	.LASF32
	.byte	0x8
	.byte	0x1a
	.byte	0x7
	.long	0x66
	.byte	0x8
	.uleb128 0x1
	.long	.LASF33
	.byte	0x8
	.byte	0x1c
	.byte	0x10
	.long	0x41
	.byte	0xc
	.uleb128 0x1
	.long	.LASF34
	.byte	0x8
	.byte	0x20
	.byte	0x7
	.long	0x66
	.byte	0x10
	.uleb128 0x1
	.long	.LASF35
	.byte	0x8
	.byte	0x22
	.byte	0x9
	.long	0x5f
	.byte	0x14
	.uleb128 0x1
	.long	.LASF36
	.byte	0x8
	.byte	0x23
	.byte	0x9
	.long	0x5f
	.byte	0x16
	.uleb128 0x1
	.long	.LASF37
	.byte	0x8
	.byte	0x24
	.byte	0x14
	.long	0x180
	.byte	0x18
	.byte	0
	.uleb128 0xe
	.byte	0x4
	.byte	0x9
	.byte	0x20
	.byte	0x9
	.long	0x224
	.uleb128 0x5
	.long	.LASF38
	.byte	0x9
	.byte	0x22
	.byte	0x8
	.long	0xe5
	.uleb128 0x5
	.long	.LASF39
	.byte	0x9
	.byte	0x23
	.byte	0x7
	.long	0x66
	.byte	0
	.uleb128 0x3
	.long	.LASF40
	.byte	0x9
	.byte	0x24
	.byte	0x3
	.long	0x202
	.uleb128 0x13
	.long	0x224
	.uleb128 0xe
	.byte	0x28
	.byte	0x9
	.byte	0x43
	.byte	0x9
	.long	0x263
	.uleb128 0x5
	.long	.LASF41
	.byte	0x9
	.byte	0x45
	.byte	0x1c
	.long	0x18c
	.uleb128 0x5
	.long	.LASF38
	.byte	0x9
	.byte	0x46
	.byte	0x8
	.long	0x263
	.uleb128 0x5
	.long	.LASF39
	.byte	0x9
	.byte	0x47
	.byte	0xc
	.long	0x79
	.byte	0
	.uleb128 0xb
	.long	0xc1
	.long	0x273
	.uleb128 0xc
	.long	0x3a
	.byte	0x27
	.byte	0
	.uleb128 0x3
	.long	.LASF42
	.byte	0x9
	.byte	0x48
	.byte	0x3
	.long	0x235
	.uleb128 0x4
	.long	0x284
	.uleb128 0x19
	.uleb128 0x1a
	.long	.LASF43
	.byte	0xa
	.value	0x112
	.byte	0x15
	.long	0xcd
	.uleb128 0x4
	.long	0xbc
	.uleb128 0x3
	.long	.LASF44
	.byte	0xb
	.byte	0x1c
	.byte	0x1c
	.long	0x51
	.uleb128 0xd
	.long	.LASF45
	.byte	0x10
	.byte	0xc
	.byte	0xb8
	.byte	0x27
	.long	0x2cb
	.uleb128 0x1
	.long	.LASF46
	.byte	0xc
	.byte	0xba
	.byte	0x5
	.long	0x297
	.byte	0
	.uleb128 0x1
	.long	.LASF47
	.byte	0xc
	.byte	0xbb
	.byte	0xa
	.long	0x2cb
	.byte	0x2
	.byte	0
	.uleb128 0xb
	.long	0xc1
	.long	0x2db
	.uleb128 0xc
	.long	0x3a
	.byte	0xd
	.byte	0
	.uleb128 0xd
	.long	.LASF48
	.byte	0x80
	.byte	0xc
	.byte	0xc5
	.byte	0x27
	.long	0x310
	.uleb128 0x1
	.long	.LASF49
	.byte	0xc
	.byte	0xc7
	.byte	0x5
	.long	0x297
	.byte	0
	.uleb128 0x1
	.long	.LASF50
	.byte	0xc
	.byte	0xc8
	.byte	0xa
	.long	0x310
	.byte	0x2
	.uleb128 0x1
	.long	.LASF51
	.byte	0xc
	.byte	0xc9
	.byte	0x14
	.long	0x3a
	.byte	0x78
	.byte	0
	.uleb128 0xb
	.long	0xc1
	.long	0x320
	.uleb128 0xc
	.long	0x3a
	.byte	0x75
	.byte	0
	.uleb128 0x4
	.long	0x325
	.uleb128 0x14
	.long	0x330
	.uleb128 0x2
	.long	0x66
	.byte	0
	.uleb128 0x4
	.long	0x2a3
	.uleb128 0x3
	.long	.LASF52
	.byte	0xd
	.byte	0x50
	.byte	0xa
	.long	0x341
	.uleb128 0x1b
	.byte	0x8
	.byte	0xd
	.byte	0x4f
	.byte	0x9
	.uleb128 0x1c
	.long	.LASF155
	.byte	0x8
	.byte	0xe
	.byte	0x18
	.byte	0x7
	.long	0x36c
	.uleb128 0x5
	.long	.LASF53
	.byte	0xe
	.byte	0x1a
	.byte	0x7
	.long	0x66
	.uleb128 0x5
	.long	.LASF54
	.byte	0xe
	.byte	0x1b
	.byte	0x9
	.long	0x48
	.byte	0
	.uleb128 0x3
	.long	.LASF55
	.byte	0xe
	.byte	0x1e
	.byte	0x16
	.long	0x346
	.uleb128 0x1d
	.long	.LASF56
	.byte	0x30
	.byte	0xf
	.value	0x235
	.byte	0x8
	.long	0x3ef
	.uleb128 0xa
	.long	.LASF57
	.value	0x237
	.byte	0x7
	.long	0x66
	.byte	0
	.uleb128 0xa
	.long	.LASF58
	.value	0x238
	.byte	0x7
	.long	0x66
	.byte	0x4
	.uleb128 0xa
	.long	.LASF59
	.value	0x239
	.byte	0x7
	.long	0x66
	.byte	0x8
	.uleb128 0xa
	.long	.LASF60
	.value	0x23a
	.byte	0x7
	.long	0x66
	.byte	0xc
	.uleb128 0xa
	.long	.LASF61
	.value	0x23b
	.byte	0xd
	.long	0x285
	.byte	0x10
	.uleb128 0xa
	.long	.LASF62
	.value	0x23c
	.byte	0x14
	.long	0x330
	.byte	0x18
	.uleb128 0xa
	.long	.LASF63
	.value	0x23d
	.byte	0x9
	.long	0xbc
	.byte	0x20
	.uleb128 0xa
	.long	.LASF64
	.value	0x23e
	.byte	0x14
	.long	0x3ef
	.byte	0x28
	.byte	0
	.uleb128 0x4
	.long	0x378
	.uleb128 0x6
	.byte	0x10
	.byte	0x5
	.long	.LASF65
	.uleb128 0x6
	.byte	0x10
	.byte	0x7
	.long	.LASF66
	.uleb128 0x3
	.long	.LASF67
	.byte	0x10
	.byte	0x8
	.byte	0x18
	.long	0xd9
	.uleb128 0x1e
	.long	0x402
	.uleb128 0x7
	.byte	0x8
	.byte	0x11
	.byte	0x38
	.byte	0x2
	.long	0x437
	.uleb128 0x1
	.long	.LASF68
	.byte	0x11
	.byte	0x3a
	.byte	0xe
	.long	0x98
	.byte	0
	.uleb128 0x1
	.long	.LASF69
	.byte	0x11
	.byte	0x3b
	.byte	0xe
	.long	0x80
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.byte	0x10
	.byte	0x11
	.byte	0x3f
	.byte	0x2
	.long	0x468
	.uleb128 0x1
	.long	.LASF70
	.byte	0x11
	.byte	0x41
	.byte	0xa
	.long	0x66
	.byte	0
	.uleb128 0x1
	.long	.LASF71
	.byte	0x11
	.byte	0x42
	.byte	0xa
	.long	0x66
	.byte	0x4
	.uleb128 0x1
	.long	.LASF72
	.byte	0x11
	.byte	0x43
	.byte	0x11
	.long	0x36c
	.byte	0x8
	.byte	0
	.uleb128 0x7
	.byte	0x10
	.byte	0x11
	.byte	0x47
	.byte	0x2
	.long	0x499
	.uleb128 0x1
	.long	.LASF68
	.byte	0x11
	.byte	0x49
	.byte	0xe
	.long	0x98
	.byte	0
	.uleb128 0x1
	.long	.LASF69
	.byte	0x11
	.byte	0x4a
	.byte	0xe
	.long	0x80
	.byte	0x4
	.uleb128 0x1
	.long	.LASF72
	.byte	0x11
	.byte	0x4b
	.byte	0x11
	.long	0x36c
	.byte	0x8
	.byte	0
	.uleb128 0x7
	.byte	0x20
	.byte	0x11
	.byte	0x4f
	.byte	0x2
	.long	0x4e4
	.uleb128 0x1
	.long	.LASF68
	.byte	0x11
	.byte	0x51
	.byte	0xe
	.long	0x98
	.byte	0
	.uleb128 0x1
	.long	.LASF69
	.byte	0x11
	.byte	0x52
	.byte	0xe
	.long	0x80
	.byte	0x4
	.uleb128 0x1
	.long	.LASF73
	.byte	0x11
	.byte	0x53
	.byte	0xa
	.long	0x66
	.byte	0x8
	.uleb128 0x1
	.long	.LASF74
	.byte	0x11
	.byte	0x54
	.byte	0x13
	.long	0xa4
	.byte	0x10
	.uleb128 0x1
	.long	.LASF75
	.byte	0x11
	.byte	0x55
	.byte	0x13
	.long	0xa4
	.byte	0x18
	.byte	0
	.uleb128 0x7
	.byte	0x10
	.byte	0x11
	.byte	0x61
	.byte	0x3
	.long	0x508
	.uleb128 0x1
	.long	.LASF76
	.byte	0x11
	.byte	0x63
	.byte	0xd
	.long	0x48
	.byte	0
	.uleb128 0x1
	.long	.LASF77
	.byte	0x11
	.byte	0x64
	.byte	0xd
	.long	0x48
	.byte	0x8
	.byte	0
	.uleb128 0xe
	.byte	0x10
	.byte	0x11
	.byte	0x5e
	.byte	0x6
	.long	0x52a
	.uleb128 0x5
	.long	.LASF78
	.byte	0x11
	.byte	0x65
	.byte	0x7
	.long	0x4e4
	.uleb128 0x5
	.long	.LASF79
	.byte	0x11
	.byte	0x67
	.byte	0xe
	.long	0x6d
	.byte	0
	.uleb128 0x7
	.byte	0x20
	.byte	0x11
	.byte	0x59
	.byte	0x2
	.long	0x55b
	.uleb128 0x1
	.long	.LASF80
	.byte	0x11
	.byte	0x5b
	.byte	0xc
	.long	0x48
	.byte	0
	.uleb128 0x1
	.long	.LASF81
	.byte	0x11
	.byte	0x5d
	.byte	0x10
	.long	0x5f
	.byte	0x8
	.uleb128 0x1
	.long	.LASF82
	.byte	0x11
	.byte	0x68
	.byte	0xa
	.long	0x508
	.byte	0x10
	.byte	0
	.uleb128 0x7
	.byte	0x10
	.byte	0x11
	.byte	0x6c
	.byte	0x2
	.long	0x57f
	.uleb128 0x1
	.long	.LASF83
	.byte	0x11
	.byte	0x6e
	.byte	0x15
	.long	0x79
	.byte	0
	.uleb128 0x1
	.long	.LASF84
	.byte	0x11
	.byte	0x6f
	.byte	0xa
	.long	0x66
	.byte	0x8
	.byte	0
	.uleb128 0x7
	.byte	0x10
	.byte	0x11
	.byte	0x74
	.byte	0x2
	.long	0x5b0
	.uleb128 0x1
	.long	.LASF85
	.byte	0x11
	.byte	0x76
	.byte	0xc
	.long	0x48
	.byte	0
	.uleb128 0x1
	.long	.LASF86
	.byte	0x11
	.byte	0x77
	.byte	0xa
	.long	0x66
	.byte	0x8
	.uleb128 0x1
	.long	.LASF87
	.byte	0x11
	.byte	0x78
	.byte	0x13
	.long	0x41
	.byte	0xc
	.byte	0
	.uleb128 0xe
	.byte	0x70
	.byte	0x11
	.byte	0x33
	.byte	0x5
	.long	0x61a
	.uleb128 0x5
	.long	.LASF88
	.byte	0x11
	.byte	0x35
	.byte	0x6
	.long	0x61a
	.uleb128 0x5
	.long	.LASF89
	.byte	0x11
	.byte	0x3c
	.byte	0x6
	.long	0x413
	.uleb128 0x5
	.long	.LASF90
	.byte	0x11
	.byte	0x44
	.byte	0x6
	.long	0x437
	.uleb128 0x1f
	.string	"_rt"
	.byte	0x11
	.byte	0x4c
	.byte	0x6
	.long	0x468
	.uleb128 0x5
	.long	.LASF91
	.byte	0x11
	.byte	0x56
	.byte	0x6
	.long	0x499
	.uleb128 0x5
	.long	.LASF92
	.byte	0x11
	.byte	0x69
	.byte	0x6
	.long	0x52a
	.uleb128 0x5
	.long	.LASF93
	.byte	0x11
	.byte	0x70
	.byte	0x6
	.long	0x55b
	.uleb128 0x5
	.long	.LASF94
	.byte	0x11
	.byte	0x79
	.byte	0x6
	.long	0x57f
	.byte	0
	.uleb128 0xb
	.long	0x66
	.long	0x62a
	.uleb128 0xc
	.long	0x3a
	.byte	0x1b
	.byte	0
	.uleb128 0x7
	.byte	0x80
	.byte	0x11
	.byte	0x24
	.byte	0x9
	.long	0x675
	.uleb128 0x1
	.long	.LASF95
	.byte	0x11
	.byte	0x26
	.byte	0x9
	.long	0x66
	.byte	0
	.uleb128 0x1
	.long	.LASF96
	.byte	0x11
	.byte	0x28
	.byte	0x9
	.long	0x66
	.byte	0x4
	.uleb128 0x1
	.long	.LASF97
	.byte	0x11
	.byte	0x2a
	.byte	0x9
	.long	0x66
	.byte	0x8
	.uleb128 0x1
	.long	.LASF98
	.byte	0x11
	.byte	0x30
	.byte	0x9
	.long	0x66
	.byte	0xc
	.uleb128 0x1
	.long	.LASF99
	.byte	0x11
	.byte	0x7b
	.byte	0x9
	.long	0x5b0
	.byte	0x10
	.byte	0
	.uleb128 0x3
	.long	.LASF100
	.byte	0x11
	.byte	0x7c
	.byte	0x5
	.long	0x62a
	.uleb128 0x3
	.long	.LASF101
	.byte	0x12
	.byte	0x48
	.byte	0x10
	.long	0x320
	.uleb128 0xe
	.byte	0x8
	.byte	0x13
	.byte	0x1f
	.byte	0x5
	.long	0x6af
	.uleb128 0x5
	.long	.LASF102
	.byte	0x13
	.byte	0x22
	.byte	0x11
	.long	0x681
	.uleb128 0x5
	.long	.LASF103
	.byte	0x13
	.byte	0x24
	.byte	0x9
	.long	0x6c9
	.byte	0
	.uleb128 0x14
	.long	0x6c4
	.uleb128 0x2
	.long	0x66
	.uleb128 0x2
	.long	0x6c4
	.uleb128 0x2
	.long	0x48
	.byte	0
	.uleb128 0x4
	.long	0x675
	.uleb128 0x4
	.long	0x6af
	.uleb128 0xd
	.long	.LASF104
	.byte	0x98
	.byte	0x13
	.byte	0x1b
	.byte	0x8
	.long	0x710
	.uleb128 0x1
	.long	.LASF105
	.byte	0x13
	.byte	0x26
	.byte	0x5
	.long	0x68d
	.byte	0
	.uleb128 0x1
	.long	.LASF106
	.byte	0x13
	.byte	0x2e
	.byte	0x10
	.long	0x134
	.byte	0x8
	.uleb128 0x1
	.long	.LASF107
	.byte	0x13
	.byte	0x31
	.byte	0x9
	.long	0x66
	.byte	0x88
	.uleb128 0x1
	.long	.LASF108
	.byte	0x13
	.byte	0x34
	.byte	0xc
	.long	0x711
	.byte	0x90
	.byte	0
	.uleb128 0x20
	.uleb128 0x4
	.long	0x710
	.uleb128 0x21
	.byte	0x7
	.byte	0x4
	.long	0x41
	.byte	0x16
	.byte	0x30
	.byte	0x1
	.long	0x75b
	.uleb128 0x8
	.long	.LASF109
	.byte	0
	.uleb128 0x8
	.long	.LASF110
	.byte	0x1
	.uleb128 0x8
	.long	.LASF111
	.byte	0x2
	.uleb128 0x8
	.long	.LASF112
	.byte	0x3
	.uleb128 0x8
	.long	.LASF113
	.byte	0
	.uleb128 0x8
	.long	.LASF114
	.byte	0x1
	.uleb128 0x8
	.long	.LASF115
	.byte	0x2
	.uleb128 0x8
	.long	.LASF116
	.byte	0
	.uleb128 0x8
	.long	.LASF117
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x10
	.byte	0x4
	.long	.LASF118
	.uleb128 0x4
	.long	0x66
	.uleb128 0x7
	.byte	0xc8
	.byte	0x14
	.byte	0x7f
	.byte	0x9
	.long	0x7cc
	.uleb128 0x1
	.long	.LASF119
	.byte	0x14
	.byte	0x81
	.byte	0x9
	.long	0x66
	.byte	0
	.uleb128 0x1
	.long	.LASF120
	.byte	0x14
	.byte	0x82
	.byte	0x9
	.long	0x66
	.byte	0x4
	.uleb128 0x1
	.long	.LASF121
	.byte	0x14
	.byte	0x84
	.byte	0xb
	.long	0xbc
	.byte	0x8
	.uleb128 0x1
	.long	.LASF122
	.byte	0x14
	.byte	0x86
	.byte	0x1d
	.long	0x2db
	.byte	0x10
	.uleb128 0x1
	.long	.LASF123
	.byte	0x14
	.byte	0x87
	.byte	0x16
	.long	0x3ef
	.byte	0x90
	.uleb128 0x1
	.long	.LASF124
	.byte	0x14
	.byte	0x88
	.byte	0x9
	.long	0x66
	.byte	0x98
	.uleb128 0x1
	.long	.LASF125
	.byte	0x14
	.byte	0x89
	.byte	0x15
	.long	0x273
	.byte	0xa0
	.byte	0
	.uleb128 0x3
	.long	.LASF126
	.byte	0x14
	.byte	0x8a
	.byte	0x3
	.long	0x767
	.uleb128 0x3
	.long	.LASF127
	.byte	0x15
	.byte	0x25
	.byte	0xf
	.long	0x48
	.uleb128 0x3
	.long	.LASF128
	.byte	0x15
	.byte	0x31
	.byte	0x11
	.long	0x7f0
	.uleb128 0x4
	.long	0x7f5
	.uleb128 0x22
	.long	0x48
	.long	0x804
	.uleb128 0x2
	.long	0x804
	.byte	0
	.uleb128 0x4
	.long	0x7cc
	.uleb128 0x10
	.long	.LASF129
	.byte	0x7
	.byte	0x1e
	.long	0x40e
	.uleb128 0x9
	.byte	0x3
	.quad	shutdown_flag
	.uleb128 0x10
	.long	.LASF130
	.byte	0x8
	.byte	0x18
	.long	0x273
	.uleb128 0x9
	.byte	0x3
	.quad	shutdown_mutex
	.uleb128 0x11
	.long	.LASF135
	.byte	0x15
	.byte	0x3f
	.long	0x844
	.uleb128 0x2
	.long	0x7d8
	.byte	0
	.uleb128 0x9
	.long	.LASF131
	.byte	0xa
	.value	0x166
	.byte	0xc
	.long	0x66
	.long	0x85b
	.uleb128 0x2
	.long	0x66
	.byte	0
	.uleb128 0x9
	.long	.LASF132
	.byte	0x16
	.value	0x343
	.byte	0xc
	.long	0x66
	.long	0x872
	.uleb128 0x2
	.long	0x872
	.byte	0
	.uleb128 0x4
	.long	0x273
	.uleb128 0x9
	.long	.LASF133
	.byte	0x16
	.value	0x31a
	.byte	0xc
	.long	0x66
	.long	0x88e
	.uleb128 0x2
	.long	0x872
	.byte	0
	.uleb128 0xf
	.long	.LASF134
	.byte	0x17
	.byte	0x27
	.byte	0x7
	.long	0x48
	.long	0x8a4
	.uleb128 0x2
	.long	0x804
	.byte	0
	.uleb128 0x11
	.long	.LASF136
	.byte	0x15
	.byte	0x4d
	.long	0x8bf
	.uleb128 0x2
	.long	0x7d8
	.uleb128 0x2
	.long	0x7e4
	.uleb128 0x2
	.long	0x804
	.byte	0
	.uleb128 0x9
	.long	.LASF137
	.byte	0xd
	.value	0x132
	.byte	0xc
	.long	0x66
	.long	0x8e0
	.uleb128 0x2
	.long	0x66
	.uleb128 0x2
	.long	0x335
	.uleb128 0x2
	.long	0x8e5
	.byte	0
	.uleb128 0x4
	.long	0x285
	.uleb128 0x23
	.long	0x8e0
	.uleb128 0xf
	.long	.LASF138
	.byte	0x15
	.byte	0x5d
	.byte	0xc
	.long	0x7d8
	.long	0x900
	.uleb128 0x2
	.long	0x66
	.byte	0
	.uleb128 0x11
	.long	.LASF139
	.byte	0x18
	.byte	0x14
	.long	0x916
	.uleb128 0x2
	.long	0x804
	.uleb128 0x2
	.long	0xbc
	.byte	0
	.uleb128 0x24
	.long	.LASF140
	.byte	0x4
	.value	0x364
	.byte	0xd
	.long	0x929
	.uleb128 0x2
	.long	0xf5
	.byte	0
	.uleb128 0x25
	.long	.LASF156
	.byte	0x1c
	.byte	0x25
	.byte	0xd
	.long	0x762
	.uleb128 0x9
	.long	.LASF141
	.byte	0x19
	.value	0x185
	.byte	0xc
	.long	0x66
	.long	0x951
	.uleb128 0x2
	.long	0xf5
	.uleb128 0x2
	.long	0x8c
	.byte	0
	.uleb128 0x9
	.long	.LASF142
	.byte	0x16
	.value	0x30d
	.byte	0xc
	.long	0x66
	.long	0x96d
	.uleb128 0x2
	.long	0x872
	.uleb128 0x2
	.long	0x96d
	.byte	0
	.uleb128 0x4
	.long	0x230
	.uleb128 0x26
	.long	.LASF143
	.byte	0x1a
	.value	0x2f4
	.byte	0xd
	.long	0x985
	.uleb128 0x2
	.long	0x66
	.byte	0
	.uleb128 0x9
	.long	.LASF144
	.byte	0x4
	.value	0x16b
	.byte	0xc
	.long	0x66
	.long	0x99d
	.uleb128 0x2
	.long	0xf5
	.uleb128 0x27
	.byte	0
	.uleb128 0xf
	.long	.LASF145
	.byte	0x12
	.byte	0x58
	.byte	0x17
	.long	0x681
	.long	0x9b8
	.uleb128 0x2
	.long	0x66
	.uleb128 0x2
	.long	0x681
	.byte	0
	.uleb128 0xf
	.long	.LASF146
	.byte	0x12
	.byte	0xc7
	.byte	0xc
	.long	0x66
	.long	0x9ce
	.uleb128 0x2
	.long	0x9ce
	.byte	0
	.uleb128 0x4
	.long	0x140
	.uleb128 0xf
	.long	.LASF147
	.byte	0x1b
	.byte	0x3d
	.byte	0xe
	.long	0x48
	.long	0x9f3
	.uleb128 0x2
	.long	0x48
	.uleb128 0x2
	.long	0x66
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0x9
	.long	.LASF148
	.byte	0xa
	.value	0x17a
	.byte	0x10
	.long	0xfa
	.long	0xa14
	.uleb128 0x2
	.long	0x66
	.uleb128 0x2
	.long	0x27f
	.uleb128 0x2
	.long	0x2e
	.byte	0
	.uleb128 0x9
	.long	.LASF149
	.byte	0x1b
	.value	0x197
	.byte	0xf
	.long	0x2e
	.long	0xa2b
	.uleb128 0x2
	.long	0xf5
	.byte	0
	.uleb128 0x28
	.long	.LASF157
	.byte	0x1
	.byte	0x12
	.byte	0x5
	.long	0x66
	.quad	.LFB321
	.quad	.LFE321-.LFB321
	.uleb128 0x1
	.byte	0x9c
	.long	0xab3
	.uleb128 0x15
	.long	.LASF150
	.byte	0xe
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -404
	.uleb128 0x15
	.long	.LASF151
	.byte	0x1a
	.long	0x292
	.uleb128 0x3
	.byte	0x91
	.sleb128 -416
	.uleb128 0x12
	.string	"sa"
	.byte	0x14
	.byte	0x16
	.long	0x6ce
	.uleb128 0x3
	.byte	0x91
	.sleb128 -384
	.uleb128 0x12
	.string	"sd"
	.byte	0x24
	.byte	0x13
	.long	0x7cc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -224
	.uleb128 0x10
	.long	.LASF152
	.byte	0x28
	.byte	0x9
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -396
	.uleb128 0x12
	.string	"tp"
	.byte	0x38
	.byte	0x10
	.long	0x7d8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -392
	.uleb128 0x29
	.long	.LASF158
	.byte	0x1
	.byte	0x54
	.byte	0x1
	.quad	.L8
	.byte	0
	.uleb128 0x2a
	.long	.LASF159
	.byte	0x1
	.byte	0xb
	.byte	0x6
	.quad	.LFB320
	.quad	.LFE320-.LFB320
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2b
	.string	"num"
	.byte	0x1
	.byte	0xb
	.byte	0x16
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x10
	.long	.LASF153
	.byte	0xc
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
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 15
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
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 18
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x20
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x23
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
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
	.uleb128 0x87
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x7c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x2b
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
.LASF144:
	.string	"printf"
.LASF58:
	.string	"ai_family"
.LASF38:
	.string	"__size"
.LASF79:
	.string	"_pkey"
.LASF137:
	.string	"accept"
.LASF57:
	.string	"ai_flags"
.LASF8:
	.string	"size_t"
.LASF80:
	.string	"si_addr"
.LASF25:
	.string	"__prev"
.LASF39:
	.string	"__align"
.LASF148:
	.string	"write"
.LASF131:
	.string	"close"
.LASF126:
	.string	"sockDetails_t"
.LASF19:
	.string	"ssize_t"
.LASF154:
	.string	"GNU C17 14.2.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF101:
	.string	"__sighandler_t"
.LASF23:
	.string	"long long unsigned int"
.LASF75:
	.string	"si_stime"
.LASF123:
	.string	"server_info"
.LASF87:
	.string	"_arch"
.LASF26:
	.string	"__next"
.LASF122:
	.string	"client_info"
.LASF40:
	.string	"pthread_mutexattr_t"
.LASF43:
	.string	"socklen_t"
.LASF133:
	.string	"pthread_mutex_lock"
.LASF119:
	.string	"sockfd"
.LASF55:
	.string	"__sigval_t"
.LASF141:
	.string	"mkdir"
.LASF20:
	.string	"long long int"
.LASF6:
	.string	"signed char"
.LASF152:
	.string	"status"
.LASF12:
	.string	"__mode_t"
.LASF139:
	.string	"init_socket"
.LASF136:
	.string	"dispatch"
.LASF91:
	.string	"_sigchld"
.LASF10:
	.string	"long int"
.LASF15:
	.string	"__ssize_t"
.LASF77:
	.string	"_upper"
.LASF71:
	.string	"si_overrun"
.LASF82:
	.string	"_bounds"
.LASF27:
	.string	"__pthread_list_t"
.LASF157:
	.string	"main"
.LASF29:
	.string	"__pthread_mutex_s"
.LASF72:
	.string	"si_sigval"
.LASF96:
	.string	"si_errno"
.LASF9:
	.string	"__uint32_t"
.LASF68:
	.string	"si_pid"
.LASF73:
	.string	"si_status"
.LASF155:
	.string	"sigval"
.LASF86:
	.string	"_syscall"
.LASF115:
	.string	"PTHREAD_MUTEX_ERRORCHECK"
.LASF3:
	.string	"unsigned int"
.LASF65:
	.string	"__int128"
.LASF24:
	.string	"__val"
.LASF59:
	.string	"ai_socktype"
.LASF74:
	.string	"si_utime"
.LASF2:
	.string	"long unsigned int"
.LASF41:
	.string	"__data"
.LASF21:
	.string	"__sigset_t"
.LASF92:
	.string	"_sigfault"
.LASF153:
	.string	"data"
.LASF36:
	.string	"__elision"
.LASF5:
	.string	"short unsigned int"
.LASF56:
	.string	"addrinfo"
.LASF69:
	.string	"si_uid"
.LASF76:
	.string	"_lower"
.LASF107:
	.string	"sa_flags"
.LASF53:
	.string	"sival_int"
.LASF121:
	.string	"dirname"
.LASF14:
	.string	"__clock_t"
.LASF94:
	.string	"_sigsys"
.LASF127:
	.string	"threadpool"
.LASF142:
	.string	"pthread_mutex_init"
.LASF83:
	.string	"si_band"
.LASF146:
	.string	"sigemptyset"
.LASF117:
	.string	"PTHREAD_MUTEX_FAST_NP"
.LASF32:
	.string	"__owner"
.LASF149:
	.string	"strlen"
.LASF140:
	.string	"perror"
.LASF113:
	.string	"PTHREAD_MUTEX_NORMAL"
.LASF93:
	.string	"_sigpoll"
.LASF85:
	.string	"_call_addr"
.LASF22:
	.string	"sigset_t"
.LASF99:
	.string	"_sifields"
.LASF60:
	.string	"ai_protocol"
.LASF104:
	.string	"sigaction"
.LASF48:
	.string	"sockaddr_storage"
.LASF158:
	.string	"cleanup"
.LASF70:
	.string	"si_tid"
.LASF102:
	.string	"sa_handler"
.LASF110:
	.string	"PTHREAD_MUTEX_RECURSIVE_NP"
.LASF67:
	.string	"sig_atomic_t"
.LASF120:
	.string	"client_sock_fd"
.LASF28:
	.string	"__pthread_internal_list"
.LASF61:
	.string	"ai_addrlen"
.LASF46:
	.string	"sa_family"
.LASF111:
	.string	"PTHREAD_MUTEX_ERRORCHECK_NP"
.LASF4:
	.string	"unsigned char"
.LASF112:
	.string	"PTHREAD_MUTEX_ADAPTIVE_NP"
.LASF128:
	.string	"dispatch_fn"
.LASF135:
	.string	"destroy_threadpool"
.LASF78:
	.string	"_addr_bnd"
.LASF13:
	.string	"__pid_t"
.LASF62:
	.string	"ai_addr"
.LASF7:
	.string	"short int"
.LASF124:
	.string	"addr_len"
.LASF81:
	.string	"si_addr_lsb"
.LASF64:
	.string	"ai_next"
.LASF143:
	.string	"exit"
.LASF138:
	.string	"create_threadpool"
.LASF88:
	.string	"_pad"
.LASF31:
	.string	"__count"
.LASF30:
	.string	"__lock"
.LASF145:
	.string	"signal"
.LASF118:
	.string	"long double"
.LASF16:
	.string	"char"
.LASF49:
	.string	"ss_family"
.LASF17:
	.string	"__socklen_t"
.LASF45:
	.string	"sockaddr"
.LASF156:
	.string	"__errno_location"
.LASF11:
	.string	"__uid_t"
.LASF105:
	.string	"__sigaction_handler"
.LASF95:
	.string	"si_signo"
.LASF89:
	.string	"_kill"
.LASF116:
	.string	"PTHREAD_MUTEX_DEFAULT"
.LASF42:
	.string	"pthread_mutex_t"
.LASF106:
	.string	"sa_mask"
.LASF98:
	.string	"__pad0"
.LASF35:
	.string	"__spins"
.LASF44:
	.string	"sa_family_t"
.LASF108:
	.string	"sa_restorer"
.LASF151:
	.string	"argv"
.LASF147:
	.string	"memset"
.LASF129:
	.string	"shutdown_flag"
.LASF51:
	.string	"__ss_align"
.LASF130:
	.string	"shutdown_mutex"
.LASF114:
	.string	"PTHREAD_MUTEX_RECURSIVE"
.LASF33:
	.string	"__nusers"
.LASF90:
	.string	"_timer"
.LASF109:
	.string	"PTHREAD_MUTEX_TIMED_NP"
.LASF50:
	.string	"__ss_padding"
.LASF84:
	.string	"si_fd"
.LASF150:
	.string	"argc"
.LASF47:
	.string	"sa_data"
.LASF37:
	.string	"__list"
.LASF54:
	.string	"sival_ptr"
.LASF63:
	.string	"ai_canonname"
.LASF134:
	.string	"handle_req"
.LASF34:
	.string	"__kind"
.LASF132:
	.string	"pthread_mutex_unlock"
.LASF52:
	.string	"__SOCKADDR_ARG"
.LASF125:
	.string	"lock"
.LASF18:
	.string	"__sig_atomic_t"
.LASF100:
	.string	"siginfo_t"
.LASF66:
	.string	"__int128 unsigned"
.LASF159:
	.string	"sig_handler"
.LASF103:
	.string	"sa_sigaction"
.LASF97:
	.string	"si_code"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"dfs.c"
.LASF1:
	.string	"/home/parth/Work/All_data/university/Network System/Assignments/PA4_not_relaible/PA4/server"
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
