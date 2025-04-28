	.file	"handle_req.c"
	.text
.Ltext0:
	.file 0 "/home/parth/Work/All_data/university/Network System/Assignments/PA4_not_relaible/PA4/client" "src/handle_req.c"
	.globl	str2md5
	.type	str2md5, @function
str2md5:
.LFB320:
	.file 1 "src/handle_req.c"
	.loc 1 56 1
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
	.loc 1 56 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 57 27
	call	EVP_MD_CTX_new@PLT
	movq	%rax, -48(%rbp)
	.loc 1 58 24
	call	EVP_md5@PLT
	movq	%rax, -40(%rbp)
	.loc 1 59 5
	movq	-40(%rbp), %rcx
	movq	-48(%rbp), %rax
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	EVP_DigestInit_ex@PLT
	.loc 1 63 11
	jmp	.L2
.L5:
	.loc 1 65 12
	cmpl	$512, -76(%rbp)
	jle	.L3
	.loc 1 67 13
	movq	-72(%rbp), %rcx
	movq	-48(%rbp), %rax
	movl	$512, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	EVP_DigestUpdate@PLT
	jmp	.L4
.L3:
	.loc 1 71 13
	movl	-76(%rbp), %eax
	movslq	%eax, %rdx
	movq	-72(%rbp), %rcx
	movq	-48(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	EVP_DigestUpdate@PLT
.L4:
	.loc 1 73 16
	subl	$512, -76(%rbp)
	.loc 1 74 13
	addq	$512, -72(%rbp)
.L2:
	.loc 1 63 19
	cmpl	$0, -76(%rbp)
	jg	.L5
	.loc 1 76 5
	leaq	-60(%rbp), %rdx
	leaq	-32(%rbp), %rcx
	movq	-48(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	EVP_DigestFinal_ex@PLT
	.loc 1 77 5
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	EVP_MD_CTX_free@PLT
	.loc 1 78 14
	movl	$0, -56(%rbp)
.LBB2:
	.loc 1 79 23
	movl	$0, -52(%rbp)
	.loc 1 79 5
	jmp	.L6
.L7:
	.loc 1 81 23
	movl	-52(%rbp), %eax
	movzbl	-32(%rbp,%rax), %eax
	movzbl	%al, %eax
	.loc 1 81 14
	addl	%eax, -56(%rbp)
	.loc 1 79 42 discriminator 3
	addl	$1, -52(%rbp)
.L6:
	.loc 1 79 32 discriminator 1
	movl	-60(%rbp), %eax
	cmpl	%eax, -52(%rbp)
	jb	.L7
.LBE2:
	.loc 1 84 12
	movl	-56(%rbp), %eax
	.loc 1 85 1
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
	.globl	get_in_addr
	.type	get_in_addr, @function
get_in_addr:
.LFB321:
	.loc 1 88 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	.loc 1 89 11
	movq	-8(%rbp), %rax
	movzwl	(%rax), %eax
	.loc 1 89 8
	cmpw	$2, %ax
	jne	.L11
	.loc 1 91 16
	movq	-8(%rbp), %rax
	addq	$4, %rax
	jmp	.L12
.L11:
	.loc 1 94 12
	movq	-8(%rbp), %rax
	addq	$8, %rax
.L12:
	.loc 1 95 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE321:
	.size	get_in_addr, .-get_in_addr
	.globl	cleanup_current_connection
	.type	cleanup_current_connection, @function
cleanup_current_connection:
.LFB322:
	.loc 1 98 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 99 5
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 100 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE322:
	.size	cleanup_current_connection, .-cleanup_current_connection
	.globl	cleanup_connection
	.type	cleanup_connection, @function
cleanup_connection:
.LFB323:
	.loc 1 103 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 1 104 22
	movq	-24(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -16(%rbp)
	.loc 1 105 11
	jmp	.L15
.L19:
.LBB3:
	.loc 1 107 26
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	.loc 1 108 20
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 108 12
	testl	%eax, %eax
	jle	.L16
	.loc 1 109 13
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
.L16:
	.loc 1 111 33
	movq	-16(%rbp), %rax
	movl	$-1, (%rax)
	.loc 1 112 20
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 112 12
	testq	%rax, %rax
	je	.L17
	.loc 1 113 25
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 113 13
	movq	%rax, %rdi
	call	free@PLT
.L17:
	.loc 1 114 28
	movq	-16(%rbp), %rax
	movq	$0, 16(%rax)
	.loc 1 115 20
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 115 12
	testq	%rax, %rax
	je	.L18
	.loc 1 116 25
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 116 13
	movq	%rax, %rdi
	call	free@PLT
.L18:
	.loc 1 117 30
	movq	-16(%rbp), %rax
	movq	$0, 8(%rax)
	.loc 1 119 17
	movq	-16(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -16(%rbp)
	.loc 1 121 9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L15:
.LBE3:
	.loc 1 105 12
	cmpq	$0, -16(%rbp)
	jne	.L19
	.loc 1 124 1
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE323:
	.size	cleanup_connection, .-cleanup_connection
	.section	.rodata
	.align 8
.LC0:
	.string	"\033[31m[-] Port Value < 1024 ! keep port value higher than 1024 \n\033[0m"
	.align 8
.LC1:
	.string	"\033[31m[-] ERROR: DNS resolution failed - %s\n\033[0m"
	.align 8
.LC2:
	.string	"\033[31m[-] ERROR: Cannot create socket for server (%s:%s)\n\033[0m"
	.align 8
.LC3:
	.string	"\033[33m\n[!] CONNECTION TIMEOUT: Server %d (%s:%s)\n\033[0m"
	.align 8
.LC4:
	.string	"\033[33m    Server did not respond within 1 second\n\033[0m"
	.align 8
.LC5:
	.string	"\033[31m\n[-] CONNECTION FAILED: Server %d (%s:%s)\n\033[0m"
	.align 8
.LC6:
	.string	"\033[31m    Error: %s (errno: %d)\n\033[0m"
	.align 8
.LC7:
	.string	"\033[31m\n[-] SELECT ERROR: Server %d (%s:%s)\n\033[0m"
	.align 8
.LC8:
	.string	"\033[31m\n[-] ERROR: Connection attempt exhausted all available addresses (thread: %d, errno: %d)\n\033[0m"
	.align 8
.LC9:
	.string	"\033[32m\n[+] CONNECTION ESTABLISHED: Server %d\n\033[0m"
.LC10:
	.string	"\033[32m    Address: %s:%s\n\033[0m"
	.text
	.globl	connect_server
	.type	connect_server, @function
connect_server:
.LFB324:
	.loc 1 127 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$344, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -328(%rbp)
	movq	%rsi, -336(%rbp)
	movl	%edx, -340(%rbp)
	.loc 1 127 1
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 1 129 9
	movl	$1, -308(%rbp)
	.loc 1 131 39
	movq	-328(%rbp), %rax
	movl	-340(%rbp), %edx
	movslq	%edx, %rdx
	addq	$12, %rdx
	movl	$-1, (%rax,%rdx,4)
	.loc 1 132 29
	movq	-336(%rbp), %rax
	movl	$-1, (%rax)
	.loc 1 135 5
	leaq	-256(%rbp), %rax
	movl	$48, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 136 21
	movl	$0, -252(%rbp)
	.loc 1 137 23
	movl	$1, -248(%rbp)
	.loc 1 139 21
	movq	-336(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 139 9
	movq	%rax, %rdi
	call	atoi@PLT
	.loc 1 139 8 discriminator 1
	cmpl	$1024, %eax
	jg	.L21
	.loc 1 141 9
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$67, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 142 9
	movl	$1, %edi
	call	exit@PLT
.L21:
	.loc 1 145 19
	movq	-328(%rbp), %rax
	leaq	40(%rax), %rcx
	.loc 1 145 58
	movq	-336(%rbp), %rax
	movq	8(%rax), %rsi
	.loc 1 145 38
	movq	-336(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 145 19
	leaq	-256(%rbp), %rdx
	movq	%rax, %rdi
	call	getaddrinfo@PLT
	movl	%eax, -308(%rbp)
	.loc 1 145 8 discriminator 1
	cmpl	$0, -308(%rbp)
	jns	.L22
	.loc 1 147 9
	movl	-308(%rbp), %eax
	movl	%eax, %edi
	call	gai_strerror@PLT
	movq	%rax, %rdx
	.loc 1 147 9 is_stmt 0 discriminator 1
	movq	stderr(%rip), %rax
	leaq	.LC1(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 148 16 is_stmt 1
	movl	$-1, -308(%rbp)
	.loc 1 149 9
	jmp	.L23
.L22:
	.loc 1 152 15
	movq	-328(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -288(%rbp)
	.loc 1 152 5
	jmp	.L24
.L37:
.LBB4:
	.loc 1 154 40
	movq	-288(%rbp), %rax
	movl	12(%rax), %edx
	movq	-288(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-288(%rbp), %rax
	movl	4(%rax), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	socket@PLT
	.loc 1 154 38 discriminator 1
	movq	-336(%rbp), %rdx
	movl	%eax, (%rdx)
	.loc 1 154 21 discriminator 1
	movq	-336(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 154 12 discriminator 1
	testl	%eax, %eax
	jns	.L25
	.loc 1 156 13
	movq	-336(%rbp), %rax
	movq	8(%rax), %rcx
	movq	-336(%rbp), %rax
	movq	16(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 157 20
	movl	$-1, -308(%rbp)
	.loc 1 158 13
	jmp	.L23
.L25:
	.loc 1 162 21
	movq	-336(%rbp), %rax
	movl	(%rax), %eax
	movl	$0, %edx
	movl	$3, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	fcntl@PLT
	movl	%eax, -300(%rbp)
	.loc 1 163 9
	movl	-300(%rbp), %eax
	orb	$8, %ah
	movl	%eax, %edx
	movq	-336(%rbp), %rax
	movl	(%rax), %eax
	movl	$4, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	fcntl@PLT
	.loc 1 166 30
	movq	-288(%rbp), %rax
	movl	16(%rax), %edx
	.loc 1 166 67
	movq	-288(%rbp), %rax
	movq	24(%rax), %rax
	.loc 1 166 30
	movq	%rax, %rcx
	movq	-336(%rbp), %rax
	movl	(%rax), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	connect@PLT
	movl	%eax, -296(%rbp)
	.loc 1 168 12
	cmpl	$0, -296(%rbp)
	jns	.L26
	.loc 1 170 17
	call	__errno_location@PLT
	.loc 1 170 17 is_stmt 0 discriminator 1
	movl	(%rax), %eax
	.loc 1 170 16 is_stmt 1 discriminator 1
	cmpl	$115, %eax
	jne	.L27
.LBB5:
.LBB6:
	.loc 1 176 17
	leaq	-208(%rbp), %rax
	movq	%rax, -280(%rbp)
	movl	$0, -304(%rbp)
	jmp	.L28
.L29:
	.loc 1 176 17 is_stmt 0 discriminator 3
	movq	-280(%rbp), %rax
	movl	-304(%rbp), %edx
	movq	$0, (%rax,%rdx,8)
	addl	$1, -304(%rbp)
.L28:
	.loc 1 176 17 discriminator 1
	cmpl	$15, -304(%rbp)
	jbe	.L29
.LBE6:
	.loc 1 177 17 is_stmt 1
	movq	-336(%rbp), %rax
	movl	(%rax), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	movl	%eax, %esi
	movslq	%esi, %rax
	movq	-208(%rbp,%rax,8), %rdx
	movq	-336(%rbp), %rax
	movl	(%rax), %eax
	andl	$63, %eax
	movl	$1, %edi
	movl	%eax, %ecx
	salq	%cl, %rdi
	movq	%rdi, %rax
	orq	%rax, %rdx
	movslq	%esi, %rax
	movq	%rdx, -208(%rbp,%rax,8)
	.loc 1 180 27
	movq	$1, -272(%rbp)
	.loc 1 181 28
	movq	$0, -264(%rbp)
	.loc 1 184 51
	movq	-336(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 184 37
	leal	1(%rax), %edi
	leaq	-272(%rbp), %rdx
	leaq	-208(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movq	%rax, %rdx
	movl	$0, %esi
	call	select@PLT
	movl	%eax, -292(%rbp)
	.loc 1 186 20
	cmpl	$0, -292(%rbp)
	jne	.L30
	.loc 1 189 21
	movq	-336(%rbp), %rax
	movq	8(%rax), %rcx
	movq	-336(%rbp), %rax
	movq	16(%rax), %rdx
	movl	-340(%rbp), %eax
	leal	1(%rax), %esi
	movq	stderr(%rip), %rax
	movq	%rcx, %r8
	movq	%rdx, %rcx
	movl	%esi, %edx
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 190 21
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$52, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 191 21
	movq	-336(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 192 28
	movl	$-1, -308(%rbp)
	.loc 1 193 21
	jmp	.L35
.L30:
	.loc 1 195 25
	cmpl	$0, -292(%rbp)
	jle	.L32
.LBB7:
	.loc 1 198 25
	movl	$0, -316(%rbp)
	.loc 1 199 31
	movl	$4, -312(%rbp)
	.loc 1 200 25
	movq	-336(%rbp), %rax
	movl	(%rax), %eax
	leaq	-312(%rbp), %rcx
	leaq	-316(%rbp), %rdx
	movq	%rcx, %r8
	movq	%rdx, %rcx
	movl	$4, %edx
	movl	$1, %esi
	movl	%eax, %edi
	call	getsockopt@PLT
	.loc 1 200 24 discriminator 1
	testl	%eax, %eax
	js	.L33
	.loc 1 200 110 discriminator 2
	movl	-316(%rbp), %eax
	.loc 1 200 101 discriminator 2
	testl	%eax, %eax
	je	.L26
.L33:
	.loc 1 203 25
	movq	-336(%rbp), %rax
	movq	8(%rax), %rcx
	movq	-336(%rbp), %rax
	movq	16(%rax), %rdx
	movl	-340(%rbp), %eax
	leal	1(%rax), %esi
	movq	stderr(%rip), %rax
	movq	%rcx, %r8
	movq	%rdx, %rcx
	movl	%esi, %edx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 204 25
	movl	-316(%rbp), %ebx
	movl	-316(%rbp), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rdx
	.loc 1 204 25 is_stmt 0 discriminator 1
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 205 25 is_stmt 1
	movq	-336(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 206 32
	movl	$-1, -308(%rbp)
.LBE7:
	.loc 1 193 21
	jmp	.L35
.L32:
	.loc 1 214 21
	movq	-336(%rbp), %rax
	movq	8(%rax), %rcx
	movq	-336(%rbp), %rax
	movq	16(%rax), %rdx
	movl	-340(%rbp), %eax
	leal	1(%rax), %esi
	movq	stderr(%rip), %rax
	movq	%rcx, %r8
	movq	%rdx, %rcx
	movl	%esi, %edx
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 215 95
	call	__errno_location@PLT
	.loc 1 215 21 discriminator 1
	movl	(%rax), %ebx
	.loc 1 215 87 discriminator 1
	call	__errno_location@PLT
	.loc 1 215 21 discriminator 2
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rdx
	.loc 1 215 21 is_stmt 0 discriminator 3
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 216 21 is_stmt 1
	movq	-336(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 217 28
	movl	$-1, -308(%rbp)
	.loc 1 218 21
	jmp	.L35
.L27:
.LBE5:
	.loc 1 224 17
	movq	-336(%rbp), %rax
	movq	8(%rax), %rcx
	movq	-336(%rbp), %rax
	movq	16(%rax), %rdx
	movl	-340(%rbp), %eax
	leal	1(%rax), %esi
	movq	stderr(%rip), %rax
	movq	%rcx, %r8
	movq	%rdx, %rcx
	movl	%esi, %edx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 225 91
	call	__errno_location@PLT
	.loc 1 225 17 discriminator 1
	movl	(%rax), %ebx
	.loc 1 225 83 discriminator 1
	call	__errno_location@PLT
	.loc 1 225 17 discriminator 2
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rdx
	.loc 1 225 17 is_stmt 0 discriminator 3
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 226 17 is_stmt 1
	movq	-336(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 227 24
	movl	$-1, -308(%rbp)
	.loc 1 228 17
	jmp	.L35
.L26:
	.loc 1 233 9
	movq	-336(%rbp), %rax
	movl	(%rax), %eax
	movl	-300(%rbp), %edx
	movl	$4, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	fcntl@PLT
	.loc 1 236 9
	jmp	.L36
.L35:
.LBE4:
	.loc 1 152 57 discriminator 2
	movq	-288(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -288(%rbp)
.L24:
	.loc 1 152 43 discriminator 1
	cmpq	$0, -288(%rbp)
	jne	.L37
.L36:
	.loc 1 239 8
	cmpq	$0, -288(%rbp)
	jne	.L38
	.loc 1 241 140
	call	__errno_location@PLT
	.loc 1 241 9 discriminator 1
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	.loc 1 241 9 is_stmt 0 discriminator 2
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC8(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 242 16 is_stmt 1
	movl	$-1, -308(%rbp)
	.loc 1 243 9
	jmp	.L23
.L38:
	.loc 1 246 48
	movq	-336(%rbp), %rax
	movl	(%rax), %edx
	.loc 1 246 39
	movq	-328(%rbp), %rax
	movl	-340(%rbp), %ecx
	movslq	%ecx, %rcx
	addq	$12, %rcx
	movl	%edx, (%rax,%rcx,4)
	.loc 1 247 7
	movq	-328(%rbp), %rax
	movl	68(%rax), %eax
	.loc 1 247 36
	leal	1(%rax), %edx
	movq	-328(%rbp), %rax
	movl	%edx, 68(%rax)
	.loc 1 250 32
	movq	-288(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	get_in_addr
	movq	%rax, %rsi
	.loc 1 250 5 discriminator 1
	movq	-288(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-80(%rbp), %rdx
	movl	$46, %ecx
	movl	%eax, %edi
	call	inet_ntop@PLT
	.loc 1 251 5
	movl	-340(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 252 5
	movq	-336(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-336(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 255 15
	movq	$1, -272(%rbp)
	.loc 1 256 16
	movq	$0, -264(%rbp)
	.loc 1 257 5
	movq	-336(%rbp), %rax
	movl	(%rax), %eax
	leaq	-272(%rbp), %rdx
	movl	$16, %r8d
	movq	%rdx, %rcx
	movl	$21, %edx
	movl	$1, %esi
	movl	%eax, %edi
	call	setsockopt@PLT
	.loc 1 258 5
	movq	-336(%rbp), %rax
	movl	(%rax), %eax
	leaq	-272(%rbp), %rdx
	movl	$16, %r8d
	movq	%rdx, %rcx
	movl	$20, %edx
	movl	$1, %esi
	movl	%eax, %edi
	call	setsockopt@PLT
.L23:
	.loc 1 261 11
	movq	-328(%rbp), %rax
	movq	40(%rax), %rax
	.loc 1 261 8
	testq	%rax, %rax
	je	.L39
	.loc 1 262 9
	movq	-328(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, %rdi
	call	freeaddrinfo@PLT
	.loc 1 263 29
	movq	-328(%rbp), %rax
	movq	$0, 40(%rax)
.L39:
	.loc 1 265 12
	movl	-308(%rbp), %eax
	.loc 1 266 1
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L41
	call	__stack_chk_fail@PLT
.L41:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE324:
	.size	connect_server, .-connect_server
	.section	.rodata
	.align 8
.LC11:
	.string	"\033[36m\n[*] FILE DISTRIBUTION MAPPING\n\033[0m"
	.align 8
.LC12:
	.string	"\033[36m    File hash value: %d\n\033[0m"
	.align 8
.LC13:
	.string	"\033[36m    Starting server: %d\n\n\033[0m"
	.align 8
.LC14:
	.string	"\033[36m[*] CHUNK ASSIGNMENT: Server %d\n\033[0m"
.LC15:
	.string	"\033[36m    Storing chunks: \033[0m"
.LC16:
	.string	"\033[36m%d \033[0m"
	.align 8
.LC17:
	.string	"\033[31m[-] ERROR: Send operation failed (errno: %d - %s)\n\033[0m"
	.align 8
.LC18:
	.string	"\033[31m[-] ERROR: Receive operation failed (errno: %d - %s)\n\033[0m"
	.align 8
.LC19:
	.string	"\033[33m[-] NOTICE: Connection closed by client\n\033[0m"
.LC20:
	.string	"ack\t\n0\t\n"
	.string	""
	.align 8
.LC21:
	.string	"\033[31m[-] ERROR: Received NACK from server for chunk %d\n\033[0m"
	.align 8
.LC22:
	.string	"\033[32m[+] Stored chunk %d to server %d\n\033[0m"
	.align 8
.LC23:
	.string	"\033[31m\n=========================================\n\033[0m"
	.align 8
.LC24:
	.string	"\033[31m    PUT OPERATION FAILED\n\033[0m"
.LC25:
	.string	"\033[31m    File: %s\n\033[0m"
	.align 8
.LC26:
	.string	"\033[31m    Cannot store file reliably\n\033[0m"
	.align 8
.LC27:
	.string	"\033[31m    Missing redundancy for chunk %d\n\033[0m"
	.align 8
.LC28:
	.string	"\033[31m=========================================\n\n\033[0m"
	.align 8
.LC29:
	.string	"\033[33m\n=========================================\n\033[0m"
	.align 8
.LC30:
	.string	"\033[33m    RELIABLE PUT OPERATION FAILED FOR CHUNK (<2) %d\n\033[0m"
	.align 8
.LC31:
	.string	"\033[33m=========================================\n\n\033[0m"
	.align 8
.LC32:
	.string	"\033[32m\n=========================================\n\033[0m"
	.align 8
.LC33:
	.string	"\033[32m    FILE UPLOAD SUCCESSFUL\n\033[0m"
.LC34:
	.string	"\033[32m    File: %s\n\033[0m"
	.align 8
.LC35:
	.string	"\033[32m    All chunks stored (if not reliable you still can get the file)\n\033[0m"
	.align 8
.LC36:
	.string	"\033[32m=========================================\n\n\033[0m"
	.text
	.globl	connect_and_put_chunks
	.type	connect_and_put_chunks, @function
connect_and_put_chunks:
.LFB325:
	.loc 1 269 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	leaq	-28672(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$2200, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -30856(%rbp)
	movq	%rsi, -30864(%rbp)
	movq	%rdx, -30872(%rbp)
	movl	%ecx, -30876(%rbp)
	.loc 1 269 1
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 1 271 5
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 272 5
	movl	-30876(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 273 62
	movq	-30856(%rbp), %rax
	movl	64(%rax), %ebx
	.loc 1 273 58
	movl	-30876(%rbp), %eax
	cltd
	idivl	%ebx
	movl	%edx, %ecx
	movl	%ecx, %eax
	.loc 1 273 5
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 275 22
	movq	-30856(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -30792(%rbp)
	.loc 1 276 9
	movl	$0, -30836(%rbp)
	.loc 1 281 5
	leaq	-30768(%rbp), %rax
	movl	$16, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 283 11
	jmp	.L43
.L57:
.LBB8:
	.loc 1 285 13
	movl	-30836(%rbp), %edx
	movq	-30792(%rbp), %rcx
	movq	-30856(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	connect_server
	.loc 1 285 12 discriminator 1
	testl	%eax, %eax
	js	.L66
	.loc 1 288 27
	movl	-30876(%rbp), %edx
	movl	-30836(%rbp), %eax
	addl	%eax, %edx
	.loc 1 288 36
	movq	-30856(%rbp), %rax
	movl	64(%rax), %ecx
	.loc 1 288 13
	movl	%edx, %eax
	cltd
	idivl	%ecx
	movl	%edx, -30832(%rbp)
	.loc 1 290 9
	movl	-30836(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 291 9
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBB9:
	.loc 1 292 18
	movl	$0, -30828(%rbp)
	.loc 1 292 9
	jmp	.L46
.L47:
	.loc 1 294 44
	movl	-30832(%rbp), %edx
	movl	-30828(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	.loc 1 294 53
	movq	-30856(%rbp), %rax
	movl	64(%rax), %ebx
	.loc 1 294 49
	movl	%ecx, %eax
	cltd
	idivl	%ebx
	movl	%edx, %ecx
	movl	%ecx, %eax
	.loc 1 294 13
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 292 63 discriminator 3
	addl	$1, -30828(%rbp)
.L46:
	.loc 1 292 27 discriminator 1
	cmpl	$1, -30828(%rbp)
	jle	.L47
.LBE9:
	.loc 1 296 9
	movl	$10, %edi
	call	putchar@PLT
.LBB10:
	.loc 1 298 18
	movl	$0, -30824(%rbp)
	.loc 1 298 9
	jmp	.L48
.L56:
.LBB11:
	.loc 1 301 28
	movl	-30832(%rbp), %edx
	movl	-30824(%rbp), %eax
	addl	%eax, %edx
	.loc 1 301 37
	movq	-30856(%rbp), %rax
	movl	64(%rax), %ecx
	.loc 1 301 19
	movl	%edx, %eax
	cltd
	idivl	%ecx
	movl	%edx, -30832(%rbp)
	.loc 1 302 26
	movl	-30832(%rbp), %eax
	cltq
	movl	-30768(%rbp,%rax,4), %eax
	.loc 1 302 33
	leal	1(%rax), %edx
	movl	-30832(%rbp), %eax
	cltq
	movl	%edx, -30768(%rbp,%rax,4)
	.loc 1 304 30
	movb	$1, -30778(%rbp)
	movl	-30832(%rbp), %eax
	movb	%al, -30777(%rbp)
	.loc 1 307 45
	movq	-30856(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 307 36
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 304 30
	movl	%eax, -30776(%rbp)
	.loc 1 308 43
	movl	-30832(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-30872(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	.loc 1 304 30
	movl	%eax, -30772(%rbp)
.LBB12:
	.loc 1 310 24
	movq	-30792(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30778(%rbp), %rsi
	movl	$0, %ecx
	movl	$10, %edx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 310 24 is_stmt 0 discriminator 1
	movl	%eax, -30812(%rbp)
	cmpl	$0, -30812(%rbp)
	jg	.L49
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 310 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 310 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 310 24
	jmp	.L45
.L49:
	.loc 1 310 24 discriminator 2
	movl	-30812(%rbp), %eax
.LBE12:
	.loc 1 310 22 is_stmt 1 discriminator 2
	movl	%eax, -30808(%rbp)
.LBB13:
	.loc 1 313 24
	movl	-30776(%rbp), %eax
	movl	%eax, %edx
	movq	-30856(%rbp), %rax
	movq	16(%rax), %rsi
	movq	-30792(%rbp), %rax
	movl	(%rax), %eax
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 313 24 is_stmt 0 discriminator 1
	movl	%eax, -30804(%rbp)
	cmpl	$0, -30804(%rbp)
	jg	.L51
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 313 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 313 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 313 24
	jmp	.L45
.L51:
	.loc 1 313 24 discriminator 2
	movl	-30804(%rbp), %eax
.LBE13:
	.loc 1 313 22 is_stmt 1 discriminator 2
	movl	%eax, -30808(%rbp)
.LBB14:
	.loc 1 315 24
	movl	-30832(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-30872(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movslq	%eax, %rdx
	movl	-30832(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movq	-30864(%rbp), %rax
	addq	%rcx, %rax
	movq	(%rax), %rsi
	movq	-30792(%rbp), %rax
	movl	(%rax), %eax
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 315 24 is_stmt 0 discriminator 1
	movl	%eax, -30800(%rbp)
	cmpl	$0, -30800(%rbp)
	jg	.L52
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 315 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 315 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 315 24
	jmp	.L45
.L52:
	.loc 1 315 24 discriminator 2
	movl	-30800(%rbp), %eax
.LBE14:
	.loc 1 315 22 is_stmt 1 discriminator 2
	movl	%eax, -30808(%rbp)
	.loc 1 317 13
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.LBB15:
	.loc 1 318 24
	movq	-30792(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30752(%rbp), %rsi
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 318 24 is_stmt 0 discriminator 1
	movl	%eax, -30796(%rbp)
	cmpl	$0, -30796(%rbp)
	jns	.L53
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 318 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 318 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 318 24
	jmp	.L45
.L53:
	.loc 1 318 24 discriminator 2
	cmpl	$0, -30796(%rbp)
	jne	.L54
	.loc 1 318 24 discriminator 3
	movq	-30792(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 318 24 discriminator 1
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 318 24
	jmp	.L45
.L54:
	.loc 1 318 24 discriminator 4
	movl	-30796(%rbp), %eax
.LBE15:
	.loc 1 318 22 is_stmt 1 discriminator 4
	movl	%eax, -30808(%rbp)
	.loc 1 320 17
	leaq	-30752(%rbp), %rax
	movl	$7, %edx
	leaq	.LC20(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 320 16 discriminator 1
	testl	%eax, %eax
	je	.L55
	.loc 1 322 17
	movl	-30832(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 323 17
	jmp	.L45
.L55:
	.loc 1 327 17
	movl	-30836(%rbp), %eax
	leal	1(%rax), %edx
	movl	-30832(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBE11:
	.loc 1 298 63 discriminator 2
	addl	$1, -30824(%rbp)
.L48:
	.loc 1 298 27 discriminator 1
	cmpl	$1, -30824(%rbp)
	jle	.L56
.LBE10:
	.loc 1 333 5
	jmp	.L45
.L66:
	.loc 1 286 13
	nop
.L45:
	.loc 1 334 9
	movq	-30792(%rbp), %rax
	movq	%rax, %rdi
	call	cleanup_current_connection
	.loc 1 335 10
	addl	$1, -30836(%rbp)
	.loc 1 336 17
	movq	-30792(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -30792(%rbp)
.L43:
.LBE8:
	.loc 1 283 12
	cmpq	$0, -30792(%rbp)
	jne	.L57
.LBB16:
	.loc 1 339 14
	movl	$0, -30820(%rbp)
	.loc 1 339 5
	jmp	.L58
.L61:
	.loc 1 341 26
	movl	-30820(%rbp), %eax
	cltq
	movl	-30768(%rbp,%rax,4), %eax
	.loc 1 341 12
	testl	%eax, %eax
	jg	.L59
	.loc 1 343 13
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 344 13
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 345 13
	movq	-30856(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC25(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 346 13
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 347 13
	movl	-30820(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 348 13
	leaq	.LC28(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L42
.L59:
	.loc 1 339 43 discriminator 2
	addl	$1, -30820(%rbp)
.L58:
	.loc 1 339 23 discriminator 1
	cmpl	$3, -30820(%rbp)
	jle	.L61
.LBE16:
.LBB17:
	.loc 1 353 14
	movl	$0, -30816(%rbp)
	.loc 1 353 5
	jmp	.L62
.L64:
	.loc 1 355 26
	movl	-30816(%rbp), %eax
	cltq
	movl	-30768(%rbp,%rax,4), %eax
	.loc 1 355 12
	cmpl	$1, %eax
	jg	.L63
	.loc 1 357 13
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 358 13
	movl	-30816(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 359 13
	leaq	.LC31(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L63:
	.loc 1 353 43 discriminator 2
	addl	$1, -30816(%rbp)
.L62:
	.loc 1 353 23 discriminator 1
	cmpl	$3, -30816(%rbp)
	jle	.L64
.LBE17:
	.loc 1 364 5
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 365 5
	leaq	.LC33(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 366 5
	movq	-30856(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC34(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 367 5
	leaq	.LC35(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 368 5
	leaq	.LC36(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L42:
	.loc 1 369 1
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L65
	call	__stack_chk_fail@PLT
.L65:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE325:
	.size	connect_and_put_chunks, .-connect_and_put_chunks
	.section	.rodata
.LC37:
	.string	"rb"
	.align 8
.LC38:
	.string	"\033[31m[-] Error opening file %d \n\033[0m"
	.align 8
.LC39:
	.string	"\033[36m\n[*] FILE PREPARATION\n\033[0m"
.LC40:
	.string	"\033[36m    Filename: %s\n\033[0m"
	.align 8
.LC41:
	.string	"\033[36m    Total size: %d bytes\n\033[0m"
	.align 8
.LC42:
	.string	"\033[36m    Chunking into %d parts\n\n\033[0m"
	.align 8
.LC43:
	.string	"\033[36m[*] CHUNK CREATED: %d of %d\n\033[0m"
.LC44:
	.string	"\033[36m    Size: %d bytes\n\n\033[0m"
	.text
	.globl	put_file
	.type	put_file, @function
put_file:
.LFB326:
	.loc 1 372 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movq	%rdi, -120(%rbp)
	.loc 1 372 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 373 24
	movq	-120(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 373 16
	leaq	.LC37(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -80(%rbp)
	.loc 1 374 8
	cmpq	$0, -80(%rbp)
	jne	.L68
	.loc 1 376 67
	call	__errno_location@PLT
	.loc 1 376 9 discriminator 1
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC38(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	jmp	.L67
.L68:
	.loc 1 380 37
	movq	-120(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 380 27
	movl	$47, %esi
	movq	%rax, %rdi
	call	strrchr@PLT
	movq	%rax, -88(%rbp)
	.loc 1 381 8
	cmpq	$0, -88(%rbp)
	jne	.L70
	.loc 1 383 23
	movq	-120(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -88(%rbp)
	jmp	.L71
.L70:
	.loc 1 387 22
	addq	$1, -88(%rbp)
.L71:
	.loc 1 390 44
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 390 21 discriminator 1
	movl	%eax, %edx
	movq	-88(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	str2md5
	movl	%eax, -96(%rbp)
	.loc 1 391 18
	movq	-120(%rbp), %rax
	movq	-88(%rbp), %rdx
	movq	%rdx, 16(%rax)
	.loc 1 393 5
	movq	-80(%rbp), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseek@PLT
	.loc 1 394 16
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	ftell@PLT
	.loc 1 394 9 discriminator 1
	movl	%eax, -92(%rbp)
	.loc 1 395 5
	movq	-80(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseek@PLT
	.loc 1 399 9
	movl	$0, -108(%rbp)
	.loc 1 401 5
	leaq	.LC39(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 402 5
	movq	-120(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC40(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 403 5
	movl	-92(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC41(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 404 5
	movl	$4, %esi
	leaq	.LC42(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBB18:
	.loc 1 406 14
	movl	$0, -104(%rbp)
	.loc 1 406 5
	jmp	.L72
.L75:
.LBB19:
	.loc 1 409 12
	cmpl	$3, -104(%rbp)
	jne	.L73
	.loc 1 410 24
	movl	-92(%rbp), %eax
	subl	-108(%rbp), %eax
	movl	%eax, -100(%rbp)
	jmp	.L74
.L73:
	.loc 1 412 24
	movl	-92(%rbp), %eax
	leal	3(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$2, %eax
	movl	%eax, -100(%rbp)
.L74:
	.loc 1 413 36
	movl	-100(%rbp), %eax
	addl	%eax, -108(%rbp)
	.loc 1 415 24
	movl	-104(%rbp), %eax
	cltq
	movl	-100(%rbp), %edx
	movl	%edx, -64(%rbp,%rax,4)
	.loc 1 417 23
	movl	-100(%rbp), %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -72(%rbp)
	.loc 1 418 19
	movl	-104(%rbp), %eax
	cltq
	movq	-72(%rbp), %rdx
	movq	%rdx, -48(%rbp,%rax,8)
	.loc 1 419 9
	movl	-100(%rbp), %eax
	movslq	%eax, %rdx
	movq	-80(%rbp), %rcx
	movq	-72(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	fread@PLT
	.loc 1 421 9
	movl	-104(%rbp), %eax
	addl	$1, %eax
	movl	$4, %edx
	movl	%eax, %esi
	leaq	.LC43(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 422 9
	movl	-100(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC44(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBE19:
	.loc 1 406 43 discriminator 2
	addl	$1, -104(%rbp)
.L72:
	.loc 1 406 23 discriminator 1
	cmpl	$3, -104(%rbp)
	jle	.L75
.LBE18:
	.loc 1 425 62
	movq	-120(%rbp), %rax
	movl	64(%rax), %eax
	movl	%eax, %ecx
	.loc 1 425 58
	movl	-96(%rbp), %eax
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	.loc 1 425 5
	movl	%eax, %ecx
	leaq	-64(%rbp), %rdx
	leaq	-48(%rbp), %rsi
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	connect_and_put_chunks
.L67:
	.loc 1 426 1
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L76
	call	__stack_chk_fail@PLT
.L76:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE326:
	.size	put_file, .-put_file
	.section	.rodata
	.align 8
.LC45:
	.string	"\033[32m[+] CONNECTION ESTABLISHED: Server %d is online\n\033[0m"
	.align 8
.LC46:
	.string	"\033[36m[*] REQUESTING CHUNKS: Server %d should have chunks \033[0m"
.LC47:
	.string	"%d "
	.align 8
.LC48:
	.string	"\033[33m    [!] Skipping chunk %d (already downloaded)\n\033[0m"
	.align 8
.LC49:
	.string	"\033[36m    [*] Requesting chunk %d from server %d\n\033[0m"
	.align 8
.LC50:
	.string	"\033[31m    [-] Server %d does not have chunk %d\n\033[0m"
	.align 8
.LC51:
	.string	"\033[32m    [+] Server has chunk %d, downloading...\n\033[0m"
	.align 8
.LC52:
	.string	"\033[36m    [*] Chunk %d size: %d bytes\n\033[0m"
	.align 8
.LC53:
	.string	"\033[31m    [-] ERROR: Memory allocation failed for chunk %d\n\033[0m"
	.align 8
.LC55:
	.string	"\033[36m    [*] Downloaded %d/%d bytes (%.1f%%)\n\033[0m"
	.align 8
.LC56:
	.string	"\033[32m    [+] CHUNK %d DOWNLOADED SUCCESSFULLY (%d bytes)\n\033[0m"
	.align 8
.LC57:
	.string	"\033[31m    [-] ERROR: Failed to download chunk %d\n\033[0m"
	.align 8
.LC58:
	.string	"\033[36m\n=========================================\n\033[0m"
	.align 8
.LC59:
	.string	"\033[36m    DOWNLOAD SUMMARY: %s\n\033[0m"
	.align 8
.LC60:
	.string	"\033[36m=========================================\n\n\033[0m"
	.align 8
.LC61:
	.string	"\033[36mServer status: %d/%d available\n\033[0m"
	.align 8
.LC62:
	.string	"\033[36mChunks status: %d/%d downloaded\n\n\033[0m"
.LC63:
	.string	"Chunk breakdown:"
	.align 8
.LC64:
	.string	"\033[32m  [\342\234\223] Chunk %d: %d bytes\n\033[0m"
	.align 8
.LC65:
	.string	"\033[31m  [\342\234\227] Chunk %d: MISSING\n\033[0m"
	.align 8
.LC66:
	.string	"\033[31m[!] CANNOT RECONSTRUCT: Missing chunk %d\n\033[0m"
	.align 8
.LC67:
	.string	"\033[31m    DOWNLOAD FAILED: %s\n\033[0m"
	.align 8
.LC68:
	.string	"\033[31m    Reason: Missing chunks prevent reconstruction\n\033[0m"
	.align 8
.LC69:
	.string	"\033[31m    Required: %d/%d chunks\n\033[0m"
	.align 8
.LC70:
	.string	"\033[31m    Available: %d/%d chunks\n\033[0m"
	.align 8
.LC71:
	.string	"\033[36m[*] REASSEMBLING FILE: All chunks available\n\033[0m"
.LC72:
	.string	"."
.LC73:
	.string	"%s/%s"
.LC74:
	.string	"wb"
	.align 8
.LC75:
	.string	"\033[31m[-] ERROR: Could not create output file: %s\n\033[0m"
	.align 8
.LC76:
	.string	"\033[36m    [*] Writing chunk %d (%d bytes)\n\033[0m"
	.align 8
.LC77:
	.string	"\033[32m    DOWNLOAD SUCCESSFUL: %s\n\033[0m"
	.align 8
.LC78:
	.string	"\033[32m    Total file size: %d bytes\n\033[0m"
	.align 8
.LC79:
	.string	"\033[32m    All %d chunks retrieved and reassembled\n\033[0m"
	.text
	.globl	get_file
	.type	get_file, @function
get_file:
.LFB327:
	.loc 1 429 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	leaq	-28672(%rsp), %r11
.LPSRL1:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL1
	subq	$2296, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -30968(%rbp)
	.loc 1 429 1
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 1 432 37
	movq	-30968(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 432 27
	movl	$47, %esi
	movq	%rax, %rdi
	call	strrchr@PLT
	movq	%rax, -30856(%rbp)
	.loc 1 433 8
	cmpq	$0, -30856(%rbp)
	jne	.L78
	.loc 1 435 23
	movq	-30968(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -30856(%rbp)
	jmp	.L79
.L78:
	.loc 1 439 22
	addq	$1, -30856(%rbp)
.L79:
	.loc 1 441 44
	movq	-30856(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 441 21 discriminator 1
	movl	%eax, %edx
	movq	-30856(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	str2md5
	movl	%eax, -30896(%rbp)
	.loc 1 442 18
	movq	-30968(%rbp), %rax
	movq	-30856(%rbp), %rdx
	movq	%rdx, 16(%rax)
	.loc 1 444 9
	movl	$0, -30960(%rbp)
	.loc 1 444 16
	movl	$0, -30892(%rbp)
	.loc 1 445 22
	movq	-30968(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -30848(%rbp)
	.loc 1 452 9
	movl	$0, -30956(%rbp)
	.loc 1 455 5
	leaq	-30784(%rbp), %rax
	movl	$32, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 456 5
	leaq	-30816(%rbp), %rax
	movl	$16, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 457 5
	leaq	-30800(%rbp), %rax
	movl	$16, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 460 9
	movl	$0, -30952(%rbp)
	.loc 1 461 9
	movl	$0, -30948(%rbp)
	.loc 1 464 11
	jmp	.L80
.L110:
.LBB20:
	.loc 1 466 26
	addl	$1, -30952(%rbp)
	.loc 1 468 13
	movl	-30960(%rbp), %edx
	movq	-30848(%rbp), %rcx
	movq	-30968(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	connect_server
	.loc 1 468 12 discriminator 1
	testl	%eax, %eax
	js	.L133
	.loc 1 473 26
	addl	$1, -30948(%rbp)
	.loc 1 474 9
	movl	-30960(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC45(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 477 27
	movl	-30960(%rbp), %edx
	movl	-30896(%rbp), %eax
	addl	%eax, %edx
	.loc 1 477 36
	movq	-30968(%rbp), %rax
	movl	64(%rax), %eax
	movl	%eax, %ecx
	.loc 1 477 32
	movl	%edx, %eax
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	.loc 1 477 13
	movl	%eax, -30944(%rbp)
	.loc 1 479 9
	movl	-30960(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC46(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBB21:
	.loc 1 480 18
	movl	$0, -30940(%rbp)
	.loc 1 480 9
	jmp	.L83
.L84:
	.loc 1 482 34
	movl	-30944(%rbp), %edx
	movl	-30940(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	.loc 1 482 43
	movq	-30968(%rbp), %rax
	movl	64(%rax), %ebx
	.loc 1 482 39
	movl	%ecx, %eax
	cltd
	idivl	%ebx
	movl	%edx, %ecx
	movl	%ecx, %eax
	.loc 1 482 13
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC47(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 480 63 discriminator 3
	addl	$1, -30940(%rbp)
.L83:
	.loc 1 480 27 discriminator 1
	cmpl	$1, -30940(%rbp)
	jle	.L84
.LBE21:
	.loc 1 484 9
	movl	$10, %edi
	call	putchar@PLT
.LBB22:
	.loc 1 487 18
	movl	$0, -30936(%rbp)
	.loc 1 487 9
	jmp	.L85
.L108:
.LBB23:
	.loc 1 489 28
	movl	-30944(%rbp), %edx
	movl	-30936(%rbp), %eax
	addl	%eax, %edx
	.loc 1 489 37
	movq	-30968(%rbp), %rax
	movl	64(%rax), %ecx
	.loc 1 489 19
	movl	%edx, %eax
	cltd
	idivl	%ecx
	movl	%edx, -30944(%rbp)
	.loc 1 492 30
	movl	-30944(%rbp), %eax
	cltq
	movl	-30816(%rbp,%rax,4), %eax
	.loc 1 492 16
	testl	%eax, %eax
	jle	.L86
	.loc 1 494 17
	movl	-30944(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC48(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 495 17
	jmp	.L107
.L86:
	.loc 1 498 13
	movl	-30960(%rbp), %eax
	leal	1(%rax), %edx
	movl	-30944(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC49(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 501 30
	movb	$0, -30832(%rbp)
	movl	-30944(%rbp), %eax
	movb	%al, -30831(%rbp)
	.loc 1 504 45
	movq	-30968(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 504 36
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 501 30
	movl	%eax, -30830(%rbp)
	movl	$0, -30826(%rbp)
.LBB24:
	.loc 1 515 24
	movq	-30848(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30832(%rbp), %rsi
	movl	$0, %ecx
	movl	$10, %edx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 515 24 is_stmt 0 discriminator 1
	movl	%eax, -30888(%rbp)
	cmpl	$0, -30888(%rbp)
	jg	.L88
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 515 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 515 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 515 24
	jmp	.L82
.L88:
	.loc 1 515 24 discriminator 2
	movl	-30888(%rbp), %eax
.LBE24:
	.loc 1 515 22 is_stmt 1 discriminator 2
	movl	%eax, -30892(%rbp)
.LBB25:
	.loc 1 516 24
	movq	-30968(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	.loc 1 516 24 is_stmt 0 discriminator 1
	movq	-30968(%rbp), %rax
	movq	16(%rax), %rsi
	movq	-30848(%rbp), %rax
	movl	(%rax), %eax
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 516 24 discriminator 2
	movl	%eax, -30884(%rbp)
	cmpl	$0, -30884(%rbp)
	jg	.L90
	.loc 1 516 24 discriminator 1
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 516 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 516 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 516 24
	jmp	.L82
.L90:
	.loc 1 516 24 discriminator 2
	movl	-30884(%rbp), %eax
.LBE25:
	.loc 1 516 22 is_stmt 1 discriminator 2
	movl	%eax, -30892(%rbp)
.LBB26:
	.loc 1 519 24
	movq	-30848(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30752(%rbp), %rsi
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 519 24 is_stmt 0 discriminator 1
	movl	%eax, -30880(%rbp)
	cmpl	$0, -30880(%rbp)
	jns	.L91
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 519 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 519 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 519 24
	jmp	.L82
.L91:
	.loc 1 519 24 discriminator 2
	cmpl	$0, -30880(%rbp)
	jne	.L92
	.loc 1 519 24 discriminator 3
	movq	-30848(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 519 24 discriminator 1
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 519 24
	jmp	.L82
.L92:
	.loc 1 519 24 discriminator 4
	movl	-30880(%rbp), %eax
.LBE26:
	.loc 1 519 22 is_stmt 1 discriminator 4
	movl	%eax, -30892(%rbp)
	.loc 1 521 17
	leaq	-30752(%rbp), %rax
	movl	$7, %edx
	leaq	.LC20(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 521 16 discriminator 1
	testl	%eax, %eax
	je	.L93
	.loc 1 523 17
	movl	-30944(%rbp), %eax
	leal	1(%rax), %edx
	movl	-30960(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC50(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 524 17
	jmp	.L107
.L93:
.LBB27:
	.loc 1 527 24
	movq	-30848(%rbp), %rax
	movl	(%rax), %eax
	movl	$0, %ecx
	movl	$7, %edx
	leaq	.LC20(%rip), %rsi
	movl	%eax, %edi
	call	send@PLT
	.loc 1 527 24 is_stmt 0 discriminator 1
	movl	%eax, -30876(%rbp)
	cmpl	$0, -30876(%rbp)
	jg	.L94
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 527 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 527 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 527 24
	jmp	.L95
.L94:
	.loc 1 527 24 discriminator 2
	movl	-30876(%rbp), %eax
.LBE27:
	.loc 1 527 22 is_stmt 1 discriminator 2
	movl	%eax, -30892(%rbp)
	.loc 1 529 13
	movl	-30944(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC51(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 531 13
	leaq	-30832(%rbp), %rax
	movl	$10, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.LBB28:
	.loc 1 532 24
	movq	-30848(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30832(%rbp), %rsi
	movl	$0, %ecx
	movl	$10, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 532 24 is_stmt 0 discriminator 1
	movl	%eax, -30872(%rbp)
	cmpl	$0, -30872(%rbp)
	jns	.L96
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 532 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 532 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 532 24
	jmp	.L95
.L96:
	.loc 1 532 24 discriminator 2
	cmpl	$0, -30872(%rbp)
	jne	.L97
	.loc 1 532 24 discriminator 3
	movq	-30848(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 532 24 discriminator 1
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 532 24
	jmp	.L95
.L97:
	.loc 1 532 24 discriminator 4
	movl	-30872(%rbp), %eax
.LBE28:
	.loc 1 532 22 is_stmt 1 discriminator 4
	movl	%eax, -30892(%rbp)
	.loc 1 543 43
	movl	-30826(%rbp), %eax
	.loc 1 543 17
	movl	%eax, -30868(%rbp)
	.loc 1 544 81
	movzbl	-30831(%rbp), %eax
	movzbl	%al, %eax
	.loc 1 544 13
	leal	1(%rax), %ecx
	movl	-30868(%rbp), %eax
	movl	%eax, %edx
	movl	%ecx, %esi
	leaq	.LC52(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 547 29
	movl	-30868(%rbp), %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	.loc 1 547 27 discriminator 1
	movl	-30944(%rbp), %eax
	cltq
	movq	%rdx, -30784(%rbp,%rax,8)
	.loc 1 548 23
	movl	-30944(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rax
	.loc 1 548 16
	testq	%rax, %rax
	jne	.L98
	.loc 1 550 17
	movl	-30944(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC53(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L77
.L98:
	.loc 1 555 17
	movl	$0, -30932(%rbp)
	.loc 1 556 19
	jmp	.L100
.L104:
	.loc 1 558 17
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.LBB29:
	.loc 1 559 28
	movq	-30848(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30752(%rbp), %rsi
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 559 28 is_stmt 0 discriminator 1
	movl	%eax, -30860(%rbp)
	cmpl	$0, -30860(%rbp)
	jns	.L101
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 559 28 discriminator 2
	call	__errno_location@PLT
	.loc 1 559 28 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 559 28
	jmp	.L95
.L101:
	.loc 1 559 28 discriminator 2
	cmpl	$0, -30860(%rbp)
	jne	.L102
	.loc 1 559 28 discriminator 3
	movq	-30848(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 559 28 discriminator 1
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 559 28
	jmp	.L95
.L102:
	.loc 1 559 28 discriminator 4
	movl	-30860(%rbp), %eax
.LBE29:
	.loc 1 559 26 is_stmt 1 discriminator 4
	movl	%eax, -30892(%rbp)
	.loc 1 560 17
	movl	-30892(%rbp), %eax
	movslq	%eax, %rdx
	.loc 1 560 31
	movl	-30944(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rcx
	.loc 1 560 17
	movl	-30932(%rbp), %eax
	cltq
	.loc 1 560 24
	addq	%rax, %rcx
	.loc 1 560 17
	leaq	-30752(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	memcpy@PLT
	.loc 1 561 29
	movl	-30892(%rbp), %eax
	addl	%eax, -30932(%rbp)
	.loc 1 564 20
	cmpl	$10000, -30868(%rbp)
	jle	.L100
	.loc 1 564 54 discriminator 1
	movl	-30932(%rbp), %edx
	movslq	%edx, %rax
	imulq	$1759218605, %rax, %rax
	shrq	$32, %rax
	sarl	$12, %eax
	movl	%edx, %ecx
	sarl	$31, %ecx
	subl	%ecx, %eax
	imull	$10000, %eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	.loc 1 564 39 discriminator 1
	testl	%eax, %eax
	jne	.L100
	.loc 1 567 52
	pxor	%xmm0, %xmm0
	cvtsi2ssl	-30932(%rbp), %xmm0
	.loc 1 567 71
	pxor	%xmm2, %xmm2
	cvtsi2ssl	-30868(%rbp), %xmm2
	movaps	%xmm0, %xmm1
	divss	%xmm2, %xmm1
	.loc 1 567 83
	movss	.LC54(%rip), %xmm0
	mulss	%xmm1, %xmm0
	.loc 1 566 21
	pxor	%xmm3, %xmm3
	cvtss2sd	%xmm0, %xmm3
	movq	%xmm3, %rcx
	movl	-30868(%rbp), %edx
	movl	-30932(%rbp), %eax
	movq	%rcx, %xmm0
	movl	%eax, %esi
	leaq	.LC55(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
.L100:
	.loc 1 556 32
	movl	-30932(%rbp), %eax
	cmpl	-30868(%rbp), %eax
	jl	.L104
.LBB30:
	.loc 1 572 24
	movq	-30848(%rbp), %rax
	movl	(%rax), %eax
	movl	$0, %ecx
	movl	$7, %edx
	leaq	.LC20(%rip), %rsi
	movl	%eax, %edi
	call	send@PLT
	.loc 1 572 24 is_stmt 0 discriminator 1
	movl	%eax, -30864(%rbp)
	cmpl	$0, -30864(%rbp)
	jg	.L105
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 572 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 572 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 572 24
	jmp	.L95
.L105:
	.loc 1 572 24 discriminator 2
	movl	-30864(%rbp), %eax
.LBE30:
	.loc 1 572 22 is_stmt 1 discriminator 2
	movl	%eax, -30892(%rbp)
	.loc 1 575 34
	movl	-30944(%rbp), %eax
	cltq
	movl	$1, -30816(%rbp,%rax,4)
	.loc 1 576 40
	movl	-30944(%rbp), %eax
	cltq
	movl	-30868(%rbp), %edx
	movl	%edx, -30800(%rbp,%rax,4)
	.loc 1 577 36
	addl	$1, -30956(%rbp)
	.loc 1 579 13
	movl	-30944(%rbp), %eax
	leal	1(%rax), %ecx
	movl	-30868(%rbp), %eax
	movl	%eax, %edx
	movl	%ecx, %esi
	leaq	.LC56(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 581 13
	jmp	.L107
.L95:
	.loc 1 584 13
	movl	-30944(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC57(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 585 23
	movl	-30944(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rax
	.loc 1 585 16
	testq	%rax, %rax
	je	.L107
	.loc 1 587 28
	movl	-30944(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rax
	.loc 1 587 17
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 588 31
	movl	-30944(%rbp), %eax
	cltq
	movq	$0, -30784(%rbp,%rax,8)
.L107:
.LBE23:
	.loc 1 487 63 discriminator 2
	addl	$1, -30936(%rbp)
.L85:
	.loc 1 487 27 discriminator 1
	cmpl	$1, -30936(%rbp)
	jle	.L108
.LBE22:
	.loc 1 592 5
	jmp	.L82
.L133:
	.loc 1 470 13
	nop
.L82:
	.loc 1 593 9
	movq	-30848(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 594 17
	movq	-30848(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -30848(%rbp)
	.loc 1 595 10
	addl	$1, -30960(%rbp)
.L80:
.LBE20:
	.loc 1 464 20
	cmpq	$0, -30848(%rbp)
	je	.L109
	.loc 1 464 20 is_stmt 0 discriminator 1
	cmpl	$4, -30956(%rbp)
	jle	.L110
.L109:
	.loc 1 599 5 is_stmt 1
	leaq	.LC58(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 600 5
	movq	-30968(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC59(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 601 5
	leaq	.LC60(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 603 5
	movl	-30952(%rbp), %edx
	movl	-30948(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC61(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 604 5
	movl	-30956(%rbp), %eax
	movl	$4, %edx
	movl	%eax, %esi
	leaq	.LC62(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 607 5
	leaq	.LC63(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.LBB31:
	.loc 1 608 14
	movl	$0, -30928(%rbp)
	.loc 1 608 5
	jmp	.L111
.L114:
	.loc 1 610 26
	movl	-30928(%rbp), %eax
	cltq
	movl	-30816(%rbp,%rax,4), %eax
	.loc 1 610 12
	testl	%eax, %eax
	jle	.L112
	.loc 1 612 13
	movl	-30928(%rbp), %eax
	cltq
	movl	-30800(%rbp,%rax,4), %eax
	movl	-30928(%rbp), %edx
	leal	1(%rdx), %ecx
	movl	%eax, %edx
	movl	%ecx, %esi
	leaq	.LC64(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L113
.L112:
	.loc 1 616 13
	movl	-30928(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC65(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L113:
	.loc 1 608 43 discriminator 2
	addl	$1, -30928(%rbp)
.L111:
	.loc 1 608 23 discriminator 1
	cmpl	$3, -30928(%rbp)
	jle	.L114
.LBE31:
	.loc 1 619 5
	movl	$10, %edi
	call	putchar@PLT
	.loc 1 622 9
	movl	$1, -30924(%rbp)
.LBB32:
	.loc 1 623 14
	movl	$0, -30920(%rbp)
	.loc 1 623 5
	jmp	.L115
.L118:
	.loc 1 625 19
	movl	-30920(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rax
	.loc 1 625 12
	testq	%rax, %rax
	je	.L116
	.loc 1 625 53 discriminator 1
	movl	-30920(%rbp), %eax
	cltq
	movl	-30800(%rbp,%rax,4), %eax
	.loc 1 625 31 discriminator 1
	testl	%eax, %eax
	jle	.L116
	.loc 1 625 78 discriminator 2
	movl	-30920(%rbp), %eax
	cltq
	movl	-30816(%rbp,%rax,4), %eax
	.loc 1 625 62 discriminator 2
	testl	%eax, %eax
	jg	.L117
.L116:
	.loc 1 627 25
	movl	$0, -30924(%rbp)
	.loc 1 628 13
	movl	-30920(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC66(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L117:
	.loc 1 623 43 discriminator 2
	addl	$1, -30920(%rbp)
.L115:
	.loc 1 623 23 discriminator 1
	cmpl	$3, -30920(%rbp)
	jle	.L118
.LBE32:
	.loc 1 632 8
	cmpl	$0, -30924(%rbp)
	jne	.L119
	.loc 1 634 9
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 635 9
	movq	-30968(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC67(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 636 9
	leaq	.LC68(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 637 9
	movl	$4, %edx
	movl	$4, %esi
	leaq	.LC69(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 638 9
	movl	-30956(%rbp), %eax
	movl	$4, %edx
	movl	%eax, %esi
	leaq	.LC70(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 639 9
	leaq	.LC28(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBB33:
	.loc 1 642 18
	movl	$0, -30916(%rbp)
	.loc 1 642 9
	jmp	.L120
.L122:
	.loc 1 644 23
	movl	-30916(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rax
	.loc 1 644 16
	testq	%rax, %rax
	je	.L121
	.loc 1 645 28
	movl	-30916(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rax
	.loc 1 645 17
	movq	%rax, %rdi
	call	free@PLT
.L121:
	.loc 1 642 47 discriminator 2
	addl	$1, -30916(%rbp)
.L120:
	.loc 1 642 27 discriminator 1
	cmpl	$3, -30916(%rbp)
	jle	.L122
.LBE33:
	.loc 1 648 9
	jmp	.L77
.L119:
	.loc 1 652 5
	leaq	.LC71(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 656 5
	movq	-30968(%rbp), %rax
	movq	16(%rax), %rdx
	leaq	-30832(%rbp), %rax
	movq	%rdx, %rcx
	leaq	.LC72(%rip), %rdx
	leaq	.LC73(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	.loc 1 658 16
	movq	-30832(%rbp), %rax
	leaq	.LC74(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -30840(%rbp)
	.loc 1 659 8
	cmpq	$0, -30840(%rbp)
	jne	.L123
	.loc 1 661 9
	movq	-30968(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC75(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBB34:
	.loc 1 664 18
	movl	$0, -30912(%rbp)
	.loc 1 664 9
	jmp	.L124
.L126:
	.loc 1 666 23
	movl	-30912(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rax
	.loc 1 666 16
	testq	%rax, %rax
	je	.L125
	.loc 1 667 28
	movl	-30912(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rax
	.loc 1 667 17
	movq	%rax, %rdi
	call	free@PLT
.L125:
	.loc 1 664 47 discriminator 2
	addl	$1, -30912(%rbp)
.L124:
	.loc 1 664 27 discriminator 1
	cmpl	$3, -30912(%rbp)
	jle	.L126
.LBE34:
	.loc 1 670 9
	jmp	.L77
.L123:
	.loc 1 672 5
	movq	-30832(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 675 9
	movl	$0, -30908(%rbp)
.LBB35:
	.loc 1 676 14
	movl	$0, -30904(%rbp)
	.loc 1 676 5
	jmp	.L127
.L128:
	.loc 1 678 47
	movl	-30904(%rbp), %eax
	cltq
	movl	-30800(%rbp,%rax,4), %eax
	.loc 1 678 25
	addl	%eax, -30908(%rbp)
	.loc 1 676 43 discriminator 3
	addl	$1, -30904(%rbp)
.L127:
	.loc 1 676 23 discriminator 1
	cmpl	$3, -30904(%rbp)
	jle	.L128
.LBE35:
.LBB36:
	.loc 1 682 14
	movl	$0, -30900(%rbp)
	.loc 1 682 5
	jmp	.L129
.L130:
	.loc 1 684 9
	movl	-30900(%rbp), %eax
	cltq
	movl	-30800(%rbp,%rax,4), %eax
	movl	-30900(%rbp), %edx
	leal	1(%rdx), %ecx
	movl	%eax, %edx
	movl	%ecx, %esi
	leaq	.LC76(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 685 46
	movl	-30900(%rbp), %eax
	cltq
	movl	-30800(%rbp,%rax,4), %eax
	.loc 1 685 9
	movslq	%eax, %rsi
	.loc 1 685 22
	movl	-30900(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rax
	.loc 1 685 9
	movq	-30840(%rbp), %rdx
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 686 20
	movl	-30900(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rax
	.loc 1 686 9
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 682 43 discriminator 3
	addl	$1, -30900(%rbp)
.L129:
	.loc 1 682 23 discriminator 1
	cmpl	$3, -30900(%rbp)
	jle	.L130
.LBE36:
	.loc 1 688 5
	movq	-30840(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	.loc 1 690 5
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 691 5
	movq	-30968(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC77(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 692 5
	movl	-30908(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC78(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 693 5
	movl	$4, %esi
	leaq	.LC79(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 694 5
	leaq	.LC36(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L77:
	.loc 1 695 1
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L132
	call	__stack_chk_fail@PLT
.L132:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE327:
	.size	get_file, .-get_file
	.globl	extract_original_filename
	.type	extract_original_filename, @function
extract_original_filename:
.LFB328:
	.loc 1 700 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	.loc 1 702 36
	movq	-40(%rbp), %rax
	movl	$95, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	movq	%rax, -32(%rbp)
	.loc 1 703 8
	cmpq	$0, -32(%rbp)
	jne	.L135
	.loc 1 705 16
	movl	$0, %eax
	jmp	.L136
.L135:
	.loc 1 709 21
	addq	$1, -32(%rbp)
	.loc 1 712 35
	movq	-32(%rbp), %rax
	movl	$95, %esi
	movq	%rax, %rdi
	call	strrchr@PLT
	movq	%rax, -24(%rbp)
	.loc 1 713 8
	cmpq	$0, -24(%rbp)
	jne	.L137
	.loc 1 715 16
	movl	$0, %eax
	jmp	.L136
.L137:
	.loc 1 719 43
	movq	-24(%rbp), %rax
	subq	-32(%rbp), %rax
	.loc 1 719 12
	movq	%rax, -16(%rbp)
	.loc 1 722 31
	movq	-16(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	.loc 1 723 8
	cmpq	$0, -8(%rbp)
	jne	.L138
	.loc 1 725 16
	movl	$0, %eax
	jmp	.L136
.L138:
	.loc 1 729 5
	movq	-16(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	.loc 1 730 22
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 730 37
	movb	$0, (%rax)
	.loc 1 732 12
	movq	-8(%rbp), %rax
.L136:
	.loc 1 733 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE328:
	.size	extract_original_filename, .-extract_original_filename
	.globl	parse_server_filename
	.type	parse_server_filename, @function
parse_server_filename:
.LFB329:
	.loc 1 737 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	.loc 1 739 33
	movq	-40(%rbp), %rax
	movl	$47, %esi
	movq	%rax, %rdi
	call	strrchr@PLT
	movq	%rax, -24(%rbp)
	.loc 1 740 8
	cmpq	$0, -24(%rbp)
	je	.L140
	.loc 1 742 22
	addq	$1, -24(%rbp)
	jmp	.L141
.L140:
	.loc 1 746 23
	movq	-40(%rbp), %rax
	movq	%rax, -24(%rbp)
.L141:
	.loc 1 750 35
	movq	-24(%rbp), %rax
	movl	$95, %esi
	movq	%rax, %rdi
	call	strrchr@PLT
	movq	%rax, -16(%rbp)
	.loc 1 751 8
	cmpq	$0, -16(%rbp)
	jne	.L142
	.loc 1 753 16
	movl	$-1, %eax
	jmp	.L143
.L142:
	.loc 1 757 17
	movq	-16(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rdi
	call	atoi@PLT
	.loc 1 757 15 discriminator 1
	movq	-56(%rbp), %rdx
	movl	%eax, (%rdx)
	.loc 1 760 43
	movq	-16(%rbp), %rax
	subq	-24(%rbp), %rax
	.loc 1 760 12
	movq	%rax, -8(%rbp)
	.loc 1 763 26
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	.loc 1 763 24 discriminator 1
	movq	-48(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 764 9
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 764 8
	testq	%rax, %rax
	jne	.L144
	.loc 1 766 16
	movl	$-1, %eax
	jmp	.L143
.L144:
	.loc 1 770 5
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	-24(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	.loc 1 771 6
	movq	-48(%rbp), %rax
	movq	(%rax), %rdx
	.loc 1 771 25
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 771 40
	movb	$0, (%rax)
	.loc 1 773 12
	movl	$0, %eax
.L143:
	.loc 1 774 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE329:
	.size	parse_server_filename, .-parse_server_filename
	.section	.rodata
	.align 8
.LC80:
	.string	"\033[36m\n[*] SCANNING SERVERS FOR FILES\n\033[0m"
	.align 8
.LC81:
	.string	"\033[36m\n[*] QUERYING: Server %d (%s:%s)\n\033[0m"
	.align 8
.LC82:
	.string	"\033[36m[*] LIST REQUEST SENT\n\033[0m"
.LC83:
	.string	"nack\t\n0\t\n"
	.string	""
	.align 8
.LC84:
	.string	"\033[36m    [*] Chunk %d of %s found on server %d\n\033[0m"
	.align 8
.LC85:
	.string	"\033[31m    [-] ERROR: Could not parse filename: %s\n\033[0m"
	.align 8
.LC86:
	.string	"\033[33m    [!] No files found on server %d\n\033[0m"
	.align 8
.LC87:
	.string	"\033[32m    [+] Found %d file chunks on server %d\n\033[0m"
	.align 8
.LC88:
	.string	"\033[36m    FILE AVAILABILITY SUMMARY\n\033[0m"
	.align 8
.LC89:
	.string	"\033[33m[!] No files found on any server\n\n\033[0m"
.LC90:
	.string	"CHUNKS AVAILABLE"
.LC91:
	.string	"STATUS"
.LC92:
	.string	"FILENAME"
.LC93:
	.string	"%-30s %-15s %-15s\n"
	.align 8
.LC94:
	.string	"--------------------------------------------------------------"
.LC95:
	.string	"%-30s "
.LC96:
	.string	"COMPLETE"
.LC97:
	.string	"\033[32m%-15s\033[0m"
.LC98:
	.string	"INCOMPLETE"
.LC99:
	.string	"\033[31m%-15s\033[0m"
.LC100:
	.string	"%-2d/%-2d"
.LC101:
	.string	" ["
.LC102:
	.string	"\033[32m%d\033[0m"
.LC103:
	.string	"\033[31mX\033[0m"
.LC104:
	.string	"]"
	.text
	.globl	list_file
	.type	list_file, @function
list_file:
.LFB330:
	.loc 1 777 1
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
	subq	$2192, %rsp
	movq	%rdi, -30856(%rbp)
	.loc 1 777 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 778 5
	leaq	.LC80(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 780 9
	movl	$0, -30832(%rbp)
	.loc 1 780 16
	movl	$0, -30804(%rbp)
	.loc 1 781 22
	movq	-30856(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -30792(%rbp)
	.loc 1 792 18
	movq	$0, -30784(%rbp)
	.loc 1 795 11
	jmp	.L146
.L161:
.LBB37:
	.loc 1 797 9
	movq	-30792(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-30792(%rbp), %rax
	movq	16(%rax), %rax
	movl	-30832(%rbp), %ecx
	leal	1(%rcx), %esi
	movq	%rdx, %rcx
	movq	%rax, %rdx
	leaq	.LC81(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 799 13
	movl	-30832(%rbp), %edx
	movq	-30792(%rbp), %rcx
	movq	-30856(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	connect_server
	.loc 1 799 12 discriminator 1
	testl	%eax, %eax
	js	.L178
	.loc 1 804 26
	movb	$3, -30746(%rbp)
	movb	$0, -30745(%rbp)
	movl	$0, -30744(%rbp)
	movl	$0, -30740(%rbp)
	.loc 1 809 20
	movq	-30792(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30746(%rbp), %rsi
	movl	$0, %ecx
	movl	$10, %edx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 809 18 discriminator 1
	movl	%eax, -30804(%rbp)
	.loc 1 810 9
	leaq	.LC82(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 812 13
	movl	$0, -30828(%rbp)
.L158:
.LBB38:
	.loc 1 817 13
	leaq	-30746(%rbp), %rax
	movl	$10, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 818 24
	movq	-30792(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30746(%rbp), %rsi
	movl	$0, %ecx
	movl	$10, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 818 22 discriminator 1
	movl	%eax, -30804(%rbp)
	.loc 1 819 16
	cmpl	$0, -30804(%rbp)
	jle	.L179
	.loc 1 822 13
	movl	-30804(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-30746(%rbp), %rcx
	leaq	-30736(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	.loc 1 823 17
	leaq	-30736(%rbp), %rax
	movl	$7, %edx
	leaq	.LC20(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 823 16 discriminator 1
	testl	%eax, %eax
	je	.L150
	.loc 1 823 63 discriminator 1
	leaq	-30736(%rbp), %rax
	movl	$8, %edx
	leaq	.LC83(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 823 60 discriminator 1
	testl	%eax, %eax
	je	.L150
	.loc 1 826 13
	leaq	-30736(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 827 84
	movl	-30744(%rbp), %eax
	.loc 1 827 24
	movl	%eax, %edx
	movq	-30792(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30736(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 827 22 discriminator 1
	movl	%eax, -30804(%rbp)
	.loc 1 828 16
	cmpl	$0, -30804(%rbp)
	jle	.L150
	.loc 1 828 34 discriminator 1
	leaq	-30736(%rbp), %rax
	movl	$7, %edx
	leaq	.LC20(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 828 31 discriminator 1
	testl	%eax, %eax
	je	.L150
	.loc 1 828 80 discriminator 2
	leaq	-30736(%rbp), %rax
	movl	$8, %edx
	leaq	.LC83(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 828 77 discriminator 1
	testl	%eax, %eax
	je	.L150
	.loc 1 832 19
	movq	$0, -30800(%rbp)
	.loc 1 833 17
	movl	$-1, -30836(%rbp)
	.loc 1 834 17
	leaq	-30836(%rbp), %rdx
	leaq	-30800(%rbp), %rcx
	leaq	-30736(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_server_filename
	.loc 1 834 16 discriminator 1
	testl	%eax, %eax
	jne	.L151
	.loc 1 834 103 discriminator 1
	movl	-30836(%rbp), %eax
	.loc 1 834 91 discriminator 1
	cmpl	$3, %eax
	jg	.L151
.LBB39:
	.loc 1 836 28
	addl	$1, -30828(%rbp)
	.loc 1 839 30
	movq	-30784(%rbp), %rax
	movq	%rax, -30776(%rbp)
	.loc 1 840 21
	movl	$0, -30824(%rbp)
	.loc 1 842 23
	jmp	.L152
.L155:
	.loc 1 844 25
	movq	-30800(%rbp), %rdx
	.loc 1 844 42
	movq	-30776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 844 25
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 844 24 discriminator 1
	testl	%eax, %eax
	jne	.L153
	.loc 1 846 31
	movl	$1, -30824(%rbp)
	.loc 1 847 51
	movl	-30836(%rbp), %edx
	movq	-30776(%rbp), %rax
	movslq	%edx, %rdx
	movl	8(%rax,%rdx,4), %eax
	movl	-30836(%rbp), %edx
	.loc 1 847 62
	leal	1(%rax), %ecx
	movq	-30776(%rbp), %rax
	movslq	%edx, %rdx
	movl	%ecx, 8(%rax,%rdx,4)
	.loc 1 848 25
	jmp	.L154
.L153:
	.loc 1 850 32
	movq	-30776(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -30776(%rbp)
.L152:
	.loc 1 842 35
	cmpq	$0, -30776(%rbp)
	jne	.L155
.L154:
	.loc 1 854 20
	cmpl	$0, -30824(%rbp)
	jne	.L156
	.loc 1 856 34
	movl	$32, %edi
	call	malloc@PLT
	movq	%rax, -30776(%rbp)
	.loc 1 857 44
	movq	-30800(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	.loc 1 857 42 discriminator 1
	movq	-30776(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 858 38
	movq	-30776(%rbp), %rax
	addq	$8, %rax
	.loc 1 858 21
	movl	$16, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 859 47
	movl	-30836(%rbp), %edx
	.loc 1 859 58
	movq	-30776(%rbp), %rax
	movslq	%edx, %rdx
	movl	$1, 8(%rax,%rdx,4)
	.loc 1 860 38
	movq	-30776(%rbp), %rax
	movq	-30784(%rbp), %rdx
	movq	%rdx, 24(%rax)
	.loc 1 861 31
	movq	-30776(%rbp), %rax
	movq	%rax, -30784(%rbp)
.L156:
	.loc 1 864 17
	movl	-30832(%rbp), %eax
	leal	1(%rax), %edx
	movq	-30800(%rbp), %rax
	movl	-30836(%rbp), %ecx
	leal	1(%rcx), %esi
	movl	%edx, %ecx
	movq	%rax, %rdx
	leaq	.LC84(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 866 17
	movq	-30800(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.LBE39:
	.loc 1 835 13
	jmp	.L157
.L151:
	.loc 1 870 17
	leaq	-30736(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC85(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L157:
.LBE38:
	.loc 1 816 9
	jmp	.L158
.L179:
.LBB40:
	.loc 1 820 17
	nop
.L150:
.LBE40:
	.loc 1 874 12
	cmpl	$0, -30828(%rbp)
	jne	.L159
	.loc 1 876 13
	movl	-30832(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC86(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L148
.L159:
	.loc 1 880 13
	movl	-30832(%rbp), %eax
	leal	1(%rax), %edx
	movl	-30828(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC87(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L148
.L178:
	.loc 1 801 13
	nop
.L148:
	.loc 1 884 20
	movq	-30792(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 884 12
	testl	%eax, %eax
	js	.L160
	.loc 1 886 13
	movq	-30792(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
.L160:
	.loc 1 888 17
	movq	-30792(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -30792(%rbp)
	.loc 1 889 10
	addl	$1, -30832(%rbp)
.L146:
.LBE37:
	.loc 1 795 12
	cmpq	$0, -30792(%rbp)
	jne	.L161
	.loc 1 893 5
	leaq	.LC58(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 894 5
	leaq	.LC88(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 895 5
	leaq	.LC60(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 897 8
	cmpq	$0, -30784(%rbp)
	jne	.L162
	.loc 1 899 9
	leaq	.LC89(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 968 1
	jmp	.L180
.L162:
.LBB41:
	.loc 1 904 9
	leaq	.LC90(%rip), %rax
	movq	%rax, %rcx
	leaq	.LC91(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC92(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC93(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 905 9
	leaq	.LC94(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 908 22
	movq	-30784(%rbp), %rax
	movq	%rax, -30768(%rbp)
	.loc 1 909 15
	jmp	.L164
.L176:
.LBB42:
	.loc 1 912 17
	movl	$0, -30820(%rbp)
	.loc 1 913 17
	movl	$1, -30816(%rbp)
.LBB43:
	.loc 1 915 22
	movl	$0, -30812(%rbp)
	.loc 1 915 13
	jmp	.L165
.L168:
	.loc 1 917 47
	movq	-30768(%rbp), %rax
	movl	-30812(%rbp), %edx
	movslq	%edx, %rdx
	movl	8(%rax,%rdx,4), %eax
	.loc 1 917 20
	testl	%eax, %eax
	jle	.L166
	.loc 1 919 37
	addl	$1, -30820(%rbp)
	jmp	.L167
.L166:
	.loc 1 923 33
	movl	$0, -30816(%rbp)
.L167:
	.loc 1 915 51 discriminator 2
	addl	$1, -30812(%rbp)
.L165:
	.loc 1 915 31 discriminator 1
	cmpl	$3, -30812(%rbp)
	jle	.L168
.LBE43:
	.loc 1 928 13
	movq	-30768(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC95(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 930 16
	cmpl	$0, -30816(%rbp)
	je	.L169
	.loc 1 932 17
	leaq	.LC96(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC97(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L170
.L169:
	.loc 1 936 17
	leaq	.LC98(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC99(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L170:
	.loc 1 939 13
	movl	-30820(%rbp), %eax
	movl	$4, %edx
	movl	%eax, %esi
	leaq	.LC100(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 942 13
	leaq	.LC101(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBB44:
	.loc 1 943 22
	movl	$0, -30808(%rbp)
	.loc 1 943 13
	jmp	.L171
.L175:
	.loc 1 945 47
	movq	-30768(%rbp), %rax
	movl	-30808(%rbp), %edx
	movslq	%edx, %rdx
	movl	8(%rax,%rdx,4), %eax
	.loc 1 945 20
	testl	%eax, %eax
	jle	.L172
	.loc 1 947 21
	movl	-30808(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC102(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L173
.L172:
	.loc 1 951 21
	leaq	.LC103(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L173:
	.loc 1 954 20
	cmpl	$2, -30808(%rbp)
	jg	.L174
	.loc 1 955 21
	movl	$44, %edi
	call	putchar@PLT
.L174:
	.loc 1 943 51 discriminator 2
	addl	$1, -30808(%rbp)
.L171:
	.loc 1 943 31 discriminator 1
	cmpl	$3, -30808(%rbp)
	jle	.L175
.LBE44:
	.loc 1 957 13
	leaq	.LC104(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 960 26
	movq	-30768(%rbp), %rax
	movq	%rax, -30760(%rbp)
	.loc 1 961 24
	movq	-30768(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -30768(%rbp)
	.loc 1 963 22
	movq	-30760(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 963 13
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 964 13
	movq	-30760(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L164:
.LBE42:
	.loc 1 909 27
	cmpq	$0, -30768(%rbp)
	jne	.L176
	.loc 1 966 9
	movl	$10, %edi
	call	putchar@PLT
.L180:
.LBE41:
	.loc 1 968 1
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L177
	call	__stack_chk_fail@PLT
.L177:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE330:
	.size	list_file, .-list_file
	.section	.rodata
	.align 8
.LC105:
	.string	"\033[32m    FILE DELETE SUCCESSFUL\n\033[0m"
	.align 8
.LC106:
	.string	"\033[32m    All chunks removed from servers\n\033[0m"
	.align 8
.LC107:
	.string	"\033[31m[-] ERROR: File not found or permission denied on server\n\033[0m"
	.text
	.globl	delete_file
	.type	delete_file, @function
delete_file:
.LFB331:
	.loc 1 971 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	leaq	-28672(%rsp), %r11
.LPSRL3:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL3
	subq	$2152, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -30824(%rbp)
	.loc 1 971 1
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 1 973 9
	movl	$0, -30808(%rbp)
	.loc 1 973 16
	movl	$0, -30796(%rbp)
	.loc 1 974 22
	movq	-30824(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -30776(%rbp)
	.loc 1 977 11
	jmp	.L182
.L194:
.LBB45:
	.loc 1 979 13
	movl	-30808(%rbp), %edx
	movq	-30776(%rbp), %rcx
	movq	-30824(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	connect_server
	.loc 1 979 12 discriminator 1
	testl	%eax, %eax
	js	.L196
	.loc 1 982 51
	movq	-30824(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 982 42
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 982 20 discriminator 1
	movl	%eax, %edx
	movq	-30824(%rbp), %rax
	movq	16(%rax), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	str2md5
	.loc 1 982 68 discriminator 2
	movq	-30824(%rbp), %rdx
	movl	64(%rdx), %edx
	movl	%edx, %ecx
	.loc 1 982 64 discriminator 2
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	.loc 1 982 13 discriminator 2
	movl	%eax, -30792(%rbp)
	.loc 1 983 27
	movl	-30792(%rbp), %edx
	movl	-30808(%rbp), %eax
	addl	%eax, %edx
	.loc 1 983 36
	movq	-30824(%rbp), %rax
	movl	64(%rax), %ecx
	.loc 1 983 13
	movl	%edx, %eax
	cltd
	idivl	%ecx
	movl	%edx, -30804(%rbp)
.LBB46:
	.loc 1 984 18
	movl	$0, -30800(%rbp)
	.loc 1 984 9
	jmp	.L185
.L193:
.LBB47:
	.loc 1 986 28
	movl	-30804(%rbp), %edx
	movl	-30800(%rbp), %eax
	addl	%eax, %edx
	.loc 1 986 37
	movq	-30824(%rbp), %rax
	movl	64(%rax), %ecx
	.loc 1 986 19
	movl	%edx, %eax
	cltd
	idivl	%ecx
	movl	%edx, -30804(%rbp)
	.loc 1 988 30
	movb	$2, -30762(%rbp)
	movl	-30804(%rbp), %eax
	movb	%al, -30761(%rbp)
	.loc 1 991 45
	movq	-30824(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 991 36
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 988 30
	movl	%eax, -30760(%rbp)
	movl	$0, -30756(%rbp)
.LBB48:
	.loc 1 994 24
	movq	-30776(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30762(%rbp), %rsi
	movl	$0, %ecx
	movl	$10, %edx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 994 24 is_stmt 0 discriminator 1
	movl	%eax, -30788(%rbp)
	cmpl	$0, -30788(%rbp)
	jg	.L186
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 994 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 994 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 994 24
	jmp	.L184
.L186:
	.loc 1 994 24 discriminator 2
	movl	-30788(%rbp), %eax
.LBE48:
	.loc 1 994 22 is_stmt 1 discriminator 2
	movl	%eax, -30796(%rbp)
.LBB49:
	.loc 1 995 24
	movl	-30760(%rbp), %eax
	movl	%eax, %edx
	movq	-30824(%rbp), %rax
	movq	16(%rax), %rsi
	movq	-30776(%rbp), %rax
	movl	(%rax), %eax
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 995 24 is_stmt 0 discriminator 1
	movl	%eax, -30784(%rbp)
	cmpl	$0, -30784(%rbp)
	jg	.L188
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 995 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 995 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 995 24
	jmp	.L184
.L188:
	.loc 1 995 24 discriminator 2
	movl	-30784(%rbp), %eax
.LBE49:
	.loc 1 995 22 is_stmt 1 discriminator 2
	movl	%eax, -30796(%rbp)
	.loc 1 996 13
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.LBB50:
	.loc 1 997 24
	movq	-30776(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30752(%rbp), %rsi
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 997 24 is_stmt 0 discriminator 1
	movl	%eax, -30780(%rbp)
	cmpl	$0, -30780(%rbp)
	jns	.L189
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 997 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 997 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 997 24
	jmp	.L184
.L189:
	.loc 1 997 24 discriminator 2
	cmpl	$0, -30780(%rbp)
	jne	.L190
	.loc 1 997 24 discriminator 3
	movq	-30776(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 997 24 discriminator 1
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 997 24
	jmp	.L184
.L190:
	.loc 1 997 24 discriminator 4
	movl	-30780(%rbp), %eax
.LBE50:
	.loc 1 997 22 is_stmt 1 discriminator 4
	movl	%eax, -30796(%rbp)
	.loc 1 998 17
	leaq	-30752(%rbp), %rax
	movl	$7, %edx
	leaq	.LC20(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 998 16 discriminator 1
	testl	%eax, %eax
	jne	.L191
	.loc 1 1000 17
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1001 17
	leaq	.LC105(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1002 17
	movq	-30824(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC34(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1003 17
	leaq	.LC106(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1004 17
	leaq	.LC36(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L191:
	.loc 1 1006 17
	leaq	-30752(%rbp), %rax
	movl	$8, %edx
	leaq	.LC83(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 1006 16 discriminator 1
	testl	%eax, %eax
	jne	.L192
	.loc 1 1008 17
	leaq	.LC107(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L192:
.LBE47:
	.loc 1 984 63 discriminator 2
	addl	$1, -30800(%rbp)
.L185:
	.loc 1 984 27 discriminator 1
	cmpl	$1, -30800(%rbp)
	jle	.L193
.LBE46:
	.loc 1 1013 5
	jmp	.L184
.L196:
	.loc 1 980 13
	nop
.L184:
	.loc 1 1014 9
	movq	-30776(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 1015 17
	movq	-30776(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -30776(%rbp)
	.loc 1 1016 10
	addl	$1, -30808(%rbp)
.L182:
.LBE45:
	.loc 1 977 12
	cmpq	$0, -30776(%rbp)
	jne	.L194
	.loc 1 1018 1
	nop
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L195
	call	__stack_chk_fail@PLT
.L195:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE331:
	.size	delete_file, .-delete_file
	.section	.rodata
	.align 8
.LC108:
	.string	"\033[36m    DFS SERVER STATUS CHECK\n\033[0m"
	.align 8
.LC109:
	.string	"\033[36m[*] CHECKING INDIVIDUAL SERVER STATUS\n\n\033[0m"
	.align 8
.LC110:
	.string	"\033[36m[*] Server %d (%s:%s): \033[0m"
.LC111:
	.string	"\033[31mOFFLINE\n\033[0m"
	.align 8
.LC112:
	.string	"\033[31m    Unable to establish connection\n\n\033[0m"
.LC113:
	.string	"\033[32mONLINE\n\033[0m"
	.align 8
.LC114:
	.string	"\033[32m    Connection established successfully\n\033[0m"
	.align 8
.LC116:
	.string	"\033[32m    Response time: %.2f ms\n\n\033[0m"
	.align 8
.LC117:
	.string	"\033[36m    SYSTEM STATUS SUMMARY\n\033[0m"
.LC118:
	.string	"Servers available: %d/%d "
	.align 8
.LC119:
	.string	"\033[32m(All servers online)\n\033[0m"
	.align 8
.LC120:
	.string	"\033[33m(System operational with reduced redundancy)\n\033[0m"
	.align 8
.LC121:
	.string	"\033[33m(System partially operational - limited functionality)\n\033[0m"
	.align 8
.LC122:
	.string	"\033[31m(System offline - no servers available)\n\033[0m"
	.align 8
.LC123:
	.string	"\nSystem capabilities with %d/%d servers:\n"
.LC124:
	.string	"\033[32m  [\342\234\223] \033[0m"
.LC125:
	.string	"\033[31m  [\342\234\227] \033[0m"
.LC126:
	.string	"LIST - View available files"
.LC127:
	.string	"GET - Download complete files"
.LC128:
	.string	"full"
.LC129:
	.string	"partial"
	.align 8
.LC130:
	.string	"PUT - Upload files (with %s redundancy)\n"
	.align 8
.LC131:
	.string	"DELETE - Remove files (may be incomplete with partial servers)\n"
	.text
	.globl	server_info
	.type	server_info, @function
server_info:
.LFB332:
	.loc 1 1021 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 1 1022 5
	leaq	.LC58(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1023 5
	leaq	.LC108(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1024 5
	leaq	.LC60(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1026 9
	movl	$0, -16(%rbp)
	.loc 1 1027 9
	movl	$0, -12(%rbp)
	.loc 1 1028 22
	movq	-24(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -8(%rbp)
	.loc 1 1033 5
	leaq	.LC109(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1036 11
	jmp	.L198
.L202:
	.loc 1 1038 9
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movl	-16(%rbp), %ecx
	leal	1(%rcx), %esi
	movq	%rdx, %rcx
	movq	%rax, %rdx
	leaq	.LC110(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1041 13
	movl	-16(%rbp), %edx
	movq	-8(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	connect_server
	.loc 1 1041 12 discriminator 1
	testl	%eax, %eax
	jns	.L199
	.loc 1 1043 13
	leaq	.LC111(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1044 13
	leaq	.LC112(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L200
.L199:
	.loc 1 1048 27
	addl	$1, -12(%rbp)
	.loc 1 1049 13
	leaq	.LC113(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1050 13
	leaq	.LC114(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1053 72
	call	rand@PLT
	.loc 1 1053 79 discriminator 1
	movslq	%eax, %rdx
	imulq	$1374389535, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$5, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$100, %edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	.loc 1 1053 13 discriminator 1
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%edx, %xmm1
	movsd	.LC115(%rip), %xmm0
	addsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, %xmm0
	leaq	.LC116(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
.L200:
	.loc 1 1057 20
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 1057 12
	testl	%eax, %eax
	js	.L201
	.loc 1 1059 13
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
.L201:
	.loc 1 1061 17
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -8(%rbp)
	.loc 1 1062 10
	addl	$1, -16(%rbp)
.L198:
	.loc 1 1036 12
	cmpq	$0, -8(%rbp)
	jne	.L202
	.loc 1 1066 5
	leaq	.LC58(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1067 5
	leaq	.LC117(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1068 5
	leaq	.LC60(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1071 5
	movq	-24(%rbp), %rax
	movl	64(%rax), %edx
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC118(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1073 29
	movq	-24(%rbp), %rax
	movl	64(%rax), %eax
	.loc 1 1073 8
	cmpl	%eax, -12(%rbp)
	jne	.L203
	.loc 1 1075 9
	leaq	.LC119(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L204
.L203:
	.loc 1 1077 13
	cmpl	$1, -12(%rbp)
	jle	.L205
	.loc 1 1079 9
	leaq	.LC120(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L204
.L205:
	.loc 1 1081 13
	cmpl	$0, -12(%rbp)
	jle	.L206
	.loc 1 1083 9
	leaq	.LC121(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L204
.L206:
	.loc 1 1087 9
	leaq	.LC122(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L204:
	.loc 1 1091 5
	movq	-24(%rbp), %rax
	movl	64(%rax), %edx
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC123(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1093 8
	cmpl	$0, -12(%rbp)
	jle	.L207
	.loc 1 1095 9
	leaq	.LC124(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L208
.L207:
	.loc 1 1099 9
	leaq	.LC125(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L208:
	.loc 1 1101 5
	leaq	.LC126(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 1103 8
	cmpl	$3, -12(%rbp)
	jle	.L209
	.loc 1 1105 9
	leaq	.LC124(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L210
.L209:
	.loc 1 1109 9
	leaq	.LC125(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L210:
	.loc 1 1111 5
	leaq	.LC127(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 1113 8
	cmpl	$0, -12(%rbp)
	jle	.L211
	.loc 1 1115 9
	leaq	.LC124(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L212
.L211:
	.loc 1 1119 9
	leaq	.LC125(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L212:
	.loc 1 1121 5
	cmpl	$3, -12(%rbp)
	jle	.L213
	.loc 1 1121 5 is_stmt 0 discriminator 1
	leaq	.LC128(%rip), %rax
	jmp	.L214
.L213:
	.loc 1 1121 5 discriminator 2
	leaq	.LC129(%rip), %rax
.L214:
	.loc 1 1121 5 discriminator 4
	movq	%rax, %rsi
	leaq	.LC130(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1124 8 is_stmt 1
	cmpl	$0, -12(%rbp)
	jle	.L215
	.loc 1 1126 9
	leaq	.LC124(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L216
.L215:
	.loc 1 1130 9
	leaq	.LC125(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L216:
	.loc 1 1132 5
	leaq	.LC131(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 1134 5
	leaq	.LC60(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1138 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE332:
	.size	server_info, .-server_info
	.section	.rodata
.LC132:
	.string	"SERVER INFO"
.LC133:
	.string	"UNKNOWN"
.LC134:
	.string	"DELETE"
.LC135:
	.string	"LIST"
.LC136:
	.string	"GET"
.LC137:
	.string	"PUT"
.LC138:
	.string	"\033[36m    OPERATION: %s\n\033[0m"
	.text
	.globl	handle_req
	.type	handle_req, @function
handle_req:
.LFB333:
	.loc 1 1157 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 1159 5
	leaq	.LC58(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1161 14
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	.loc 1 1160 5
	cmpl	$1, %eax
	je	.L218
	.loc 1 1161 47
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	.loc 1 1162 41
	testl	%eax, %eax
	je	.L219
	.loc 1 1162 45 discriminator 1
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	.loc 1 1163 41
	cmpl	$3, %eax
	je	.L220
	.loc 1 1163 45 discriminator 1
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	.loc 1 1164 41
	cmpl	$2, %eax
	je	.L221
	.loc 1 1164 45 discriminator 1
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	.loc 1 1165 74
	cmpl	$5, %eax
	jne	.L222
	.loc 1 1165 74 is_stmt 0 discriminator 1
	leaq	.LC132(%rip), %rax
	jmp	.L227
.L222:
	.loc 1 1165 74 discriminator 2
	leaq	.LC133(%rip), %rax
	jmp	.L227
.L221:
	.loc 1 1164 41 is_stmt 1 discriminator 2
	leaq	.LC134(%rip), %rax
	jmp	.L227
.L220:
	.loc 1 1163 41 discriminator 2
	leaq	.LC135(%rip), %rax
	jmp	.L227
.L219:
	.loc 1 1162 41 discriminator 2
	leaq	.LC136(%rip), %rax
	jmp	.L227
.L218:
	.loc 1 1160 5 discriminator 1
	leaq	.LC137(%rip), %rax
.L227:
	.loc 1 1160 5 is_stmt 0 discriminator 3
	movq	%rax, %rsi
	leaq	.LC138(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1166 5 is_stmt 1
	leaq	.LC60(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1169 15
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	.loc 1 1169 5
	cmpl	$5, %eax
	ja	.L238
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L230(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L230(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L230:
	.long	.L235-.L230
	.long	.L234-.L230
	.long	.L233-.L230
	.long	.L232-.L230
	.long	.L231-.L230
	.long	.L229-.L230
	.text
.L232:
	.loc 1 1172 9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	list_file
	.loc 1 1173 9
	jmp	.L236
.L235:
	.loc 1 1175 9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	get_file
	.loc 1 1176 9
	jmp	.L236
.L234:
	.loc 1 1178 9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	put_file
	.loc 1 1179 9
	jmp	.L236
.L233:
	.loc 1 1181 9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	delete_file
	.loc 1 1182 9
	jmp	.L236
.L231:
	.loc 1 1184 9
	movl	$0, %edi
	call	exit@PLT
.L229:
	.loc 1 1187 9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	server_info
	.loc 1 1188 9
	jmp	.L236
.L238:
	.loc 1 1190 9
	nop
.L236:
	.loc 1 1193 12
	movl	$0, %eax
	.loc 1 1194 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE333:
	.size	handle_req, .-handle_req
	.section	.rodata
	.align 4
.LC54:
	.long	1120403456
	.align 8
.LC115:
	.long	0
	.long	1076756480
	.text
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
	.file 19 "/usr/include/openssl/types.h"
	.file 20 "./common.h"
	.file 21 "/usr/include/string.h"
	.file 22 "/usr/include/stdlib.h"
	.file 23 "/usr/include/arpa/inet.h"
	.file 24 "/usr/include/x86_64-linux-gnu/bits/unistd_ext.h"
	.file 25 "/usr/include/errno.h"
	.file 26 "/usr/include/fcntl.h"
	.file 27 "/usr/include/openssl/evp.h"
	.file 28 "/usr/include/x86_64-linux-gnu/bits/socket_type.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1d8e
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x28
	.long	.LASF278
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x4
	.long	.LASF7
	.byte	0x2
	.byte	0xd6
	.byte	0x17
	.long	0x3a
	.uleb128 0xe
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0xe
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x29
	.byte	0x8
	.uleb128 0x11
	.long	0x48
	.uleb128 0xe
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0xe
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0xe
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x4
	.long	.LASF8
	.byte	0x3
	.byte	0x26
	.byte	0x17
	.long	0x4f
	.uleb128 0xe
	.byte	0x2
	.byte	0x5
	.long	.LASF9
	.uleb128 0x4
	.long	.LASF10
	.byte	0x3
	.byte	0x28
	.byte	0x1c
	.long	0x56
	.uleb128 0x2a
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x4
	.long	.LASF11
	.byte	0x3
	.byte	0x2a
	.byte	0x16
	.long	0x41
	.uleb128 0xe
	.byte	0x8
	.byte	0x5
	.long	.LASF12
	.uleb128 0x4
	.long	.LASF13
	.byte	0x3
	.byte	0x98
	.byte	0x19
	.long	0x96
	.uleb128 0x4
	.long	.LASF14
	.byte	0x3
	.byte	0x99
	.byte	0x1b
	.long	0x96
	.uleb128 0x4
	.long	.LASF15
	.byte	0x3
	.byte	0x9a
	.byte	0x19
	.long	0x83
	.uleb128 0x4
	.long	.LASF16
	.byte	0x3
	.byte	0xa0
	.byte	0x1a
	.long	0x96
	.uleb128 0x4
	.long	.LASF17
	.byte	0x3
	.byte	0xa2
	.byte	0x1f
	.long	0x96
	.uleb128 0x4
	.long	.LASF18
	.byte	0x3
	.byte	0xc2
	.byte	0x1b
	.long	0x96
	.uleb128 0x5
	.long	0xef
	.uleb128 0x11
	.long	0xe5
	.uleb128 0xe
	.byte	0x1
	.byte	0x6
	.long	.LASF19
	.uleb128 0x1d
	.long	0xef
	.uleb128 0x4
	.long	.LASF20
	.byte	0x3
	.byte	0xd2
	.byte	0x17
	.long	0x41
	.uleb128 0x12
	.long	.LASF56
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x28e
	.uleb128 0x3
	.long	.LASF21
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x83
	.byte	0
	.uleb128 0x3
	.long	.LASF22
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0xe5
	.byte	0x8
	.uleb128 0x3
	.long	.LASF23
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0xe5
	.byte	0x10
	.uleb128 0x3
	.long	.LASF24
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0xe5
	.byte	0x18
	.uleb128 0x3
	.long	.LASF25
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0xe5
	.byte	0x20
	.uleb128 0x3
	.long	.LASF26
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0xe5
	.byte	0x28
	.uleb128 0x3
	.long	.LASF27
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0xe5
	.byte	0x30
	.uleb128 0x3
	.long	.LASF28
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0xe5
	.byte	0x38
	.uleb128 0x3
	.long	.LASF29
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0xe5
	.byte	0x40
	.uleb128 0x3
	.long	.LASF30
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0xe5
	.byte	0x48
	.uleb128 0x3
	.long	.LASF31
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0xe5
	.byte	0x50
	.uleb128 0x3
	.long	.LASF32
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0xe5
	.byte	0x58
	.uleb128 0x3
	.long	.LASF33
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x2a7
	.byte	0x60
	.uleb128 0x3
	.long	.LASF34
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x2ac
	.byte	0x68
	.uleb128 0x3
	.long	.LASF35
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x83
	.byte	0x70
	.uleb128 0x3
	.long	.LASF36
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x83
	.byte	0x74
	.uleb128 0x3
	.long	.LASF37
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0x9d
	.byte	0x78
	.uleb128 0x3
	.long	.LASF38
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x56
	.byte	0x80
	.uleb128 0x3
	.long	.LASF39
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x5d
	.byte	0x82
	.uleb128 0x3
	.long	.LASF40
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x2b1
	.byte	0x83
	.uleb128 0x3
	.long	.LASF41
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x2c1
	.byte	0x88
	.uleb128 0x3
	.long	.LASF42
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0xa9
	.byte	0x90
	.uleb128 0x3
	.long	.LASF43
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x2cb
	.byte	0x98
	.uleb128 0x3
	.long	.LASF44
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x2d5
	.byte	0xa0
	.uleb128 0x3
	.long	.LASF45
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x2ac
	.byte	0xa8
	.uleb128 0x3
	.long	.LASF46
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0x48
	.byte	0xb0
	.uleb128 0x3
	.long	.LASF47
	.byte	0x4
	.byte	0x5f
	.byte	0x15
	.long	0x2da
	.byte	0xb8
	.uleb128 0x3
	.long	.LASF48
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x83
	.byte	0xc0
	.uleb128 0x3
	.long	.LASF49
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x2df
	.byte	0xc4
	.byte	0
	.uleb128 0x4
	.long	.LASF50
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0x107
	.uleb128 0x2b
	.long	.LASF279
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0x16
	.long	.LASF51
	.uleb128 0x5
	.long	0x2a2
	.uleb128 0x5
	.long	0x107
	.uleb128 0xd
	.long	0xef
	.long	0x2c1
	.uleb128 0xf
	.long	0x3a
	.byte	0
	.byte	0
	.uleb128 0x5
	.long	0x29a
	.uleb128 0x16
	.long	.LASF52
	.uleb128 0x5
	.long	0x2c6
	.uleb128 0x16
	.long	.LASF53
	.uleb128 0x5
	.long	0x2d0
	.uleb128 0x5
	.long	0x2ac
	.uleb128 0xd
	.long	0xef
	.long	0x2ef
	.uleb128 0xf
	.long	0x3a
	.byte	0x13
	.byte	0
	.uleb128 0x5
	.long	0xf6
	.uleb128 0x11
	.long	0x2ef
	.uleb128 0x4
	.long	.LASF54
	.byte	0x6
	.byte	0x4e
	.byte	0x13
	.long	0xd9
	.uleb128 0x5
	.long	0x28e
	.uleb128 0x11
	.long	0x305
	.uleb128 0x2c
	.long	.LASF280
	.byte	0x6
	.byte	0x97
	.byte	0xe
	.long	0x305
	.uleb128 0xe
	.byte	0x8
	.byte	0x5
	.long	.LASF55
	.uleb128 0x12
	.long	.LASF57
	.byte	0x10
	.byte	0x7
	.byte	0x8
	.byte	0x8
	.long	0x34a
	.uleb128 0x3
	.long	.LASF58
	.byte	0x7
	.byte	0xe
	.byte	0xc
	.long	0xc1
	.byte	0
	.uleb128 0x3
	.long	.LASF59
	.byte	0x7
	.byte	0xf
	.byte	0x11
	.long	0xcd
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.long	.LASF60
	.byte	0x8
	.byte	0x31
	.byte	0x12
	.long	0x96
	.uleb128 0x23
	.byte	0x80
	.byte	0x8
	.byte	0x3b
	.long	0x36c
	.uleb128 0x3
	.long	.LASF61
	.byte	0x8
	.byte	0x40
	.byte	0xf
	.long	0x36c
	.byte	0
	.byte	0
	.uleb128 0xd
	.long	0x34a
	.long	0x37c
	.uleb128 0xf
	.long	0x3a
	.byte	0xf
	.byte	0
	.uleb128 0x4
	.long	.LASF62
	.byte	0x8
	.byte	0x46
	.byte	0x5
	.long	0x356
	.uleb128 0xe
	.byte	0x8
	.byte	0x7
	.long	.LASF63
	.uleb128 0x12
	.long	.LASF64
	.byte	0x10
	.byte	0x9
	.byte	0x33
	.byte	0x10
	.long	0x3b7
	.uleb128 0x3
	.long	.LASF65
	.byte	0x9
	.byte	0x35
	.byte	0x23
	.long	0x3b7
	.byte	0
	.uleb128 0x3
	.long	.LASF66
	.byte	0x9
	.byte	0x36
	.byte	0x23
	.long	0x3b7
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.long	0x38f
	.uleb128 0x4
	.long	.LASF67
	.byte	0x9
	.byte	0x37
	.byte	0x3
	.long	0x38f
	.uleb128 0x12
	.long	.LASF68
	.byte	0x28
	.byte	0xa
	.byte	0x16
	.byte	0x8
	.long	0x43e
	.uleb128 0x3
	.long	.LASF69
	.byte	0xa
	.byte	0x18
	.byte	0x7
	.long	0x83
	.byte	0
	.uleb128 0x3
	.long	.LASF70
	.byte	0xa
	.byte	0x19
	.byte	0x10
	.long	0x41
	.byte	0x4
	.uleb128 0x3
	.long	.LASF71
	.byte	0xa
	.byte	0x1a
	.byte	0x7
	.long	0x83
	.byte	0x8
	.uleb128 0x3
	.long	.LASF72
	.byte	0xa
	.byte	0x1c
	.byte	0x10
	.long	0x41
	.byte	0xc
	.uleb128 0x3
	.long	.LASF73
	.byte	0xa
	.byte	0x20
	.byte	0x7
	.long	0x83
	.byte	0x10
	.uleb128 0x3
	.long	.LASF74
	.byte	0xa
	.byte	0x22
	.byte	0x9
	.long	0x70
	.byte	0x14
	.uleb128 0x3
	.long	.LASF75
	.byte	0xa
	.byte	0x23
	.byte	0x9
	.long	0x70
	.byte	0x16
	.uleb128 0x3
	.long	.LASF76
	.byte	0xa
	.byte	0x24
	.byte	0x14
	.long	0x3bc
	.byte	0x18
	.byte	0
	.uleb128 0x24
	.byte	0x28
	.byte	0xb
	.byte	0x43
	.byte	0x9
	.long	0x46c
	.uleb128 0x17
	.long	.LASF77
	.byte	0xb
	.byte	0x45
	.byte	0x1c
	.long	0x3c8
	.uleb128 0x17
	.long	.LASF78
	.byte	0xb
	.byte	0x46
	.byte	0x8
	.long	0x46c
	.uleb128 0x17
	.long	.LASF79
	.byte	0xb
	.byte	0x47
	.byte	0xc
	.long	0x96
	.byte	0
	.uleb128 0xd
	.long	0xef
	.long	0x47c
	.uleb128 0xf
	.long	0x3a
	.byte	0x27
	.byte	0
	.uleb128 0x4
	.long	.LASF80
	.byte	0xb
	.byte	0x48
	.byte	0x3
	.long	0x43e
	.uleb128 0x5
	.long	0x492
	.uleb128 0x11
	.long	0x488
	.uleb128 0x2d
	.uleb128 0x4
	.long	.LASF81
	.byte	0xc
	.byte	0x18
	.byte	0x13
	.long	0x64
	.uleb128 0x4
	.long	.LASF82
	.byte	0xc
	.byte	0x19
	.byte	0x14
	.long	0x77
	.uleb128 0x4
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
	.long	0xfb
	.uleb128 0x5
	.long	0xe5
	.uleb128 0x11
	.long	0x4c4
	.uleb128 0x2e
	.long	.LASF281
	.byte	0x7
	.byte	0x4
	.long	0x41
	.byte	0x1c
	.byte	0x18
	.byte	0x6
	.long	0x51b
	.uleb128 0x10
	.long	.LASF85
	.byte	0x1
	.uleb128 0x10
	.long	.LASF86
	.byte	0x2
	.uleb128 0x10
	.long	.LASF87
	.byte	0x3
	.uleb128 0x10
	.long	.LASF88
	.byte	0x4
	.uleb128 0x10
	.long	.LASF89
	.byte	0x5
	.uleb128 0x10
	.long	.LASF90
	.byte	0x6
	.uleb128 0x10
	.long	.LASF91
	.byte	0xa
	.uleb128 0x2f
	.long	.LASF92
	.long	0x80000
	.uleb128 0x30
	.long	.LASF93
	.value	0x800
	.byte	0
	.uleb128 0x4
	.long	.LASF94
	.byte	0xe
	.byte	0x1c
	.byte	0x1c
	.long	0x56
	.uleb128 0x12
	.long	.LASF95
	.byte	0x10
	.byte	0xf
	.byte	0xb8
	.byte	0x27
	.long	0x54f
	.uleb128 0x3
	.long	.LASF96
	.byte	0xf
	.byte	0xba
	.byte	0x5
	.long	0x51b
	.byte	0
	.uleb128 0x3
	.long	.LASF97
	.byte	0xf
	.byte	0xbb
	.byte	0xa
	.long	0x54f
	.byte	0x2
	.byte	0
	.uleb128 0xd
	.long	0xef
	.long	0x55f
	.uleb128 0xf
	.long	0x3a
	.byte	0xd
	.byte	0
	.uleb128 0x5
	.long	0x527
	.uleb128 0x12
	.long	.LASF98
	.byte	0x10
	.byte	0x10
	.byte	0xf7
	.byte	0x27
	.long	0x5a6
	.uleb128 0x3
	.long	.LASF99
	.byte	0x10
	.byte	0xf9
	.byte	0x5
	.long	0x51b
	.byte	0
	.uleb128 0x3
	.long	.LASF100
	.byte	0x10
	.byte	0xfa
	.byte	0xf
	.long	0x633
	.byte	0x2
	.uleb128 0x3
	.long	.LASF101
	.byte	0x10
	.byte	0xfb
	.byte	0x14
	.long	0x618
	.byte	0x4
	.uleb128 0x3
	.long	.LASF102
	.byte	0x10
	.byte	0xfe
	.byte	0x13
	.long	0x6b8
	.byte	0x8
	.byte	0
	.uleb128 0x1e
	.long	.LASF103
	.byte	0x1c
	.byte	0x10
	.value	0x108
	.byte	0x27
	.long	0x5fb
	.uleb128 0xb
	.long	.LASF104
	.byte	0x10
	.value	0x10a
	.byte	0x5
	.long	0x51b
	.byte	0
	.uleb128 0xb
	.long	.LASF105
	.byte	0x10
	.value	0x10b
	.byte	0xf
	.long	0x633
	.byte	0x2
	.uleb128 0xb
	.long	.LASF106
	.byte	0x10
	.value	0x10c
	.byte	0xe
	.long	0x4ab
	.byte	0x4
	.uleb128 0xb
	.long	.LASF107
	.byte	0x10
	.value	0x10d
	.byte	0x15
	.long	0x69d
	.byte	0x8
	.uleb128 0xb
	.long	.LASF108
	.byte	0x10
	.value	0x10e
	.byte	0xe
	.long	0x4ab
	.byte	0x18
	.byte	0
	.uleb128 0x4
	.long	.LASF109
	.byte	0x11
	.byte	0x54
	.byte	0xa
	.long	0x607
	.uleb128 0x31
	.byte	0x8
	.byte	0x11
	.byte	0x53
	.byte	0x9
	.uleb128 0x4
	.long	.LASF110
	.byte	0x10
	.byte	0x1e
	.byte	0x12
	.long	0x4ab
	.uleb128 0x12
	.long	.LASF111
	.byte	0x4
	.byte	0x10
	.byte	0x1f
	.byte	0x8
	.long	0x633
	.uleb128 0x3
	.long	.LASF112
	.byte	0x10
	.byte	0x21
	.byte	0xf
	.long	0x60c
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	.LASF113
	.byte	0x10
	.byte	0x7d
	.byte	0x12
	.long	0x49f
	.uleb128 0x24
	.byte	0x10
	.byte	0x10
	.byte	0xdf
	.byte	0x5
	.long	0x66d
	.uleb128 0x17
	.long	.LASF114
	.byte	0x10
	.byte	0xe1
	.byte	0xa
	.long	0x66d
	.uleb128 0x17
	.long	.LASF115
	.byte	0x10
	.byte	0xe2
	.byte	0xb
	.long	0x67d
	.uleb128 0x17
	.long	.LASF116
	.byte	0x10
	.byte	0xe3
	.byte	0xb
	.long	0x68d
	.byte	0
	.uleb128 0xd
	.long	0x493
	.long	0x67d
	.uleb128 0xf
	.long	0x3a
	.byte	0xf
	.byte	0
	.uleb128 0xd
	.long	0x49f
	.long	0x68d
	.uleb128 0xf
	.long	0x3a
	.byte	0x7
	.byte	0
	.uleb128 0xd
	.long	0x4ab
	.long	0x69d
	.uleb128 0xf
	.long	0x3a
	.byte	0x3
	.byte	0
	.uleb128 0x12
	.long	.LASF117
	.byte	0x10
	.byte	0x10
	.byte	0xdd
	.byte	0x8
	.long	0x6b8
	.uleb128 0x3
	.long	.LASF118
	.byte	0x10
	.byte	0xe4
	.byte	0x9
	.long	0x63f
	.byte	0
	.byte	0
	.uleb128 0xd
	.long	0x4f
	.long	0x6c8
	.uleb128 0xf
	.long	0x3a
	.byte	0x7
	.byte	0
	.uleb128 0x1e
	.long	.LASF119
	.byte	0x30
	.byte	0x12
	.value	0x235
	.byte	0x8
	.long	0x747
	.uleb128 0xb
	.long	.LASF120
	.byte	0x12
	.value	0x237
	.byte	0x7
	.long	0x83
	.byte	0
	.uleb128 0xb
	.long	.LASF121
	.byte	0x12
	.value	0x238
	.byte	0x7
	.long	0x83
	.byte	0x4
	.uleb128 0xb
	.long	.LASF122
	.byte	0x12
	.value	0x239
	.byte	0x7
	.long	0x83
	.byte	0x8
	.uleb128 0xb
	.long	.LASF123
	.byte	0x12
	.value	0x23a
	.byte	0x7
	.long	0x83
	.byte	0xc
	.uleb128 0xb
	.long	.LASF124
	.byte	0x12
	.value	0x23b
	.byte	0xd
	.long	0x4b7
	.byte	0x10
	.uleb128 0xb
	.long	.LASF125
	.byte	0x12
	.value	0x23c
	.byte	0x14
	.long	0x55f
	.byte	0x18
	.uleb128 0xb
	.long	.LASF126
	.byte	0x12
	.value	0x23d
	.byte	0x9
	.long	0xe5
	.byte	0x20
	.uleb128 0xb
	.long	.LASF127
	.byte	0x12
	.value	0x23e
	.byte	0x14
	.long	0x74c
	.byte	0x28
	.byte	0
	.uleb128 0x1d
	.long	0x6c8
	.uleb128 0x5
	.long	0x6c8
	.uleb128 0x5
	.long	0x747
	.uleb128 0x11
	.long	0x751
	.uleb128 0xe
	.byte	0x10
	.byte	0x5
	.long	.LASF128
	.uleb128 0xe
	.byte	0x10
	.byte	0x7
	.long	.LASF129
	.uleb128 0xe
	.byte	0x10
	.byte	0x4
	.long	.LASF130
	.uleb128 0x4
	.long	.LASF131
	.byte	0x13
	.byte	0x6a
	.byte	0x1a
	.long	0x781
	.uleb128 0x1d
	.long	0x770
	.uleb128 0x16
	.long	.LASF132
	.uleb128 0x4
	.long	.LASF133
	.byte	0x13
	.byte	0x6b
	.byte	0x1e
	.long	0x792
	.uleb128 0x16
	.long	.LASF134
	.uleb128 0x4
	.long	.LASF135
	.byte	0x13
	.byte	0xba
	.byte	0x1a
	.long	0x7a3
	.uleb128 0x16
	.long	.LASF136
	.uleb128 0x5
	.long	0x4f
	.uleb128 0x5
	.long	0x83
	.uleb128 0xd
	.long	0x4f
	.long	0x7c2
	.uleb128 0xf
	.long	0x3a
	.byte	0xf
	.byte	0
	.uleb128 0x5
	.long	0x77c
	.uleb128 0x32
	.byte	0x7
	.byte	0x4
	.long	0x41
	.byte	0x14
	.byte	0x71
	.byte	0x1
	.long	0x805
	.uleb128 0x1f
	.string	"GET"
	.byte	0
	.uleb128 0x1f
	.string	"PUT"
	.byte	0x1
	.uleb128 0x10
	.long	.LASF137
	.byte	0x2
	.uleb128 0x1f
	.string	"LS"
	.byte	0x3
	.uleb128 0x10
	.long	.LASF138
	.byte	0x4
	.uleb128 0x10
	.long	.LASF139
	.byte	0x5
	.uleb128 0x10
	.long	.LASF140
	.byte	0x6
	.uleb128 0x10
	.long	.LASF141
	.byte	0x7
	.byte	0
	.uleb128 0x4
	.long	.LASF142
	.byte	0x14
	.byte	0x7a
	.byte	0x3
	.long	0x7c7
	.uleb128 0x12
	.long	.LASF143
	.byte	0x28
	.byte	0x14
	.byte	0x7f
	.byte	0x10
	.long	0x860
	.uleb128 0x3
	.long	.LASF144
	.byte	0x14
	.byte	0x80
	.byte	0x9
	.long	0x83
	.byte	0
	.uleb128 0x3
	.long	.LASF145
	.byte	0x14
	.byte	0x81
	.byte	0xb
	.long	0xe5
	.byte	0x8
	.uleb128 0x3
	.long	.LASF146
	.byte	0x14
	.byte	0x82
	.byte	0xb
	.long	0xe5
	.byte	0x10
	.uleb128 0x3
	.long	.LASF147
	.byte	0x14
	.byte	0x83
	.byte	0x9
	.long	0x83
	.byte	0x18
	.uleb128 0x3
	.long	.LASF148
	.byte	0x14
	.byte	0x84
	.byte	0x1d
	.long	0x860
	.byte	0x20
	.byte	0
	.uleb128 0x5
	.long	0x811
	.uleb128 0x4
	.long	.LASF143
	.byte	0x14
	.byte	0x85
	.byte	0x2
	.long	0x811
	.uleb128 0x23
	.byte	0x70
	.byte	0x14
	.byte	0x8e
	.long	0x8fc
	.uleb128 0x3
	.long	.LASF149
	.byte	0x14
	.byte	0x90
	.byte	0x9
	.long	0x83
	.byte	0
	.uleb128 0x3
	.long	.LASF150
	.byte	0x14
	.byte	0x91
	.byte	0xb
	.long	0xe5
	.byte	0x8
	.uleb128 0x3
	.long	.LASF151
	.byte	0x14
	.byte	0x92
	.byte	0xb
	.long	0xe5
	.byte	0x10
	.uleb128 0x3
	.long	.LASF152
	.byte	0x14
	.byte	0x93
	.byte	0x10
	.long	0x805
	.byte	0x18
	.uleb128 0x3
	.long	.LASF153
	.byte	0x14
	.byte	0x94
	.byte	0x16
	.long	0x8fc
	.byte	0x20
	.uleb128 0x3
	.long	.LASF154
	.byte	0x14
	.byte	0x95
	.byte	0x16
	.long	0x74c
	.byte	0x28
	.uleb128 0x3
	.long	.LASF155
	.byte	0x14
	.byte	0x96
	.byte	0x9
	.long	0x901
	.byte	0x30
	.uleb128 0x3
	.long	.LASF156
	.byte	0x14
	.byte	0x97
	.byte	0x9
	.long	0x83
	.byte	0x40
	.uleb128 0x3
	.long	.LASF157
	.byte	0x14
	.byte	0x98
	.byte	0x9
	.long	0x83
	.byte	0x44
	.uleb128 0x3
	.long	.LASF158
	.byte	0x14
	.byte	0x9a
	.byte	0x15
	.long	0x47c
	.byte	0x48
	.byte	0
	.uleb128 0x5
	.long	0x865
	.uleb128 0xd
	.long	0x83
	.long	0x911
	.uleb128 0xf
	.long	0x3a
	.byte	0x3
	.byte	0
	.uleb128 0x4
	.long	.LASF159
	.byte	0x14
	.byte	0x9b
	.byte	0x3
	.long	0x871
	.uleb128 0x12
	.long	.LASF160
	.byte	0xa
	.byte	0x1
	.byte	0x2e
	.byte	0x10
	.long	0x95f
	.uleb128 0x3
	.long	.LASF150
	.byte	0x1
	.byte	0x30
	.byte	0xd
	.long	0x493
	.byte	0
	.uleb128 0x3
	.long	.LASF161
	.byte	0x1
	.byte	0x31
	.byte	0xd
	.long	0x493
	.byte	0x1
	.uleb128 0x3
	.long	.LASF162
	.byte	0x1
	.byte	0x32
	.byte	0xe
	.long	0x4ab
	.byte	0x2
	.uleb128 0x3
	.long	.LASF163
	.byte	0x1
	.byte	0x33
	.byte	0xe
	.long	0x4ab
	.byte	0x6
	.byte	0
	.uleb128 0x4
	.long	.LASF164
	.byte	0x1
	.byte	0x34
	.byte	0x3
	.long	0x91d
	.uleb128 0x20
	.long	.LASF186
	.byte	0x16
	.value	0x23d
	.byte	0xc
	.long	0x83
	.uleb128 0xa
	.long	.LASF165
	.byte	0x15
	.byte	0xbb
	.byte	0xe
	.long	0xe5
	.long	0x98e
	.uleb128 0x1
	.long	0x2ef
	.byte	0
	.uleb128 0xa
	.long	.LASF166
	.byte	0x15
	.byte	0x9c
	.byte	0xc
	.long	0x83
	.long	0x9a9
	.uleb128 0x1
	.long	0x2ef
	.uleb128 0x1
	.long	0x2ef
	.byte	0
	.uleb128 0xa
	.long	.LASF167
	.byte	0x15
	.byte	0x90
	.byte	0xe
	.long	0xe5
	.long	0x9c9
	.uleb128 0x1
	.long	0xe5
	.uleb128 0x1
	.long	0x2ef
	.uleb128 0x1
	.long	0x3a
	.byte	0
	.uleb128 0xa
	.long	.LASF168
	.byte	0x15
	.byte	0xf6
	.byte	0xe
	.long	0xe5
	.long	0x9e4
	.uleb128 0x1
	.long	0x2ef
	.uleb128 0x1
	.long	0x83
	.byte	0
	.uleb128 0xa
	.long	.LASF169
	.byte	0x6
	.byte	0xb8
	.byte	0xc
	.long	0x83
	.long	0x9fa
	.uleb128 0x1
	.long	0x305
	.byte	0
	.uleb128 0x9
	.long	.LASF170
	.byte	0x6
	.value	0x2df
	.byte	0xf
	.long	0x2e
	.long	0xa20
	.uleb128 0x1
	.long	0x488
	.uleb128 0x1
	.long	0x3a
	.uleb128 0x1
	.long	0x3a
	.uleb128 0x1
	.long	0x305
	.byte	0
	.uleb128 0x9
	.long	.LASF171
	.byte	0x6
	.value	0x193
	.byte	0xc
	.long	0x83
	.long	0xa3d
	.uleb128 0x1
	.long	0x4c9
	.uleb128 0x1
	.long	0x2f4
	.uleb128 0x1a
	.byte	0
	.uleb128 0xa
	.long	.LASF172
	.byte	0x15
	.byte	0x2b
	.byte	0xe
	.long	0x48
	.long	0xa5d
	.uleb128 0x1
	.long	0x48
	.uleb128 0x1
	.long	0x488
	.uleb128 0x1
	.long	0x3a
	.byte	0
	.uleb128 0x9
	.long	.LASF173
	.byte	0x6
	.value	0x2d8
	.byte	0xf
	.long	0x2e
	.long	0xa83
	.uleb128 0x1
	.long	0x4a
	.uleb128 0x1
	.long	0x2e
	.uleb128 0x1
	.long	0x2e
	.uleb128 0x1
	.long	0x30a
	.byte	0
	.uleb128 0x9
	.long	.LASF174
	.byte	0x16
	.value	0x2a0
	.byte	0xe
	.long	0x48
	.long	0xa9a
	.uleb128 0x1
	.long	0x3a
	.byte	0
	.uleb128 0x9
	.long	.LASF175
	.byte	0x6
	.value	0x307
	.byte	0x11
	.long	0x96
	.long	0xab1
	.uleb128 0x1
	.long	0x305
	.byte	0
	.uleb128 0x9
	.long	.LASF176
	.byte	0x6
	.value	0x301
	.byte	0xc
	.long	0x83
	.long	0xad2
	.uleb128 0x1
	.long	0x305
	.uleb128 0x1
	.long	0x96
	.uleb128 0x1
	.long	0x83
	.byte	0
	.uleb128 0x9
	.long	.LASF177
	.byte	0x15
	.value	0x111
	.byte	0xe
	.long	0xe5
	.long	0xaee
	.uleb128 0x1
	.long	0x2ef
	.uleb128 0x1
	.long	0x83
	.byte	0
	.uleb128 0x9
	.long	.LASF178
	.byte	0x6
	.value	0x108
	.byte	0xe
	.long	0x305
	.long	0xb0a
	.uleb128 0x1
	.long	0x2f4
	.uleb128 0x1
	.long	0x2f4
	.byte	0
	.uleb128 0xa
	.long	.LASF179
	.byte	0x15
	.byte	0x9f
	.byte	0xc
	.long	0x83
	.long	0xb2a
	.uleb128 0x1
	.long	0x2ef
	.uleb128 0x1
	.long	0x2ef
	.uleb128 0x1
	.long	0x3a
	.byte	0
	.uleb128 0xa
	.long	.LASF180
	.byte	0x11
	.byte	0x91
	.byte	0x10
	.long	0x2f9
	.long	0xb4f
	.uleb128 0x1
	.long	0x83
	.uleb128 0x1
	.long	0x48
	.uleb128 0x1
	.long	0x2e
	.uleb128 0x1
	.long	0x83
	.byte	0
	.uleb128 0xa
	.long	.LASF181
	.byte	0x11
	.byte	0x8a
	.byte	0x10
	.long	0x2f9
	.long	0xb74
	.uleb128 0x1
	.long	0x83
	.uleb128 0x1
	.long	0x488
	.uleb128 0x1
	.long	0x2e
	.uleb128 0x1
	.long	0x83
	.byte	0
	.uleb128 0x9
	.long	.LASF182
	.byte	0x15
	.value	0x197
	.byte	0xf
	.long	0x2e
	.long	0xb8b
	.uleb128 0x1
	.long	0x2ef
	.byte	0
	.uleb128 0x21
	.long	.LASF201
	.byte	0x12
	.value	0x29a
	.byte	0xd
	.long	0xb9e
	.uleb128 0x1
	.long	0x74c
	.byte	0
	.uleb128 0x9
	.long	.LASF183
	.byte	0x11
	.value	0x115
	.byte	0xc
	.long	0x83
	.long	0xbc9
	.uleb128 0x1
	.long	0x83
	.uleb128 0x1
	.long	0x83
	.uleb128 0x1
	.long	0x83
	.uleb128 0x1
	.long	0x488
	.uleb128 0x1
	.long	0x4b7
	.byte	0
	.uleb128 0x9
	.long	.LASF184
	.byte	0x6
	.value	0x16b
	.byte	0xc
	.long	0x83
	.long	0xbe1
	.uleb128 0x1
	.long	0x2ef
	.uleb128 0x1a
	.byte	0
	.uleb128 0xa
	.long	.LASF185
	.byte	0x17
	.byte	0x40
	.byte	0x14
	.long	0x2ef
	.long	0xc06
	.uleb128 0x1
	.long	0x83
	.uleb128 0x1
	.long	0x48d
	.uleb128 0x1
	.long	0xea
	.uleb128 0x1
	.long	0x4b7
	.byte	0
	.uleb128 0x26
	.long	.LASF187
	.byte	0x18
	.byte	0x22
	.byte	0x10
	.long	0xb5
	.uleb128 0x9
	.long	.LASF188
	.byte	0x15
	.value	0x1a3
	.byte	0xe
	.long	0xe5
	.long	0xc29
	.uleb128 0x1
	.long	0x83
	.byte	0
	.uleb128 0xa
	.long	.LASF189
	.byte	0x11
	.byte	0xff
	.byte	0xc
	.long	0x83
	.long	0xc53
	.uleb128 0x1
	.long	0x83
	.uleb128 0x1
	.long	0x83
	.uleb128 0x1
	.long	0x83
	.uleb128 0x1
	.long	0x4a
	.uleb128 0x1
	.long	0xc58
	.byte	0
	.uleb128 0x5
	.long	0x4b7
	.uleb128 0x11
	.long	0xc53
	.uleb128 0xa
	.long	.LASF190
	.byte	0x8
	.byte	0x66
	.byte	0xc
	.long	0x83
	.long	0xc87
	.uleb128 0x1
	.long	0x83
	.uleb128 0x1
	.long	0xc8c
	.uleb128 0x1
	.long	0xc8c
	.uleb128 0x1
	.long	0xc8c
	.uleb128 0x1
	.long	0xc96
	.byte	0
	.uleb128 0x5
	.long	0x37c
	.uleb128 0x11
	.long	0xc87
	.uleb128 0x5
	.long	0x322
	.uleb128 0x11
	.long	0xc91
	.uleb128 0x26
	.long	.LASF191
	.byte	0x19
	.byte	0x25
	.byte	0xd
	.long	0x7ad
	.uleb128 0xa
	.long	.LASF192
	.byte	0x11
	.byte	0x7e
	.byte	0xc
	.long	0x83
	.long	0xcc7
	.uleb128 0x1
	.long	0x83
	.uleb128 0x1
	.long	0x5fb
	.uleb128 0x1
	.long	0x4b7
	.byte	0
	.uleb128 0xa
	.long	.LASF193
	.byte	0x1a
	.byte	0xb1
	.byte	0xc
	.long	0x83
	.long	0xce3
	.uleb128 0x1
	.long	0x83
	.uleb128 0x1
	.long	0x83
	.uleb128 0x1a
	.byte	0
	.uleb128 0xa
	.long	.LASF194
	.byte	0x11
	.byte	0x66
	.byte	0xc
	.long	0x83
	.long	0xd03
	.uleb128 0x1
	.long	0x83
	.uleb128 0x1
	.long	0x83
	.uleb128 0x1
	.long	0x83
	.byte	0
	.uleb128 0x9
	.long	.LASF195
	.byte	0x6
	.value	0x165
	.byte	0xc
	.long	0x83
	.long	0xd20
	.uleb128 0x1
	.long	0x305
	.uleb128 0x1
	.long	0x2ef
	.uleb128 0x1a
	.byte	0
	.uleb128 0x9
	.long	.LASF196
	.byte	0x12
	.value	0x29d
	.byte	0x14
	.long	0x2ef
	.long	0xd37
	.uleb128 0x1
	.long	0x83
	.byte	0
	.uleb128 0x9
	.long	.LASF197
	.byte	0x12
	.value	0x294
	.byte	0xc
	.long	0x83
	.long	0xd5d
	.uleb128 0x1
	.long	0x2f4
	.uleb128 0x1
	.long	0x2f4
	.uleb128 0x1
	.long	0x756
	.uleb128 0x1
	.long	0xd62
	.byte	0
	.uleb128 0x5
	.long	0x74c
	.uleb128 0x11
	.long	0xd5d
	.uleb128 0x33
	.long	.LASF198
	.byte	0x16
	.value	0x2f4
	.byte	0xd
	.long	0xd7a
	.uleb128 0x1
	.long	0x83
	.byte	0
	.uleb128 0xa
	.long	.LASF199
	.byte	0x16
	.byte	0x69
	.byte	0xc
	.long	0x83
	.long	0xd90
	.uleb128 0x1
	.long	0x2ef
	.byte	0
	.uleb128 0xa
	.long	.LASF200
	.byte	0x15
	.byte	0x3d
	.byte	0xe
	.long	0x48
	.long	0xdb0
	.uleb128 0x1
	.long	0x48
	.uleb128 0x1
	.long	0x83
	.uleb128 0x1
	.long	0x3a
	.byte	0
	.uleb128 0x21
	.long	.LASF202
	.byte	0x16
	.value	0x2af
	.byte	0xd
	.long	0xdc3
	.uleb128 0x1
	.long	0x48
	.byte	0
	.uleb128 0x9
	.long	.LASF203
	.byte	0xd
	.value	0x166
	.byte	0xc
	.long	0x83
	.long	0xdda
	.uleb128 0x1
	.long	0x83
	.byte	0
	.uleb128 0x21
	.long	.LASF204
	.byte	0x1b
	.value	0x2c0
	.byte	0x6
	.long	0xded
	.uleb128 0x1
	.long	0xded
	.byte	0
	.uleb128 0x5
	.long	0x786
	.uleb128 0x9
	.long	.LASF205
	.byte	0x1b
	.value	0x2cf
	.byte	0xc
	.long	0x83
	.long	0xe13
	.uleb128 0x1
	.long	0xded
	.uleb128 0x1
	.long	0x7a8
	.uleb128 0x1
	.long	0xe13
	.byte	0
	.uleb128 0x5
	.long	0x41
	.uleb128 0x9
	.long	.LASF206
	.byte	0x1b
	.value	0x2cd
	.byte	0xc
	.long	0x83
	.long	0xe39
	.uleb128 0x1
	.long	0xded
	.uleb128 0x1
	.long	0x488
	.uleb128 0x1
	.long	0x2e
	.byte	0
	.uleb128 0x9
	.long	.LASF207
	.byte	0x1b
	.value	0x2cb
	.byte	0xc
	.long	0x83
	.long	0xe5a
	.uleb128 0x1
	.long	0xded
	.uleb128 0x1
	.long	0x7c2
	.uleb128 0x1
	.long	0xe5a
	.byte	0
	.uleb128 0x5
	.long	0x797
	.uleb128 0x20
	.long	.LASF208
	.byte	0x1b
	.value	0x391
	.byte	0xf
	.long	0x7c2
	.uleb128 0x20
	.long	.LASF209
	.byte	0x1b
	.value	0x2be
	.byte	0xd
	.long	0xded
	.uleb128 0x22
	.long	.LASF231
	.value	0x484
	.byte	0x7
	.long	0x48
	.quad	.LFB333
	.quad	.LFE333-.LFB333
	.uleb128 0x1
	.byte	0x9c
	.long	0xeaa
	.uleb128 0x13
	.string	"sd"
	.value	0x484
	.byte	0x21
	.long	0xeaa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.long	0x911
	.uleb128 0x18
	.long	.LASF212
	.value	0x3fc
	.quad	.LFB332
	.quad	.LFE332-.LFB332
	.uleb128 0x1
	.byte	0x9c
	.long	0xf06
	.uleb128 0x13
	.string	"sd"
	.value	0x3fc
	.byte	0x21
	.long	0xeaa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x7
	.string	"i"
	.value	0x402
	.byte	0x9
	.long	0x83
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.long	.LASF210
	.value	0x403
	.byte	0x9
	.long	0x83
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x2
	.long	.LASF211
	.value	0x404
	.byte	0x16
	.long	0x8fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x18
	.long	.LASF213
	.value	0x3ca
	.quad	.LFB331
	.quad	.LFE331-.LFB331
	.uleb128 0x1
	.byte	0x9c
	.long	0x106f
	.uleb128 0x13
	.string	"sd"
	.value	0x3ca
	.byte	0x21
	.long	0xeaa
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30840
	.uleb128 0x7
	.string	"i"
	.value	0x3cd
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30824
	.uleb128 0x2
	.long	.LASF214
	.value	0x3cd
	.byte	0x10
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30812
	.uleb128 0x2
	.long	.LASF211
	.value	0x3ce
	.byte	0x16
	.long	0x8fc
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30792
	.uleb128 0x2
	.long	.LASF215
	.value	0x3cf
	.byte	0xa
	.long	0x106f
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30768
	.uleb128 0x19
	.long	.LASF148
	.value	0x3f5
	.byte	0x5
	.quad	.L184
	.uleb128 0x8
	.quad	.LBB45
	.quad	.LBE45-.LBB45
	.uleb128 0x2
	.long	.LASF216
	.value	0x3d6
	.byte	0xd
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30808
	.uleb128 0x2
	.long	.LASF217
	.value	0x3d7
	.byte	0xd
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30820
	.uleb128 0x8
	.quad	.LBB46
	.quad	.LBE46-.LBB46
	.uleb128 0x7
	.string	"j"
	.value	0x3d8
	.byte	0x12
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30816
	.uleb128 0x8
	.quad	.LBB47
	.quad	.LBE47-.LBB47
	.uleb128 0x2
	.long	.LASF218
	.value	0x3dc
	.byte	0x1e
	.long	0x95f
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30778
	.uleb128 0x6
	.quad	.LBB48
	.quad	.LBE48-.LBB48
	.long	0x1021
	.uleb128 0x2
	.long	.LASF214
	.value	0x3e2
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30804
	.byte	0
	.uleb128 0x6
	.quad	.LBB49
	.quad	.LBE49-.LBB49
	.long	0x1048
	.uleb128 0x2
	.long	.LASF214
	.value	0x3e3
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30800
	.byte	0
	.uleb128 0x8
	.quad	.LBB50
	.quad	.LBE50-.LBB50
	.uleb128 0x2
	.long	.LASF214
	.value	0x3e5
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30796
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xd
	.long	0xef
	.long	0x1080
	.uleb128 0x34
	.long	0x3a
	.value	0x77ff
	.byte	0
	.uleb128 0x18
	.long	.LASF219
	.value	0x308
	.quad	.LFB330
	.quad	.LFE330-.LFB330
	.uleb128 0x1
	.byte	0x9c
	.long	0x129e
	.uleb128 0x13
	.string	"sd"
	.value	0x308
	.byte	0x1f
	.long	0xeaa
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30872
	.uleb128 0x7
	.string	"i"
	.value	0x30c
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30848
	.uleb128 0x2
	.long	.LASF214
	.value	0x30c
	.byte	0x10
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30820
	.uleb128 0x2
	.long	.LASF211
	.value	0x30d
	.byte	0x16
	.long	0x8fc
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30808
	.uleb128 0x2
	.long	.LASF215
	.value	0x30e
	.byte	0xa
	.long	0x106f
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30752
	.uleb128 0x1e
	.long	.LASF220
	.byte	0x20
	.byte	0x1
	.value	0x311
	.byte	0x14
	.long	0x1128
	.uleb128 0xb
	.long	.LASF151
	.byte	0x1
	.value	0x313
	.byte	0xf
	.long	0xe5
	.byte	0
	.uleb128 0xb
	.long	.LASF221
	.byte	0x1
	.value	0x314
	.byte	0xd
	.long	0x901
	.byte	0x8
	.uleb128 0xb
	.long	.LASF148
	.byte	0x1
	.value	0x315
	.byte	0x1b
	.long	0x129e
	.byte	0x18
	.byte	0
	.uleb128 0x25
	.long	.LASF222
	.byte	0x1
	.value	0x316
	.byte	0x7
	.long	0x10ef
	.uleb128 0x2
	.long	.LASF223
	.value	0x318
	.byte	0x12
	.long	0x1146
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30800
	.uleb128 0x5
	.long	0x1128
	.uleb128 0x19
	.long	.LASF148
	.value	0x373
	.byte	0x5
	.quad	.L148
	.uleb128 0x6
	.quad	.LBB37
	.quad	.LBE37-.LBB37
	.long	0x11ef
	.uleb128 0x2
	.long	.LASF218
	.value	0x324
	.byte	0x1a
	.long	0x95f
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30762
	.uleb128 0x2
	.long	.LASF224
	.value	0x32c
	.byte	0xd
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30844
	.uleb128 0x35
	.long	.LLRL0
	.uleb128 0x2
	.long	.LASF225
	.value	0x340
	.byte	0x13
	.long	0xe5
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30816
	.uleb128 0x2
	.long	.LASF161
	.value	0x341
	.byte	0x11
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30852
	.uleb128 0x8
	.quad	.LBB39
	.quad	.LBE39-.LBB39
	.uleb128 0x2
	.long	.LASF226
	.value	0x347
	.byte	0x1e
	.long	0x1146
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30792
	.uleb128 0x2
	.long	.LASF227
	.value	0x348
	.byte	0x15
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30840
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x8
	.quad	.LBB41
	.quad	.LBE41-.LBB41
	.uleb128 0x2
	.long	.LASF226
	.value	0x38c
	.byte	0x16
	.long	0x1146
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30784
	.uleb128 0x8
	.quad	.LBB42
	.quad	.LBE42-.LBB42
	.uleb128 0x2
	.long	.LASF228
	.value	0x390
	.byte	0x11
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30836
	.uleb128 0x2
	.long	.LASF229
	.value	0x391
	.byte	0x11
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30832
	.uleb128 0x2
	.long	.LASF230
	.value	0x3c0
	.byte	0x1a
	.long	0x1146
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30776
	.uleb128 0x6
	.quad	.LBB43
	.quad	.LBE43-.LBB43
	.long	0x127a
	.uleb128 0x7
	.string	"j"
	.value	0x393
	.byte	0x16
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30828
	.byte	0
	.uleb128 0x8
	.quad	.LBB44
	.quad	.LBE44-.LBB44
	.uleb128 0x7
	.string	"j"
	.value	0x3af
	.byte	0x16
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30824
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x5
	.long	0x10ef
	.uleb128 0x22
	.long	.LASF232
	.value	0x2e0
	.byte	0x5
	.long	0x83
	.quad	.LFB329
	.quad	.LFE329-.LFB329
	.uleb128 0x1
	.byte	0x9c
	.long	0x1321
	.uleb128 0x14
	.long	.LASF233
	.value	0x2e0
	.byte	0x27
	.long	0x2ef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x14
	.long	.LASF225
	.value	0x2e0
	.byte	0x3f
	.long	0x4c4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x14
	.long	.LASF161
	.value	0x2e0
	.byte	0x57
	.long	0x7ad
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x2
	.long	.LASF234
	.value	0x2e3
	.byte	0x11
	.long	0x2ef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.long	.LASF235
	.value	0x2ee
	.byte	0x11
	.long	0x2ef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.long	.LASF236
	.value	0x2f8
	.byte	0xc
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x22
	.long	.LASF237
	.value	0x2bb
	.byte	0x7
	.long	0xe5
	.quad	.LFB328
	.quad	.LFE328-.LFB328
	.uleb128 0x1
	.byte	0x9c
	.long	0x138f
	.uleb128 0x14
	.long	.LASF233
	.value	0x2bb
	.byte	0x2d
	.long	0x2ef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x2
	.long	.LASF238
	.value	0x2be
	.byte	0x11
	.long	0x2ef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2
	.long	.LASF235
	.value	0x2c8
	.byte	0x11
	.long	0x2ef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.long	.LASF236
	.value	0x2cf
	.byte	0xc
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.long	.LASF225
	.value	0x2d2
	.byte	0xb
	.long	0xe5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x18
	.long	.LASF239
	.value	0x1ac
	.quad	.LFB327
	.quad	.LFE327-.LFB327
	.uleb128 0x1
	.byte	0x9c
	.long	0x1783
	.uleb128 0x13
	.string	"sd"
	.value	0x1ac
	.byte	0x1e
	.long	0xeaa
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30984
	.uleb128 0x2
	.long	.LASF240
	.value	0x1b0
	.byte	0xb
	.long	0xe5
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30872
	.uleb128 0x2
	.long	.LASF216
	.value	0x1b9
	.byte	0xe
	.long	0x4ab
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30912
	.uleb128 0x7
	.string	"i"
	.value	0x1bc
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30976
	.uleb128 0x2
	.long	.LASF214
	.value	0x1bc
	.byte	0x10
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30908
	.uleb128 0x2
	.long	.LASF211
	.value	0x1bd
	.byte	0x16
	.long	0x8fc
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30864
	.uleb128 0x2
	.long	.LASF241
	.value	0x1c0
	.byte	0x9
	.long	0x901
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30832
	.uleb128 0x2
	.long	.LASF242
	.value	0x1c1
	.byte	0x9
	.long	0x901
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30816
	.uleb128 0x2
	.long	.LASF243
	.value	0x1c2
	.byte	0xb
	.long	0x1783
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30800
	.uleb128 0x2
	.long	.LASF215
	.value	0x1c3
	.byte	0xa
	.long	0x106f
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30768
	.uleb128 0x2
	.long	.LASF244
	.value	0x1c4
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30972
	.uleb128 0x2
	.long	.LASF245
	.value	0x1cc
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30968
	.uleb128 0x2
	.long	.LASF246
	.value	0x1cd
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30964
	.uleb128 0x19
	.long	.LASF148
	.value	0x250
	.byte	0x5
	.quad	.L82
	.uleb128 0x19
	.long	.LASF247
	.value	0x247
	.byte	0x9
	.quad	.L95
	.uleb128 0x2
	.long	.LASF229
	.value	0x26e
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30940
	.uleb128 0x2
	.long	.LASF151
	.value	0x28e
	.byte	0xb
	.long	0xe5
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30848
	.uleb128 0x7
	.string	"fs"
	.value	0x292
	.byte	0xb
	.long	0x305
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30856
	.uleb128 0x2
	.long	.LASF248
	.value	0x2a3
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30924
	.uleb128 0x6
	.quad	.LBB20
	.quad	.LBE20-.LBB20
	.long	0x16a8
	.uleb128 0x2
	.long	.LASF217
	.value	0x1dd
	.byte	0xd
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30960
	.uleb128 0x6
	.quad	.LBB21
	.quad	.LBE21-.LBB21
	.long	0x1534
	.uleb128 0x7
	.string	"j"
	.value	0x1e0
	.byte	0x12
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30956
	.byte	0
	.uleb128 0x8
	.quad	.LBB22
	.quad	.LBE22-.LBB22
	.uleb128 0x7
	.string	"j"
	.value	0x1e7
	.byte	0x12
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30952
	.uleb128 0x8
	.quad	.LBB23
	.quad	.LBE23-.LBB23
	.uleb128 0x2
	.long	.LASF218
	.value	0x1f5
	.byte	0x1e
	.long	0x95f
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30848
	.uleb128 0x2
	.long	.LASF249
	.value	0x21f
	.byte	0x11
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30884
	.uleb128 0x2
	.long	.LASF250
	.value	0x22b
	.byte	0x11
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30948
	.uleb128 0x6
	.quad	.LBB24
	.quad	.LBE24-.LBB24
	.long	0x15bf
	.uleb128 0x2
	.long	.LASF214
	.value	0x203
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30904
	.byte	0
	.uleb128 0x6
	.quad	.LBB25
	.quad	.LBE25-.LBB25
	.long	0x15e6
	.uleb128 0x2
	.long	.LASF214
	.value	0x204
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30900
	.byte	0
	.uleb128 0x6
	.quad	.LBB26
	.quad	.LBE26-.LBB26
	.long	0x160d
	.uleb128 0x2
	.long	.LASF214
	.value	0x207
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30896
	.byte	0
	.uleb128 0x6
	.quad	.LBB27
	.quad	.LBE27-.LBB27
	.long	0x1634
	.uleb128 0x2
	.long	.LASF214
	.value	0x20f
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30892
	.byte	0
	.uleb128 0x6
	.quad	.LBB28
	.quad	.LBE28-.LBB28
	.long	0x165b
	.uleb128 0x2
	.long	.LASF214
	.value	0x214
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30888
	.byte	0
	.uleb128 0x6
	.quad	.LBB29
	.quad	.LBE29-.LBB29
	.long	0x1682
	.uleb128 0x2
	.long	.LASF214
	.value	0x22f
	.byte	0x1c
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30876
	.byte	0
	.uleb128 0x8
	.quad	.LBB30
	.quad	.LBE30-.LBB30
	.uleb128 0x2
	.long	.LASF214
	.value	0x23c
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30880
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x6
	.quad	.LBB31
	.quad	.LBE31-.LBB31
	.long	0x16cd
	.uleb128 0x7
	.string	"i"
	.value	0x260
	.byte	0xe
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30944
	.byte	0
	.uleb128 0x6
	.quad	.LBB32
	.quad	.LBE32-.LBB32
	.long	0x16f2
	.uleb128 0x7
	.string	"i"
	.value	0x26f
	.byte	0xe
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30936
	.byte	0
	.uleb128 0x6
	.quad	.LBB33
	.quad	.LBE33-.LBB33
	.long	0x1717
	.uleb128 0x7
	.string	"i"
	.value	0x282
	.byte	0x12
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30932
	.byte	0
	.uleb128 0x6
	.quad	.LBB34
	.quad	.LBE34-.LBB34
	.long	0x173c
	.uleb128 0x7
	.string	"i"
	.value	0x298
	.byte	0x12
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30928
	.byte	0
	.uleb128 0x6
	.quad	.LBB35
	.quad	.LBE35-.LBB35
	.long	0x1761
	.uleb128 0x7
	.string	"i"
	.value	0x2a4
	.byte	0xe
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30920
	.byte	0
	.uleb128 0x8
	.quad	.LBB36
	.quad	.LBE36-.LBB36
	.uleb128 0x7
	.string	"i"
	.value	0x2aa
	.byte	0xe
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30916
	.byte	0
	.byte	0
	.uleb128 0xd
	.long	0xe5
	.long	0x1793
	.uleb128 0xf
	.long	0x3a
	.byte	0x3
	.byte	0
	.uleb128 0x18
	.long	.LASF251
	.value	0x173
	.quad	.LFB326
	.quad	.LFE326-.LFB326
	.uleb128 0x1
	.byte	0x9c
	.long	0x1880
	.uleb128 0x13
	.string	"sd"
	.value	0x173
	.byte	0x1e
	.long	0xeaa
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x7
	.string	"fs"
	.value	0x175
	.byte	0xb
	.long	0x305
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x2
	.long	.LASF240
	.value	0x17c
	.byte	0xb
	.long	0xe5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x2
	.long	.LASF216
	.value	0x186
	.byte	0xe
	.long	0x4ab
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x2
	.long	.LASF252
	.value	0x18a
	.byte	0x9
	.long	0x83
	.uleb128 0x3
	.byte	0x91
	.sleb128 -108
	.uleb128 0x2
	.long	.LASF253
	.value	0x18d
	.byte	0x9
	.long	0x901
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x2
	.long	.LASF243
	.value	0x18e
	.byte	0xb
	.long	0x1783
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x2
	.long	.LASF254
	.value	0x18f
	.byte	0x9
	.long	0x83
	.uleb128 0x3
	.byte	0x91
	.sleb128 -124
	.uleb128 0x8
	.quad	.LBB18
	.quad	.LBE18-.LBB18
	.uleb128 0x7
	.string	"i"
	.value	0x196
	.byte	0xe
	.long	0x83
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x8
	.quad	.LBB19
	.quad	.LBE19-.LBB19
	.uleb128 0x2
	.long	.LASF255
	.value	0x198
	.byte	0xd
	.long	0x83
	.uleb128 0x3
	.byte	0x91
	.sleb128 -116
	.uleb128 0x2
	.long	.LASF256
	.value	0x1a1
	.byte	0xf
	.long	0xe5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x18
	.long	.LASF257
	.value	0x10c
	.quad	.LFB325
	.quad	.LFE325-.LFB325
	.uleb128 0x1
	.byte	0x9c
	.long	0x1ab2
	.uleb128 0x13
	.string	"sd"
	.value	0x10c
	.byte	0x2c
	.long	0xeaa
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30872
	.uleb128 0x14
	.long	.LASF243
	.value	0x10c
	.byte	0x36
	.long	0x4c4
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30880
	.uleb128 0x14
	.long	.LASF253
	.value	0x10c
	.byte	0x44
	.long	0x7ad
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30888
	.uleb128 0x14
	.long	.LASF216
	.value	0x10c
	.byte	0x57
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30892
	.uleb128 0x2
	.long	.LASF211
	.value	0x113
	.byte	0x16
	.long	0x8fc
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30808
	.uleb128 0x7
	.string	"i"
	.value	0x114
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30852
	.uleb128 0x2
	.long	.LASF214
	.value	0x114
	.byte	0x10
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30824
	.uleb128 0x2
	.long	.LASF241
	.value	0x116
	.byte	0x9
	.long	0x901
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30784
	.uleb128 0x2
	.long	.LASF215
	.value	0x117
	.byte	0xa
	.long	0x106f
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30768
	.uleb128 0x19
	.long	.LASF148
	.value	0x14d
	.byte	0x5
	.quad	.L45
	.uleb128 0x6
	.quad	.LBB8
	.quad	.LBE8-.LBB8
	.long	0x1a6b
	.uleb128 0x2
	.long	.LASF217
	.value	0x120
	.byte	0xd
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30848
	.uleb128 0x6
	.quad	.LBB9
	.quad	.LBE9-.LBB9
	.long	0x198e
	.uleb128 0x7
	.string	"j"
	.value	0x124
	.byte	0x12
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30844
	.byte	0
	.uleb128 0x8
	.quad	.LBB10
	.quad	.LBE10-.LBB10
	.uleb128 0x7
	.string	"j"
	.value	0x12a
	.byte	0x12
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30840
	.uleb128 0x8
	.quad	.LBB11
	.quad	.LBE11-.LBB11
	.uleb128 0x2
	.long	.LASF258
	.value	0x130
	.byte	0x1e
	.long	0x95f
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30794
	.uleb128 0x6
	.quad	.LBB12
	.quad	.LBE12-.LBB12
	.long	0x19f7
	.uleb128 0x2
	.long	.LASF214
	.value	0x136
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30828
	.byte	0
	.uleb128 0x6
	.quad	.LBB13
	.quad	.LBE13-.LBB13
	.long	0x1a1e
	.uleb128 0x2
	.long	.LASF214
	.value	0x139
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30820
	.byte	0
	.uleb128 0x6
	.quad	.LBB14
	.quad	.LBE14-.LBB14
	.long	0x1a45
	.uleb128 0x2
	.long	.LASF214
	.value	0x13b
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30816
	.byte	0
	.uleb128 0x8
	.quad	.LBB15
	.quad	.LBE15-.LBB15
	.uleb128 0x2
	.long	.LASF214
	.value	0x13e
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30812
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x6
	.quad	.LBB16
	.quad	.LBE16-.LBB16
	.long	0x1a90
	.uleb128 0x7
	.string	"i"
	.value	0x153
	.byte	0xe
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30836
	.byte	0
	.uleb128 0x8
	.quad	.LBB17
	.quad	.LBE17-.LBB17
	.uleb128 0x7
	.string	"i"
	.value	0x161
	.byte	0xe
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30832
	.byte	0
	.byte	0
	.uleb128 0x36
	.long	.LASF259
	.byte	0x1
	.byte	0x7e
	.byte	0x5
	.long	0x83
	.quad	.LFB324
	.quad	.LFE324-.LFB324
	.uleb128 0x1
	.byte	0x9c
	.long	0x1c2b
	.uleb128 0x1b
	.string	"sd"
	.byte	0x7e
	.byte	0x23
	.long	0xeaa
	.uleb128 0x3
	.byte	0x91
	.sleb128 -344
	.uleb128 0x1c
	.long	.LASF211
	.byte	0x7e
	.byte	0x38
	.long	0x8fc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -352
	.uleb128 0x1c
	.long	.LASF260
	.byte	0x7e
	.byte	0x45
	.long	0x83
	.uleb128 0x3
	.byte	0x91
	.sleb128 -356
	.uleb128 0xc
	.long	.LASF261
	.byte	0x80
	.byte	0x15
	.long	0x6c8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -272
	.uleb128 0xc
	.long	.LASF230
	.byte	0x80
	.byte	0x1d
	.long	0x74c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0xc
	.long	.LASF262
	.byte	0x81
	.byte	0x9
	.long	0x83
	.uleb128 0x3
	.byte	0x91
	.sleb128 -324
	.uleb128 0x19
	.long	.LASF263
	.value	0x104
	.byte	0x1
	.quad	.L23
	.uleb128 0x15
	.string	"s"
	.byte	0xf9
	.byte	0xa
	.long	0x1c2b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x15
	.string	"tv"
	.byte	0xfe
	.byte	0x14
	.long	0x322
	.uleb128 0x3
	.byte	0x91
	.sleb128 -288
	.uleb128 0x8
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0xc
	.long	.LASF264
	.byte	0xa2
	.byte	0xd
	.long	0x83
	.uleb128 0x3
	.byte	0x91
	.sleb128 -316
	.uleb128 0xc
	.long	.LASF265
	.byte	0xa6
	.byte	0xd
	.long	0x83
	.uleb128 0x3
	.byte	0x91
	.sleb128 -312
	.uleb128 0x8
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0xc
	.long	.LASF266
	.byte	0xad
	.byte	0x18
	.long	0x37c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -224
	.uleb128 0x15
	.string	"tv"
	.byte	0xae
	.byte	0x20
	.long	0x322
	.uleb128 0x3
	.byte	0x91
	.sleb128 -288
	.uleb128 0xc
	.long	.LASF267
	.byte	0xb8
	.byte	0x15
	.long	0x83
	.uleb128 0x3
	.byte	0x91
	.sleb128 -308
	.uleb128 0x6
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.long	0x1bf8
	.uleb128 0x15
	.string	"__i"
	.byte	0xb0
	.byte	0x11
	.long	0x41
	.uleb128 0x3
	.byte	0x91
	.sleb128 -320
	.uleb128 0xc
	.long	.LASF268
	.byte	0xb0
	.byte	0x11
	.long	0xc87
	.uleb128 0x3
	.byte	0x91
	.sleb128 -296
	.byte	0
	.uleb128 0x8
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.uleb128 0xc
	.long	.LASF269
	.byte	0xc6
	.byte	0x19
	.long	0x83
	.uleb128 0x3
	.byte	0x91
	.sleb128 -332
	.uleb128 0x15
	.string	"len"
	.byte	0xc7
	.byte	0x1f
	.long	0x4b7
	.uleb128 0x3
	.byte	0x91
	.sleb128 -328
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xd
	.long	0xef
	.long	0x1c3b
	.uleb128 0xf
	.long	0x3a
	.byte	0x2d
	.byte	0
	.uleb128 0x27
	.long	.LASF270
	.byte	0x66
	.quad	.LFB323
	.quad	.LFE323-.LFB323
	.uleb128 0x1
	.byte	0x9c
	.long	0x1c93
	.uleb128 0x1b
	.string	"sd"
	.byte	0x66
	.byte	0x28
	.long	0xeaa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xc
	.long	.LASF211
	.byte	0x68
	.byte	0x16
	.long	0x8fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x8
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0xc
	.long	.LASF230
	.byte	0x6b
	.byte	0x1a
	.long	0x8fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x27
	.long	.LASF271
	.byte	0x61
	.quad	.LFB322
	.quad	.LFE322-.LFB322
	.uleb128 0x1
	.byte	0x9c
	.long	0x1cbe
	.uleb128 0x1c
	.long	.LASF211
	.byte	0x61
	.byte	0x32
	.long	0x8fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x37
	.long	.LASF272
	.byte	0x1
	.byte	0x57
	.byte	0x7
	.long	0x48
	.quad	.LFB321
	.quad	.LFE321-.LFB321
	.uleb128 0x1
	.byte	0x9c
	.long	0x1cee
	.uleb128 0x1b
	.string	"sa"
	.byte	0x57
	.byte	0x24
	.long	0x55f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x38
	.long	.LASF273
	.byte	0x1
	.byte	0x37
	.byte	0xa
	.long	0x4ab
	.quad	.LFB320
	.quad	.LFE320-.LFB320
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1b
	.string	"str"
	.byte	0x37
	.byte	0x18
	.long	0xe5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x1c
	.long	.LASF274
	.byte	0x37
	.byte	0x21
	.long	0x83
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.uleb128 0xc
	.long	.LASF275
	.byte	0x39
	.byte	0x11
	.long	0xded
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x15
	.string	"md"
	.byte	0x3a
	.byte	0x13
	.long	0x7c2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xc
	.long	.LASF276
	.byte	0x3c
	.byte	0x12
	.long	0x41
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0xc
	.long	.LASF277
	.byte	0x3d
	.byte	0x13
	.long	0x7b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xc
	.long	.LASF216
	.byte	0x4e
	.byte	0xe
	.long	0x4ab
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x8
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x15
	.string	"n"
	.byte	0x4f
	.byte	0x17
	.long	0x41
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x3
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
	.uleb128 0x7
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
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
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x5
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
	.uleb128 0x19
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x1d
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.uleb128 0x1f
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
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
	.uleb128 0x22
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
	.uleb128 0x5
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
	.uleb128 0x23
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
	.uleb128 0x24
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
	.uleb128 0x27
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
	.uleb128 0x28
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
	.uleb128 0x29
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2a
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
	.uleb128 0x2b
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
	.uleb128 0x2c
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
	.uleb128 0x2d
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2e
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
	.uleb128 0x2f
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x31
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
	.uleb128 0x32
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
	.uleb128 0x33
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
	.uleb128 0x34
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x36
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
	.uleb128 0x37
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
	.uleb128 0x38
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
	.uleb128 .LBB38-.Ltext0
	.uleb128 .LBE38-.Ltext0
	.byte	0x4
	.uleb128 .LBB40-.Ltext0
	.uleb128 .LBE40-.Ltext0
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF106:
	.string	"sin6_flowinfo"
.LASF40:
	.string	"_shortbuf"
.LASF186:
	.string	"rand"
.LASF177:
	.string	"strrchr"
.LASF47:
	.string	"_prevchain"
.LASF219:
	.string	"list_file"
.LASF279:
	.string	"_IO_lock_t"
.LASF276:
	.string	"md_len"
.LASF182:
	.string	"strlen"
.LASF272:
	.string	"get_in_addr"
.LASF214:
	.string	"numbytes"
.LASF179:
	.string	"strncmp"
.LASF29:
	.string	"_IO_buf_end"
.LASF258:
	.string	"message"
.LASF264:
	.string	"flags"
.LASF240:
	.string	"temp_filename"
.LASF60:
	.string	"__fd_mask"
.LASF95:
	.string	"sockaddr"
.LASF160:
	.string	"message_header_s"
.LASF164:
	.string	"message_header_t"
.LASF267:
	.string	"select_result"
.LASF108:
	.string	"sin6_scope_id"
.LASF27:
	.string	"_IO_write_end"
.LASF3:
	.string	"unsigned int"
.LASF148:
	.string	"next"
.LASF45:
	.string	"_freeres_list"
.LASF266:
	.string	"write_fds"
.LASF21:
	.string	"_flags"
.LASF247:
	.string	"chunk_failed"
.LASF281:
	.string	"__socket_type"
.LASF234:
	.string	"filename_part"
.LASF188:
	.string	"strerror"
.LASF218:
	.string	"message_header"
.LASF33:
	.string	"_markers"
.LASF197:
	.string	"getaddrinfo"
.LASF269:
	.string	"error"
.LASF151:
	.string	"filename"
.LASF259:
	.string	"connect_server"
.LASF265:
	.string	"connect_result"
.LASF135:
	.string	"ENGINE"
.LASF138:
	.string	"EXIT"
.LASF255:
	.string	"chunk_size"
.LASF155:
	.string	"server_sock_fds"
.LASF227:
	.string	"found"
.LASF237:
	.string	"extract_original_filename"
.LASF248:
	.string	"total_file_size"
.LASF144:
	.string	"client_sock_fd"
.LASF256:
	.string	"chunk"
.LASF181:
	.string	"send"
.LASF246:
	.string	"servers_available"
.LASF64:
	.string	"__pthread_internal_list"
.LASF83:
	.string	"uint32_t"
.LASF65:
	.string	"__prev"
.LASF110:
	.string	"in_addr_t"
.LASF189:
	.string	"getsockopt"
.LASF32:
	.string	"_IO_save_end"
.LASF70:
	.string	"__count"
.LASF131:
	.string	"EVP_MD"
.LASF251:
	.string	"put_file"
.LASF209:
	.string	"EVP_MD_CTX_new"
.LASF136:
	.string	"engine_st"
.LASF174:
	.string	"malloc"
.LASF119:
	.string	"addrinfo"
.LASF217:
	.string	"index"
.LASF63:
	.string	"long long unsigned int"
.LASF163:
	.string	"data_length"
.LASF225:
	.string	"original_filename"
.LASF161:
	.string	"chunk_id"
.LASF114:
	.string	"__u6_addr8"
.LASF167:
	.string	"strncpy"
.LASF263:
	.string	"cleanup"
.LASF213:
	.string	"delete_file"
.LASF99:
	.string	"sin_family"
.LASF10:
	.string	"__uint16_t"
.LASF210:
	.string	"servers_online"
.LASF71:
	.string	"__owner"
.LASF42:
	.string	"_offset"
.LASF76:
	.string	"__list"
.LASF113:
	.string	"in_port_t"
.LASF75:
	.string	"__elision"
.LASF195:
	.string	"fprintf"
.LASF35:
	.string	"_fileno"
.LASF57:
	.string	"timeval"
.LASF196:
	.string	"gai_strerror"
.LASF102:
	.string	"sin_zero"
.LASF112:
	.string	"s_addr"
.LASF249:
	.string	"data_size"
.LASF7:
	.string	"size_t"
.LASF94:
	.string	"sa_family_t"
.LASF39:
	.string	"_vtable_offset"
.LASF125:
	.string	"ai_addr"
.LASF24:
	.string	"_IO_read_base"
.LASF223:
	.string	"file_list"
.LASF59:
	.string	"tv_usec"
.LASF107:
	.string	"sin6_addr"
.LASF202:
	.string	"free"
.LASF166:
	.string	"strcmp"
.LASF222:
	.string	"file_info_t"
.LASF261:
	.string	"hints"
.LASF139:
	.string	"SERVER_INFO"
.LASF66:
	.string	"__next"
.LASF19:
	.string	"char"
.LASF153:
	.string	"servers_details"
.LASF48:
	.string	"_mode"
.LASF254:
	.string	"total_chunk_size_until_now"
.LASF51:
	.string	"_IO_marker"
.LASF203:
	.string	"close"
.LASF191:
	.string	"__errno_location"
.LASF185:
	.string	"inet_ntop"
.LASF198:
	.string	"exit"
.LASF204:
	.string	"EVP_MD_CTX_free"
.LASF90:
	.string	"SOCK_DCCP"
.LASF74:
	.string	"__spins"
.LASF152:
	.string	"command_int"
.LASF243:
	.string	"chunks"
.LASF81:
	.string	"uint8_t"
.LASF262:
	.string	"status"
.LASF91:
	.string	"SOCK_PACKET"
.LASF280:
	.string	"stderr"
.LASF242:
	.string	"chunks_stored_sizes"
.LASF206:
	.string	"EVP_DigestUpdate"
.LASF134:
	.string	"evp_md_ctx_st"
.LASF25:
	.string	"_IO_write_base"
.LASF86:
	.string	"SOCK_DGRAM"
.LASF15:
	.string	"__pid_t"
.LASF143:
	.string	"serverDetails_t"
.LASF55:
	.string	"long long int"
.LASF184:
	.string	"printf"
.LASF158:
	.string	"lock"
.LASF30:
	.string	"_IO_save_base"
.LASF100:
	.string	"sin_port"
.LASF137:
	.string	"DELETE"
.LASF235:
	.string	"last_underscore"
.LASF275:
	.string	"context"
.LASF226:
	.string	"file_entry"
.LASF116:
	.string	"__u6_addr32"
.LASF127:
	.string	"ai_next"
.LASF205:
	.string	"EVP_DigestFinal_ex"
.LASF140:
	.string	"HELP"
.LASF176:
	.string	"fseek"
.LASF200:
	.string	"memset"
.LASF159:
	.string	"sockDetails_t"
.LASF224:
	.string	"files_found"
.LASF257:
	.string	"connect_and_put_chunks"
.LASF62:
	.string	"fd_set"
.LASF252:
	.string	"size"
.LASF46:
	.string	"_freeres_buf"
.LASF54:
	.string	"ssize_t"
.LASF150:
	.string	"command"
.LASF118:
	.string	"__in6_u"
.LASF101:
	.string	"sin_addr"
.LASF73:
	.string	"__kind"
.LASF175:
	.string	"ftell"
.LASF2:
	.string	"long unsigned int"
.LASF126:
	.string	"ai_canonname"
.LASF228:
	.string	"chunks_available"
.LASF178:
	.string	"fopen"
.LASF253:
	.string	"chunk_sizes"
.LASF187:
	.string	"gettid"
.LASF67:
	.string	"__pthread_list_t"
.LASF130:
	.string	"long double"
.LASF82:
	.string	"uint16_t"
.LASF245:
	.string	"servers_contacted"
.LASF244:
	.string	"total_chunks_downloaded"
.LASF278:
	.string	"GNU C17 14.2.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF121:
	.string	"ai_family"
.LASF232:
	.string	"parse_server_filename"
.LASF85:
	.string	"SOCK_STREAM"
.LASF115:
	.string	"__u6_addr16"
.LASF250:
	.string	"total_bytes"
.LASF183:
	.string	"setsockopt"
.LASF23:
	.string	"_IO_read_end"
.LASF212:
	.string	"server_info"
.LASF168:
	.string	"strchr"
.LASF104:
	.string	"sin6_family"
.LASF9:
	.string	"short int"
.LASF192:
	.string	"connect"
.LASF61:
	.string	"fds_bits"
.LASF270:
	.string	"cleanup_connection"
.LASF12:
	.string	"long int"
.LASF216:
	.string	"hash"
.LASF274:
	.string	"length"
.LASF173:
	.string	"fread"
.LASF141:
	.string	"number_of_command"
.LASF230:
	.string	"temp"
.LASF53:
	.string	"_IO_wide_data"
.LASF236:
	.string	"original_len"
.LASF268:
	.string	"__arr"
.LASF169:
	.string	"fclose"
.LASF229:
	.string	"can_rebuild"
.LASF154:
	.string	"connect_to_info"
.LASF194:
	.string	"socket"
.LASF220:
	.string	"file_info"
.LASF18:
	.string	"__ssize_t"
.LASF98:
	.string	"sockaddr_in"
.LASF207:
	.string	"EVP_DigestInit_ex"
.LASF8:
	.string	"__uint8_t"
.LASF77:
	.string	"__data"
.LASF190:
	.string	"select"
.LASF92:
	.string	"SOCK_CLOEXEC"
.LASF28:
	.string	"_IO_buf_base"
.LASF72:
	.string	"__nusers"
.LASF44:
	.string	"_wide_data"
.LASF238:
	.string	"first_underscore"
.LASF109:
	.string	"__CONST_SOCKADDR_ARG"
.LASF41:
	.string	"_lock"
.LASF58:
	.string	"tv_sec"
.LASF277:
	.string	"digest"
.LASF117:
	.string	"in6_addr"
.LASF149:
	.string	"sockfd"
.LASF133:
	.string	"EVP_MD_CTX"
.LASF52:
	.string	"_IO_codecvt"
.LASF241:
	.string	"chunks_stored"
.LASF37:
	.string	"_old_offset"
.LASF56:
	.string	"_IO_FILE"
.LASF87:
	.string	"SOCK_RAW"
.LASF80:
	.string	"pthread_mutex_t"
.LASF69:
	.string	"__lock"
.LASF128:
	.string	"__int128"
.LASF111:
	.string	"in_addr"
.LASF123:
	.string	"ai_protocol"
.LASF122:
	.string	"ai_socktype"
.LASF208:
	.string	"EVP_md5"
.LASF4:
	.string	"unsigned char"
.LASF221:
	.string	"chunks_present"
.LASF11:
	.string	"__uint32_t"
.LASF171:
	.string	"asprintf"
.LASF20:
	.string	"__socklen_t"
.LASF273:
	.string	"str2md5"
.LASF231:
	.string	"handle_req"
.LASF26:
	.string	"_IO_write_ptr"
.LASF89:
	.string	"SOCK_SEQPACKET"
.LASF271:
	.string	"cleanup_current_connection"
.LASF31:
	.string	"_IO_backup_base"
.LASF17:
	.string	"__suseconds_t"
.LASF156:
	.string	"number_of_servers"
.LASF193:
	.string	"fcntl"
.LASF16:
	.string	"__time_t"
.LASF215:
	.string	"recieve_buffer"
.LASF233:
	.string	"server_filename"
.LASF43:
	.string	"_codecvt"
.LASF147:
	.string	"dfsno"
.LASF145:
	.string	"server_port"
.LASF120:
	.string	"ai_flags"
.LASF170:
	.string	"fwrite"
.LASF132:
	.string	"evp_md_st"
.LASF13:
	.string	"__off_t"
.LASF180:
	.string	"recv"
.LASF157:
	.string	"number_of_available_servers"
.LASF6:
	.string	"signed char"
.LASF96:
	.string	"sa_family"
.LASF165:
	.string	"strdup"
.LASF5:
	.string	"short unsigned int"
.LASF172:
	.string	"memcpy"
.LASF146:
	.string	"server_ip"
.LASF199:
	.string	"atoi"
.LASF211:
	.string	"current"
.LASF93:
	.string	"SOCK_NONBLOCK"
.LASF22:
	.string	"_IO_read_ptr"
.LASF162:
	.string	"filename_length"
.LASF239:
	.string	"get_file"
.LASF129:
	.string	"__int128 unsigned"
.LASF79:
	.string	"__align"
.LASF34:
	.string	"_chain"
.LASF124:
	.string	"ai_addrlen"
.LASF142:
	.string	"commands_t"
.LASF50:
	.string	"FILE"
.LASF36:
	.string	"_flags2"
.LASF84:
	.string	"socklen_t"
.LASF260:
	.string	"server_index"
.LASF105:
	.string	"sin6_port"
.LASF78:
	.string	"__size"
.LASF201:
	.string	"freeaddrinfo"
.LASF38:
	.string	"_cur_column"
.LASF103:
	.string	"sockaddr_in6"
.LASF97:
	.string	"sa_data"
.LASF14:
	.string	"__off64_t"
.LASF49:
	.string	"_unused2"
.LASF88:
	.string	"SOCK_RDM"
.LASF68:
	.string	"__pthread_mutex_s"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"src/handle_req.c"
.LASF1:
	.string	"/home/parth/Work/All_data/university/Network System/Assignments/PA4_not_relaible/PA4/client"
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
