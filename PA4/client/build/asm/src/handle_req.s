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
	.globl	handle_req
	.type	handle_req, @function
handle_req:
.LFB321:
	.loc 1 47 1
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
	.loc 1 47 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.LBB2:
	.loc 1 54 9
	leaq	-30864(%rbp), %rax
	movq	%rax, -30888(%rbp)
	movl	$0, -30892(%rbp)
	jmp	.L5
.L6:
	.loc 1 54 9 is_stmt 0 discriminator 3
	movq	-30888(%rbp), %rax
	movl	-30892(%rbp), %edx
	movq	$0, (%rax,%rdx,8)
	addl	$1, -30892(%rbp)
.L5:
	.loc 1 54 9 discriminator 1
	cmpl	$15, -30892(%rbp)
	jbe	.L6
.LBE2:
	.loc 1 58 24 is_stmt 1
	movq	$10, -30880(%rbp)
	movq	$0, -30872(%rbp)
	.loc 1 147 12
	movl	$0, %eax
	.loc 1 148 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L8
	call	__stack_chk_fail@PLT
.L8:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE321:
	.size	handle_req, .-handle_req
.Letext0:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h"
	.file 4 "/usr/include/x86_64-linux-gnu/sys/select.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h"
	.file 9 "/usr/include/unistd.h"
	.file 10 "/usr/include/x86_64-linux-gnu/bits/sockaddr.h"
	.file 11 "/usr/include/x86_64-linux-gnu/bits/socket.h"
	.file 12 "/usr/include/netinet/in.h"
	.file 13 "/usr/include/netdb.h"
	.file 14 "./common.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x644
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x10
	.long	.LASF100
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x11
	.byte	0x8
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x2
	.byte	0x26
	.byte	0x17
	.long	0x3e
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x2
	.long	.LASF9
	.byte	0x2
	.byte	0x28
	.byte	0x1c
	.long	0x45
	.uleb128 0x12
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.long	.LASF10
	.byte	0x2
	.byte	0x2a
	.byte	0x16
	.long	0x35
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF11
	.uleb128 0x2
	.long	.LASF12
	.byte	0x2
	.byte	0xa0
	.byte	0x1a
	.long	0x85
	.uleb128 0x2
	.long	.LASF13
	.byte	0x2
	.byte	0xa2
	.byte	0x1f
	.long	0x85
	.uleb128 0x5
	.long	0xa9
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF14
	.uleb128 0x2
	.long	.LASF15
	.byte	0x2
	.byte	0xd2
	.byte	0x17
	.long	0x35
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF16
	.uleb128 0x6
	.long	.LASF23
	.byte	0x10
	.byte	0x3
	.byte	0x8
	.byte	0x8
	.long	0xeb
	.uleb128 0x1
	.long	.LASF17
	.byte	0x3
	.byte	0xe
	.byte	0xc
	.long	0x8c
	.byte	0
	.uleb128 0x1
	.long	.LASF18
	.byte	0x3
	.byte	0xf
	.byte	0x11
	.long	0x98
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.long	.LASF19
	.byte	0x4
	.byte	0x31
	.byte	0x12
	.long	0x85
	.uleb128 0xb
	.byte	0x80
	.byte	0x4
	.byte	0x3b
	.long	0x10d
	.uleb128 0x1
	.long	.LASF20
	.byte	0x4
	.byte	0x40
	.byte	0xf
	.long	0x10d
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0xeb
	.long	0x11d
	.uleb128 0x8
	.long	0x2e
	.byte	0xf
	.byte	0
	.uleb128 0x2
	.long	.LASF21
	.byte	0x4
	.byte	0x46
	.byte	0x5
	.long	0xf7
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF22
	.uleb128 0x6
	.long	.LASF24
	.byte	0x10
	.byte	0x5
	.byte	0x33
	.byte	0x10
	.long	0x158
	.uleb128 0x1
	.long	.LASF25
	.byte	0x5
	.byte	0x35
	.byte	0x23
	.long	0x158
	.byte	0
	.uleb128 0x1
	.long	.LASF26
	.byte	0x5
	.byte	0x36
	.byte	0x23
	.long	0x158
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.long	0x130
	.uleb128 0x2
	.long	.LASF27
	.byte	0x5
	.byte	0x37
	.byte	0x3
	.long	0x130
	.uleb128 0x6
	.long	.LASF28
	.byte	0x28
	.byte	0x6
	.byte	0x16
	.byte	0x8
	.long	0x1df
	.uleb128 0x1
	.long	.LASF29
	.byte	0x6
	.byte	0x18
	.byte	0x7
	.long	0x72
	.byte	0
	.uleb128 0x1
	.long	.LASF30
	.byte	0x6
	.byte	0x19
	.byte	0x10
	.long	0x35
	.byte	0x4
	.uleb128 0x1
	.long	.LASF31
	.byte	0x6
	.byte	0x1a
	.byte	0x7
	.long	0x72
	.byte	0x8
	.uleb128 0x1
	.long	.LASF32
	.byte	0x6
	.byte	0x1c
	.byte	0x10
	.long	0x35
	.byte	0xc
	.uleb128 0x1
	.long	.LASF33
	.byte	0x6
	.byte	0x20
	.byte	0x7
	.long	0x72
	.byte	0x10
	.uleb128 0x1
	.long	.LASF34
	.byte	0x6
	.byte	0x22
	.byte	0x9
	.long	0x5f
	.byte	0x14
	.uleb128 0x1
	.long	.LASF35
	.byte	0x6
	.byte	0x23
	.byte	0x9
	.long	0x5f
	.byte	0x16
	.uleb128 0x1
	.long	.LASF36
	.byte	0x6
	.byte	0x24
	.byte	0x14
	.long	0x15d
	.byte	0x18
	.byte	0
	.uleb128 0xc
	.byte	0x28
	.byte	0x7
	.byte	0x43
	.byte	0x9
	.long	0x20d
	.uleb128 0x9
	.long	.LASF37
	.byte	0x7
	.byte	0x45
	.byte	0x1c
	.long	0x169
	.uleb128 0x9
	.long	.LASF38
	.byte	0x7
	.byte	0x46
	.byte	0x8
	.long	0x20d
	.uleb128 0x9
	.long	.LASF39
	.byte	0x7
	.byte	0x47
	.byte	0xc
	.long	0x85
	.byte	0
	.uleb128 0x7
	.long	0xa9
	.long	0x21d
	.uleb128 0x8
	.long	0x2e
	.byte	0x27
	.byte	0
	.uleb128 0x2
	.long	.LASF40
	.byte	0x7
	.byte	0x48
	.byte	0x3
	.long	0x1df
	.uleb128 0x2
	.long	.LASF41
	.byte	0x8
	.byte	0x18
	.byte	0x13
	.long	0x53
	.uleb128 0x2
	.long	.LASF42
	.byte	0x8
	.byte	0x19
	.byte	0x14
	.long	0x66
	.uleb128 0x2
	.long	.LASF43
	.byte	0x8
	.byte	0x1a
	.byte	0x14
	.long	0x79
	.uleb128 0x13
	.long	.LASF44
	.byte	0x9
	.value	0x112
	.byte	0x15
	.long	0xb0
	.uleb128 0x2
	.long	.LASF45
	.byte	0xa
	.byte	0x1c
	.byte	0x1c
	.long	0x45
	.uleb128 0x6
	.long	.LASF46
	.byte	0x10
	.byte	0xb
	.byte	0xb8
	.byte	0x27
	.long	0x28e
	.uleb128 0x1
	.long	.LASF47
	.byte	0xb
	.byte	0xba
	.byte	0x5
	.long	0x25a
	.byte	0
	.uleb128 0x1
	.long	.LASF48
	.byte	0xb
	.byte	0xbb
	.byte	0xa
	.long	0x28e
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	0xa9
	.long	0x29e
	.uleb128 0x8
	.long	0x2e
	.byte	0xd
	.byte	0
	.uleb128 0x5
	.long	0x266
	.uleb128 0x6
	.long	.LASF49
	.byte	0x10
	.byte	0xc
	.byte	0xf7
	.byte	0x27
	.long	0x2e5
	.uleb128 0x1
	.long	.LASF50
	.byte	0xc
	.byte	0xf9
	.byte	0x5
	.long	0x25a
	.byte	0
	.uleb128 0x1
	.long	.LASF51
	.byte	0xc
	.byte	0xfa
	.byte	0xf
	.long	0x361
	.byte	0x2
	.uleb128 0x1
	.long	.LASF52
	.byte	0xc
	.byte	0xfb
	.byte	0x14
	.long	0x346
	.byte	0x4
	.uleb128 0x1
	.long	.LASF53
	.byte	0xc
	.byte	0xfe
	.byte	0x13
	.long	0x3e6
	.byte	0x8
	.byte	0
	.uleb128 0xd
	.long	.LASF54
	.byte	0x1c
	.byte	0xc
	.value	0x108
	.byte	0x27
	.long	0x33a
	.uleb128 0x4
	.long	.LASF55
	.byte	0xc
	.value	0x10a
	.byte	0x5
	.long	0x25a
	.byte	0
	.uleb128 0x4
	.long	.LASF56
	.byte	0xc
	.value	0x10b
	.byte	0xf
	.long	0x361
	.byte	0x2
	.uleb128 0x4
	.long	.LASF57
	.byte	0xc
	.value	0x10c
	.byte	0xe
	.long	0x241
	.byte	0x4
	.uleb128 0x4
	.long	.LASF58
	.byte	0xc
	.value	0x10d
	.byte	0x15
	.long	0x3cb
	.byte	0x8
	.uleb128 0x4
	.long	.LASF59
	.byte	0xc
	.value	0x10e
	.byte	0xe
	.long	0x241
	.byte	0x18
	.byte	0
	.uleb128 0x2
	.long	.LASF60
	.byte	0xc
	.byte	0x1e
	.byte	0x12
	.long	0x241
	.uleb128 0x6
	.long	.LASF61
	.byte	0x4
	.byte	0xc
	.byte	0x1f
	.byte	0x8
	.long	0x361
	.uleb128 0x1
	.long	.LASF62
	.byte	0xc
	.byte	0x21
	.byte	0xf
	.long	0x33a
	.byte	0
	.byte	0
	.uleb128 0x2
	.long	.LASF63
	.byte	0xc
	.byte	0x7d
	.byte	0x12
	.long	0x235
	.uleb128 0xc
	.byte	0x10
	.byte	0xc
	.byte	0xdf
	.byte	0x5
	.long	0x39b
	.uleb128 0x9
	.long	.LASF64
	.byte	0xc
	.byte	0xe1
	.byte	0xa
	.long	0x39b
	.uleb128 0x9
	.long	.LASF65
	.byte	0xc
	.byte	0xe2
	.byte	0xb
	.long	0x3ab
	.uleb128 0x9
	.long	.LASF66
	.byte	0xc
	.byte	0xe3
	.byte	0xb
	.long	0x3bb
	.byte	0
	.uleb128 0x7
	.long	0x229
	.long	0x3ab
	.uleb128 0x8
	.long	0x2e
	.byte	0xf
	.byte	0
	.uleb128 0x7
	.long	0x235
	.long	0x3bb
	.uleb128 0x8
	.long	0x2e
	.byte	0x7
	.byte	0
	.uleb128 0x7
	.long	0x241
	.long	0x3cb
	.uleb128 0x8
	.long	0x2e
	.byte	0x3
	.byte	0
	.uleb128 0x6
	.long	.LASF67
	.byte	0x10
	.byte	0xc
	.byte	0xdd
	.byte	0x8
	.long	0x3e6
	.uleb128 0x1
	.long	.LASF68
	.byte	0xc
	.byte	0xe4
	.byte	0x9
	.long	0x36d
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x3e
	.long	0x3f6
	.uleb128 0x8
	.long	0x2e
	.byte	0x7
	.byte	0
	.uleb128 0xd
	.long	.LASF69
	.byte	0x30
	.byte	0xd
	.value	0x235
	.byte	0x8
	.long	0x475
	.uleb128 0x4
	.long	.LASF70
	.byte	0xd
	.value	0x237
	.byte	0x7
	.long	0x72
	.byte	0
	.uleb128 0x4
	.long	.LASF71
	.byte	0xd
	.value	0x238
	.byte	0x7
	.long	0x72
	.byte	0x4
	.uleb128 0x4
	.long	.LASF72
	.byte	0xd
	.value	0x239
	.byte	0x7
	.long	0x72
	.byte	0x8
	.uleb128 0x4
	.long	.LASF73
	.byte	0xd
	.value	0x23a
	.byte	0x7
	.long	0x72
	.byte	0xc
	.uleb128 0x4
	.long	.LASF74
	.byte	0xd
	.value	0x23b
	.byte	0xd
	.long	0x24d
	.byte	0x10
	.uleb128 0x4
	.long	.LASF75
	.byte	0xd
	.value	0x23c
	.byte	0x14
	.long	0x29e
	.byte	0x18
	.uleb128 0x4
	.long	.LASF76
	.byte	0xd
	.value	0x23d
	.byte	0x9
	.long	0xa4
	.byte	0x20
	.uleb128 0x4
	.long	.LASF77
	.byte	0xd
	.value	0x23e
	.byte	0x14
	.long	0x475
	.byte	0x28
	.byte	0
	.uleb128 0x5
	.long	0x3f6
	.uleb128 0x3
	.byte	0x10
	.byte	0x5
	.long	.LASF78
	.uleb128 0x3
	.byte	0x10
	.byte	0x7
	.long	.LASF79
	.uleb128 0x3
	.byte	0x10
	.byte	0x4
	.long	.LASF80
	.uleb128 0x6
	.long	.LASF81
	.byte	0x28
	.byte	0xe
	.byte	0xa2
	.byte	0x10
	.long	0x4de
	.uleb128 0x1
	.long	.LASF82
	.byte	0xe
	.byte	0xa3
	.byte	0x9
	.long	0x72
	.byte	0
	.uleb128 0x1
	.long	.LASF83
	.byte	0xe
	.byte	0xa4
	.byte	0xb
	.long	0xa4
	.byte	0x8
	.uleb128 0x1
	.long	.LASF84
	.byte	0xe
	.byte	0xa5
	.byte	0xb
	.long	0xa4
	.byte	0x10
	.uleb128 0x1
	.long	.LASF85
	.byte	0xe
	.byte	0xa6
	.byte	0x9
	.long	0x72
	.byte	0x18
	.uleb128 0x1
	.long	.LASF86
	.byte	0xe
	.byte	0xa7
	.byte	0x1d
	.long	0x4de
	.byte	0x20
	.byte	0
	.uleb128 0x5
	.long	0x48f
	.uleb128 0x2
	.long	.LASF87
	.byte	0xe
	.byte	0xa8
	.byte	0x2
	.long	0x48f
	.uleb128 0xb
	.byte	0x50
	.byte	0xe
	.byte	0xb1
	.long	0x546
	.uleb128 0x1
	.long	.LASF88
	.byte	0xe
	.byte	0xb3
	.byte	0x9
	.long	0x72
	.byte	0
	.uleb128 0x1
	.long	.LASF89
	.byte	0xe
	.byte	0xb6
	.byte	0x16
	.long	0x546
	.byte	0x8
	.uleb128 0x1
	.long	.LASF90
	.byte	0xe
	.byte	0xb7
	.byte	0x9
	.long	0x72
	.byte	0x10
	.uleb128 0x1
	.long	.LASF91
	.byte	0xe
	.byte	0xb8
	.byte	0x16
	.long	0x475
	.byte	0x18
	.uleb128 0x1
	.long	.LASF92
	.byte	0xe
	.byte	0xb9
	.byte	0x9
	.long	0x72
	.byte	0x20
	.uleb128 0x1
	.long	.LASF93
	.byte	0xe
	.byte	0xba
	.byte	0x15
	.long	0x21d
	.byte	0x28
	.byte	0
	.uleb128 0x5
	.long	0x4e3
	.uleb128 0x2
	.long	.LASF94
	.byte	0xe
	.byte	0xbc
	.byte	0x3
	.long	0x4ef
	.uleb128 0x14
	.long	.LASF101
	.byte	0x1
	.byte	0x2e
	.byte	0x7
	.long	0x3c
	.quad	.LFB321
	.quad	.LFE321-.LFB321
	.uleb128 0x1
	.byte	0x9c
	.long	0x600
	.uleb128 0xe
	.string	"sd"
	.byte	0x2e
	.byte	0x21
	.long	0x600
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30920
	.uleb128 0xf
	.long	.LASF97
	.byte	0x30
	.long	0x72
	.uleb128 0xa
	.long	.LASF95
	.byte	0x31
	.byte	0xa
	.long	0x605
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30752
	.uleb128 0xa
	.long	.LASF96
	.byte	0x32
	.byte	0xc
	.long	0x11d
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30880
	.uleb128 0xf
	.long	.LASF98
	.byte	0x33
	.long	0x72
	.uleb128 0xa
	.long	.LASF92
	.byte	0x3a
	.byte	0x18
	.long	0xc3
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30896
	.uleb128 0x15
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x16
	.string	"__i"
	.byte	0x1
	.byte	0x36
	.byte	0x9
	.long	0x35
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30908
	.uleb128 0xa
	.long	.LASF99
	.byte	0x36
	.byte	0x9
	.long	0x616
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30904
	.byte	0
	.byte	0
	.uleb128 0x5
	.long	0x54b
	.uleb128 0x7
	.long	0xa9
	.long	0x616
	.uleb128 0x17
	.long	0x2e
	.value	0x77ff
	.byte	0
	.uleb128 0x5
	.long	0x11d
	.uleb128 0x18
	.long	.LASF102
	.byte	0x1
	.byte	0x13
	.byte	0x7
	.long	0x3c
	.quad	.LFB320
	.quad	.LFE320-.LFB320
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xe
	.string	"sa"
	.byte	0x13
	.byte	0x24
	.long	0x29e
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
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0xc
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
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x15
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x18
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
.LASF15:
	.string	"__socklen_t"
