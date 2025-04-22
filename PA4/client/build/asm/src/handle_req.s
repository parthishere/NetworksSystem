	.file	"handle_req.c"
	.text
.Ltext0:
	.file 0 "/home/parth/Work/All_data/university/Network System/Assignments/PA4/client" "src/handle_req.c"
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
	.loc 1 79 14
	movl	$0, -52(%rbp)
	.loc 1 79 5
	jmp	.L6
.L7:
	.loc 1 81 23
	movl	-52(%rbp), %eax
	cltq
	movzbl	-32(%rbp,%rax), %eax
	movzbl	%al, %eax
	.loc 1 81 14
	addl	%eax, -56(%rbp)
	.loc 1 79 33 discriminator 3
	addl	$1, -52(%rbp)
.L6:
	.loc 1 79 23 discriminator 1
	movl	-52(%rbp), %edx
	movl	-60(%rbp), %eax
	cmpl	%eax, %edx
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
	.loc 1 100 29
	movq	-8(%rbp), %rax
	movl	$-1, (%rax)
	.loc 1 101 16
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 101 8
	testq	%rax, %rax
	je	.L14
	.loc 1 102 21
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 102 9
	movq	%rax, %rdi
	call	free@PLT
.L14:
	.loc 1 103 24
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	.loc 1 104 16
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 104 8
	testq	%rax, %rax
	je	.L15
	.loc 1 105 21
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 105 9
	movq	%rax, %rdi
	call	free@PLT
