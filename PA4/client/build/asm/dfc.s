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
	.string	" "
.LC4:
	.string	"dfs%d"
.LC5:
	.string	":"
.LC6:
	.string	"Token %s %s\n\n"
	.text
	.globl	read_server_conf
	.type	read_server_conf, @function
read_server_conf:
.LFB321:
	.loc 1 176 41
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1120, %rsp
	movq	%rdi, -1112(%rbp)
	.loc 1 176 41
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 177 16
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -1072(%rbp)
	.loc 1 180 9
	movl	$0, -1092(%rbp)
	.loc 1 183 22
	movq	$0, -1064(%rbp)
	.loc 1 184 22
	movq	$0, -1080(%rbp)
	.loc 1 185 10
	jmp	.L11
.L13:
.LBB3:
	.loc 1 188 19
	movl	$40, %edi
	call	malloc@PLT
	movq	%rax, -1064(%rbp)
	.loc 1 189 31
	movq	-1112(%rbp), %rax
	movq	$0, 8(%rax)
	.loc 1 189 14
	movq	-1112(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 189 11
	testq	%rax, %rax
	je	.L12
	.loc 1 190 32
	movq	-1112(%rbp), %rax
	movq	-1064(%rbp), %rdx
	movq	%rdx, 8(%rax)
.L12:
	.loc 1 193 26
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, -1056(%rbp)
	.loc 1 194 21
	leaq	-1088(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	leaq	.LC3(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strtok_r@PLT
	movq	%rax, -1048(%rbp)
	.loc 1 196 15
	leaq	-1088(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC3(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok_r@PLT
	movq	%rax, -1048(%rbp)
	.loc 1 197 9
	leaq	-1096(%rbp), %rdx
	movq	-1048(%rbp), %rax
	leaq	.LC4(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc23_sscanf@PLT
	.loc 1 198 15
	leaq	-1088(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC5(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok_r@PLT
	movq	%rax, -1048(%rbp)
	.loc 1 199 9
	movq	-1088(%rbp), %rdx
	movq	-1048(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 201 32
	movq	-1088(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	.loc 1 201 30 discriminator 1
	movq	-1064(%rbp), %rax
	movq	%rdx, 8(%rax)
	.loc 1 202 30
	movq	-1048(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	.loc 1 202 28 discriminator 1
	movq	-1064(%rbp), %rax
	movq	%rdx, 16(%rax)
	.loc 1 203 23
	movq	-1064(%rbp), %rax
	movq	-1080(%rbp), %rdx
	movq	%rdx, 32(%rax)
	.loc 1 204 24
	movl	-1096(%rbp), %edx
	movq	-1064(%rbp), %rax
	movl	%edx, 24(%rax)
	.loc 1 205 11
	movq	-1112(%rbp), %rax
	movl	16(%rax), %eax
	.loc 1 205 30
	leal	1(%rax), %edx
	movq	-1112(%rbp), %rax
	movl	%edx, 16(%rax)
	.loc 1 207 14
	movq	-1064(%rbp), %rax
	movq	%rax, -1080(%rbp)
	.loc 1 209 9
	movq	-1056(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 210 10
	addl	$1, -1092(%rbp)
.L11:
.LBE3:
	.loc 1 185 11
	movq	-1072(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	movl	$1023, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	.loc 1 185 43 discriminator 1
	testq	%rax, %rax
	jne	.L13
	.loc 1 214 5
	movq	-1072(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	.loc 1 215 1
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
.LFE321:
	.size	read_server_conf, .-read_server_conf
	.section	.rodata
	.align 8
.LC7:
	.string	"\033[31m[-] You messed up, command is ./dfc <COMMAND> <FILENAME>\n\033[0m"
	.text
	.globl	main
	.type	main, @function
main:
.LFB322:
	.loc 1 233 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movl	%edi, -100(%rbp)
	movq	%rsi, -112(%rbp)
	.loc 1 233 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 236 5
	leaq	-96(%rbp), %rax
	addq	$40, %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_mutex_init@PLT
	.loc 1 249 8
	cmpl	$3, -100(%rbp)
	je	.L16
	.loc 1 251 9
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 252 9
	movl	$0, %eax
	call	print_menu
	.loc 1 254 9
	movl	$1, %edi
	call	exit@PLT
.L16:
	.loc 1 257 5
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	read_server_conf
	.loc 1 332 12
	movl	$0, %eax
	.loc 1 333 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L18
	call	__stack_chk_fail@PLT
.L18:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE322:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC8:
	.string	"\033[33m\n\nThis client can support distributed FTP\n"
	.align 8
.LC9:
	.string	"Currently this program can support following commands "
	.align 8
.LC10:
	.string	"get <filename>   : Get the file name in server and print the file"
	.align 8
.LC11:
	.string	"put <filename>   : if filename does not exists on server, create one. "
	.align 8
.LC12:
	.string	"delete <filename>: if filename does exists on server, delete that file"
	.align 8
.LC13:
	.string	"ls               : get the list of all the files/chunks in all server and print it"
	.align 8
.LC14:
	.string	"exit             : exit from the client program and free the resources in client and server"
	.align 8
.LC15:
	.string	"server info      : get to know server info"
	.align 8
.LC16:
	.string	"help             : print this help "
.LC17:
	.string	"\n\033[0m"
	.text
	.globl	print_menu
	.type	print_menu, @function
print_menu:
.LFB323:
	.loc 1 346 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 348 5
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 349 5
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 351 5
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 352 5
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 353 5
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 354 5
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 355 5
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 356 5
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 357 5
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 358 5
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 359 1
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE323:
	.size	print_menu, .-print_menu
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
	.file 18 "/usr/include/string.h"
	.file 19 "/usr/include/openssl/evp.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x9c5
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x19
	.long	.LASF136
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x9
	.long	0x96
	.long	0xbe
	.uleb128 0xb
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
	.uleb128 0x1c
	.long	.LASF137
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0xc
	.long	.LASF44
	.uleb128 0x3
	.long	0x259
	.uleb128 0x3
	.long	0xbe
	.uleb128 0x9
	.long	0x96
	.long	0x278
	.uleb128 0xb
	.long	0x3a
	.byte	0
	.byte	0
	.uleb128 0x3
	.long	0x251
	.uleb128 0xc
	.long	.LASF45
	.uleb128 0x3
	.long	0x27d
	.uleb128 0xc
	.long	.LASF46
	.uleb128 0x3
	.long	0x287
	.uleb128 0x3
	.long	0x263
	.uleb128 0x9
	.long	0x96
	.long	0x2a6
	.uleb128 0xb
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
	.uleb128 0x9
	.long	0x96
	.long	0x3df
	.uleb128 0xb
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
	.uleb128 0x1d
	.uleb128 0x1e
	.long	.LASF68
	.byte	0x9
	.value	0x112
	.byte	0x15
	.long	0xa2
	.uleb128 0x3
	.long	0x8c
	.uleb128 0xf
	.long	0x3fe
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
	.long	0x43c
	.uleb128 0x1
	.long	.LASF71
	.byte	0xb
	.byte	0xba
	.byte	0x5
	.long	0x408
	.byte	0
	.uleb128 0x1
	.long	.LASF72
	.byte	0xb
	.byte	0xbb
	.byte	0xa
	.long	0x43c
	.byte	0x2
	.byte	0
	.uleb128 0x9
	.long	0x96
	.long	0x44c
	.uleb128 0xb
	.long	0x3a
	.byte	0xd
	.byte	0
	.uleb128 0x3
	.long	0x414
	.uleb128 0x1f
	.long	.LASF73
	.byte	0x30
	.byte	0xc
	.value	0x235
	.byte	0x8
	.long	0x4c8
	.uleb128 0x8
	.long	.LASF74
	.value	0x237
	.byte	0x7
	.long	0x66
	.byte	0
	.uleb128 0x8
	.long	.LASF75
	.value	0x238
	.byte	0x7
	.long	0x66
	.byte	0x4
	.uleb128 0x8
	.long	.LASF76
	.value	0x239
	.byte	0x7
	.long	0x66
	.byte	0x8
	.uleb128 0x8
	.long	.LASF77
	.value	0x23a
	.byte	0x7
	.long	0x66
	.byte	0xc
	.uleb128 0x8
	.long	.LASF78
	.value	0x23b
	.byte	0xd
	.long	0x3f1
	.byte	0x10
	.uleb128 0x8
	.long	.LASF79
	.value	0x23c
	.byte	0x14
	.long	0x44c
	.byte	0x18
	.uleb128 0x8
	.long	.LASF80
	.value	0x23d
	.byte	0x9
	.long	0x8c
	.byte	0x20
	.uleb128 0x8
	.long	.LASF81
	.value	0x23e
	.byte	0x14
	.long	0x4c8
	.byte	0x28
	.byte	0
	.uleb128 0x3
	.long	0x451
	.uleb128 0x5
	.byte	0x10
	.byte	0x5
	.long	.LASF82
	.uleb128 0x5
	.byte	0x10
	.byte	0x7
	.long	.LASF83
	.uleb128 0x5
	.byte	0x10
	.byte	0x4
	.long	.LASF84
	.uleb128 0x4
	.long	.LASF85
	.byte	0xd
	.byte	0x6a
	.byte	0x1a
	.long	0x4f3
	.uleb128 0x10
	.long	0x4e2
	.uleb128 0xc
	.long	.LASF86
	.uleb128 0x4
	.long	.LASF87
	.byte	0xd
	.byte	0x6b
	.byte	0x1e
	.long	0x504
	.uleb128 0xc
	.long	.LASF88
	.uleb128 0x4
	.long	.LASF89
	.byte	0xd
	.byte	0xba
	.byte	0x1a
	.long	0x515
	.uleb128 0xc
	.long	.LASF90
	.uleb128 0x3
	.long	0x4a
	.uleb128 0x9
	.long	0x4a
	.long	0x52f
	.uleb128 0xb
	.long	0x3a
	.byte	0xf
	.byte	0
	.uleb128 0x3
	.long	0x4ee
	.uleb128 0xd
	.long	.LASF91
	.byte	0x28
	.byte	0xe
	.byte	0xa2
	.byte	0x10
	.long	0x583
	.uleb128 0x1
	.long	.LASF92
	.byte	0xe
	.byte	0xa3
	.byte	0x9
	.long	0x66
	.byte	0
	.uleb128 0x1
	.long	.LASF93
	.byte	0xe
	.byte	0xa4
	.byte	0xb
	.long	0x8c
	.byte	0x8
	.uleb128 0x1
	.long	.LASF94
	.byte	0xe
	.byte	0xa5
	.byte	0xb
	.long	0x8c
	.byte	0x10
	.uleb128 0x1
	.long	.LASF95
	.byte	0xe
	.byte	0xa6
	.byte	0x9
	.long	0x66
	.byte	0x18
	.uleb128 0x1
	.long	.LASF96
	.byte	0xe
	.byte	0xa7
	.byte	0x1d
	.long	0x583
	.byte	0x20
	.byte	0
	.uleb128 0x3
	.long	0x534
	.uleb128 0x4
	.long	.LASF97
	.byte	0xe
	.byte	0xa8
	.byte	0x2
	.long	0x534
	.uleb128 0x20
	.byte	0x50
	.byte	0xe
	.byte	0xb1
	.byte	0x9
	.long	0x5ec
	.uleb128 0x1
	.long	.LASF98
	.byte	0xe
	.byte	0xb3
	.byte	0x9
	.long	0x66
	.byte	0
	.uleb128 0x1
	.long	.LASF99
	.byte	0xe
	.byte	0xb6
	.byte	0x16
	.long	0x5ec
	.byte	0x8
	.uleb128 0x1
	.long	.LASF100
	.byte	0xe
	.byte	0xb7
	.byte	0x9
	.long	0x66
	.byte	0x10
	.uleb128 0x1
	.long	.LASF101
	.byte	0xe
	.byte	0xb8
	.byte	0x16
	.long	0x4c8
	.byte	0x18
	.uleb128 0x1
	.long	.LASF102
	.byte	0xe
	.byte	0xb9
	.byte	0x9
	.long	0x66
	.byte	0x20
	.uleb128 0x1
	.long	.LASF103
	.byte	0xe
	.byte	0xba
	.byte	0x15
	.long	0x3df
	.byte	0x28
	.byte	0
	.uleb128 0x3
	.long	0x588
	.uleb128 0x4
	.long	.LASF104
	.byte	0xe
	.byte	0xbc
	.byte	0x3
	.long	0x594
	.uleb128 0x21
	.long	.LASF105
	.byte	0xf
	.value	0x2f4
	.byte	0xd
	.long	0x610
	.uleb128 0x2
	.long	0x66
	.byte	0
	.uleb128 0x6
	.long	.LASF106
	.byte	0x10
	.value	0x30d
	.byte	0xc
	.long	0x66
	.long	0x62c
	.uleb128 0x2
	.long	0x62c
	.uleb128 0x2
	.long	0x631
	.byte	0
	.uleb128 0x3
	.long	0x3df
	.uleb128 0x3
	.long	0x3a1
	.uleb128 0x14
	.long	.LASF107
	.byte	0x11
	.byte	0xb8
	.byte	0xc
	.long	0x66
	.long	0x64c
	.uleb128 0x2
	.long	0x2b0
	.byte	0
	.uleb128 0x6
	.long	.LASF108
	.byte	0x11
	.value	0x28e
	.byte	0xe
	.long	0x8c
	.long	0x66d
	.uleb128 0x2
	.long	0x91
	.uleb128 0x2
	.long	0x66
	.uleb128 0x2
	.long	0x2b5
	.byte	0
	.uleb128 0x15
	.long	.LASF114
	.byte	0xf
	.value	0x2af
	.byte	0xd
	.long	0x680
	.uleb128 0x2
	.long	0x48
	.byte	0
	.uleb128 0x6
	.long	.LASF109
	.byte	0x11
	.value	0x16b
	.byte	0xc
	.long	0x66
	.long	0x698
	.uleb128 0x2
	.long	0x2a6
	.uleb128 0x11
	.byte	0
	.uleb128 0x22
	.long	.LASF138
	.byte	0x11
	.value	0x1bf
	.byte	0xc
	.long	.LASF139
	.long	0x66
	.long	0x6b9
	.uleb128 0x2
	.long	0x2a6
	.uleb128 0x2
	.long	0x2a6
	.uleb128 0x11
	.byte	0
	.uleb128 0x6
	.long	.LASF110
	.byte	0x12
	.value	0x16e
	.byte	0xe
	.long	0x8c
	.long	0x6da
	.uleb128 0x2
	.long	0x91
	.uleb128 0x2
	.long	0x2ab
	.uleb128 0x2
	.long	0x403
	.byte	0
	.uleb128 0x14
	.long	.LASF111
	.byte	0x12
	.byte	0xbb
	.byte	0xe
	.long	0x8c
	.long	0x6f0
	.uleb128 0x2
	.long	0x2a6
	.byte	0
	.uleb128 0x6
	.long	.LASF112
	.byte	0x11
	.value	0x108
	.byte	0xe
	.long	0x2b0
	.long	0x70c
	.uleb128 0x2
	.long	0x2ab
	.uleb128 0x2
	.long	0x2ab
	.byte	0
	.uleb128 0x6
	.long	.LASF113
	.byte	0x11
	.value	0x181
	.byte	0xc
	.long	0x66
	.long	0x72e
	.uleb128 0x2
	.long	0x8c
	.uleb128 0x2
	.long	0x3a
	.uleb128 0x2
	.long	0x2a6
	.uleb128 0x11
	.byte	0
	.uleb128 0x15
	.long	.LASF115
	.byte	0x13
	.value	0x2c0
	.byte	0x6
	.long	0x741
	.uleb128 0x2
	.long	0x741
	.byte	0
	.uleb128 0x3
	.long	0x4f8
	.uleb128 0x6
	.long	.LASF116
	.byte	0x13
	.value	0x2cf
	.byte	0xc
	.long	0x66
	.long	0x767
	.uleb128 0x2
	.long	0x741
	.uleb128 0x2
	.long	0x51a
	.uleb128 0x2
	.long	0x767
	.byte	0
	.uleb128 0x3
	.long	0x41
	.uleb128 0x6
	.long	.LASF117
	.byte	0x13
	.value	0x2cd
	.byte	0xc
	.long	0x66
	.long	0x78d
	.uleb128 0x2
	.long	0x741
	.uleb128 0x2
	.long	0x3eb
	.uleb128 0x2
	.long	0x2e
	.byte	0
	.uleb128 0x6
	.long	.LASF118
	.byte	0xf
	.value	0x2a0
	.byte	0xe
	.long	0x48
	.long	0x7a4
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0x6
	.long	.LASF119
	.byte	0x13
	.value	0x2cb
	.byte	0xc
	.long	0x66
	.long	0x7c5
	.uleb128 0x2
	.long	0x741
	.uleb128 0x2
	.long	0x52f
	.uleb128 0x2
	.long	0x7c5
	.byte	0
	.uleb128 0x3
	.long	0x509
	.uleb128 0x16
	.long	.LASF120
	.value	0x391
	.byte	0xf
	.long	0x52f
	.uleb128 0x16
	.long	.LASF121
	.value	0x2be
	.byte	0xd
	.long	0x741
	.uleb128 0x23
	.long	.LASF140
	.byte	0x1
	.value	0x159
	.byte	0x6
	.quad	.LFB323
	.quad	.LFE323-.LFB323
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x24
	.long	.LASF141
	.byte	0x1
	.byte	0xe8
	.byte	0x5
	.long	0x66
	.quad	.LFB322
	.quad	.LFE322-.LFB322
	.uleb128 0x1
	.byte	0x9c
	.long	0x84c
	.uleb128 0x12
	.long	.LASF122
	.byte	0xe8
	.byte	0xe
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -116
	.uleb128 0x12
	.long	.LASF123
	.byte	0xe8
	.byte	0x1a
	.long	0x3fe
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0xa
	.string	"sd"
	.byte	0xea
	.byte	0x13
	.long	0x5f1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.byte	0
	.uleb128 0x25
	.long	.LASF130
	.byte	0x1
	.byte	0xb0
	.byte	0x6
	.quad	.LFB321
	.quad	.LFE321-.LFB321
	.uleb128 0x1
	.byte	0x9c
	.long	0x90f
	.uleb128 0x17
	.string	"sd"
	.byte	0xb0
	.byte	0x26
	.long	0x90f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1128
	.uleb128 0xa
	.string	"fs"
	.byte	0xb1
	.byte	0xb
	.long	0x2b0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1088
	.uleb128 0x7
	.long	.LASF124
	.byte	0xb2
	.byte	0xa
	.long	0x914
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1056
	.uleb128 0xa
	.string	"i"
	.byte	0xb4
	.byte	0x9
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1108
	.uleb128 0x7
	.long	.LASF125
	.byte	0xb5
	.byte	0xb
	.long	0x8c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1104
	.uleb128 0x7
	.long	.LASF126
	.byte	0xb7
	.byte	0x16
	.long	0x5ec
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1080
	.uleb128 0x7
	.long	.LASF127
	.byte	0xb8
	.byte	0x16
	.long	0x5ec
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1096
	.uleb128 0x18
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x7
	.long	.LASF128
	.byte	0xba
	.byte	0xd
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1112
	.uleb128 0x7
	.long	.LASF129
	.byte	0xc1
	.byte	0xf
	.long	0x8c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1072
	.uleb128 0xa
	.string	"tok"
	.byte	0xc2
	.byte	0xf
	.long	0x8c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1064
	.byte	0
	.byte	0
	.uleb128 0x3
	.long	0x5f1
	.uleb128 0x9
	.long	0x96
	.long	0x925
	.uleb128 0x26
	.long	0x3a
	.value	0x3ff
	.byte	0
	.uleb128 0x27
	.long	.LASF131
	.byte	0x1
	.byte	0x3
	.byte	0x7
	.long	0x8c
	.quad	.LFB320
	.quad	.LFE320-.LFB320
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x17
	.string	"str"
	.byte	0x3
	.byte	0x15
	.long	0x8c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x12
	.long	.LASF132
	.byte	0x3
	.byte	0x1e
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.uleb128 0x7
	.long	.LASF133
	.byte	0x6
	.byte	0x11
	.long	0x741
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0xa
	.string	"md"
	.byte	0x7
	.byte	0x13
	.long	0x52f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x7
	.long	.LASF134
	.byte	0x9
	.byte	0x9
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0xa
	.string	"out"
	.byte	0xa
	.byte	0xb
	.long	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x7
	.long	.LASF135
	.byte	0xb
	.byte	0x13
	.long	0x51f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x18
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
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
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 19
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
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x20
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
	.uleb128 0x23
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
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
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
.LASF109:
	.string	"printf"
.LASF10:
	.string	"__off_t"
.LASF63:
	.string	"__size"
.LASF15:
	.string	"_IO_read_ptr"
.LASF118:
	.string	"malloc"
.LASF27:
	.string	"_chain"
.LASF74:
	.string	"ai_flags"
.LASF9:
	.string	"size_t"
.LASF134:
	.string	"md_len"
.LASF64:
	.string	"__align"
.LASF33:
	.string	"_shortbuf"
.LASF73:
	.string	"addrinfo"
.LASF6:
	.string	"signed char"
.LASF127:
	.string	"prev"
.LASF136:
	.string	"GNU C17 14.2.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF21:
	.string	"_IO_buf_base"
.LASF85:
	.string	"EVP_MD"
.LASF48:
	.string	"long long unsigned int"
.LASF101:
	.string	"server_info"
.LASF52:
	.string	"__next"
.LASF89:
	.string	"ENGINE"
.LASF65:
	.string	"pthread_mutexattr_t"
.LASF68:
	.string	"socklen_t"
.LASF96:
	.string	"next"
.LASF36:
	.string	"_codecvt"
.LASF98:
	.string	"sockfd"
.LASF47:
	.string	"long long int"
.LASF131:
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
.LASF121:
	.string	"EVP_MD_CTX_new"
.LASF45:
	.string	"_IO_codecvt"
.LASF119:
	.string	"EVP_DigestInit_ex"
.LASF30:
	.string	"_old_offset"
.LASF35:
	.string	"_offset"
.LASF53:
	.string	"__pthread_list_t"
.LASF141:
	.string	"main"
.LASF91:
	.string	"clientdetails_s"
.LASF97:
	.string	"clientdetails_t"
.LASF51:
	.string	"__prev"
.LASF54:
	.string	"__pthread_mutex_s"
.LASF115:
	.string	"EVP_MD_CTX_free"
.LASF124:
	.string	"line"
.LASF94:
	.string	"client_ip"
.LASF44:
	.string	"_IO_marker"
.LASF3:
	.string	"unsigned int"
.LASF39:
	.string	"_freeres_buf"
.LASF87:
	.string	"EVP_MD_CTX"
.LASF82:
	.string	"__int128"
.LASF76:
	.string	"ai_socktype"
.LASF2:
	.string	"long unsigned int"
.LASF99:
	.string	"client_details"
.LASF66:
	.string	"__data"
.LASF19:
	.string	"_IO_write_ptr"
.LASF61:
	.string	"__elision"
.LASF5:
	.string	"short unsigned int"
.LASF23:
	.string	"_IO_save_base"
.LASF135:
	.string	"digest"
.LASF125:
	.string	"saved_remaining_line"
.LASF129:
	.string	"line_dup"
.LASF34:
	.string	"_lock"
.LASF29:
	.string	"_flags2"
.LASF41:
	.string	"_mode"
.LASF108:
	.string	"fgets"
.LASF106:
	.string	"pthread_mutex_init"
.LASF130:
	.string	"read_server_conf"
.LASF57:
	.string	"__owner"
.LASF117:
	.string	"EVP_DigestUpdate"
.LASF100:
	.string	"number_of_clients"
.LASF138:
	.string	"sscanf"
.LASF104:
	.string	"sockdetails_t"
.LASF20:
	.string	"_IO_write_end"
.LASF40:
	.string	"_prevchain"
.LASF77:
	.string	"ai_protocol"
.LASF137:
	.string	"_IO_lock_t"
.LASF120:
	.string	"EVP_md5"
.LASF49:
	.string	"_IO_FILE"
.LASF126:
	.string	"current"
.LASF92:
	.string	"client_sock_fd"
.LASF50:
	.string	"__pthread_internal_list"
.LASF78:
	.string	"ai_addrlen"
.LASF112:
	.string	"fopen"
.LASF71:
	.string	"sa_family"
.LASF86:
	.string	"evp_md_st"
.LASF128:
	.string	"dfs_no"
.LASF83:
	.string	"__int128 unsigned"
.LASF4:
	.string	"unsigned char"
.LASF79:
	.string	"ai_addr"
.LASF7:
	.string	"short int"
.LASF46:
	.string	"_IO_wide_data"
.LASF139:
	.string	"__isoc23_sscanf"
.LASF81:
	.string	"ai_next"
.LASF32:
	.string	"_vtable_offset"
.LASF43:
	.string	"FILE"
.LASF105:
	.string	"exit"
.LASF26:
	.string	"_markers"
.LASF88:
	.string	"evp_md_ctx_st"
.LASF56:
	.string	"__count"
.LASF55:
	.string	"__lock"
.LASF90:
	.string	"engine_st"
.LASF93:
	.string	"client_port"
.LASF84:
	.string	"long double"
.LASF132:
	.string	"length"
.LASF12:
	.string	"char"
.LASF13:
	.string	"__socklen_t"
.LASF70:
	.string	"sockaddr"
.LASF75:
	.string	"ai_family"
.LASF107:
	.string	"fclose"
.LASF11:
	.string	"__off64_t"
.LASF17:
	.string	"_IO_read_base"
.LASF25:
	.string	"_IO_save_end"
.LASF133:
	.string	"context"
.LASF114:
	.string	"free"
.LASF67:
	.string	"pthread_mutex_t"
.LASF116:
	.string	"EVP_DigestFinal_ex"
.LASF60:
	.string	"__spins"
.LASF113:
	.string	"snprintf"
.LASF69:
	.string	"sa_family_t"
.LASF42:
	.string	"_unused2"
.LASF123:
	.string	"argv"
.LASF110:
	.string	"strtok_r"
.LASF111:
	.string	"strdup"
.LASF58:
	.string	"__nusers"
.LASF24:
	.string	"_IO_backup_base"
.LASF122:
	.string	"argc"
.LASF72:
	.string	"sa_data"
.LASF38:
	.string	"_freeres_list"
.LASF62:
	.string	"__list"
.LASF80:
	.string	"ai_canonname"
.LASF37:
	.string	"_wide_data"
.LASF59:
	.string	"__kind"
.LASF102:
	.string	"timeout"
.LASF103:
	.string	"lock"
.LASF18:
	.string	"_IO_write_base"
.LASF95:
	.string	"dfsno"
.LASF140:
	.string	"print_menu"
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