.LASF37:
	.string	"__data"
.LASF85:
	.string	"dfsno"
.LASF74:
	.string	"ai_addrlen"
.LASF7:
	.string	"short int"
.LASF100:
	.string	"GNU C17 14.2.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF24:
	.string	"__pthread_internal_list"
.LASF16:
	.string	"long long int"
.LASF10:
	.string	"__uint32_t"
.LASF40:
	.string	"pthread_mutex_t"
.LASF58:
	.string	"sin6_addr"
.LASF9:
	.string	"__uint16_t"
.LASF34:
	.string	"__spins"
.LASF26:
	.string	"__next"
.LASF39:
	.string	"__align"
.LASF69:
	.string	"addrinfo"
.LASF83:
	.string	"client_port"
.LASF41:
	.string	"uint8_t"
.LASF91:
	.string	"server_info"
.LASF30:
	.string	"__count"
.LASF25:
	.string	"__prev"
.LASF59:
	.string	"sin6_scope_id"
.LASF50:
	.string	"sin_family"
.LASF45:
	.string	"sa_family_t"
.LASF56:
	.string	"sin6_port"
.LASF19:
	.string	"__fd_mask"
.LASF68:
	.string	"__in6_u"
.LASF98:
	.string	"file_fd"
.LASF72:
	.string	"ai_socktype"
