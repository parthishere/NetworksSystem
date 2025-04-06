	.file	"fork.c"
	.text
.Ltext0:
	.file 0 "/home/parth/Work/All_data/university/Network System/Assignments/PA3" "src/fork.c"
	.section	.rodata
.LC0:
	.string	"Cleaned up child process %d\n"
	.text
	.globl	cleanup_zombie_processes
	.type	cleanup_zombie_processes, @function
cleanup_zombie_processes:
.LFB6:
	.file 1 "src/fork.c"
	.loc 1 26 33
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	.loc 1 28 11
	jmp	.L2
.L3:
	.loc 1 29 9
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L2:
	.loc 1 28 19
	movl	$1, %edx
	movl	$0, %esi
	movl	$-1, %edi
	call	waitpid@PLT
	movl	%eax, -4(%rbp)
	.loc 1 28 47 discriminator 1
	cmpl	$0, -4(%rbp)
	jg	.L3
	.loc 1 31 1
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	cleanup_zombie_processes, .-cleanup_zombie_processes
	.section	.rodata
.LC1:
	.string	"\033[31mselect error"
	.align 8
.LC2:
	.string	"\033[33m[-] (%d) Connection timed out\n\033[0m"
.LC3:
	.string	"\033[31m[-] read"
	.text
	.globl	use_fork
	.type	use_fork, @function
