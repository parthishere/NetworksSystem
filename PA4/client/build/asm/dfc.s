	.file	"dfc.c"
	.text
.Ltext0:
	.file 0 "/home/parth/Work/All_data/university/Network System/Assignments/PA4/client" "dfc.c"
	.section	.rodata
.LC0:
	.string	"%02x"
	.text
	.globl	str2md5
	.type	str2md5, @function
str2md5:
.LFB320:
	.file 1 "dfc.c"
	.loc 1 4 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -72(%rbp)
	movl	%esi, -76(%rbp)
	.loc 1 4 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 6 27
	call	EVP_MD_CTX_new@PLT
	movq	%rax, -56(%rbp)
	.loc 1 7 24
	call	EVP_md5@PLT
	movq	%rax, -48(%rbp)
	.loc 1 8 5
	movq	-48(%rbp), %rcx
	movq	-56(%rbp), %rax
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	EVP_DigestInit_ex@PLT
	.loc 1 10 25
	movl	$33, %edi
	call	malloc@PLT
	movq	%rax, -40(%rbp)
	.loc 1 13 11
	jmp	.L2
.L5:
	.loc 1 15 12
	cmpl	$512, -76(%rbp)
	jle	.L3
	.loc 1 17 13
	movq	-72(%rbp), %rcx
	movq	-56(%rbp), %rax
	movl	$512, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	EVP_DigestUpdate@PLT
	jmp	.L4
