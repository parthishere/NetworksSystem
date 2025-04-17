	.file	"setup.c"
	.text
.Ltext0:
	.file 0 "/home/parth/Work/All_data/university/Network System/Assignments/PA4/server" "src/setup.c"
	.section	.rodata
	.align 8
.LC0:
	.string	"\033[31m[-] Error somewhere ! Check below message to see details "
.LC1:
	.string	"\033[31m[-] Timeout\n\033[0m"
	.align 8
.LC2:
	.string	"UNABLE_TO_COMPLETE_THE_OPERATION\t\n0\t\n"
	.string	""
	.text
	.globl	error
	.type	error, @function
error:
.LFB320:
	.file 1 "src/setup.c"
	.loc 1 29 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	.loc 1 30 5
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 32 5
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	perror@PLT
	.loc 1 34 9
	call	__errno_location@PLT
	.loc 1 34 9 is_stmt 0 discriminator 1
	movl	(%rax), %eax
	.loc 1 34 8 is_stmt 1 discriminator 1
	cmpl	$11, %eax
	je	.L2
	.loc 1 34 28 discriminator 1
	call	__errno_location@PLT
	movl	(%rax), %eax
	.loc 1 34 25 discriminator 1
	cmpl	$11, %eax
	jne	.L3
.L2:
	.loc 1 37 9
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L4
.L3:
	.loc 1 42 9
	movq	-8(%rbp), %rax
	movl	4(%rax), %eax
	movl	$0, %ecx
	movl	$37, %edx
	leaq	.LC2(%rip), %rsi
	movl	%eax, %edi
	call	send@PLT
	.loc 1 46 1
	nop
.L4:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE320:
	.size	error, .-error
	.section	.rodata
.LC3:
	.string	"[-] send"
	.text
	.globl	_send
	.type	_send, @function