use_fork:
.LFB7:
	.loc 1 52 1
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
	subq	$2384, %rsp
	movq	%rdi, -31048(%rbp)
	.loc 1 52 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 59 9
	movq	-31048(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, -31032(%rbp)
	.loc 1 60 9
	movq	-31048(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -31028(%rbp)
	.loc 1 63 9
	call	fork@PLT
	.loc 1 63 8 discriminator 1
	testl	%eax, %eax
	jne	.L5
.LBB2:
	.loc 1 65 9
	movl	-31028(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
.L13:
.LBB3:
.LBB4:
	.loc 1 71 13
	leaq	-30864(%rbp), %rax
	movq	%rax, -31016(%rbp)
	movl	$0, -31036(%rbp)
	jmp	.L6
.L7:
	.loc 1 71 13 is_stmt 0 discriminator 3
	movq	-31016(%rbp), %rax
	movl	-31036(%rbp), %edx
	movq	$0, (%rax,%rdx,8)
	addl	$1, -31036(%rbp)
.L6:
	.loc 1 71 13 discriminator 1
	cmpl	$15, -31036(%rbp)
	jbe	.L7
.LBE4:
	.loc 1 72 13 is_stmt 1
	movl	-31032(%rbp), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	movl	%eax, %esi
	movslq	%esi, %rax
	movq	-30864(%rbp,%rax,8), %rax
	movl	-31032(%rbp), %edx
	andl	$63, %edx
	movl	$1, %edi
	movl	%edx, %ecx
	salq	%cl, %rdi
	movq	%rdi, %rdx
	orq	%rax, %rdx
	movslq	%esi, %rax
	movq	%rdx, -30864(%rbp,%rax,8)
	.loc 1 73 28
	movq	$10, -31008(%rbp)
	movq	$0, -31000(%rbp)
	.loc 1 76 33
	movl	-31032(%rbp), %eax
	leal	1(%rax), %edi
	leaq	-31008(%rbp), %rdx
	leaq	-30864(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	call	select@PLT
	movl	%eax, -31024(%rbp)
	.loc 1 77 16
	cmpl	$0, -31024(%rbp)
	jns	.L8
	.loc 1 79 17
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	.loc 1 80 17
	jmp	.L9
.L8:
	.loc 1 84 16
	cmpl	$0, -31024(%rbp)
	jne	.L10
	.loc 1 86 17
	call	gettid@PLT
	.loc 1 86 17 is_stmt 0 discriminator 1
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 87 17 is_stmt 1
	jmp	.L9
.L10:
	.loc 1 91 17
	movl	-31032(%rbp), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	cltq
	movq	-30864(%rbp,%rax,8), %rdx
	movl	-31032(%rbp), %eax
	andl	$63, %eax
	movl	$1, %esi
	movl	%eax, %ecx
	salq	%cl, %rsi
	movq	%rsi, %rax
	andq	%rdx, %rax
	.loc 1 91 16
	testq	%rax, %rax
	je	.L13
	.loc 1 94 33
	leaq	-30736(%rbp), %rsi
	movl	-31032(%rbp), %eax
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 94 31 discriminator 1
	movl	%eax, -31020(%rbp)
	.loc 1 94 20 discriminator 1
	cmpl	$0, -31020(%rbp)
	jns	.L12
	.loc 1 96 21
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
.L12:
	.loc 1 100 17
	leaq	-30992(%rbp), %rax
	movl	$120, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 101 17
	leaq	-30992(%rbp), %rdx
	leaq	-30736(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	parse_request_line_thread_safe@PLT
	.loc 1 104 17
	movq	-31048(%rbp), %rdx
	leaq	-30992(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	build_and_send_header@PLT
	.loc 1 107 27
	movl	-30900(%rbp), %eax
	.loc 1 107 20
	cmpl	$1, %eax
	je	.L9
	.loc 1 107 59 discriminator 1
	movl	-30904(%rbp), %eax
	.loc 1 107 50 discriminator 1
	testl	%eax, %eax
	je	.L9
	.loc 1 112 17
	leaq	-30992(%rbp), %rax
	movl	$120, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.LBE3:
	.loc 1 69 9
	jmp	.L13
.L9:
	.loc 1 117 9
	movl	-31032(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 118 9
	movl	$0, %edi
	call	_exit@PLT
.L5:
.LBE2:
	.loc 1 122 9
	movq	-31048(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 125 1
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L14
	call	__stack_chk_fail@PLT
.L14:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	use_fork, .-use_fork
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/14/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/stdio.h"
	.file 5 "/usr/include/x86_64-linux-gnu/sys/types.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h"
	.file 7 "/usr/include/x86_64-linux-gnu/sys/select.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"
	.file 9 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h"
	.file 10 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.file 11 "/usr/include/unistd.h"
	.file 12 "/usr/include/x86_64-linux-gnu/bits/sockaddr.h"
	.file 13 "/usr/include/x86_64-linux-gnu/bits/socket.h"
	.file 14 "/usr/include/netdb.h"
	.file 15 "./common.h"
	.file 16 "includes/parser.h"
	.file 17 "/usr/include/string.h"
	.file 18 "/usr/include/x86_64-linux-gnu/sys/socket.h"
	.file 19 "includes/builder.h"
	.file 20 "/usr/include/x86_64-linux-gnu/bits/unistd_ext.h"
	.file 21 "/usr/include/x86_64-linux-gnu/sys/wait.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x8b2
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x15
	.long	.LASF147
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.byte	0x9a
	.byte	0x19
	.long	0x66
	.uleb128 0x4
	.long	.LASF11
	.byte	0x3
	.byte	0xa0
	.byte	0x1a
	.long	0x6d
	.uleb128 0x4
	.long	.LASF12
	.byte	0x3
	.byte	0xa2
	.byte	0x1f
	.long	0x6d
	.uleb128 0x4
	.long	.LASF13
	.byte	0x3
	.byte	0xc2
	.byte	0x1b
	.long	0x6d
	.uleb128 0x6
	.long	0xa9
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.long	.LASF14
	.uleb128 0x18
	.long	0xa9
	.uleb128 0x4
	.long	.LASF15
	.byte	0x3
	.byte	0xd2
	.byte	0x17
	.long	0x41
	.uleb128 0x6
	.long	0xb0
	.uleb128 0x4
	.long	.LASF16
	.byte	0x4
	.byte	0x4e
	.byte	0x13
	.long	0x98
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.long	.LASF17
	.uleb128 0x4
	.long	.LASF18
	.byte	0x5
	.byte	0x61
	.byte	0x11
	.long	0x74
	.uleb128 0x9
	.long	.LASF25
	.byte	0x10
	.byte	0x6
	.byte	0x8
	.byte	0x8
	.long	0x10d
	.uleb128 0x1
	.long	.LASF19
	.byte	0x6
	.byte	0xe
	.byte	0xc
	.long	0x80
	.byte	0
	.uleb128 0x1
	.long	.LASF20
	.byte	0x6
	.byte	0xf
	.byte	0x11
	.long	0x8c
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.long	.LASF21
	.byte	0x7
	.byte	0x31
	.byte	0x12
	.long	0x6d
	.uleb128 0x11
	.byte	0x80
	.byte	0x7
	.byte	0x3b
	.long	0x12f
	.uleb128 0x1
	.long	.LASF22
	.byte	0x7
	.byte	0x40
	.byte	0xf
	.long	0x12f
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x10d
	.long	0x13f
	.uleb128 0xc
	.long	0x3a
	.byte	0xf
	.byte	0
	.uleb128 0x4
	.long	.LASF23
	.byte	0x7
	.byte	0x46
	.byte	0x5
	.long	0x119
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.long	.LASF24
	.uleb128 0x9
	.long	.LASF26
	.byte	0x10
	.byte	0x8
	.byte	0x33
	.byte	0x10
	.long	0x17a
	.uleb128 0x1
	.long	.LASF27
	.byte	0x8
	.byte	0x35
	.byte	0x23
	.long	0x17a
	.byte	0
	.uleb128 0x1
	.long	.LASF28
	.byte	0x8
	.byte	0x36
	.byte	0x23
	.long	0x17a
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.long	0x152
	.uleb128 0x4
	.long	.LASF29
	.byte	0x8
	.byte	0x37
	.byte	0x3
	.long	0x152
	.uleb128 0x9
	.long	.LASF30
	.byte	0x28
	.byte	0x9
	.byte	0x16
	.byte	0x8
	.long	0x201
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
	.long	0x17f
	.byte	0x18
	.byte	0
	.uleb128 0x19
	.byte	0x28
	.byte	0xa
	.byte	0x43
	.byte	0x9
	.long	0x22c
	.uleb128 0xe
	.long	.LASF39
	.byte	0x45
	.byte	0x1c
	.long	0x18b
	.uleb128 0xe
	.long	.LASF40
	.byte	0x46
	.byte	0x8
	.long	0x22c
	.uleb128 0xe
	.long	.LASF41
	.byte	0x47
	.byte	0xc
	.long	0x6d
	.byte	0
	.uleb128 0xa
	.long	0xa9
	.long	0x23c
	.uleb128 0xc
	.long	0x3a
	.byte	0x27
	.byte	0
	.uleb128 0x4
	.long	.LASF42
	.byte	0xa
	.byte	0x48
	.byte	0x3
	.long	0x201
	.uleb128 0x1a
	.long	.LASF43
	.byte	0xb
	.value	0x112
	.byte	0x15
	.long	0xb5
	.uleb128 0x4
	.long	.LASF44
	.byte	0xc
	.byte	0x1c
	.byte	0x1c
	.long	0x51
	.uleb128 0x9
	.long	.LASF45
	.byte	0x10
	.byte	0xd
	.byte	0xb8
	.byte	0x27
	.long	0x289
	.uleb128 0x1
	.long	.LASF46
	.byte	0xd
	.byte	0xba
	.byte	0x5
	.long	0x255
	.byte	0
	.uleb128 0x1
	.long	.LASF47
	.byte	0xd
	.byte	0xbb
	.byte	0xa
	.long	0x289
	.byte	0x2
	.byte	0
	.uleb128 0xa
	.long	0xa9
	.long	0x299
	.uleb128 0xc
	.long	0x3a
	.byte	0xd
	.byte	0
	.uleb128 0x9
	.long	.LASF48
	.byte	0x80
	.byte	0xd
	.byte	0xc5
	.byte	0x27
	.long	0x2ce
	.uleb128 0x1
	.long	.LASF49
	.byte	0xd
	.byte	0xc7
	.byte	0x5
	.long	0x255
	.byte	0
	.uleb128 0x1
	.long	.LASF50
	.byte	0xd
	.byte	0xc8
	.byte	0xa
	.long	0x2ce
	.byte	0x2
	.uleb128 0x1
	.long	.LASF51
	.byte	0xd
	.byte	0xc9
	.byte	0x14
	.long	0x3a
	.byte	0x78
	.byte	0
	.uleb128 0xa
	.long	0xa9
	.long	0x2de
	.uleb128 0xc
	.long	0x3a
	.byte	0x75
	.byte	0
	.uleb128 0x6
	.long	0x261
	.uleb128 0x1b
	.long	.LASF52
	.byte	0x30
	.byte	0xe
	.value	0x235
	.byte	0x8
	.long	0x35a
	.uleb128 0x8
	.long	.LASF53
	.value	0x237
	.byte	0x7
	.long	0x66
	.byte	0
	.uleb128 0x8
	.long	.LASF54
	.value	0x238
	.byte	0x7
	.long	0x66
	.byte	0x4
	.uleb128 0x8
	.long	.LASF55
	.value	0x239
	.byte	0x7
	.long	0x66
	.byte	0x8
	.uleb128 0x8
	.long	.LASF56
	.value	0x23a
	.byte	0x7
	.long	0x66
	.byte	0xc
	.uleb128 0x8
	.long	.LASF57
	.value	0x23b
	.byte	0xd
	.long	0x248
	.byte	0x10
	.uleb128 0x8
	.long	.LASF58
	.value	0x23c
	.byte	0x14
	.long	0x2de
	.byte	0x18
	.uleb128 0x8
	.long	.LASF59
	.value	0x23d
	.byte	0x9
	.long	0xa4
	.byte	0x20
	.uleb128 0x8
	.long	.LASF60
	.value	0x23e
	.byte	0x14
	.long	0x35a
	.byte	0x28
	.byte	0
	.uleb128 0x6
	.long	0x2e3
	.uleb128 0x5
	.byte	0x10
	.byte	0x5
	.long	.LASF61
	.uleb128 0x5
	.byte	0x10
	.byte	0x7
	.long	.LASF62
	.uleb128 0xd
	.long	.LASF68
	.long	0x41
	.byte	0x66
	.long	0x394
	.uleb128 0x2
	.long	.LASF63
	.byte	0
	.uleb128 0x2
	.long	.LASF64
	.byte	0x1
	.uleb128 0x2
	.long	.LASF65
	.byte	0x2
	.uleb128 0x2
	.long	.LASF66
	.byte	0x3
	.byte	0
	.uleb128 0x4
	.long	.LASF67
	.byte	0xf
	.byte	0x6c
	.byte	0x3
	.long	0x36d
	.uleb128 0xd
	.long	.LASF69
	.long	0x41
	.byte	0x72
	.long	0x3d8
	.uleb128 0xf
	.string	"OK"
	.byte	0x1
	.uleb128 0x2
	.long	.LASF70
	.byte	0x2
	.uleb128 0x2
	.long	.LASF71
	.byte	0x4
	.uleb128 0x2
	.long	.LASF72
	.byte	0x8
	.uleb128 0x2
	.long	.LASF73
	.byte	0x10
	.uleb128 0x2
	.long	.LASF74
	.byte	0x20
	.uleb128 0x2
	.long	.LASF75
	.byte	0x21
	.byte	0
	.uleb128 0x4
	.long	.LASF76
	.byte	0xf
	.byte	0x7b
	.byte	0x3
	.long	0x3a0
	.uleb128 0xd
	.long	.LASF77
	.long	0x41
	.byte	0x82
	.long	0x41d
	.uleb128 0xf
	.string	"GET"
	.byte	0
	.uleb128 0x2
	.long	.LASF78
	.byte	0x1
	.uleb128 0xf
	.string	"PUT"
	.byte	0x2
	.uleb128 0x2
	.long	.LASF79
	.byte	0x3
	.uleb128 0x2
	.long	.LASF80
	.byte	0x4
	.uleb128 0x2
	.long	.LASF81
	.byte	0x5
	.uleb128 0x2
	.long	.LASF82
	.byte	0x6
	.byte	0
	.uleb128 0x4
	.long	.LASF83
	.byte	0xf
	.byte	0x8b
	.byte	0x3
	.long	0x3e4
	.uleb128 0xd
	.long	.LASF84
	.long	0x41
	.byte	0x91
	.long	0x46e
	.uleb128 0x2
	.long	.LASF85
	.byte	0
	.uleb128 0x2
	.long	.LASF86
	.byte	0x1
	.uleb128 0x2
	.long	.LASF87
	.byte	0x2
	.uleb128 0x2
	.long	.LASF88
	.byte	0x3
	.uleb128 0x2
	.long	.LASF89
	.byte	0x4
	.uleb128 0x2
	.long	.LASF90
	.byte	0x5
	.uleb128 0x2
	.long	.LASF91
	.byte	0x6
	.uleb128 0x2
	.long	.LASF92
	.byte	0x7
	.uleb128 0x2
	.long	.LASF93
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.long	.LASF94
	.byte	0xf
	.byte	0x9c
	.byte	0x3
	.long	0x429
	.uleb128 0x9
	.long	.LASF95
	.byte	0x78
	.byte	0xf
	.byte	0xba
	.byte	0x10
	.long	0x572
	.uleb128 0x1
	.long	.LASF96
	.byte	0xf
	.byte	0xbc
	.byte	0x10
	.long	0x394
	.byte	0
	.uleb128 0x1
	.long	.LASF97
	.byte	0xf
	.byte	0xbd
	.byte	0xb
	.long	0xa4
	.byte	0x8
	.uleb128 0x1
	.long	.LASF98
	.byte	0xf
	.byte	0xbf
	.byte	0xb
	.long	0xa4
	.byte	0x10
	.uleb128 0x1
	.long	.LASF99
	.byte	0xf
	.byte	0xc0
	.byte	0xb
	.long	0xa4
	.byte	0x18
	.uleb128 0x1
	.long	.LASF100
	.byte	0xf
	.byte	0xc1
	.byte	0xb
	.long	0xa4
	.byte	0x20
	.uleb128 0x1
	.long	.LASF101
	.byte	0xf
	.byte	0xc3
	.byte	0x13
	.long	0x46e
	.byte	0x28
	.uleb128 0x1
	.long	.LASF102
	.byte	0xf
	.byte	0xc4
	.byte	0xb
	.long	0xa4
	.byte	0x30
	.uleb128 0x1
	.long	.LASF103
	.byte	0xf
	.byte	0xc6
	.byte	0xe
	.long	0x41d
	.byte	0x38
	.uleb128 0x1
	.long	.LASF104
	.byte	0xf
	.byte	0xc7
	.byte	0xb
	.long	0xa4
	.byte	0x40
	.uleb128 0x1
	.long	.LASF105
	.byte	0xf
	.byte	0xc9
	.byte	0x13
	.long	0x572
	.byte	0x48
	.uleb128 0x1
	.long	.LASF106
	.byte	0xf
	.byte	0xca
	.byte	0xb
	.long	0xa4
	.byte	0x50
	.uleb128 0x1
	.long	.LASF107
	.byte	0xf
	.byte	0xcc
	.byte	0x9
	.long	0x66
	.byte	0x58
	.uleb128 0x1
	.long	.LASF108
	.byte	0xf
	.byte	0xcd
	.byte	0x9
	.long	0x66
	.byte	0x5c
	.uleb128 0x1
	.long	.LASF109
	.byte	0xf
	.byte	0xcf
	.byte	0x9
	.long	0x66
	.byte	0x60
	.uleb128 0x1
	.long	.LASF110
	.byte	0xf
	.byte	0xd0
	.byte	0x9
	.long	0x66
	.byte	0x64
	.uleb128 0x1
	.long	.LASF111
	.byte	0xf
	.byte	0xd2
	.byte	0x9
	.long	0x66
	.byte	0x68
	.uleb128 0x1
	.long	.LASF112
	.byte	0xf
	.byte	0xd4
	.byte	0x9
	.long	0x66
	.byte	0x6c
	.uleb128 0x1
	.long	.LASF113
	.byte	0xf
	.byte	0xd6
	.byte	0xb
	.long	0xa4
	.byte	0x70
	.byte	0
	.uleb128 0x6
	.long	0x3d8
	.uleb128 0x4
	.long	.LASF114
	.byte	0xf
	.byte	0xd7
	.byte	0x3
	.long	0x47a
	.uleb128 0x11
	.byte	0xd0
	.byte	0xf
	.byte	0xe3
	.long	0x60e
	.uleb128 0x1
	.long	.LASF115
	.byte	0xf
	.byte	0xe5
	.byte	0x9
	.long	0x66
	.byte	0
	.uleb128 0x1
	.long	.LASF116
	.byte	0xf
	.byte	0xe6
	.byte	0x9
	.long	0x66
	.byte	0x4
	.uleb128 0x1
	.long	.LASF117
	.byte	0xf
	.byte	0xe7
	.byte	0x1d
	.long	0x299
	.byte	0x8
	.uleb128 0x1
	.long	.LASF118
	.byte	0xf
	.byte	0xe8
	.byte	0x16
	.long	0x35a
	.byte	0x88
	.uleb128 0x1
	.long	.LASF119
	.byte	0xf
	.byte	0xe9
	.byte	0x9
	.long	0x66
	.byte	0x90
	.uleb128 0x1
	.long	.LASF120
	.byte	0xf
	.byte	0xea
	.byte	0x9
	.long	0x66
	.byte	0x94
	.uleb128 0x1
	.long	.LASF121
	.byte	0xf
	.byte	0xeb
	.byte	0x9
	.long	0x66
	.byte	0x98
	.uleb128 0x1
	.long	.LASF122
	.byte	0xf
	.byte	0xec
	.byte	0x9
	.long	0x66
	.byte	0x9c
	.uleb128 0x1
	.long	.LASF123
	.byte	0xf
	.byte	0xed
	.byte	0x9
	.long	0x66
	.byte	0xa0
	.uleb128 0x1
	.long	.LASF124
	.byte	0xf
	.byte	0xee
	.byte	0x15
	.long	0x23c
	.byte	0xa8
	.byte	0
	.uleb128 0x4
	.long	.LASF125
	.byte	0xf
	.byte	0xef
	.byte	0x3
	.long	0x583
	.uleb128 0x6
	.long	0x60e
	.uleb128 0x1c
	.long	.LASF126
	.byte	0xb
	.value	0x270
	.byte	0xd
	.long	0x632
	.uleb128 0x3
	.long	0x66
	.byte	0
	.uleb128 0x1d
	.long	.LASF130
	.byte	0x13
	.byte	0x28
	.byte	0x6
	.long	0x649
	.uleb128 0x3
	.long	0x649
	.uleb128 0x3
	.long	0x61a
	.byte	0
	.uleb128 0x6
	.long	0x577
	.uleb128 0xb
	.long	.LASF127
	.byte	0x10
	.byte	0x25
	.byte	0x5
	.long	0x66
	.long	0x669
	.uleb128 0x3
	.long	0xa4
	.uleb128 0x3
	.long	0x649
	.byte	0
	.uleb128 0xb
	.long	.LASF128
	.byte	0x11
	.byte	0x3d
	.byte	0xe
	.long	0x48
	.long	0x689
	.uleb128 0x3
	.long	0x48
	.uleb128 0x3
	.long	0x66
	.uleb128 0x3
	.long	0x3a
	.byte	0
	.uleb128 0xb
	.long	.LASF129
	.byte	0x12
	.byte	0x91
	.byte	0x10
	.long	0xc6
	.long	0x6ae
	.uleb128 0x3
	.long	0x66
	.uleb128 0x3
	.long	0x48
	.uleb128 0x3
	.long	0x2e
	.uleb128 0x3
	.long	0x66
	.byte	0
	.uleb128 0x1e
	.long	.LASF134
	.byte	0x14
	.byte	0x22
	.byte	0x10
	.long	0x74
	.uleb128 0x1f
	.long	.LASF131
	.byte	0x4
	.value	0x364
	.byte	0xd
	.long	0x6cd
	.uleb128 0x3
	.long	0xc1
	.byte	0
	.uleb128 0xb
	.long	.LASF132
	.byte	0x7
	.byte	0x66
	.byte	0xc
	.long	0x66
	.long	0x6f7
	.uleb128 0x3
	.long	0x66
	.uleb128 0x3
	.long	0x6fc
	.uleb128 0x3
	.long	0x6fc
	.uleb128 0x3
	.long	0x6fc
	.uleb128 0x3
	.long	0x706
	.byte	0
	.uleb128 0x6
	.long	0x13f
	.uleb128 0x12
	.long	0x6f7
	.uleb128 0x6
	.long	0xe5
	.uleb128 0x12
	.long	0x701
	.uleb128 0x13
	.long	.LASF133
	.byte	0xb
	.value	0x166
	.long	0x66
	.long	0x721
	.uleb128 0x3
	.long	0x66
	.byte	0
	.uleb128 0x20
	.long	.LASF135
	.byte	0xb
	.value	0x30a
	.byte	0x10
	.long	0x74
	.uleb128 0xb
	.long	.LASF136
	.byte	0x15
	.byte	0x6a
	.byte	0x10
	.long	0x74
	.long	0x74e
	.uleb128 0x3
	.long	0x74
	.uleb128 0x3
	.long	0x74e
	.uleb128 0x3
	.long	0x66
	.byte	0
	.uleb128 0x6
	.long	0x66
	.uleb128 0x13
	.long	.LASF137
	.byte	0x4
	.value	0x16b
	.long	0x66
	.long	0x76a
	.uleb128 0x3
	.long	0xc1
	.uleb128 0x21
	.byte	0
	.uleb128 0x22
	.long	.LASF148
	.byte	0x1
	.byte	0x33
	.byte	0x6
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x87b
	.uleb128 0x23
	.string	"sd"
	.byte	0x1
	.byte	0x33
	.byte	0x1e
	.long	0x61a
	.uleb128 0x4
	.byte	0x91
	.sleb128 -31064
	.uleb128 0x7
	.long	.LASF138
	.byte	0x35
	.byte	0x9
	.long	0x66
	.uleb128 0x4
	.byte	0x91
	.sleb128 -31036
	.uleb128 0x7
	.long	.LASF139
	.byte	0x36
	.byte	0xa
	.long	0x87b
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30752
	.uleb128 0x24
	.long	.LASF116
	.byte	0x1
	.byte	0x37
	.byte	0x9
	.long	0x66
	.uleb128 0x7
	.long	.LASF140
	.byte	0x38
	.byte	0x12
	.long	0x577
	.uleb128 0x4
	.byte	0x91
	.sleb128 -31008
	.uleb128 0x7
	.long	.LASF141
	.byte	0x3b
	.byte	0x9
	.long	0x66
	.uleb128 0x4
	.byte	0x91
	.sleb128 -31048
	.uleb128 0x7
	.long	.LASF142
	.byte	0x3c
	.byte	0x9
	.long	0x66
	.uleb128 0x4
	.byte	0x91
	.sleb128 -31044
	.uleb128 0x10
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x7
	.long	.LASF143
	.byte	0x43
	.byte	0x10
	.long	0x13f
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30880
	.uleb128 0x10
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x7
	.long	.LASF122
	.byte	0x49
	.byte	0x1c
	.long	0xe5
	.uleb128 0x4
	.byte	0x91
	.sleb128 -31024
	.uleb128 0x7
	.long	.LASF144
	.byte	0x4c
	.byte	0x11
	.long	0x66
	.uleb128 0x4
	.byte	0x91
	.sleb128 -31040
	.uleb128 0x10
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x14
	.string	"__i"
	.byte	0x47
	.byte	0xd
	.long	0x41
	.uleb128 0x4
	.byte	0x91
	.sleb128 -31052
	.uleb128 0x7
	.long	.LASF145
	.byte	0x47
	.byte	0xd
	.long	0x6f7
	.uleb128 0x4
	.byte	0x91
	.sleb128 -31032
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0xa9
	.long	0x88c
	.uleb128 0x25
	.long	0x3a
	.value	0x77ff
	.byte	0
	.uleb128 0x26
	.long	.LASF146
	.byte	0x1
	.byte	0x1a
	.byte	0x6
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x14
	.string	"pid"
	.byte	0x1b
	.byte	0xb
	.long	0xd9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
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
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 14
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3e
	.uleb128 0x21
	.sleb128 7
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 15
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 14
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 10
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.sleb128 12
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0
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
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x23
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
	.uleb128 0x24
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
	.uleb128 0x25
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
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
.LASF137:
	.string	"printf"
.LASF84:
	.string	"contentType_s"
.LASF94:
	.string	"contentType_t"
.LASF40:
	.string	"__size"
.LASF66:
	.string	"supported_http_protocols"
.LASF69:
	.string	"statusCode_s"
.LASF76:
	.string	"statusCode_t"
.LASF9:
	.string	"size_t"
.LASF27:
	.string	"__prev"
.LASF41:
	.string	"__align"
.LASF144:
	.string	"select_status"
.LASF133:
	.string	"close"
.LASF16:
	.string	"ssize_t"
.LASF147:
	.string	"GNU C17 14.2.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF105:
	.string	"status_code"
.LASF134:
	.string	"gettid"
.LASF139:
	.string	"recieved_buf"
.LASF24:
	.string	"long long unsigned int"
.LASF118:
	.string	"server_info"
.LASF28:
	.string	"__next"
.LASF117:
	.string	"client_info"
.LASF112:
	.string	"max_age"
.LASF43:
	.string	"socklen_t"
.LASF115:
	.string	"sockfd"
.LASF126:
	.string	"_exit"
.LASF17:
	.string	"long long int"
.LASF6:
	.string	"signed char"
.LASF98:
	.string	"uri_str"
.LASF95:
	.string	"req_header_s"
.LASF8:
	.string	"long int"
.LASF63:
	.string	"HTTP1_0"
.LASF64:
	.string	"HTTP1_1"
.LASF13:
	.string	"__ssize_t"
.LASF129:
	.string	"recv"
.LASF29:
	.string	"__pthread_list_t"
.LASF30:
	.string	"__pthread_mutex_s"
.LASF53:
	.string	"ai_flags"
.LASF141:
	.string	"client_socket"
.LASF90:
	.string	"IMAGE_GIF"
.LASF123:
	.string	"port"
.LASF83:
	.string	"method_t"
.LASF99:
	.string	"hostname_str"
.LASF3:
	.string	"unsigned int"
.LASF120:
	.string	"recvBytes"
.LASF89:
	.string	"IMAGE_PNG"
.LASF80:
	.string	"PATCH"
.LASF55:
	.string	"ai_socktype"
.LASF2:
	.string	"long unsigned int"
.LASF145:
	.string	"__arr"
.LASF39:
	.string	"__data"
.LASF85:
	.string	"TEXT_HTML"
.LASF136:
	.string	"waitpid"
.LASF103:
	.string	"method"
.LASF121:
	.string	"sentBytes"
.LASF119:
	.string	"addr_len"
.LASF72:
	.string	"NOT_FOUND"
.LASF127:
	.string	"parse_request_line_thread_safe"
.LASF37:
	.string	"__elision"
.LASF135:
	.string	"fork"
.LASF52:
	.string	"addrinfo"
.LASF81:
	.string	"HEAD"
.LASF74:
	.string	"VERSION_NOT_SUPPORTED"
.LASF92:
	.string	"IMAGE_X_ICON"
.LASF107:
	.string	"connection_keep_alive"
.LASF79:
	.string	"DELETE"
.LASF23:
	.string	"fd_set"
.LASF138:
	.string	"numbytes"
.LASF25:
	.string	"timeval"
.LASF22:
	.string	"fds_bits"
.LASF78:
	.string	"POST"
.LASF33:
	.string	"__owner"
.LASF110:
	.string	"current_state"
.LASF32:
	.string	"__count"
.LASF131:
	.string	"perror"
.LASF143:
	.string	"readfds"
.LASF114:
	.string	"HttpHeader_t"
.LASF19:
	.string	"tv_sec"
.LASF148:
	.string	"use_fork"
.LASF125:
	.string	"sockdetails_t"
.LASF65:
	.string	"ERROR_VERSION"
.LASF56:
	.string	"ai_protocol"
.LASF142:
	.string	"sever_socket"
.LASF106:
	.string	"status_code_str"
.LASF102:
	.string	"content_type_str"
.LASF48:
	.string	"sockaddr_storage"
.LASF93:
	.string	"total_content_types"
.LASF100:
	.string	"hostname_port_str"
.LASF111:
	.string	"open_file_fd"
.LASF132:
	.string	"select"
.LASF26:
	.string	"__pthread_internal_list"
.LASF57:
	.string	"ai_addrlen"
.LASF86:
	.string	"TEXT_CSS"
.LASF46:
	.string	"sa_family"
.LASF88:
	.string	"APPLICATION_JAVASCRIPT"
.LASF146:
	.string	"cleanup_zombie_processes"
.LASF130:
	.string	"build_and_send_header"
.LASF62:
	.string	"__int128 unsigned"
.LASF77:
	.string	"method_s"
.LASF4:
	.string	"unsigned char"
.LASF82:
	.string	"total_req_methods"
.LASF108:
	.string	"connection_close"
.LASF21:
	.string	"__fd_mask"
.LASF58:
	.string	"ai_addr"
.LASF7:
	.string	"short int"
.LASF68:
	.string	"httpType_s"
.LASF67:
	.string	"httpType_t"
.LASF91:
	.string	"IMAGE_JPG"
.LASF60:
	.string	"ai_next"
.LASF87:
	.string	"TEXT_PLAIN"
.LASF116:
	.string	"client_sock_fd"
.LASF12:
	.string	"__suseconds_t"
.LASF20:
	.string	"tv_usec"
.LASF31:
	.string	"__lock"
.LASF124:
	.string	"lock"
.LASF14:
	.string	"char"
.LASF49:
	.string	"ss_family"
.LASF15:
	.string	"__socklen_t"
.LASF97:
	.string	"http_version_str"
.LASF113:
	.string	"extra_header"
.LASF45:
	.string	"sockaddr"
.LASF73:
	.string	"METHOD_NOT_ALLOWED"
.LASF54:
	.string	"ai_family"
.LASF61:
	.string	"__int128"
.LASF5:
	.string	"short unsigned int"
.LASF42:
	.string	"pthread_mutex_t"
.LASF36:
	.string	"__spins"
.LASF96:
	.string	"http_version"
.LASF11:
	.string	"__time_t"
.LASF44:
	.string	"sa_family_t"
.LASF128:
	.string	"memset"
.LASF51:
	.string	"__ss_align"
.LASF34:
	.string	"__nusers"
.LASF71:
	.string	"FORBIDDEN"
.LASF50:
	.string	"__ss_padding"
.LASF101:
	.string	"content_type"
.LASF18:
	.string	"pid_t"
.LASF47:
	.string	"sa_data"
.LASF38:
	.string	"__list"
.LASF59:
	.string	"ai_canonname"
.LASF104:
	.string	"method_str"
.LASF35:
	.string	"__kind"
.LASF75:
	.string	"total_status_codes"
.LASF122:
	.string	"timeout"
.LASF70:
	.string	"BAD_REQ"
.LASF140:
	.string	"header"
.LASF10:
	.string	"__pid_t"
.LASF109:
	.string	"parser_error"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/parth/Work/All_data/university/Network System/Assignments/PA3"
.LASF0:
	.string	"src/fork.c"
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