.L15:
	.loc 1 106 26
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	.loc 1 107 1
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
	.loc 1 110 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 1 111 22
	movq	-24(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -16(%rbp)
	.loc 1 112 11
	jmp	.L17
.L18:
.LBB3:
	.loc 1 114 26
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	.loc 1 115 17
	movq	-16(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -16(%rbp)
	.loc 1 116 9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L17:
.LBE3:
	.loc 1 112 12
	cmpq	$0, -16(%rbp)
	jne	.L18
	.loc 1 118 37
	movq	-24(%rbp), %rax
	movl	$0, 60(%rax)
	.loc 1 119 27
	movq	-24(%rbp), %rax
	movl	$0, 56(%rax)
	.loc 1 120 11
	movq	-24(%rbp), %rax
	movq	48(%rax), %rax
	.loc 1 120 8
	testq	%rax, %rax
	je	.L19
	.loc 1 121 16
	movq	-24(%rbp), %rax
	movq	48(%rax), %rax
	.loc 1 121 9
	movq	%rax, %rdi
	call	free@PLT
.L19:
	.loc 1 122 25
	movq	-24(%rbp), %rax
	movq	$0, 48(%rax)
	.loc 1 123 1
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
	.string	"\033[31m\n[-] CONNECTION FAILED: Server %d (%s:%s)\n\033[0m"
	.align 8
.LC4:
	.string	"\033[31m    Error: %s (errno: %d)\n\033[0m"
	.align 8
.LC5:
	.string	"\033[31m\n[-] ERROR: Connection attempt exhausted all available addresses (thread: %d, errno: %d)\n\033[0m"
	.align 8
.LC6:
	.string	"\033[32m\n[+] CONNECTION ESTABLISHED: Server %d\n\033[0m"
.LC7:
	.string	"\033[32m    Address: %s:%s\n\033[0m"
	.text
	.globl	connect_server
	.type	connect_server, @function
connect_server:
.LFB324:
	.loc 1 126 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$184, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -168(%rbp)
	movq	%rsi, -176(%rbp)
	movl	%edx, -180(%rbp)
	.loc 1 126 1
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 1 128 9
	movl	$1, -156(%rbp)
	.loc 1 130 7
	movq	-168(%rbp), %rax
	movq	48(%rax), %rax
	.loc 1 130 24
	movl	-180(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	.loc 1 130 39
	movl	$-1, (%rax)
	.loc 1 131 29
	movq	-176(%rbp), %rax
	movl	$-1, (%rax)
	.loc 1 134 5
	leaq	-128(%rbp), %rax
	movl	$48, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 135 21
	movl	$0, -124(%rbp)
	.loc 1 136 23
	movl	$1, -120(%rbp)
	.loc 1 138 21
	movq	-176(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 138 9
	movq	%rax, %rdi
	call	atoi@PLT
	.loc 1 138 8 discriminator 1
	cmpl	$1024, %eax
	jg	.L21
	.loc 1 140 9
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$67, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 141 9
	movl	$1, %edi
	call	exit@PLT
.L21:
	.loc 1 144 19
	movq	-168(%rbp), %rax
	leaq	40(%rax), %rcx
	.loc 1 144 58
	movq	-176(%rbp), %rax
	movq	8(%rax), %rsi
	.loc 1 144 38
	movq	-176(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 144 19
	leaq	-128(%rbp), %rdx
	movq	%rax, %rdi
	call	getaddrinfo@PLT
	movl	%eax, -156(%rbp)
	.loc 1 144 8 discriminator 1
	cmpl	$0, -156(%rbp)
	jns	.L22
	.loc 1 146 9
	movl	-156(%rbp), %eax
	movl	%eax, %edi
	call	gai_strerror@PLT
	movq	%rax, %rdx
	.loc 1 146 9 is_stmt 0 discriminator 1
	movq	stderr(%rip), %rax
	leaq	.LC1(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 147 16 is_stmt 1
	movl	$-1, -156(%rbp)
	.loc 1 148 9
	jmp	.L23
.L22:
	.loc 1 151 15
	movq	-168(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -152(%rbp)
	.loc 1 151 5
	nop
	.loc 1 151 43 discriminator 1
	cmpq	$0, -152(%rbp)
	je	.L27
	.loc 1 153 40
	movq	-152(%rbp), %rax
	movl	12(%rax), %edx
	movq	-152(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-152(%rbp), %rax
	movl	4(%rax), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	socket@PLT
	.loc 1 153 38 discriminator 1
	movq	-176(%rbp), %rdx
	movl	%eax, (%rdx)
	.loc 1 153 21 discriminator 1
	movq	-176(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 153 12 discriminator 1
	testl	%eax, %eax
	jns	.L25
	.loc 1 155 13
	movq	-176(%rbp), %rax
	movq	8(%rax), %rcx
	movq	-176(%rbp), %rax
	movq	16(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 156 20
	movl	$-1, -156(%rbp)
	.loc 1 157 13
	jmp	.L23
.L25:
	.loc 1 160 14
	movq	-152(%rbp), %rax
	movl	16(%rax), %edx
	.loc 1 160 51
	movq	-152(%rbp), %rax
	movq	24(%rax), %rax
	.loc 1 160 14
	movq	%rax, %rcx
	movq	-176(%rbp), %rax
	movl	(%rax), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	connect@PLT
	.loc 1 160 12 discriminator 1
	testl	%eax, %eax
	jns	.L32
	.loc 1 162 13
	movq	-176(%rbp), %rax
	movq	8(%rax), %rcx
	movq	-176(%rbp), %rax
	movq	16(%rax), %rdx
	movl	-180(%rbp), %eax
	leal	1(%rax), %esi
	movq	stderr(%rip), %rax
	movq	%rcx, %r8
	movq	%rdx, %rcx
	movl	%esi, %edx
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 163 87
	call	__errno_location@PLT
	.loc 1 163 13 discriminator 1
	movl	(%rax), %ebx
	.loc 1 163 79 discriminator 1
	call	__errno_location@PLT
	.loc 1 163 13 discriminator 2
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rdx
	.loc 1 163 13 is_stmt 0 discriminator 3
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 164 13 is_stmt 1
	movq	-176(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 165 20
	movl	$-1, -156(%rbp)
	.loc 1 166 13
	jmp	.L23
.L32:
	.loc 1 169 9
	nop
.L27:
	.loc 1 172 8
	cmpq	$0, -152(%rbp)
	jne	.L29
	.loc 1 174 140
	call	__errno_location@PLT
	.loc 1 174 9 discriminator 1
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	.loc 1 174 9 is_stmt 0 discriminator 2
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 175 16 is_stmt 1
	movl	$-1, -156(%rbp)
	.loc 1 176 9
	jmp	.L23
.L29:
	.loc 1 179 7
	movq	-168(%rbp), %rax
	movq	48(%rax), %rax
	.loc 1 179 24
	movl	-180(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	.loc 1 179 48
	movq	-176(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 179 39
	movl	%eax, (%rdx)
	.loc 1 180 7
	movq	-168(%rbp), %rax
	movl	60(%rax), %eax
	.loc 1 180 36
	leal	1(%rax), %edx
	movq	-168(%rbp), %rax
	movl	%edx, 60(%rax)
	.loc 1 183 32
	movq	-152(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	get_in_addr
	movq	%rax, %rsi
	.loc 1 183 5 discriminator 1
	movq	-152(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-80(%rbp), %rdx
	movl	$46, %ecx
	movl	%eax, %edi
	call	inet_ntop@PLT
	.loc 1 184 5
	movl	-180(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 185 5
	movq	-176(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-176(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 188 15
	movq	$1, -144(%rbp)
	.loc 1 189 16
	movq	$0, -136(%rbp)
	.loc 1 190 5
	movq	-176(%rbp), %rax
	movl	(%rax), %eax
	leaq	-144(%rbp), %rdx
	movl	$16, %r8d
	movq	%rdx, %rcx
	movl	$21, %edx
	movl	$1, %esi
	movl	%eax, %edi
	call	setsockopt@PLT
	.loc 1 191 5
	movq	-176(%rbp), %rax
	movl	(%rax), %eax
	leaq	-144(%rbp), %rdx
	movl	$16, %r8d
	movq	%rdx, %rcx
	movl	$20, %edx
	movl	$1, %esi
	movl	%eax, %edi
	call	setsockopt@PLT
.L23:
	.loc 1 197 5
	movq	-152(%rbp), %rax
	movq	%rax, %rdi
	call	freeaddrinfo@PLT
	.loc 1 198 12
	movl	-156(%rbp), %eax
	.loc 1 199 1
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L31
	call	__stack_chk_fail@PLT
.L31:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE324:
	.size	connect_server, .-connect_server
	.section	.rodata
	.align 8
.LC8:
	.string	"\033[36m\n[*] FILE DISTRIBUTION MAPPING\n\033[0m"
	.align 8
.LC9:
	.string	"\033[36m    File hash value: %d\n\033[0m"
	.align 8
.LC10:
	.string	"\033[36m    Starting server: %d\n\n\033[0m"
	.align 8
.LC11:
	.string	"\033[36m[*] CHUNK ASSIGNMENT: Server %d\n\033[0m"
.LC12:
	.string	"\033[36m    Storing chunks: \033[0m"
.LC13:
	.string	"\033[36m%d \033[0m"
	.align 8
.LC14:
	.string	"\033[31m[-] ERROR: Send operation failed (errno: %d - %s)\n\033[0m"
	.align 8
.LC15:
	.string	"\033[31m[-] ERROR: Receive operation failed (errno: %d - %s)\n\033[0m"
	.align 8
.LC16:
	.string	"\033[33m[-] NOTICE: Connection closed by client\n\033[0m"
.LC17:
	.string	"ack\t\n0\t\n"
	.string	""
	.align 8
.LC18:
	.string	"\033[31m[-] ERROR: Received NACK from server for chunk %d\n\033[0m"
	.align 8
.LC19:
	.string	"\033[32m[+] Stored chunk %d to server %d\n\033[0m"
	.align 8
.LC20:
	.string	"\033[31m\n=========================================\n\033[0m"
	.align 8
.LC21:
	.string	"\033[31m    PUT OPERATION FAILED\n\033[0m"
.LC22:
	.string	"\033[31m    File: %s\n\033[0m"
	.align 8
.LC23:
	.string	"\033[31m    Cannot store file reliably\n\033[0m"
	.align 8
.LC24:
	.string	"\033[31m    Missing redundancy for chunk %d\n\033[0m"
	.align 8
.LC25:
	.string	"\033[31m=========================================\n\n\033[0m"
	.align 8
.LC26:
	.string	"\033[32m\n=========================================\n\033[0m"
	.align 8
.LC27:
	.string	"\033[32m    FILE UPLOAD SUCCESSFUL\n\033[0m"
.LC28:
	.string	"\033[32m    File: %s\n\033[0m"
	.align 8
.LC29:
	.string	"\033[32m    All chunks stored with redundancy\n\033[0m"
	.align 8
.LC30:
	.string	"\033[32m=========================================\n\n\033[0m"
	.text
	.globl	connect_and_put_chunks
	.type	connect_and_put_chunks, @function
connect_and_put_chunks:
.LFB325:
	.loc 1 202 1
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
	subq	$2184, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -30840(%rbp)
	movq	%rsi, -30848(%rbp)
	movq	%rdx, -30856(%rbp)
	movl	%ecx, -30860(%rbp)
	.loc 1 202 1
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 1 204 5
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 205 5
	movl	-30860(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 206 62
	movq	-30840(%rbp), %rax
	movl	56(%rax), %ebx
	.loc 1 206 58
	movl	-30860(%rbp), %eax
	cltd
	idivl	%ebx
	movl	%edx, %ecx
	movl	%ecx, %eax
	.loc 1 206 5
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 208 22
	movq	-30840(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -30792(%rbp)
	.loc 1 209 9
	movl	$0, -30832(%rbp)
	.loc 1 210 36
	movq	-30840(%rbp), %rax
	movl	56(%rax), %eax
	cltq
	.loc 1 210 27
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	.loc 1 210 25 discriminator 1
	movq	-30840(%rbp), %rax
	movq	%rdx, 48(%rax)
	.loc 1 215 5
	leaq	-30768(%rbp), %rax
	movl	$16, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 217 11
	jmp	.L34
.L50:
.LBB4:
	.loc 1 219 13
	movl	-30832(%rbp), %edx
	movq	-30792(%rbp), %rcx
	movq	-30840(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	connect_server
	.loc 1 219 12 discriminator 1
	testl	%eax, %eax
	js	.L56
	.loc 1 222 26
	movl	-30832(%rbp), %eax
	subl	-30860(%rbp), %eax
	.loc 1 222 63
	testl	%eax, %eax
	jns	.L37
	.loc 1 222 63 is_stmt 0 discriminator 1
	movq	-30840(%rbp), %rax
	movl	56(%rax), %eax
	jmp	.L38
.L37:
	.loc 1 222 63 discriminator 2
	movl	-30832(%rbp), %eax
	subl	-30860(%rbp), %eax
.L38:
	.loc 1 222 13 is_stmt 1 discriminator 4
	movl	%eax, -30828(%rbp)
	.loc 1 224 9
	movl	-30832(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 225 9
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBB5:
	.loc 1 226 18
	movl	$0, -30824(%rbp)
	.loc 1 226 9
	jmp	.L39
.L40:
	.loc 1 228 42
	movl	-30828(%rbp), %edx
	movl	-30824(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	.loc 1 228 51
	movq	-30840(%rbp), %rax
	movl	56(%rax), %ebx
	.loc 1 228 47
	movl	%ecx, %eax
	cltd
	idivl	%ebx
	movl	%edx, %ecx
	movl	%ecx, %eax
	.loc 1 228 13
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 226 63 discriminator 3
	addl	$1, -30824(%rbp)
.L39:
	.loc 1 226 27 discriminator 1
	cmpl	$1, -30824(%rbp)
	jle	.L40
.LBE5:
	.loc 1 230 9
	movl	$10, %edi
	call	putchar@PLT
.LBB6:
	.loc 1 232 18
	movl	$0, -30820(%rbp)
	.loc 1 232 9
	jmp	.L41
.L49:
.LBB7:
	.loc 1 235 28
	movl	-30828(%rbp), %edx
	movl	-30820(%rbp), %eax
	addl	%eax, %edx
	.loc 1 235 37
	movq	-30840(%rbp), %rax
	movl	56(%rax), %ecx
	.loc 1 235 19
	movl	%edx, %eax
	cltd
	idivl	%ecx
	movl	%edx, -30828(%rbp)
	.loc 1 236 26
	movl	-30828(%rbp), %eax
	cltq
	movl	-30768(%rbp,%rax,4), %eax
	.loc 1 236 33
	leal	1(%rax), %edx
	movl	-30828(%rbp), %eax
	cltq
	movl	%edx, -30768(%rbp,%rax,4)
	.loc 1 238 30
	movb	$1, -30778(%rbp)
	movl	-30828(%rbp), %eax
	movb	%al, -30777(%rbp)
	.loc 1 241 45
	movq	-30840(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 241 36
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 238 30
	movl	%eax, -30776(%rbp)
	.loc 1 242 43
	movl	-30828(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-30856(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	.loc 1 238 30
	movl	%eax, -30772(%rbp)
.LBB8:
	.loc 1 244 24
	movq	-30792(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30778(%rbp), %rsi
	movl	$0, %ecx
	movl	$10, %edx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 244 24 is_stmt 0 discriminator 1
	movl	%eax, -30812(%rbp)
	cmpl	$0, -30812(%rbp)
	jg	.L42
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 244 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 244 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 244 24
	jmp	.L36
.L42:
	.loc 1 244 24 discriminator 2
	movl	-30812(%rbp), %eax
.LBE8:
	.loc 1 244 22 is_stmt 1 discriminator 2
	movl	%eax, -30808(%rbp)
.LBB9:
	.loc 1 246 24
	movl	-30776(%rbp), %eax
	movl	%eax, %edx
	movq	-30840(%rbp), %rax
	movq	16(%rax), %rsi
	movq	-30792(%rbp), %rax
	movl	(%rax), %eax
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 246 24 is_stmt 0 discriminator 1
	movl	%eax, -30804(%rbp)
	cmpl	$0, -30804(%rbp)
	jg	.L44
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 246 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 246 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 246 24
	jmp	.L36
.L44:
	.loc 1 246 24 discriminator 2
	movl	-30804(%rbp), %eax
.LBE9:
	.loc 1 246 22 is_stmt 1 discriminator 2
	movl	%eax, -30808(%rbp)
.LBB10:
	.loc 1 248 24
	movl	-30828(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-30856(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movslq	%eax, %rdx
	movl	-30828(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movq	-30848(%rbp), %rax
	addq	%rcx, %rax
	movq	(%rax), %rsi
	movq	-30792(%rbp), %rax
	movl	(%rax), %eax
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 248 24 is_stmt 0 discriminator 1
	movl	%eax, -30800(%rbp)
	cmpl	$0, -30800(%rbp)
	jg	.L45
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 248 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 248 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 248 24
	jmp	.L36
.L45:
	.loc 1 248 24 discriminator 2
	movl	-30800(%rbp), %eax
.LBE10:
	.loc 1 248 22 is_stmt 1 discriminator 2
	movl	%eax, -30808(%rbp)
	.loc 1 250 13
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.LBB11:
	.loc 1 251 24
	movq	-30792(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30752(%rbp), %rsi
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 251 24 is_stmt 0 discriminator 1
	movl	%eax, -30796(%rbp)
	cmpl	$0, -30796(%rbp)
	jns	.L46
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 251 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 251 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 251 24
	jmp	.L36
.L46:
	.loc 1 251 24 discriminator 2
	cmpl	$0, -30796(%rbp)
	jne	.L47
	.loc 1 251 24 discriminator 3
	movq	-30792(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 251 24 discriminator 1
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 251 24
	jmp	.L36
.L47:
	.loc 1 251 24 discriminator 4
	movl	-30796(%rbp), %eax
.LBE11:
	.loc 1 251 22 is_stmt 1 discriminator 4
	movl	%eax, -30808(%rbp)
	.loc 1 253 17
	leaq	-30752(%rbp), %rax
	movl	$7, %edx
	leaq	.LC17(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 253 16 discriminator 1
	testl	%eax, %eax
	je	.L48
	.loc 1 255 17
	movl	-30828(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 256 17
	jmp	.L36
.L48:
	.loc 1 259 17
	movl	-30832(%rbp), %eax
	leal	1(%rax), %edx
	movl	-30828(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBE7:
	.loc 1 232 63 discriminator 2
	addl	$1, -30820(%rbp)
.L41:
	.loc 1 232 27 discriminator 1
	cmpl	$1, -30820(%rbp)
	jle	.L49
.LBE6:
	.loc 1 265 5
	jmp	.L36
.L56:
	.loc 1 220 13
	nop
.L36:
	.loc 1 266 9
	movq	-30792(%rbp), %rax
	movq	%rax, %rdi
	call	cleanup_current_connection
	.loc 1 267 10
	addl	$1, -30832(%rbp)
	.loc 1 268 17
	movq	-30792(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -30792(%rbp)
.L34:
.LBE4:
	.loc 1 217 12
	cmpq	$0, -30792(%rbp)
	jne	.L50
.LBB12:
	.loc 1 271 14
	movl	$0, -30816(%rbp)
	.loc 1 271 5
	jmp	.L51
.L54:
	.loc 1 273 26
	movl	-30816(%rbp), %eax
	cltq
	movl	-30768(%rbp,%rax,4), %eax
	.loc 1 273 12
	testl	%eax, %eax
	jg	.L52
	.loc 1 275 13
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 276 13
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 277 13
	movq	-30840(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 278 13
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 279 13
	movl	-30816(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 280 13
	leaq	.LC25(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L33
.L52:
	.loc 1 271 43 discriminator 2
	addl	$1, -30816(%rbp)
.L51:
	.loc 1 271 23 discriminator 1
	cmpl	$3, -30816(%rbp)
	jle	.L54
.LBE12:
	.loc 1 285 5
	movq	-30840(%rbp), %rax
	movq	%rax, %rdi
	call	cleanup_connection
	.loc 1 288 5
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 289 5
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 290 5
	movq	-30840(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC28(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 291 5
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 292 5
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L33:
	.loc 1 293 1
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L55
	call	__stack_chk_fail@PLT
.L55:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE325:
	.size	connect_and_put_chunks, .-connect_and_put_chunks
	.section	.rodata
.LC31:
	.string	"rb"
	.align 8
.LC32:
	.string	"\033[31m[-] Error opening file %d \n\033[0m"
	.align 8
.LC33:
	.string	"\033[36m\n[*] FILE PREPARATION\n\033[0m"
.LC34:
	.string	"\033[36m    Filename: %s\n\033[0m"
	.align 8
.LC35:
	.string	"\033[36m    Total size: %d bytes\n\033[0m"
	.align 8
.LC36:
	.string	"\033[36m    Chunking into %d parts\n\n\033[0m"
	.align 8
.LC37:
	.string	"\033[36m[*] CHUNK CREATED: %d of %d\n\033[0m"
.LC38:
	.string	"\033[36m    Size: %d bytes\n\n\033[0m"
	.text
	.globl	put_file
	.type	put_file, @function
put_file:
.LFB326:
	.loc 1 298 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movq	%rdi, -120(%rbp)
	.loc 1 298 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 299 24
	movq	-120(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 299 16
	leaq	.LC31(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -80(%rbp)
	.loc 1 300 8
	cmpq	$0, -80(%rbp)
	jne	.L58
	.loc 1 302 67
	call	__errno_location@PLT
	.loc 1 302 9 discriminator 1
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC32(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	jmp	.L57
.L58:
	.loc 1 305 52
	movq	-120(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 305 43
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 305 21 discriminator 1
	movl	%eax, %edx
	movq	-120(%rbp), %rax
	movq	16(%rax), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	str2md5
	movl	%eax, -88(%rbp)
	.loc 1 307 5
	movq	-80(%rbp), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseek@PLT
	.loc 1 308 16
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	ftell@PLT
	.loc 1 308 9 discriminator 1
	movl	%eax, -84(%rbp)
	.loc 1 309 5
	movq	-80(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseek@PLT
	.loc 1 313 9
	movl	$0, -100(%rbp)
	.loc 1 315 5
	leaq	.LC33(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 316 5
	movq	-120(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC34(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 317 5
	movl	-84(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC35(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 318 5
	movl	$4, %esi
	leaq	.LC36(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBB13:
	.loc 1 320 14
	movl	$0, -96(%rbp)
	.loc 1 320 5
	jmp	.L60
.L63:
.LBB14:
	.loc 1 323 12
	cmpl	$3, -96(%rbp)
	jne	.L61
	.loc 1 324 24
	movl	-84(%rbp), %eax
	subl	-100(%rbp), %eax
	movl	%eax, -92(%rbp)
	jmp	.L62
.L61:
	.loc 1 326 24
	movl	-84(%rbp), %eax
	leal	3(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$2, %eax
	movl	%eax, -92(%rbp)
.L62:
	.loc 1 327 36
	movl	-92(%rbp), %eax
	addl	%eax, -100(%rbp)
	.loc 1 329 24
	movl	-96(%rbp), %eax
	cltq
	movl	-92(%rbp), %edx
	movl	%edx, -64(%rbp,%rax,4)
	.loc 1 331 23
	movl	-92(%rbp), %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -72(%rbp)
	.loc 1 332 19
	movl	-96(%rbp), %eax
	cltq
	movq	-72(%rbp), %rdx
	movq	%rdx, -48(%rbp,%rax,8)
	.loc 1 333 9
	movl	-92(%rbp), %eax
	movslq	%eax, %rdx
	movq	-80(%rbp), %rcx
	movq	-72(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	fread@PLT
	.loc 1 335 9
	movl	-96(%rbp), %eax
	addl	$1, %eax
	movl	$4, %edx
	movl	%eax, %esi
	leaq	.LC37(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 336 9
	movl	-92(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC38(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBE14:
	.loc 1 320 43 discriminator 2
	addl	$1, -96(%rbp)
.L60:
	.loc 1 320 23 discriminator 1
	cmpl	$3, -96(%rbp)
	jle	.L63
.LBE13:
	.loc 1 340 62
	movq	-120(%rbp), %rax
	movl	56(%rax), %eax
	movl	%eax, %ecx
	.loc 1 340 58
	movl	-88(%rbp), %eax
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	.loc 1 340 5
	movl	%eax, %ecx
	leaq	-64(%rbp), %rdx
	leaq	-48(%rbp), %rsi
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	connect_and_put_chunks
.L57:
	.loc 1 341 1
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L64
	call	__stack_chk_fail@PLT
.L64:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE326:
	.size	put_file, .-put_file
	.section	.rodata
	.align 8
.LC39:
	.string	"\033[32m[+] CONNECTION ESTABLISHED: Server %d is online\n\033[0m"
	.align 8
.LC40:
	.string	"\033[36m[*] REQUESTING CHUNKS: Server %d should have chunks \033[0m"
.LC41:
	.string	"%d "
	.align 8
.LC42:
	.string	"\033[33m    [!] Skipping chunk %d (already downloaded)\n\033[0m"
	.align 8
.LC43:
	.string	"\033[36m    [*] Requesting chunk %d from server %d\n\033[0m"
.LC44:
	.string	"Raw header bytes: (send)"
.LC45:
	.string	"%02x "
	.align 8
.LC46:
	.string	"\033[31m    [-] Server %d does not have chunk %d\n\033[0m"
	.align 8
.LC47:
	.string	"\033[32m    [+] Server has chunk %d, downloading...\n\033[0m"
.LC48:
	.string	"message_header recieved %d \n"
.LC49:
	.string	"Raw header bytes: (recv)"
	.align 8
.LC50:
	.string	"\033[36m    [*] Chunk %d size: %d bytes\n\033[0m"
	.align 8
.LC51:
	.string	"\033[31m    [-] ERROR: Memory allocation failed for chunk %d\n\033[0m"
	.align 8
.LC53:
	.string	"\033[36m    [*] Downloaded %d/%d bytes (%.1f%%)\n\033[0m"
	.align 8
.LC54:
	.string	"\033[32m    [+] CHUNK %d DOWNLOADED SUCCESSFULLY (%d bytes)\n\033[0m"
	.align 8
.LC55:
	.string	"\033[31m    [-] ERROR: Failed to download chunk %d\n\033[0m"
	.align 8
.LC56:
	.string	"\033[36m\n=========================================\n\033[0m"
	.align 8
.LC57:
	.string	"\033[36m    DOWNLOAD SUMMARY: %s\n\033[0m"
	.align 8
.LC58:
	.string	"\033[36m=========================================\n\n\033[0m"
	.align 8
.LC59:
	.string	"Server status: %d/%d available\n"
	.align 8
.LC60:
	.string	"Chunks status: %d/%d downloaded\n\n"
.LC61:
	.string	"Chunk breakdown:"
	.align 8
.LC62:
	.string	"\033[32m  [\342\234\223] Chunk %d: %d bytes\n\033[0m"
	.align 8
.LC63:
	.string	"\033[31m  [\342\234\227] Chunk %d: MISSING\n\033[0m"
	.align 8
.LC64:
	.string	"\033[31m[!] CANNOT RECONSTRUCT: Missing chunk %d\n\033[0m"
	.align 8
.LC65:
	.string	"\033[31m    DOWNLOAD FAILED: %s\n\033[0m"
	.align 8
.LC66:
	.string	"\033[31m    Reason: Missing chunks prevent reconstruction\n\033[0m"
	.align 8
.LC67:
	.string	"\033[31m    Required: %d/%d chunks\n\033[0m"
	.align 8
.LC68:
	.string	"\033[31m    Available: %d/%d chunks\n\033[0m"
	.align 8
.LC69:
	.string	"\033[36m[*] REASSEMBLING FILE: All chunks available\n\033[0m"
.LC70:
	.string	"./download"
.LC71:
	.string	"%s/%s"
.LC72:
	.string	"wb"
	.align 8
.LC73:
	.string	"\033[31m[-] ERROR: Could not create output file: %s\n\033[0m"
	.align 8
.LC74:
	.string	"\033[36m    [*] Writing chunk %d (%d bytes)\n\033[0m"
	.align 8
.LC75:
	.string	"\033[32m    DOWNLOAD SUCCESSFUL: %s\n\033[0m"
	.align 8
.LC76:
	.string	"\033[32m    Total file size: %d bytes\n\033[0m"
	.align 8
.LC77:
	.string	"\033[32m    All %d chunks retrieved and reassembled\n\033[0m"
	.text
	.globl	get_file
	.type	get_file, @function
get_file:
.LFB327:
	.loc 1 344 1
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
	subq	$2312, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -30984(%rbp)
	.loc 1 344 1
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 1 348 47
	movq	-30984(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 348 38
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 348 16 discriminator 1
	movl	%eax, %edx
	movq	-30984(%rbp), %rax
	movq	16(%rax), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	str2md5
	.loc 1 348 64 discriminator 2
	movq	-30984(%rbp), %rdx
	movl	56(%rdx), %edx
	movl	%edx, %ecx
	.loc 1 348 60 discriminator 2
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	.loc 1 348 9 discriminator 2
	movl	%eax, -30892(%rbp)
	.loc 1 350 9
	movl	$0, -30964(%rbp)
	.loc 1 350 16
	movl	$0, -30888(%rbp)
	.loc 1 351 22
	movq	-30984(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -30856(%rbp)
	.loc 1 352 36
	movq	-30984(%rbp), %rax
	movl	56(%rax), %eax
	cltq
	.loc 1 352 27
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	.loc 1 352 25 discriminator 1
	movq	-30984(%rbp), %rax
	movq	%rdx, 48(%rax)
	.loc 1 359 9
	movl	$0, -30960(%rbp)
	.loc 1 362 5
	leaq	-30784(%rbp), %rax
	movl	$32, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 363 5
	leaq	-30816(%rbp), %rax
	movl	$16, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 364 5
	leaq	-30800(%rbp), %rax
	movl	$16, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 367 9
	movl	$0, -30956(%rbp)
	.loc 1 368 9
	movl	$0, -30952(%rbp)
	.loc 1 372 11
	jmp	.L66
.L101:
.LBB15:
	.loc 1 374 26
	addl	$1, -30956(%rbp)
	.loc 1 376 13
	movl	-30964(%rbp), %edx
	movq	-30856(%rbp), %rcx
	movq	-30984(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	connect_server
	.loc 1 376 12 discriminator 1
	testl	%eax, %eax
	js	.L126
	.loc 1 380 26
	addl	$1, -30952(%rbp)
	.loc 1 381 9
	movl	-30964(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC39(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 384 26
	movl	-30964(%rbp), %eax
	subl	-30892(%rbp), %eax
	.loc 1 384 63
	testl	%eax, %eax
	jns	.L69
	.loc 1 384 63 is_stmt 0 discriminator 1
	movq	-30984(%rbp), %rax
	movl	56(%rax), %eax
	jmp	.L70
.L69:
	.loc 1 384 63 discriminator 2
	movl	-30964(%rbp), %eax
	subl	-30892(%rbp), %eax
.L70:
	.loc 1 384 13 is_stmt 1 discriminator 4
	movl	%eax, -30948(%rbp)
	.loc 1 386 9
	movl	-30964(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC40(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBB16:
	.loc 1 387 18
	movl	$0, -30944(%rbp)
	.loc 1 387 9
	jmp	.L71
.L72:
	.loc 1 388 34
	movl	-30948(%rbp), %edx
	movl	-30944(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	.loc 1 388 43
	movq	-30984(%rbp), %rax
	movl	56(%rax), %ebx
	.loc 1 388 39
	movl	%ecx, %eax
	cltd
	idivl	%ebx
	movl	%edx, %ecx
	movl	%ecx, %eax
	.loc 1 388 13
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC41(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 387 63 discriminator 3
	addl	$1, -30944(%rbp)
.L71:
	.loc 1 387 27 discriminator 1
	cmpl	$1, -30944(%rbp)
	jle	.L72
.LBE16:
	.loc 1 390 9
	movl	$10, %edi
	call	putchar@PLT
.LBB17:
	.loc 1 395 18
	movl	$0, -30940(%rbp)
	.loc 1 395 9
	jmp	.L73
.L99:
.LBB18:
	.loc 1 397 28
	movl	-30948(%rbp), %edx
	movl	-30940(%rbp), %eax
	addl	%eax, %edx
	.loc 1 397 37
	movq	-30984(%rbp), %rax
	movl	56(%rax), %ecx
	.loc 1 397 19
	movl	%edx, %eax
	cltd
	idivl	%ecx
	movl	%edx, -30948(%rbp)
	.loc 1 400 30
	movl	-30948(%rbp), %eax
	cltq
	movl	-30816(%rbp,%rax,4), %eax
	.loc 1 400 16
	testl	%eax, %eax
	jle	.L74
	.loc 1 401 17
	movl	-30948(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC42(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 402 17
	jmp	.L98
.L74:
	.loc 1 405 13
	movl	-30964(%rbp), %eax
	leal	1(%rax), %edx
	movl	-30948(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC43(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 408 30
	movb	$0, -30832(%rbp)
	movl	-30948(%rbp), %eax
	movb	%al, -30831(%rbp)
	.loc 1 411 45
	movq	-30984(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 411 36
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 408 30
	movl	%eax, -30830(%rbp)
	movl	$0, -30826(%rbp)
	.loc 1 415 13
	leaq	.LC44(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 416 28
	leaq	-30832(%rbp), %rax
	movq	%rax, -30848(%rbp)
.LBB19:
	.loc 1 417 22
	movl	$0, -30936(%rbp)
	.loc 1 417 13
	jmp	.L76
.L77:
	.loc 1 418 38
	movl	-30936(%rbp), %eax
	movslq	%eax, %rdx
	movq	-30848(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	.loc 1 418 17
	movzbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC45(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 417 60 discriminator 3
	addl	$1, -30936(%rbp)
.L76:
	.loc 1 417 31 discriminator 1
	movl	-30936(%rbp), %eax
	cmpl	$9, %eax
	jbe	.L77
.LBE19:
	.loc 1 420 13
	movl	$10, %edi
	call	putchar@PLT
.LBB20:
	.loc 1 422 24
	movq	-30856(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30832(%rbp), %rsi
	movl	$0, %ecx
	movl	$10, %edx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 422 24 is_stmt 0 discriminator 1
	movl	%eax, -30884(%rbp)
	cmpl	$0, -30884(%rbp)
	jg	.L78
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 422 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 422 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 422 24
	jmp	.L68
.L78:
	.loc 1 422 24 discriminator 2
	movl	-30884(%rbp), %eax
.LBE20:
	.loc 1 422 22 is_stmt 1 discriminator 2
	movl	%eax, -30888(%rbp)
.LBB21:
	.loc 1 423 24
	movq	-30984(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	.loc 1 423 24 is_stmt 0 discriminator 1
	movq	-30984(%rbp), %rax
	movq	16(%rax), %rsi
	movq	-30856(%rbp), %rax
	movl	(%rax), %eax
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 423 24 discriminator 2
	movl	%eax, -30880(%rbp)
	cmpl	$0, -30880(%rbp)
	jg	.L80
	.loc 1 423 24 discriminator 1
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 423 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 423 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 423 24
	jmp	.L68
.L80:
	.loc 1 423 24 discriminator 2
	movl	-30880(%rbp), %eax
.LBE21:
	.loc 1 423 22 is_stmt 1 discriminator 2
	movl	%eax, -30888(%rbp)
.LBB22:
	.loc 1 426 24
	movq	-30856(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30752(%rbp), %rsi
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 426 24 is_stmt 0 discriminator 1
	movl	%eax, -30876(%rbp)
	cmpl	$0, -30876(%rbp)
	jns	.L81
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 426 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 426 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 426 24
	jmp	.L68
.L81:
	.loc 1 426 24 discriminator 2
	cmpl	$0, -30876(%rbp)
	jne	.L82
	.loc 1 426 24 discriminator 3
	movq	-30856(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 426 24 discriminator 1
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 426 24
	jmp	.L68
.L82:
	.loc 1 426 24 discriminator 4
	movl	-30876(%rbp), %eax
.LBE22:
	.loc 1 426 22 is_stmt 1 discriminator 4
	movl	%eax, -30888(%rbp)
	.loc 1 428 17
	leaq	-30752(%rbp), %rax
	movl	$7, %edx
	leaq	.LC17(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 428 16 discriminator 1
	testl	%eax, %eax
	je	.L83
	.loc 1 430 17
	movl	-30948(%rbp), %eax
	leal	1(%rax), %edx
	movl	-30964(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC46(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 431 17
	jmp	.L98
.L83:
	.loc 1 434 13
	movl	-30948(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC47(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBB23:
	.loc 1 437 24
	movq	-30856(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30832(%rbp), %rsi
	movl	$0, %ecx
	movl	$10, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 437 24 is_stmt 0 discriminator 1
	movl	%eax, -30872(%rbp)
	cmpl	$0, -30872(%rbp)
	jns	.L84
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 437 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 437 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 437 24
	jmp	.L85
.L84:
	.loc 1 437 24 discriminator 2
	cmpl	$0, -30872(%rbp)
	jne	.L86
	.loc 1 437 24 discriminator 3
	movq	-30856(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 437 24 discriminator 1
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 437 24
	jmp	.L85
.L86:
	.loc 1 437 24 discriminator 4
	movl	-30872(%rbp), %eax
.LBE23:
	.loc 1 437 22 is_stmt 1 discriminator 4
	movl	%eax, -30888(%rbp)
	.loc 1 438 13
	movl	-30888(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC48(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 439 13
	leaq	.LC49(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 440 19
	leaq	-30832(%rbp), %rax
	movq	%rax, -30848(%rbp)
.LBB24:
	.loc 1 441 22
	movl	$0, -30932(%rbp)
	.loc 1 441 13
	jmp	.L87
.L88:
	.loc 1 442 38
	movl	-30932(%rbp), %eax
	movslq	%eax, %rdx
	movq	-30848(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	.loc 1 442 17
	movzbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC45(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 441 60 discriminator 3
	addl	$1, -30932(%rbp)
.L87:
	.loc 1 441 31 discriminator 1
	movl	-30932(%rbp), %eax
	cmpl	$9, %eax
	jbe	.L88
.LBE24:
	.loc 1 444 13
	movl	$10, %edi
	call	putchar@PLT
	.loc 1 446 43
	movl	-30826(%rbp), %eax
	.loc 1 446 17
	movl	%eax, -30868(%rbp)
	.loc 1 447 81
	movzbl	-30831(%rbp), %eax
	movzbl	%al, %eax
	.loc 1 447 13
	leal	1(%rax), %ecx
	movl	-30868(%rbp), %eax
	movl	%eax, %edx
	movl	%ecx, %esi
	leaq	.LC50(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 450 29
	movl	-30868(%rbp), %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	.loc 1 450 27 discriminator 1
	movl	-30948(%rbp), %eax
	cltq
	movq	%rdx, -30784(%rbp,%rax,8)
	.loc 1 451 23
	movl	-30948(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rax
	.loc 1 451 16
	testq	%rax, %rax
	jne	.L89
	.loc 1 452 17
	movl	-30948(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC51(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L65
.L89:
	.loc 1 457 17
	movl	$0, -30928(%rbp)
	.loc 1 458 19
	jmp	.L91
.L95:
	.loc 1 460 17
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.LBB25:
	.loc 1 461 28
	movq	-30856(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30752(%rbp), %rsi
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 461 28 is_stmt 0 discriminator 1
	movl	%eax, -30860(%rbp)
	cmpl	$0, -30860(%rbp)
	jns	.L92
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 461 28 discriminator 2
	call	__errno_location@PLT
	.loc 1 461 28 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 461 28
	jmp	.L85
.L92:
	.loc 1 461 28 discriminator 2
	cmpl	$0, -30860(%rbp)
	jne	.L93
	.loc 1 461 28 discriminator 3
	movq	-30856(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 461 28 discriminator 1
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 461 28
	jmp	.L85
.L93:
	.loc 1 461 28 discriminator 4
	movl	-30860(%rbp), %eax
.LBE25:
	.loc 1 461 26 is_stmt 1 discriminator 4
	movl	%eax, -30888(%rbp)
	.loc 1 462 17
	movl	-30888(%rbp), %eax
	movslq	%eax, %rdx
	.loc 1 462 31
	movl	-30948(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rcx
	.loc 1 462 17
	movl	-30928(%rbp), %eax
	cltq
	.loc 1 462 24
	addq	%rax, %rcx
	.loc 1 462 17
	leaq	-30752(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	memcpy@PLT
	.loc 1 463 29
	movl	-30888(%rbp), %eax
	addl	%eax, -30928(%rbp)
	.loc 1 466 20
	cmpl	$10000, -30868(%rbp)
	jle	.L91
	.loc 1 466 54 discriminator 1
	movl	-30928(%rbp), %edx
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
	.loc 1 466 39 discriminator 1
	testl	%eax, %eax
	jne	.L91
	.loc 1 468 52
	pxor	%xmm0, %xmm0
	cvtsi2ssl	-30928(%rbp), %xmm0
	.loc 1 468 70
	pxor	%xmm2, %xmm2
	cvtsi2ssl	-30868(%rbp), %xmm2
	movaps	%xmm0, %xmm1
	divss	%xmm2, %xmm1
	.loc 1 468 80
	movss	.LC52(%rip), %xmm0
	mulss	%xmm1, %xmm0
	.loc 1 467 21
	pxor	%xmm3, %xmm3
	cvtss2sd	%xmm0, %xmm3
	movq	%xmm3, %rcx
	movl	-30868(%rbp), %edx
	movl	-30928(%rbp), %eax
	movq	%rcx, %xmm0
	movl	%eax, %esi
	leaq	.LC53(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
.L91:
	.loc 1 458 32
	movl	-30928(%rbp), %eax
	cmpl	-30868(%rbp), %eax
	jl	.L95
.LBB26:
	.loc 1 473 24
	movq	-30856(%rbp), %rax
	movl	(%rax), %eax
	movl	$0, %ecx
	movl	$7, %edx
	leaq	.LC17(%rip), %rsi
	movl	%eax, %edi
	call	send@PLT
	.loc 1 473 24 is_stmt 0 discriminator 1
	movl	%eax, -30864(%rbp)
	cmpl	$0, -30864(%rbp)
	jg	.L96
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 473 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 473 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 473 24
	jmp	.L85
.L96:
	.loc 1 473 24 discriminator 2
	movl	-30864(%rbp), %eax
.LBE26:
	.loc 1 473 22 is_stmt 1 discriminator 2
	movl	%eax, -30888(%rbp)
	.loc 1 476 34
	movl	-30948(%rbp), %eax
	cltq
	movl	$1, -30816(%rbp,%rax,4)
	.loc 1 477 40
	movl	-30948(%rbp), %eax
	cltq
	movl	-30868(%rbp), %edx
	movl	%edx, -30800(%rbp,%rax,4)
	.loc 1 478 36
	addl	$1, -30960(%rbp)
	.loc 1 480 13
	movl	-30948(%rbp), %eax
	leal	1(%rax), %ecx
	movl	-30868(%rbp), %eax
	movl	%eax, %edx
	movl	%ecx, %esi
	leaq	.LC54(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 482 13
	jmp	.L98
.L85:
	.loc 1 485 13
	movl	-30948(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC55(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 486 23
	movl	-30948(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rax
	.loc 1 486 16
	testq	%rax, %rax
	je	.L98
	.loc 1 487 28
	movl	-30948(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rax
	.loc 1 487 17
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 488 31
	movl	-30948(%rbp), %eax
	cltq
	movq	$0, -30784(%rbp,%rax,8)
.L98:
.LBE18:
	.loc 1 395 63 discriminator 2
	addl	$1, -30940(%rbp)
.L73:
	.loc 1 395 27 discriminator 1
	cmpl	$1, -30940(%rbp)
	jle	.L99
.LBE17:
	.loc 1 492 5
	jmp	.L68
.L126:
	.loc 1 377 13
	nop
.L68:
	.loc 1 493 9
	movq	-30856(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 494 17
	movq	-30856(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -30856(%rbp)
	.loc 1 495 10
	addl	$1, -30964(%rbp)
.L66:
.LBE15:
	.loc 1 372 20
	cmpq	$0, -30856(%rbp)
	je	.L100
	.loc 1 372 20 is_stmt 0 discriminator 1
	cmpl	$4, -30960(%rbp)
	jle	.L101
.L100:
	.loc 1 499 5 is_stmt 1
	leaq	.LC56(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 500 5
	movq	-30984(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC57(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 501 5
	leaq	.LC58(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 503 5
	movl	-30956(%rbp), %edx
	movl	-30952(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC59(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 504 5
	movl	-30960(%rbp), %eax
	movl	$4, %edx
	movl	%eax, %esi
	leaq	.LC60(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 507 5
	leaq	.LC61(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.LBB27:
	.loc 1 508 14
	movl	$0, -30924(%rbp)
	.loc 1 508 5
	jmp	.L102
.L105:
	.loc 1 510 26
	movl	-30924(%rbp), %eax
	cltq
	movl	-30816(%rbp,%rax,4), %eax
	.loc 1 510 12
	testl	%eax, %eax
	jle	.L103
	.loc 1 511 13
	movl	-30924(%rbp), %eax
	cltq
	movl	-30800(%rbp,%rax,4), %eax
	movl	-30924(%rbp), %edx
	leal	1(%rdx), %ecx
	movl	%eax, %edx
	movl	%ecx, %esi
	leaq	.LC62(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L104
.L103:
	.loc 1 513 13
	movl	-30924(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC63(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L104:
	.loc 1 508 43 discriminator 2
	addl	$1, -30924(%rbp)
.L102:
	.loc 1 508 23 discriminator 1
	cmpl	$3, -30924(%rbp)
	jle	.L105
.LBE27:
	.loc 1 516 5
	movl	$10, %edi
	call	putchar@PLT
	.loc 1 519 9
	movl	$1, -30920(%rbp)
.LBB28:
	.loc 1 520 14
	movl	$0, -30916(%rbp)
	.loc 1 520 5
	jmp	.L106
.L109:
	.loc 1 522 19
	movl	-30916(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rax
	.loc 1 522 12
	testq	%rax, %rax
	je	.L107
	.loc 1 522 53 discriminator 1
	movl	-30916(%rbp), %eax
	cltq
	movl	-30800(%rbp,%rax,4), %eax
	.loc 1 522 31 discriminator 1
	testl	%eax, %eax
	jle	.L107
	.loc 1 522 78 discriminator 2
	movl	-30916(%rbp), %eax
	cltq
	movl	-30816(%rbp,%rax,4), %eax
	.loc 1 522 62 discriminator 2
	testl	%eax, %eax
	jg	.L108
.L107:
	.loc 1 524 25
	movl	$0, -30920(%rbp)
	.loc 1 525 13
	movl	-30916(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC64(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L108:
	.loc 1 520 43 discriminator 2
	addl	$1, -30916(%rbp)
.L106:
	.loc 1 520 23 discriminator 1
	cmpl	$3, -30916(%rbp)
	jle	.L109
.LBE28:
	.loc 1 529 8
	cmpl	$0, -30920(%rbp)
	jne	.L110
	.loc 1 531 9
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 532 9
	movq	-30984(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC65(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 533 9
	leaq	.LC66(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 534 9
	movl	$4, %edx
	movl	$4, %esi
	leaq	.LC67(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 535 9
	movl	-30960(%rbp), %eax
	movl	$4, %edx
	movl	%eax, %esi
	leaq	.LC68(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 536 9
	leaq	.LC25(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBB29:
	.loc 1 539 18
	movl	$0, -30912(%rbp)
	.loc 1 539 9
	jmp	.L111
.L113:
	.loc 1 540 23
	movl	-30912(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rax
	.loc 1 540 16
	testq	%rax, %rax
	je	.L112
	.loc 1 540 47 discriminator 1
	movl	-30912(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rax
	.loc 1 540 36 discriminator 1
	movq	%rax, %rdi
	call	free@PLT
.L112:
	.loc 1 539 47 discriminator 2
	addl	$1, -30912(%rbp)
.L111:
	.loc 1 539 27 discriminator 1
	cmpl	$3, -30912(%rbp)
	jle	.L113
.LBE29:
	.loc 1 543 16
	movq	-30984(%rbp), %rax
	movq	48(%rax), %rax
	.loc 1 543 9
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 544 9
	jmp	.L65
.L110:
	.loc 1 548 5
	leaq	.LC69(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 551 11
	movq	-30984(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 551 8
	movzbl	(%rax), %eax
	.loc 1 551 7
	cmpb	$46, %al
	jne	.L114
	.loc 1 552 64
	movq	-30984(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 552 9
	leaq	2(%rax), %rdx
	leaq	-30832(%rbp), %rax
	movq	%rdx, %rcx
	leaq	.LC70(%rip), %rdx
	leaq	.LC71(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	jmp	.L115
.L114:
	.loc 1 554 9
	movq	-30984(%rbp), %rax
	movq	16(%rax), %rdx
	leaq	-30832(%rbp), %rax
	movq	%rdx, %rcx
	leaq	.LC70(%rip), %rdx
	leaq	.LC71(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
.L115:
	.loc 1 556 16
	movq	-30832(%rbp), %rax
	leaq	.LC72(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -30840(%rbp)
	.loc 1 557 8
	cmpq	$0, -30840(%rbp)
	jne	.L116
	.loc 1 558 9
	movq	-30984(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC73(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBB30:
	.loc 1 561 18
	movl	$0, -30908(%rbp)
	.loc 1 561 9
	jmp	.L117
.L119:
	.loc 1 562 23
	movl	-30908(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rax
	.loc 1 562 16
	testq	%rax, %rax
	je	.L118
	.loc 1 562 47 discriminator 1
	movl	-30908(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rax
	.loc 1 562 36 discriminator 1
	movq	%rax, %rdi
	call	free@PLT
.L118:
	.loc 1 561 47 discriminator 2
	addl	$1, -30908(%rbp)
.L117:
	.loc 1 561 27 discriminator 1
	cmpl	$3, -30908(%rbp)
	jle	.L119
.LBE30:
	.loc 1 565 16
	movq	-30984(%rbp), %rax
	movq	48(%rax), %rax
	.loc 1 565 9
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 566 9
	jmp	.L65
.L116:
	.loc 1 568 5
	movq	-30832(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 571 9
	movl	$0, -30904(%rbp)
.LBB31:
	.loc 1 572 14
	movl	$0, -30900(%rbp)
	.loc 1 572 5
	jmp	.L120
.L121:
	.loc 1 573 47
	movl	-30900(%rbp), %eax
	cltq
	movl	-30800(%rbp,%rax,4), %eax
	.loc 1 573 25
	addl	%eax, -30904(%rbp)
	.loc 1 572 43 discriminator 3
	addl	$1, -30900(%rbp)
.L120:
	.loc 1 572 23 discriminator 1
	cmpl	$3, -30900(%rbp)
	jle	.L121
.LBE31:
.LBB32:
	.loc 1 577 14
	movl	$0, -30896(%rbp)
	.loc 1 577 5
	jmp	.L122
.L123:
	.loc 1 579 9
	movl	-30896(%rbp), %eax
	cltq
	movl	-30800(%rbp,%rax,4), %eax
	movl	-30896(%rbp), %edx
	leal	1(%rdx), %ecx
	movl	%eax, %edx
	movl	%ecx, %esi
	leaq	.LC74(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 580 46
	movl	-30896(%rbp), %eax
	cltq
	movl	-30800(%rbp,%rax,4), %eax
	.loc 1 580 9
	movslq	%eax, %rsi
	.loc 1 580 22
	movl	-30896(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rax
	.loc 1 580 9
	movq	-30840(%rbp), %rdx
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 581 20
	movl	-30896(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rax
	.loc 1 581 9
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 577 43 discriminator 3
	addl	$1, -30896(%rbp)
.L122:
	.loc 1 577 23 discriminator 1
	cmpl	$3, -30896(%rbp)
	jle	.L123
.LBE32:
	.loc 1 583 5
	movq	-30840(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	.loc 1 585 5
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 586 5
	movq	-30984(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC75(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 587 5
	movl	-30904(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC76(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 588 5
	movl	$4, %esi
	leaq	.LC77(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 589 5
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 591 12
	movq	-30984(%rbp), %rax
	movq	48(%rax), %rax
	.loc 1 591 5
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 592 25
	movq	-30984(%rbp), %rax
	movq	$0, 48(%rax)
.L65:
	.loc 1 593 1
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L125
	call	__stack_chk_fail@PLT
.L125:
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
	.loc 1 598 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	.loc 1 600 36
	movq	-40(%rbp), %rax
	movl	$95, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	movq	%rax, -32(%rbp)
	.loc 1 601 8
	cmpq	$0, -32(%rbp)
	jne	.L128
	.loc 1 603 16
	movl	$0, %eax
	jmp	.L129
.L128:
	.loc 1 607 21
	addq	$1, -32(%rbp)
	.loc 1 610 35
	movq	-32(%rbp), %rax
	movl	$95, %esi
	movq	%rax, %rdi
	call	strrchr@PLT
	movq	%rax, -24(%rbp)
	.loc 1 611 8
	cmpq	$0, -24(%rbp)
	jne	.L130
	.loc 1 613 16
	movl	$0, %eax
	jmp	.L129
.L130:
	.loc 1 617 43
	movq	-24(%rbp), %rax
	subq	-32(%rbp), %rax
	.loc 1 617 12
	movq	%rax, -16(%rbp)
	.loc 1 620 31
	movq	-16(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	.loc 1 621 8
	cmpq	$0, -8(%rbp)
	jne	.L131
	.loc 1 623 16
	movl	$0, %eax
	jmp	.L129
.L131:
	.loc 1 627 5
	movq	-16(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	.loc 1 628 22
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 628 37
	movb	$0, (%rax)
	.loc 1 630 12
	movq	-8(%rbp), %rax
.L129:
	.loc 1 631 1
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
	.loc 1 635 1
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
	.loc 1 637 33
	movq	-40(%rbp), %rax
	movl	$47, %esi
	movq	%rax, %rdi
	call	strrchr@PLT
	movq	%rax, -24(%rbp)
	.loc 1 638 8
	cmpq	$0, -24(%rbp)
	je	.L133
	.loc 1 640 22
	addq	$1, -24(%rbp)
	jmp	.L134
.L133:
	.loc 1 644 23
	movq	-40(%rbp), %rax
	movq	%rax, -24(%rbp)
.L134:
	.loc 1 648 35
	movq	-24(%rbp), %rax
	movl	$95, %esi
	movq	%rax, %rdi
	call	strrchr@PLT
	movq	%rax, -16(%rbp)
	.loc 1 649 8
	cmpq	$0, -16(%rbp)
	jne	.L135
	.loc 1 651 16
	movl	$-1, %eax
	jmp	.L136
.L135:
	.loc 1 655 17
	movq	-16(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rdi
	call	atoi@PLT
	.loc 1 655 15 discriminator 1
	movq	-56(%rbp), %rdx
	movl	%eax, (%rdx)
	.loc 1 658 43
	movq	-16(%rbp), %rax
	subq	-24(%rbp), %rax
	.loc 1 658 12
	movq	%rax, -8(%rbp)
	.loc 1 661 26
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	.loc 1 661 24 discriminator 1
	movq	-48(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 662 9
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 662 8
	testq	%rax, %rax
	jne	.L137
	.loc 1 664 16
	movl	$-1, %eax
	jmp	.L136
.L137:
	.loc 1 668 5
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	-24(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	.loc 1 669 6
	movq	-48(%rbp), %rax
	movq	(%rax), %rdx
	.loc 1 669 25
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 669 40
	movb	$0, (%rax)
	.loc 1 671 12
	movl	$0, %eax
.L136:
	.loc 1 672 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE329:
	.size	parse_server_filename, .-parse_server_filename
	.section	.rodata
	.align 8
.LC78:
	.string	"\033[36m\n[*] SCANNING SERVERS FOR FILES\n\033[0m"
	.align 8
.LC79:
	.string	"\033[36m\n[*] QUERYING: Server %d (%s:%s)\n\033[0m"
	.align 8
.LC80:
	.string	"\033[36m[*] LIST REQUEST SENT\n\033[0m"
.LC81:
	.string	"nack\t\n0\t\n"
	.string	""
	.align 8
.LC82:
	.string	"\033[36m    [*] Chunk %d of %s found on server %d\n\033[0m"
	.align 8
.LC83:
	.string	"\033[31m    [-] ERROR: Could not parse filename: %s\n\033[0m"
	.align 8
.LC84:
	.string	"\033[33m    [!] No files found on server %d\n\033[0m"
	.align 8
.LC85:
	.string	"\033[32m    [+] Found %d file chunks on server %d\n\033[0m"
	.align 8
.LC86:
	.string	"\033[36m    FILE AVAILABILITY SUMMARY\n\033[0m"
	.align 8
.LC87:
	.string	"\033[33m[!] No files found on any server\n\n\033[0m"
.LC88:
	.string	"CHUNKS AVAILABLE"
.LC89:
	.string	"STATUS"
.LC90:
	.string	"FILENAME"
.LC91:
	.string	"%-30s %-15s %-15s\n"
	.align 8
.LC92:
	.string	"--------------------------------------------------------------"
.LC93:
	.string	"%-30s "
.LC94:
	.string	"COMPLETE"
.LC95:
	.string	"\033[32m%-15s\033[0m"
.LC96:
	.string	"INCOMPLETE"
.LC97:
	.string	"\033[31m%-15s\033[0m"
.LC98:
	.string	"%-2d/%-2d"
.LC99:
	.string	" ["
.LC100:
	.string	"\033[32m%d\033[0m"
.LC101:
	.string	"\033[31mX\033[0m"
.LC102:
	.string	"]"
	.text
	.globl	list_file
	.type	list_file, @function
list_file:
.LFB330:
	.loc 1 675 1
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
	.loc 1 675 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 676 5
	leaq	.LC78(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 678 9
	movl	$0, -30832(%rbp)
	.loc 1 678 16
	movl	$0, -30804(%rbp)
	.loc 1 679 22
	movq	-30856(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -30792(%rbp)
	.loc 1 680 36
	movq	-30856(%rbp), %rax
	movl	56(%rax), %eax
	cltq
	.loc 1 680 27
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	.loc 1 680 25 discriminator 1
	movq	-30856(%rbp), %rax
	movq	%rdx, 48(%rax)
	.loc 1 690 18
	movq	$0, -30784(%rbp)
	.loc 1 693 11
	jmp	.L139
.L154:
.LBB33:
	.loc 1 695 9
	movq	-30792(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-30792(%rbp), %rax
	movq	16(%rax), %rax
	movl	-30832(%rbp), %ecx
	leal	1(%rcx), %esi
	movq	%rdx, %rcx
	movq	%rax, %rdx
	leaq	.LC79(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 697 13
	movl	-30832(%rbp), %edx
	movq	-30792(%rbp), %rcx
	movq	-30856(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	connect_server
	.loc 1 697 12 discriminator 1
	testl	%eax, %eax
	js	.L171
	.loc 1 701 26
	movb	$3, -30746(%rbp)
	movb	$0, -30745(%rbp)
	movl	$0, -30744(%rbp)
	movl	$0, -30740(%rbp)
	.loc 1 707 20
	movq	-30792(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30746(%rbp), %rsi
	movl	$0, %ecx
	movl	$10, %edx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 707 18 discriminator 1
	movl	%eax, -30804(%rbp)
	.loc 1 708 9
	leaq	.LC80(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 710 13
	movl	$0, -30828(%rbp)
.L151:
.LBB34:
	.loc 1 715 13
	leaq	-30746(%rbp), %rax
	movl	$10, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 716 24
	movq	-30792(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30746(%rbp), %rsi
	movl	$0, %ecx
	movl	$10, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 716 22 discriminator 1
	movl	%eax, -30804(%rbp)
	.loc 1 717 16
	cmpl	$0, -30804(%rbp)
	jle	.L172
	.loc 1 720 13
	movl	-30804(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-30746(%rbp), %rcx
	leaq	-30736(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	.loc 1 721 17
	leaq	-30736(%rbp), %rax
	movl	$7, %edx
	leaq	.LC17(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 721 16 discriminator 1
	testl	%eax, %eax
	je	.L143
	.loc 1 721 63 discriminator 1
	leaq	-30736(%rbp), %rax
	movl	$8, %edx
	leaq	.LC81(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 721 60 discriminator 1
	testl	%eax, %eax
	je	.L143
	.loc 1 724 13
	leaq	-30736(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 725 84
	movl	-30744(%rbp), %eax
	.loc 1 725 24
	movl	%eax, %edx
	movq	-30792(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30736(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 725 22 discriminator 1
	movl	%eax, -30804(%rbp)
	.loc 1 726 16
	cmpl	$0, -30804(%rbp)
	jle	.L143
	.loc 1 726 34 discriminator 1
	leaq	-30736(%rbp), %rax
	movl	$7, %edx
	leaq	.LC17(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 726 31 discriminator 1
	testl	%eax, %eax
	je	.L143
	.loc 1 726 80 discriminator 2
	leaq	-30736(%rbp), %rax
	movl	$8, %edx
	leaq	.LC81(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 726 77 discriminator 1
	testl	%eax, %eax
	je	.L143
	.loc 1 730 19
	movq	$0, -30800(%rbp)
	.loc 1 731 17
	movl	$-1, -30836(%rbp)
	.loc 1 732 17
	leaq	-30836(%rbp), %rdx
	leaq	-30800(%rbp), %rcx
	leaq	-30736(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_server_filename
	.loc 1 732 16 discriminator 1
	testl	%eax, %eax
	jne	.L144
	.loc 1 732 103 discriminator 1
	movl	-30836(%rbp), %eax
	.loc 1 732 91 discriminator 1
	cmpl	$3, %eax
	jg	.L144
.LBB35:
	.loc 1 734 28
	addl	$1, -30828(%rbp)
	.loc 1 737 30
	movq	-30784(%rbp), %rax
	movq	%rax, -30776(%rbp)
	.loc 1 738 21
	movl	$0, -30824(%rbp)
	.loc 1 740 23
	jmp	.L145
.L148:
	.loc 1 742 25
	movq	-30800(%rbp), %rdx
	.loc 1 742 42
	movq	-30776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 742 25
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 742 24 discriminator 1
	testl	%eax, %eax
	jne	.L146
	.loc 1 744 31
	movl	$1, -30824(%rbp)
	.loc 1 745 51
	movl	-30836(%rbp), %edx
	movq	-30776(%rbp), %rax
	movslq	%edx, %rdx
	movl	8(%rax,%rdx,4), %eax
	movl	-30836(%rbp), %edx
	.loc 1 745 62
	leal	1(%rax), %ecx
	movq	-30776(%rbp), %rax
	movslq	%edx, %rdx
	movl	%ecx, 8(%rax,%rdx,4)
	.loc 1 746 25
	jmp	.L147
.L146:
	.loc 1 748 32
	movq	-30776(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -30776(%rbp)
.L145:
	.loc 1 740 35
	cmpq	$0, -30776(%rbp)
	jne	.L148
.L147:
	.loc 1 752 20
	cmpl	$0, -30824(%rbp)
	jne	.L149
	.loc 1 754 34
	movl	$32, %edi
	call	malloc@PLT
	movq	%rax, -30776(%rbp)
	.loc 1 755 44
	movq	-30800(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	.loc 1 755 42 discriminator 1
	movq	-30776(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 756 38
	movq	-30776(%rbp), %rax
	addq	$8, %rax
	.loc 1 756 21
	movl	$16, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 757 47
	movl	-30836(%rbp), %edx
	.loc 1 757 58
	movq	-30776(%rbp), %rax
	movslq	%edx, %rdx
	movl	$1, 8(%rax,%rdx,4)
	.loc 1 758 38
	movq	-30776(%rbp), %rax
	movq	-30784(%rbp), %rdx
	movq	%rdx, 24(%rax)
	.loc 1 759 31
	movq	-30776(%rbp), %rax
	movq	%rax, -30784(%rbp)
.L149:
	.loc 1 762 17
	movl	-30832(%rbp), %eax
	leal	1(%rax), %edx
	movq	-30800(%rbp), %rax
	movl	-30836(%rbp), %ecx
	leal	1(%rcx), %esi
	movl	%edx, %ecx
	movq	%rax, %rdx
	leaq	.LC82(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 764 17
	movq	-30800(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.LBE35:
	.loc 1 733 13
	jmp	.L150
.L144:
	.loc 1 768 17
	leaq	-30736(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC83(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L150:
.LBE34:
	.loc 1 714 9
	jmp	.L151
.L172:
.LBB36:
	.loc 1 718 17
	nop
.L143:
.LBE36:
	.loc 1 772 12
	cmpl	$0, -30828(%rbp)
	jne	.L152
	.loc 1 773 13
	movl	-30832(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC84(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L141
.L152:
	.loc 1 775 13
	movl	-30832(%rbp), %eax
	leal	1(%rax), %edx
	movl	-30828(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC85(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L141
.L171:
	.loc 1 698 13
	nop
.L141:
	.loc 1 779 20
	movq	-30792(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 779 12
	testl	%eax, %eax
	js	.L153
	.loc 1 780 13
	movq	-30792(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
.L153:
	.loc 1 782 17
	movq	-30792(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -30792(%rbp)
	.loc 1 783 10
	addl	$1, -30832(%rbp)
.L139:
.LBE33:
	.loc 1 693 12
	cmpq	$0, -30792(%rbp)
	jne	.L154
	.loc 1 787 5
	leaq	.LC56(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 788 5
	leaq	.LC86(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 789 5
	leaq	.LC58(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 791 8
	cmpq	$0, -30784(%rbp)
	jne	.L155
	.loc 1 792 9
	leaq	.LC87(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L156
.L155:
.LBB37:
	.loc 1 795 9
	leaq	.LC88(%rip), %rax
	movq	%rax, %rcx
	leaq	.LC89(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC90(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC91(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 796 9
	leaq	.LC92(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 799 22
	movq	-30784(%rbp), %rax
	movq	%rax, -30768(%rbp)
	.loc 1 800 15
	jmp	.L157
.L169:
.LBB38:
	.loc 1 803 17
	movl	$0, -30820(%rbp)
	.loc 1 804 17
	movl	$1, -30816(%rbp)
.LBB39:
	.loc 1 806 22
	movl	$0, -30812(%rbp)
	.loc 1 806 13
	jmp	.L158
.L161:
	.loc 1 808 47
	movq	-30768(%rbp), %rax
	movl	-30812(%rbp), %edx
	movslq	%edx, %rdx
	movl	8(%rax,%rdx,4), %eax
	.loc 1 808 20
	testl	%eax, %eax
	jle	.L159
	.loc 1 810 37
	addl	$1, -30820(%rbp)
	jmp	.L160
.L159:
	.loc 1 814 33
	movl	$0, -30816(%rbp)
.L160:
	.loc 1 806 51 discriminator 2
	addl	$1, -30812(%rbp)
.L158:
	.loc 1 806 31 discriminator 1
	cmpl	$3, -30812(%rbp)
	jle	.L161
.LBE39:
	.loc 1 819 13
	movq	-30768(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC93(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 821 16
	cmpl	$0, -30816(%rbp)
	je	.L162
	.loc 1 822 17
	leaq	.LC94(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC95(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L163
.L162:
	.loc 1 824 17
	leaq	.LC96(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC97(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L163:
	.loc 1 827 13
	movl	-30820(%rbp), %eax
	movl	$4, %edx
	movl	%eax, %esi
	leaq	.LC98(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 830 13
	leaq	.LC99(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBB40:
	.loc 1 831 22
	movl	$0, -30808(%rbp)
	.loc 1 831 13
	jmp	.L164
.L168:
	.loc 1 833 47
	movq	-30768(%rbp), %rax
	movl	-30808(%rbp), %edx
	movslq	%edx, %rdx
	movl	8(%rax,%rdx,4), %eax
	.loc 1 833 20
	testl	%eax, %eax
	jle	.L165
	.loc 1 835 21
	movl	-30808(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC100(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L166
.L165:
	.loc 1 839 21
	leaq	.LC101(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L166:
	.loc 1 842 20
	cmpl	$2, -30808(%rbp)
	jg	.L167
	.loc 1 843 21
	movl	$44, %edi
	call	putchar@PLT
.L167:
	.loc 1 831 51 discriminator 2
	addl	$1, -30808(%rbp)
.L164:
	.loc 1 831 31 discriminator 1
	cmpl	$3, -30808(%rbp)
	jle	.L168
.LBE40:
	.loc 1 845 13
	leaq	.LC102(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 848 26
	movq	-30768(%rbp), %rax
	movq	%rax, -30760(%rbp)
	.loc 1 849 24
	movq	-30768(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -30768(%rbp)
	.loc 1 851 22
	movq	-30760(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 851 13
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 852 13
	movq	-30760(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L157:
.LBE38:
	.loc 1 800 27
	cmpq	$0, -30768(%rbp)
	jne	.L169
	.loc 1 854 9
	movl	$10, %edi
	call	putchar@PLT
.L156:
.LBE37:
	.loc 1 858 12
	movq	-30856(%rbp), %rax
	movq	48(%rax), %rax
	.loc 1 858 5
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 859 25
	movq	-30856(%rbp), %rax
	movq	$0, 48(%rax)
	.loc 1 860 1
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L170
	call	__stack_chk_fail@PLT
.L170:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE330:
	.size	list_file, .-list_file
	.section	.rodata
	.align 8
.LC103:
	.string	"\033[32m    FILE DELETE SUCCESSFUL\n\033[0m"
	.align 8
.LC104:
	.string	"\033[32m    All chunks removed from servers\n\033[0m"
	.align 8
.LC105:
	.string	"\033[31m[-] ERROR: File not found or permission denied on server\n\033[0m"
	.text
	.globl	delete_file
	.type	delete_file, @function
delete_file:
.LFB331:
	.loc 1 863 1
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
	.loc 1 863 1
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 1 865 9
	movl	$0, -30808(%rbp)
	.loc 1 865 16
	movl	$0, -30796(%rbp)
	.loc 1 866 22
	movq	-30824(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -30776(%rbp)
	.loc 1 867 36
	movq	-30824(%rbp), %rax
	movl	56(%rax), %eax
	cltq
	.loc 1 867 27
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	.loc 1 867 25 discriminator 1
	movq	-30824(%rbp), %rax
	movq	%rdx, 48(%rax)
	.loc 1 870 11
	jmp	.L174
.L188:
.LBB41:
	.loc 1 872 13
	movl	-30808(%rbp), %edx
	movq	-30776(%rbp), %rcx
	movq	-30824(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	connect_server
	.loc 1 872 12 discriminator 1
	testl	%eax, %eax
	js	.L190
	.loc 1 875 51
	movq	-30824(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 875 42
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 875 20 discriminator 1
	movl	%eax, %edx
	movq	-30824(%rbp), %rax
	movq	16(%rax), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	str2md5
	.loc 1 875 68 discriminator 2
	movq	-30824(%rbp), %rdx
	movl	56(%rdx), %edx
	movl	%edx, %ecx
	.loc 1 875 64 discriminator 2
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	.loc 1 875 13 discriminator 2
	movl	%eax, -30792(%rbp)
	.loc 1 876 26
	movl	-30808(%rbp), %eax
	subl	-30792(%rbp), %eax
	.loc 1 876 63
	testl	%eax, %eax
	jns	.L177
	.loc 1 876 63 is_stmt 0 discriminator 1
	movq	-30824(%rbp), %rax
	movl	56(%rax), %eax
	jmp	.L178
.L177:
	.loc 1 876 63 discriminator 2
	movl	-30808(%rbp), %eax
	subl	-30792(%rbp), %eax
.L178:
	.loc 1 876 13 is_stmt 1 discriminator 4
	movl	%eax, -30804(%rbp)
.LBB42:
	.loc 1 877 18
	movl	$0, -30800(%rbp)
	.loc 1 877 9
	jmp	.L179
.L187:
.LBB43:
	.loc 1 879 28
	movl	-30804(%rbp), %edx
	movl	-30800(%rbp), %eax
	addl	%eax, %edx
	.loc 1 879 37
	movq	-30824(%rbp), %rax
	movl	56(%rax), %ecx
	.loc 1 879 19
	movl	%edx, %eax
	cltd
	idivl	%ecx
	movl	%edx, -30804(%rbp)
	.loc 1 881 30
	movb	$2, -30762(%rbp)
	movl	-30804(%rbp), %eax
	movb	%al, -30761(%rbp)
	.loc 1 884 45
	movq	-30824(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 884 36
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 881 30
	movl	%eax, -30760(%rbp)
	movl	$0, -30756(%rbp)
.LBB44:
	.loc 1 887 24
	movq	-30776(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30762(%rbp), %rsi
	movl	$0, %ecx
	movl	$10, %edx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 887 24 is_stmt 0 discriminator 1
	movl	%eax, -30788(%rbp)
	cmpl	$0, -30788(%rbp)
	jg	.L180
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 887 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 887 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 887 24
	jmp	.L176
.L180:
	.loc 1 887 24 discriminator 2
	movl	-30788(%rbp), %eax
.LBE44:
	.loc 1 887 22 is_stmt 1 discriminator 2
	movl	%eax, -30796(%rbp)
.LBB45:
	.loc 1 888 24
	movl	-30760(%rbp), %eax
	movl	%eax, %edx
	movq	-30824(%rbp), %rax
	movq	16(%rax), %rsi
	movq	-30776(%rbp), %rax
	movl	(%rax), %eax
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 888 24 is_stmt 0 discriminator 1
	movl	%eax, -30784(%rbp)
	cmpl	$0, -30784(%rbp)
	jg	.L182
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 888 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 888 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 888 24
	jmp	.L176
.L182:
	.loc 1 888 24 discriminator 2
	movl	-30784(%rbp), %eax
.LBE45:
	.loc 1 888 22 is_stmt 1 discriminator 2
	movl	%eax, -30796(%rbp)
	.loc 1 889 13
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.LBB46:
	.loc 1 890 24
	movq	-30776(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30752(%rbp), %rsi
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 890 24 is_stmt 0 discriminator 1
	movl	%eax, -30780(%rbp)
	cmpl	$0, -30780(%rbp)
	jns	.L183
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 890 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 890 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 890 24
	jmp	.L176
.L183:
	.loc 1 890 24 discriminator 2
	cmpl	$0, -30780(%rbp)
	jne	.L184
	.loc 1 890 24 discriminator 3
	movq	-30776(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 890 24 discriminator 1
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 890 24
	jmp	.L176
.L184:
	.loc 1 890 24 discriminator 4
	movl	-30780(%rbp), %eax
.LBE46:
	.loc 1 890 22 is_stmt 1 discriminator 4
	movl	%eax, -30796(%rbp)
	.loc 1 891 17
	leaq	-30752(%rbp), %rax
	movl	$7, %edx
	leaq	.LC17(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 891 16 discriminator 1
	testl	%eax, %eax
	jne	.L185
	.loc 1 893 17
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 894 17
	leaq	.LC103(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 895 17
	movq	-30824(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC28(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 896 17
	leaq	.LC104(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 897 17
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L185:
	.loc 1 899 17
	leaq	-30752(%rbp), %rax
	movl	$8, %edx
	leaq	.LC81(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 899 16 discriminator 1
	testl	%eax, %eax
	jne	.L186
	.loc 1 901 17
	leaq	.LC105(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L186:
.LBE43:
	.loc 1 877 63 discriminator 2
	addl	$1, -30800(%rbp)
.L179:
	.loc 1 877 27 discriminator 1
	cmpl	$1, -30800(%rbp)
	jle	.L187
.LBE42:
	.loc 1 906 5
	jmp	.L176
.L190:
	.loc 1 873 13
	nop
.L176:
	.loc 1 907 9
	movq	-30776(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 908 17
	movq	-30776(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -30776(%rbp)
	.loc 1 909 10
	addl	$1, -30808(%rbp)
.L174:
.LBE41:
	.loc 1 870 12
	cmpq	$0, -30776(%rbp)
	jne	.L188
	.loc 1 911 1
	nop
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L189
	call	__stack_chk_fail@PLT
.L189:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE331:
	.size	delete_file, .-delete_file
	.section	.rodata
	.align 8
.LC106:
	.string	"\033[36m    DFS SERVER STATUS CHECK\n\033[0m"
	.align 8
.LC107:
	.string	"\033[36m[*] CHECKING INDIVIDUAL SERVER STATUS\n\n\033[0m"
	.align 8
.LC108:
	.string	"\033[36m[*] Server %d (%s:%s): \033[0m"
.LC109:
	.string	"\033[31mOFFLINE\n\033[0m"
	.align 8
.LC110:
	.string	"\033[31m    Unable to establish connection\n\n\033[0m"
.LC111:
	.string	"\033[32mONLINE\n\033[0m"
	.align 8
.LC112:
	.string	"\033[32m    Connection established successfully\n\033[0m"
	.align 8
.LC114:
	.string	"\033[32m    Response time: %.2f ms\n\n\033[0m"
	.align 8
.LC115:
	.string	"\033[36m    SYSTEM STATUS SUMMARY\n\033[0m"
.LC116:
	.string	"Servers available: %d/%d "
	.align 8
.LC117:
	.string	"\033[32m(All servers online)\n\033[0m"
	.align 8
.LC118:
	.string	"\033[33m(System operational with reduced redundancy)\n\033[0m"
	.align 8
.LC119:
	.string	"\033[33m(System partially operational - limited functionality)\n\033[0m"
	.align 8
.LC120:
	.string	"\033[31m(System offline - no servers available)\n\033[0m"
	.align 8
.LC121:
	.string	"\nSystem capabilities with %d/%d servers:\n"
.LC122:
	.string	"\033[32m  [\342\234\223] \033[0m"
.LC123:
	.string	"\033[31m  [\342\234\227] \033[0m"
.LC124:
	.string	"LIST - View available files"
.LC125:
	.string	"GET - Download complete files"
.LC126:
	.string	"full"
.LC127:
	.string	"partial"
	.align 8
.LC128:
	.string	"PUT - Upload files (with %s redundancy)\n"
	.align 8
.LC129:
	.string	"DELETE - Remove files (may be incomplete with partial servers)\n"
	.text
	.globl	server_info
	.type	server_info, @function
server_info:
.LFB332:
	.loc 1 914 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 1 915 5
	leaq	.LC56(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 916 5
	leaq	.LC106(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 917 5
	leaq	.LC58(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 919 9
	movl	$0, -16(%rbp)
	.loc 1 920 9
	movl	$0, -12(%rbp)
	.loc 1 921 22
	movq	-24(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -8(%rbp)
	.loc 1 924 36
	movq	-24(%rbp), %rax
	movl	56(%rax), %eax
	cltq
	.loc 1 924 27
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	.loc 1 924 25 discriminator 1
	movq	-24(%rbp), %rax
	movq	%rdx, 48(%rax)
	.loc 1 927 5
	leaq	.LC107(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 930 11
	jmp	.L192
.L196:
	.loc 1 932 9
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movl	-16(%rbp), %ecx
	leal	1(%rcx), %esi
	movq	%rdx, %rcx
	movq	%rax, %rdx
	leaq	.LC108(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 935 13
	movl	-16(%rbp), %edx
	movq	-8(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	connect_server
	.loc 1 935 12 discriminator 1
	testl	%eax, %eax
	jns	.L193
	.loc 1 936 13
	leaq	.LC109(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 937 13
	leaq	.LC110(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L194
.L193:
	.loc 1 939 27
	addl	$1, -12(%rbp)
	.loc 1 940 13
	leaq	.LC111(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 941 13
	leaq	.LC112(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 944 72
	call	rand@PLT
	.loc 1 944 79 discriminator 1
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
	.loc 1 944 13 discriminator 1
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%edx, %xmm1
	movsd	.LC113(%rip), %xmm0
	addsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, %xmm0
	leaq	.LC114(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
.L194:
	.loc 1 948 20
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 948 12
	testl	%eax, %eax
	js	.L195
	.loc 1 949 13
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
.L195:
	.loc 1 951 17
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -8(%rbp)
	.loc 1 952 10
	addl	$1, -16(%rbp)
.L192:
	.loc 1 930 12
	cmpq	$0, -8(%rbp)
	jne	.L196
	.loc 1 956 5
	leaq	.LC56(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 957 5
	leaq	.LC115(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 958 5
	leaq	.LC58(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 961 5
	movq	-24(%rbp), %rax
	movl	56(%rax), %edx
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC116(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 963 29
	movq	-24(%rbp), %rax
	movl	56(%rax), %eax
	.loc 1 963 8
	cmpl	%eax, -12(%rbp)
	jne	.L197
	.loc 1 964 9
	leaq	.LC117(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L198
.L197:
	.loc 1 965 15
	cmpl	$1, -12(%rbp)
	jle	.L199
	.loc 1 966 9
	leaq	.LC118(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L198
.L199:
	.loc 1 967 15
	cmpl	$0, -12(%rbp)
	jle	.L200
	.loc 1 968 9
	leaq	.LC119(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L198
.L200:
	.loc 1 970 9
	leaq	.LC120(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L198:
	.loc 1 974 5
	movq	-24(%rbp), %rax
	movl	56(%rax), %edx
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC121(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 976 8
	cmpl	$0, -12(%rbp)
	jle	.L201
	.loc 1 977 9
	leaq	.LC122(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L202
.L201:
	.loc 1 979 9
	leaq	.LC123(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L202:
	.loc 1 981 5
	leaq	.LC124(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 983 8
	cmpl	$3, -12(%rbp)
	jle	.L203
	.loc 1 984 9
	leaq	.LC122(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L204
.L203:
	.loc 1 986 9
	leaq	.LC123(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L204:
	.loc 1 988 5
	leaq	.LC125(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 990 8
	cmpl	$0, -12(%rbp)
	jle	.L205
	.loc 1 991 9
	leaq	.LC122(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L206
.L205:
	.loc 1 993 9
	leaq	.LC123(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L206:
	.loc 1 995 5
	cmpl	$3, -12(%rbp)
	jle	.L207
	.loc 1 995 5 is_stmt 0 discriminator 1
	leaq	.LC126(%rip), %rax
	jmp	.L208
.L207:
	.loc 1 995 5 discriminator 2
	leaq	.LC127(%rip), %rax
.L208:
	.loc 1 995 5 discriminator 4
	movq	%rax, %rsi
	leaq	.LC128(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 998 8 is_stmt 1
	cmpl	$0, -12(%rbp)
	jle	.L209
	.loc 1 999 9
	leaq	.LC122(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L210
.L209:
	.loc 1 1001 9
	leaq	.LC123(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L210:
	.loc 1 1003 5
	leaq	.LC129(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 1005 5
	leaq	.LC58(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1008 12
	movq	-24(%rbp), %rax
	movq	48(%rax), %rax
	.loc 1 1008 5
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 1009 25
	movq	-24(%rbp), %rax
	movq	$0, 48(%rax)
	.loc 1 1010 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE332:
	.size	server_info, .-server_info
	.section	.rodata
.LC130:
	.string	"SERVER INFO"
.LC131:
	.string	"UNKNOWN"
.LC132:
	.string	"DELETE"
.LC133:
	.string	"LIST"
.LC134:
	.string	"GET"
.LC135:
	.string	"PUT"
.LC136:
	.string	"\033[36m    OPERATION: %s\n\033[0m"
	.text
	.globl	handle_req
	.type	handle_req, @function
handle_req:
.LFB333:
	.loc 1 1029 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 1031 5
	leaq	.LC56(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1033 14
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	.loc 1 1032 5
	cmpl	$1, %eax
	je	.L212
	.loc 1 1034 14
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	.loc 1 1034 43
	testl	%eax, %eax
	je	.L213
	.loc 1 1035 14
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	.loc 1 1035 43
	cmpl	$3, %eax
	je	.L214
	.loc 1 1036 14
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	.loc 1 1036 49
	cmpl	$2, %eax
	je	.L215
	.loc 1 1037 14
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	.loc 1 1037 59
	cmpl	$5, %eax
	jne	.L216
	.loc 1 1037 59 is_stmt 0 discriminator 1
	leaq	.LC130(%rip), %rax
	jmp	.L221
.L216:
	.loc 1 1037 59 discriminator 2
	leaq	.LC131(%rip), %rax
	jmp	.L221
.L215:
	.loc 1 1036 49 is_stmt 1 discriminator 1
	leaq	.LC132(%rip), %rax
	jmp	.L221
.L214:
	.loc 1 1035 43 discriminator 1
	leaq	.LC133(%rip), %rax
	jmp	.L221
.L213:
	.loc 1 1034 43 discriminator 1
	leaq	.LC134(%rip), %rax
	jmp	.L221
.L212:
	.loc 1 1032 5 discriminator 1
	leaq	.LC135(%rip), %rax
.L221:
	.loc 1 1032 5 is_stmt 0 discriminator 3
	movq	%rax, %rsi
	leaq	.LC136(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1038 5 is_stmt 1
	leaq	.LC58(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1041 15
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	.loc 1 1041 5
	cmpl	$5, %eax
	ja	.L232
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L224(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L224(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L224:
	.long	.L229-.L224
	.long	.L228-.L224
	.long	.L227-.L224
	.long	.L226-.L224
	.long	.L225-.L224
	.long	.L223-.L224
	.text
.L226:
	.loc 1 1044 9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	list_file
	.loc 1 1045 9
	jmp	.L230
.L229:
	.loc 1 1047 9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	get_file
	.loc 1 1048 9
	jmp	.L230
.L228:
	.loc 1 1050 9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	put_file
	.loc 1 1051 9
	jmp	.L230
.L227:
	.loc 1 1053 9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	delete_file
	.loc 1 1054 9
	jmp	.L230
.L225:
	.loc 1 1056 9
	movl	$0, %edi
	call	exit@PLT
.L223:
	.loc 1 1059 9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	server_info
	.loc 1 1060 9
	jmp	.L230
.L232:
	.loc 1 1062 9
	nop
.L230:
	.loc 1 1065 12
	movl	$0, %eax
	.loc 1 1066 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE333:
	.size	handle_req, .-handle_req
	.section	.rodata
	.align 4
.LC52:
	.long	1120403456
	.align 8
.LC113:
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
	.file 18 "/usr/include/openssl/types.h"
	.file 19 "./common.h"
	.file 20 "/usr/include/string.h"
	.file 21 "/usr/include/stdlib.h"
	.file 22 "/usr/include/arpa/inet.h"
	.file 23 "/usr/include/x86_64-linux-gnu/bits/unistd_ext.h"
	.file 24 "/usr/include/errno.h"
	.file 25 "/usr/include/openssl/evp.h"
	.file 26 "/usr/include/x86_64-linux-gnu/bits/socket_type.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1bcd
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x27
	.long	.LASF266
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
	.uleb128 0xd
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0xd
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x28
	.byte	0x8
	.uleb128 0x12
	.long	0x48
	.uleb128 0xd
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0xd
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0xd
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x4
	.long	.LASF8
	.byte	0x3
	.byte	0x26
	.byte	0x17
	.long	0x4f
	.uleb128 0xd
	.byte	0x2
	.byte	0x5
	.long	.LASF9
	.uleb128 0x4
	.long	.LASF10
	.byte	0x3
	.byte	0x28
	.byte	0x1c
	.long	0x56
	.uleb128 0x29
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x4
	.long	.LASF11
	.byte	0x3
	.byte	0x2a
	.byte	0x16
	.long	0x41
	.uleb128 0xd
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
	.uleb128 0x12
	.long	0xe5
	.uleb128 0xd
	.byte	0x1
	.byte	0x6
	.long	.LASF19
	.uleb128 0x1c
	.long	0xef
	.uleb128 0x4
	.long	.LASF20
	.byte	0x3
	.byte	0xd2
	.byte	0x17
	.long	0x41
	.uleb128 0x11
	.long	.LASF56
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x28e
	.uleb128 0x2
	.long	.LASF21
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x83
	.byte	0
	.uleb128 0x2
	.long	.LASF22
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0xe5
	.byte	0x8
	.uleb128 0x2
	.long	.LASF23
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0xe5
	.byte	0x10
	.uleb128 0x2
	.long	.LASF24
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0xe5
	.byte	0x18
	.uleb128 0x2
	.long	.LASF25
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0xe5
	.byte	0x20
	.uleb128 0x2
	.long	.LASF26
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0xe5
	.byte	0x28
	.uleb128 0x2
	.long	.LASF27
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0xe5
	.byte	0x30
	.uleb128 0x2
	.long	.LASF28
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0xe5
	.byte	0x38
	.uleb128 0x2
	.long	.LASF29
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0xe5
	.byte	0x40
	.uleb128 0x2
	.long	.LASF30
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0xe5
	.byte	0x48
	.uleb128 0x2
	.long	.LASF31
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0xe5
	.byte	0x50
	.uleb128 0x2
	.long	.LASF32
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0xe5
	.byte	0x58
	.uleb128 0x2
	.long	.LASF33
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x2a7
	.byte	0x60
	.uleb128 0x2
	.long	.LASF34
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x2ac
	.byte	0x68
	.uleb128 0x2
	.long	.LASF35
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x83
	.byte	0x70
	.uleb128 0x2
	.long	.LASF36
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x83
	.byte	0x74
	.uleb128 0x2
	.long	.LASF37
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0x9d
	.byte	0x78
	.uleb128 0x2
	.long	.LASF38
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x56
	.byte	0x80
	.uleb128 0x2
	.long	.LASF39
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x5d
	.byte	0x82
	.uleb128 0x2
	.long	.LASF40
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x2b1
	.byte	0x83
	.uleb128 0x2
	.long	.LASF41
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x2c1
	.byte	0x88
	.uleb128 0x2
	.long	.LASF42
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0xa9
	.byte	0x90
	.uleb128 0x2
	.long	.LASF43
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x2cb
	.byte	0x98
	.uleb128 0x2
	.long	.LASF44
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x2d5
	.byte	0xa0
	.uleb128 0x2
	.long	.LASF45
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x2ac
	.byte	0xa8
	.uleb128 0x2
	.long	.LASF46
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0x48
	.byte	0xb0
	.uleb128 0x2
	.long	.LASF47
	.byte	0x4
	.byte	0x5f
	.byte	0x15
	.long	0x2da
	.byte	0xb8
	.uleb128 0x2
	.long	.LASF48
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x83
	.byte	0xc0
	.uleb128 0x2
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
	.uleb128 0x2a
	.long	.LASF267
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0x15
	.long	.LASF51
	.uleb128 0x5
	.long	0x2a2
	.uleb128 0x5
	.long	0x107
	.uleb128 0xe
	.long	0xef
	.long	0x2c1
	.uleb128 0xf
	.long	0x3a
	.byte	0
	.byte	0
	.uleb128 0x5
	.long	0x29a
	.uleb128 0x15
	.long	.LASF52
	.uleb128 0x5
	.long	0x2c6
	.uleb128 0x15
	.long	.LASF53
	.uleb128 0x5
	.long	0x2d0
	.uleb128 0x5
	.long	0x2ac
	.uleb128 0xe
	.long	0xef
	.long	0x2ef
	.uleb128 0xf
	.long	0x3a
	.byte	0x13
	.byte	0
	.uleb128 0x5
	.long	0xf6
	.uleb128 0x12
	.long	0x2ef
	.uleb128 0x4
	.long	.LASF54
	.byte	0x6
	.byte	0x4e
	.byte	0x13
	.long	0xd9
	.uleb128 0x5
	.long	0x28e
	.uleb128 0x12
	.long	0x305
	.uleb128 0x2b
	.long	.LASF268
	.byte	0x6
	.byte	0x97
	.byte	0xe
	.long	0x305
	.uleb128 0xd
	.byte	0x8
	.byte	0x5
	.long	.LASF55
	.uleb128 0x11
	.long	.LASF57
	.byte	0x10
	.byte	0x7
	.byte	0x8
	.byte	0x8
	.long	0x34a
	.uleb128 0x2
	.long	.LASF58
	.byte	0x7
	.byte	0xe
	.byte	0xc
	.long	0xc1
	.byte	0
	.uleb128 0x2
	.long	.LASF59
	.byte	0x7
	.byte	0xf
	.byte	0x11
	.long	0xcd
	.byte	0x8
	.byte	0
	.uleb128 0xd
	.byte	0x8
	.byte	0x7
	.long	.LASF60
	.uleb128 0x11
	.long	.LASF61
	.byte	0x10
	.byte	0x8
	.byte	0x33
	.byte	0x10
	.long	0x379
	.uleb128 0x2
	.long	.LASF62
	.byte	0x8
	.byte	0x35
	.byte	0x23
	.long	0x379
	.byte	0
	.uleb128 0x2
	.long	.LASF63
	.byte	0x8
	.byte	0x36
	.byte	0x23
	.long	0x379
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.long	0x351
	.uleb128 0x4
	.long	.LASF64
	.byte	0x8
	.byte	0x37
	.byte	0x3
	.long	0x351
	.uleb128 0x11
	.long	.LASF65
	.byte	0x28
	.byte	0x9
	.byte	0x16
	.byte	0x8
	.long	0x400
	.uleb128 0x2
	.long	.LASF66
	.byte	0x9
	.byte	0x18
	.byte	0x7
	.long	0x83
	.byte	0
	.uleb128 0x2
	.long	.LASF67
	.byte	0x9
	.byte	0x19
	.byte	0x10
	.long	0x41
	.byte	0x4
	.uleb128 0x2
	.long	.LASF68
	.byte	0x9
	.byte	0x1a
	.byte	0x7
	.long	0x83
	.byte	0x8
	.uleb128 0x2
	.long	.LASF69
	.byte	0x9
	.byte	0x1c
	.byte	0x10
	.long	0x41
	.byte	0xc
	.uleb128 0x2
	.long	.LASF70
	.byte	0x9
	.byte	0x20
	.byte	0x7
	.long	0x83
	.byte	0x10
	.uleb128 0x2
	.long	.LASF71
	.byte	0x9
	.byte	0x22
	.byte	0x9
	.long	0x70
	.byte	0x14
	.uleb128 0x2
	.long	.LASF72
	.byte	0x9
	.byte	0x23
	.byte	0x9
	.long	0x70
	.byte	0x16
	.uleb128 0x2
	.long	.LASF73
	.byte	0x9
	.byte	0x24
	.byte	0x14
	.long	0x37e
	.byte	0x18
	.byte	0
	.uleb128 0x24
	.byte	0x28
	.byte	0xa
	.byte	0x43
	.byte	0x9
	.long	0x42e
	.uleb128 0x16
	.long	.LASF74
	.byte	0xa
	.byte	0x45
	.byte	0x1c
	.long	0x38a
	.uleb128 0x16
	.long	.LASF75
	.byte	0xa
	.byte	0x46
	.byte	0x8
	.long	0x42e
	.uleb128 0x16
	.long	.LASF76
	.byte	0xa
	.byte	0x47
	.byte	0xc
	.long	0x96
	.byte	0
	.uleb128 0xe
	.long	0xef
	.long	0x43e
	.uleb128 0xf
	.long	0x3a
	.byte	0x27
	.byte	0
	.uleb128 0x4
	.long	.LASF77
	.byte	0xa
	.byte	0x48
	.byte	0x3
	.long	0x400
	.uleb128 0x5
	.long	0x454
	.uleb128 0x12
	.long	0x44a
	.uleb128 0x2c
	.uleb128 0x4
	.long	.LASF78
	.byte	0xb
	.byte	0x18
	.byte	0x13
	.long	0x64
	.uleb128 0x4
	.long	.LASF79
	.byte	0xb
	.byte	0x19
	.byte	0x14
	.long	0x77
	.uleb128 0x4
	.long	.LASF80
	.byte	0xb
	.byte	0x1a
	.byte	0x14
	.long	0x8a
	.uleb128 0x25
	.long	.LASF81
	.byte	0xc
	.value	0x112
	.byte	0x15
	.long	0xfb
	.uleb128 0x5
	.long	0xe5
	.uleb128 0x12
	.long	0x486
	.uleb128 0x2d
	.long	.LASF269
	.byte	0x7
	.byte	0x4
	.long	0x41
	.byte	0x1a
	.byte	0x18
	.byte	0x6
	.long	0x4dd
	.uleb128 0x10
	.long	.LASF82
	.byte	0x1
	.uleb128 0x10
	.long	.LASF83
	.byte	0x2
	.uleb128 0x10
	.long	.LASF84
	.byte	0x3
	.uleb128 0x10
	.long	.LASF85
	.byte	0x4
	.uleb128 0x10
	.long	.LASF86
	.byte	0x5
	.uleb128 0x10
	.long	.LASF87
	.byte	0x6
	.uleb128 0x10
	.long	.LASF88
	.byte	0xa
	.uleb128 0x2e
	.long	.LASF89
	.long	0x80000
	.uleb128 0x2f
	.long	.LASF90
	.value	0x800
	.byte	0
	.uleb128 0x4
	.long	.LASF91
	.byte	0xd
	.byte	0x1c
	.byte	0x1c
	.long	0x56
	.uleb128 0x11
	.long	.LASF92
	.byte	0x10
	.byte	0xe
	.byte	0xb8
	.byte	0x27
	.long	0x511
	.uleb128 0x2
	.long	.LASF93
	.byte	0xe
	.byte	0xba
	.byte	0x5
	.long	0x4dd
	.byte	0
	.uleb128 0x2
	.long	.LASF94
	.byte	0xe
	.byte	0xbb
	.byte	0xa
	.long	0x511
	.byte	0x2
	.byte	0
	.uleb128 0xe
	.long	0xef
	.long	0x521
	.uleb128 0xf
	.long	0x3a
	.byte	0xd
	.byte	0
	.uleb128 0x5
	.long	0x4e9
	.uleb128 0x11
	.long	.LASF95
	.byte	0x10
	.byte	0xf
	.byte	0xf7
	.byte	0x27
	.long	0x568
	.uleb128 0x2
	.long	.LASF96
	.byte	0xf
	.byte	0xf9
	.byte	0x5
	.long	0x4dd
	.byte	0
	.uleb128 0x2
	.long	.LASF97
	.byte	0xf
	.byte	0xfa
	.byte	0xf
	.long	0x5f5
	.byte	0x2
	.uleb128 0x2
	.long	.LASF98
	.byte	0xf
	.byte	0xfb
	.byte	0x14
	.long	0x5da
	.byte	0x4
	.uleb128 0x2
	.long	.LASF99
	.byte	0xf
	.byte	0xfe
	.byte	0x13
	.long	0x67a
	.byte	0x8
	.byte	0
	.uleb128 0x1d
	.long	.LASF100
	.byte	0x1c
	.byte	0xf
	.value	0x108
	.byte	0x27
	.long	0x5bd
	.uleb128 0xb
	.long	.LASF101
	.byte	0xf
	.value	0x10a
	.byte	0x5
	.long	0x4dd
	.byte	0
	.uleb128 0xb
	.long	.LASF102
	.byte	0xf
	.value	0x10b
	.byte	0xf
	.long	0x5f5
	.byte	0x2
	.uleb128 0xb
	.long	.LASF103
	.byte	0xf
	.value	0x10c
	.byte	0xe
	.long	0x46d
	.byte	0x4
	.uleb128 0xb
	.long	.LASF104
	.byte	0xf
	.value	0x10d
	.byte	0x15
	.long	0x65f
	.byte	0x8
	.uleb128 0xb
	.long	.LASF105
	.byte	0xf
	.value	0x10e
	.byte	0xe
	.long	0x46d
	.byte	0x18
	.byte	0
	.uleb128 0x4
	.long	.LASF106
	.byte	0x10
	.byte	0x54
	.byte	0xa
	.long	0x5c9
	.uleb128 0x30
	.byte	0x8
	.byte	0x10
	.byte	0x53
	.byte	0x9
	.uleb128 0x4
	.long	.LASF107
	.byte	0xf
	.byte	0x1e
	.byte	0x12
	.long	0x46d
	.uleb128 0x11
	.long	.LASF108
	.byte	0x4
	.byte	0xf
	.byte	0x1f
	.byte	0x8
	.long	0x5f5
	.uleb128 0x2
	.long	.LASF109
	.byte	0xf
	.byte	0x21
	.byte	0xf
	.long	0x5ce
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	.LASF110
	.byte	0xf
	.byte	0x7d
	.byte	0x12
	.long	0x461
	.uleb128 0x24
	.byte	0x10
	.byte	0xf
	.byte	0xdf
	.byte	0x5
	.long	0x62f
	.uleb128 0x16
	.long	.LASF111
	.byte	0xf
	.byte	0xe1
	.byte	0xa
	.long	0x62f
	.uleb128 0x16
	.long	.LASF112
	.byte	0xf
	.byte	0xe2
	.byte	0xb
	.long	0x63f
	.uleb128 0x16
	.long	.LASF113
	.byte	0xf
	.byte	0xe3
	.byte	0xb
	.long	0x64f
	.byte	0
	.uleb128 0xe
	.long	0x455
	.long	0x63f
	.uleb128 0xf
	.long	0x3a
	.byte	0xf
	.byte	0
	.uleb128 0xe
	.long	0x461
	.long	0x64f
	.uleb128 0xf
	.long	0x3a
	.byte	0x7
	.byte	0
	.uleb128 0xe
	.long	0x46d
	.long	0x65f
	.uleb128 0xf
	.long	0x3a
	.byte	0x3
	.byte	0
	.uleb128 0x11
	.long	.LASF114
	.byte	0x10
	.byte	0xf
	.byte	0xdd
	.byte	0x8
	.long	0x67a
	.uleb128 0x2
	.long	.LASF115
	.byte	0xf
	.byte	0xe4
	.byte	0x9
	.long	0x601
	.byte	0
	.byte	0
	.uleb128 0xe
	.long	0x4f
	.long	0x68a
	.uleb128 0xf
	.long	0x3a
	.byte	0x7
	.byte	0
	.uleb128 0x1d
	.long	.LASF116
	.byte	0x30
	.byte	0x11
	.value	0x235
	.byte	0x8
	.long	0x709
	.uleb128 0xb
	.long	.LASF117
	.byte	0x11
	.value	0x237
	.byte	0x7
	.long	0x83
	.byte	0
	.uleb128 0xb
	.long	.LASF118
	.byte	0x11
	.value	0x238
	.byte	0x7
	.long	0x83
	.byte	0x4
	.uleb128 0xb
	.long	.LASF119
	.byte	0x11
	.value	0x239
	.byte	0x7
	.long	0x83
	.byte	0x8
	.uleb128 0xb
	.long	.LASF120
	.byte	0x11
	.value	0x23a
	.byte	0x7
	.long	0x83
	.byte	0xc
	.uleb128 0xb
	.long	.LASF121
	.byte	0x11
	.value	0x23b
	.byte	0xd
	.long	0x479
	.byte	0x10
	.uleb128 0xb
	.long	.LASF122
	.byte	0x11
	.value	0x23c
	.byte	0x14
	.long	0x521
	.byte	0x18
	.uleb128 0xb
	.long	.LASF123
	.byte	0x11
	.value	0x23d
	.byte	0x9
	.long	0xe5
	.byte	0x20
	.uleb128 0xb
	.long	.LASF124
	.byte	0x11
	.value	0x23e
	.byte	0x14
	.long	0x70e
	.byte	0x28
	.byte	0
	.uleb128 0x1c
	.long	0x68a
	.uleb128 0x5
	.long	0x68a
	.uleb128 0x5
	.long	0x709
	.uleb128 0x12
	.long	0x713
	.uleb128 0xd
	.byte	0x10
	.byte	0x5
	.long	.LASF125
	.uleb128 0xd
	.byte	0x10
	.byte	0x7
	.long	.LASF126
	.uleb128 0xd
	.byte	0x10
	.byte	0x4
	.long	.LASF127
	.uleb128 0x4
	.long	.LASF128
	.byte	0x12
	.byte	0x6a
	.byte	0x1a
	.long	0x743
	.uleb128 0x1c
	.long	0x732
	.uleb128 0x15
	.long	.LASF129
	.uleb128 0x4
	.long	.LASF130
	.byte	0x12
	.byte	0x6b
	.byte	0x1e
	.long	0x754
	.uleb128 0x15
	.long	.LASF131
	.uleb128 0x4
	.long	.LASF132
	.byte	0x12
	.byte	0xba
	.byte	0x1a
	.long	0x765
	.uleb128 0x15
	.long	.LASF133
	.uleb128 0x5
	.long	0x4f
	.uleb128 0x5
	.long	0x83
	.uleb128 0xe
	.long	0x4f
	.long	0x784
	.uleb128 0xf
	.long	0x3a
	.byte	0xf
	.byte	0
	.uleb128 0x5
	.long	0x73e
	.uleb128 0x31
	.byte	0x7
	.byte	0x4
	.long	0x41
	.byte	0x13
	.byte	0x75
	.byte	0x1
	.long	0x7c7
	.uleb128 0x1e
	.string	"GET"
	.byte	0
	.uleb128 0x1e
	.string	"PUT"
	.byte	0x1
	.uleb128 0x10
	.long	.LASF134
	.byte	0x2
	.uleb128 0x1e
	.string	"LS"
	.byte	0x3
	.uleb128 0x10
	.long	.LASF135
	.byte	0x4
	.uleb128 0x10
	.long	.LASF136
	.byte	0x5
	.uleb128 0x10
	.long	.LASF137
	.byte	0x6
	.uleb128 0x10
	.long	.LASF138
	.byte	0x7
	.byte	0
	.uleb128 0x4
	.long	.LASF139
	.byte	0x13
	.byte	0x7e
	.byte	0x3
	.long	0x789
	.uleb128 0x11
	.long	.LASF140
	.byte	0x28
	.byte	0x13
	.byte	0x83
	.byte	0x10
	.long	0x822
	.uleb128 0x2
	.long	.LASF141
	.byte	0x13
	.byte	0x84
	.byte	0x9
	.long	0x83
	.byte	0
	.uleb128 0x2
	.long	.LASF142
	.byte	0x13
	.byte	0x85
	.byte	0xb
	.long	0xe5
	.byte	0x8
	.uleb128 0x2
	.long	.LASF143
	.byte	0x13
	.byte	0x86
	.byte	0xb
	.long	0xe5
	.byte	0x10
	.uleb128 0x2
	.long	.LASF144
	.byte	0x13
	.byte	0x87
	.byte	0x9
	.long	0x83
	.byte	0x18
	.uleb128 0x2
	.long	.LASF145
	.byte	0x13
	.byte	0x88
	.byte	0x1d
	.long	0x822
	.byte	0x20
	.byte	0
	.uleb128 0x5
	.long	0x7d3
	.uleb128 0x4
	.long	.LASF140
	.byte	0x13
	.byte	0x89
	.byte	0x2
	.long	0x7d3
	.uleb128 0x32
	.byte	0x68
	.byte	0x13
	.byte	0x92
	.byte	0x9
	.long	0x8bf
	.uleb128 0x2
	.long	.LASF146
	.byte	0x13
	.byte	0x94
	.byte	0x9
	.long	0x83
	.byte	0
	.uleb128 0x2
	.long	.LASF147
	.byte	0x13
	.byte	0x95
	.byte	0xb
	.long	0xe5
	.byte	0x8
	.uleb128 0x2
	.long	.LASF148
	.byte	0x13
	.byte	0x96
	.byte	0xb
	.long	0xe5
	.byte	0x10
	.uleb128 0x2
	.long	.LASF149
	.byte	0x13
	.byte	0x97
	.byte	0x10
	.long	0x7c7
	.byte	0x18
	.uleb128 0x2
	.long	.LASF150
	.byte	0x13
	.byte	0x98
	.byte	0x16
	.long	0x8bf
	.byte	0x20
	.uleb128 0x2
	.long	.LASF151
	.byte	0x13
	.byte	0x99
	.byte	0x16
	.long	0x70e
	.byte	0x28
	.uleb128 0x2
	.long	.LASF152
	.byte	0x13
	.byte	0x9a
	.byte	0xa
	.long	0x76f
	.byte	0x30
	.uleb128 0x2
	.long	.LASF153
	.byte	0x13
	.byte	0x9b
	.byte	0x9
	.long	0x83
	.byte	0x38
	.uleb128 0x2
	.long	.LASF154
	.byte	0x13
	.byte	0x9c
	.byte	0x9
	.long	0x83
	.byte	0x3c
	.uleb128 0x2
	.long	.LASF155
	.byte	0x13
	.byte	0x9e
	.byte	0x15
	.long	0x43e
	.byte	0x40
	.byte	0
	.uleb128 0x5
	.long	0x827
	.uleb128 0x4
	.long	.LASF156
	.byte	0x13
	.byte	0x9f
	.byte	0x3
	.long	0x833
	.uleb128 0x11
	.long	.LASF157
	.byte	0xa
	.byte	0x1
	.byte	0x2e
	.byte	0x10
	.long	0x912
	.uleb128 0x2
	.long	.LASF147
	.byte	0x1
	.byte	0x30
	.byte	0xd
	.long	0x455
	.byte	0
	.uleb128 0x2
	.long	.LASF158
	.byte	0x1
	.byte	0x31
	.byte	0xd
	.long	0x455
	.byte	0x1
	.uleb128 0x2
	.long	.LASF159
	.byte	0x1
	.byte	0x32
	.byte	0xe
	.long	0x46d
	.byte	0x2
	.uleb128 0x2
	.long	.LASF160
	.byte	0x1
	.byte	0x33
	.byte	0xe
	.long	0x46d
	.byte	0x6
	.byte	0
	.uleb128 0x4
	.long	.LASF161
	.byte	0x1
	.byte	0x34
	.byte	0x3
	.long	0x8d0
	.uleb128 0x1f
	.long	.LASF183
	.byte	0x15
	.value	0x23d
	.byte	0xc
	.long	0x83
	.uleb128 0xc
	.long	.LASF162
	.byte	0x14
	.byte	0xbb
	.byte	0xe
	.long	0xe5
	.long	0x941
	.uleb128 0x1
	.long	0x2ef
	.byte	0
	.uleb128 0xc
	.long	.LASF163
	.byte	0x14
	.byte	0x9c
	.byte	0xc
	.long	0x83
	.long	0x95c
	.uleb128 0x1
	.long	0x2ef
	.uleb128 0x1
	.long	0x2ef
	.byte	0
	.uleb128 0xc
	.long	.LASF164
	.byte	0x14
	.byte	0x90
	.byte	0xe
	.long	0xe5
	.long	0x97c
	.uleb128 0x1
	.long	0xe5
	.uleb128 0x1
	.long	0x2ef
	.uleb128 0x1
	.long	0x3a
	.byte	0
	.uleb128 0x9
	.long	.LASF165
	.byte	0x14
	.value	0x111
	.byte	0xe
	.long	0xe5
	.long	0x998
	.uleb128 0x1
	.long	0x2ef
	.uleb128 0x1
	.long	0x83
	.byte	0
	.uleb128 0xc
	.long	.LASF166
	.byte	0x14
	.byte	0xf6
	.byte	0xe
	.long	0xe5
	.long	0x9b3
	.uleb128 0x1
	.long	0x2ef
	.uleb128 0x1
	.long	0x83
	.byte	0
	.uleb128 0xc
	.long	.LASF167
	.byte	0x6
	.byte	0xb8
	.byte	0xc
	.long	0x83
	.long	0x9c9
	.uleb128 0x1
	.long	0x305
	.byte	0
	.uleb128 0x9
	.long	.LASF168
	.byte	0x6
	.value	0x2df
	.byte	0xf
	.long	0x2e
	.long	0x9ef
	.uleb128 0x1
	.long	0x44a
	.uleb128 0x1
	.long	0x3a
	.uleb128 0x1
	.long	0x3a
	.uleb128 0x1
	.long	0x305
	.byte	0
	.uleb128 0x9
	.long	.LASF169
	.byte	0x6
	.value	0x193
	.byte	0xc
	.long	0x83
	.long	0xa0c
	.uleb128 0x1
	.long	0x48b
	.uleb128 0x1
	.long	0x2f4
	.uleb128 0x20
	.byte	0
	.uleb128 0xc
	.long	.LASF170
	.byte	0x14
	.byte	0x2b
	.byte	0xe
	.long	0x48
	.long	0xa2c
	.uleb128 0x1
	.long	0x48
	.uleb128 0x1
	.long	0x44a
	.uleb128 0x1
	.long	0x3a
	.byte	0
	.uleb128 0x9
	.long	.LASF171
	.byte	0x6
	.value	0x2d8
	.byte	0xf
	.long	0x2e
	.long	0xa52
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
	.long	.LASF172
	.byte	0x6
	.value	0x307
	.byte	0x11
	.long	0x96
	.long	0xa69
	.uleb128 0x1
	.long	0x305
	.byte	0
	.uleb128 0x9
	.long	.LASF173
	.byte	0x6
	.value	0x301
	.byte	0xc
	.long	0x83
	.long	0xa8a
	.uleb128 0x1
	.long	0x305
	.uleb128 0x1
	.long	0x96
	.uleb128 0x1
	.long	0x83
	.byte	0
	.uleb128 0x9
	.long	.LASF174
	.byte	0x6
	.value	0x108
	.byte	0xe
	.long	0x305
	.long	0xaa6
	.uleb128 0x1
	.long	0x2f4
	.uleb128 0x1
	.long	0x2f4
	.byte	0
	.uleb128 0xc
	.long	.LASF175
	.byte	0x14
	.byte	0x9f
	.byte	0xc
	.long	0x83
	.long	0xac6
	.uleb128 0x1
	.long	0x2ef
	.uleb128 0x1
	.long	0x2ef
	.uleb128 0x1
	.long	0x3a
	.byte	0
	.uleb128 0xc
	.long	.LASF176
	.byte	0x10
	.byte	0x91
	.byte	0x10
	.long	0x2f9
	.long	0xaeb
	.uleb128 0x1
	.long	0x83
	.uleb128 0x1
	.long	0x48
	.uleb128 0x1
	.long	0x2e
	.uleb128 0x1
	.long	0x83
	.byte	0
	.uleb128 0xc
	.long	.LASF177
	.byte	0x10
	.byte	0x8a
	.byte	0x10
	.long	0x2f9
	.long	0xb10
	.uleb128 0x1
	.long	0x83
	.uleb128 0x1
	.long	0x44a
	.uleb128 0x1
	.long	0x2e
	.uleb128 0x1
	.long	0x83
	.byte	0
	.uleb128 0x9
	.long	.LASF178
	.byte	0x14
	.value	0x197
	.byte	0xf
	.long	0x2e
	.long	0xb27
	.uleb128 0x1
	.long	0x2ef
	.byte	0
	.uleb128 0x9
	.long	.LASF179
	.byte	0x15
	.value	0x2a0
	.byte	0xe
	.long	0x48
	.long	0xb3e
	.uleb128 0x1
	.long	0x3a
	.byte	0
	.uleb128 0x21
	.long	.LASF195
	.byte	0x11
	.value	0x29a
	.byte	0xd
	.long	0xb51
	.uleb128 0x1
	.long	0x70e
	.byte	0
	.uleb128 0x9
	.long	.LASF180
	.byte	0x10
	.value	0x115
	.byte	0xc
	.long	0x83
	.long	0xb7c
	.uleb128 0x1
	.long	0x83
	.uleb128 0x1
	.long	0x83
	.uleb128 0x1
	.long	0x83
	.uleb128 0x1
	.long	0x44a
	.uleb128 0x1
	.long	0x479
	.byte	0
	.uleb128 0x9
	.long	.LASF181
	.byte	0x6
	.value	0x16b
	.byte	0xc
	.long	0x83
	.long	0xb94
	.uleb128 0x1
	.long	0x2ef
	.uleb128 0x20
	.byte	0
	.uleb128 0xc
	.long	.LASF182
	.byte	0x16
	.byte	0x40
	.byte	0x14
	.long	0x2ef
	.long	0xbb9
	.uleb128 0x1
	.long	0x83
	.uleb128 0x1
	.long	0x44f
	.uleb128 0x1
	.long	0xea
	.uleb128 0x1
	.long	0x479
	.byte	0
	.uleb128 0x26
	.long	.LASF184
	.byte	0x17
	.byte	0x22
	.byte	0x10
	.long	0xb5
	.uleb128 0x9
	.long	.LASF185
	.byte	0x14
	.value	0x1a3
	.byte	0xe
	.long	0xe5
	.long	0xbdc
	.uleb128 0x1
	.long	0x83
	.byte	0
	.uleb128 0x26
	.long	.LASF186
	.byte	0x18
	.byte	0x25
	.byte	0xd
	.long	0x76f
	.uleb128 0xc
	.long	.LASF187
	.byte	0x10
	.byte	0x7e
	.byte	0xc
	.long	0x83
	.long	0xc08
	.uleb128 0x1
	.long	0x83
	.uleb128 0x1
	.long	0x5bd
	.uleb128 0x1
	.long	0x479
	.byte	0
	.uleb128 0xc
	.long	.LASF188
	.byte	0x10
	.byte	0x66
	.byte	0xc
	.long	0x83
	.long	0xc28
	.uleb128 0x1
	.long	0x83
	.uleb128 0x1
	.long	0x83
	.uleb128 0x1
	.long	0x83
	.byte	0
	.uleb128 0x9
	.long	.LASF189
	.byte	0x6
	.value	0x165
	.byte	0xc
	.long	0x83
	.long	0xc45
	.uleb128 0x1
	.long	0x305
	.uleb128 0x1
	.long	0x2ef
	.uleb128 0x20
	.byte	0
	.uleb128 0x9
	.long	.LASF190
	.byte	0x11
	.value	0x29d
	.byte	0x14
	.long	0x2ef
	.long	0xc5c
	.uleb128 0x1
	.long	0x83
	.byte	0
	.uleb128 0x9
	.long	.LASF191
	.byte	0x11
	.value	0x294
	.byte	0xc
	.long	0x83
	.long	0xc82
	.uleb128 0x1
	.long	0x2f4
	.uleb128 0x1
	.long	0x2f4
	.uleb128 0x1
	.long	0x718
	.uleb128 0x1
	.long	0xc87
	.byte	0
	.uleb128 0x5
	.long	0x70e
	.uleb128 0x12
	.long	0xc82
	.uleb128 0x33
	.long	.LASF192
	.byte	0x15
	.value	0x2f4
	.byte	0xd
	.long	0xc9f
	.uleb128 0x1
	.long	0x83
	.byte	0
	.uleb128 0xc
	.long	.LASF193
	.byte	0x15
	.byte	0x69
	.byte	0xc
	.long	0x83
	.long	0xcb5
	.uleb128 0x1
	.long	0x2ef
	.byte	0
	.uleb128 0xc
	.long	.LASF194
	.byte	0x14
	.byte	0x3d
	.byte	0xe
	.long	0x48
	.long	0xcd5
	.uleb128 0x1
	.long	0x48
	.uleb128 0x1
	.long	0x83
	.uleb128 0x1
	.long	0x3a
	.byte	0
	.uleb128 0x21
	.long	.LASF196
	.byte	0x15
	.value	0x2af
	.byte	0xd
	.long	0xce8
	.uleb128 0x1
	.long	0x48
	.byte	0
	.uleb128 0x9
	.long	.LASF197
	.byte	0xc
	.value	0x166
	.byte	0xc
	.long	0x83
	.long	0xcff
	.uleb128 0x1
	.long	0x83
	.byte	0
	.uleb128 0x21
	.long	.LASF198
	.byte	0x19
	.value	0x2c0
	.byte	0x6
	.long	0xd12
	.uleb128 0x1
	.long	0xd12
	.byte	0
	.uleb128 0x5
	.long	0x748
	.uleb128 0x9
	.long	.LASF199
	.byte	0x19
	.value	0x2cf
	.byte	0xc
	.long	0x83
	.long	0xd38
	.uleb128 0x1
	.long	0xd12
	.uleb128 0x1
	.long	0x76a
	.uleb128 0x1
	.long	0xd38
	.byte	0
	.uleb128 0x5
	.long	0x41
	.uleb128 0x9
	.long	.LASF200
	.byte	0x19
	.value	0x2cd
	.byte	0xc
	.long	0x83
	.long	0xd5e
	.uleb128 0x1
	.long	0xd12
	.uleb128 0x1
	.long	0x44a
	.uleb128 0x1
	.long	0x2e
	.byte	0
	.uleb128 0x9
	.long	.LASF201
	.byte	0x19
	.value	0x2cb
	.byte	0xc
	.long	0x83
	.long	0xd7f
	.uleb128 0x1
	.long	0xd12
	.uleb128 0x1
	.long	0x784
	.uleb128 0x1
	.long	0xd7f
	.byte	0
	.uleb128 0x5
	.long	0x759
	.uleb128 0x1f
	.long	.LASF202
	.byte	0x19
	.value	0x391
	.byte	0xf
	.long	0x784
	.uleb128 0x1f
	.long	.LASF203
	.byte	0x19
	.value	0x2be
	.byte	0xd
	.long	0xd12
	.uleb128 0x22
	.long	.LASF225
	.value	0x404
	.byte	0x7
	.long	0x48
	.quad	.LFB333
	.quad	.LFE333-.LFB333
	.uleb128 0x1
	.byte	0x9c
	.long	0xdcf
	.uleb128 0x17
	.string	"sd"
	.value	0x404
	.byte	0x21
	.long	0xdcf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.long	0x8c4
	.uleb128 0x18
	.long	.LASF206
	.value	0x391
	.quad	.LFB332
	.quad	.LFE332-.LFB332
	.uleb128 0x1
	.byte	0x9c
	.long	0xe2b
	.uleb128 0x17
	.string	"sd"
	.value	0x391
	.byte	0x21
	.long	0xdcf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x7
	.string	"i"
	.value	0x397
	.byte	0x9
	.long	0x83
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x3
	.long	.LASF204
	.value	0x398
	.byte	0x9
	.long	0x83
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x3
	.long	.LASF205
	.value	0x399
	.byte	0x16
	.long	0x8bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x18
	.long	.LASF207
	.value	0x35e
	.quad	.LFB331
	.quad	.LFE331-.LFB331
	.uleb128 0x1
	.byte	0x9c
	.long	0xf94
	.uleb128 0x17
	.string	"sd"
	.value	0x35e
	.byte	0x21
	.long	0xdcf
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30840
	.uleb128 0x7
	.string	"i"
	.value	0x361
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30824
	.uleb128 0x3
	.long	.LASF208
	.value	0x361
	.byte	0x10
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30812
	.uleb128 0x3
	.long	.LASF205
	.value	0x362
	.byte	0x16
	.long	0x8bf
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30792
	.uleb128 0x3
	.long	.LASF209
	.value	0x364
	.byte	0xa
	.long	0xf94
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30768
	.uleb128 0x19
	.long	.LASF145
	.value	0x38a
	.byte	0x5
	.quad	.L176
	.uleb128 0x8
	.quad	.LBB41
	.quad	.LBE41-.LBB41
	.uleb128 0x3
	.long	.LASF210
	.value	0x36b
	.byte	0xd
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30808
	.uleb128 0x3
	.long	.LASF211
	.value	0x36c
	.byte	0xd
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30820
	.uleb128 0x8
	.quad	.LBB42
	.quad	.LBE42-.LBB42
	.uleb128 0x7
	.string	"j"
	.value	0x36d
	.byte	0x12
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30816
	.uleb128 0x8
	.quad	.LBB43
	.quad	.LBE43-.LBB43
	.uleb128 0x3
	.long	.LASF212
	.value	0x371
	.byte	0x1e
	.long	0x912
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30778
	.uleb128 0x6
	.quad	.LBB44
	.quad	.LBE44-.LBB44
	.long	0xf46
	.uleb128 0x3
	.long	.LASF208
	.value	0x377
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30804
	.byte	0
	.uleb128 0x6
	.quad	.LBB45
	.quad	.LBE45-.LBB45
	.long	0xf6d
	.uleb128 0x3
	.long	.LASF208
	.value	0x378
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30800
	.byte	0
	.uleb128 0x8
	.quad	.LBB46
	.quad	.LBE46-.LBB46
	.uleb128 0x3
	.long	.LASF208
	.value	0x37a
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
	.uleb128 0xe
	.long	0xef
	.long	0xfa5
	.uleb128 0x34
	.long	0x3a
	.value	0x77ff
	.byte	0
	.uleb128 0x18
	.long	.LASF213
	.value	0x2a2
	.quad	.LFB330
	.quad	.LFE330-.LFB330
	.uleb128 0x1
	.byte	0x9c
	.long	0x11c3
	.uleb128 0x17
	.string	"sd"
	.value	0x2a2
	.byte	0x1f
	.long	0xdcf
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30872
	.uleb128 0x7
	.string	"i"
	.value	0x2a6
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30848
	.uleb128 0x3
	.long	.LASF208
	.value	0x2a6
	.byte	0x10
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30820
	.uleb128 0x3
	.long	.LASF205
	.value	0x2a7
	.byte	0x16
	.long	0x8bf
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30808
	.uleb128 0x3
	.long	.LASF209
	.value	0x2a9
	.byte	0xa
	.long	0xf94
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30752
	.uleb128 0x1d
	.long	.LASF214
	.byte	0x20
	.byte	0x1
	.value	0x2ac
	.byte	0x14
	.long	0x104d
	.uleb128 0xb
	.long	.LASF148
	.byte	0x1
	.value	0x2ad
	.byte	0xf
	.long	0xe5
	.byte	0
	.uleb128 0xb
	.long	.LASF215
	.byte	0x1
	.value	0x2ae
	.byte	0xd
	.long	0x11c3
	.byte	0x8
	.uleb128 0xb
	.long	.LASF145
	.byte	0x1
	.value	0x2af
	.byte	0x1b
	.long	0x11d3
	.byte	0x18
	.byte	0
	.uleb128 0x25
	.long	.LASF216
	.byte	0x1
	.value	0x2b0
	.byte	0x7
	.long	0x1014
	.uleb128 0x3
	.long	.LASF217
	.value	0x2b2
	.byte	0x12
	.long	0x106b
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30800
	.uleb128 0x5
	.long	0x104d
	.uleb128 0x19
	.long	.LASF145
	.value	0x30a
	.byte	0x5
	.quad	.L141
	.uleb128 0x6
	.quad	.LBB33
	.quad	.LBE33-.LBB33
	.long	0x1114
	.uleb128 0x3
	.long	.LASF212
	.value	0x2bd
	.byte	0x1a
	.long	0x912
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30762
	.uleb128 0x3
	.long	.LASF218
	.value	0x2c6
	.byte	0xd
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30844
	.uleb128 0x35
	.long	.LLRL0
	.uleb128 0x3
	.long	.LASF219
	.value	0x2da
	.byte	0x13
	.long	0xe5
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30816
	.uleb128 0x3
	.long	.LASF158
	.value	0x2db
	.byte	0x11
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30852
	.uleb128 0x8
	.quad	.LBB35
	.quad	.LBE35-.LBB35
	.uleb128 0x3
	.long	.LASF220
	.value	0x2e1
	.byte	0x1e
	.long	0x106b
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30792
	.uleb128 0x3
	.long	.LASF221
	.value	0x2e2
	.byte	0x15
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30840
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x8
	.quad	.LBB37
	.quad	.LBE37-.LBB37
	.uleb128 0x3
	.long	.LASF220
	.value	0x31f
	.byte	0x16
	.long	0x106b
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30784
	.uleb128 0x8
	.quad	.LBB38
	.quad	.LBE38-.LBB38
	.uleb128 0x3
	.long	.LASF222
	.value	0x323
	.byte	0x11
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30836
	.uleb128 0x3
	.long	.LASF223
	.value	0x324
	.byte	0x11
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30832
	.uleb128 0x3
	.long	.LASF224
	.value	0x350
	.byte	0x1a
	.long	0x106b
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30776
	.uleb128 0x6
	.quad	.LBB39
	.quad	.LBE39-.LBB39
	.long	0x119f
	.uleb128 0x7
	.string	"j"
	.value	0x326
	.byte	0x16
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30828
	.byte	0
	.uleb128 0x8
	.quad	.LBB40
	.quad	.LBE40-.LBB40
	.uleb128 0x7
	.string	"j"
	.value	0x33f
	.byte	0x16
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30824
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xe
	.long	0x83
	.long	0x11d3
	.uleb128 0xf
	.long	0x3a
	.byte	0x3
	.byte	0
	.uleb128 0x5
	.long	0x1014
	.uleb128 0x22
	.long	.LASF226
	.value	0x27a
	.byte	0x5
	.long	0x83
	.quad	.LFB329
	.quad	.LFE329-.LFB329
	.uleb128 0x1
	.byte	0x9c
	.long	0x1256
	.uleb128 0x1b
	.long	.LASF227
	.value	0x27a
	.byte	0x27
	.long	0x2ef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1b
	.long	.LASF219
	.value	0x27a
	.byte	0x3f
	.long	0x486
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1b
	.long	.LASF158
	.value	0x27a
	.byte	0x57
	.long	0x76f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x3
	.long	.LASF228
	.value	0x27d
	.byte	0x11
	.long	0x2ef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x3
	.long	.LASF229
	.value	0x288
	.byte	0x11
	.long	0x2ef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x3
	.long	.LASF230
	.value	0x292
	.byte	0xc
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x22
	.long	.LASF231
	.value	0x255
	.byte	0x7
	.long	0xe5
	.quad	.LFB328
	.quad	.LFE328-.LFB328
	.uleb128 0x1
	.byte	0x9c
	.long	0x12c4
	.uleb128 0x1b
	.long	.LASF227
	.value	0x255
	.byte	0x2d
	.long	0x2ef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x3
	.long	.LASF232
	.value	0x258
	.byte	0x11
	.long	0x2ef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x3
	.long	.LASF229
	.value	0x262
	.byte	0x11
	.long	0x2ef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x3
	.long	.LASF230
	.value	0x269
	.byte	0xc
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x3
	.long	.LASF219
	.value	0x26c
	.byte	0xb
	.long	0xe5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x18
	.long	.LASF233
	.value	0x157
	.quad	.LFB327
	.quad	.LFE327-.LFB327
	.uleb128 0x1
	.byte	0x9c
	.long	0x16db
	.uleb128 0x17
	.string	"sd"
	.value	0x157
	.byte	0x1e
	.long	0xdcf
	.uleb128 0x4
	.byte	0x91
	.sleb128 -31000
	.uleb128 0x3
	.long	.LASF210
	.value	0x15c
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30908
	.uleb128 0x7
	.string	"i"
	.value	0x15e
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30980
	.uleb128 0x3
	.long	.LASF208
	.value	0x15e
	.byte	0x10
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30904
	.uleb128 0x3
	.long	.LASF205
	.value	0x15f
	.byte	0x16
	.long	0x8bf
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30872
	.uleb128 0x3
	.long	.LASF234
	.value	0x163
	.byte	0x9
	.long	0x11c3
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30832
	.uleb128 0x3
	.long	.LASF235
	.value	0x164
	.byte	0x9
	.long	0x11c3
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30816
	.uleb128 0x3
	.long	.LASF236
	.value	0x165
	.byte	0xb
	.long	0x16db
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30800
	.uleb128 0x3
	.long	.LASF209
	.value	0x166
	.byte	0xa
	.long	0xf94
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30768
	.uleb128 0x3
	.long	.LASF237
	.value	0x167
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30976
	.uleb128 0x3
	.long	.LASF238
	.value	0x16f
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30972
	.uleb128 0x3
	.long	.LASF239
	.value	0x170
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30968
	.uleb128 0x19
	.long	.LASF145
	.value	0x1ec
	.byte	0x5
	.quad	.L68
	.uleb128 0x19
	.long	.LASF240
	.value	0x1e4
	.byte	0x9
	.quad	.L85
	.uleb128 0x3
	.long	.LASF223
	.value	0x207
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30936
	.uleb128 0x3
	.long	.LASF148
	.value	0x226
	.byte	0xb
	.long	0xe5
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30848
	.uleb128 0x7
	.string	"fs"
	.value	0x22c
	.byte	0xb
	.long	0x305
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30856
	.uleb128 0x3
	.long	.LASF241
	.value	0x23b
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30920
	.uleb128 0x6
	.quad	.LBB15
	.quad	.LBE15-.LBB15
	.long	0x1600
	.uleb128 0x3
	.long	.LASF211
	.value	0x180
	.byte	0xd
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30964
	.uleb128 0x6
	.quad	.LBB16
	.quad	.LBE16-.LBB16
	.long	0x1458
	.uleb128 0x7
	.string	"j"
	.value	0x183
	.byte	0x12
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30960
	.byte	0
	.uleb128 0x8
	.quad	.LBB17
	.quad	.LBE17-.LBB17
	.uleb128 0x7
	.string	"j"
	.value	0x18b
	.byte	0x12
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30956
	.uleb128 0x8
	.quad	.LBB18
	.quad	.LBE18-.LBB18
	.uleb128 0x3
	.long	.LASF212
	.value	0x198
	.byte	0x1e
	.long	0x912
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30848
	.uleb128 0x3
	.long	.LASF242
	.value	0x1a0
	.byte	0x1c
	.long	0x76a
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30864
	.uleb128 0x3
	.long	.LASF243
	.value	0x1be
	.byte	0x11
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30884
	.uleb128 0x3
	.long	.LASF244
	.value	0x1c9
	.byte	0x11
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30944
	.uleb128 0x6
	.quad	.LBB19
	.quad	.LBE19-.LBB19
	.long	0x14f2
	.uleb128 0x7
	.string	"i"
	.value	0x1a1
	.byte	0x16
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30952
	.byte	0
	.uleb128 0x6
	.quad	.LBB20
	.quad	.LBE20-.LBB20
	.long	0x1519
	.uleb128 0x3
	.long	.LASF208
	.value	0x1a6
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30900
	.byte	0
	.uleb128 0x6
	.quad	.LBB21
	.quad	.LBE21-.LBB21
	.long	0x1540
	.uleb128 0x3
	.long	.LASF208
	.value	0x1a7
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30896
	.byte	0
	.uleb128 0x6
	.quad	.LBB22
	.quad	.LBE22-.LBB22
	.long	0x1567
	.uleb128 0x3
	.long	.LASF208
	.value	0x1aa
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30892
	.byte	0
	.uleb128 0x6
	.quad	.LBB23
	.quad	.LBE23-.LBB23
	.long	0x158e
	.uleb128 0x3
	.long	.LASF208
	.value	0x1b5
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30888
	.byte	0
	.uleb128 0x6
	.quad	.LBB24
	.quad	.LBE24-.LBB24
	.long	0x15b3
	.uleb128 0x7
	.string	"i"
	.value	0x1b9
	.byte	0x16
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30948
	.byte	0
	.uleb128 0x6
	.quad	.LBB25
	.quad	.LBE25-.LBB25
	.long	0x15da
	.uleb128 0x3
	.long	.LASF208
	.value	0x1cd
	.byte	0x1c
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30876
	.byte	0
	.uleb128 0x8
	.quad	.LBB26
	.quad	.LBE26-.LBB26
	.uleb128 0x3
	.long	.LASF208
	.value	0x1d9
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
	.quad	.LBB27
	.quad	.LBE27-.LBB27
	.long	0x1625
	.uleb128 0x7
	.string	"i"
	.value	0x1fc
	.byte	0xe
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30940
	.byte	0
	.uleb128 0x6
	.quad	.LBB28
	.quad	.LBE28-.LBB28
	.long	0x164a
	.uleb128 0x7
	.string	"i"
	.value	0x208
	.byte	0xe
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30932
	.byte	0
	.uleb128 0x6
	.quad	.LBB29
	.quad	.LBE29-.LBB29
	.long	0x166f
	.uleb128 0x7
	.string	"i"
	.value	0x21b
	.byte	0x12
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30928
	.byte	0
	.uleb128 0x6
	.quad	.LBB30
	.quad	.LBE30-.LBB30
	.long	0x1694
	.uleb128 0x7
	.string	"i"
	.value	0x231
	.byte	0x12
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30924
	.byte	0
	.uleb128 0x6
	.quad	.LBB31
	.quad	.LBE31-.LBB31
	.long	0x16b9
	.uleb128 0x7
	.string	"i"
	.value	0x23c
	.byte	0xe
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30916
	.byte	0
	.uleb128 0x8
	.quad	.LBB32
	.quad	.LBE32-.LBB32
	.uleb128 0x7
	.string	"i"
	.value	0x241
	.byte	0xe
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30912
	.byte	0
	.byte	0
	.uleb128 0xe
	.long	0xe5
	.long	0x16eb
	.uleb128 0xf
	.long	0x3a
	.byte	0x3
	.byte	0
	.uleb128 0x18
	.long	.LASF245
	.value	0x129
	.quad	.LFB326
	.quad	.LFE326-.LFB326
	.uleb128 0x1
	.byte	0x9c
	.long	0x17c8
	.uleb128 0x17
	.string	"sd"
	.value	0x129
	.byte	0x1e
	.long	0xdcf
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x7
	.string	"fs"
	.value	0x12b
	.byte	0xb
	.long	0x305
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x3
	.long	.LASF210
	.value	0x131
	.byte	0xe
	.long	0x46d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x3
	.long	.LASF246
	.value	0x134
	.byte	0x9
	.long	0x83
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.uleb128 0x3
	.long	.LASF247
	.value	0x137
	.byte	0x9
	.long	0x11c3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x3
	.long	.LASF236
	.value	0x138
	.byte	0xb
	.long	0x16db
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x3
	.long	.LASF248
	.value	0x139
	.byte	0x9
	.long	0x83
	.uleb128 0x3
	.byte	0x91
	.sleb128 -116
	.uleb128 0x8
	.quad	.LBB13
	.quad	.LBE13-.LBB13
	.uleb128 0x7
	.string	"i"
	.value	0x140
	.byte	0xe
	.long	0x83
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x8
	.quad	.LBB14
	.quad	.LBE14-.LBB14
	.uleb128 0x3
	.long	.LASF249
	.value	0x142
	.byte	0xd
	.long	0x83
	.uleb128 0x3
	.byte	0x91
	.sleb128 -108
	.uleb128 0x3
	.long	.LASF250
	.value	0x14b
	.byte	0xf
	.long	0xe5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x23
	.long	.LASF251
	.byte	0xc9
	.quad	.LFB325
	.quad	.LFE325-.LFB325
	.uleb128 0x1
	.byte	0x9c
	.long	0x19c3
	.uleb128 0x1a
	.string	"sd"
	.byte	0xc9
	.byte	0x2c
	.long	0xdcf
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30856
	.uleb128 0x13
	.long	.LASF236
	.byte	0xc9
	.byte	0x36
	.long	0x486
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30864
	.uleb128 0x13
	.long	.LASF247
	.byte	0xc9
	.byte	0x44
	.long	0x76f
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30872
	.uleb128 0x13
	.long	.LASF210
	.byte	0xc9
	.byte	0x57
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30876
	.uleb128 0xa
	.long	.LASF205
	.byte	0xd0
	.byte	0x16
	.long	0x8bf
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30808
	.uleb128 0x14
	.string	"i"
	.byte	0xd1
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30848
	.uleb128 0xa
	.long	.LASF208
	.byte	0xd1
	.byte	0x10
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30824
	.uleb128 0xa
	.long	.LASF234
	.byte	0xd4
	.byte	0x9
	.long	0x11c3
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30784
	.uleb128 0xa
	.long	.LASF209
	.byte	0xd5
	.byte	0xa
	.long	0xf94
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30768
	.uleb128 0x19
	.long	.LASF145
	.value	0x109
	.byte	0x5
	.quad	.L36
	.uleb128 0x6
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.long	0x19a1
	.uleb128 0xa
	.long	.LASF211
	.byte	0xde
	.byte	0xd
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30844
	.uleb128 0x6
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.long	0x18ca
	.uleb128 0x14
	.string	"j"
	.byte	0xe2
	.byte	0x12
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30840
	.byte	0
	.uleb128 0x8
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.uleb128 0x14
	.string	"j"
	.byte	0xe8
	.byte	0x12
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30836
	.uleb128 0x8
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.uleb128 0xa
	.long	.LASF252
	.byte	0xee
	.byte	0x1e
	.long	0x912
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30794
	.uleb128 0x6
	.quad	.LBB8
	.quad	.LBE8-.LBB8
	.long	0x1930
	.uleb128 0xa
	.long	.LASF208
	.byte	0xf4
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30828
	.byte	0
	.uleb128 0x6
	.quad	.LBB9
	.quad	.LBE9-.LBB9
	.long	0x1956
	.uleb128 0xa
	.long	.LASF208
	.byte	0xf6
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30820
	.byte	0
	.uleb128 0x6
	.quad	.LBB10
	.quad	.LBE10-.LBB10
	.long	0x197c
	.uleb128 0xa
	.long	.LASF208
	.byte	0xf8
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30816
	.byte	0
	.uleb128 0x8
	.quad	.LBB11
	.quad	.LBE11-.LBB11
	.uleb128 0xa
	.long	.LASF208
	.byte	0xfb
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30812
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x8
	.quad	.LBB12
	.quad	.LBE12-.LBB12
	.uleb128 0x7
	.string	"i"
	.value	0x10f
	.byte	0xe
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30832
	.byte	0
	.byte	0
	.uleb128 0x36
	.long	.LASF253
	.byte	0x1
	.byte	0x7d
	.byte	0x5
	.long	0x83
	.quad	.LFB324
	.quad	.LFE324-.LFB324
	.uleb128 0x1
	.byte	0x9c
	.long	0x1a6a
	.uleb128 0x1a
	.string	"sd"
	.byte	0x7d
	.byte	0x23
	.long	0xdcf
	.uleb128 0x3
	.byte	0x91
	.sleb128 -184
	.uleb128 0x13
	.long	.LASF205
	.byte	0x7d
	.byte	0x38
	.long	0x8bf
	.uleb128 0x3
	.byte	0x91
	.sleb128 -192
	.uleb128 0x13
	.long	.LASF254
	.byte	0x7d
	.byte	0x45
	.long	0x83
	.uleb128 0x3
	.byte	0x91
	.sleb128 -196
	.uleb128 0xa
	.long	.LASF255
	.byte	0x7f
	.byte	0x15
	.long	0x68a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0xa
	.long	.LASF224
	.byte	0x7f
	.byte	0x1d
	.long	0x70e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0xa
	.long	.LASF256
	.byte	0x80
	.byte	0x9
	.long	0x83
	.uleb128 0x3
	.byte	0x91
	.sleb128 -172
	.uleb128 0x37
	.long	.LASF257
	.byte	0x1
	.byte	0xc4
	.byte	0x1
	.quad	.L23
	.uleb128 0x14
	.string	"s"
	.byte	0xb6
	.byte	0xa
	.long	0x1a6a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x14
	.string	"tv"
	.byte	0xbb
	.byte	0x14
	.long	0x322
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.byte	0
	.uleb128 0xe
	.long	0xef
	.long	0x1a7a
	.uleb128 0xf
	.long	0x3a
	.byte	0x2d
	.byte	0
	.uleb128 0x23
	.long	.LASF258
	.byte	0x6d
	.quad	.LFB323
	.quad	.LFE323-.LFB323
	.uleb128 0x1
	.byte	0x9c
	.long	0x1ad2
	.uleb128 0x1a
	.string	"sd"
	.byte	0x6d
	.byte	0x28
	.long	0xdcf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xa
	.long	.LASF205
	.byte	0x6f
	.byte	0x16
	.long	0x8bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x8
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0xa
	.long	.LASF224
	.byte	0x72
	.byte	0x1a
	.long	0x8bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x23
	.long	.LASF259
	.byte	0x61
	.quad	.LFB322
	.quad	.LFE322-.LFB322
	.uleb128 0x1
	.byte	0x9c
	.long	0x1afd
	.uleb128 0x13
	.long	.LASF205
	.byte	0x61
	.byte	0x32
	.long	0x8bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x38
	.long	.LASF260
	.byte	0x1
	.byte	0x57
	.byte	0x7
	.long	0x48
	.quad	.LFB321
	.quad	.LFE321-.LFB321
	.uleb128 0x1
	.byte	0x9c
	.long	0x1b2d
	.uleb128 0x1a
	.string	"sa"
	.byte	0x57
	.byte	0x24
	.long	0x521
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x39
	.long	.LASF261
	.byte	0x1
	.byte	0x37
	.byte	0xa
	.long	0x46d
	.quad	.LFB320
	.quad	.LFE320-.LFB320
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1a
	.string	"str"
	.byte	0x37
	.byte	0x18
	.long	0xe5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x13
	.long	.LASF262
	.byte	0x37
	.byte	0x21
	.long	0x83
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.uleb128 0xa
	.long	.LASF263
	.byte	0x39
	.byte	0x11
	.long	0xd12
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x14
	.string	"md"
	.byte	0x3a
	.byte	0x13
	.long	0x784
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xa
	.long	.LASF264
	.byte	0x3c
	.byte	0x12
	.long	0x41
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0xa
	.long	.LASF265
	.byte	0x3d
	.byte	0x13
	.long	0x774
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xa
	.long	.LASF210
	.byte	0x4e
	.byte	0xe
	.long	0x46d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x8
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x14
	.string	"n"
	.byte	0x4f
	.byte	0xe
	.long	0x83
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
	.uleb128 0x3
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
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x12
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
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
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x20
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x28
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x29
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
	.uleb128 0x2a
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
	.uleb128 0x2b
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
	.uleb128 0x2c
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2d
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
	.uleb128 0x2e
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x30
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
	.uleb128 0x31
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
	.uleb128 0x32
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
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x39
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
	.uleb128 .LBB34-.Ltext0
	.uleb128 .LBE34-.Ltext0
	.byte	0x4
	.uleb128 .LBB36-.Ltext0
	.uleb128 .LBE36-.Ltext0
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF103:
	.string	"sin6_flowinfo"
.LASF40:
	.string	"_shortbuf"
.LASF183:
	.string	"rand"
.LASF165:
	.string	"strrchr"
.LASF47:
	.string	"_prevchain"
.LASF213:
	.string	"list_file"
.LASF267:
	.string	"_IO_lock_t"
.LASF264:
	.string	"md_len"
.LASF178:
	.string	"strlen"
.LASF260:
	.string	"get_in_addr"
.LASF208:
	.string	"numbytes"
.LASF175:
	.string	"strncmp"
.LASF29:
	.string	"_IO_buf_end"
.LASF252:
	.string	"message"
.LASF92:
	.string	"sockaddr"
.LASF157:
	.string	"message_header_s"
.LASF161:
	.string	"message_header_t"
.LASF105:
	.string	"sin6_scope_id"
.LASF27:
	.string	"_IO_write_end"
.LASF3:
	.string	"unsigned int"
.LASF145:
	.string	"next"
.LASF45:
	.string	"_freeres_list"
.LASF21:
	.string	"_flags"
.LASF240:
	.string	"chunk_failed"
.LASF269:
	.string	"__socket_type"
.LASF228:
	.string	"filename_part"
.LASF185:
	.string	"strerror"
.LASF212:
	.string	"message_header"
.LASF33:
	.string	"_markers"
.LASF191:
	.string	"getaddrinfo"
.LASF234:
	.string	"chunks_stored"
.LASF148:
	.string	"filename"
.LASF253:
	.string	"connect_server"
.LASF132:
	.string	"ENGINE"
.LASF135:
	.string	"EXIT"
.LASF249:
	.string	"chunk_size"
.LASF152:
	.string	"server_sock_fds"
.LASF221:
	.string	"found"
.LASF231:
	.string	"extract_original_filename"
.LASF241:
	.string	"total_file_size"
.LASF141:
	.string	"client_sock_fd"
.LASF250:
	.string	"chunk"
.LASF177:
	.string	"send"
.LASF239:
	.string	"servers_available"
.LASF61:
	.string	"__pthread_internal_list"
.LASF80:
	.string	"uint32_t"
.LASF62:
	.string	"__prev"
.LASF107:
	.string	"in_addr_t"
.LASF32:
	.string	"_IO_save_end"
.LASF67:
	.string	"__count"
.LASF128:
	.string	"EVP_MD"
.LASF245:
	.string	"put_file"
.LASF203:
	.string	"EVP_MD_CTX_new"
.LASF133:
	.string	"engine_st"
.LASF179:
	.string	"malloc"
.LASF116:
	.string	"addrinfo"
.LASF211:
	.string	"index"
.LASF60:
	.string	"long long unsigned int"
.LASF160:
	.string	"data_length"
.LASF219:
	.string	"original_filename"
.LASF158:
	.string	"chunk_id"
.LASF111:
	.string	"__u6_addr8"
.LASF164:
	.string	"strncpy"
.LASF257:
	.string	"cleanup"
.LASF207:
	.string	"delete_file"
.LASF96:
	.string	"sin_family"
.LASF10:
	.string	"__uint16_t"
.LASF204:
	.string	"servers_online"
.LASF68:
	.string	"__owner"
.LASF42:
	.string	"_offset"
.LASF73:
	.string	"__list"
.LASF110:
	.string	"in_port_t"
.LASF72:
	.string	"__elision"
.LASF189:
	.string	"fprintf"
.LASF35:
	.string	"_fileno"
.LASF57:
	.string	"timeval"
.LASF190:
	.string	"gai_strerror"
.LASF99:
	.string	"sin_zero"
.LASF109:
	.string	"s_addr"
.LASF243:
	.string	"data_size"
.LASF7:
	.string	"size_t"
.LASF91:
	.string	"sa_family_t"
.LASF39:
	.string	"_vtable_offset"
.LASF122:
	.string	"ai_addr"
.LASF24:
	.string	"_IO_read_base"
.LASF217:
	.string	"file_list"
.LASF59:
	.string	"tv_usec"
.LASF104:
	.string	"sin6_addr"
.LASF196:
	.string	"free"
.LASF163:
	.string	"strcmp"
.LASF216:
	.string	"file_info_t"
.LASF255:
	.string	"hints"
.LASF136:
	.string	"SERVER_INFO"
.LASF63:
	.string	"__next"
.LASF19:
	.string	"char"
.LASF150:
	.string	"servers_details"
.LASF48:
	.string	"_mode"
.LASF248:
	.string	"total_chunk_size_until_now"
.LASF51:
	.string	"_IO_marker"
.LASF197:
	.string	"close"
.LASF186:
	.string	"__errno_location"
.LASF182:
	.string	"inet_ntop"
.LASF192:
	.string	"exit"
.LASF198:
	.string	"EVP_MD_CTX_free"
.LASF87:
	.string	"SOCK_DCCP"
.LASF71:
	.string	"__spins"
.LASF149:
	.string	"command_int"
.LASF236:
	.string	"chunks"
.LASF78:
	.string	"uint8_t"
.LASF256:
	.string	"status"
.LASF88:
	.string	"SOCK_PACKET"
.LASF268:
	.string	"stderr"
.LASF235:
	.string	"chunks_stored_sizes"
.LASF200:
	.string	"EVP_DigestUpdate"
.LASF131:
	.string	"evp_md_ctx_st"
.LASF25:
	.string	"_IO_write_base"
.LASF83:
	.string	"SOCK_DGRAM"
.LASF15:
	.string	"__pid_t"
.LASF140:
	.string	"serverDetails_t"
.LASF55:
	.string	"long long int"
.LASF181:
	.string	"printf"
.LASF155:
	.string	"lock"
.LASF30:
	.string	"_IO_save_base"
.LASF97:
	.string	"sin_port"
.LASF134:
	.string	"DELETE"
.LASF229:
	.string	"last_underscore"
.LASF263:
	.string	"context"
.LASF220:
	.string	"file_entry"
.LASF113:
	.string	"__u6_addr32"
.LASF124:
	.string	"ai_next"
.LASF199:
	.string	"EVP_DigestFinal_ex"
.LASF137:
	.string	"HELP"
.LASF173:
	.string	"fseek"
.LASF194:
	.string	"memset"
.LASF156:
	.string	"sockDetails_t"
.LASF218:
	.string	"files_found"
.LASF251:
	.string	"connect_and_put_chunks"
.LASF246:
	.string	"size"
.LASF46:
	.string	"_freeres_buf"
.LASF54:
	.string	"ssize_t"
.LASF147:
	.string	"command"
.LASF115:
	.string	"__in6_u"
.LASF98:
	.string	"sin_addr"
.LASF70:
	.string	"__kind"
.LASF172:
	.string	"ftell"
.LASF2:
	.string	"long unsigned int"
.LASF123:
	.string	"ai_canonname"
.LASF222:
	.string	"chunks_available"
.LASF174:
	.string	"fopen"
.LASF247:
	.string	"chunk_sizes"
.LASF184:
	.string	"gettid"
.LASF64:
	.string	"__pthread_list_t"
.LASF127:
	.string	"long double"
.LASF79:
	.string	"uint16_t"
.LASF238:
	.string	"servers_contacted"
.LASF237:
	.string	"total_chunks_downloaded"
.LASF266:
	.string	"GNU C17 14.2.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF118:
	.string	"ai_family"
.LASF226:
	.string	"parse_server_filename"
.LASF82:
	.string	"SOCK_STREAM"
.LASF112:
	.string	"__u6_addr16"
.LASF244:
	.string	"total_bytes"
.LASF180:
	.string	"setsockopt"
.LASF23:
	.string	"_IO_read_end"
.LASF206:
	.string	"server_info"
.LASF166:
	.string	"strchr"
.LASF101:
	.string	"sin6_family"
.LASF9:
	.string	"short int"
.LASF187:
	.string	"connect"
.LASF258:
	.string	"cleanup_connection"
.LASF12:
	.string	"long int"
.LASF242:
	.string	"bytes"
.LASF210:
	.string	"hash"
.LASF262:
	.string	"length"
.LASF171:
	.string	"fread"
.LASF138:
	.string	"number_of_command"
.LASF224:
	.string	"temp"
.LASF53:
	.string	"_IO_wide_data"
.LASF230:
	.string	"original_len"
.LASF167:
	.string	"fclose"
.LASF223:
	.string	"can_rebuild"
.LASF151:
	.string	"connect_to_info"
.LASF188:
	.string	"socket"
.LASF214:
	.string	"file_info"
.LASF18:
	.string	"__ssize_t"
.LASF95:
	.string	"sockaddr_in"
.LASF201:
	.string	"EVP_DigestInit_ex"
.LASF8:
	.string	"__uint8_t"
.LASF74:
	.string	"__data"
.LASF89:
	.string	"SOCK_CLOEXEC"
.LASF28:
	.string	"_IO_buf_base"
.LASF69:
	.string	"__nusers"
.LASF44:
	.string	"_wide_data"
.LASF232:
	.string	"first_underscore"
.LASF106:
	.string	"__CONST_SOCKADDR_ARG"
.LASF41:
	.string	"_lock"
.LASF58:
	.string	"tv_sec"
.LASF265:
	.string	"digest"
.LASF114:
	.string	"in6_addr"
.LASF146:
	.string	"sockfd"
.LASF130:
	.string	"EVP_MD_CTX"
.LASF52:
	.string	"_IO_codecvt"
.LASF37:
	.string	"_old_offset"
.LASF56:
	.string	"_IO_FILE"
.LASF84:
	.string	"SOCK_RAW"
.LASF77:
	.string	"pthread_mutex_t"
.LASF66:
	.string	"__lock"
.LASF125:
	.string	"__int128"
.LASF108:
	.string	"in_addr"
.LASF120:
	.string	"ai_protocol"
.LASF119:
	.string	"ai_socktype"
.LASF202:
	.string	"EVP_md5"
.LASF4:
	.string	"unsigned char"
.LASF215:
	.string	"chunks_present"
.LASF11:
	.string	"__uint32_t"
.LASF169:
	.string	"asprintf"
.LASF20:
	.string	"__socklen_t"
.LASF261:
	.string	"str2md5"
.LASF225:
	.string	"handle_req"
.LASF26:
	.string	"_IO_write_ptr"
.LASF86:
	.string	"SOCK_SEQPACKET"
.LASF259:
	.string	"cleanup_current_connection"
.LASF31:
	.string	"_IO_backup_base"
.LASF17:
	.string	"__suseconds_t"
.LASF153:
	.string	"number_of_servers"
.LASF16:
	.string	"__time_t"
.LASF209:
	.string	"recieve_buffer"
.LASF227:
	.string	"server_filename"
.LASF43:
	.string	"_codecvt"
.LASF144:
	.string	"dfsno"
.LASF142:
	.string	"server_port"
.LASF117:
	.string	"ai_flags"
.LASF168:
	.string	"fwrite"
.LASF129:
	.string	"evp_md_st"
.LASF13:
	.string	"__off_t"
.LASF176:
	.string	"recv"
.LASF154:
	.string	"number_of_available_servers"
.LASF6:
	.string	"signed char"
.LASF93:
	.string	"sa_family"
.LASF162:
	.string	"strdup"
.LASF5:
	.string	"short unsigned int"
.LASF170:
	.string	"memcpy"
.LASF143:
	.string	"server_ip"
.LASF193:
	.string	"atoi"
.LASF205:
	.string	"current"
.LASF90:
	.string	"SOCK_NONBLOCK"
.LASF22:
	.string	"_IO_read_ptr"
.LASF159:
	.string	"filename_length"
.LASF233:
	.string	"get_file"
.LASF126:
	.string	"__int128 unsigned"
.LASF76:
	.string	"__align"
.LASF34:
	.string	"_chain"
.LASF121:
	.string	"ai_addrlen"
.LASF139:
	.string	"commands_t"
.LASF50:
	.string	"FILE"
.LASF36:
	.string	"_flags2"
.LASF81:
	.string	"socklen_t"
.LASF254:
	.string	"server_index"
.LASF102:
	.string	"sin6_port"
.LASF75:
	.string	"__size"
.LASF195:
	.string	"freeaddrinfo"
.LASF38:
	.string	"_cur_column"
.LASF100:
	.string	"sockaddr_in6"
.LASF94:
	.string	"sa_data"
.LASF14:
	.string	"__off64_t"
.LASF49:
	.string	"_unused2"
.LASF85:
	.string	"SOCK_RDM"
.LASF65:
	.string	"__pthread_mutex_s"
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