.L3:
	.loc 1 21 13
	movl	-76(%rbp), %eax
	movslq	%eax, %rdx
	movq	-72(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	EVP_DigestUpdate@PLT
.L4:
	.loc 1 23 16
	subl	$512, -76(%rbp)
	.loc 1 24 13
	addq	$512, -72(%rbp)
.L2:
	.loc 1 13 19
	cmpl	$0, -76(%rbp)
	jg	.L5
	.loc 1 26 5
	leaq	-64(%rbp), %rdx
	leaq	-32(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	EVP_DigestFinal_ex@PLT
	.loc 1 27 5
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	EVP_MD_CTX_free@PLT
.LBB2:
	.loc 1 29 14
	movl	$0, -60(%rbp)
	.loc 1 29 5
	jmp	.L6
.L7:
	.loc 1 31 69
	movl	-60(%rbp), %eax
	cltq
	movzbl	-32(%rbp,%rax), %eax
	.loc 1 31 9
	movzbl	%al, %eax
	.loc 1 31 26
	movl	-60(%rbp), %edx
	addl	%edx, %edx
	movslq	%edx, %rcx
	.loc 1 31 9
	movq	-40(%rbp), %rdx
	leaq	(%rcx,%rdx), %rdi
	movl	%eax, %ecx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdx
	movl	$32, %esi
	movl	$0, %eax
	call	snprintf@PLT
	.loc 1 29 33 discriminator 3
	addl	$1, -60(%rbp)
.L6:
	.loc 1 29 23 discriminator 1
	movl	-64(%rbp), %eax
	cmpl	%eax, -60(%rbp)
	jl	.L7
.LBE2:
	.loc 1 33 12
	movq	-40(%rbp), %rax
	.loc 1 34 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE320:
	.size	str2md5, .-str2md5
	.section	.rodata
.LC1:
	.string	"r"
.LC2:
	.string	"./dfc.conf"
.LC3:
	.string	"server dfs%d %s:%d"
.LC4:
	.string	"> Server dfs%d %s:%d\n"
	.text
	.globl	read_server_conf
	.type	read_server_conf, @function
read_server_conf:
.LFB321:
	.loc 1 187 28
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$288, %rsp
	.loc 1 187 28
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 188 16
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -280(%rbp)
	.loc 1 193 9
	movl	$0, -284(%rbp)
	.loc 1 194 10
	jmp	.L11
.L12:
	.loc 1 196 9
	movl	-284(%rbp), %eax
	cltq
	movl	-224(%rbp,%rax,4), %esi
	.loc 1 196 71
	leaq	-176(%rbp), %rcx
	movl	-284(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rax, %rcx
	.loc 1 196 9
	leaq	-272(%rbp), %rax
	movl	-284(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	leaq	-64(%rbp), %rax
	movl	%esi, %r8d
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc23_sscanf@PLT
	.loc 1 197 9
	movl	-284(%rbp), %eax
	cltq
	movl	-224(%rbp,%rax,4), %ecx
	.loc 1 197 68
	leaq	-176(%rbp), %rsi
	movl	-284(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	leaq	(%rsi,%rax), %rdx
	.loc 1 197 9
	movl	-284(%rbp), %eax
	cltq
	movl	-272(%rbp,%rax,4), %eax
	movl	%eax, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 198 10
	addl	$1, -284(%rbp)
.L11:
	.loc 1 194 11
	movq	-280(%rbp), %rdx
	leaq	-64(%rbp), %rax
	movl	$49, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	.loc 1 194 43 discriminator 1
	testq	%rax, %rax
	jne	.L12
	.loc 1 200 5
	movq	-280(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	.loc 1 201 1
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE321:
	.size	read_server_conf, .-read_server_conf
	.section	.rodata
	.align 8
.LC5:
	.string	"\033[31m[-] You messed up, command is ./dfc <COMMAND> <FILENAME>\n\033[0m"
	.text
	.globl	main
	.type	main, @function
main:
.LFB322:
	.loc 1 219 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$240, %rsp
	movl	%edi, -228(%rbp)
	movq	%rsi, -240(%rbp)
	.loc 1 219 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 221 5
	leaq	-224(%rbp), %rax
	addq	$168, %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_mutex_init@PLT
	.loc 1 234 8
	cmpl	$3, -228(%rbp)
	je	.L15
	.loc 1 236 9
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 239 9
	movl	$1, %edi
	call	exit@PLT
.L15:
	.loc 1 242 5
	call	read_server_conf
	.loc 1 317 12
	movl	$0, %eax
	.loc 1 318 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE322:
	.size	main, .-main
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/14/include/stddef.h"
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
	.file 13 "/usr/include/openssl/types.h"
	.file 14 "common.h"
	.file 15 "/usr/include/stdlib.h"
	.file 16 "/usr/include/pthread.h"
	.file 17 "/usr/include/stdio.h"
	.file 18 "/usr/include/openssl/evp.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x943
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x15
	.long	.LASF131
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
	.byte	0x98
	.byte	0x19
	.long	0x6d
	.uleb128 0x4
	.long	.LASF11
	.byte	0x3
	.byte	0x99
	.byte	0x1b
	.long	0x6d
	.uleb128 0x3
	.long	0x96
	.uleb128 0xf
	.long	0x8c
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.long	.LASF12
	.uleb128 0x10
	.long	0x96
	.uleb128 0x4
	.long	.LASF13
	.byte	0x3
	.byte	0xd2
	.byte	0x17
	.long	0x41
	.uleb128 0x7
	.long	0x96
	.long	0xbe
	.uleb128 0x6
	.long	0x3a
	.byte	0x3
	.byte	0
	.uleb128 0xd
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
	.byte	0x15
	.long	0x291
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
	.long	0x296
	.byte	0xc4
	.byte	0
	.uleb128 0x4
	.long	.LASF43
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0xbe
	.uleb128 0x18
	.long	.LASF132
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0xb
	.long	.LASF44
	.uleb128 0x3
	.long	0x259
	.uleb128 0x3
	.long	0xbe
	.uleb128 0x7
	.long	0x96
	.long	0x278
	.uleb128 0x6
	.long	0x3a
	.byte	0
	.byte	0
	.uleb128 0x3
	.long	0x251
	.uleb128 0xb
	.long	.LASF45
	.uleb128 0x3
	.long	0x27d
	.uleb128 0xb
	.long	.LASF46
	.uleb128 0x3
	.long	0x287
	.uleb128 0x3
	.long	0x263
	.uleb128 0x7
	.long	0x96
	.long	0x2a6
	.uleb128 0x6
	.long	0x3a
	.byte	0x13
	.byte	0
	.uleb128 0x3
	.long	0x9d
	.uleb128 0xf
	.long	0x2a6
	.uleb128 0x3
	.long	0x245
	.uleb128 0xf
	.long	0x2b0
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.long	.LASF47
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.long	.LASF48
	.uleb128 0xd
	.long	.LASF50
	.byte	0x10
	.byte	0x6
	.byte	0x33
	.byte	0x10
	.long	0x2f0
	.uleb128 0x1
	.long	.LASF51
	.byte	0x6
	.byte	0x35
	.byte	0x23
	.long	0x2f0
	.byte	0
	.uleb128 0x1
	.long	.LASF52
	.byte	0x6
	.byte	0x36
	.byte	0x23
	.long	0x2f0
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	0x2c8
	.uleb128 0x4
	.long	.LASF53
	.byte	0x6
	.byte	0x37
	.byte	0x3
	.long	0x2c8
	.uleb128 0xd
	.long	.LASF54
	.byte	0x28
	.byte	0x7
	.byte	0x16
	.byte	0x8
	.long	0x377
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
	.long	0x2f5
	.byte	0x18
	.byte	0
	.uleb128 0x13
	.byte	0x4
	.byte	0x20
	.long	0x395
	.uleb128 0xe
	.long	.LASF63
	.byte	0x22
	.byte	0x8
	.long	0xae
	.uleb128 0xe
	.long	.LASF64
	.byte	0x23
	.byte	0x7
	.long	0x66
	.byte	0
	.uleb128 0x4
	.long	.LASF65
	.byte	0x8
	.byte	0x24
	.byte	0x3
	.long	0x377
	.uleb128 0x10
	.long	0x395
	.uleb128 0x13
	.byte	0x28
	.byte	0x43
	.long	0x3cf
	.uleb128 0xe
	.long	.LASF66
	.byte	0x45
	.byte	0x1c
	.long	0x301
	.uleb128 0xe
	.long	.LASF63
	.byte	0x46
	.byte	0x8
	.long	0x3cf
	.uleb128 0xe
	.long	.LASF64
	.byte	0x47
	.byte	0xc
	.long	0x6d
	.byte	0
	.uleb128 0x7
	.long	0x96
	.long	0x3df
	.uleb128 0x6
	.long	0x3a
	.byte	0x27
	.byte	0
	.uleb128 0x4
	.long	.LASF67
	.byte	0x8
	.byte	0x48
	.byte	0x3
	.long	0x3a6
	.uleb128 0x3
	.long	0x3f0
	.uleb128 0x19
	.uleb128 0x1a
	.long	.LASF68
	.byte	0x9
	.value	0x112
	.byte	0x15
	.long	0xa2
	.uleb128 0x3
	.long	0x8c
	.uleb128 0x4
	.long	.LASF69
	.byte	0xa
	.byte	0x1c
	.byte	0x1c
	.long	0x51
	.uleb128 0xd
	.long	.LASF70
	.byte	0x10
	.byte	0xb
	.byte	0xb8
	.byte	0x27
	.long	0x437
	.uleb128 0x1
	.long	.LASF71
	.byte	0xb
	.byte	0xba
	.byte	0x5
	.long	0x403
	.byte	0
	.uleb128 0x1
	.long	.LASF72
	.byte	0xb
	.byte	0xbb
	.byte	0xa
	.long	0x437
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	0x96
	.long	0x447
	.uleb128 0x6
	.long	0x3a
	.byte	0xd
	.byte	0
	.uleb128 0xd
	.long	.LASF73
	.byte	0x80
	.byte	0xb
	.byte	0xc5
	.byte	0x27
	.long	0x47c
	.uleb128 0x1
	.long	.LASF74
	.byte	0xb
	.byte	0xc7
	.byte	0x5
	.long	0x403
	.byte	0
	.uleb128 0x1
	.long	.LASF75
	.byte	0xb
	.byte	0xc8
	.byte	0xa
	.long	0x47c
	.byte	0x2
	.uleb128 0x1
	.long	.LASF76
	.byte	0xb
	.byte	0xc9
	.byte	0x14
	.long	0x3a
	.byte	0x78
	.byte	0
	.uleb128 0x7
	.long	0x96
	.long	0x48c
	.uleb128 0x6
	.long	0x3a
	.byte	0x75
	.byte	0
	.uleb128 0x3
	.long	0x40f
	.uleb128 0x1b
	.long	.LASF77
	.byte	0x30
	.byte	0xc
	.value	0x235
	.byte	0x8
	.long	0x508
	.uleb128 0x9
	.long	.LASF78
	.value	0x237
	.byte	0x7
	.long	0x66
	.byte	0
	.uleb128 0x9
	.long	.LASF79
	.value	0x238
	.byte	0x7
	.long	0x66
	.byte	0x4
	.uleb128 0x9
	.long	.LASF80
	.value	0x239
	.byte	0x7
	.long	0x66
	.byte	0x8
	.uleb128 0x9
	.long	.LASF81
	.value	0x23a
	.byte	0x7
	.long	0x66
	.byte	0xc
	.uleb128 0x9
	.long	.LASF82
	.value	0x23b
	.byte	0xd
	.long	0x3f1
	.byte	0x10
	.uleb128 0x9
	.long	.LASF83
	.value	0x23c
	.byte	0x14
	.long	0x48c
	.byte	0x18
	.uleb128 0x9
	.long	.LASF84
	.value	0x23d
	.byte	0x9
	.long	0x8c
	.byte	0x20
	.uleb128 0x9
	.long	.LASF85
	.value	0x23e
	.byte	0x14
	.long	0x508
	.byte	0x28
	.byte	0
	.uleb128 0x3
	.long	0x491
	.uleb128 0x5
	.byte	0x10
	.byte	0x5
	.long	.LASF86
	.uleb128 0x5
	.byte	0x10
	.byte	0x7
	.long	.LASF87
	.uleb128 0x5
	.byte	0x10
	.byte	0x4
	.long	.LASF88
	.uleb128 0x4
	.long	.LASF89
	.byte	0xd
	.byte	0x6a
	.byte	0x1a
	.long	0x533
	.uleb128 0x10
	.long	0x522
	.uleb128 0xb
	.long	.LASF90
	.uleb128 0x4
	.long	.LASF91
	.byte	0xd
	.byte	0x6b
	.byte	0x1e
	.long	0x544
	.uleb128 0xb
	.long	.LASF92
	.uleb128 0x4
	.long	.LASF93
	.byte	0xd
	.byte	0xba
	.byte	0x1a
	.long	0x555
	.uleb128 0xb
	.long	.LASF94
	.uleb128 0x3
	.long	0x4a
	.uleb128 0x7
	.long	0x4a
	.long	0x56f
	.uleb128 0x6
	.long	0x3a
	.byte	0xf
	.byte	0
	.uleb128 0x3
	.long	0x52e
	.uleb128 0x1c
	.byte	0xd0
	.byte	0xe
	.byte	0xa0
	.byte	0xa
	.long	0x600
	.uleb128 0x1
	.long	.LASF95
	.byte	0xe
	.byte	0xa2
	.byte	0xa
	.long	0x66
	.byte	0
	.uleb128 0x1
	.long	.LASF96
	.byte	0xe
	.byte	0xa3
	.byte	0xa
	.long	0x66
	.byte	0x4
	.uleb128 0x1
	.long	.LASF97
	.byte	0xe
	.byte	0xa4
	.byte	0x1e
	.long	0x447
	.byte	0x8
	.uleb128 0x1
	.long	.LASF98
	.byte	0xe
	.byte	0xa5
	.byte	0x17
	.long	0x508
	.byte	0x88
	.uleb128 0x1
	.long	.LASF99
	.byte	0xe
	.byte	0xa6
	.byte	0xa
	.long	0x66
	.byte	0x90
	.uleb128 0x1
	.long	.LASF100
	.byte	0xe
	.byte	0xa7
	.byte	0xa
	.long	0x66
	.byte	0x94
	.uleb128 0x1
	.long	.LASF101
	.byte	0xe
	.byte	0xa8
	.byte	0xa
	.long	0x66
	.byte	0x98
	.uleb128 0x1
	.long	.LASF102
	.byte	0xe
	.byte	0xa9
	.byte	0xa
	.long	0x66
	.byte	0x9c
	.uleb128 0x1
	.long	.LASF103
	.byte	0xe
	.byte	0xaa
	.byte	0xa
	.long	0x66
	.byte	0xa0
	.uleb128 0x1
	.long	.LASF104
	.byte	0xe
	.byte	0xab
	.byte	0x16
	.long	0x3df
	.byte	0xa8
	.byte	0
	.uleb128 0x4
	.long	.LASF105
	.byte	0xe
	.byte	0xac
	.byte	0x4
	.long	0x574
	.uleb128 0x1d
	.long	.LASF106
	.byte	0xf
	.value	0x2f4
	.byte	0xd
	.long	0x61f
	.uleb128 0x2
	.long	0x66
	.byte	0
	.uleb128 0x8
	.long	.LASF107
	.byte	0x10
	.value	0x30d
	.byte	0xc
	.long	0x66
	.long	0x63b
	.uleb128 0x2
	.long	0x63b
	.uleb128 0x2
	.long	0x640
	.byte	0
	.uleb128 0x3
	.long	0x3df
	.uleb128 0x3
	.long	0x3a1
	.uleb128 0x1e
	.long	.LASF108
	.byte	0x11
	.byte	0xb8
	.byte	0xc
	.long	0x66
	.long	0x65b
	.uleb128 0x2
	.long	0x2b0
	.byte	0
	.uleb128 0x8
	.long	.LASF109
	.byte	0x11
	.value	0x28e
	.byte	0xe
	.long	0x8c
	.long	0x67c
	.uleb128 0x2
	.long	0x91
	.uleb128 0x2
	.long	0x66
	.uleb128 0x2
	.long	0x2b5
	.byte	0
	.uleb128 0x8
	.long	.LASF110
	.byte	0x11
	.value	0x16b
	.byte	0xc
	.long	0x66
	.long	0x694
	.uleb128 0x2
	.long	0x2a6
	.uleb128 0x11
	.byte	0
	.uleb128 0x1f
	.long	.LASF133
	.byte	0x11
	.value	0x1bf
	.byte	0xc
	.long	.LASF134
	.long	0x66
	.long	0x6b5
	.uleb128 0x2
	.long	0x2a6
	.uleb128 0x2
	.long	0x2a6
	.uleb128 0x11
	.byte	0
	.uleb128 0x8
	.long	.LASF111
	.byte	0x11
	.value	0x108
	.byte	0xe
	.long	0x2b0
	.long	0x6d1
	.uleb128 0x2
	.long	0x2ab
	.uleb128 0x2
	.long	0x2ab
	.byte	0
	.uleb128 0x8
	.long	.LASF112
	.byte	0x11
	.value	0x181
	.byte	0xc
	.long	0x66
	.long	0x6f3
	.uleb128 0x2
	.long	0x8c
	.uleb128 0x2
	.long	0x3a
	.uleb128 0x2
	.long	0x2a6
	.uleb128 0x11
	.byte	0
	.uleb128 0x20
	.long	.LASF135
	.byte	0x12
	.value	0x2c0
	.byte	0x6
	.long	0x706
	.uleb128 0x2
	.long	0x706
	.byte	0
	.uleb128 0x3
	.long	0x538
	.uleb128 0x8
	.long	.LASF113
	.byte	0x12
	.value	0x2cf
	.byte	0xc
	.long	0x66
	.long	0x72c
	.uleb128 0x2
	.long	0x706
	.uleb128 0x2
	.long	0x55a
	.uleb128 0x2
	.long	0x72c
	.byte	0
	.uleb128 0x3
	.long	0x41
	.uleb128 0x8
	.long	.LASF114
	.byte	0x12
	.value	0x2cd
	.byte	0xc
	.long	0x66
	.long	0x752
	.uleb128 0x2
	.long	0x706
	.uleb128 0x2
	.long	0x3eb
	.uleb128 0x2
	.long	0x2e
	.byte	0
	.uleb128 0x8
	.long	.LASF115
	.byte	0xf
	.value	0x2a0
	.byte	0xe
	.long	0x48
	.long	0x769
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0x8
	.long	.LASF116
	.byte	0x12
	.value	0x2cb
	.byte	0xc
	.long	0x66
	.long	0x78a
	.uleb128 0x2
	.long	0x706
	.uleb128 0x2
	.long	0x56f
	.uleb128 0x2
	.long	0x78a
	.byte	0
	.uleb128 0x3
	.long	0x549
	.uleb128 0x14
	.long	.LASF117
	.value	0x391
	.byte	0xf
	.long	0x56f
	.uleb128 0x14
	.long	.LASF118
	.value	0x2be
	.byte	0xd
	.long	0x706
	.uleb128 0x21
	.long	.LASF136
	.byte	0x1
	.byte	0xda
	.byte	0x5
	.long	0x66
	.quad	.LFB322
	.quad	.LFE322-.LFB322
	.uleb128 0x1
	.byte	0x9c
	.long	0x7f6
	.uleb128 0x12
	.long	.LASF119
	.byte	0xda
	.byte	0xe
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -244
	.uleb128 0x12
	.long	.LASF120
	.byte	0xda
	.byte	0x1a
	.long	0x3fe
	.uleb128 0x3
	.byte	0x91
	.sleb128 -256
	.uleb128 0xc
	.string	"sd"
	.byte	0xdc
	.byte	0x13
	.long	0x600
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.byte	0
	.uleb128 0x22
	.long	.LASF125
	.byte	0x1
	.byte	0xbb
	.byte	0x6
	.quad	.LFB321
	.quad	.LFE321-.LFB321
	.uleb128 0x1
	.byte	0x9c
	.long	0x86c
	.uleb128 0xc
	.string	"fs"
	.byte	0xbc
	.byte	0xb
	.long	0x2b0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -296
	.uleb128 0xa
	.long	.LASF121
	.byte	0xbd
	.byte	0xa
	.long	0x86c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0xa
	.long	.LASF122
	.byte	0xbe
	.byte	0x9
	.long	0x87c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -288
	.uleb128 0xa
	.long	.LASF123
	.byte	0xbf
	.byte	0xa
	.long	0x88c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -192
	.uleb128 0xa
	.long	.LASF124
	.byte	0xc0
	.byte	0x9
	.long	0x87c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.uleb128 0xc
	.string	"i"
	.byte	0xc1
	.byte	0x9
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -300
	.byte	0
	.uleb128 0x7
	.long	0x96
	.long	0x87c
	.uleb128 0x6
	.long	0x3a
	.byte	0x31
	.byte	0
	.uleb128 0x7
	.long	0x66
	.long	0x88c
	.uleb128 0x6
	.long	0x3a
	.byte	0x9
	.byte	0
	.uleb128 0x7
	.long	0x96
	.long	0x8a2
	.uleb128 0x6
	.long	0x3a
	.byte	0x9
	.uleb128 0x6
	.long	0x3a
	.byte	0x9
	.byte	0
	.uleb128 0x23
	.long	.LASF126
	.byte	0x1
	.byte	0x3
	.byte	0x7
	.long	0x8c
	.quad	.LFB320
	.quad	.LFE320-.LFB320
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x24
	.string	"str"
	.byte	0x1
	.byte	0x3
	.byte	0x15
	.long	0x8c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x12
	.long	.LASF127
	.byte	0x3
	.byte	0x1e
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.uleb128 0xa
	.long	.LASF128
	.byte	0x6
	.byte	0x11
	.long	0x706
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0xc
	.string	"md"
	.byte	0x7
	.byte	0x13
	.long	0x56f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0xa
	.long	.LASF129
	.byte	0x9
	.byte	0x9
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0xc
	.string	"out"
	.byte	0xa
	.byte	0xb
	.long	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xa
	.long	.LASF130
	.byte	0xb
	.byte	0x13
	.long	0x55f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x25
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0xc
	.string	"n"
	.byte	0x1d
	.byte	0xe
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.byte	0
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
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
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
	.uleb128 0x9
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
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xf
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x26
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
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 18
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x20
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
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.uleb128 0x25
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
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
.LASF110:
	.string	"printf"
.LASF10:
	.string	"__off_t"
.LASF63:
	.string	"__size"
.LASF15:
	.string	"_IO_read_ptr"
.LASF115:
	.string	"malloc"
.LASF27:
	.string	"_chain"
.LASF124:
	.string	"which_dfs_port"
.LASF78:
	.string	"ai_flags"
.LASF9:
	.string	"size_t"
.LASF129:
	.string	"md_len"
.LASF64:
	.string	"__align"
.LASF33:
	.string	"_shortbuf"
.LASF77:
	.string	"addrinfo"
.LASF6:
	.string	"signed char"
.LASF131:
	.string	"GNU C17 14.2.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF21:
	.string	"_IO_buf_base"
.LASF89:
	.string	"EVP_MD"
.LASF48:
	.string	"long long unsigned int"
.LASF98:
	.string	"server_info"
.LASF52:
	.string	"__next"
.LASF93:
	.string	"ENGINE"
.LASF97:
	.string	"client_info"
.LASF65:
	.string	"pthread_mutexattr_t"
.LASF68:
	.string	"socklen_t"
.LASF36:
	.string	"_codecvt"
.LASF95:
	.string	"sockfd"
.LASF47:
	.string	"long long int"
.LASF126:
	.string	"str2md5"
.LASF28:
	.string	"_fileno"
.LASF16:
	.string	"_IO_read_end"
.LASF8:
	.string	"long int"
.LASF14:
	.string	"_flags"
.LASF22:
	.string	"_IO_buf_end"
.LASF31:
	.string	"_cur_column"
.LASF118:
	.string	"EVP_MD_CTX_new"
.LASF45:
	.string	"_IO_codecvt"
.LASF116:
	.string	"EVP_DigestInit_ex"
.LASF30:
	.string	"_old_offset"
.LASF35:
	.string	"_offset"
.LASF53:
	.string	"__pthread_list_t"
.LASF136:
	.string	"main"
.LASF51:
	.string	"__prev"
.LASF54:
	.string	"__pthread_mutex_s"
.LASF135:
	.string	"EVP_MD_CTX_free"
.LASF121:
	.string	"line"
.LASF103:
	.string	"port"
.LASF44:
	.string	"_IO_marker"
.LASF3:
	.string	"unsigned int"
.LASF39:
	.string	"_freeres_buf"
.LASF100:
	.string	"recvBytes"
.LASF86:
	.string	"__int128"
.LASF80:
	.string	"ai_socktype"
.LASF2:
	.string	"long unsigned int"
.LASF66:
	.string	"__data"
.LASF19:
	.string	"_IO_write_ptr"
.LASF101:
	.string	"sentBytes"
.LASF99:
	.string	"addr_len"
.LASF61:
	.string	"__elision"
.LASF5:
	.string	"short unsigned int"
.LASF23:
	.string	"_IO_save_base"
.LASF130:
	.string	"digest"
.LASF34:
	.string	"_lock"
.LASF29:
	.string	"_flags2"
.LASF41:
	.string	"_mode"
.LASF109:
	.string	"fgets"
.LASF107:
	.string	"pthread_mutex_init"
.LASF125:
	.string	"read_server_conf"
.LASF57:
	.string	"__owner"
.LASF114:
	.string	"EVP_DigestUpdate"
.LASF133:
	.string	"sscanf"
.LASF105:
	.string	"sockdetails_t"
.LASF20:
	.string	"_IO_write_end"
.LASF40:
	.string	"_prevchain"
.LASF81:
	.string	"ai_protocol"
.LASF73:
	.string	"sockaddr_storage"
.LASF132:
	.string	"_IO_lock_t"
.LASF117:
	.string	"EVP_md5"
.LASF49:
	.string	"_IO_FILE"
.LASF96:
	.string	"client_sock_fd"
.LASF50:
	.string	"__pthread_internal_list"
.LASF82:
	.string	"ai_addrlen"
.LASF111:
	.string	"fopen"
.LASF71:
	.string	"sa_family"
.LASF90:
	.string	"evp_md_st"
.LASF87:
	.string	"__int128 unsigned"
.LASF4:
	.string	"unsigned char"
.LASF83:
	.string	"ai_addr"
.LASF7:
	.string	"short int"
.LASF46:
	.string	"_IO_wide_data"
.LASF134:
	.string	"__isoc23_sscanf"
.LASF85:
	.string	"ai_next"
.LASF32:
	.string	"_vtable_offset"
.LASF43:
	.string	"FILE"
.LASF91:
	.string	"EVP_MD_CTX"
.LASF106:
	.string	"exit"
.LASF26:
	.string	"_markers"
.LASF92:
	.string	"evp_md_ctx_st"
.LASF56:
	.string	"__count"
.LASF55:
	.string	"__lock"
.LASF94:
	.string	"engine_st"
.LASF12:
	.string	"char"
.LASF88:
	.string	"long double"
.LASF127:
	.string	"length"
.LASF74:
	.string	"ss_family"
.LASF13:
	.string	"__socklen_t"
.LASF70:
	.string	"sockaddr"
.LASF79:
	.string	"ai_family"
.LASF108:
	.string	"fclose"
.LASF11:
	.string	"__off64_t"
.LASF17:
	.string	"_IO_read_base"
.LASF25:
	.string	"_IO_save_end"
.LASF128:
	.string	"context"
.LASF67:
	.string	"pthread_mutex_t"
.LASF113:
	.string	"EVP_DigestFinal_ex"
.LASF60:
	.string	"__spins"
.LASF112:
	.string	"snprintf"
.LASF69:
	.string	"sa_family_t"
.LASF42:
	.string	"_unused2"
.LASF120:
	.string	"argv"
.LASF76:
	.string	"__ss_align"
.LASF58:
	.string	"__nusers"
.LASF24:
	.string	"_IO_backup_base"
.LASF122:
	.string	"which_dfs"
.LASF75:
	.string	"__ss_padding"
.LASF119:
	.string	"argc"
.LASF72:
	.string	"sa_data"
.LASF38:
	.string	"_freeres_list"
.LASF62:
	.string	"__list"
.LASF84:
	.string	"ai_canonname"
.LASF37:
	.string	"_wide_data"
.LASF123:
	.string	"which_dfs_ip"
.LASF59:
	.string	"__kind"
.LASF102:
	.string	"timeout"
.LASF104:
	.string	"lock"
.LASF18:
	.string	"_IO_write_base"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/parth/Work/All_data/university/Network System/Assignments/PA4/client"
.LASF0:
	.string	"dfc.c"
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