.LASF33:
	.string	"__kind"
.LASF79:
	.string	"__int128 unsigned"
.LASF65:
	.string	"__u6_addr16"
.LASF67:
	.string	"in6_addr"
.LASF88:
	.string	"sockfd"
.LASF11:
	.string	"long int"
.LASF95:
	.string	"recieved_buf"
.LASF8:
	.string	"__uint8_t"
.LASF94:
	.string	"sockdetails_t"
.LASF97:
	.string	"numbytes"
.LASF52:
	.string	"sin_addr"
.LASF96:
	.string	"readfds"
.LASF71:
	.string	"ai_family"
.LASF80:
	.string	"long double"
.LASF17:
	.string	"tv_sec"
.LASF4:
	.string	"unsigned char"
.LASF44:
	.string	"socklen_t"
.LASF6:
	.string	"signed char"
.LASF53:
	.string	"sin_zero"
.LASF22:
	.string	"long long unsigned int"
.LASF54:
	.string	"sockaddr_in6"
.LASF43:
	.string	"uint32_t"
.LASF77:
	.string	"ai_next"
.LASF42:
	.string	"uint16_t"
.LASF62:
	.string	"s_addr"
.LASF101:
	.string	"handle_req"
.LASF55:
	.string	"sin6_family"
.LASF48:
	.string	"sa_data"
