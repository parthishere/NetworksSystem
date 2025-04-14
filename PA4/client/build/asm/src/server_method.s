	.file	"server_method.c"
	.text
.Ltext0:
	.file 0 "/home/parth/Work/All_data/university/Network System/Assignments/PA4/client" "src/server_method.c"
	.section	.rodata
.LC0:
	.string	"ls"
.LC1:
	.string	"list"
.LC2:
	.string	"get"
.LC3:
	.string	"put"
.LC4:
	.string	"exit"
.LC5:
	.string	"delete"
.LC6:
	.string	"serverinfo"
.LC7:
	.string	"help"
	.align 8
.LC8:
	.string	"\033[31m[-] Wrong command ! \n\r\033[0m"
	.text
	.globl	whichcmd
	.type	whichcmd, @function
whichcmd:
.LFB320:
	.file 1 "src/server_method.c"
	.loc 1 24 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	.loc 1 25 11
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	.loc 1 26 9
	movq	-8(%rbp), %rax
	movl	$2, %edx
	leaq	.LC0(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 26 8 discriminator 1
	testl	%eax, %eax
	je	.L2
	.loc 1 26 50 discriminator 1
	movq	-8(%rbp), %rax
	movl	$4, %edx
	leaq	.LC1(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 26 47 discriminator 1
	testl	%eax, %eax
	jne	.L3
.L2:
	.loc 1 28 16
	movl	$3, %eax
	jmp	.L4
.L3:
	.loc 1 30 14
	movq	-8(%rbp), %rax
	movl	$3, %edx
	leaq	.LC2(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 30 13 discriminator 1
	testl	%eax, %eax
	jne	.L5
	.loc 1 30 57 discriminator 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 30 54 discriminator 1
	cmpq	$3, %rax
	jne	.L5
	.loc 1 32 11
	cmpl	$3, -20(%rbp)
	jne	.L14
	.loc 1 33 19
	movq	-32(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 34 16
	movl	$0, %eax
	jmp	.L4
.L5:
	.loc 1 36 14
	movq	-8(%rbp), %rax
	movl	$3, %edx
	leaq	.LC3(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 36 13 discriminator 1
	testl	%eax, %eax
	jne	.L8
	.loc 1 36 57 discriminator 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 36 54 discriminator 1
	cmpq	$3, %rax
	jne	.L8
	.loc 1 38 11
	cmpl	$3, -20(%rbp)
	jne	.L15
	.loc 1 39 19
	movq	-32(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 40 16
	movl	$1, %eax
	jmp	.L4
.L8:
	.loc 1 42 14
	movq	-8(%rbp), %rax
	movl	$4, %edx
	leaq	.LC4(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 42 13 discriminator 1
	testl	%eax, %eax
	jne	.L10
	.loc 1 42 59 discriminator 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 42 56 discriminator 1
	cmpq	$4, %rax
	jne	.L10
	.loc 1 44 16
	movl	$4, %eax
	jmp	.L4
.L10:
	.loc 1 46 14
	movq	-8(%rbp), %rax
	movl	$6, %edx
	leaq	.LC5(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 46 13 discriminator 1
	testl	%eax, %eax
	jne	.L11
	.loc 1 46 63 discriminator 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 46 60 discriminator 1
	cmpq	$6, %rax
	jne	.L11
	.loc 1 48 11
	cmpl	$3, -20(%rbp)
	jne	.L16
	.loc 1 49 19
	movq	-32(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 50 16
	movl	$2, %eax
	jmp	.L4
.L11:
	.loc 1 52 14
	movq	-8(%rbp), %rax
	movl	$10, %edx
	leaq	.LC6(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 52 13 discriminator 1
	testl	%eax, %eax
	jne	.L13
	.loc 1 52 71 discriminator 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 52 68 discriminator 1
	cmpq	$10, %rax
	jne	.L13
	.loc 1 54 16
	movl	$5, %eax
	jmp	.L4
.L13:
	.loc 1 56 14
	movq	-8(%rbp), %rax
	movl	$4, %edx
	leaq	.LC7(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 56 13 discriminator 1
	testl	%eax, %eax
	jne	.L17
	.loc 1 56 59 discriminator 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 56 56 discriminator 1
	cmpq	$4, %rax
	jne	.L17
	.loc 1 58 16
	movl	$6, %eax
	jmp	.L4
.L14:
	.loc 1 32 23
	nop
	jmp	.L7
.L15:
	.loc 1 38 23
	nop
	jmp	.L7
.L16:
	.loc 1 48 23
	nop
	jmp	.L7
.L17:
	.loc 1 63 1
	nop
.L7:
	.loc 1 64 5
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 65 12
	movl	$-1, %eax
.L4:
	.loc 1 66 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE320:
	.size	whichcmd, .-whichcmd
	.globl	list_files
	.type	list_files, @function
list_files:
.LFB321:
	.loc 1 85 1
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
	subq	$2096, %rsp
	movq	%rdi, -30760(%rbp)
	.loc 1 85 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 90 9
	movl	$0, -30744(%rbp)
	.loc 1 91 9
	movl	$0, -30740(%rbp)
	.loc 1 96 1
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L19
	call	__stack_chk_fail@PLT
.L19:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE321:
	.size	list_files, .-list_files
	.section	.rodata
.LC9:
	.string	"\n\nGET\n"
	.text
	.globl	get_file
	.type	get_file, @function
get_file:
.LFB322:
	.loc 1 114 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	-28672(%rsp), %r11
.LPSRL1:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL1
	subq	$2096, %rsp
	movq	%rdi, -30760(%rbp)
	movq	%rsi, -30768(%rbp)
	.loc 1 114 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 116 5
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 121 9
	movl	$0, -30744(%rbp)
	.loc 1 122 9
	movl	$0, -30740(%rbp)
	.loc 1 127 1
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L21
	call	__stack_chk_fail@PLT
.L21:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE322:
	.size	get_file, .-get_file
	.globl	put_file_file
	.type	put_file_file, @function
put_file_file:
.LFB323:
	.loc 1 146 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movq	%rdi, -120(%rbp)
	movq	%rsi, -128(%rbp)
	.loc 1 146 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 152 12
	movl	$0, %eax
	.loc 1 153 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L24
	call	__stack_chk_fail@PLT
.L24:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE323:
	.size	put_file_file, .-put_file_file
	.section	.rodata
.LC10:
	.string	"\n\nDELETE\n"
	.align 8
.LC11:
	.string	"\033[32m\n\n[+] File: \"%s\" deleted \n\n"
	.text
	.globl	delete_file
	.type	delete_file, @function
delete_file:
.LFB324:
	.loc 1 167 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	-28672(%rsp), %r11
.LPSRL2:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL2
	subq	$2080, %rsp
	movq	%rdi, -30744(%rbp)
	movq	%rsi, -30752(%rbp)
	.loc 1 167 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 169 5
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 173 5
	leaq	-30736(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 175 5
	movq	-30752(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 177 1
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L26
	call	__stack_chk_fail@PLT
.L26:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE324:
	.size	delete_file, .-delete_file
	.globl	cleanup_resources
	.type	cleanup_resources, @function
cleanup_resources:
.LFB325:
	.loc 1 188 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	-28672(%rsp), %r11
.LPSRL3:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL3
	subq	$2080, %rsp
	movq	%rdi, -30744(%rbp)
	.loc 1 188 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 192 5
	leaq	-30736(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 195 1
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L28
	call	__stack_chk_fail@PLT
.L28:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE325:
	.size	cleanup_resources, .-cleanup_resources
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/14/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.file 7 "/usr/include/unistd.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/sockaddr.h"
	.file 9 "/usr/include/x86_64-linux-gnu/bits/socket.h"
	.file 10 "/usr/include/netdb.h"
	.file 11 "./common.h"
	.file 12 "/usr/include/stdio.h"
	.file 13 "/usr/include/string.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x66d
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x12
	.long	.LASF84
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x5
	.long	.LASF10
	.byte	0x2
	.byte	0xd6
	.byte	0x17
	.long	0x3a
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x13
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x4
	.long	0x77
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF9
	.uleb128 0x14
	.long	0x77
	.uleb128 0x5
	.long	.LASF11
	.byte	0x3
	.byte	0xd2
	.byte	0x17
	.long	0x41
	.uleb128 0x4
	.long	0x7e
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF12
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF13
	.uleb128 0xc
	.long	.LASF17
	.byte	0x10
	.byte	0x4
	.byte	0x33
	.byte	0x10
	.long	0xca
	.uleb128 0x1
	.long	.LASF14
	.byte	0x4
	.byte	0x35
	.byte	0x23
	.long	0xca
	.byte	0
	.uleb128 0x1
	.long	.LASF15
	.byte	0x4
	.byte	0x36
	.byte	0x23
	.long	0xca
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.long	0xa2
	.uleb128 0x5
	.long	.LASF16
	.byte	0x4
	.byte	0x37
	.byte	0x3
	.long	0xa2
	.uleb128 0xc
	.long	.LASF18
	.byte	0x28
	.byte	0x5
	.byte	0x16
	.byte	0x8
	.long	0x151
	.uleb128 0x1
	.long	.LASF19
	.byte	0x5
	.byte	0x18
	.byte	0x7
	.long	0x64
	.byte	0
	.uleb128 0x1
	.long	.LASF20
	.byte	0x5
	.byte	0x19
	.byte	0x10
	.long	0x41
	.byte	0x4
	.uleb128 0x1
	.long	.LASF21
	.byte	0x5
	.byte	0x1a
	.byte	0x7
	.long	0x64
	.byte	0x8
	.uleb128 0x1
	.long	.LASF22
	.byte	0x5
	.byte	0x1c
	.byte	0x10
	.long	0x41
	.byte	0xc
	.uleb128 0x1
	.long	.LASF23
	.byte	0x5
	.byte	0x20
	.byte	0x7
	.long	0x64
	.byte	0x10
	.uleb128 0x1
	.long	.LASF24
	.byte	0x5
	.byte	0x22
	.byte	0x9
	.long	0x5d
	.byte	0x14
	.uleb128 0x1
	.long	.LASF25
	.byte	0x5
	.byte	0x23
	.byte	0x9
	.long	0x5d
	.byte	0x16
	.uleb128 0x1
	.long	.LASF26
	.byte	0x5
	.byte	0x24
	.byte	0x14
	.long	0xcf
	.byte	0x18
	.byte	0
	.uleb128 0x15
	.byte	0x28
	.byte	0x6
	.byte	0x43
	.byte	0x9
	.long	0x17c
	.uleb128 0xf
	.long	.LASF27
	.byte	0x45
	.byte	0x1c
	.long	0xdb
	.uleb128 0xf
	.long	.LASF28
	.byte	0x46
	.byte	0x8
	.long	0x17c
	.uleb128 0xf
	.long	.LASF29
	.byte	0x47
	.byte	0xc
	.long	0x6b
	.byte	0
	.uleb128 0x8
	.long	0x77
	.long	0x18c
	.uleb128 0xd
	.long	0x3a
	.byte	0x27
	.byte	0
	.uleb128 0x5
	.long	.LASF30
	.byte	0x6
	.byte	0x48
	.byte	0x3
	.long	0x151
	.uleb128 0x16
	.long	.LASF31
	.byte	0x7
	.value	0x112
	.byte	0x15
	.long	0x83
	.uleb128 0x4
	.long	0x72
	.uleb128 0x5
	.long	.LASF32
	.byte	0x8
	.byte	0x1c
	.byte	0x1c
	.long	0x4f
	.uleb128 0xc
	.long	.LASF33
	.byte	0x10
	.byte	0x9
	.byte	0xb8
	.byte	0x27
	.long	0x1de
	.uleb128 0x1
	.long	.LASF34
	.byte	0x9
	.byte	0xba
	.byte	0x5
	.long	0x1aa
	.byte	0
	.uleb128 0x1
	.long	.LASF35
	.byte	0x9
	.byte	0xbb
	.byte	0xa
	.long	0x1de
	.byte	0x2
	.byte	0
	.uleb128 0x8
	.long	0x77
	.long	0x1ee
	.uleb128 0xd
	.long	0x3a
	.byte	0xd
	.byte	0
	.uleb128 0x4
	.long	0x1b6
	.uleb128 0x17
	.long	.LASF36
	.byte	0x30
	.byte	0xa
	.value	0x235
	.byte	0x8
	.long	0x26a
	.uleb128 0x6
	.long	.LASF37
	.value	0x237
	.byte	0x7
	.long	0x64
	.byte	0
	.uleb128 0x6
	.long	.LASF38
	.value	0x238
	.byte	0x7
	.long	0x64
	.byte	0x4
	.uleb128 0x6
	.long	.LASF39
	.value	0x239
	.byte	0x7
	.long	0x64
	.byte	0x8
	.uleb128 0x6
	.long	.LASF40
	.value	0x23a
	.byte	0x7
	.long	0x64
	.byte	0xc
	.uleb128 0x6
	.long	.LASF41
	.value	0x23b
	.byte	0xd
	.long	0x198
	.byte	0x10
	.uleb128 0x6
	.long	.LASF42
	.value	0x23c
	.byte	0x14
	.long	0x1ee
	.byte	0x18
	.uleb128 0x6
	.long	.LASF43
	.value	0x23d
	.byte	0x9
	.long	0x72
	.byte	0x20
	.uleb128 0x6
	.long	.LASF44
	.value	0x23e
	.byte	0x14
	.long	0x26a
	.byte	0x28
	.byte	0
	.uleb128 0x4
	.long	0x1f3
	.uleb128 0x2
	.byte	0x10
	.byte	0x5
	.long	.LASF45
	.uleb128 0x2
	.byte	0x10
	.byte	0x7
	.long	.LASF46
	.uleb128 0x2
	.byte	0x10
	.byte	0x4
	.long	.LASF47
	.uleb128 0x18
	.byte	0x7
	.byte	0x4
	.long	0x41
	.byte	0xb
	.byte	0x77
	.byte	0x1
	.long	0x2c2
	.uleb128 0x10
	.string	"GET"
	.byte	0
	.uleb128 0x10
	.string	"PUT"
	.byte	0x1
	.uleb128 0x9
	.long	.LASF48
	.byte	0x2
	.uleb128 0x10
	.string	"LS"
	.byte	0x3
	.uleb128 0x9
	.long	.LASF49
	.byte	0x4
	.uleb128 0x9
	.long	.LASF50
	.byte	0x5
	.uleb128 0x9
	.long	.LASF51
	.byte	0x6
	.uleb128 0x9
	.long	.LASF52
	.byte	0x7
	.byte	0
	.uleb128 0x5
	.long	.LASF53
	.byte	0xb
	.byte	0x80
	.byte	0x3
	.long	0x284
	.uleb128 0xc
	.long	.LASF54
	.byte	0x28
	.byte	0xb
	.byte	0xa3
	.byte	0x10
	.long	0x31d
	.uleb128 0x1
	.long	.LASF55
	.byte	0xb
	.byte	0xa4
	.byte	0x9
	.long	0x64
	.byte	0
	.uleb128 0x1
	.long	.LASF56
	.byte	0xb
	.byte	0xa5
	.byte	0xb
	.long	0x72
	.byte	0x8
	.uleb128 0x1
	.long	.LASF57
	.byte	0xb
	.byte	0xa6
	.byte	0xb
	.long	0x72
	.byte	0x10
	.uleb128 0x1
	.long	.LASF58
	.byte	0xb
	.byte	0xa7
	.byte	0x9
	.long	0x64
	.byte	0x18
	.uleb128 0x1
	.long	.LASF59
	.byte	0xb
	.byte	0xa8
	.byte	0x1d
	.long	0x31d
	.byte	0x20
	.byte	0
	.uleb128 0x4
	.long	0x2ce
	.uleb128 0x5
	.long	.LASF54
	.byte	0xb
	.byte	0xa9
	.byte	0x2
	.long	0x2ce
	.uleb128 0x19
	.byte	0x58
	.byte	0xb
	.byte	0xb2
	.byte	0x9
	.long	0x393
	.uleb128 0x1
	.long	.LASF60
	.byte	0xb
	.byte	0xb4
	.byte	0x9
	.long	0x64
	.byte	0
	.uleb128 0x1
	.long	.LASF61
	.byte	0xb
	.byte	0xb5
	.byte	0xb
	.long	0x72
	.byte	0x8
	.uleb128 0x1
	.long	.LASF62
	.byte	0xb
	.byte	0xb6
	.byte	0x16
	.long	0x393
	.byte	0x10
	.uleb128 0x1
	.long	.LASF63
	.byte	0xb
	.byte	0xb7
	.byte	0x9
	.long	0x64
	.byte	0x18
	.uleb128 0x1
	.long	.LASF64
	.byte	0xb
	.byte	0xb8
	.byte	0x16
	.long	0x26a
	.byte	0x20
	.uleb128 0x1
	.long	.LASF65
	.byte	0xb
	.byte	0xb9
	.byte	0x9
	.long	0x64
	.byte	0x28
	.uleb128 0x1
	.long	.LASF66
	.byte	0xb
	.byte	0xba
	.byte	0x15
	.long	0x18c
	.byte	0x30
	.byte	0
	.uleb128 0x4
	.long	0x322
	.uleb128 0x5
	.long	.LASF67
	.byte	0xb
	.byte	0xbb
	.byte	0x3
	.long	0x32e
	.uleb128 0x11
	.long	.LASF68
	.byte	0xc
	.value	0x16b
	.byte	0xc
	.long	0x64
	.long	0x3bc
	.uleb128 0xa
	.long	0x8f
	.uleb128 0x1a
	.byte	0
	.uleb128 0x11
	.long	.LASF69
	.byte	0xd
	.value	0x197
	.byte	0xf
	.long	0x2e
	.long	0x3d3
	.uleb128 0xa
	.long	0x8f
	.byte	0
	.uleb128 0x1b
	.long	.LASF70
	.byte	0xd
	.byte	0x9f
	.byte	0xc
	.long	0x64
	.long	0x3f3
	.uleb128 0xa
	.long	0x8f
	.uleb128 0xa
	.long	0x8f
	.uleb128 0xa
	.long	0x3a
	.byte	0
	.uleb128 0xe
	.long	.LASF71
	.byte	0xbb
	.quad	.LFB325
	.quad	.LFE325-.LFB325
	.uleb128 0x1
	.byte	0x9c
	.long	0x42f
	.uleb128 0xb
	.string	"sd"
	.byte	0xbb
	.byte	0x27
	.long	0x42f
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30760
	.uleb128 0x3
	.long	.LASF74
	.byte	0xbe
	.byte	0xa
	.long	0x434
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30752
	.byte	0
	.uleb128 0x4
	.long	0x398
	.uleb128 0x8
	.long	0x77
	.long	0x445
	.uleb128 0x1c
	.long	0x3a
	.value	0x77ff
	.byte	0
	.uleb128 0xe
	.long	.LASF72
	.byte	0xa6
	.quad	.LFB324
	.quad	.LFE324-.LFB324
	.uleb128 0x1
	.byte	0x9c
	.long	0x4a1
	.uleb128 0xb
	.string	"sd"
	.byte	0xa6
	.byte	0x21
	.long	0x42f
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30760
	.uleb128 0x7
	.long	.LASF73
	.byte	0xa6
	.byte	0x2b
	.long	0x72
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30768
	.uleb128 0x3
	.long	.LASF74
	.byte	0xab
	.byte	0xa
	.long	0x434
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30752
	.uleb128 0x3
	.long	.LASF75
	.byte	0xac
	.byte	0xa
	.long	0x434
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30752
	.byte	0
	.uleb128 0x1d
	.long	.LASF85
	.byte	0x1
	.byte	0x91
	.byte	0x5
	.long	0x64
	.quad	.LFB323
	.quad	.LFE323-.LFB323
	.uleb128 0x1
	.byte	0x9c
	.long	0x4f0
	.uleb128 0xb
	.string	"sd"
	.byte	0x91
	.byte	0x22
	.long	0x42f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x7
	.long	.LASF74
	.byte	0x91
	.byte	0x2c
	.long	0x72
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x3
	.long	.LASF76
	.byte	0x95
	.byte	0xa
	.long	0x4f0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.byte	0
	.uleb128 0x8
	.long	0x77
	.long	0x500
	.uleb128 0xd
	.long	0x3a
	.byte	0x63
	.byte	0
	.uleb128 0xe
	.long	.LASF77
	.byte	0x71
	.quad	.LFB322
	.quad	.LFE322-.LFB322
	.uleb128 0x1
	.byte	0x9c
	.long	0x58c
	.uleb128 0xb
	.string	"sd"
	.byte	0x71
	.byte	0x1e
	.long	0x42f
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30776
	.uleb128 0x7
	.long	.LASF73
	.byte	0x71
	.byte	0x28
	.long	0x72
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30784
	.uleb128 0x3
	.long	.LASF74
	.byte	0x77
	.byte	0xa
	.long	0x434
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30752
	.uleb128 0x3
	.long	.LASF75
	.byte	0x78
	.byte	0xa
	.long	0x434
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30752
	.uleb128 0x3
	.long	.LASF78
	.byte	0x79
	.byte	0x9
	.long	0x64
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30760
	.uleb128 0x3
	.long	.LASF79
	.byte	0x7a
	.byte	0x9
	.long	0x64
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30756
	.uleb128 0x3
	.long	.LASF76
	.byte	0x7b
	.byte	0xa
	.long	0x58c
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30752
	.byte	0
	.uleb128 0x8
	.long	0x77
	.long	0x59c
	.uleb128 0xd
	.long	0x3a
	.byte	0x3b
	.byte	0
	.uleb128 0xe
	.long	.LASF80
	.byte	0x54
	.quad	.LFB321
	.quad	.LFE321-.LFB321
	.uleb128 0x1
	.byte	0x9c
	.long	0x608
	.uleb128 0xb
	.string	"sd"
	.byte	0x54
	.byte	0x20
	.long	0x42f
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30776
	.uleb128 0x3
	.long	.LASF74
	.byte	0x58
	.byte	0xa
	.long	0x434
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30752
	.uleb128 0x3
	.long	.LASF75
	.byte	0x59
	.byte	0xa
	.long	0x434
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30752
	.uleb128 0x3
	.long	.LASF78
	.byte	0x5a
	.byte	0x9
	.long	0x64
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30760
	.uleb128 0x3
	.long	.LASF79
	.byte	0x5b
	.byte	0x9
	.long	0x64
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30756
	.byte	0
	.uleb128 0x1e
	.long	.LASF81
	.byte	0x1
	.byte	0x17
	.byte	0xc
	.long	0x2c2
	.quad	.LFB320
	.quad	.LFE320-.LFB320
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x7
	.long	.LASF82
	.byte	0x17
	.byte	0x19
	.long	0x64
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x7
	.long	.LASF83
	.byte	0x17
	.byte	0x25
	.long	0x1a5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x7
	.long	.LASF73
	.byte	0x17
	.byte	0x34
	.long	0x1a5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1f
	.string	"cmd"
	.byte	0x1
	.byte	0x19
	.byte	0xb
	.long	0x72
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x20
	.long	.LASF86
	.byte	0x1
	.byte	0x3f
	.byte	0x1
	.quad	.L7
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
	.uleb128 0x3
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
	.uleb128 0x6
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 10
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
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
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
	.uleb128 0xf
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 6
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
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
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
	.byte	0
	.byte	0
	.uleb128 0x1f
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
.LASF71:
	.string	"cleanup_resources"
.LASF81:
	.string	"whichcmd"
.LASF11:
	.string	"__socklen_t"
.LASF27:
	.string	"__data"
.LASF58:
	.string	"dfsno"
.LASF53:
	.string	"commands_t"
.LASF80:
	.string	"list_files"
.LASF10:
	.string	"size_t"
.LASF84:
	.string	"GNU C17 14.2.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF54:
	.string	"serverDetails_t"
.LASF17:
	.string	"__pthread_internal_list"
.LASF74:
	.string	"recieve_buffer"
.LASF73:
	.string	"filename"
.LASF75:
	.string	"transmit_buffer"
.LASF30:
	.string	"pthread_mutex_t"
.LASF45:
	.string	"__int128"
.LASF20:
	.string	"__count"
.LASF70:
	.string	"strncmp"
.LASF49:
	.string	"EXIT"
.LASF29:
	.string	"__align"
.LASF48:
	.string	"DELETE"
.LASF63:
	.string	"number_of_servers"
.LASF14:
	.string	"__prev"
.LASF32:
	.string	"sa_family_t"
.LASF7:
	.string	"short int"
.LASF15:
	.string	"__next"
.LASF78:
	.string	"current_count"
.LASF79:
	.string	"retry_count"
.LASF3:
	.string	"unsigned int"
.LASF23:
	.string	"__kind"
.LASF46:
	.string	"__int128 unsigned"
.LASF39:
	.string	"ai_socktype"
.LASF60:
	.string	"sockfd"
.LASF8:
	.string	"long int"
.LASF68:
	.string	"printf"
.LASF50:
	.string	"SERVER_INFO"
.LASF38:
	.string	"ai_family"
.LASF47:
	.string	"long double"
.LASF4:
	.string	"unsigned char"
.LASF82:
	.string	"argc"
.LASF31:
	.string	"socklen_t"
.LASF6:
	.string	"signed char"
.LASF13:
	.string	"long long unsigned int"
.LASF36:
	.string	"addrinfo"
.LASF52:
	.string	"number_of_command"
.LASF44:
	.string	"ai_next"
.LASF83:
	.string	"argv"
.LASF35:
	.string	"sa_data"
.LASF28:
	.string	"__size"
.LASF5:
	.string	"short unsigned int"
.LASF12:
	.string	"long long int"
.LASF9:
	.string	"char"
.LASF22:
	.string	"__nusers"
.LASF69:
	.string	"strlen"
.LASF56:
	.string	"server_port"
.LASF66:
	.string	"lock"
.LASF62:
	.string	"servers_details"
.LASF72:
	.string	"delete_file"
.LASF18:
	.string	"__pthread_mutex_s"
.LASF2:
	.string	"long unsigned int"
.LASF25:
	.string	"__elision"
.LASF67:
	.string	"sockDetails_t"
.LASF43:
	.string	"ai_canonname"
.LASF16:
	.string	"__pthread_list_t"
.LASF37:
	.string	"ai_flags"
.LASF76:
	.string	"whole_filename"
.LASF34:
	.string	"sa_family"
.LASF21:
	.string	"__owner"
.LASF26:
	.string	"__list"
.LASF55:
	.string	"client_sock_fd"
.LASF41:
	.string	"ai_addrlen"
.LASF86:
	.string	"error"
.LASF77:
	.string	"get_file"
.LASF33:
	.string	"sockaddr"
.LASF64:
	.string	"connect_to_info"
.LASF24:
	.string	"__spins"
.LASF57:
	.string	"server_ip"
.LASF51:
	.string	"HELP"
.LASF42:
	.string	"ai_addr"
.LASF85:
	.string	"put_file_file"
.LASF61:
	.string	"command"
.LASF65:
	.string	"timeout"
.LASF59:
	.string	"next"
.LASF19:
	.string	"__lock"
.LASF40:
	.string	"ai_protocol"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"src/server_method.c"
.LASF1:
	.string	"/home/parth/Work/All_data/university/Network System/Assignments/PA4/client"
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
