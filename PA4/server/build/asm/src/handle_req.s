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
	.string	"%d) command %d, chunk: %d, filename %d, data %d \n"
.LC4:
	.string	"filename : %s\n"
.LC5:
	.string	"%s_%d"
.LC6:
	.string	"wb"
.LC7:
	.string	"data : %s\n"
.LC8:
	.string	"%s_%s"
.LC9:
	.string	"rb"
	.text
	.globl	handle_req
	.type	handle_req, @function
handle_req:
.LFB321:
	.loc 1 56 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	leaq	-61440(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$272, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -61720(%rbp)
	.loc 1 56 1
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
.L20:
.LBB2:
.LBB3:
	.loc 1 64 9
	leaq	-61600(%rbp), %rax
	movq	%rax, -61672(%rbp)
	movl	$0, -61704(%rbp)
	jmp	.L5
.L6:
	.loc 1 64 9 is_stmt 0 discriminator 3
	movq	-61672(%rbp), %rax
	movl	-61704(%rbp), %edx
	movq	$0, (%rax,%rdx,8)
	addl	$1, -61704(%rbp)
.L5:
	.loc 1 64 9 discriminator 1
	cmpl	$15, -61704(%rbp)
	jbe	.L6
.LBE3:
	.loc 1 65 9 is_stmt 1
	movq	-61720(%rbp), %rax
	movl	4(%rax), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	movl	%eax, %esi
	movslq	%esi, %rax
	movq	-61600(%rbp,%rax,8), %rdx
	movq	-61720(%rbp), %rax
	movl	4(%rax), %eax
	andl	$63, %eax
	movl	$1, %edi
	movl	%eax, %ecx
	salq	%cl, %rdi
	movq	%rdi, %rax
	orq	%rax, %rdx
	movslq	%esi, %rax
	movq	%rdx, -61600(%rbp,%rax,8)
	.loc 1 68 24
	movq	$2, -61616(%rbp)
	movq	$0, -61608(%rbp)
	.loc 1 71 38
	movq	-61720(%rbp), %rax
	movl	4(%rax), %eax
	.loc 1 71 29
	leal	1(%rax), %edi
	leaq	-61616(%rbp), %rdx
	leaq	-61600(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	call	select@PLT
	movl	%eax, -61692(%rbp)
	.loc 1 73 12
	cmpl	$0, -61692(%rbp)
	jns	.L7
	.loc 1 76 47
	call	__errno_location@PLT
	.loc 1 75 13
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %r12
	.loc 1 76 31
	call	__errno_location@PLT
	.loc 1 75 13
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	.loc 1 75 13 is_stmt 0 discriminator 2
	movq	stderr(%rip), %rax
	movq	%r12, %r8
	movl	%ebx, %ecx
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 77 13 is_stmt 1
	jmp	.L21
.L7:
	.loc 1 81 17
	cmpl	$0, -61692(%rbp)
	jne	.L9
	.loc 1 83 13
	call	gettid@PLT
	.loc 1 83 13 is_stmt 0 discriminator 1
	movl	$2, %edx
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 87 13 is_stmt 1
	jmp	.L21
.L9:
	.loc 1 91 18
	movq	-61720(%rbp), %rax
	movl	4(%rax), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	cltq
	movq	-61600(%rbp,%rax,8), %rdx
	movq	-61720(%rbp), %rax
	movl	4(%rax), %eax
	andl	$63, %eax
	movl	$1, %esi
	movl	%eax, %ecx
	salq	%cl, %rsi
	movq	%rsi, %rax
	andq	%rdx, %rax
	.loc 1 91 17
	testq	%rax, %rax
	je	.L20
.LBB4:
	.loc 1 93 13
	leaq	-61472(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 95 17
	movl	$0, -61700(%rbp)
	.loc 1 97 29
	movq	-61720(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-61644(%rbp), %rsi
	movl	$256, %ecx
	movl	$12, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 97 27 discriminator 1
	movl	%eax, -61688(%rbp)
	.loc 1 97 16 discriminator 1
	cmpl	$0, -61688(%rbp)
	js	.L24
	.loc 1 104 16
	cmpl	$0, -61688(%rbp)
	jne	.L13
	.loc 1 106 17
	call	gettid@PLT
	movl	%eax, %edx
	.loc 1 106 17 is_stmt 0 discriminator 1
	movq	stderr(%rip), %rax
	leaq	.LC2(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 107 17 is_stmt 1
	jmp	.L21
.L13:
	.loc 1 110 13
	movl	-61636(%rbp), %edi
	movl	-61640(%rbp), %esi
	.loc 1 110 122
	movzbl	-61643(%rbp), %eax
	.loc 1 110 13
	movzbl	%al, %ecx
	.loc 1 110 98
	movzbl	-61644(%rbp), %eax
	.loc 1 110 13
	movzbl	%al, %edx
	movl	-61688(%rbp), %eax
	movl	%edi, %r9d
	movl	%esi, %r8d
	movl	%eax, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 112 30
	movzbl	-61644(%rbp), %eax
	.loc 1 112 15
	cmpb	$1, %al
	jne	.L14
.LBB5:
	.loc 1 113 17
	leaq	-61472(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 114 81
	movl	-61640(%rbp), %eax
	.loc 1 114 28
	movl	%eax, %edx
	movq	-61720(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-61472(%rbp), %rsi
	movl	$256, %ecx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 114 26 discriminator 1
	movl	%eax, -61688(%rbp)
	.loc 1 115 17
	leaq	-61472(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 116 29
	movl	$0, -61700(%rbp)
	.loc 1 119 74
	movzbl	-61643(%rbp), %eax
	.loc 1 119 17
	movzbl	%al, %ecx
	leaq	-61472(%rbp), %rdx
	leaq	-61632(%rbp), %rax
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	.loc 1 120 28
	movq	-61632(%rbp), %rax
	leaq	.LC6(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -61656(%rbp)
	.loc 1 125 17
	leaq	-61472(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 126 22
	jmp	.L15
.L16:
	.loc 1 127 99
	movl	-61636(%rbp), %eax
	.loc 1 127 32
	movl	%eax, %edi
	.loc 1 127 57
	leaq	-61472(%rbp), %rdx
	movl	-61700(%rbp), %eax
	cltq
	leaq	(%rdx,%rax), %rsi
	.loc 1 127 32
	movq	-61720(%rbp), %rax
	movl	4(%rax), %eax
	movl	$256, %ecx
	movq	%rdi, %rdx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 127 30 discriminator 1
	movl	%eax, -61688(%rbp)
	.loc 1 128 21
	leaq	-61472(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 129 32
	movl	-61688(%rbp), %eax
	addl	%eax, -61700(%rbp)
.L15:
	.loc 1 126 51
	movl	-61636(%rbp), %eax
	.loc 1 126 35
	movl	-61700(%rbp), %edx
	cmpl	%eax, %edx
	jb	.L16
	.loc 1 131 29
	movl	$0, -61700(%rbp)
	.loc 1 134 70
	movl	-61636(%rbp), %eax
	.loc 1 134 21
	movl	%eax, %esi
	.loc 1 134 28
	leaq	-61472(%rbp), %rdx
	movl	-61700(%rbp), %eax
	cltq
	leaq	(%rdx,%rax), %rdi
	.loc 1 134 21
	movq	-61656(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	call	fwrite@PLT
	.loc 1 137 17
	movq	-61632(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 138 17
	movq	-61656(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
.LBE5:
	jmp	.L20
.L14:
	.loc 1 140 35
	movzbl	-61644(%rbp), %eax
	.loc 1 140 20
	testb	%al, %al
	jne	.L20
.LBB6:
	.loc 1 141 17
	leaq	-61472(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 142 81
	movl	-61640(%rbp), %eax
	.loc 1 142 28
	movl	%eax, %edx
	movq	-61720(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-61472(%rbp), %rsi
	movl	$256, %ecx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 142 26 discriminator 1
	movl	%eax, -61688(%rbp)
	.loc 1 143 17
	leaq	-61472(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 146 74
	movzbl	-61643(%rbp), %eax
	.loc 1 146 17
	movzbl	%al, %ecx
	leaq	-61472(%rbp), %rdx
	leaq	-61680(%rbp), %rax
	leaq	.LC8(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	.loc 1 147 28
	movq	-61680(%rbp), %rax
	leaq	.LC9(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -61664(%rbp)
	.loc 1 149 21
	movl	$0, -61696(%rbp)
	.loc 1 150 17
	movq	-61664(%rbp), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseek@PLT
	.loc 1 151 33
	movq	-61664(%rbp), %rax
	movq	%rax, %rdi
	call	ftell@PLT
	.loc 1 151 21 discriminator 1
	movl	%eax, -61684(%rbp)
	.loc 1 152 17
	movq	-61664(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseek@PLT
	.loc 1 153 34
	movb	$0, -61632(%rbp)
	movb	$0, -61631(%rbp)
	.loc 1 153 60
	leaq	-61472(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 153 34 discriminator 1
	movl	%eax, -61628(%rbp)
	movl	-61684(%rbp), %eax
	movl	%eax, -61624(%rbp)
	.loc 1 155 17
	movq	-61720(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-61632(%rbp), %rsi
	movl	$0, %ecx
	movl	$12, %edx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 157 22
	jmp	.L18
.L19:
	.loc 1 158 38
	leaq	-30752(%rbp), %rdx
	movl	-61696(%rbp), %eax
	cltq
	leaq	(%rdx,%rax), %rdi
	.loc 1 158 32
	movq	-61664(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$30720, %esi
	call	fread@PLT
	.loc 1 158 30 discriminator 1
	movl	%eax, -61688(%rbp)
	.loc 1 159 32
	movl	-61688(%rbp), %eax
	addl	%eax, -61696(%rbp)
.L18:
	.loc 1 157 34
	movl	-61696(%rbp), %eax
	cmpl	-61684(%rbp), %eax
	jl	.L19
	.loc 1 162 17
	movq	-61680(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.LBE6:
.LBE4:
.LBE2:
	.loc 1 63 5
	jmp	.L20
.L24:
.LBB8:
.LBB7:
	.loc 1 99 17
	nop
.L21:
.LBE7:
.LBE8:
	.loc 1 178 5
	movq	-61720(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 180 12
	movl	$0, %eax
	.loc 1 181 1
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L23
	call	__stack_chk_fail@PLT
.L23:
	addq	$61712, %rsp
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
	.file 23 "/usr/include/stdlib.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xd0d
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x1e
	.long	.LASF197
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
	.uleb128 0x6
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x1f
	.byte	0x8
	.uleb128 0xe
	.long	0x48
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
	.byte	0x3
	.byte	0x26
	.byte	0x17
	.long	0x4f
	.uleb128 0x6
	.byte	0x2
	.byte	0x5
	.long	.LASF9
	.uleb128 0x3
	.long	.LASF10
	.byte	0x3
	.byte	0x28
	.byte	0x1c
	.long	0x56
	.uleb128 0x20
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.long	.LASF11
	.byte	0x3
	.byte	0x2a
	.byte	0x16
	.long	0x41
	.uleb128 0x6
	.byte	0x8
	.byte	0x5
	.long	.LASF12
	.uleb128 0x3
	.long	.LASF13
	.byte	0x3
	.byte	0x98
	.byte	0x19
	.long	0x96
	.uleb128 0x3
	.long	.LASF14
	.byte	0x3
	.byte	0x99
	.byte	0x1b
	.long	0x96
	.uleb128 0x3
	.long	.LASF15
	.byte	0x3
	.byte	0x9a
	.byte	0x19
	.long	0x83
	.uleb128 0x3
	.long	.LASF16
	.byte	0x3
	.byte	0xa0
	.byte	0x1a
	.long	0x96
	.uleb128 0x3
	.long	.LASF17
	.byte	0x3
	.byte	0xa2
	.byte	0x1f
	.long	0x96
	.uleb128 0x3
	.long	.LASF18
	.byte	0x3
	.byte	0xc2
	.byte	0x1b
	.long	0x96
	.uleb128 0x4
	.long	0xea
	.uleb128 0x6
	.byte	0x1
	.byte	0x6
	.long	.LASF19
	.uleb128 0x21
	.long	0xea
	.uleb128 0x3
	.long	.LASF20
	.byte	0x3
	.byte	0xd2
	.byte	0x17
	.long	0x41
	.uleb128 0xb
	.long	.LASF56
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x289
	.uleb128 0x1
	.long	.LASF21
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x83
	.byte	0
	.uleb128 0x1
	.long	.LASF22
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0xe5
	.byte	0x8
	.uleb128 0x1
	.long	.LASF23
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0xe5
	.byte	0x10
	.uleb128 0x1
	.long	.LASF24
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0xe5
	.byte	0x18
	.uleb128 0x1
	.long	.LASF25
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0xe5
	.byte	0x20
	.uleb128 0x1
	.long	.LASF26
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0xe5
	.byte	0x28
	.uleb128 0x1
	.long	.LASF27
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0xe5
	.byte	0x30
	.uleb128 0x1
	.long	.LASF28
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0xe5
	.byte	0x38
	.uleb128 0x1
	.long	.LASF29
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0xe5
	.byte	0x40
	.uleb128 0x1
	.long	.LASF30
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0xe5
	.byte	0x48
	.uleb128 0x1
	.long	.LASF31
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0xe5
	.byte	0x50
	.uleb128 0x1
	.long	.LASF32
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0xe5
	.byte	0x58
	.uleb128 0x1
	.long	.LASF33
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x2a2
	.byte	0x60
	.uleb128 0x1
	.long	.LASF34
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x2a7
	.byte	0x68
	.uleb128 0x1
	.long	.LASF35
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x83
	.byte	0x70
	.uleb128 0x1
	.long	.LASF36
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x83
	.byte	0x74
	.uleb128 0x1
	.long	.LASF37
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0x9d
	.byte	0x78
	.uleb128 0x1
	.long	.LASF38
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x56
	.byte	0x80
	.uleb128 0x1
	.long	.LASF39
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x5d
	.byte	0x82
	.uleb128 0x1
	.long	.LASF40
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x2ac
	.byte	0x83
	.uleb128 0x1
	.long	.LASF41
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x2bc
	.byte	0x88
	.uleb128 0x1
	.long	.LASF42
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0xa9
	.byte	0x90
	.uleb128 0x1
	.long	.LASF43
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x2c6
	.byte	0x98
	.uleb128 0x1
	.long	.LASF44
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x2d0
	.byte	0xa0
	.uleb128 0x1
	.long	.LASF45
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x2a7
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
	.long	0x2d5
	.byte	0xb8
	.uleb128 0x1
	.long	.LASF48
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x83
	.byte	0xc0
	.uleb128 0x1
	.long	.LASF49
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x2da
	.byte	0xc4
	.byte	0
	.uleb128 0x3
	.long	.LASF50
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0x102
	.uleb128 0x22
	.long	.LASF198
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0x12
	.long	.LASF51
	.uleb128 0x4
	.long	0x29d
	.uleb128 0x4
	.long	0x102
	.uleb128 0x9
	.long	0xea
	.long	0x2bc
	.uleb128 0xc
	.long	0x3a
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	0x295
	.uleb128 0x12
	.long	.LASF52
	.uleb128 0x4
	.long	0x2c1
	.uleb128 0x12
	.long	.LASF53
	.uleb128 0x4
	.long	0x2cb
	.uleb128 0x4
	.long	0x2a7
	.uleb128 0x9
	.long	0xea
	.long	0x2ea
	.uleb128 0xc
	.long	0x3a
	.byte	0x13
	.byte	0
	.uleb128 0x4
	.long	0xf1
	.uleb128 0xe
	.long	0x2ea
	.uleb128 0x3
	.long	.LASF54
	.byte	0x6
	.byte	0x4e
	.byte	0x13
	.long	0xd9
	.uleb128 0x4
	.long	0x289
	.uleb128 0xe
	.long	0x300
	.uleb128 0x23
	.long	.LASF199
	.byte	0x6
	.byte	0x97
	.byte	0xe
	.long	0x300
	.uleb128 0x6
	.byte	0x8
	.byte	0x5
	.long	.LASF55
	.uleb128 0xb
	.long	.LASF57
	.byte	0x10
	.byte	0x7
	.byte	0x8
	.byte	0x8
	.long	0x345
	.uleb128 0x1
	.long	.LASF58
	.byte	0x7
	.byte	0xe
	.byte	0xc
	.long	0xc1
	.byte	0
	.uleb128 0x1
	.long	.LASF59
	.byte	0x7
	.byte	0xf
	.byte	0x11
	.long	0xcd
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	.LASF60
	.byte	0x8
	.byte	0x31
	.byte	0x12
	.long	0x96
	.uleb128 0x16
	.byte	0x80
	.byte	0x8
	.byte	0x3b
	.byte	0x9
	.long	0x368
	.uleb128 0x1
	.long	.LASF61
	.byte	0x8
	.byte	0x40
	.byte	0xf
	.long	0x368
	.byte	0
	.byte	0
	.uleb128 0x9
	.long	0x345
	.long	0x378
	.uleb128 0xc
	.long	0x3a
	.byte	0xf
	.byte	0
	.uleb128 0x3
	.long	.LASF62
	.byte	0x8
	.byte	0x46
	.byte	0x5
	.long	0x351
	.uleb128 0x6
	.byte	0x8
	.byte	0x7
	.long	.LASF63
	.uleb128 0xb
	.long	.LASF64
	.byte	0x10
	.byte	0x9
	.byte	0x33
	.byte	0x10
	.long	0x3b3
	.uleb128 0x1
	.long	.LASF65
	.byte	0x9
	.byte	0x35
	.byte	0x23
	.long	0x3b3
	.byte	0
	.uleb128 0x1
	.long	.LASF66
	.byte	0x9
	.byte	0x36
	.byte	0x23
	.long	0x3b3
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.long	0x38b
	.uleb128 0x3
	.long	.LASF67
	.byte	0x9
	.byte	0x37
	.byte	0x3
	.long	0x38b
	.uleb128 0xb
	.long	.LASF68
	.byte	0x28
	.byte	0xa
	.byte	0x16
	.byte	0x8
	.long	0x43a
	.uleb128 0x1
	.long	.LASF69
	.byte	0xa
	.byte	0x18
	.byte	0x7
	.long	0x83
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
	.long	0x83
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
	.long	0x83
	.byte	0x10
	.uleb128 0x1
	.long	.LASF74
	.byte	0xa
	.byte	0x22
	.byte	0x9
	.long	0x70
	.byte	0x14
	.uleb128 0x1
	.long	.LASF75
	.byte	0xa
	.byte	0x23
	.byte	0x9
	.long	0x70
	.byte	0x16
	.uleb128 0x1
	.long	.LASF76
	.byte	0xa
	.byte	0x24
	.byte	0x14
	.long	0x3b8
	.byte	0x18
	.byte	0
	.uleb128 0x17
	.byte	0x28
	.byte	0xb
	.byte	0x43
	.byte	0x9
	.long	0x468
	.uleb128 0xf
	.long	.LASF77
	.byte	0xb
	.byte	0x45
	.byte	0x1c
	.long	0x3c4
	.uleb128 0xf
	.long	.LASF78
	.byte	0xb
	.byte	0x46
	.byte	0x8
	.long	0x468
	.uleb128 0xf
	.long	.LASF79
	.byte	0xb
	.byte	0x47
	.byte	0xc
	.long	0x96
	.byte	0
	.uleb128 0x9
	.long	0xea
	.long	0x478
	.uleb128 0xc
	.long	0x3a
	.byte	0x27
	.byte	0
	.uleb128 0x3
	.long	.LASF80
	.byte	0xb
	.byte	0x48
	.byte	0x3
	.long	0x43a
	.uleb128 0x4
	.long	0x489
	.uleb128 0x24
	.uleb128 0x3
	.long	.LASF81
	.byte	0xc
	.byte	0x18
	.byte	0x13
	.long	0x64
	.uleb128 0x3
	.long	.LASF82
	.byte	0xc
	.byte	0x19
	.byte	0x14
	.long	0x77
	.uleb128 0x3
	.long	.LASF83
	.byte	0xc
	.byte	0x1a
	.byte	0x14
	.long	0x8a
	.uleb128 0x25
	.long	.LASF84
	.byte	0xd
	.value	0x112
	.byte	0x15
	.long	0xf6
	.uleb128 0x4
	.long	0xe5
	.uleb128 0xe
	.long	0x4bb
	.uleb128 0x3
	.long	.LASF85
	.byte	0xe
	.byte	0x1c
	.byte	0x1c
	.long	0x56
	.uleb128 0xb
	.long	.LASF86
	.byte	0x10
	.byte	0xf
	.byte	0xb8
	.byte	0x27
	.long	0x4f9
	.uleb128 0x1
	.long	.LASF87
	.byte	0xf
	.byte	0xba
	.byte	0x5
	.long	0x4c5
	.byte	0
	.uleb128 0x1
	.long	.LASF88
	.byte	0xf
	.byte	0xbb
	.byte	0xa
	.long	0x4f9
	.byte	0x2
	.byte	0
	.uleb128 0x9
	.long	0xea
	.long	0x509
	.uleb128 0xc
	.long	0x3a
	.byte	0xd
	.byte	0
	.uleb128 0xb
	.long	.LASF89
	.byte	0x80
	.byte	0xf
	.byte	0xc5
	.byte	0x27
	.long	0x53e
	.uleb128 0x1
	.long	.LASF90
	.byte	0xf
	.byte	0xc7
	.byte	0x5
	.long	0x4c5
	.byte	0
	.uleb128 0x1
	.long	.LASF91
	.byte	0xf
	.byte	0xc8
	.byte	0xa
	.long	0x53e
	.byte	0x2
	.uleb128 0x1
	.long	.LASF92
	.byte	0xf
	.byte	0xc9
	.byte	0x14
	.long	0x3a
	.byte	0x78
	.byte	0
	.uleb128 0x9
	.long	0xea
	.long	0x54e
	.uleb128 0xc
	.long	0x3a
	.byte	0x75
	.byte	0
	.uleb128 0x18
	.long	0x41
	.byte	0xf
	.byte	0xcf
	.byte	0x3
	.long	0x5f6
	.uleb128 0x7
	.long	.LASF93
	.byte	0x1
	.uleb128 0x7
	.long	.LASF94
	.byte	0x2
	.uleb128 0x7
	.long	.LASF95
	.byte	0x4
	.uleb128 0x7
	.long	.LASF96
	.byte	0x4
	.uleb128 0x7
	.long	.LASF97
	.byte	0x8
	.uleb128 0x7
	.long	.LASF98
	.byte	0x10
	.uleb128 0x7
	.long	.LASF99
	.byte	0x20
	.uleb128 0x7
	.long	.LASF100
	.byte	0x40
	.uleb128 0x7
	.long	.LASF101
	.byte	0x80
	.uleb128 0xd
	.long	.LASF102
	.value	0x100
	.uleb128 0xd
	.long	.LASF103
	.value	0x200
	.uleb128 0xd
	.long	.LASF104
	.value	0x400
	.uleb128 0xd
	.long	.LASF105
	.value	0x800
	.uleb128 0xd
	.long	.LASF106
	.value	0x1000
	.uleb128 0xd
	.long	.LASF107
	.value	0x2000
	.uleb128 0xd
	.long	.LASF108
	.value	0x4000
	.uleb128 0xd
	.long	.LASF109
	.value	0x8000
	.uleb128 0x10
	.long	.LASF110
	.long	0x10000
	.uleb128 0x10
	.long	.LASF111
	.long	0x40000
	.uleb128 0x10
	.long	.LASF112
	.long	0x4000000
	.uleb128 0x10
	.long	.LASF113
	.long	0x20000000
	.uleb128 0x10
	.long	.LASF114
	.long	0x40000000
	.byte	0
	.uleb128 0x4
	.long	0x4d1
	.uleb128 0xb
	.long	.LASF115
	.byte	0x10
	.byte	0x10
	.byte	0xf7
	.byte	0x27
	.long	0x63d
	.uleb128 0x1
	.long	.LASF116
	.byte	0x10
	.byte	0xf9
	.byte	0x5
	.long	0x4c5
	.byte	0
	.uleb128 0x1
	.long	.LASF117
	.byte	0x10
	.byte	0xfa
	.byte	0xf
	.long	0x6b9
	.byte	0x2
	.uleb128 0x1
	.long	.LASF118
	.byte	0x10
	.byte	0xfb
	.byte	0x14
	.long	0x69e
	.byte	0x4
	.uleb128 0x1
	.long	.LASF119
	.byte	0x10
	.byte	0xfe
	.byte	0x13
	.long	0x73e
	.byte	0x8
	.byte	0
	.uleb128 0x19
	.long	.LASF120
	.byte	0x1c
	.byte	0x10
	.value	0x108
	.byte	0x27
	.long	0x692
	.uleb128 0x8
	.long	.LASF121
	.byte	0x10
	.value	0x10a
	.byte	0x5
	.long	0x4c5
	.byte	0
	.uleb128 0x8
	.long	.LASF122
	.byte	0x10
	.value	0x10b
	.byte	0xf
	.long	0x6b9
	.byte	0x2
	.uleb128 0x8
	.long	.LASF123
	.byte	0x10
	.value	0x10c
	.byte	0xe
	.long	0x4a2
	.byte	0x4
	.uleb128 0x8
	.long	.LASF124
	.byte	0x10
	.value	0x10d
	.byte	0x15
	.long	0x723
	.byte	0x8
	.uleb128 0x8
	.long	.LASF125
	.byte	0x10
	.value	0x10e
	.byte	0xe
	.long	0x4a2
	.byte	0x18
	.byte	0
	.uleb128 0x3
	.long	.LASF126
	.byte	0x10
	.byte	0x1e
	.byte	0x12
	.long	0x4a2
	.uleb128 0xb
	.long	.LASF127
	.byte	0x4
	.byte	0x10
	.byte	0x1f
	.byte	0x8
	.long	0x6b9
	.uleb128 0x1
	.long	.LASF128
	.byte	0x10
	.byte	0x21
	.byte	0xf
	.long	0x692
	.byte	0
	.byte	0
	.uleb128 0x3
	.long	.LASF129
	.byte	0x10
	.byte	0x7d
	.byte	0x12
	.long	0x496
	.uleb128 0x17
	.byte	0x10
	.byte	0x10
	.byte	0xdf
	.byte	0x5
	.long	0x6f3
	.uleb128 0xf
	.long	.LASF130
	.byte	0x10
	.byte	0xe1
	.byte	0xa
	.long	0x6f3
	.uleb128 0xf
	.long	.LASF131
	.byte	0x10
	.byte	0xe2
	.byte	0xb
	.long	0x703
	.uleb128 0xf
	.long	.LASF132
	.byte	0x10
	.byte	0xe3
	.byte	0xb
	.long	0x713
	.byte	0
	.uleb128 0x9
	.long	0x48a
	.long	0x703
	.uleb128 0xc
	.long	0x3a
	.byte	0xf
	.byte	0
	.uleb128 0x9
	.long	0x496
	.long	0x713
	.uleb128 0xc
	.long	0x3a
	.byte	0x7
	.byte	0
	.uleb128 0x9
	.long	0x4a2
	.long	0x723
	.uleb128 0xc
	.long	0x3a
	.byte	0x3
	.byte	0
	.uleb128 0xb
	.long	.LASF133
	.byte	0x10
	.byte	0x10
	.byte	0xdd
	.byte	0x8
	.long	0x73e
	.uleb128 0x1
	.long	.LASF134
	.byte	0x10
	.byte	0xe4
	.byte	0x9
	.long	0x6c5
	.byte	0
	.byte	0
	.uleb128 0x9
	.long	0x4f
	.long	0x74e
	.uleb128 0xc
	.long	0x3a
	.byte	0x7
	.byte	0
	.uleb128 0x19
	.long	.LASF135
	.byte	0x30
	.byte	0x11
	.value	0x235
	.byte	0x8
	.long	0x7cd
	.uleb128 0x8
	.long	.LASF136
	.byte	0x11
	.value	0x237
	.byte	0x7
	.long	0x83
	.byte	0
	.uleb128 0x8
	.long	.LASF137
	.byte	0x11
	.value	0x238
	.byte	0x7
	.long	0x83
	.byte	0x4
	.uleb128 0x8
	.long	.LASF138
	.byte	0x11
	.value	0x239
	.byte	0x7
	.long	0x83
	.byte	0x8
	.uleb128 0x8
	.long	.LASF139
	.byte	0x11
	.value	0x23a
	.byte	0x7
	.long	0x83
	.byte	0xc
	.uleb128 0x8
	.long	.LASF140
	.byte	0x11
	.value	0x23b
	.byte	0xd
	.long	0x4ae
	.byte	0x10
	.uleb128 0x8
	.long	.LASF141
	.byte	0x11
	.value	0x23c
	.byte	0x14
	.long	0x5f6
	.byte	0x18
	.uleb128 0x8
	.long	.LASF142
	.byte	0x11
	.value	0x23d
	.byte	0x9
	.long	0xe5
	.byte	0x20
	.uleb128 0x8
	.long	.LASF143
	.byte	0x11
	.value	0x23e
	.byte	0x14
	.long	0x7cd
	.byte	0x28
	.byte	0
	.uleb128 0x4
	.long	0x74e
	.uleb128 0x6
	.byte	0x10
	.byte	0x5
	.long	.LASF144
	.uleb128 0x6
	.byte	0x10
	.byte	0x7
	.long	.LASF145
	.uleb128 0x6
	.byte	0x10
	.byte	0x4
	.long	.LASF146
	.uleb128 0x4
	.long	0x83
	.uleb128 0x18
	.long	0x41
	.byte	0x12
	.byte	0x78
	.byte	0x1
	.long	0x822
	.uleb128 0x13
	.string	"GET"
	.byte	0
	.uleb128 0x13
	.string	"PUT"
	.byte	0x1
	.uleb128 0x7
	.long	.LASF147
	.byte	0x2
	.uleb128 0x13
	.string	"LS"
	.byte	0x3
	.uleb128 0x7
	.long	.LASF148
	.byte	0x4
	.uleb128 0x7
	.long	.LASF149
	.byte	0x5
	.uleb128 0x7
	.long	.LASF150
	.byte	0x6
	.byte	0
	.uleb128 0x16
	.byte	0xd0
	.byte	0x12
	.byte	0xae
	.byte	0xa
	.long	0x8ae
	.uleb128 0x1
	.long	.LASF151
	.byte	0x12
	.byte	0xb0
	.byte	0xa
	.long	0x83
	.byte	0
	.uleb128 0x1
	.long	.LASF152
	.byte	0x12
	.byte	0xb1
	.byte	0xa
	.long	0x83
	.byte	0x4
	.uleb128 0x1
	.long	.LASF153
	.byte	0x12
	.byte	0xb2
	.byte	0x1e
	.long	0x509
	.byte	0x8
	.uleb128 0x1
	.long	.LASF154
	.byte	0x12
	.byte	0xb3
	.byte	0x17
	.long	0x7cd
	.byte	0x88
	.uleb128 0x1
	.long	.LASF155
	.byte	0x12
	.byte	0xb4
	.byte	0xa
	.long	0x83
	.byte	0x90
	.uleb128 0x1
	.long	.LASF156
	.byte	0x12
	.byte	0xb5
	.byte	0xa
	.long	0x83
	.byte	0x94
	.uleb128 0x1
	.long	.LASF157
	.byte	0x12
	.byte	0xb6
	.byte	0xa
	.long	0x83
	.byte	0x98
	.uleb128 0x1
	.long	.LASF158
	.byte	0x12
	.byte	0xb7
	.byte	0xa
	.long	0x83
	.byte	0x9c
	.uleb128 0x1
	.long	.LASF159
	.byte	0x12
	.byte	0xb8
	.byte	0xa
	.long	0x83
	.byte	0xa0
	.uleb128 0x1
	.long	.LASF160
	.byte	0x12
	.byte	0xb9
	.byte	0x16
	.long	0x478
	.byte	0xa8
	.byte	0
	.uleb128 0x3
	.long	.LASF161
	.byte	0x12
	.byte	0xba
	.byte	0x4
	.long	0x822
	.uleb128 0xb
	.long	.LASF162
	.byte	0xc
	.byte	0x1
	.byte	0x1e
	.byte	0x10
	.long	0x8fc
	.uleb128 0x1
	.long	.LASF163
	.byte	0x1
	.byte	0x1f
	.byte	0xd
	.long	0x48a
	.byte	0
	.uleb128 0x1
	.long	.LASF164
	.byte	0x1
	.byte	0x20
	.byte	0xd
	.long	0x48a
	.byte	0x1
	.uleb128 0x1
	.long	.LASF165
	.byte	0x1
	.byte	0x21
	.byte	0xe
	.long	0x4a2
	.byte	0x4
	.uleb128 0x1
	.long	.LASF166
	.byte	0x1
	.byte	0x22
	.byte	0xe
	.long	0x4a2
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	.LASF167
	.byte	0x1
	.byte	0x23
	.byte	0x2
	.long	0x8ba
	.uleb128 0xa
	.long	.LASF168
	.byte	0xd
	.value	0x166
	.byte	0xc
	.long	0x83
	.long	0x91f
	.uleb128 0x2
	.long	0x83
	.byte	0
	.uleb128 0xa
	.long	.LASF169
	.byte	0x6
	.value	0x2d8
	.byte	0xf
	.long	0x2e
	.long	0x945
	.uleb128 0x2
	.long	0x4a
	.uleb128 0x2
	.long	0x2e
	.uleb128 0x2
	.long	0x2e
	.uleb128 0x2
	.long	0x305
	.byte	0
	.uleb128 0x11
	.long	.LASF170
	.byte	0x13
	.byte	0x8a
	.byte	0x10
	.long	0x2f4
	.long	0x96a
	.uleb128 0x2
	.long	0x83
	.uleb128 0x2
	.long	0x484
	.uleb128 0x2
	.long	0x2e
	.uleb128 0x2
	.long	0x83
	.byte	0
	.uleb128 0xa
	.long	.LASF171
	.byte	0x14
	.value	0x197
	.byte	0xf
	.long	0x2e
	.long	0x981
	.uleb128 0x2
	.long	0x2ea
	.byte	0
	.uleb128 0xa
	.long	.LASF172
	.byte	0x6
	.value	0x307
	.byte	0x11
	.long	0x96
	.long	0x998
	.uleb128 0x2
	.long	0x300
	.byte	0
	.uleb128 0xa
	.long	.LASF173
	.byte	0x6
	.value	0x301
	.byte	0xc
	.long	0x83
	.long	0x9b9
	.uleb128 0x2
	.long	0x300
	.uleb128 0x2
	.long	0x96
	.uleb128 0x2
	.long	0x83
	.byte	0
	.uleb128 0x11
	.long	.LASF174
	.byte	0x6
	.byte	0xb8
	.byte	0xc
	.long	0x83
	.long	0x9cf
	.uleb128 0x2
	.long	0x300
	.byte	0
	.uleb128 0x26
	.long	.LASF200
	.byte	0x17
	.value	0x2af
	.byte	0xd
	.long	0x9e2
	.uleb128 0x2
	.long	0x48
	.byte	0
	.uleb128 0xa
	.long	.LASF175
	.byte	0x6
	.value	0x2df
	.byte	0xf
	.long	0x2e
	.long	0xa08
	.uleb128 0x2
	.long	0x484
	.uleb128 0x2
	.long	0x3a
	.uleb128 0x2
	.long	0x3a
	.uleb128 0x2
	.long	0x300
	.byte	0
	.uleb128 0xa
	.long	.LASF176
	.byte	0x6
	.value	0x108
	.byte	0xe
	.long	0x300
	.long	0xa24
	.uleb128 0x2
	.long	0x2ef
	.uleb128 0x2
	.long	0x2ef
	.byte	0
	.uleb128 0xa
	.long	.LASF177
	.byte	0x6
	.value	0x193
	.byte	0xc
	.long	0x83
	.long	0xa41
	.uleb128 0x2
	.long	0x4c0
	.uleb128 0x2
	.long	0x2ef
	.uleb128 0x14
	.byte	0
	.uleb128 0x11
	.long	.LASF178
	.byte	0x13
	.byte	0x91
	.byte	0x10
	.long	0x2f4
	.long	0xa66
	.uleb128 0x2
	.long	0x83
	.uleb128 0x2
	.long	0x48
	.uleb128 0x2
	.long	0x2e
	.uleb128 0x2
	.long	0x83
	.byte	0
	.uleb128 0x11
	.long	.LASF179
	.byte	0x14
	.byte	0x3d
	.byte	0xe
	.long	0x48
	.long	0xa86
	.uleb128 0x2
	.long	0x48
	.uleb128 0x2
	.long	0x83
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0xa
	.long	.LASF180
	.byte	0x6
	.value	0x16b
	.byte	0xc
	.long	0x83
	.long	0xa9e
	.uleb128 0x2
	.long	0x2ea
	.uleb128 0x14
	.byte	0
	.uleb128 0xa
	.long	.LASF181
	.byte	0x6
	.value	0x165
	.byte	0xc
	.long	0x83
	.long	0xabb
	.uleb128 0x2
	.long	0x300
	.uleb128 0x2
	.long	0x2ea
	.uleb128 0x14
	.byte	0
	.uleb128 0x1a
	.long	.LASF183
	.byte	0x15
	.byte	0x22
	.byte	0x10
	.long	0xb5
	.uleb128 0xa
	.long	.LASF182
	.byte	0x14
	.value	0x1a3
	.byte	0xe
	.long	0xe5
	.long	0xade
	.uleb128 0x2
	.long	0x83
	.byte	0
	.uleb128 0x1a
	.long	.LASF184
	.byte	0x16
	.byte	0x25
	.byte	0xd
	.long	0x7e7
	.uleb128 0x11
	.long	.LASF185
	.byte	0x8
	.byte	0x66
	.byte	0xc
	.long	0x83
	.long	0xb14
	.uleb128 0x2
	.long	0x83
	.uleb128 0x2
	.long	0xb19
	.uleb128 0x2
	.long	0xb19
	.uleb128 0x2
	.long	0xb19
	.uleb128 0x2
	.long	0xb23
	.byte	0
	.uleb128 0x4
	.long	0x378
	.uleb128 0xe
	.long	0xb14
	.uleb128 0x4
	.long	0x31d
	.uleb128 0xe
	.long	0xb1e
	.uleb128 0x27
	.long	.LASF201
	.byte	0x1
	.byte	0x37
	.byte	0x7
	.long	0x48
	.quad	.LFB321
	.quad	.LFE321-.LFB321
	.uleb128 0x1
	.byte	0x9c
	.long	0xcce
	.uleb128 0x1b
	.string	"sd"
	.byte	0x37
	.byte	0x21
	.long	0xcce
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61736
	.uleb128 0x5
	.long	.LASF186
	.byte	0x39
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61704
	.uleb128 0x5
	.long	.LASF187
	.byte	0x3a
	.byte	0xa
	.long	0xcd3
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61488
	.uleb128 0x5
	.long	.LASF188
	.byte	0x3b
	.byte	0xc
	.long	0x378
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61616
	.uleb128 0x28
	.long	.LASF202
	.byte	0x1
	.byte	0x3c
	.byte	0x9
	.long	0x83
	.uleb128 0x29
	.long	.LASF203
	.byte	0x1
	.byte	0xae
	.byte	0x1
	.quad	.L21
	.uleb128 0x1c
	.long	.LLRL0
	.uleb128 0x5
	.long	.LASF158
	.byte	0x44
	.byte	0x18
	.long	0x31d
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61632
	.uleb128 0x5
	.long	.LASF189
	.byte	0x47
	.byte	0xd
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61708
	.uleb128 0x1d
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.long	0xc00
	.uleb128 0x15
	.string	"__i"
	.byte	0x40
	.byte	0x9
	.long	0x41
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61720
	.uleb128 0x5
	.long	.LASF190
	.byte	0x40
	.byte	0x9
	.long	0xb14
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61688
	.byte	0
	.uleb128 0x1c
	.long	.LLRL1
	.uleb128 0x5
	.long	.LASF191
	.byte	0x5f
	.byte	0x11
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61716
	.uleb128 0x5
	.long	.LASF192
	.byte	0x60
	.byte	0x1e
	.long	0x8fc
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61660
	.uleb128 0x1d
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.long	0xc5a
	.uleb128 0x5
	.long	.LASF193
	.byte	0x76
	.byte	0x17
	.long	0xe5
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61648
	.uleb128 0x15
	.string	"fs"
	.byte	0x78
	.byte	0x17
	.long	0x300
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61672
	.byte	0
	.uleb128 0x2a
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.uleb128 0x5
	.long	.LASF193
	.byte	0x91
	.byte	0x17
	.long	0xe5
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61696
	.uleb128 0x15
	.string	"fs"
	.byte	0x93
	.byte	0x17
	.long	0x300
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61680
	.uleb128 0x5
	.long	.LASF194
	.byte	0x94
	.byte	0x16
	.long	0xcd3
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30768
	.uleb128 0x5
	.long	.LASF195
	.byte	0x95
	.byte	0x15
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61712
	.uleb128 0x5
	.long	.LASF196
	.byte	0x97
	.byte	0x15
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61700
	.uleb128 0x5
	.long	.LASF192
	.byte	0x99
	.byte	0x22
	.long	0x8fc
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61648
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	0x8ae
	.uleb128 0x9
	.long	0xea
	.long	0xce4
	.uleb128 0x2b
	.long	0x3a
	.value	0x77ff
	.byte	0
	.uleb128 0x2c
	.long	.LASF204
	.byte	0x1
	.byte	0x13
	.byte	0x7
	.long	0x48
	.quad	.LFB320
	.quad	.LFE320-.LFB320
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1b
	.string	"sa"
	.byte	0x13
	.byte	0x24
	.long	0x5f6
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
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0xb
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
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
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
	.uleb128 0x10
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x6
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
	.uleb128 0x12
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3e
	.uleb128 0x21
	.sleb128 7
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x20
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
	.uleb128 0x21
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
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
	.uleb128 0x23
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
	.uleb128 0x24
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x25
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
	.uleb128 0x28
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
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
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
	.uleb128 .LBB8-.Ltext0
	.uleb128 .LBE8-.Ltext0
	.byte	0
.LLRL1:
	.byte	0x4
	.uleb128 .LBB4-.Ltext0
	.uleb128 .LBE4-.Ltext0
	.byte	0x4
	.uleb128 .LBB7-.Ltext0
	.uleb128 .LBE7-.Ltext0
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF180:
	.string	"printf"
.LASF13:
	.string	"__off_t"
.LASF102:
	.string	"MSG_WAITALL"
.LASF78:
	.string	"__size"
.LASF22:
	.string	"_IO_read_ptr"
.LASF34:
	.string	"_chain"
.LASF124:
	.string	"sin6_addr"
.LASF134:
	.string	"__in6_u"
.LASF7:
	.string	"size_t"
.LASF65:
	.string	"__prev"
.LASF79:
	.string	"__align"
.LASF40:
	.string	"_shortbuf"
.LASF168:
	.string	"close"
.LASF8:
	.string	"__uint8_t"
.LASF54:
	.string	"ssize_t"
.LASF197:
	.string	"GNU C17 14.2.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF183:
	.string	"gettid"
.LASF166:
	.string	"data_length"
.LASF110:
	.string	"MSG_WAITFORONE"
.LASF63:
	.string	"long long unsigned int"
.LASF126:
	.string	"in_addr_t"
.LASF154:
	.string	"server_info"
.LASF66:
	.string	"__next"
.LASF153:
	.string	"client_info"
.LASF202:
	.string	"file_fd"
.LASF84:
	.string	"socklen_t"
.LASF200:
	.string	"free"
.LASF43:
	.string	"_codecvt"
.LASF151:
	.string	"sockfd"
.LASF173:
	.string	"fseek"
.LASF55:
	.string	"long long int"
.LASF6:
	.string	"signed char"
.LASF204:
	.string	"get_in_addr"
.LASF35:
	.string	"_fileno"
.LASF101:
	.string	"MSG_EOR"
.LASF23:
	.string	"_IO_read_end"
.LASF131:
	.string	"__u6_addr16"
.LASF12:
	.string	"long int"
.LASF132:
	.string	"__u6_addr32"
.LASF103:
	.string	"MSG_FIN"
.LASF21:
	.string	"_flags"
.LASF137:
	.string	"ai_family"
.LASF18:
	.string	"__ssize_t"
.LASF165:
	.string	"filename_length"
.LASF38:
	.string	"_cur_column"
.LASF178:
	.string	"recv"
.LASF122:
	.string	"sin6_port"
.LASF96:
	.string	"MSG_TRYHARD"
.LASF100:
	.string	"MSG_DONTWAIT"
.LASF42:
	.string	"_offset"
.LASF67:
	.string	"__pthread_list_t"
.LASF187:
	.string	"recieved_buf"
.LASF177:
	.string	"asprintf"
.LASF68:
	.string	"__pthread_mutex_s"
.LASF136:
	.string	"ai_flags"
.LASF11:
	.string	"__uint32_t"
.LASF112:
	.string	"MSG_ZEROCOPY"
.LASF119:
	.string	"sin_zero"
.LASF159:
	.string	"port"
.LASF191:
	.string	"total_bytes"
.LASF97:
	.string	"MSG_CTRUNC"
.LASF51:
	.string	"_IO_marker"
.LASF62:
	.string	"fd_set"
.LASF3:
	.string	"unsigned int"
.LASF128:
	.string	"s_addr"
.LASF46:
	.string	"_freeres_buf"
.LASF156:
	.string	"recvBytes"
.LASF181:
	.string	"fprintf"
.LASF163:
	.string	"command"
.LASF138:
	.string	"ai_socktype"
.LASF2:
	.string	"long unsigned int"
.LASF190:
	.string	"__arr"
.LASF106:
	.string	"MSG_RST"
.LASF77:
	.string	"__data"
.LASF26:
	.string	"_IO_write_ptr"
.LASF57:
	.string	"timeval"
.LASF157:
	.string	"sentBytes"
.LASF155:
	.string	"addr_len"
.LASF95:
	.string	"MSG_DONTROUTE"
.LASF75:
	.string	"__elision"
.LASF5:
	.string	"short unsigned int"
.LASF118:
	.string	"sin_addr"
.LASF53:
	.string	"_IO_wide_data"
.LASF171:
	.string	"strlen"
.LASF30:
	.string	"_IO_save_base"
.LASF172:
	.string	"ftell"
.LASF82:
	.string	"uint16_t"
.LASF107:
	.string	"MSG_ERRQUEUE"
.LASF41:
	.string	"_lock"
.LASF186:
	.string	"numbytes"
.LASF129:
	.string	"in_port_t"
.LASF61:
	.string	"fds_bits"
.LASF71:
	.string	"__owner"
.LASF70:
	.string	"__count"
.LASF116:
	.string	"sin_family"
.LASF188:
	.string	"readfds"
.LASF147:
	.string	"DELETE"
.LASF193:
	.string	"filename"
.LASF58:
	.string	"tv_sec"
.LASF161:
	.string	"sockdetails_t"
.LASF121:
	.string	"sin6_family"
.LASF170:
	.string	"send"
.LASF149:
	.string	"SERVER_INFO"
.LASF27:
	.string	"_IO_write_end"
.LASF47:
	.string	"_prevchain"
.LASF139:
	.string	"ai_protocol"
.LASF162:
	.string	"message_header_s"
.LASF167:
	.string	"message_header_t"
.LASF192:
	.string	"message_header"
.LASF89:
	.string	"sockaddr_storage"
.LASF198:
	.string	"_IO_lock_t"
.LASF203:
	.string	"cleanup"
.LASF56:
	.string	"_IO_FILE"
.LASF150:
	.string	"number_of_command"
.LASF185:
	.string	"select"
.LASF64:
	.string	"__pthread_internal_list"
.LASF140:
	.string	"ai_addrlen"
.LASF48:
	.string	"_mode"
.LASF176:
	.string	"fopen"
.LASF117:
	.string	"sin_port"
.LASF87:
	.string	"sa_family"
.LASF33:
	.string	"_markers"
.LASF145:
	.string	"__int128 unsigned"
.LASF125:
	.string	"sin6_scope_id"
.LASF4:
	.string	"unsigned char"
.LASF184:
	.string	"__errno_location"
.LASF29:
	.string	"_IO_buf_end"
.LASF60:
	.string	"__fd_mask"
.LASF141:
	.string	"ai_addr"
.LASF9:
	.string	"short int"
.LASF113:
	.string	"MSG_FASTOPEN"
.LASF36:
	.string	"_flags2"
.LASF195:
	.string	"total_size"
.LASF94:
	.string	"MSG_PEEK"
.LASF98:
	.string	"MSG_PROXY"
.LASF143:
	.string	"ai_next"
.LASF39:
	.string	"_vtable_offset"
.LASF50:
	.string	"FILE"
.LASF152:
	.string	"client_sock_fd"
.LASF169:
	.string	"fread"
.LASF17:
	.string	"__suseconds_t"
.LASF133:
	.string	"in6_addr"
.LASF59:
	.string	"tv_usec"
.LASF69:
	.string	"__lock"
.LASF148:
	.string	"EXIT"
.LASF164:
	.string	"chunk_id"
.LASF105:
	.string	"MSG_CONFIRM"
.LASF146:
	.string	"long double"
.LASF19:
	.string	"char"
.LASF90:
	.string	"ss_family"
.LASF135:
	.string	"addrinfo"
.LASF20:
	.string	"__socklen_t"
.LASF123:
	.string	"sin6_flowinfo"
.LASF10:
	.string	"__uint16_t"
.LASF130:
	.string	"__u6_addr8"
.LASF111:
	.string	"MSG_BATCH"
.LASF174:
	.string	"fclose"
.LASF99:
	.string	"MSG_TRUNC"
.LASF52:
	.string	"_IO_codecvt"
.LASF14:
	.string	"__off64_t"
.LASF24:
	.string	"_IO_read_base"
.LASF189:
	.string	"select_status"
.LASF32:
	.string	"_IO_save_end"
.LASF144:
	.string	"__int128"
.LASF80:
	.string	"pthread_mutex_t"
.LASF74:
	.string	"__spins"
.LASF16:
	.string	"__time_t"
.LASF85:
	.string	"sa_family_t"
.LASF108:
	.string	"MSG_NOSIGNAL"
.LASF49:
	.string	"_unused2"
.LASF199:
	.string	"stderr"
.LASF179:
	.string	"memset"
.LASF194:
	.string	"transmit_buf"
.LASF120:
	.string	"sockaddr_in6"
.LASF92:
	.string	"__ss_align"
.LASF86:
	.string	"sockaddr"
.LASF115:
	.string	"sockaddr_in"
.LASF81:
	.string	"uint8_t"
.LASF72:
	.string	"__nusers"
.LASF31:
	.string	"_IO_backup_base"
.LASF109:
	.string	"MSG_MORE"
.LASF91:
	.string	"__ss_padding"
.LASF175:
	.string	"fwrite"
.LASF88:
	.string	"sa_data"
.LASF45:
	.string	"_freeres_list"
.LASF76:
	.string	"__list"
.LASF142:
	.string	"ai_canonname"
.LASF44:
	.string	"_wide_data"
.LASF201:
	.string	"handle_req"
.LASF73:
	.string	"__kind"
.LASF104:
	.string	"MSG_SYN"
.LASF37:
	.string	"_old_offset"
.LASF158:
	.string	"timeout"
.LASF182:
	.string	"strerror"
.LASF160:
	.string	"lock"
.LASF25:
	.string	"_IO_write_base"
.LASF114:
	.string	"MSG_CMSG_CLOEXEC"
.LASF28:
	.string	"_IO_buf_base"
.LASF83:
	.string	"uint32_t"
.LASF93:
	.string	"MSG_OOB"
.LASF15:
	.string	"__pid_t"
.LASF127:
	.string	"in_addr"
.LASF196:
	.string	"file_size"
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
