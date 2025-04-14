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
	.section	.rodata
	.align 8
.LC0:
	.string	"\033[31m[-] Port Value < 1024 ! keep port value higher than 1024 \n\033[0m"
.LC1:
	.string	"\033[31mgetaddrinfo: %s\n\033[0m"
.LC2:
	.string	"\033[31mserver: socket"
	.align 8
.LC3:
	.string	"\033[31m\n[-] (%d) connect failed for server %d\n\033[0m"
	.align 8
.LC4:
	.string	"\033[31m\n[-] (%d) temp = NULL, connection failed %d\n\033[0m"
	.align 8
.LC5:
	.string	"\033[32m[+] (%d) Connection established to server: %s\n[+] (%d) Server IP address: %s:%s\n\033[0m"
.LC6:
	.string	"sent failed %d"
	.text
	.globl	connect_save_send
	.type	connect_save_send, @function
connect_save_send:
.LFB321:
	.loc 1 30 102
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$184, %rsp
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	movq	%rdi, -184(%rbp)
	movq	%rsi, -192(%rbp)
	movl	%edx, -196(%rbp)
	movq	%rcx, -208(%rbp)
	.loc 1 30 102
	movq	%fs:40, %rax
	movq	%rax, -40(%rbp)
	xorl	%eax, %eax
	.loc 1 31 22
	movq	-184(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -160(%rbp)
	.loc 1 32 9
	movl	$0, -168(%rbp)
	.loc 1 33 10
	jmp	.L5
.L17:
.LBB2:
	.loc 1 35 11
	movl	-168(%rbp), %eax
	cmpl	-196(%rbp), %eax
	jge	.L19
	.loc 1 35 52 discriminator 2
	movl	-168(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-192(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	.loc 1 35 28 discriminator 2
	testl	%eax, %eax
	je	.L19
	.loc 1 45 9
	leaq	-144(%rbp), %rax
	movl	$48, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 46 25
	movl	$0, -140(%rbp)
	.loc 1 47 27
	movl	$1, -136(%rbp)
	.loc 1 49 25
	movq	-160(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 49 13
	movq	%rax, %rdi
	call	atoi@PLT
	.loc 1 49 12 discriminator 1
	cmpl	$1024, %eax
	jg	.L9
	.loc 1 51 13
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$67, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 52 13
	movl	$1, %edi
	call	exit@PLT
.L9:
	.loc 1 55 23
	movq	-184(%rbp), %rax
	leaq	40(%rax), %rcx
	.loc 1 55 62
	movq	-160(%rbp), %rax
	movq	8(%rax), %rsi
	.loc 1 55 42
	movq	-160(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 55 23
	leaq	-144(%rbp), %rdx
	movq	%rax, %rdi
	call	getaddrinfo@PLT
	movl	%eax, -164(%rbp)
	.loc 1 55 12 discriminator 1
	cmpl	$0, -164(%rbp)
	jns	.L10
	.loc 1 57 13
	movl	-164(%rbp), %eax
	movl	%eax, %edi
	call	gai_strerror@PLT
	movq	%rax, %rdx
	.loc 1 57 13 is_stmt 0 discriminator 1
	movq	stderr(%rip), %rax
	leaq	.LC1(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 58 13 is_stmt 1
	jmp	.L8
.L10:
	.loc 1 61 19
	movq	-184(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -152(%rbp)
	.loc 1 61 9
	nop
	.loc 1 61 47 discriminator 1
	cmpq	$0, -152(%rbp)
	je	.L14
	.loc 1 63 44
	movq	-152(%rbp), %rax
	movl	12(%rax), %edx
	movq	-152(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-152(%rbp), %rax
	movl	4(%rax), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	socket@PLT
	.loc 1 63 42 discriminator 1
	movq	-160(%rbp), %rdx
	movl	%eax, (%rdx)
	.loc 1 63 25 discriminator 1
	movq	-160(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 63 16 discriminator 1
	testl	%eax, %eax
	jns	.L12
	.loc 1 65 17
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	.loc 1 66 17
	jmp	.L8
.L12:
	.loc 1 70 18
	movq	-152(%rbp), %rax
	movl	16(%rax), %edx
	.loc 1 70 55
	movq	-152(%rbp), %rax
	movq	24(%rax), %rax
	.loc 1 70 18
	movq	%rax, %rcx
	movq	-160(%rbp), %rax
	movl	(%rax), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	connect@PLT
	.loc 1 70 16 discriminator 1
	testl	%eax, %eax
	jns	.L20
	.loc 1 72 98
	call	__errno_location@PLT
	.loc 1 72 17 discriminator 1
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	.loc 1 72 17 is_stmt 0 discriminator 2
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 73 17 is_stmt 1
	movq	-160(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 74 17
	jmp	.L8
.L20:
	.loc 1 77 13
	nop
.L14:
	.loc 1 80 12
	cmpq	$0, -152(%rbp)
	jne	.L16
	.loc 1 82 99
	call	__errno_location@PLT
	.loc 1 82 13 discriminator 1
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	.loc 1 82 13 is_stmt 0 discriminator 2
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 83 13 is_stmt 1
	jmp	.L8
.L16:
	.loc 1 87 36
	movq	-152(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	get_in_addr
	movq	%rax, %rsi
	.loc 1 87 9 discriminator 1
	movq	-152(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-96(%rbp), %rdx
	movl	$46, %ecx
	movl	%eax, %edi
	call	inet_ntop@PLT
	.loc 1 88 9
	movq	-160(%rbp), %rax
	movq	8(%rax), %r13
	call	gettid@PLT
	movl	%eax, %r12d
	.loc 1 88 9 is_stmt 0 discriminator 1
	movq	-160(%rbp), %rax
	movq	16(%rax), %rbx
	call	gettid@PLT
	.loc 1 88 9 discriminator 2
	leaq	-96(%rbp), %rdx
	movq	%r13, %r9
	movq	%rdx, %r8
	movl	%r12d, %ecx
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 93 12 is_stmt 1
	movq	-208(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	.loc 1 93 12 is_stmt 0 discriminator 1
	movq	-160(%rbp), %rax
	movl	(%rax), %eax
	movq	-208(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 93 11 is_stmt 1 discriminator 2
	testq	%rax, %rax
	jns	.L21
	.loc 1 94 47
	call	__errno_location@PLT
	.loc 1 94 13 discriminator 1
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC6(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 95 13
	jmp	.L8
.L19:
	.loc 1 35 62
	nop
	jmp	.L8
.L21:
	.loc 1 98 1
	nop
.L8:
	.loc 1 99 10
	addl	$1, -168(%rbp)
	.loc 1 100 17
	movq	-160(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -160(%rbp)
.L5:
.LBE2:
	.loc 1 33 11
	cmpq	$0, -160(%rbp)
	jne	.L17
	.loc 1 102 1
	nop
	movq	-40(%rbp), %rax
	subq	%fs:40, %rax
	je	.L18
	call	__stack_chk_fail@PLT
.L18:
	addq	$184, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE321:
	.size	connect_save_send, .-connect_save_send
	.section	.rodata
.LC7:
	.string	"ls"
.LC8:
	.string	"\033[31m[-] send failed %d \n\033[0m"
.LC9:
	.string	"Sent "
	.text
	.globl	recv_and_showing
	.type	recv_and_showing, @function
recv_and_showing:
.LFB322:
	.loc 1 118 41
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 1 119 22
	movq	-24(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -8(%rbp)
	.loc 1 120 10
	jmp	.L23
.L26:
	.loc 1 122 12
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	$0, %ecx
	movl	$2, %edx
	leaq	.LC7(%rip), %rsi
	movl	%eax, %edi
	call	send@PLT
	.loc 1 122 11 discriminator 1
	testq	%rax, %rax
	jns	.L24
	.loc 1 123 62
	call	__errno_location@PLT
	.loc 1 123 13 discriminator 1
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC8(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 124 13
	jmp	.L25
.L24:
	.loc 1 126 9
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L25:
	.loc 1 128 17
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -8(%rbp)
.L23:
	.loc 1 120 11
	cmpq	$0, -8(%rbp)
	jne	.L26
	.loc 1 130 1
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE322:
	.size	recv_and_showing, .-recv_and_showing
	.globl	handle_req
	.type	handle_req, @function
handle_req:
.LFB323:
	.loc 1 149 1
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
	subq	$2272, %rsp
	movq	%rdi, -30936(%rbp)
	.loc 1 149 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.LBB3:
	.loc 1 156 5
	leaq	-30864(%rbp), %rax
	movq	%rax, -30920(%rbp)
	movl	$0, -30924(%rbp)
	jmp	.L28
.L29:
	.loc 1 156 5 is_stmt 0 discriminator 3
	movq	-30920(%rbp), %rax
	movl	-30924(%rbp), %edx
	movq	$0, (%rax,%rdx,8)
	addl	$1, -30924(%rbp)
.L28:
	.loc 1 156 5 discriminator 1
	cmpl	$15, -30924(%rbp)
	jbe	.L29
.LBE3:
	.loc 1 160 20 is_stmt 1
	movq	$10, -30912(%rbp)
	movq	$0, -30904(%rbp)
	.loc 1 162 9
	movl	$0, -30896(%rbp)
	movl	$0, -30892(%rbp)
	movl	$0, -30888(%rbp)
	movl	$0, -30884(%rbp)
	.loc 1 163 5
	leaq	-30896(%rbp), %rsi
	movq	-30936(%rbp), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rdx, %rcx
	movl	$4, %edx
	movq	%rax, %rdi
	call	connect_save_send
	.loc 1 167 15
	movq	-30936(%rbp), %rax
	movl	16(%rax), %eax
	.loc 1 167 5
	cmpl	$4, %eax
	ja	.L40
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L32(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L32(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L32:
	.long	.L41-.L32
	.long	.L41-.L32
	.long	.L41-.L32
	.long	.L33-.L32
	.long	.L41-.L32
	.text
.L33:
.LBB4:
	.loc 1 171 13
	movl	$1, -30880(%rbp)
	movl	$1, -30876(%rbp)
	movl	$1, -30872(%rbp)
	movl	$1, -30868(%rbp)
	.loc 1 172 9
	leaq	-30880(%rbp), %rsi
	movq	-30936(%rbp), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rdx, %rcx
	movl	$4, %edx
	movq	%rax, %rdi
	call	connect_save_send
	.loc 1 175 9
	jmp	.L37
.L40:
	.loc 1 199 9
	nop
	jmp	.L37
.L41:
	.loc 1 195 9
	nop
.L37:
.LBE4:
	.loc 1 289 12
	movl	$0, %eax
	.loc 1 290 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L39
	call	__stack_chk_fail@PLT
.L39:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE323:
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
	.file 17 "/usr/include/x86_64-linux-gnu/sys/socket.h"
	.file 18 "/usr/include/netdb.h"
	.file 19 "./common.h"
	.file 20 "/usr/include/string.h"
	.file 21 "/usr/include/arpa/inet.h"
	.file 22 "/usr/include/x86_64-linux-gnu/bits/unistd_ext.h"
	.file 23 "/usr/include/errno.h"
	.file 24 "/usr/include/stdlib.h"
	.file 25 "/usr/include/x86_64-linux-gnu/bits/socket_type.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xcb3
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x1f
	.long	.LASF184
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
	.uleb128 0x20
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
	.uleb128 0x21
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
	.byte	0x9a
	.byte	0x19
	.long	0x7e
	.uleb128 0x3
	.long	.LASF16
	.byte	0x3
	.byte	0xa0
	.byte	0x1a
	.long	0x91
	.uleb128 0x3
	.long	.LASF17
	.byte	0x3
	.byte	0xa2
	.byte	0x1f
	.long	0x91
	.uleb128 0x3
	.long	.LASF18
	.byte	0x3
	.byte	0xc2
	.byte	0x1b
	.long	0x91
	.uleb128 0x4
	.long	0xea
	.uleb128 0xf
	.long	0xe0
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.long	.LASF19
	.uleb128 0x16
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
	.long	0xa4
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
	.long	0x7e
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
	.long	.LASF185
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0x12
	.long	.LASF51
	.uleb128 0x4
	.long	0x29d
	.uleb128 0x4
	.long	0x102
	.uleb128 0x7
	.long	0xea
	.long	0x2bc
	.uleb128 0xa
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
	.uleb128 0x7
	.long	0xea
	.long	0x2ea
	.uleb128 0xa
	.long	0x3a
	.byte	0x13
	.byte	0
	.uleb128 0x4
	.long	0xf1
	.uleb128 0xf
	.long	0x2ea
	.uleb128 0x3
	.long	.LASF54
	.byte	0x6
	.byte	0x4e
	.byte	0x13
	.long	0xd4
	.uleb128 0x4
	.long	0x289
	.uleb128 0x23
	.long	.LASF186
	.byte	0x6
	.byte	0x97
	.byte	0xe
	.long	0x300
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.long	.LASF55
	.uleb128 0xb
	.long	.LASF57
	.byte	0x10
	.byte	0x7
	.byte	0x8
	.byte	0x8
	.long	0x340
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
	.uleb128 0x3
	.long	.LASF60
	.byte	0x8
	.byte	0x31
	.byte	0x12
	.long	0x91
	.uleb128 0x17
	.byte	0x80
	.byte	0x8
	.byte	0x3b
	.long	0x362
	.uleb128 0x1
	.long	.LASF61
	.byte	0x8
	.byte	0x40
	.byte	0xf
	.long	0x362
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x340
	.long	0x372
	.uleb128 0xa
	.long	0x3a
	.byte	0xf
	.byte	0
	.uleb128 0x3
	.long	.LASF62
	.byte	0x8
	.byte	0x46
	.byte	0x5
	.long	0x34c
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.long	.LASF63
	.uleb128 0xb
	.long	.LASF64
	.byte	0x10
	.byte	0x9
	.byte	0x33
	.byte	0x10
	.long	0x3ad
	.uleb128 0x1
	.long	.LASF65
	.byte	0x9
	.byte	0x35
	.byte	0x23
	.long	0x3ad
	.byte	0
	.uleb128 0x1
	.long	.LASF66
	.byte	0x9
	.byte	0x36
	.byte	0x23
	.long	0x3ad
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.long	0x385
	.uleb128 0x3
	.long	.LASF67
	.byte	0x9
	.byte	0x37
	.byte	0x3
	.long	0x385
	.uleb128 0xb
	.long	.LASF68
	.byte	0x28
	.byte	0xa
	.byte	0x16
	.byte	0x8
	.long	0x434
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
	.long	0x3b2
	.byte	0x18
	.byte	0
	.uleb128 0x18
	.byte	0x28
	.byte	0xb
	.byte	0x43
	.byte	0x9
	.long	0x462
	.uleb128 0xc
	.long	.LASF77
	.byte	0xb
	.byte	0x45
	.byte	0x1c
	.long	0x3be
	.uleb128 0xc
	.long	.LASF78
	.byte	0xb
	.byte	0x46
	.byte	0x8
	.long	0x462
	.uleb128 0xc
	.long	.LASF79
	.byte	0xb
	.byte	0x47
	.byte	0xc
	.long	0x91
	.byte	0
	.uleb128 0x7
	.long	0xea
	.long	0x472
	.uleb128 0xa
	.long	0x3a
	.byte	0x27
	.byte	0
	.uleb128 0x3
	.long	.LASF80
	.byte	0xb
	.byte	0x48
	.byte	0x3
	.long	0x434
	.uleb128 0x4
	.long	0x488
	.uleb128 0xf
	.long	0x47e
	.uleb128 0x24
	.uleb128 0x3
	.long	.LASF81
	.byte	0xc
	.byte	0x18
	.byte	0x13
	.long	0x5f
	.uleb128 0x3
	.long	.LASF82
	.byte	0xc
	.byte	0x19
	.byte	0x14
	.long	0x72
	.uleb128 0x3
	.long	.LASF83
	.byte	0xc
	.byte	0x1a
	.byte	0x14
	.long	0x85
	.uleb128 0x25
	.long	.LASF84
	.byte	0xd
	.value	0x112
	.byte	0x15
	.long	0xf6
	.uleb128 0x26
	.long	.LASF187
	.byte	0x7
	.byte	0x4
	.long	0x41
	.byte	0x19
	.byte	0x18
	.byte	0x6
	.long	0x507
	.uleb128 0x8
	.long	.LASF85
	.byte	0x1
	.uleb128 0x8
	.long	.LASF86
	.byte	0x2
	.uleb128 0x8
	.long	.LASF87
	.byte	0x3
	.uleb128 0x8
	.long	.LASF88
	.byte	0x4
	.uleb128 0x8
	.long	.LASF89
	.byte	0x5
	.uleb128 0x8
	.long	.LASF90
	.byte	0x6
	.uleb128 0x8
	.long	.LASF91
	.byte	0xa
	.uleb128 0x27
	.long	.LASF92
	.long	0x80000
	.uleb128 0x28
	.long	.LASF93
	.value	0x800
	.byte	0
	.uleb128 0x3
	.long	.LASF94
	.byte	0xe
	.byte	0x1c
	.byte	0x1c
	.long	0x51
	.uleb128 0xb
	.long	.LASF95
	.byte	0x10
	.byte	0xf
	.byte	0xb8
	.byte	0x27
	.long	0x53b
	.uleb128 0x1
	.long	.LASF96
	.byte	0xf
	.byte	0xba
	.byte	0x5
	.long	0x507
	.byte	0
	.uleb128 0x1
	.long	.LASF97
	.byte	0xf
	.byte	0xbb
	.byte	0xa
	.long	0x53b
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	0xea
	.long	0x54b
	.uleb128 0xa
	.long	0x3a
	.byte	0xd
	.byte	0
	.uleb128 0x4
	.long	0x513
	.uleb128 0xb
	.long	.LASF98
	.byte	0x10
	.byte	0x10
	.byte	0xf7
	.byte	0x27
	.long	0x592
	.uleb128 0x1
	.long	.LASF99
	.byte	0x10
	.byte	0xf9
	.byte	0x5
	.long	0x507
	.byte	0
	.uleb128 0x1
	.long	.LASF100
	.byte	0x10
	.byte	0xfa
	.byte	0xf
	.long	0x61f
	.byte	0x2
	.uleb128 0x1
	.long	.LASF101
	.byte	0x10
	.byte	0xfb
	.byte	0x14
	.long	0x604
	.byte	0x4
	.uleb128 0x1
	.long	.LASF102
	.byte	0x10
	.byte	0xfe
	.byte	0x13
	.long	0x6a4
	.byte	0x8
	.byte	0
	.uleb128 0x19
	.long	.LASF103
	.byte	0x1c
	.byte	0x10
	.value	0x108
	.byte	0x27
	.long	0x5e7
	.uleb128 0x6
	.long	.LASF104
	.byte	0x10
	.value	0x10a
	.byte	0x5
	.long	0x507
	.byte	0
	.uleb128 0x6
	.long	.LASF105
	.byte	0x10
	.value	0x10b
	.byte	0xf
	.long	0x61f
	.byte	0x2
	.uleb128 0x6
	.long	.LASF106
	.byte	0x10
	.value	0x10c
	.byte	0xe
	.long	0x4a1
	.byte	0x4
	.uleb128 0x6
	.long	.LASF107
	.byte	0x10
	.value	0x10d
	.byte	0x15
	.long	0x689
	.byte	0x8
	.uleb128 0x6
	.long	.LASF108
	.byte	0x10
	.value	0x10e
	.byte	0xe
	.long	0x4a1
	.byte	0x18
	.byte	0
	.uleb128 0x3
	.long	.LASF109
	.byte	0x11
	.byte	0x54
	.byte	0xa
	.long	0x5f3
	.uleb128 0x29
	.byte	0x8
	.byte	0x11
	.byte	0x53
	.byte	0x9
	.uleb128 0x3
	.long	.LASF110
	.byte	0x10
	.byte	0x1e
	.byte	0x12
	.long	0x4a1
	.uleb128 0xb
	.long	.LASF111
	.byte	0x4
	.byte	0x10
	.byte	0x1f
	.byte	0x8
	.long	0x61f
	.uleb128 0x1
	.long	.LASF112
	.byte	0x10
	.byte	0x21
	.byte	0xf
	.long	0x5f8
	.byte	0
	.byte	0
	.uleb128 0x3
	.long	.LASF113
	.byte	0x10
	.byte	0x7d
	.byte	0x12
	.long	0x495
	.uleb128 0x18
	.byte	0x10
	.byte	0x10
	.byte	0xdf
	.byte	0x5
	.long	0x659
	.uleb128 0xc
	.long	.LASF114
	.byte	0x10
	.byte	0xe1
	.byte	0xa
	.long	0x659
	.uleb128 0xc
	.long	.LASF115
	.byte	0x10
	.byte	0xe2
	.byte	0xb
	.long	0x669
	.uleb128 0xc
	.long	.LASF116
	.byte	0x10
	.byte	0xe3
	.byte	0xb
	.long	0x679
	.byte	0
	.uleb128 0x7
	.long	0x489
	.long	0x669
	.uleb128 0xa
	.long	0x3a
	.byte	0xf
	.byte	0
	.uleb128 0x7
	.long	0x495
	.long	0x679
	.uleb128 0xa
	.long	0x3a
	.byte	0x7
	.byte	0
	.uleb128 0x7
	.long	0x4a1
	.long	0x689
	.uleb128 0xa
	.long	0x3a
	.byte	0x3
	.byte	0
	.uleb128 0xb
	.long	.LASF117
	.byte	0x10
	.byte	0x10
	.byte	0xdd
	.byte	0x8
	.long	0x6a4
	.uleb128 0x1
	.long	.LASF118
	.byte	0x10
	.byte	0xe4
	.byte	0x9
	.long	0x62b
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x4a
	.long	0x6b4
	.uleb128 0xa
	.long	0x3a
	.byte	0x7
	.byte	0
	.uleb128 0x19
	.long	.LASF119
	.byte	0x30
	.byte	0x12
	.value	0x235
	.byte	0x8
	.long	0x733
	.uleb128 0x6
	.long	.LASF120
	.byte	0x12
	.value	0x237
	.byte	0x7
	.long	0x7e
	.byte	0
	.uleb128 0x6
	.long	.LASF121
	.byte	0x12
	.value	0x238
	.byte	0x7
	.long	0x7e
	.byte	0x4
	.uleb128 0x6
	.long	.LASF122
	.byte	0x12
	.value	0x239
	.byte	0x7
	.long	0x7e
	.byte	0x8
	.uleb128 0x6
	.long	.LASF123
	.byte	0x12
	.value	0x23a
	.byte	0x7
	.long	0x7e
	.byte	0xc
	.uleb128 0x6
	.long	.LASF124
	.byte	0x12
	.value	0x23b
	.byte	0xd
	.long	0x4ad
	.byte	0x10
	.uleb128 0x6
	.long	.LASF125
	.byte	0x12
	.value	0x23c
	.byte	0x14
	.long	0x54b
	.byte	0x18
	.uleb128 0x6
	.long	.LASF126
	.byte	0x12
	.value	0x23d
	.byte	0x9
	.long	0xe0
	.byte	0x20
	.uleb128 0x6
	.long	.LASF127
	.byte	0x12
	.value	0x23e
	.byte	0x14
	.long	0x738
	.byte	0x28
	.byte	0
	.uleb128 0x16
	.long	0x6b4
	.uleb128 0x4
	.long	0x6b4
	.uleb128 0x4
	.long	0x733
	.uleb128 0xf
	.long	0x73d
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
	.uleb128 0x2a
	.byte	0x7
	.byte	0x4
	.long	0x41
	.byte	0x13
	.byte	0x77
	.byte	0x1
	.long	0x79f
	.uleb128 0x13
	.string	"GET"
	.byte	0
	.uleb128 0x13
	.string	"PUT"
	.byte	0x1
	.uleb128 0x8
	.long	.LASF131
	.byte	0x2
	.uleb128 0x13
	.string	"LS"
	.byte	0x3
	.uleb128 0x8
	.long	.LASF132
	.byte	0x4
	.uleb128 0x8
	.long	.LASF133
	.byte	0x5
	.uleb128 0x8
	.long	.LASF134
	.byte	0x6
	.uleb128 0x8
	.long	.LASF135
	.byte	0x7
	.byte	0
	.uleb128 0x3
	.long	.LASF136
	.byte	0x13
	.byte	0x80
	.byte	0x3
	.long	0x761
	.uleb128 0xb
	.long	.LASF137
	.byte	0x28
	.byte	0x13
	.byte	0xa3
	.byte	0x10
	.long	0x7fa
	.uleb128 0x1
	.long	.LASF138
	.byte	0x13
	.byte	0xa4
	.byte	0x9
	.long	0x7e
	.byte	0
	.uleb128 0x1
	.long	.LASF139
	.byte	0x13
	.byte	0xa5
	.byte	0xb
	.long	0xe0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF140
	.byte	0x13
	.byte	0xa6
	.byte	0xb
	.long	0xe0
	.byte	0x10
	.uleb128 0x1
	.long	.LASF141
	.byte	0x13
	.byte	0xa7
	.byte	0x9
	.long	0x7e
	.byte	0x18
	.uleb128 0x1
	.long	.LASF142
	.byte	0x13
	.byte	0xa8
	.byte	0x1d
	.long	0x7fa
	.byte	0x20
	.byte	0
	.uleb128 0x4
	.long	0x7ab
	.uleb128 0x3
	.long	.LASF137
	.byte	0x13
	.byte	0xa9
	.byte	0x2
	.long	0x7ab
	.uleb128 0x17
	.byte	0x60
	.byte	0x13
	.byte	0xb2
	.long	0x87c
	.uleb128 0x1
	.long	.LASF143
	.byte	0x13
	.byte	0xb4
	.byte	0x9
	.long	0x7e
	.byte	0
	.uleb128 0x1
	.long	.LASF144
	.byte	0x13
	.byte	0xb5
	.byte	0xb
	.long	0xe0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF145
	.byte	0x13
	.byte	0xb6
	.byte	0x10
	.long	0x79f
	.byte	0x10
	.uleb128 0x1
	.long	.LASF146
	.byte	0x13
	.byte	0xb7
	.byte	0x16
	.long	0x87c
	.byte	0x18
	.uleb128 0x1
	.long	.LASF147
	.byte	0x13
	.byte	0xb8
	.byte	0x9
	.long	0x7e
	.byte	0x20
	.uleb128 0x1
	.long	.LASF148
	.byte	0x13
	.byte	0xb9
	.byte	0x16
	.long	0x738
	.byte	0x28
	.uleb128 0x1
	.long	.LASF149
	.byte	0x13
	.byte	0xba
	.byte	0x9
	.long	0x7e
	.byte	0x30
	.uleb128 0x1
	.long	.LASF150
	.byte	0x13
	.byte	0xbb
	.byte	0x15
	.long	0x472
	.byte	0x38
	.byte	0
	.uleb128 0x4
	.long	0x7ff
	.uleb128 0x3
	.long	.LASF151
	.byte	0x13
	.byte	0xbc
	.byte	0x3
	.long	0x80b
	.uleb128 0xd
	.long	.LASF152
	.byte	0x11
	.byte	0x8a
	.byte	0x10
	.long	0x2f4
	.long	0x8b2
	.uleb128 0x2
	.long	0x7e
	.uleb128 0x2
	.long	0x47e
	.uleb128 0x2
	.long	0x2e
	.uleb128 0x2
	.long	0x7e
	.byte	0
	.uleb128 0xe
	.long	.LASF153
	.byte	0x14
	.value	0x197
	.byte	0xf
	.long	0x2e
	.long	0x8c9
	.uleb128 0x2
	.long	0x2ea
	.byte	0
	.uleb128 0xe
	.long	.LASF154
	.byte	0x6
	.value	0x16b
	.byte	0xc
	.long	0x7e
	.long	0x8e1
	.uleb128 0x2
	.long	0x2ea
	.uleb128 0x1a
	.byte	0
	.uleb128 0xd
	.long	.LASF155
	.byte	0x15
	.byte	0x40
	.byte	0x14
	.long	0x2ea
	.long	0x906
	.uleb128 0x2
	.long	0x7e
	.uleb128 0x2
	.long	0x483
	.uleb128 0x2
	.long	0xe5
	.uleb128 0x2
	.long	0x4ad
	.byte	0
	.uleb128 0xe
	.long	.LASF156
	.byte	0xd
	.value	0x166
	.byte	0xc
	.long	0x7e
	.long	0x91d
	.uleb128 0x2
	.long	0x7e
	.byte	0
	.uleb128 0x1b
	.long	.LASF157
	.byte	0x16
	.byte	0x22
	.byte	0x10
	.long	0xb0
	.uleb128 0x1b
	.long	.LASF158
	.byte	0x17
	.byte	0x25
	.byte	0xd
	.long	0x75c
	.uleb128 0xd
	.long	.LASF159
	.byte	0x11
	.byte	0x7e
	.byte	0xc
	.long	0x7e
	.long	0x955
	.uleb128 0x2
	.long	0x7e
	.uleb128 0x2
	.long	0x5e7
	.uleb128 0x2
	.long	0x4ad
	.byte	0
	.uleb128 0x2b
	.long	.LASF188
	.byte	0x6
	.value	0x364
	.byte	0xd
	.long	0x968
	.uleb128 0x2
	.long	0x2ea
	.byte	0
	.uleb128 0xd
	.long	.LASF160
	.byte	0x11
	.byte	0x66
	.byte	0xc
	.long	0x7e
	.long	0x988
	.uleb128 0x2
	.long	0x7e
	.uleb128 0x2
	.long	0x7e
	.uleb128 0x2
	.long	0x7e
	.byte	0
	.uleb128 0xe
	.long	.LASF161
	.byte	0x6
	.value	0x165
	.byte	0xc
	.long	0x7e
	.long	0x9a5
	.uleb128 0x2
	.long	0x300
	.uleb128 0x2
	.long	0x2ea
	.uleb128 0x1a
	.byte	0
	.uleb128 0xe
	.long	.LASF162
	.byte	0x12
	.value	0x29d
	.byte	0x14
	.long	0x2ea
	.long	0x9bc
	.uleb128 0x2
	.long	0x7e
	.byte	0
	.uleb128 0xe
	.long	.LASF163
	.byte	0x12
	.value	0x294
	.byte	0xc
	.long	0x7e
	.long	0x9e2
	.uleb128 0x2
	.long	0x2ef
	.uleb128 0x2
	.long	0x2ef
	.uleb128 0x2
	.long	0x742
	.uleb128 0x2
	.long	0x9e7
	.byte	0
	.uleb128 0x4
	.long	0x738
	.uleb128 0xf
	.long	0x9e2
	.uleb128 0x2c
	.long	.LASF164
	.byte	0x18
	.value	0x2f4
	.byte	0xd
	.long	0x9ff
	.uleb128 0x2
	.long	0x7e
	.byte	0
	.uleb128 0xd
	.long	.LASF165
	.byte	0x18
	.byte	0x69
	.byte	0xc
	.long	0x7e
	.long	0xa15
	.uleb128 0x2
	.long	0x2ea
	.byte	0
	.uleb128 0xd
	.long	.LASF166
	.byte	0x14
	.byte	0x3d
	.byte	0xe
	.long	0x48
	.long	0xa35
	.uleb128 0x2
	.long	0x48
	.uleb128 0x2
	.long	0x7e
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0x2d
	.long	.LASF189
	.byte	0x1
	.byte	0x94
	.byte	0x7
	.long	0x48
	.quad	.LFB323
	.quad	.LFE323-.LFB323
	.uleb128 0x1
	.byte	0x9c
	.long	0xb25
	.uleb128 0x10
	.string	"sd"
	.byte	0x94
	.byte	0x21
	.long	0xb25
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30952
	.uleb128 0x14
	.long	.LASF170
	.byte	0x96
	.byte	0x9
	.long	0x7e
	.uleb128 0x9
	.long	.LASF167
	.byte	0x97
	.byte	0xa
	.long	0xb2a
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30752
	.uleb128 0x9
	.long	.LASF168
	.byte	0x98
	.byte	0xa
	.long	0xb2a
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30752
	.uleb128 0x9
	.long	.LASF169
	.byte	0x99
	.byte	0xc
	.long	0x372
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30880
	.uleb128 0x14
	.long	.LASF171
	.byte	0x9a
	.byte	0x9
	.long	0x7e
	.uleb128 0x9
	.long	.LASF149
	.byte	0xa0
	.byte	0x14
	.long	0x318
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30928
	.uleb128 0x9
	.long	.LASF172
	.byte	0xa2
	.byte	0x9
	.long	0xb3b
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30912
	.uleb128 0x2e
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.long	0xb02
	.uleb128 0x11
	.string	"__i"
	.byte	0x9c
	.byte	0x5
	.long	0x41
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30940
	.uleb128 0x9
	.long	.LASF173
	.byte	0x9c
	.byte	0x5
	.long	0xb4b
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30936
	.byte	0
	.uleb128 0x1c
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x9
	.long	.LASF172
	.byte	0xab
	.byte	0xd
	.long	0xb3b
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30896
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	0x881
	.uleb128 0x7
	.long	0xea
	.long	0xb3b
	.uleb128 0x2f
	.long	0x3a
	.value	0x77ff
	.byte	0
	.uleb128 0x7
	.long	0x7e
	.long	0xb4b
	.uleb128 0xa
	.long	0x3a
	.byte	0x3
	.byte	0
	.uleb128 0x4
	.long	0x372
	.uleb128 0x1d
	.long	.LASF175
	.byte	0x76
	.quad	.LFB322
	.quad	.LFE322-.LFB322
	.uleb128 0x1
	.byte	0x9c
	.long	0xb96
	.uleb128 0x10
	.string	"sd"
	.byte	0x76
	.byte	0x26
	.long	0xb25
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x9
	.long	.LASF174
	.byte	0x77
	.byte	0x16
	.long	0x87c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1e
	.long	.LASF142
	.byte	0x7f
	.quad	.L25
	.byte	0
	.uleb128 0x1d
	.long	.LASF176
	.byte	0x1e
	.quad	.LFB321
	.quad	.LFE321-.LFB321
	.uleb128 0x1
	.byte	0x9c
	.long	0xc7a
	.uleb128 0x10
	.string	"sd"
	.byte	0x1e
	.byte	0x27
	.long	0xb25
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0x15
	.long	.LASF177
	.byte	0x2f
	.long	0x75c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -208
	.uleb128 0x15
	.long	.LASF178
	.byte	0x4c
	.long	0x7e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -212
	.uleb128 0x15
	.long	.LASF179
	.byte	0x5e
	.long	0xe0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -224
	.uleb128 0x9
	.long	.LASF174
	.byte	0x1f
	.byte	0x16
	.long	0x87c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x11
	.string	"i"
	.byte	0x20
	.byte	0x9
	.long	0x7e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -184
	.uleb128 0x1e
	.long	.LASF142
	.byte	0x62
	.quad	.L8
	.uleb128 0x1c
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x9
	.long	.LASF180
	.byte	0x26
	.byte	0x19
	.long	0x6b4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x9
	.long	.LASF181
	.byte	0x26
	.byte	0x21
	.long	0x738
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x11
	.string	"ip"
	.byte	0x27
	.byte	0xe
	.long	0xc7a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x9
	.long	.LASF182
	.byte	0x29
	.byte	0xd
	.long	0x7e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -180
	.uleb128 0x14
	.long	.LASF143
	.byte	0x2a
	.byte	0xd
	.long	0x7e
	.uleb128 0x11
	.string	"s"
	.byte	0x56
	.byte	0xe
	.long	0xc7a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0xea
	.long	0xc8a
	.uleb128 0xa
	.long	0x3a
	.byte	0x2d
	.byte	0
	.uleb128 0x30
	.long	.LASF183
	.byte	0x1
	.byte	0x13
	.byte	0x7
	.long	0x48
	.quad	.LFB320
	.quad	.LFE320-.LFB320
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x10
	.string	"sa"
	.byte	0x13
	.byte	0x24
	.long	0x54b
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
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0xf
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.sleb128 30
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
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
	.uleb128 0x1e
	.uleb128 0xa
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
	.sleb128 1
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x20
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x27
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x29
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
	.uleb128 0x2a
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
	.uleb128 0x2b
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
	.uleb128 0x2d
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
	.uleb128 0x2e
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
	.uleb128 0x2f
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x30
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
.LASF154:
	.string	"printf"
.LASF13:
	.string	"__off_t"
.LASF148:
	.string	"connect_to_info"
.LASF22:
	.string	"_IO_read_ptr"
.LASF34:
	.string	"_chain"
.LASF107:
	.string	"sin6_addr"
.LASF139:
	.string	"server_port"
.LASF118:
	.string	"__in6_u"
.LASF7:
	.string	"size_t"
.LASF65:
	.string	"__prev"
.LASF160:
	.string	"socket"
.LASF79:
	.string	"__align"
.LASF40:
	.string	"_shortbuf"
.LASF156:
	.string	"close"
.LASF151:
	.string	"sockDetails_t"
.LASF6:
	.string	"signed char"
.LASF8:
	.string	"__uint8_t"
.LASF54:
	.string	"ssize_t"
.LASF184:
	.string	"GNU C17 14.2.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF157:
	.string	"gettid"
.LASF28:
	.string	"_IO_buf_base"
.LASF93:
	.string	"SOCK_NONBLOCK"
.LASF63:
	.string	"long long unsigned int"
.LASF110:
	.string	"in_addr_t"
.LASF66:
	.string	"__next"
.LASF171:
	.string	"file_fd"
.LASF84:
	.string	"socklen_t"
.LASF142:
	.string	"next"
.LASF43:
	.string	"_codecvt"
.LASF91:
	.string	"SOCK_PACKET"
.LASF143:
	.string	"sockfd"
.LASF55:
	.string	"long long int"
.LASF146:
	.string	"servers_details"
.LASF183:
	.string	"get_in_addr"
.LASF136:
	.string	"commands_t"
.LASF147:
	.string	"number_of_servers"
.LASF35:
	.string	"_fileno"
.LASF23:
	.string	"_IO_read_end"
.LASF115:
	.string	"__u6_addr16"
.LASF12:
	.string	"long int"
.LASF116:
	.string	"__u6_addr32"
.LASF21:
	.string	"_flags"
.LASF121:
	.string	"ai_family"
.LASF18:
	.string	"__ssize_t"
.LASF29:
	.string	"_IO_buf_end"
.LASF38:
	.string	"_cur_column"
.LASF85:
	.string	"SOCK_STREAM"
.LASF52:
	.string	"_IO_codecvt"
.LASF105:
	.string	"sin6_port"
.LASF37:
	.string	"_old_offset"
.LASF42:
	.string	"_offset"
.LASF67:
	.string	"__pthread_list_t"
.LASF167:
	.string	"recieved_buf"
.LASF68:
	.string	"__pthread_mutex_s"
.LASF178:
	.string	"arr_length"
.LASF120:
	.string	"ai_flags"
.LASF11:
	.string	"__uint32_t"
.LASF102:
	.string	"sin_zero"
.LASF181:
	.string	"temp"
.LASF51:
	.string	"_IO_marker"
.LASF88:
	.string	"SOCK_RDM"
.LASF62:
	.string	"fd_set"
.LASF3:
	.string	"unsigned int"
.LASF112:
	.string	"s_addr"
.LASF46:
	.string	"_freeres_buf"
.LASF135:
	.string	"number_of_command"
.LASF161:
	.string	"fprintf"
.LASF144:
	.string	"command"
.LASF177:
	.string	"servers_to_connect_to"
.LASF122:
	.string	"ai_socktype"
.LASF2:
	.string	"long unsigned int"
.LASF173:
	.string	"__arr"
.LASF77:
	.string	"__data"
.LASF26:
	.string	"_IO_write_ptr"
.LASF57:
	.string	"timeval"
.LASF75:
	.string	"__elision"
.LASF5:
	.string	"short unsigned int"
.LASF101:
	.string	"sin_addr"
.LASF175:
	.string	"recv_and_showing"
.LASF153:
	.string	"strlen"
.LASF30:
	.string	"_IO_save_base"
.LASF137:
	.string	"serverDetails_t"
.LASF119:
	.string	"addrinfo"
.LASF82:
	.string	"uint16_t"
.LASF41:
	.string	"_lock"
.LASF170:
	.string	"numbytes"
.LASF113:
	.string	"in_port_t"
.LASF61:
	.string	"fds_bits"
.LASF109:
	.string	"__CONST_SOCKADDR_ARG"
.LASF71:
	.string	"__owner"
.LASF70:
	.string	"__count"
.LASF145:
	.string	"command_int"
.LASF99:
	.string	"sin_family"
.LASF169:
	.string	"readfds"
.LASF131:
	.string	"DELETE"
.LASF104:
	.string	"sin6_family"
.LASF163:
	.string	"getaddrinfo"
.LASF134:
	.string	"HELP"
.LASF152:
	.string	"send"
.LASF133:
	.string	"SERVER_INFO"
.LASF27:
	.string	"_IO_write_end"
.LASF47:
	.string	"_prevchain"
.LASF123:
	.string	"ai_protocol"
.LASF179:
	.string	"message"
.LASF185:
	.string	"_IO_lock_t"
.LASF56:
	.string	"_IO_FILE"
.LASF187:
	.string	"__socket_type"
.LASF174:
	.string	"current"
.LASF90:
	.string	"SOCK_DCCP"
.LASF138:
	.string	"client_sock_fd"
.LASF64:
	.string	"__pthread_internal_list"
.LASF124:
	.string	"ai_addrlen"
.LASF48:
	.string	"_mode"
.LASF140:
	.string	"server_ip"
.LASF100:
	.string	"sin_port"
.LASF96:
	.string	"sa_family"
.LASF58:
	.string	"tv_sec"
.LASF33:
	.string	"_markers"
.LASF180:
	.string	"hints"
.LASF129:
	.string	"__int128 unsigned"
.LASF108:
	.string	"sin6_scope_id"
.LASF165:
	.string	"atoi"
.LASF4:
	.string	"unsigned char"
.LASF60:
	.string	"__fd_mask"
.LASF125:
	.string	"ai_addr"
.LASF9:
	.string	"short int"
.LASF53:
	.string	"_IO_wide_data"
.LASF36:
	.string	"_flags2"
.LASF127:
	.string	"ai_next"
.LASF39:
	.string	"_vtable_offset"
.LASF50:
	.string	"FILE"
.LASF164:
	.string	"exit"
.LASF17:
	.string	"__suseconds_t"
.LASF159:
	.string	"connect"
.LASF117:
	.string	"in6_addr"
.LASF59:
	.string	"tv_usec"
.LASF69:
	.string	"__lock"
.LASF132:
	.string	"EXIT"
.LASF172:
	.string	"servers"
.LASF130:
	.string	"long double"
.LASF19:
	.string	"char"
.LASF20:
	.string	"__socklen_t"
.LASF106:
	.string	"sin6_flowinfo"
.LASF10:
	.string	"__uint16_t"
.LASF176:
	.string	"connect_save_send"
.LASF114:
	.string	"__u6_addr8"
.LASF158:
	.string	"__errno_location"
.LASF155:
	.string	"inet_ntop"
.LASF14:
	.string	"__off64_t"
.LASF24:
	.string	"_IO_read_base"
.LASF162:
	.string	"gai_strerror"
.LASF32:
	.string	"_IO_save_end"
.LASF128:
	.string	"__int128"
.LASF80:
	.string	"pthread_mutex_t"
.LASF74:
	.string	"__spins"
.LASF16:
	.string	"__time_t"
.LASF94:
	.string	"sa_family_t"
.LASF49:
	.string	"_unused2"
.LASF186:
	.string	"stderr"
.LASF166:
	.string	"memset"
.LASF92:
	.string	"SOCK_CLOEXEC"
.LASF168:
	.string	"transmit_buf"
.LASF103:
	.string	"sockaddr_in6"
.LASF182:
	.string	"status"
.LASF95:
	.string	"sockaddr"
.LASF86:
	.string	"SOCK_DGRAM"
.LASF98:
	.string	"sockaddr_in"
.LASF78:
	.string	"__size"
.LASF81:
	.string	"uint8_t"
.LASF72:
	.string	"__nusers"
.LASF31:
	.string	"_IO_backup_base"
.LASF188:
	.string	"perror"
.LASF97:
	.string	"sa_data"
.LASF45:
	.string	"_freeres_list"
.LASF76:
	.string	"__list"
.LASF87:
	.string	"SOCK_RAW"
.LASF126:
	.string	"ai_canonname"
.LASF44:
	.string	"_wide_data"
.LASF189:
	.string	"handle_req"
.LASF73:
	.string	"__kind"
.LASF89:
	.string	"SOCK_SEQPACKET"
.LASF149:
	.string	"timeout"
.LASF150:
	.string	"lock"
.LASF25:
	.string	"_IO_write_base"
.LASF141:
	.string	"dfsno"
.LASF83:
	.string	"uint32_t"
.LASF15:
	.string	"__pid_t"
.LASF111:
	.string	"in_addr"
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