.LASF38:
	.string	"__size"
.LASF5:
	.string	"short unsigned int"
.LASF57:
	.string	"sin6_flowinfo"
.LASF81:
	.string	"clientdetails_s"
.LASF87:
	.string	"clientdetails_t"
.LASF14:
	.string	"char"
.LASF32:
	.string	"__nusers"
.LASF99:
	.string	"__arr"
.LASF93:
	.string	"lock"
.LASF84:
	.string	"client_ip"
.LASF20:
	.string	"fds_bits"
.LASF60:
	.string	"in_addr_t"
.LASF64:
	.string	"__u6_addr8"
.LASF78:
	.string	"__int128"
.LASF28:
	.string	"__pthread_mutex_s"
.LASF2:
	.string	"long unsigned int"
.LASF61:
	.string	"in_addr"
.LASF12:
	.string	"__time_t"
.LASF35:
	.string	"__elision"
.LASF76:
	.string	"ai_canonname"
.LASF23:
	.string	"timeval"
.LASF51:
	.string	"sin_port"
.LASF27:
	.string	"__pthread_list_t"
.LASF70:
	.string	"ai_flags"
.LASF18:
	.string	"tv_usec"
.LASF102:
	.string	"get_in_addr"
.LASF89:
	.string	"client_details"
.LASF63:
	.string	"in_port_t"
.LASF47:
	.string	"sa_family"
.LASF31:
	.string	"__owner"
.LASF66:
	.string	"__u6_addr32"
.LASF36:
	.string	"__list"
.LASF82:
	.string	"client_sock_fd"
.LASF46:
	.string	"sockaddr"
.LASF13:
	.string	"__suseconds_t"
.LASF21:
	.string	"fd_set"
.LASF3:
	.string	"unsigned int"
.LASF75:
	.string	"ai_addr"
.LASF90:
	.string	"number_of_clients"
.LASF49:
	.string	"sockaddr_in"
.LASF92:
	.string	"timeout"
.LASF86:
	.string	"next"
.LASF29:
	.string	"__lock"
.LASF73:
	.string	"ai_protocol"
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