_send:
.LFB321:
	.loc 1 65 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	%rdx, -24(%rbp)
	.loc 1 66 26
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	movl	4(%rax), %eax
	movq	-24(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 66 24 discriminator 1
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movl	%edx, 152(%rax)
	.loc 1 66 12 discriminator 1
	movq	-8(%rbp), %rax
	movl	152(%rax), %eax
	.loc 1 66 8 discriminator 1
	testl	%eax, %eax
	jns	.L7
	.loc 1 68 9
	movq	-8(%rbp), %rax
	leaq	.LC3(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	error
.L7:
	.loc 1 70 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE321:
	.size	_send, .-_send
	.section	.rodata
.LC4:
	.string	"[-] recv"
	.text
	.globl	_recv
	.type	_recv, @function
_recv:
.LFB322:
	.loc 1 88 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	%rdx, -24(%rbp)
	.loc 1 89 26
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	movl	4(%rax), %eax
	movq	-24(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 89 24 discriminator 1
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movl	%edx, 148(%rax)
	.loc 1 89 12 discriminator 1
	movq	-8(%rbp), %rax
	movl	148(%rax), %eax
	.loc 1 89 8 discriminator 1
	testl	%eax, %eax
	jns	.L10
	.loc 1 91 9
	movq	-8(%rbp), %rax
	leaq	.LC4(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	error
.L10:
	.loc 1 93 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE322:
	.size	_recv, .-_recv
	.section	.rodata
.LC5:
	.string	"setsockopt"
	.text
	.globl	set_timeout
	.type	set_timeout, @function
set_timeout:
.LFB323:
	.loc 1 113 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	.loc 1 113 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 116 20
	movl	-44(%rbp), %eax
	cltq
	movq	%rax, -32(%rbp)
	.loc 1 117 21
	movq	$0, -24(%rbp)
	.loc 1 120 9
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	leaq	-32(%rbp), %rdx
	movl	$16, %r8d
	movq	%rdx, %rcx
	movl	$20, %edx
	movl	$1, %esi
	movl	%eax, %edi
	call	setsockopt@PLT
	.loc 1 120 8 discriminator 1
	cmpl	$-1, %eax
	jne	.L14
	.loc 1 122 9
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	.loc 1 123 9
	movl	$1, %edi
	call	exit@PLT
.L14:
	.loc 1 125 1
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
.LFE323:
	.size	set_timeout, .-set_timeout
	.globl	remove_timeout
	.type	remove_timeout, @function
remove_timeout:
.LFB324:
	.loc 1 143 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	.loc 1 143 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 146 20
	movq	$0, -32(%rbp)
	.loc 1 147 21
	movq	$0, -24(%rbp)
	.loc 1 150 9
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	leaq	-32(%rbp), %rdx
	movl	$16, %r8d
	movq	%rdx, %rcx
	movl	$20, %edx
	movl	$1, %esi
	movl	%eax, %edi
	call	setsockopt@PLT
	.loc 1 150 8 discriminator 1
	cmpl	$-1, %eax
	jne	.L18
	.loc 1 153 9
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	.loc 1 154 9
	movl	$1, %edi
	call	exit@PLT
.L18:
	.loc 1 156 1
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE324:
	.size	remove_timeout, .-remove_timeout
	.globl	getin_addr
	.type	getin_addr, @function
getin_addr:
.LFB325:
	.loc 1 176 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	.loc 1 177 11
	movq	-8(%rbp), %rax
	movzwl	(%rax), %eax
	.loc 1 177 8
	cmpw	$2, %ax
	jne	.L20
	.loc 1 179 17
	movq	-8(%rbp), %rax
	addq	$4, %rax
	jmp	.L21
.L20:
	.loc 1 181 16
	movq	-8(%rbp), %rax
	movzwl	(%rax), %eax
	.loc 1 181 13
	cmpw	$10, %ax
	jne	.L22
	.loc 1 183 17
	movq	-8(%rbp), %rax
	addq	$8, %rax
	jmp	.L21
.L22:
	.loc 1 185 12
	movl	$0, %eax
.L21:
	.loc 1 186 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE325:
	.size	getin_addr, .-getin_addr
	.section	.rodata
	.align 8
.LC6:
	.string	"\033[31m[-] Port Value < 1024 ! keep port value higher than 1024 \n\033[0m"
.LC7:
	.string	"\033[31mgetaddrinfo: %s\n\033[0m"
	.align 8
.LC8:
	.string	"\033[32m[+] getaddrinfo call successful\n\033[0m"
.LC9:
	.string	"\033[31mserver: socket"
	.align 8
.LC10:
	.string	"\033[32m[+] socket call successful\n\033[0m"
.LC11:
	.string	"\033[31msetsockopt"
.LC12:
	.string	"\033[31mserver: bind"
	.align 8
.LC13:
	.string	"\033[31m[-] socket connection failed for server \n\033[0m"
	.align 8
.LC14:
	.string	"\033[32m[+] Server recieving TCP/HTTP1.0 packet to : %s\n\033[0m"
.LC15:
	.string	"listen"
	.text
	.globl	init_socket
	.type	init_socket, @function
init_socket:
.LFB326:
	.loc 1 205 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160, %rsp
	movq	%rdi, -152(%rbp)
	movq	%rsi, -160(%rbp)
	.loc 1 205 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 213 5
	leaq	-112(%rbp), %rax
	movl	$48, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 214 21
	movl	$0, -108(%rbp)
	.loc 1 215 23
	movl	$1, -104(%rbp)
	.loc 1 216 20
	movl	$1, -112(%rbp)
	.loc 1 218 11
	movq	-160(%rbp), %rax
	movq	%rax, -120(%rbp)
	.loc 1 220 9
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	.loc 1 220 8 discriminator 1
	cmpl	$1024, %eax
	jg	.L24
	.loc 1 222 9
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$67, %edx
	movl	$1, %esi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 223 9
	movl	$1, %edi
	call	exit@PLT
.L24:
	.loc 1 229 19
	movq	-152(%rbp), %rax
	leaq	136(%rax), %rcx
	leaq	-112(%rbp), %rdx
	movq	-120(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	getaddrinfo@PLT
	movl	%eax, -132(%rbp)
	.loc 1 229 8 discriminator 1
	cmpl	$0, -132(%rbp)
	jns	.L25
	.loc 1 231 9
	movl	-132(%rbp), %eax
	movl	%eax, %edi
	call	gai_strerror@PLT
	movq	%rax, %rdx
	.loc 1 231 9 is_stmt 0 discriminator 1
	movq	stderr(%rip), %rax
	leaq	.LC7(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 232 9 is_stmt 1
	movl	$1, %edi
	call	exit@PLT
.L25:
	.loc 1 234 5
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 237 15
	movq	-152(%rbp), %rax
	movq	136(%rax), %rax
	movq	%rax, -128(%rbp)
	.loc 1 237 5
	jmp	.L26
.L32:
.LBB2:
	.loc 1 245 23
	movq	-128(%rbp), %rax
	movl	12(%rax), %edx
	movq	-128(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-128(%rbp), %rax
	movl	4(%rax), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	socket@PLT
	movl	%eax, -136(%rbp)
	.loc 1 245 12 discriminator 1
	cmpl	$0, -136(%rbp)
	jns	.L27
	.loc 1 247 13
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	.loc 1 248 13
	jmp	.L28
.L27:
	.loc 1 250 9
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 252 13
	movl	$1, -140(%rbp)
	.loc 1 254 13
	leaq	-140(%rbp), %rdx
	movl	-136(%rbp), %eax
	movl	$4, %r8d
	movq	%rdx, %rcx
	movl	$2, %edx
	movl	$1, %esi
	movl	%eax, %edi
	call	setsockopt@PLT
	.loc 1 254 12 discriminator 1
	cmpl	$-1, %eax
	jne	.L29
	.loc 1 256 13
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	.loc 1 257 13
	movl	$1, %edi
	call	exit@PLT
.L29:
	.loc 1 264 13
	movq	-128(%rbp), %rax
	movl	16(%rax), %edx
	.loc 1 264 30
	movq	-128(%rbp), %rax
	movq	24(%rax), %rax
	.loc 1 264 13
	movq	%rax, %rcx
	movl	-136(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	bind@PLT
	.loc 1 264 12 discriminator 1
	testl	%eax, %eax
	jns	.L36
	.loc 1 266 13
	movl	-136(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 267 13
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	.loc 1 268 13
	nop
.L28:
.LBE2:
	.loc 1 237 53 discriminator 2
	movq	-128(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -128(%rbp)
.L26:
	.loc 1 237 39 discriminator 1
	cmpq	$0, -128(%rbp)
	jne	.L32
	jmp	.L31
.L36:
.LBB3:
	.loc 1 271 9
	nop
.L31:
.LBE3:
	.loc 1 275 8
	cmpq	$0, -128(%rbp)
	jne	.L33
	.loc 1 277 9
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$50, %edx
	movl	$1, %esi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 278 9
	movl	-136(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 279 9
	movl	$1, %edi
	call	exit@PLT
.L33:
	.loc 1 281 16
	movq	-152(%rbp), %rax
	movl	-136(%rbp), %edx
	movl	%edx, (%rax)
	.loc 1 284 32
	movq	-128(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	getin_addr
	movq	%rax, %rsi
	.loc 1 284 5 discriminator 1
	movq	-128(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-64(%rbp), %rdx
	movl	$46, %ecx
	movl	%eax, %edi
	call	inet_ntop@PLT
	.loc 1 285 5
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 287 5
	movq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	freeaddrinfo@PLT
	.loc 1 289 9
	movl	-136(%rbp), %eax
	movl	$20, %esi
	movl	%eax, %edi
	call	listen@PLT
	.loc 1 289 8 discriminator 1
	testl	%eax, %eax
	jns	.L37
	.loc 1 291 9
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	.loc 1 292 9
	movl	$1, %edi
	call	exit@PLT
.L37:
	.loc 1 294 1
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L35
	call	__stack_chk_fail@PLT
.L35:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE326:
	.size	init_socket, .-init_socket
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/14/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"
	.file 9 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h"
	.file 10 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.file 11 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h"
	.file 12 "/usr/include/unistd.h"
	.file 13 "/usr/include/x86_64-linux-gnu/bits/sockaddr.h"
	.file 14 "/usr/include/x86_64-linux-gnu/bits/socket.h"
	.file 15 "/usr/include/netinet/in.h"
	.file 16 "/usr/include/x86_64-linux-gnu/sys/socket.h"
	.file 17 "/usr/include/netdb.h"
	.file 18 "./common.h"
	.file 19 "/usr/include/arpa/inet.h"
	.file 20 "/usr/include/stdlib.h"
	.file 21 "/usr/include/string.h"
	.file 22 "/usr/include/x86_64-linux-gnu/bits/socket_type.h"
	.file 23 "/usr/include/errno.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xc20
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x1a
	.long	.LASF170
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
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x1b
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
	.byte	0x3
	.byte	0x26
	.byte	0x17
	.long	0x4a
	.uleb128 0x5
	.byte	0x2
	.byte	0x5
	.long	.LASF9
	.uleb128 0x3
	.long	.LASF10
	.byte	0x3
	.byte	0x28
	.byte	0x1c
	.long	0x51
	.uleb128 0x1c
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.long	.LASF11
	.byte	0x3
	.byte	0x2a
	.byte	0x16
	.long	0x41
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.long	.LASF12
	.uleb128 0x3
	.long	.LASF13
	.byte	0x3
	.byte	0x98
	.byte	0x19
	.long	0x91
	.uleb128 0x3
	.long	.LASF14
	.byte	0x3
	.byte	0x99
	.byte	0x1b
	.long	0x91
	.uleb128 0x3
	.long	.LASF15
	.byte	0x3
	.byte	0xa0
	.byte	0x1a
	.long	0x91
	.uleb128 0x3
	.long	.LASF16
	.byte	0x3
	.byte	0xa2
	.byte	0x1f
	.long	0x91
	.uleb128 0x3
	.long	.LASF17
	.byte	0x3
	.byte	0xc2
	.byte	0x1b
	.long	0x91
	.uleb128 0x4
	.long	0xde
	.uleb128 0x10
	.long	0xd4
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.long	.LASF18
	.uleb128 0x14
	.long	0xde
	.uleb128 0x3
	.long	.LASF19
	.byte	0x3
	.byte	0xd2
	.byte	0x17
	.long	0x41
	.uleb128 0x9
	.long	.LASF55
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x27d
	.uleb128 0x1
	.long	.LASF20
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x7e
	.byte	0
	.uleb128 0x1
	.long	.LASF21
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0xd4
	.byte	0x8
	.uleb128 0x1
	.long	.LASF22
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0xd4
	.byte	0x10
	.uleb128 0x1
	.long	.LASF23
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0xd4
	.byte	0x18
	.uleb128 0x1
	.long	.LASF24
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0xd4
	.byte	0x20
	.uleb128 0x1
	.long	.LASF25
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0xd4
	.byte	0x28
	.uleb128 0x1
	.long	.LASF26
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0xd4
	.byte	0x30
	.uleb128 0x1
	.long	.LASF27
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0xd4
	.byte	0x38
	.uleb128 0x1
	.long	.LASF28
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0xd4
	.byte	0x40
	.uleb128 0x1
	.long	.LASF29
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0xd4
	.byte	0x48
	.uleb128 0x1
	.long	.LASF30
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0xd4
	.byte	0x50
	.uleb128 0x1
	.long	.LASF31
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0xd4
	.byte	0x58
	.uleb128 0x1
	.long	.LASF32
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x296
	.byte	0x60
	.uleb128 0x1
	.long	.LASF33
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x29b
	.byte	0x68
	.uleb128 0x1
	.long	.LASF34
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x7e
	.byte	0x70
	.uleb128 0x1
	.long	.LASF35
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x7e
	.byte	0x74
	.uleb128 0x1
	.long	.LASF36
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0x98
	.byte	0x78
	.uleb128 0x1
	.long	.LASF37
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x51
	.byte	0x80
	.uleb128 0x1
	.long	.LASF38
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x58
	.byte	0x82
	.uleb128 0x1
	.long	.LASF39
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x2a0
	.byte	0x83
	.uleb128 0x1
	.long	.LASF40
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x2b0
	.byte	0x88
	.uleb128 0x1
	.long	.LASF41
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0xa4
	.byte	0x90
	.uleb128 0x1
	.long	.LASF42
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x2ba
	.byte	0x98
	.uleb128 0x1
	.long	.LASF43
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x2c4
	.byte	0xa0
	.uleb128 0x1
	.long	.LASF44
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x29b
	.byte	0xa8
	.uleb128 0x1
	.long	.LASF45
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0x48
	.byte	0xb0
	.uleb128 0x1
	.long	.LASF46
	.byte	0x4
	.byte	0x5f
	.byte	0x15
	.long	0x2c9
	.byte	0xb8
	.uleb128 0x1
	.long	.LASF47
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x7e
	.byte	0xc0
	.uleb128 0x1
	.long	.LASF48
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x2ce
	.byte	0xc4
	.byte	0
	.uleb128 0x3
	.long	.LASF49
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0xf6
	.uleb128 0x1d
	.long	.LASF171
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0x13
	.long	.LASF50
	.uleb128 0x4
	.long	0x291
	.uleb128 0x4
	.long	0xf6
	.uleb128 0x7
	.long	0xde
	.long	0x2b0
	.uleb128 0x8
	.long	0x3a
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	0x289
	.uleb128 0x13
	.long	.LASF51
	.uleb128 0x4
	.long	0x2b5
	.uleb128 0x13
	.long	.LASF52
	.uleb128 0x4
	.long	0x2bf
	.uleb128 0x4
	.long	0x29b
	.uleb128 0x7
	.long	0xde
	.long	0x2de
	.uleb128 0x8
	.long	0x3a
	.byte	0x13
	.byte	0
	.uleb128 0x4
	.long	0xe5
	.uleb128 0x10
	.long	0x2de
	.uleb128 0x3
	.long	.LASF53
	.byte	0x6
	.byte	0x4e
	.byte	0x13
	.long	0xc8
	.uleb128 0x4
	.long	0x27d
	.uleb128 0x1e
	.long	.LASF172
	.byte	0x6
	.byte	0x97
	.byte	0xe
	.long	0x2f4
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.long	.LASF54
	.uleb128 0x9
	.long	.LASF56
	.byte	0x10
	.byte	0x7
	.byte	0x8
	.byte	0x8
	.long	0x334
	.uleb128 0x1
	.long	.LASF57
	.byte	0x7
	.byte	0xe
	.byte	0xc
	.long	0xb0
	.byte	0
	.uleb128 0x1
	.long	.LASF58
	.byte	0x7
	.byte	0xf
	.byte	0x11
	.long	0xbc
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.long	.LASF59
	.uleb128 0x9
	.long	.LASF60
	.byte	0x10
	.byte	0x8
	.byte	0x33
	.byte	0x10
	.long	0x363
	.uleb128 0x1
	.long	.LASF61
	.byte	0x8
	.byte	0x35
	.byte	0x23
	.long	0x363
	.byte	0
	.uleb128 0x1
	.long	.LASF62
	.byte	0x8
	.byte	0x36
	.byte	0x23
	.long	0x363
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.long	0x33b
	.uleb128 0x3
	.long	.LASF63
	.byte	0x8
	.byte	0x37
	.byte	0x3
	.long	0x33b
	.uleb128 0x9
	.long	.LASF64
	.byte	0x28
	.byte	0x9
	.byte	0x16
	.byte	0x8
	.long	0x3ea
	.uleb128 0x1
	.long	.LASF65
	.byte	0x9
	.byte	0x18
	.byte	0x7
	.long	0x7e
	.byte	0
	.uleb128 0x1
	.long	.LASF66
	.byte	0x9
	.byte	0x19
	.byte	0x10
	.long	0x41
	.byte	0x4
	.uleb128 0x1
	.long	.LASF67
	.byte	0x9
	.byte	0x1a
	.byte	0x7
	.long	0x7e
	.byte	0x8
	.uleb128 0x1
	.long	.LASF68
	.byte	0x9
	.byte	0x1c
	.byte	0x10
	.long	0x41
	.byte	0xc
	.uleb128 0x1
	.long	.LASF69
	.byte	0x9
	.byte	0x20
	.byte	0x7
	.long	0x7e
	.byte	0x10
	.uleb128 0x1
	.long	.LASF70
	.byte	0x9
	.byte	0x22
	.byte	0x9
	.long	0x6b
	.byte	0x14
	.uleb128 0x1
	.long	.LASF71
	.byte	0x9
	.byte	0x23
	.byte	0x9
	.long	0x6b
	.byte	0x16
	.uleb128 0x1
	.long	.LASF72
	.byte	0x9
	.byte	0x24
	.byte	0x14
	.long	0x368
	.byte	0x18
	.byte	0
	.uleb128 0x15
	.byte	0x28
	.byte	0xa
	.byte	0x43
	.byte	0x9
	.long	0x418
	.uleb128 0xf
	.long	.LASF73
	.byte	0xa
	.byte	0x45
	.byte	0x1c
	.long	0x374
	.uleb128 0xf
	.long	.LASF74
	.byte	0xa
	.byte	0x46
	.byte	0x8
	.long	0x418
	.uleb128 0xf
	.long	.LASF75
	.byte	0xa
	.byte	0x47
	.byte	0xc
	.long	0x91
	.byte	0
	.uleb128 0x7
	.long	0xde
	.long	0x428
	.uleb128 0x8
	.long	0x3a
	.byte	0x27
	.byte	0
	.uleb128 0x3
	.long	.LASF76
	.byte	0xa
	.byte	0x48
	.byte	0x3
	.long	0x3ea
	.uleb128 0x4
	.long	0x43e
	.uleb128 0x10
	.long	0x434
	.uleb128 0x1f
	.uleb128 0x3
	.long	.LASF77
	.byte	0xb
	.byte	0x18
	.byte	0x13
	.long	0x5f
	.uleb128 0x3
	.long	.LASF78
	.byte	0xb
	.byte	0x19
	.byte	0x14
	.long	0x72
	.uleb128 0x3
	.long	.LASF79
	.byte	0xb
	.byte	0x1a
	.byte	0x14
	.long	0x85
	.uleb128 0x20
	.long	.LASF80
	.byte	0xc
	.value	0x112
	.byte	0x15
	.long	0xea
	.uleb128 0x21
	.long	.LASF173
	.byte	0x7
	.byte	0x4
	.long	0x41
	.byte	0x16
	.byte	0x18
	.byte	0x6
	.long	0x4bd
	.uleb128 0xb
	.long	.LASF81
	.byte	0x1
	.uleb128 0xb
	.long	.LASF82
	.byte	0x2
	.uleb128 0xb
	.long	.LASF83
	.byte	0x3
	.uleb128 0xb
	.long	.LASF84
	.byte	0x4
	.uleb128 0xb
	.long	.LASF85
	.byte	0x5
	.uleb128 0xb
	.long	.LASF86
	.byte	0x6
	.uleb128 0xb
	.long	.LASF87
	.byte	0xa
	.uleb128 0x22
	.long	.LASF88
	.long	0x80000
	.uleb128 0x23
	.long	.LASF89
	.value	0x800
	.byte	0
	.uleb128 0x3
	.long	.LASF90
	.byte	0xd
	.byte	0x1c
	.byte	0x1c
	.long	0x51
	.uleb128 0x9
	.long	.LASF91
	.byte	0x10
	.byte	0xe
	.byte	0xb8
	.byte	0x27
	.long	0x4f1
	.uleb128 0x1
	.long	.LASF92
	.byte	0xe
	.byte	0xba
	.byte	0x5
	.long	0x4bd
	.byte	0
	.uleb128 0x1
	.long	.LASF93
	.byte	0xe
	.byte	0xbb
	.byte	0xa
	.long	0x4f1
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	0xde
	.long	0x501
	.uleb128 0x8
	.long	0x3a
	.byte	0xd
	.byte	0
	.uleb128 0x9
	.long	.LASF94
	.byte	0x80
	.byte	0xe
	.byte	0xc5
	.byte	0x27
	.long	0x536
	.uleb128 0x1
	.long	.LASF95
	.byte	0xe
	.byte	0xc7
	.byte	0x5
	.long	0x4bd
	.byte	0
	.uleb128 0x1
	.long	.LASF96
	.byte	0xe
	.byte	0xc8
	.byte	0xa
	.long	0x536
	.byte	0x2
	.uleb128 0x1
	.long	.LASF97
	.byte	0xe
	.byte	0xc9
	.byte	0x14
	.long	0x3a
	.byte	0x78
	.byte	0
	.uleb128 0x7
	.long	0xde
	.long	0x546
	.uleb128 0x8
	.long	0x3a
	.byte	0x75
	.byte	0
	.uleb128 0x4
	.long	0x4c9
	.uleb128 0x9
	.long	.LASF98
	.byte	0x10
	.byte	0xf
	.byte	0xf7
	.byte	0x27
	.long	0x58d
	.uleb128 0x1
	.long	.LASF99
	.byte	0xf
	.byte	0xf9
	.byte	0x5
	.long	0x4bd
	.byte	0
	.uleb128 0x1
	.long	.LASF100
	.byte	0xf
	.byte	0xfa
	.byte	0xf
	.long	0x61a
	.byte	0x2
	.uleb128 0x1
	.long	.LASF101
	.byte	0xf
	.byte	0xfb
	.byte	0x14
	.long	0x5ff
	.byte	0x4
	.uleb128 0x1
	.long	.LASF102
	.byte	0xf
	.byte	0xfe
	.byte	0x13
	.long	0x69f
	.byte	0x8
	.byte	0
	.uleb128 0x16
	.long	.LASF103
	.byte	0x1c
	.byte	0xf
	.value	0x108
	.byte	0x27
	.long	0x5e2
	.uleb128 0x6
	.long	.LASF104
	.byte	0xf
	.value	0x10a
	.byte	0x5
	.long	0x4bd
	.byte	0
	.uleb128 0x6
	.long	.LASF105
	.byte	0xf
	.value	0x10b
	.byte	0xf
	.long	0x61a
	.byte	0x2
	.uleb128 0x6
	.long	.LASF106
	.byte	0xf
	.value	0x10c
	.byte	0xe
	.long	0x457
	.byte	0x4
	.uleb128 0x6
	.long	.LASF107
	.byte	0xf
	.value	0x10d
	.byte	0x15
	.long	0x684
	.byte	0x8
	.uleb128 0x6
	.long	.LASF108
	.byte	0xf
	.value	0x10e
	.byte	0xe
	.long	0x457
	.byte	0x18
	.byte	0
	.uleb128 0x3
	.long	.LASF109
	.byte	0x10
	.byte	0x54
	.byte	0xa
	.long	0x5ee
	.uleb128 0x24
	.byte	0x8
	.byte	0x10
	.byte	0x53
	.byte	0x9
	.uleb128 0x3
	.long	.LASF110
	.byte	0xf
	.byte	0x1e
	.byte	0x12
	.long	0x457
	.uleb128 0x9
	.long	.LASF111
	.byte	0x4
	.byte	0xf
	.byte	0x1f
	.byte	0x8
	.long	0x61a
	.uleb128 0x1
	.long	.LASF112
	.byte	0xf
	.byte	0x21
	.byte	0xf
	.long	0x5f3
	.byte	0
	.byte	0
	.uleb128 0x3
	.long	.LASF113
	.byte	0xf
	.byte	0x7d
	.byte	0x12
	.long	0x44b
	.uleb128 0x15
	.byte	0x10
	.byte	0xf
	.byte	0xdf
	.byte	0x5
	.long	0x654
	.uleb128 0xf
	.long	.LASF114
	.byte	0xf
	.byte	0xe1
	.byte	0xa
	.long	0x654
	.uleb128 0xf
	.long	.LASF115
	.byte	0xf
	.byte	0xe2
	.byte	0xb
	.long	0x664
	.uleb128 0xf
	.long	.LASF116
	.byte	0xf
	.byte	0xe3
	.byte	0xb
	.long	0x674
	.byte	0
	.uleb128 0x7
	.long	0x43f
	.long	0x664
	.uleb128 0x8
	.long	0x3a
	.byte	0xf
	.byte	0
	.uleb128 0x7
	.long	0x44b
	.long	0x674
	.uleb128 0x8
	.long	0x3a
	.byte	0x7
	.byte	0
	.uleb128 0x7
	.long	0x457
	.long	0x684
	.uleb128 0x8
	.long	0x3a
	.byte	0x3
	.byte	0
	.uleb128 0x9
	.long	.LASF117
	.byte	0x10
	.byte	0xf
	.byte	0xdd
	.byte	0x8
	.long	0x69f
	.uleb128 0x1
	.long	.LASF118
	.byte	0xf
	.byte	0xe4
	.byte	0x9
	.long	0x626
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x4a
	.long	0x6af
	.uleb128 0x8
	.long	0x3a
	.byte	0x7
	.byte	0
	.uleb128 0x16
	.long	.LASF119
	.byte	0x30
	.byte	0x11
	.value	0x235
	.byte	0x8
	.long	0x72e
	.uleb128 0x6
	.long	.LASF120
	.byte	0x11
	.value	0x237
	.byte	0x7
	.long	0x7e
	.byte	0
	.uleb128 0x6
	.long	.LASF121
	.byte	0x11
	.value	0x238
	.byte	0x7
	.long	0x7e
	.byte	0x4
	.uleb128 0x6
	.long	.LASF122
	.byte	0x11
	.value	0x239
	.byte	0x7
	.long	0x7e
	.byte	0x8
	.uleb128 0x6
	.long	.LASF123
	.byte	0x11
	.value	0x23a
	.byte	0x7
	.long	0x7e
	.byte	0xc
	.uleb128 0x6
	.long	.LASF124
	.byte	0x11
	.value	0x23b
	.byte	0xd
	.long	0x463
	.byte	0x10
	.uleb128 0x6
	.long	.LASF125
	.byte	0x11
	.value	0x23c
	.byte	0x14
	.long	0x546
	.byte	0x18
	.uleb128 0x6
	.long	.LASF126
	.byte	0x11
	.value	0x23d
	.byte	0x9
	.long	0xd4
	.byte	0x20
	.uleb128 0x6
	.long	.LASF127
	.byte	0x11
	.value	0x23e
	.byte	0x14
	.long	0x733
	.byte	0x28
	.byte	0
	.uleb128 0x14
	.long	0x6af
	.uleb128 0x4
	.long	0x6af
	.uleb128 0x4
	.long	0x72e
	.uleb128 0x10
	.long	0x738
	.uleb128 0x5
	.byte	0x10
	.byte	0x5
	.long	.LASF128
	.uleb128 0x5
	.byte	0x10
	.byte	0x7
	.long	.LASF129
	.uleb128 0x5
	.byte	0x10
	.byte	0x4
	.long	.LASF130
	.uleb128 0x4
	.long	0x7e
	.uleb128 0x25
	.byte	0xd0
	.byte	0x12
	.byte	0xaf
	.byte	0xa
	.long	0x7e8
	.uleb128 0x1
	.long	.LASF131
	.byte	0x12
	.byte	0xb1
	.byte	0xa
	.long	0x7e
	.byte	0
	.uleb128 0x1
	.long	.LASF132
	.byte	0x12
	.byte	0xb2
	.byte	0xa
	.long	0x7e
	.byte	0x4
	.uleb128 0x1
	.long	.LASF133
	.byte	0x12
	.byte	0xb3
	.byte	0x1e
	.long	0x501
	.byte	0x8
	.uleb128 0x1
	.long	.LASF134
	.byte	0x12
	.byte	0xb4
	.byte	0x17
	.long	0x733
	.byte	0x88
	.uleb128 0x1
	.long	.LASF135
	.byte	0x12
	.byte	0xb5
	.byte	0xa
	.long	0x7e
	.byte	0x90
	.uleb128 0x1
	.long	.LASF136
	.byte	0x12
	.byte	0xb6
	.byte	0xa
	.long	0x7e
	.byte	0x94
	.uleb128 0x1
	.long	.LASF137
	.byte	0x12
	.byte	0xb7
	.byte	0xa
	.long	0x7e
	.byte	0x98
	.uleb128 0x1
	.long	.LASF138
	.byte	0x12
	.byte	0xb8
	.byte	0xa
	.long	0x7e
	.byte	0x9c
	.uleb128 0x1
	.long	.LASF139
	.byte	0x12
	.byte	0xb9
	.byte	0xa
	.long	0x7e
	.byte	0xa0
	.uleb128 0x1
	.long	.LASF140
	.byte	0x12
	.byte	0xba
	.byte	0x16
	.long	0x428
	.byte	0xa8
	.byte	0
	.uleb128 0x3
	.long	.LASF141
	.byte	0x12
	.byte	0xbb
	.byte	0x4
	.long	0x75c
	.uleb128 0xc
	.long	.LASF142
	.byte	0x10
	.value	0x128
	.byte	0xc
	.long	0x7e
	.long	0x810
	.uleb128 0x2
	.long	0x7e
	.uleb128 0x2
	.long	0x7e
	.byte	0
	.uleb128 0x17
	.long	.LASF157
	.byte	0x11
	.value	0x29a
	.long	0x822
	.uleb128 0x2
	.long	0x733
	.byte	0
	.uleb128 0xd
	.long	.LASF143
	.byte	0x13
	.byte	0x40
	.byte	0x14
	.long	0x2de
	.long	0x847
	.uleb128 0x2
	.long	0x7e
	.uleb128 0x2
	.long	0x439
	.uleb128 0x2
	.long	0xd9
	.uleb128 0x2
	.long	0x463
	.byte	0
	.uleb128 0xc
	.long	.LASF144
	.byte	0xc
	.value	0x166
	.byte	0xc
	.long	0x7e
	.long	0x85e
	.uleb128 0x2
	.long	0x7e
	.byte	0
	.uleb128 0xd
	.long	.LASF145
	.byte	0x10
	.byte	0x70
	.byte	0xc
	.long	0x7e
	.long	0x87e
	.uleb128 0x2
	.long	0x7e
	.uleb128 0x2
	.long	0x5e2
	.uleb128 0x2
	.long	0x463
	.byte	0
	.uleb128 0xd
	.long	.LASF146
	.byte	0x10
	.byte	0x66
	.byte	0xc
	.long	0x7e
	.long	0x89e
	.uleb128 0x2
	.long	0x7e
	.uleb128 0x2
	.long	0x7e
	.uleb128 0x2
	.long	0x7e
	.byte	0
	.uleb128 0xc
	.long	.LASF147
	.byte	0x6
	.value	0x165
	.byte	0xc
	.long	0x7e
	.long	0x8bb
	.uleb128 0x2
	.long	0x2f4
	.uleb128 0x2
	.long	0x2de
	.uleb128 0x18
	.byte	0
	.uleb128 0xc
	.long	.LASF148
	.byte	0x11
	.value	0x29d
	.byte	0x14
	.long	0x2de
	.long	0x8d2
	.uleb128 0x2
	.long	0x7e
	.byte	0
	.uleb128 0xc
	.long	.LASF149
	.byte	0x11
	.value	0x294
	.byte	0xc
	.long	0x7e
	.long	0x8f8
	.uleb128 0x2
	.long	0x2e3
	.uleb128 0x2
	.long	0x2e3
	.uleb128 0x2
	.long	0x73d
	.uleb128 0x2
	.long	0x8fd
	.byte	0
	.uleb128 0x4
	.long	0x733
	.uleb128 0x10
	.long	0x8f8
	.uleb128 0xd
	.long	.LASF150
	.byte	0x14
	.byte	0x69
	.byte	0xc
	.long	0x7e
	.long	0x918
	.uleb128 0x2
	.long	0x2de
	.byte	0
	.uleb128 0xd
	.long	.LASF151
	.byte	0x15
	.byte	0x3d
	.byte	0xe
	.long	0x48
	.long	0x938
	.uleb128 0x2
	.long	0x48
	.uleb128 0x2
	.long	0x7e
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0x26
	.long	.LASF152
	.byte	0x14
	.value	0x2f4
	.byte	0xd
	.long	0x94b
	.uleb128 0x2
	.long	0x7e
	.byte	0
	.uleb128 0xc
	.long	.LASF153
	.byte	0x10
	.value	0x115
	.byte	0xc
	.long	0x7e
	.long	0x976
	.uleb128 0x2
	.long	0x7e
	.uleb128 0x2
	.long	0x7e
	.uleb128 0x2
	.long	0x7e
	.uleb128 0x2
	.long	0x434
	.uleb128 0x2
	.long	0x463
	.byte	0
	.uleb128 0xd
	.long	.LASF154
	.byte	0x10
	.byte	0x91
	.byte	0x10
	.long	0x2e8
	.long	0x99b
	.uleb128 0x2
	.long	0x7e
	.uleb128 0x2
	.long	0x48
	.uleb128 0x2
	.long	0x2e
	.uleb128 0x2
	.long	0x7e
	.byte	0
	.uleb128 0xd
	.long	.LASF155
	.byte	0x10
	.byte	0x8a
	.byte	0x10
	.long	0x2e8
	.long	0x9c0
	.uleb128 0x2
	.long	0x7e
	.uleb128 0x2
	.long	0x434
	.uleb128 0x2
	.long	0x2e
	.uleb128 0x2
	.long	0x7e
	.byte	0
	.uleb128 0xc
	.long	.LASF156
	.byte	0x6
	.value	0x16b
	.byte	0xc
	.long	0x7e
	.long	0x9d8
	.uleb128 0x2
	.long	0x2de
	.uleb128 0x18
	.byte	0
	.uleb128 0x27
	.long	.LASF174
	.byte	0x17
	.byte	0x25
	.byte	0xd
	.long	0x757
	.uleb128 0x17
	.long	.LASF158
	.byte	0x6
	.value	0x364
	.long	0x9f6
	.uleb128 0x2
	.long	0x2de
	.byte	0
	.uleb128 0x11
	.long	.LASF163
	.byte	0xcc
	.quad	.LFB326
	.quad	.LFE326-.LFB326
	.uleb128 0x1
	.byte	0x9c
	.long	0xa9e
	.uleb128 0xa
	.string	"sd"
	.byte	0xcc
	.byte	0x21
	.long	0xa9e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x12
	.long	.LASF139
	.byte	0xcc
	.byte	0x2b
	.long	0xd4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0xe
	.long	.LASF159
	.byte	0xce
	.byte	0x15
	.long	0x6af
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0xe
	.long	.LASF160
	.byte	0xce
	.byte	0x1d
	.long	0x733
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x19
	.string	"ip"
	.byte	0xcf
	.byte	0xa
	.long	0xaa3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0xe
	.long	.LASF161
	.byte	0xd1
	.byte	0x9
	.long	0x7e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -148
	.uleb128 0xe
	.long	.LASF131
	.byte	0xd2
	.byte	0x9
	.long	0x7e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0xe
	.long	.LASF162
	.byte	0xda
	.byte	0xb
	.long	0xd4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x28
	.long	.LLRL0
	.uleb128 0x19
	.string	"yes"
	.byte	0xfc
	.byte	0xd
	.long	0x7e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -156
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	0x7e8
	.uleb128 0x7
	.long	0xde
	.long	0xab3
	.uleb128 0x8
	.long	0x3a
	.byte	0x2d
	.byte	0
	.uleb128 0x29
	.long	.LASF175
	.byte	0x1
	.byte	0xaf
	.byte	0x7
	.long	0x48
	.quad	.LFB325
	.quad	.LFE325-.LFB325
	.uleb128 0x1
	.byte	0x9c
	.long	0xae3
	.uleb128 0xa
	.string	"sa"
	.byte	0xaf
	.byte	0x23
	.long	0x546
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x11
	.long	.LASF164
	.byte	0x8e
	.quad	.LFB324
	.quad	.LFE324-.LFB324
	.uleb128 0x1
	.byte	0x9c
	.long	0xb1b
	.uleb128 0xa
	.string	"sd"
	.byte	0x8e
	.byte	0x24
	.long	0xa9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xe
	.long	.LASF138
	.byte	0x91
	.byte	0x14
	.long	0x30c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x11
	.long	.LASF165
	.byte	0x70
	.quad	.LFB323
	.quad	.LFE323-.LFB323
	.uleb128 0x1
	.byte	0x9c
	.long	0xb61
	.uleb128 0xa
	.string	"sd"
	.byte	0x70
	.byte	0x21
	.long	0xa9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xa
	.string	"sec"
	.byte	0x70
	.byte	0x29
	.long	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0xe
	.long	.LASF138
	.byte	0x73
	.byte	0x14
	.long	0x30c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x11
	.long	.LASF166
	.byte	0x57
	.quad	.LFB322
	.quad	.LFE322-.LFB322
	.uleb128 0x1
	.byte	0x9c
	.long	0xba7
	.uleb128 0xa
	.string	"sd"
	.byte	0x57
	.byte	0x1b
	.long	0xa9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x12
	.long	.LASF167
	.byte	0x57
	.byte	0x23
	.long	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x12
	.long	.LASF168
	.byte	0x57
	.byte	0x2f
	.long	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x11
	.long	.LASF169
	.byte	0x40
	.quad	.LFB321
	.quad	.LFE321-.LFB321
	.uleb128 0x1
	.byte	0x9c
	.long	0xbed
	.uleb128 0xa
	.string	"sd"
	.byte	0x40
	.byte	0x1b
	.long	0xa9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x12
	.long	.LASF167
	.byte	0x40
	.byte	0x23
	.long	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x12
	.long	.LASF168
	.byte	0x40
	.byte	0x2f
	.long	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x2a
	.long	.LASF176
	.byte	0x1
	.byte	0x1c
	.byte	0x6
	.quad	.LFB320
	.quad	.LFE320-.LFB320
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xa
	.string	"sd"
	.byte	0x1c
	.byte	0x1b
	.long	0xa9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.string	"msg"
	.byte	0x1c
	.byte	0x25
	.long	0xd4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
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
	.uleb128 0xe
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
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
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
	.uleb128 0x17
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
	.sleb128 13
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1e
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
	.uleb128 0x1f
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.uleb128 0x25
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
	.uleb128 0x28
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x29
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
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 .LBB3-.Ltext0
	.uleb128 .LBE3-.Ltext0
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF156:
	.string	"printf"
.LASF13:
	.string	"__off_t"
.LASF74:
	.string	"__size"
.LASF21:
	.string	"_IO_read_ptr"
.LASF33:
	.string	"_chain"
.LASF107:
	.string	"sin6_addr"
.LASF162:
	.string	"server_port"
.LASF118:
	.string	"__in6_u"
.LASF7:
	.string	"size_t"
.LASF61:
	.string	"__prev"
.LASF146:
	.string	"socket"
.LASF75:
	.string	"__align"
.LASF39:
	.string	"_shortbuf"
.LASF144:
	.string	"close"
.LASF8:
	.string	"__uint8_t"
.LASF53:
	.string	"ssize_t"
.LASF170:
	.string	"GNU C17 14.2.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF27:
	.string	"_IO_buf_base"
.LASF89:
	.string	"SOCK_NONBLOCK"
.LASF59:
	.string	"long long unsigned int"
.LASF110:
	.string	"in_addr_t"
.LASF134:
	.string	"server_info"
.LASF62:
	.string	"__next"
.LASF165:
	.string	"set_timeout"
.LASF133:
	.string	"client_info"
.LASF80:
	.string	"socklen_t"
.LASF42:
	.string	"_codecvt"
.LASF87:
	.string	"SOCK_PACKET"
.LASF131:
	.string	"sockfd"
.LASF54:
	.string	"long long int"
.LASF6:
	.string	"signed char"
.LASF161:
	.string	"status"
.LASF163:
	.string	"init_socket"
.LASF34:
	.string	"_fileno"
.LASF22:
	.string	"_IO_read_end"
.LASF115:
	.string	"__u6_addr16"
.LASF12:
	.string	"long int"
.LASF20:
	.string	"_flags"
.LASF121:
	.string	"ai_family"
.LASF17:
	.string	"__ssize_t"
.LASF28:
	.string	"_IO_buf_end"
.LASF37:
	.string	"_cur_column"
.LASF81:
	.string	"SOCK_STREAM"
.LASF154:
	.string	"recv"
.LASF105:
	.string	"sin6_port"
.LASF36:
	.string	"_old_offset"
.LASF41:
	.string	"_offset"
.LASF63:
	.string	"__pthread_list_t"
.LASF64:
	.string	"__pthread_mutex_s"
.LASF120:
	.string	"ai_flags"
.LASF11:
	.string	"__uint32_t"
.LASF102:
	.string	"sin_zero"
.LASF139:
	.string	"port"
.LASF160:
	.string	"temp"
.LASF50:
	.string	"_IO_marker"
.LASF84:
	.string	"SOCK_RDM"
.LASF3:
	.string	"unsigned int"
.LASF112:
	.string	"s_addr"
.LASF45:
	.string	"_freeres_buf"
.LASF136:
	.string	"recvBytes"
.LASF147:
	.string	"fprintf"
.LASF122:
	.string	"ai_socktype"
.LASF2:
	.string	"long unsigned int"
.LASF73:
	.string	"__data"
.LASF25:
	.string	"_IO_write_ptr"
.LASF56:
	.string	"timeval"
.LASF145:
	.string	"bind"
.LASF135:
	.string	"addr_len"
.LASF167:
	.string	"size"
.LASF5:
	.string	"short unsigned int"
.LASF101:
	.string	"sin_addr"
.LASF142:
	.string	"listen"
.LASF29:
	.string	"_IO_save_base"
.LASF119:
	.string	"addrinfo"
.LASF78:
	.string	"uint16_t"
.LASF164:
	.string	"remove_timeout"
.LASF40:
	.string	"_lock"
.LASF116:
	.string	"__u6_addr32"
.LASF113:
	.string	"in_port_t"
.LASF109:
	.string	"__CONST_SOCKADDR_ARG"
.LASF67:
	.string	"__owner"
.LASF66:
	.string	"__count"
.LASF158:
	.string	"perror"
.LASF99:
	.string	"sin_family"
.LASF104:
	.string	"sin6_family"
.LASF149:
	.string	"getaddrinfo"
.LASF141:
	.string	"sockdetails_t"
.LASF155:
	.string	"send"
.LASF26:
	.string	"_IO_write_end"
.LASF46:
	.string	"_prevchain"
.LASF123:
	.string	"ai_protocol"
.LASF157:
	.string	"freeaddrinfo"
.LASF94:
	.string	"sockaddr_storage"
.LASF171:
	.string	"_IO_lock_t"
.LASF175:
	.string	"getin_addr"
.LASF55:
	.string	"_IO_FILE"
.LASF168:
	.string	"packet"
.LASF173:
	.string	"__socket_type"
.LASF86:
	.string	"SOCK_DCCP"
.LASF132:
	.string	"client_sock_fd"
.LASF60:
	.string	"__pthread_internal_list"
.LASF124:
	.string	"ai_addrlen"
.LASF47:
	.string	"_mode"
.LASF100:
	.string	"sin_port"
.LASF92:
	.string	"sa_family"
.LASF57:
	.string	"tv_sec"
.LASF166:
	.string	"_recv"
.LASF137:
	.string	"sentBytes"
.LASF32:
	.string	"_markers"
.LASF159:
	.string	"hints"
.LASF129:
	.string	"__int128 unsigned"
.LASF108:
	.string	"sin6_scope_id"
.LASF150:
	.string	"atoi"
.LASF4:
	.string	"unsigned char"
.LASF125:
	.string	"ai_addr"
.LASF9:
	.string	"short int"
.LASF52:
	.string	"_IO_wide_data"
.LASF35:
	.string	"_flags2"
.LASF127:
	.string	"ai_next"
.LASF38:
	.string	"_vtable_offset"
.LASF176:
	.string	"error"
.LASF49:
	.string	"FILE"
.LASF152:
	.string	"exit"
.LASF16:
	.string	"__suseconds_t"
.LASF117:
	.string	"in6_addr"
.LASF58:
	.string	"tv_usec"
.LASF65:
	.string	"__lock"
.LASF79:
	.string	"uint32_t"
.LASF130:
	.string	"long double"
.LASF18:
	.string	"char"
.LASF95:
	.string	"ss_family"
.LASF19:
	.string	"__socklen_t"
.LASF106:
	.string	"sin6_flowinfo"
.LASF10:
	.string	"__uint16_t"
.LASF71:
	.string	"__elision"
.LASF114:
	.string	"__u6_addr8"
.LASF174:
	.string	"__errno_location"
.LASF51:
	.string	"_IO_codecvt"
.LASF143:
	.string	"inet_ntop"
.LASF14:
	.string	"__off64_t"
.LASF23:
	.string	"_IO_read_base"
.LASF148:
	.string	"gai_strerror"
.LASF31:
	.string	"_IO_save_end"
.LASF128:
	.string	"__int128"
.LASF76:
	.string	"pthread_mutex_t"
.LASF70:
	.string	"__spins"
.LASF15:
	.string	"__time_t"
.LASF90:
	.string	"sa_family_t"
.LASF48:
	.string	"_unused2"
.LASF172:
	.string	"stderr"
.LASF151:
	.string	"memset"
.LASF88:
	.string	"SOCK_CLOEXEC"
.LASF103:
	.string	"sockaddr_in6"
.LASF97:
	.string	"__ss_align"
.LASF91:
	.string	"sockaddr"
.LASF82:
	.string	"SOCK_DGRAM"
.LASF153:
	.string	"setsockopt"
.LASF98:
	.string	"sockaddr_in"
.LASF77:
	.string	"uint8_t"
.LASF68:
	.string	"__nusers"
.LASF30:
	.string	"_IO_backup_base"
.LASF169:
	.string	"_send"
.LASF96:
	.string	"__ss_padding"
.LASF93:
	.string	"sa_data"
.LASF44:
	.string	"_freeres_list"
.LASF72:
	.string	"__list"
.LASF83:
	.string	"SOCK_RAW"
.LASF126:
	.string	"ai_canonname"
.LASF43:
	.string	"_wide_data"
.LASF69:
	.string	"__kind"
.LASF85:
	.string	"SOCK_SEQPACKET"
.LASF138:
	.string	"timeout"
.LASF140:
	.string	"lock"
.LASF24:
	.string	"_IO_write_base"
.LASF111:
	.string	"in_addr"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/parth/Work/All_data/university/Network System/Assignments/PA4/server"
.LASF0:
	.string	"src/setup.c"
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
