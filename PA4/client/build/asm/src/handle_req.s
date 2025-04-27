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
	.loc 1 127 1
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
	.loc 1 127 1
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 1 129 9
	movl	$1, -156(%rbp)
	.loc 1 131 39
	movq	-168(%rbp), %rax
	movl	-180(%rbp), %edx
	movslq	%edx, %rdx
	addq	$12, %rdx
	movl	$-1, (%rax,%rdx,4)
	.loc 1 132 29
	movq	-176(%rbp), %rax
	movl	$-1, (%rax)
	.loc 1 135 5
	leaq	-128(%rbp), %rax
	movl	$48, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 136 21
	movl	$0, -124(%rbp)
	.loc 1 137 23
	movl	$1, -120(%rbp)
	.loc 1 139 21
	movq	-176(%rbp), %rax
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
	movq	-168(%rbp), %rax
	leaq	40(%rax), %rcx
	.loc 1 145 58
	movq	-176(%rbp), %rax
	movq	8(%rax), %rsi
	.loc 1 145 38
	movq	-176(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 145 19
	leaq	-128(%rbp), %rdx
	movq	%rax, %rdi
	call	getaddrinfo@PLT
	movl	%eax, -156(%rbp)
	.loc 1 145 8 discriminator 1
	cmpl	$0, -156(%rbp)
	jns	.L22
	.loc 1 147 9
	movl	-156(%rbp), %eax
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
	movl	$-1, -156(%rbp)
	.loc 1 149 9
	jmp	.L23
.L22:
	.loc 1 152 15
	movq	-168(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -152(%rbp)
	.loc 1 152 5
	nop
	.loc 1 152 43 discriminator 1
	cmpq	$0, -152(%rbp)
	je	.L27
	.loc 1 154 40
	movq	-152(%rbp), %rax
	movl	12(%rax), %edx
	movq	-152(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-152(%rbp), %rax
	movl	4(%rax), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	socket@PLT
	.loc 1 154 38 discriminator 1
	movq	-176(%rbp), %rdx
	movl	%eax, (%rdx)
	.loc 1 154 21 discriminator 1
	movq	-176(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 154 12 discriminator 1
	testl	%eax, %eax
	jns	.L25
	.loc 1 156 13
	movq	-176(%rbp), %rax
	movq	8(%rax), %rcx
	movq	-176(%rbp), %rax
	movq	16(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 157 20
	movl	$-1, -156(%rbp)
	.loc 1 158 13
	jmp	.L23
.L25:
	.loc 1 161 14
	movq	-152(%rbp), %rax
	movl	16(%rax), %edx
	.loc 1 161 51
	movq	-152(%rbp), %rax
	movq	24(%rax), %rax
	.loc 1 161 14
	movq	%rax, %rcx
	movq	-176(%rbp), %rax
	movl	(%rax), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	connect@PLT
	.loc 1 161 12 discriminator 1
	testl	%eax, %eax
	jns	.L32
	.loc 1 163 13
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
	.loc 1 164 87
	call	__errno_location@PLT
	.loc 1 164 13 discriminator 1
	movl	(%rax), %ebx
	.loc 1 164 79 discriminator 1
	call	__errno_location@PLT
	.loc 1 164 13 discriminator 2
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rdx
	.loc 1 164 13 is_stmt 0 discriminator 3
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 165 13 is_stmt 1
	movq	-176(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 166 20
	movl	$-1, -156(%rbp)
	.loc 1 167 13
	jmp	.L23
.L32:
	.loc 1 170 9
	nop
.L27:
	.loc 1 173 8
	cmpq	$0, -152(%rbp)
	jne	.L29
	.loc 1 175 140
	call	__errno_location@PLT
	.loc 1 175 9 discriminator 1
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	.loc 1 175 9 is_stmt 0 discriminator 2
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 176 16 is_stmt 1
	movl	$-1, -156(%rbp)
	.loc 1 177 9
	jmp	.L23
.L29:
	.loc 1 180 48
	movq	-176(%rbp), %rax
	movl	(%rax), %edx
	.loc 1 180 39
	movq	-168(%rbp), %rax
	movl	-180(%rbp), %ecx
	movslq	%ecx, %rcx
	addq	$12, %rcx
	movl	%edx, (%rax,%rcx,4)
	.loc 1 181 7
	movq	-168(%rbp), %rax
	movl	68(%rax), %eax
	.loc 1 181 36
	leal	1(%rax), %edx
	movq	-168(%rbp), %rax
	movl	%edx, 68(%rax)
	.loc 1 184 32
	movq	-152(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	get_in_addr
	movq	%rax, %rsi
	.loc 1 184 5 discriminator 1
	movq	-152(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-80(%rbp), %rdx
	movl	$46, %ecx
	movl	%eax, %edi
	call	inet_ntop@PLT
	.loc 1 185 5
	movl	-180(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 186 5
	movq	-176(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-176(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 189 15
	movq	$1, -144(%rbp)
	.loc 1 190 16
	movq	$0, -136(%rbp)
	.loc 1 191 5
	movq	-176(%rbp), %rax
	movl	(%rax), %eax
	leaq	-144(%rbp), %rdx
	movl	$16, %r8d
	movq	%rdx, %rcx
	movl	$21, %edx
	movl	$1, %esi
	movl	%eax, %edi
	call	setsockopt@PLT
	.loc 1 192 5
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
	.loc 1 198 5
	movq	-152(%rbp), %rax
	movq	%rax, %rdi
	call	freeaddrinfo@PLT
	.loc 1 199 12
	movl	-156(%rbp), %eax
	.loc 1 200 1
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
	.loc 1 203 1
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
	.loc 1 203 1
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 1 205 5
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 206 5
	movl	-30876(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 207 62
	movq	-30856(%rbp), %rax
	movl	64(%rax), %ebx
	.loc 1 207 58
	movl	-30876(%rbp), %eax
	cltd
	idivl	%ebx
	movl	%edx, %ecx
	movl	%ecx, %eax
	.loc 1 207 5
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 209 22
	movq	-30856(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -30792(%rbp)
	.loc 1 210 9
	movl	$0, -30840(%rbp)
	.loc 1 215 5
	leaq	-30768(%rbp), %rax
	movl	$16, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 217 11
	jmp	.L34
.L52:
.LBB4:
	.loc 1 219 13
	movl	-30840(%rbp), %edx
	movq	-30792(%rbp), %rcx
	movq	-30856(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	connect_server
	.loc 1 219 12 discriminator 1
	testl	%eax, %eax
	js	.L58
	.loc 1 222 27
	movl	-30876(%rbp), %edx
	movl	-30840(%rbp), %eax
	addl	%eax, %edx
	.loc 1 222 36
	movq	-30856(%rbp), %rax
	movl	64(%rax), %ecx
	.loc 1 222 13
	movl	%edx, %eax
	cltd
	idivl	%ecx
	movl	%edx, -30836(%rbp)
	.loc 1 224 9
	movl	-30840(%rbp), %eax
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
	movl	$0, -30832(%rbp)
	.loc 1 226 9
	jmp	.L37
.L38:
	.loc 1 228 44
	movl	-30836(%rbp), %edx
	movl	-30832(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	.loc 1 228 53
	movq	-30856(%rbp), %rax
	movl	64(%rax), %ebx
	.loc 1 228 49
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
	addl	$1, -30832(%rbp)
.L37:
	.loc 1 226 27 discriminator 1
	cmpl	$1, -30832(%rbp)
	jle	.L38
.LBE5:
	.loc 1 230 9
	movl	$10, %edi
	call	putchar@PLT
.LBB6:
	.loc 1 232 18
	movl	$0, -30828(%rbp)
	.loc 1 232 9
	jmp	.L39
.L51:
.LBB7:
	.loc 1 235 28
	movl	-30836(%rbp), %edx
	movl	-30828(%rbp), %eax
	addl	%eax, %edx
	.loc 1 235 37
	movq	-30856(%rbp), %rax
	movl	64(%rax), %ecx
	.loc 1 235 19
	movl	%edx, %eax
	cltd
	idivl	%ecx
	movl	%edx, -30836(%rbp)
	.loc 1 236 26
	movl	-30836(%rbp), %eax
	cltq
	movl	-30768(%rbp,%rax,4), %eax
	.loc 1 236 33
	leal	1(%rax), %edx
	movl	-30836(%rbp), %eax
	cltq
	movl	%edx, -30768(%rbp,%rax,4)
	.loc 1 238 30
	movb	$1, -30778(%rbp)
	movl	-30836(%rbp), %eax
	movb	%al, -30777(%rbp)
	.loc 1 241 45
	movq	-30856(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 241 36
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 238 30
	movl	%eax, -30776(%rbp)
	.loc 1 242 43
	movl	-30836(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-30872(%rbp), %rax
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
	movl	%eax, -30820(%rbp)
	cmpl	$0, -30820(%rbp)
	jg	.L40
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
.L40:
	.loc 1 244 24 discriminator 2
	movl	-30820(%rbp), %eax
.LBE8:
	.loc 1 244 22 is_stmt 1 discriminator 2
	movl	%eax, -30816(%rbp)
	.loc 1 245 13
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.LBB9:
	.loc 1 246 24
	movq	-30792(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30752(%rbp), %rsi
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 246 24 is_stmt 0 discriminator 1
	movl	%eax, -30812(%rbp)
	cmpl	$0, -30812(%rbp)
	jns	.L42
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
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 246 24
	jmp	.L36
.L42:
	.loc 1 246 24 discriminator 2
	cmpl	$0, -30812(%rbp)
	jne	.L43
	.loc 1 246 24 discriminator 3
	movq	-30792(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 246 24 discriminator 1
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 246 24
	jmp	.L36
.L43:
	.loc 1 246 24 discriminator 4
	movl	-30812(%rbp), %eax
.LBE9:
	.loc 1 246 22 is_stmt 1 discriminator 4
	movl	%eax, -30816(%rbp)
.LBB10:
	.loc 1 248 24
	movl	-30776(%rbp), %eax
	movl	%eax, %edx
	movq	-30856(%rbp), %rax
	movq	16(%rax), %rsi
	movq	-30792(%rbp), %rax
	movl	(%rax), %eax
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 248 24 is_stmt 0 discriminator 1
	movl	%eax, -30808(%rbp)
	cmpl	$0, -30808(%rbp)
	jg	.L44
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
.L44:
	.loc 1 248 24 discriminator 2
	movl	-30808(%rbp), %eax
.LBE10:
	.loc 1 248 22 is_stmt 1 discriminator 2
	movl	%eax, -30816(%rbp)
	.loc 1 249 13
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.LBB11:
	.loc 1 250 24
	movq	-30792(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30752(%rbp), %rsi
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 250 24 is_stmt 0 discriminator 1
	movl	%eax, -30804(%rbp)
	cmpl	$0, -30804(%rbp)
	jns	.L45
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 250 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 250 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 250 24
	jmp	.L36
.L45:
	.loc 1 250 24 discriminator 2
	cmpl	$0, -30804(%rbp)
	jne	.L46
	.loc 1 250 24 discriminator 3
	movq	-30792(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 250 24 discriminator 1
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 250 24
	jmp	.L36
.L46:
	.loc 1 250 24 discriminator 4
	movl	-30804(%rbp), %eax
.LBE11:
	.loc 1 250 22 is_stmt 1 discriminator 4
	movl	%eax, -30816(%rbp)
.LBB12:
	.loc 1 252 24
	movl	-30836(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-30872(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movslq	%eax, %rdx
	movl	-30836(%rbp), %eax
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
	.loc 1 252 24 is_stmt 0 discriminator 1
	movl	%eax, -30800(%rbp)
	cmpl	$0, -30800(%rbp)
	jg	.L47
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 252 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 252 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 252 24
	jmp	.L36
.L47:
	.loc 1 252 24 discriminator 2
	movl	-30800(%rbp), %eax
.LBE12:
	.loc 1 252 22 is_stmt 1 discriminator 2
	movl	%eax, -30816(%rbp)
	.loc 1 253 13
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.LBB13:
	.loc 1 254 24
	movq	-30792(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30752(%rbp), %rsi
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 254 24 is_stmt 0 discriminator 1
	movl	%eax, -30796(%rbp)
	cmpl	$0, -30796(%rbp)
	jns	.L48
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 254 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 254 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 254 24
	jmp	.L36
.L48:
	.loc 1 254 24 discriminator 2
	cmpl	$0, -30796(%rbp)
	jne	.L49
	.loc 1 254 24 discriminator 3
	movq	-30792(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 254 24 discriminator 1
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 254 24
	jmp	.L36
.L49:
	.loc 1 254 24 discriminator 4
	movl	-30796(%rbp), %eax
.LBE13:
	.loc 1 254 22 is_stmt 1 discriminator 4
	movl	%eax, -30816(%rbp)
	.loc 1 257 17
	leaq	-30752(%rbp), %rax
	movl	$7, %edx
	leaq	.LC17(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 257 16 discriminator 1
	testl	%eax, %eax
	je	.L50
	.loc 1 259 17
	movl	-30836(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 260 17
	jmp	.L36
.L50:
	.loc 1 264 17
	movl	-30840(%rbp), %eax
	leal	1(%rax), %edx
	movl	-30836(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBE7:
	.loc 1 232 63 discriminator 2
	addl	$1, -30828(%rbp)
.L39:
	.loc 1 232 27 discriminator 1
	cmpl	$1, -30828(%rbp)
	jle	.L51
.LBE6:
	.loc 1 270 5
	jmp	.L36
.L58:
	.loc 1 220 13
	nop
.L36:
	.loc 1 271 9
	movq	-30792(%rbp), %rax
	movq	%rax, %rdi
	call	cleanup_current_connection
	.loc 1 272 10
	addl	$1, -30840(%rbp)
	.loc 1 273 17
	movq	-30792(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -30792(%rbp)
.L34:
.LBE4:
	.loc 1 217 12
	cmpq	$0, -30792(%rbp)
	jne	.L52
.LBB14:
	.loc 1 276 14
	movl	$0, -30824(%rbp)
	.loc 1 276 5
	jmp	.L53
.L56:
	.loc 1 278 26
	movl	-30824(%rbp), %eax
	cltq
	movl	-30768(%rbp,%rax,4), %eax
	.loc 1 278 12
	testl	%eax, %eax
	jg	.L54
	.loc 1 280 13
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 281 13
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 282 13
	movq	-30856(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 283 13
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 284 13
	movl	-30824(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 285 13
	leaq	.LC25(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L33
.L54:
	.loc 1 276 43 discriminator 2
	addl	$1, -30824(%rbp)
.L53:
	.loc 1 276 23 discriminator 1
	cmpl	$3, -30824(%rbp)
	jle	.L56
.LBE14:
	.loc 1 291 5
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 292 5
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 293 5
	movq	-30856(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC28(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 294 5
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 295 5
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L33:
	.loc 1 296 1
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L57
	call	__stack_chk_fail@PLT
.L57:
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
	.loc 1 299 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movq	%rdi, -120(%rbp)
	.loc 1 299 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 300 24
	movq	-120(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 300 16
	leaq	.LC31(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -80(%rbp)
	.loc 1 301 8
	cmpq	$0, -80(%rbp)
	jne	.L60
	.loc 1 303 67
	call	__errno_location@PLT
	.loc 1 303 9 discriminator 1
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC32(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	jmp	.L59
.L60:
	.loc 1 307 37
	movq	-120(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 307 27
	movl	$47, %esi
	movq	%rax, %rdi
	call	strrchr@PLT
	movq	%rax, -88(%rbp)
	.loc 1 308 8
	cmpq	$0, -88(%rbp)
	jne	.L62
	.loc 1 310 23
	movq	-120(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -88(%rbp)
	jmp	.L63
.L62:
	.loc 1 314 22
	addq	$1, -88(%rbp)
.L63:
	.loc 1 317 44
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 317 21 discriminator 1
	movl	%eax, %edx
	movq	-88(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	str2md5
	movl	%eax, -96(%rbp)
	.loc 1 318 18
	movq	-120(%rbp), %rax
	movq	-88(%rbp), %rdx
	movq	%rdx, 16(%rax)
	.loc 1 320 5
	movq	-80(%rbp), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseek@PLT
	.loc 1 321 16
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	ftell@PLT
	.loc 1 321 9 discriminator 1
	movl	%eax, -92(%rbp)
	.loc 1 322 5
	movq	-80(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseek@PLT
	.loc 1 326 9
	movl	$0, -108(%rbp)
	.loc 1 328 5
	leaq	.LC33(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 329 5
	movq	-120(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC34(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 330 5
	movl	-92(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC35(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 331 5
	movl	$4, %esi
	leaq	.LC36(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBB15:
	.loc 1 333 14
	movl	$0, -104(%rbp)
	.loc 1 333 5
	jmp	.L64
.L67:
.LBB16:
	.loc 1 336 12
	cmpl	$3, -104(%rbp)
	jne	.L65
	.loc 1 337 24
	movl	-92(%rbp), %eax
	subl	-108(%rbp), %eax
	movl	%eax, -100(%rbp)
	jmp	.L66
.L65:
	.loc 1 339 24
	movl	-92(%rbp), %eax
	leal	3(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$2, %eax
	movl	%eax, -100(%rbp)
.L66:
	.loc 1 340 36
	movl	-100(%rbp), %eax
	addl	%eax, -108(%rbp)
	.loc 1 342 24
	movl	-104(%rbp), %eax
	cltq
	movl	-100(%rbp), %edx
	movl	%edx, -64(%rbp,%rax,4)
	.loc 1 344 23
	movl	-100(%rbp), %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -72(%rbp)
	.loc 1 345 19
	movl	-104(%rbp), %eax
	cltq
	movq	-72(%rbp), %rdx
	movq	%rdx, -48(%rbp,%rax,8)
	.loc 1 346 9
	movl	-100(%rbp), %eax
	movslq	%eax, %rdx
	movq	-80(%rbp), %rcx
	movq	-72(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	fread@PLT
	.loc 1 348 9
	movl	-104(%rbp), %eax
	addl	$1, %eax
	movl	$4, %edx
	movl	%eax, %esi
	leaq	.LC37(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 349 9
	movl	-100(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC38(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBE16:
	.loc 1 333 43 discriminator 2
	addl	$1, -104(%rbp)
.L64:
	.loc 1 333 23 discriminator 1
	cmpl	$3, -104(%rbp)
	jle	.L67
.LBE15:
	.loc 1 352 62
	movq	-120(%rbp), %rax
	movl	64(%rax), %eax
	movl	%eax, %ecx
	.loc 1 352 58
	movl	-96(%rbp), %eax
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	.loc 1 352 5
	movl	%eax, %ecx
	leaq	-64(%rbp), %rdx
	leaq	-48(%rbp), %rsi
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	connect_and_put_chunks
.L59:
	.loc 1 353 1
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L68
	call	__stack_chk_fail@PLT
.L68:
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
	.align 8
.LC44:
	.string	"\033[31m    [-] Server %d does not have chunk %d\n\033[0m"
	.align 8
.LC45:
	.string	"\033[32m    [+] Server has chunk %d, downloading...\n\033[0m"
	.align 8
.LC46:
	.string	"\033[36m    [*] Chunk %d size: %d bytes\n\033[0m"
	.align 8
.LC47:
	.string	"\033[31m    [-] ERROR: Memory allocation failed for chunk %d\n\033[0m"
	.align 8
.LC49:
	.string	"\033[36m    [*] Downloaded %d/%d bytes (%.1f%%)\n\033[0m"
	.align 8
.LC50:
	.string	"\033[32m    [+] CHUNK %d DOWNLOADED SUCCESSFULLY (%d bytes)\n\033[0m"
	.align 8
.LC51:
	.string	"\033[31m    [-] ERROR: Failed to download chunk %d\n\033[0m"
	.align 8
.LC52:
	.string	"\033[36m\n=========================================\n\033[0m"
	.align 8
.LC53:
	.string	"\033[36m    DOWNLOAD SUMMARY: %s\n\033[0m"
	.align 8
.LC54:
	.string	"\033[36m=========================================\n\n\033[0m"
	.align 8
.LC55:
	.string	"\033[36mServer status: %d/%d available\n\033[0m"
	.align 8
.LC56:
	.string	"\033[36mChunks status: %d/%d downloaded\n\n\033[0m"
.LC57:
	.string	"Chunk breakdown:"
	.align 8
.LC58:
	.string	"\033[32m  [\342\234\223] Chunk %d: %d bytes\n\033[0m"
	.align 8
.LC59:
	.string	"\033[31m  [\342\234\227] Chunk %d: MISSING\n\033[0m"
	.align 8
.LC60:
	.string	"\033[31m[!] CANNOT RECONSTRUCT: Missing chunk %d\n\033[0m"
	.align 8
.LC61:
	.string	"\033[31m    DOWNLOAD FAILED: %s\n\033[0m"
	.align 8
.LC62:
	.string	"\033[31m    Reason: Missing chunks prevent reconstruction\n\033[0m"
	.align 8
.LC63:
	.string	"\033[31m    Required: %d/%d chunks\n\033[0m"
	.align 8
.LC64:
	.string	"\033[31m    Available: %d/%d chunks\n\033[0m"
	.align 8
.LC65:
	.string	"\033[36m[*] REASSEMBLING FILE: All chunks available\n\033[0m"
.LC66:
	.string	"./download"
.LC67:
	.string	"%s/%s"
.LC68:
	.string	"wb"
	.align 8
.LC69:
	.string	"\033[31m[-] ERROR: Could not create output file: %s\n\033[0m"
	.align 8
.LC70:
	.string	"\033[36m    [*] Writing chunk %d (%d bytes)\n\033[0m"
	.align 8
.LC71:
	.string	"\033[32m    DOWNLOAD SUCCESSFUL: %s\n\033[0m"
	.align 8
.LC72:
	.string	"\033[32m    Total file size: %d bytes\n\033[0m"
	.align 8
.LC73:
	.string	"\033[32m    All %d chunks retrieved and reassembled\n\033[0m"
	.text
	.globl	get_file
	.type	get_file, @function
get_file:
.LFB327:
	.loc 1 356 1
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
	.loc 1 356 1
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 1 359 37
	movq	-30984(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 359 27
	movl	$47, %esi
	movq	%rax, %rdi
	call	strrchr@PLT
	movq	%rax, -30856(%rbp)
	.loc 1 360 8
	cmpq	$0, -30856(%rbp)
	jne	.L70
	.loc 1 362 23
	movq	-30984(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -30856(%rbp)
	jmp	.L71
.L70:
	.loc 1 366 22
	addq	$1, -30856(%rbp)
.L71:
	.loc 1 368 44
	movq	-30856(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 368 21 discriminator 1
	movl	%eax, %edx
	movq	-30856(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	str2md5
	movl	%eax, -30908(%rbp)
	.loc 1 369 18
	movq	-30984(%rbp), %rax
	movq	-30856(%rbp), %rdx
	movq	%rdx, 16(%rax)
	.loc 1 371 9
	movl	$0, -30972(%rbp)
	.loc 1 371 16
	movl	$0, -30904(%rbp)
	.loc 1 372 22
	movq	-30984(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -30848(%rbp)
	.loc 1 379 9
	movl	$0, -30968(%rbp)
	.loc 1 382 5
	leaq	-30784(%rbp), %rax
	movl	$32, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 383 5
	leaq	-30816(%rbp), %rax
	movl	$16, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 384 5
	leaq	-30800(%rbp), %rax
	movl	$16, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 387 9
	movl	$0, -30964(%rbp)
	.loc 1 388 9
	movl	$0, -30960(%rbp)
	.loc 1 391 11
	jmp	.L72
.L107:
.LBB17:
	.loc 1 393 26
	addl	$1, -30964(%rbp)
	.loc 1 395 13
	movl	-30972(%rbp), %edx
	movq	-30848(%rbp), %rcx
	movq	-30984(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	connect_server
	.loc 1 395 12 discriminator 1
	testl	%eax, %eax
	js	.L130
	.loc 1 400 26
	addl	$1, -30960(%rbp)
	.loc 1 401 9
	movl	-30972(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC39(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 404 27
	movl	-30972(%rbp), %edx
	movl	-30908(%rbp), %eax
	addl	%eax, %edx
	.loc 1 404 36
	movq	-30984(%rbp), %rax
	movl	64(%rax), %eax
	movl	%eax, %ecx
	.loc 1 404 32
	movl	%edx, %eax
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	.loc 1 404 13
	movl	%eax, -30956(%rbp)
	.loc 1 406 9
	movl	-30972(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC40(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBB18:
	.loc 1 407 18
	movl	$0, -30952(%rbp)
	.loc 1 407 9
	jmp	.L75
.L76:
	.loc 1 409 34
	movl	-30956(%rbp), %edx
	movl	-30952(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	.loc 1 409 43
	movq	-30984(%rbp), %rax
	movl	64(%rax), %ebx
	.loc 1 409 39
	movl	%ecx, %eax
	cltd
	idivl	%ebx
	movl	%edx, %ecx
	movl	%ecx, %eax
	.loc 1 409 13
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC41(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 407 63 discriminator 3
	addl	$1, -30952(%rbp)
.L75:
	.loc 1 407 27 discriminator 1
	cmpl	$1, -30952(%rbp)
	jle	.L76
.LBE18:
	.loc 1 411 9
	movl	$10, %edi
	call	putchar@PLT
.LBB19:
	.loc 1 414 18
	movl	$0, -30948(%rbp)
	.loc 1 414 9
	jmp	.L77
.L105:
.LBB20:
	.loc 1 416 28
	movl	-30956(%rbp), %edx
	movl	-30948(%rbp), %eax
	addl	%eax, %edx
	.loc 1 416 37
	movq	-30984(%rbp), %rax
	movl	64(%rax), %ecx
	.loc 1 416 19
	movl	%edx, %eax
	cltd
	idivl	%ecx
	movl	%edx, -30956(%rbp)
	.loc 1 419 30
	movl	-30956(%rbp), %eax
	cltq
	movl	-30816(%rbp,%rax,4), %eax
	.loc 1 419 16
	testl	%eax, %eax
	jle	.L78
	.loc 1 421 17
	movl	-30956(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC42(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 422 17
	jmp	.L104
.L78:
	.loc 1 425 13
	movl	-30972(%rbp), %eax
	leal	1(%rax), %edx
	movl	-30956(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC43(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 428 30
	movb	$0, -30832(%rbp)
	movl	-30956(%rbp), %eax
	movb	%al, -30831(%rbp)
	.loc 1 431 45
	movq	-30984(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 431 36
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 428 30
	movl	%eax, -30830(%rbp)
	movl	$0, -30826(%rbp)
.LBB21:
	.loc 1 443 24
	movq	-30848(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30832(%rbp), %rsi
	movl	$0, %ecx
	movl	$10, %edx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 443 24 is_stmt 0 discriminator 1
	movl	%eax, -30900(%rbp)
	cmpl	$0, -30900(%rbp)
	jg	.L80
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 443 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 443 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 443 24
	jmp	.L74
.L80:
	.loc 1 443 24 discriminator 2
	movl	-30900(%rbp), %eax
.LBE21:
	.loc 1 443 22 is_stmt 1 discriminator 2
	movl	%eax, -30904(%rbp)
.LBB22:
	.loc 1 444 24
	movq	-30848(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30752(%rbp), %rsi
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 444 24 is_stmt 0 discriminator 1
	movl	%eax, -30896(%rbp)
	cmpl	$0, -30896(%rbp)
	jns	.L82
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 444 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 444 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 444 24
	jmp	.L74
.L82:
	.loc 1 444 24 discriminator 2
	cmpl	$0, -30896(%rbp)
	jne	.L83
	.loc 1 444 24 discriminator 3
	movq	-30848(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 444 24 discriminator 1
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 444 24
	jmp	.L74
.L83:
	.loc 1 444 24 discriminator 4
	movl	-30896(%rbp), %eax
.LBE22:
	.loc 1 444 22 is_stmt 1 discriminator 4
	movl	%eax, -30904(%rbp)
.LBB23:
	.loc 1 446 24
	movq	-30984(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	.loc 1 446 24 is_stmt 0 discriminator 1
	movq	-30984(%rbp), %rax
	movq	16(%rax), %rsi
	movq	-30848(%rbp), %rax
	movl	(%rax), %eax
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 446 24 discriminator 2
	movl	%eax, -30892(%rbp)
	cmpl	$0, -30892(%rbp)
	jg	.L84
	.loc 1 446 24 discriminator 1
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 446 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 446 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 446 24
	jmp	.L74
.L84:
	.loc 1 446 24 discriminator 2
	movl	-30892(%rbp), %eax
.LBE23:
	.loc 1 446 22 is_stmt 1 discriminator 2
	movl	%eax, -30904(%rbp)
.LBB24:
	.loc 1 447 24
	movq	-30848(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30752(%rbp), %rsi
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 447 24 is_stmt 0 discriminator 1
	movl	%eax, -30888(%rbp)
	cmpl	$0, -30888(%rbp)
	jns	.L85
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 447 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 447 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 447 24
	jmp	.L74
.L85:
	.loc 1 447 24 discriminator 2
	cmpl	$0, -30888(%rbp)
	jne	.L86
	.loc 1 447 24 discriminator 3
	movq	-30848(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 447 24 discriminator 1
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 447 24
	jmp	.L74
.L86:
	.loc 1 447 24 discriminator 4
	movl	-30888(%rbp), %eax
.LBE24:
	.loc 1 447 22 is_stmt 1 discriminator 4
	movl	%eax, -30904(%rbp)
	.loc 1 449 17
	leaq	-30752(%rbp), %rax
	movl	$7, %edx
	leaq	.LC17(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 449 16 discriminator 1
	testl	%eax, %eax
	je	.L87
	.loc 1 451 17
	movl	-30956(%rbp), %eax
	leal	1(%rax), %edx
	movl	-30972(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC44(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 452 17
	jmp	.L104
.L87:
	.loc 1 455 13
	movl	-30956(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC45(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBB25:
	.loc 1 457 24
	movq	-30848(%rbp), %rax
	movl	(%rax), %eax
	movl	$0, %ecx
	movl	$7, %edx
	leaq	.LC17(%rip), %rsi
	movl	%eax, %edi
	call	send@PLT
	.loc 1 457 24 is_stmt 0 discriminator 1
	movl	%eax, -30884(%rbp)
	cmpl	$0, -30884(%rbp)
	jg	.L88
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 457 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 457 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 457 24
	jmp	.L89
.L88:
	.loc 1 457 24 discriminator 2
	movl	-30884(%rbp), %eax
.LBE25:
	.loc 1 457 22 is_stmt 1 discriminator 2
	movl	%eax, -30904(%rbp)
	.loc 1 458 13
	leaq	-30832(%rbp), %rax
	movl	$10, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.LBB26:
	.loc 1 459 24
	movq	-30848(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30832(%rbp), %rsi
	movl	$0, %ecx
	movl	$10, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 459 24 is_stmt 0 discriminator 1
	movl	%eax, -30880(%rbp)
	cmpl	$0, -30880(%rbp)
	jns	.L90
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 459 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 459 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 459 24
	jmp	.L89
.L90:
	.loc 1 459 24 discriminator 2
	cmpl	$0, -30880(%rbp)
	jne	.L91
	.loc 1 459 24 discriminator 3
	movq	-30848(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 459 24 discriminator 1
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 459 24
	jmp	.L89
.L91:
	.loc 1 459 24 discriminator 4
	movl	-30880(%rbp), %eax
.LBE26:
	.loc 1 459 22 is_stmt 1 discriminator 4
	movl	%eax, -30904(%rbp)
	.loc 1 470 43
	movl	-30826(%rbp), %eax
	.loc 1 470 17
	movl	%eax, -30876(%rbp)
	.loc 1 471 81
	movzbl	-30831(%rbp), %eax
	movzbl	%al, %eax
	.loc 1 471 13
	leal	1(%rax), %ecx
	movl	-30876(%rbp), %eax
	movl	%eax, %edx
	movl	%ecx, %esi
	leaq	.LC46(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 474 29
	movl	-30876(%rbp), %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	.loc 1 474 27 discriminator 1
	movl	-30956(%rbp), %eax
	cltq
	movq	%rdx, -30784(%rbp,%rax,8)
	.loc 1 475 23
	movl	-30956(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rax
	.loc 1 475 16
	testq	%rax, %rax
	jne	.L92
	.loc 1 477 17
	movl	-30956(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC47(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L69
.L92:
.LBB27:
	.loc 1 481 24
	movq	-30848(%rbp), %rax
	movl	(%rax), %eax
	movl	$0, %ecx
	movl	$7, %edx
	leaq	.LC17(%rip), %rsi
	movl	%eax, %edi
	call	send@PLT
	.loc 1 481 24 is_stmt 0 discriminator 1
	movl	%eax, -30872(%rbp)
	cmpl	$0, -30872(%rbp)
	jg	.L94
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 481 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 481 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 481 24
	jmp	.L89
.L94:
	.loc 1 481 24 discriminator 2
	movl	-30872(%rbp), %eax
.LBE27:
	.loc 1 481 22 is_stmt 1 discriminator 2
	movl	%eax, -30904(%rbp)
	.loc 1 483 17
	movl	$0, -30944(%rbp)
	.loc 1 484 19
	jmp	.L95
.L99:
	.loc 1 486 17
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.LBB28:
	.loc 1 487 28
	movq	-30848(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30752(%rbp), %rsi
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 487 28 is_stmt 0 discriminator 1
	movl	%eax, -30860(%rbp)
	cmpl	$0, -30860(%rbp)
	jns	.L96
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 487 28 discriminator 2
	call	__errno_location@PLT
	.loc 1 487 28 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 487 28
	jmp	.L89
.L96:
	.loc 1 487 28 discriminator 2
	cmpl	$0, -30860(%rbp)
	jne	.L97
	.loc 1 487 28 discriminator 3
	movq	-30848(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 487 28 discriminator 1
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 487 28
	jmp	.L89
.L97:
	.loc 1 487 28 discriminator 4
	movl	-30860(%rbp), %eax
.LBE28:
	.loc 1 487 26 is_stmt 1 discriminator 4
	movl	%eax, -30904(%rbp)
	.loc 1 488 17
	movl	-30904(%rbp), %eax
	movslq	%eax, %rdx
	.loc 1 488 31
	movl	-30956(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rcx
	.loc 1 488 17
	movl	-30944(%rbp), %eax
	cltq
	.loc 1 488 24
	addq	%rax, %rcx
	.loc 1 488 17
	leaq	-30752(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	memcpy@PLT
	.loc 1 489 29
	movl	-30904(%rbp), %eax
	addl	%eax, -30944(%rbp)
	.loc 1 492 20
	cmpl	$10000, -30876(%rbp)
	jle	.L95
	.loc 1 492 54 discriminator 1
	movl	-30944(%rbp), %edx
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
	.loc 1 492 39 discriminator 1
	testl	%eax, %eax
	jne	.L95
	.loc 1 495 52
	pxor	%xmm0, %xmm0
	cvtsi2ssl	-30944(%rbp), %xmm0
	.loc 1 495 71
	pxor	%xmm2, %xmm2
	cvtsi2ssl	-30876(%rbp), %xmm2
	movaps	%xmm0, %xmm1
	divss	%xmm2, %xmm1
	.loc 1 495 83
	movss	.LC48(%rip), %xmm0
	mulss	%xmm1, %xmm0
	.loc 1 494 21
	pxor	%xmm3, %xmm3
	cvtss2sd	%xmm0, %xmm3
	movq	%xmm3, %rcx
	movl	-30876(%rbp), %edx
	movl	-30944(%rbp), %eax
	movq	%rcx, %xmm0
	movl	%eax, %esi
	leaq	.LC49(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
.L95:
	.loc 1 484 32
	movl	-30944(%rbp), %eax
	cmpl	-30876(%rbp), %eax
	jl	.L99
.LBB29:
	.loc 1 500 24
	movq	-30848(%rbp), %rax
	movl	(%rax), %eax
	movl	$0, %ecx
	movl	$7, %edx
	leaq	.LC17(%rip), %rsi
	movl	%eax, %edi
	call	send@PLT
	.loc 1 500 24 is_stmt 0 discriminator 1
	movl	%eax, -30868(%rbp)
	cmpl	$0, -30868(%rbp)
	jg	.L100
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 500 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 500 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 500 24
	jmp	.L89
.L100:
	.loc 1 500 24 discriminator 2
	movl	-30868(%rbp), %eax
.LBE29:
	.loc 1 500 22 is_stmt 1 discriminator 2
	movl	%eax, -30904(%rbp)
.LBB30:
	.loc 1 502 24
	movq	-30848(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30752(%rbp), %rsi
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 502 24 is_stmt 0 discriminator 1
	movl	%eax, -30864(%rbp)
	cmpl	$0, -30864(%rbp)
	jns	.L101
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 502 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 502 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 502 24
	jmp	.L89
.L101:
	.loc 1 502 24 discriminator 2
	cmpl	$0, -30864(%rbp)
	jne	.L102
	.loc 1 502 24 discriminator 3
	movq	-30848(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 502 24 discriminator 1
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 502 24
	jmp	.L89
.L102:
	.loc 1 502 24 discriminator 4
	movl	-30864(%rbp), %eax
.LBE30:
	.loc 1 502 22 is_stmt 1 discriminator 4
	movl	%eax, -30904(%rbp)
	.loc 1 505 34
	movl	-30956(%rbp), %eax
	cltq
	movl	$1, -30816(%rbp,%rax,4)
	.loc 1 506 40
	movl	-30956(%rbp), %eax
	cltq
	movl	-30876(%rbp), %edx
	movl	%edx, -30800(%rbp,%rax,4)
	.loc 1 507 36
	addl	$1, -30968(%rbp)
	.loc 1 509 13
	movl	-30956(%rbp), %eax
	leal	1(%rax), %ecx
	movl	-30876(%rbp), %eax
	movl	%eax, %edx
	movl	%ecx, %esi
	leaq	.LC50(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 511 13
	jmp	.L104
.L89:
	.loc 1 514 13
	movl	-30956(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC51(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 515 23
	movl	-30956(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rax
	.loc 1 515 16
	testq	%rax, %rax
	je	.L104
	.loc 1 517 28
	movl	-30956(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rax
	.loc 1 517 17
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 518 31
	movl	-30956(%rbp), %eax
	cltq
	movq	$0, -30784(%rbp,%rax,8)
.L104:
.LBE20:
	.loc 1 414 63 discriminator 2
	addl	$1, -30948(%rbp)
.L77:
	.loc 1 414 27 discriminator 1
	cmpl	$1, -30948(%rbp)
	jle	.L105
.LBE19:
	.loc 1 522 5
	jmp	.L74
.L130:
	.loc 1 397 13
	nop
.L74:
	.loc 1 523 9
	movq	-30848(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 524 17
	movq	-30848(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -30848(%rbp)
	.loc 1 525 10
	addl	$1, -30972(%rbp)
.L72:
.LBE17:
	.loc 1 391 20
	cmpq	$0, -30848(%rbp)
	je	.L106
	.loc 1 391 20 is_stmt 0 discriminator 1
	cmpl	$4, -30968(%rbp)
	jle	.L107
.L106:
	.loc 1 529 5 is_stmt 1
	leaq	.LC52(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 530 5
	movq	-30984(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC53(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 531 5
	leaq	.LC54(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 533 5
	movl	-30964(%rbp), %edx
	movl	-30960(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC55(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 534 5
	movl	-30968(%rbp), %eax
	movl	$4, %edx
	movl	%eax, %esi
	leaq	.LC56(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 537 5
	leaq	.LC57(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.LBB31:
	.loc 1 538 14
	movl	$0, -30940(%rbp)
	.loc 1 538 5
	jmp	.L108
.L111:
	.loc 1 540 26
	movl	-30940(%rbp), %eax
	cltq
	movl	-30816(%rbp,%rax,4), %eax
	.loc 1 540 12
	testl	%eax, %eax
	jle	.L109
	.loc 1 542 13
	movl	-30940(%rbp), %eax
	cltq
	movl	-30800(%rbp,%rax,4), %eax
	movl	-30940(%rbp), %edx
	leal	1(%rdx), %ecx
	movl	%eax, %edx
	movl	%ecx, %esi
	leaq	.LC58(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L110
.L109:
	.loc 1 546 13
	movl	-30940(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC59(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L110:
	.loc 1 538 43 discriminator 2
	addl	$1, -30940(%rbp)
.L108:
	.loc 1 538 23 discriminator 1
	cmpl	$3, -30940(%rbp)
	jle	.L111
.LBE31:
	.loc 1 549 5
	movl	$10, %edi
	call	putchar@PLT
	.loc 1 552 9
	movl	$1, -30936(%rbp)
.LBB32:
	.loc 1 553 14
	movl	$0, -30932(%rbp)
	.loc 1 553 5
	jmp	.L112
.L115:
	.loc 1 555 19
	movl	-30932(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rax
	.loc 1 555 12
	testq	%rax, %rax
	je	.L113
	.loc 1 555 53 discriminator 1
	movl	-30932(%rbp), %eax
	cltq
	movl	-30800(%rbp,%rax,4), %eax
	.loc 1 555 31 discriminator 1
	testl	%eax, %eax
	jle	.L113
	.loc 1 555 78 discriminator 2
	movl	-30932(%rbp), %eax
	cltq
	movl	-30816(%rbp,%rax,4), %eax
	.loc 1 555 62 discriminator 2
	testl	%eax, %eax
	jg	.L114
.L113:
	.loc 1 557 25
	movl	$0, -30936(%rbp)
	.loc 1 558 13
	movl	-30932(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC60(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L114:
	.loc 1 553 43 discriminator 2
	addl	$1, -30932(%rbp)
.L112:
	.loc 1 553 23 discriminator 1
	cmpl	$3, -30932(%rbp)
	jle	.L115
.LBE32:
	.loc 1 562 8
	cmpl	$0, -30936(%rbp)
	jne	.L116
	.loc 1 564 9
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 565 9
	movq	-30984(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC61(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 566 9
	leaq	.LC62(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 567 9
	movl	$4, %edx
	movl	$4, %esi
	leaq	.LC63(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 568 9
	movl	-30968(%rbp), %eax
	movl	$4, %edx
	movl	%eax, %esi
	leaq	.LC64(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 569 9
	leaq	.LC25(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBB33:
	.loc 1 572 18
	movl	$0, -30928(%rbp)
	.loc 1 572 9
	jmp	.L117
.L119:
	.loc 1 574 23
	movl	-30928(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rax
	.loc 1 574 16
	testq	%rax, %rax
	je	.L118
	.loc 1 575 28
	movl	-30928(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rax
	.loc 1 575 17
	movq	%rax, %rdi
	call	free@PLT
.L118:
	.loc 1 572 47 discriminator 2
	addl	$1, -30928(%rbp)
.L117:
	.loc 1 572 27 discriminator 1
	cmpl	$3, -30928(%rbp)
	jle	.L119
.LBE33:
	.loc 1 578 9
	jmp	.L69
.L116:
	.loc 1 582 5
	leaq	.LC65(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 586 5
	movq	-30984(%rbp), %rax
	movq	16(%rax), %rdx
	leaq	-30832(%rbp), %rax
	movq	%rdx, %rcx
	leaq	.LC66(%rip), %rdx
	leaq	.LC67(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	.loc 1 588 16
	movq	-30832(%rbp), %rax
	leaq	.LC68(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -30840(%rbp)
	.loc 1 589 8
	cmpq	$0, -30840(%rbp)
	jne	.L120
	.loc 1 591 9
	movq	-30984(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC69(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBB34:
	.loc 1 594 18
	movl	$0, -30924(%rbp)
	.loc 1 594 9
	jmp	.L121
.L123:
	.loc 1 596 23
	movl	-30924(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rax
	.loc 1 596 16
	testq	%rax, %rax
	je	.L122
	.loc 1 597 28
	movl	-30924(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rax
	.loc 1 597 17
	movq	%rax, %rdi
	call	free@PLT
.L122:
	.loc 1 594 47 discriminator 2
	addl	$1, -30924(%rbp)
.L121:
	.loc 1 594 27 discriminator 1
	cmpl	$3, -30924(%rbp)
	jle	.L123
.LBE34:
	.loc 1 600 9
	jmp	.L69
.L120:
	.loc 1 602 5
	movq	-30832(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 605 9
	movl	$0, -30920(%rbp)
.LBB35:
	.loc 1 606 14
	movl	$0, -30916(%rbp)
	.loc 1 606 5
	jmp	.L124
.L125:
	.loc 1 608 47
	movl	-30916(%rbp), %eax
	cltq
	movl	-30800(%rbp,%rax,4), %eax
	.loc 1 608 25
	addl	%eax, -30920(%rbp)
	.loc 1 606 43 discriminator 3
	addl	$1, -30916(%rbp)
.L124:
	.loc 1 606 23 discriminator 1
	cmpl	$3, -30916(%rbp)
	jle	.L125
.LBE35:
.LBB36:
	.loc 1 612 14
	movl	$0, -30912(%rbp)
	.loc 1 612 5
	jmp	.L126
.L127:
	.loc 1 614 9
	movl	-30912(%rbp), %eax
	cltq
	movl	-30800(%rbp,%rax,4), %eax
	movl	-30912(%rbp), %edx
	leal	1(%rdx), %ecx
	movl	%eax, %edx
	movl	%ecx, %esi
	leaq	.LC70(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 615 46
	movl	-30912(%rbp), %eax
	cltq
	movl	-30800(%rbp,%rax,4), %eax
	.loc 1 615 9
	movslq	%eax, %rsi
	.loc 1 615 22
	movl	-30912(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rax
	.loc 1 615 9
	movq	-30840(%rbp), %rdx
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 616 20
	movl	-30912(%rbp), %eax
	cltq
	movq	-30784(%rbp,%rax,8), %rax
	.loc 1 616 9
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 612 43 discriminator 3
	addl	$1, -30912(%rbp)
.L126:
	.loc 1 612 23 discriminator 1
	cmpl	$3, -30912(%rbp)
	jle	.L127
.LBE36:
	.loc 1 618 5
	movq	-30840(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	.loc 1 620 5
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 621 5
	movq	-30984(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC71(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 622 5
	movl	-30920(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC72(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 623 5
	movl	$4, %esi
	leaq	.LC73(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 624 5
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L69:
	.loc 1 625 1
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L129
	call	__stack_chk_fail@PLT
.L129:
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
	.loc 1 630 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	.loc 1 632 36
	movq	-40(%rbp), %rax
	movl	$95, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	movq	%rax, -32(%rbp)
	.loc 1 633 8
	cmpq	$0, -32(%rbp)
	jne	.L132
	.loc 1 635 16
	movl	$0, %eax
	jmp	.L133
.L132:
	.loc 1 639 21
	addq	$1, -32(%rbp)
	.loc 1 642 35
	movq	-32(%rbp), %rax
	movl	$95, %esi
	movq	%rax, %rdi
	call	strrchr@PLT
	movq	%rax, -24(%rbp)
	.loc 1 643 8
	cmpq	$0, -24(%rbp)
	jne	.L134
	.loc 1 645 16
	movl	$0, %eax
	jmp	.L133
.L134:
	.loc 1 649 43
	movq	-24(%rbp), %rax
	subq	-32(%rbp), %rax
	.loc 1 649 12
	movq	%rax, -16(%rbp)
	.loc 1 652 31
	movq	-16(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	.loc 1 653 8
	cmpq	$0, -8(%rbp)
	jne	.L135
	.loc 1 655 16
	movl	$0, %eax
	jmp	.L133
.L135:
	.loc 1 659 5
	movq	-16(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	.loc 1 660 22
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 660 37
	movb	$0, (%rax)
	.loc 1 662 12
	movq	-8(%rbp), %rax
.L133:
	.loc 1 663 1
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
	.loc 1 667 1
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
	.loc 1 669 33
	movq	-40(%rbp), %rax
	movl	$47, %esi
	movq	%rax, %rdi
	call	strrchr@PLT
	movq	%rax, -24(%rbp)
	.loc 1 670 8
	cmpq	$0, -24(%rbp)
	je	.L137
	.loc 1 672 22
	addq	$1, -24(%rbp)
	jmp	.L138
.L137:
	.loc 1 676 23
	movq	-40(%rbp), %rax
	movq	%rax, -24(%rbp)
.L138:
	.loc 1 680 35
	movq	-24(%rbp), %rax
	movl	$95, %esi
	movq	%rax, %rdi
	call	strrchr@PLT
	movq	%rax, -16(%rbp)
	.loc 1 681 8
	cmpq	$0, -16(%rbp)
	jne	.L139
	.loc 1 683 16
	movl	$-1, %eax
	jmp	.L140
.L139:
	.loc 1 687 17
	movq	-16(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rdi
	call	atoi@PLT
	.loc 1 687 15 discriminator 1
	movq	-56(%rbp), %rdx
	movl	%eax, (%rdx)
	.loc 1 690 43
	movq	-16(%rbp), %rax
	subq	-24(%rbp), %rax
	.loc 1 690 12
	movq	%rax, -8(%rbp)
	.loc 1 693 26
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	.loc 1 693 24 discriminator 1
	movq	-48(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 694 9
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 694 8
	testq	%rax, %rax
	jne	.L141
	.loc 1 696 16
	movl	$-1, %eax
	jmp	.L140
.L141:
	.loc 1 700 5
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	-24(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	.loc 1 701 6
	movq	-48(%rbp), %rax
	movq	(%rax), %rdx
	.loc 1 701 25
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 701 40
	movb	$0, (%rax)
	.loc 1 703 12
	movl	$0, %eax
.L140:
	.loc 1 704 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE329:
	.size	parse_server_filename, .-parse_server_filename
	.section	.rodata
	.align 8
.LC74:
	.string	"\033[36m\n[*] SCANNING SERVERS FOR FILES\n\033[0m"
	.align 8
.LC75:
	.string	"\033[36m\n[*] QUERYING: Server %d (%s:%s)\n\033[0m"
	.align 8
.LC76:
	.string	"\033[36m[*] LIST REQUEST SENT\n\033[0m"
.LC77:
	.string	"nack\t\n0\t\n"
	.string	""
	.align 8
.LC78:
	.string	"\033[36m    [*] Chunk %d of %s found on server %d\n\033[0m"
	.align 8
.LC79:
	.string	"\033[31m    [-] ERROR: Could not parse filename: %s\n\033[0m"
	.align 8
.LC80:
	.string	"\033[33m    [!] No files found on server %d\n\033[0m"
	.align 8
.LC81:
	.string	"\033[32m    [+] Found %d file chunks on server %d\n\033[0m"
	.align 8
.LC82:
	.string	"\033[36m    FILE AVAILABILITY SUMMARY\n\033[0m"
	.align 8
.LC83:
	.string	"\033[33m[!] No files found on any server\n\n\033[0m"
.LC84:
	.string	"CHUNKS AVAILABLE"
.LC85:
	.string	"STATUS"
.LC86:
	.string	"FILENAME"
.LC87:
	.string	"%-30s %-15s %-15s\n"
	.align 8
.LC88:
	.string	"--------------------------------------------------------------"
.LC89:
	.string	"%-30s "
.LC90:
	.string	"COMPLETE"
.LC91:
	.string	"\033[32m%-15s\033[0m"
.LC92:
	.string	"INCOMPLETE"
.LC93:
	.string	"\033[31m%-15s\033[0m"
.LC94:
	.string	"%-2d/%-2d"
.LC95:
	.string	" ["
.LC96:
	.string	"\033[32m%d\033[0m"
.LC97:
	.string	"\033[31mX\033[0m"
.LC98:
	.string	"]"
	.text
	.globl	list_file
	.type	list_file, @function
list_file:
.LFB330:
	.loc 1 707 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	leaq	-28672(%rsp), %r11
.LPSRL2:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL2
	subq	$2200, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -30872(%rbp)
	.loc 1 707 1
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 1 708 5
	leaq	.LC74(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 710 9
	movl	$0, -30860(%rbp)
	.loc 1 710 16
	movl	$0, -30832(%rbp)
	.loc 1 711 22
	movq	-30872(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -30808(%rbp)
	.loc 1 722 18
	movq	$0, -30800(%rbp)
	.loc 1 725 11
	jmp	.L143
.L164:
.LBB37:
	.loc 1 727 9
	movq	-30808(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-30808(%rbp), %rax
	movq	16(%rax), %rax
	movl	-30860(%rbp), %ecx
	leal	1(%rcx), %esi
	movq	%rdx, %rcx
	movq	%rax, %rdx
	leaq	.LC75(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 729 13
	movl	-30860(%rbp), %edx
	movq	-30808(%rbp), %rcx
	movq	-30872(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	connect_server
	.loc 1 729 12 discriminator 1
	testl	%eax, %eax
	js	.L181
	.loc 1 734 26
	movb	$3, -30762(%rbp)
	movb	$0, -30761(%rbp)
	movl	$0, -30760(%rbp)
	movl	$0, -30756(%rbp)
.LBB38:
	.loc 1 739 20
	movq	-30808(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30762(%rbp), %rsi
	movl	$0, %ecx
	movl	$10, %edx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 739 20 is_stmt 0 discriminator 1
	movl	%eax, -30828(%rbp)
	cmpl	$0, -30828(%rbp)
	jg	.L146
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 739 20 discriminator 2
	call	__errno_location@PLT
	.loc 1 739 20 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 739 20
	jmp	.L145
.L146:
	.loc 1 739 20 discriminator 2
	movl	-30828(%rbp), %eax
.LBE38:
	.loc 1 739 18 is_stmt 1 discriminator 2
	movl	%eax, -30832(%rbp)
	.loc 1 740 9
	leaq	.LC76(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBB39:
	.loc 1 741 20
	movq	-30808(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30752(%rbp), %rsi
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 741 20 is_stmt 0 discriminator 1
	movl	%eax, -30824(%rbp)
	cmpl	$0, -30824(%rbp)
	jns	.L147
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 741 20 discriminator 2
	call	__errno_location@PLT
	.loc 1 741 20 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 741 20
	jmp	.L145
.L147:
	.loc 1 741 20 discriminator 2
	cmpl	$0, -30824(%rbp)
	jne	.L148
	.loc 1 741 20 discriminator 3
	movq	-30808(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 741 20 discriminator 1
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 741 20
	jmp	.L145
.L148:
	.loc 1 741 20 discriminator 4
	movl	-30824(%rbp), %eax
.LBE39:
	.loc 1 741 18 is_stmt 1 discriminator 4
	movl	%eax, -30832(%rbp)
	.loc 1 743 13
	movl	$0, -30856(%rbp)
.L161:
.LBB40:
	.loc 1 748 13
	leaq	-30762(%rbp), %rax
	movl	$10, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.LBB41:
	.loc 1 749 24
	movq	-30808(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30762(%rbp), %rsi
	movl	$0, %ecx
	movl	$10, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 749 24 is_stmt 0 discriminator 1
	movl	%eax, -30820(%rbp)
	cmpl	$0, -30820(%rbp)
	jns	.L149
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 749 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 749 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 749 24
	jmp	.L145
.L149:
	.loc 1 749 24 discriminator 2
	cmpl	$0, -30820(%rbp)
	jne	.L151
	.loc 1 749 24 discriminator 4
	movq	-30808(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 749 24 discriminator 1
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 749 24
	jmp	.L145
.L151:
	.loc 1 749 24 discriminator 5
	movl	-30820(%rbp), %eax
.LBE41:
	.loc 1 749 22 is_stmt 1 discriminator 5
	movl	%eax, -30832(%rbp)
	.loc 1 750 16
	cmpl	$0, -30832(%rbp)
	jle	.L182
	.loc 1 753 13
	movl	-30832(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-30762(%rbp), %rcx
	leaq	-30752(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	.loc 1 754 17
	leaq	-30752(%rbp), %rax
	movl	$7, %edx
	leaq	.LC17(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 754 16 discriminator 1
	testl	%eax, %eax
	je	.L153
	.loc 1 754 63 discriminator 1
	leaq	-30752(%rbp), %rax
	movl	$8, %edx
	leaq	.LC77(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 754 60 discriminator 1
	testl	%eax, %eax
	je	.L153
	.loc 1 757 13
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 758 84
	movl	-30760(%rbp), %eax
	.loc 1 758 24
	movl	%eax, %edx
	movq	-30808(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30752(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 758 22 discriminator 1
	movl	%eax, -30832(%rbp)
	.loc 1 759 16
	cmpl	$0, -30832(%rbp)
	jle	.L153
	.loc 1 759 34 discriminator 1
	leaq	-30752(%rbp), %rax
	movl	$7, %edx
	leaq	.LC17(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 759 31 discriminator 1
	testl	%eax, %eax
	je	.L153
	.loc 1 759 80 discriminator 2
	leaq	-30752(%rbp), %rax
	movl	$8, %edx
	leaq	.LC77(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 759 77 discriminator 1
	testl	%eax, %eax
	je	.L153
	.loc 1 763 19
	movq	$0, -30816(%rbp)
	.loc 1 764 17
	movl	$-1, -30864(%rbp)
	.loc 1 765 17
	leaq	-30864(%rbp), %rdx
	leaq	-30816(%rbp), %rcx
	leaq	-30752(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_server_filename
	.loc 1 765 16 discriminator 1
	testl	%eax, %eax
	jne	.L154
	.loc 1 765 103 discriminator 1
	movl	-30864(%rbp), %eax
	.loc 1 765 91 discriminator 1
	cmpl	$3, %eax
	jg	.L154
.LBB42:
	.loc 1 767 28
	addl	$1, -30856(%rbp)
	.loc 1 770 30
	movq	-30800(%rbp), %rax
	movq	%rax, -30792(%rbp)
	.loc 1 771 21
	movl	$0, -30852(%rbp)
	.loc 1 773 23
	jmp	.L155
.L158:
	.loc 1 775 25
	movq	-30816(%rbp), %rdx
	.loc 1 775 42
	movq	-30792(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 775 25
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 775 24 discriminator 1
	testl	%eax, %eax
	jne	.L156
	.loc 1 777 31
	movl	$1, -30852(%rbp)
	.loc 1 778 51
	movl	-30864(%rbp), %edx
	movq	-30792(%rbp), %rax
	movslq	%edx, %rdx
	movl	8(%rax,%rdx,4), %eax
	movl	-30864(%rbp), %edx
	.loc 1 778 62
	leal	1(%rax), %ecx
	movq	-30792(%rbp), %rax
	movslq	%edx, %rdx
	movl	%ecx, 8(%rax,%rdx,4)
	.loc 1 779 25
	jmp	.L157
.L156:
	.loc 1 781 32
	movq	-30792(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -30792(%rbp)
.L155:
	.loc 1 773 35
	cmpq	$0, -30792(%rbp)
	jne	.L158
.L157:
	.loc 1 785 20
	cmpl	$0, -30852(%rbp)
	jne	.L159
	.loc 1 787 34
	movl	$32, %edi
	call	malloc@PLT
	movq	%rax, -30792(%rbp)
	.loc 1 788 44
	movq	-30816(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	.loc 1 788 42 discriminator 1
	movq	-30792(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 789 38
	movq	-30792(%rbp), %rax
	addq	$8, %rax
	.loc 1 789 21
	movl	$16, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 790 47
	movl	-30864(%rbp), %edx
	.loc 1 790 58
	movq	-30792(%rbp), %rax
	movslq	%edx, %rdx
	movl	$1, 8(%rax,%rdx,4)
	.loc 1 791 38
	movq	-30792(%rbp), %rax
	movq	-30800(%rbp), %rdx
	movq	%rdx, 24(%rax)
	.loc 1 792 31
	movq	-30792(%rbp), %rax
	movq	%rax, -30800(%rbp)
.L159:
	.loc 1 795 17
	movl	-30860(%rbp), %eax
	leal	1(%rax), %edx
	movq	-30816(%rbp), %rax
	movl	-30864(%rbp), %ecx
	leal	1(%rcx), %esi
	movl	%edx, %ecx
	movq	%rax, %rdx
	leaq	.LC78(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 797 17
	movq	-30816(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.LBE42:
	.loc 1 766 13
	jmp	.L160
.L154:
	.loc 1 801 17
	leaq	-30752(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC79(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L160:
.LBE40:
	.loc 1 747 9
	jmp	.L161
.L182:
.LBB43:
	.loc 1 751 17
	nop
.L153:
.LBE43:
	.loc 1 805 12
	cmpl	$0, -30856(%rbp)
	jne	.L162
	.loc 1 807 13
	movl	-30860(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC80(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L145
.L162:
	.loc 1 811 13
	movl	-30860(%rbp), %eax
	leal	1(%rax), %edx
	movl	-30856(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC81(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L145
.L181:
	.loc 1 731 13
	nop
.L145:
	.loc 1 815 20
	movq	-30808(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 815 12
	testl	%eax, %eax
	js	.L163
	.loc 1 817 13
	movq	-30808(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
.L163:
	.loc 1 819 17
	movq	-30808(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -30808(%rbp)
	.loc 1 820 10
	addl	$1, -30860(%rbp)
.L143:
.LBE37:
	.loc 1 725 12
	cmpq	$0, -30808(%rbp)
	jne	.L164
	.loc 1 824 5
	leaq	.LC52(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 825 5
	leaq	.LC82(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 826 5
	leaq	.LC54(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 828 8
	cmpq	$0, -30800(%rbp)
	jne	.L165
	.loc 1 830 9
	leaq	.LC83(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 899 1
	jmp	.L183
.L165:
.LBB44:
	.loc 1 835 9
	leaq	.LC84(%rip), %rax
	movq	%rax, %rcx
	leaq	.LC85(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC86(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC87(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 836 9
	leaq	.LC88(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 839 22
	movq	-30800(%rbp), %rax
	movq	%rax, -30784(%rbp)
	.loc 1 840 15
	jmp	.L167
.L179:
.LBB45:
	.loc 1 843 17
	movl	$0, -30848(%rbp)
	.loc 1 844 17
	movl	$1, -30844(%rbp)
.LBB46:
	.loc 1 846 22
	movl	$0, -30840(%rbp)
	.loc 1 846 13
	jmp	.L168
.L171:
	.loc 1 848 47
	movq	-30784(%rbp), %rax
	movl	-30840(%rbp), %edx
	movslq	%edx, %rdx
	movl	8(%rax,%rdx,4), %eax
	.loc 1 848 20
	testl	%eax, %eax
	jle	.L169
	.loc 1 850 37
	addl	$1, -30848(%rbp)
	jmp	.L170
.L169:
	.loc 1 854 33
	movl	$0, -30844(%rbp)
.L170:
	.loc 1 846 51 discriminator 2
	addl	$1, -30840(%rbp)
.L168:
	.loc 1 846 31 discriminator 1
	cmpl	$3, -30840(%rbp)
	jle	.L171
.LBE46:
	.loc 1 859 13
	movq	-30784(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC89(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 861 16
	cmpl	$0, -30844(%rbp)
	je	.L172
	.loc 1 863 17
	leaq	.LC90(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC91(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L173
.L172:
	.loc 1 867 17
	leaq	.LC92(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC93(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L173:
	.loc 1 870 13
	movl	-30848(%rbp), %eax
	movl	$4, %edx
	movl	%eax, %esi
	leaq	.LC94(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 873 13
	leaq	.LC95(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBB47:
	.loc 1 874 22
	movl	$0, -30836(%rbp)
	.loc 1 874 13
	jmp	.L174
.L178:
	.loc 1 876 47
	movq	-30784(%rbp), %rax
	movl	-30836(%rbp), %edx
	movslq	%edx, %rdx
	movl	8(%rax,%rdx,4), %eax
	.loc 1 876 20
	testl	%eax, %eax
	jle	.L175
	.loc 1 878 21
	movl	-30836(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC96(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L176
.L175:
	.loc 1 882 21
	leaq	.LC97(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L176:
	.loc 1 885 20
	cmpl	$2, -30836(%rbp)
	jg	.L177
	.loc 1 886 21
	movl	$44, %edi
	call	putchar@PLT
.L177:
	.loc 1 874 51 discriminator 2
	addl	$1, -30836(%rbp)
.L174:
	.loc 1 874 31 discriminator 1
	cmpl	$3, -30836(%rbp)
	jle	.L178
.LBE47:
	.loc 1 888 13
	leaq	.LC98(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 891 26
	movq	-30784(%rbp), %rax
	movq	%rax, -30776(%rbp)
	.loc 1 892 24
	movq	-30784(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -30784(%rbp)
	.loc 1 894 22
	movq	-30776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 894 13
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 895 13
	movq	-30776(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L167:
.LBE45:
	.loc 1 840 27
	cmpq	$0, -30784(%rbp)
	jne	.L179
	.loc 1 897 9
	movl	$10, %edi
	call	putchar@PLT
.L183:
.LBE44:
	.loc 1 899 1
	nop
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L180
	call	__stack_chk_fail@PLT
.L180:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE330:
	.size	list_file, .-list_file
	.section	.rodata
	.align 8
.LC99:
	.string	"\033[32m    FILE DELETE SUCCESSFUL\n\033[0m"
	.align 8
.LC100:
	.string	"\033[32m    All chunks removed from servers\n\033[0m"
	.align 8
.LC101:
	.string	"\033[31m[-] ERROR: File not found or permission denied on server\n\033[0m"
	.text
	.globl	delete_file
	.type	delete_file, @function
delete_file:
.LFB331:
	.loc 1 902 1
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
	.loc 1 902 1
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 1 904 9
	movl	$0, -30812(%rbp)
	.loc 1 904 16
	movl	$0, -30800(%rbp)
	.loc 1 905 22
	movq	-30824(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -30776(%rbp)
	.loc 1 908 11
	jmp	.L185
.L199:
.LBB48:
	.loc 1 910 13
	movl	-30812(%rbp), %edx
	movq	-30776(%rbp), %rcx
	movq	-30824(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	connect_server
	.loc 1 910 12 discriminator 1
	testl	%eax, %eax
	js	.L201
	.loc 1 913 51
	movq	-30824(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 913 42
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 913 20 discriminator 1
	movl	%eax, %edx
	movq	-30824(%rbp), %rax
	movq	16(%rax), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	str2md5
	.loc 1 913 68 discriminator 2
	movq	-30824(%rbp), %rdx
	movl	64(%rdx), %edx
	movl	%edx, %ecx
	.loc 1 913 64 discriminator 2
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	.loc 1 913 13 discriminator 2
	movl	%eax, -30796(%rbp)
	.loc 1 914 27
	movl	-30796(%rbp), %edx
	movl	-30812(%rbp), %eax
	addl	%eax, %edx
	.loc 1 914 36
	movq	-30824(%rbp), %rax
	movl	64(%rax), %ecx
	.loc 1 914 13
	movl	%edx, %eax
	cltd
	idivl	%ecx
	movl	%edx, -30808(%rbp)
.LBB49:
	.loc 1 915 18
	movl	$0, -30804(%rbp)
	.loc 1 915 9
	jmp	.L188
.L198:
.LBB50:
	.loc 1 917 28
	movl	-30808(%rbp), %edx
	movl	-30804(%rbp), %eax
	addl	%eax, %edx
	.loc 1 917 37
	movq	-30824(%rbp), %rax
	movl	64(%rax), %ecx
	.loc 1 917 19
	movl	%edx, %eax
	cltd
	idivl	%ecx
	movl	%edx, -30808(%rbp)
	.loc 1 919 30
	movb	$2, -30762(%rbp)
	movl	-30808(%rbp), %eax
	movb	%al, -30761(%rbp)
	.loc 1 922 45
	movq	-30824(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 922 36
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 919 30
	movl	%eax, -30760(%rbp)
	movl	$0, -30756(%rbp)
.LBB51:
	.loc 1 925 24
	movq	-30776(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30762(%rbp), %rsi
	movl	$0, %ecx
	movl	$10, %edx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 925 24 is_stmt 0 discriminator 1
	movl	%eax, -30792(%rbp)
	cmpl	$0, -30792(%rbp)
	jg	.L189
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 925 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 925 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 925 24
	jmp	.L187
.L189:
	.loc 1 925 24 discriminator 2
	movl	-30792(%rbp), %eax
.LBE51:
	.loc 1 925 22 is_stmt 1 discriminator 2
	movl	%eax, -30800(%rbp)
	.loc 1 926 13
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.LBB52:
	.loc 1 927 24
	movq	-30776(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30752(%rbp), %rsi
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 927 24 is_stmt 0 discriminator 1
	movl	%eax, -30788(%rbp)
	cmpl	$0, -30788(%rbp)
	jns	.L191
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 927 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 927 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 927 24
	jmp	.L187
.L191:
	.loc 1 927 24 discriminator 2
	cmpl	$0, -30788(%rbp)
	jne	.L192
	.loc 1 927 24 discriminator 3
	movq	-30776(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 927 24 discriminator 1
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 927 24
	jmp	.L187
.L192:
	.loc 1 927 24 discriminator 4
	movl	-30788(%rbp), %eax
.LBE52:
	.loc 1 927 22 is_stmt 1 discriminator 4
	movl	%eax, -30800(%rbp)
.LBB53:
	.loc 1 929 24
	movl	-30760(%rbp), %eax
	movl	%eax, %edx
	movq	-30824(%rbp), %rax
	movq	16(%rax), %rsi
	movq	-30776(%rbp), %rax
	movl	(%rax), %eax
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 929 24 is_stmt 0 discriminator 1
	movl	%eax, -30784(%rbp)
	cmpl	$0, -30784(%rbp)
	jg	.L193
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 929 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 929 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 929 24
	jmp	.L187
.L193:
	.loc 1 929 24 discriminator 2
	movl	-30784(%rbp), %eax
.LBE53:
	.loc 1 929 22 is_stmt 1 discriminator 2
	movl	%eax, -30800(%rbp)
	.loc 1 930 13
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.LBB54:
	.loc 1 931 24
	movq	-30776(%rbp), %rax
	movl	(%rax), %eax
	leaq	-30752(%rbp), %rsi
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 931 24 is_stmt 0 discriminator 1
	movl	%eax, -30780(%rbp)
	cmpl	$0, -30780(%rbp)
	jns	.L194
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	.loc 1 931 24 discriminator 2
	call	__errno_location@PLT
	.loc 1 931 24 discriminator 3
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 931 24
	jmp	.L187
.L194:
	.loc 1 931 24 discriminator 2
	cmpl	$0, -30780(%rbp)
	jne	.L195
	.loc 1 931 24 discriminator 3
	movq	-30776(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 931 24 discriminator 1
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 931 24
	jmp	.L187
.L195:
	.loc 1 931 24 discriminator 4
	movl	-30780(%rbp), %eax
.LBE54:
	.loc 1 931 22 is_stmt 1 discriminator 4
	movl	%eax, -30800(%rbp)
	.loc 1 932 17
	leaq	-30752(%rbp), %rax
	movl	$7, %edx
	leaq	.LC17(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 932 16 discriminator 1
	testl	%eax, %eax
	jne	.L196
	.loc 1 934 17
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 935 17
	leaq	.LC99(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 936 17
	movq	-30824(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC28(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 937 17
	leaq	.LC100(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 938 17
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L196:
	.loc 1 940 17
	leaq	-30752(%rbp), %rax
	movl	$8, %edx
	leaq	.LC77(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 940 16 discriminator 1
	testl	%eax, %eax
	jne	.L197
	.loc 1 942 17
	leaq	.LC101(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L197:
.LBE50:
	.loc 1 915 63 discriminator 2
	addl	$1, -30804(%rbp)
.L188:
	.loc 1 915 27 discriminator 1
	cmpl	$1, -30804(%rbp)
	jle	.L198
.LBE49:
	.loc 1 947 5
	jmp	.L187
.L201:
	.loc 1 911 13
	nop
.L187:
	.loc 1 948 9
	movq	-30776(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 949 17
	movq	-30776(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -30776(%rbp)
	.loc 1 950 10
	addl	$1, -30812(%rbp)
.L185:
.LBE48:
	.loc 1 908 12
	cmpq	$0, -30776(%rbp)
	jne	.L199
	.loc 1 952 1
	nop
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L200
	call	__stack_chk_fail@PLT
.L200:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE331:
	.size	delete_file, .-delete_file
	.section	.rodata
	.align 8
.LC102:
	.string	"\033[36m    DFS SERVER STATUS CHECK\n\033[0m"
	.align 8
.LC103:
	.string	"\033[36m[*] CHECKING INDIVIDUAL SERVER STATUS\n\n\033[0m"
	.align 8
.LC104:
	.string	"\033[36m[*] Server %d (%s:%s): \033[0m"
.LC105:
	.string	"\033[31mOFFLINE\n\033[0m"
	.align 8
.LC106:
	.string	"\033[31m    Unable to establish connection\n\n\033[0m"
.LC107:
	.string	"\033[32mONLINE\n\033[0m"
	.align 8
.LC108:
	.string	"\033[32m    Connection established successfully\n\033[0m"
	.align 8
.LC110:
	.string	"\033[32m    Response time: %.2f ms\n\n\033[0m"
	.align 8
.LC111:
	.string	"\033[36m    SYSTEM STATUS SUMMARY\n\033[0m"
.LC112:
	.string	"Servers available: %d/%d "
	.align 8
.LC113:
	.string	"\033[32m(All servers online)\n\033[0m"
	.align 8
.LC114:
	.string	"\033[33m(System operational with reduced redundancy)\n\033[0m"
	.align 8
.LC115:
	.string	"\033[33m(System partially operational - limited functionality)\n\033[0m"
	.align 8
.LC116:
	.string	"\033[31m(System offline - no servers available)\n\033[0m"
	.align 8
.LC117:
	.string	"\nSystem capabilities with %d/%d servers:\n"
.LC118:
	.string	"\033[32m  [\342\234\223] \033[0m"
.LC119:
	.string	"\033[31m  [\342\234\227] \033[0m"
.LC120:
	.string	"LIST - View available files"
.LC121:
	.string	"GET - Download complete files"
.LC122:
	.string	"full"
.LC123:
	.string	"partial"
	.align 8
.LC124:
	.string	"PUT - Upload files (with %s redundancy)\n"
	.align 8
.LC125:
	.string	"DELETE - Remove files (may be incomplete with partial servers)\n"
	.text
	.globl	server_info
	.type	server_info, @function
server_info:
.LFB332:
	.loc 1 955 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 1 956 5
	leaq	.LC52(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 957 5
	leaq	.LC102(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 958 5
	leaq	.LC54(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 960 9
	movl	$0, -16(%rbp)
	.loc 1 961 9
	movl	$0, -12(%rbp)
	.loc 1 962 22
	movq	-24(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -8(%rbp)
	.loc 1 967 5
	leaq	.LC103(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 970 11
	jmp	.L203
.L207:
	.loc 1 972 9
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movl	-16(%rbp), %ecx
	leal	1(%rcx), %esi
	movq	%rdx, %rcx
	movq	%rax, %rdx
	leaq	.LC104(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 975 13
	movl	-16(%rbp), %edx
	movq	-8(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	connect_server
	.loc 1 975 12 discriminator 1
	testl	%eax, %eax
	jns	.L204
	.loc 1 977 13
	leaq	.LC105(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 978 13
	leaq	.LC106(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L205
.L204:
	.loc 1 982 27
	addl	$1, -12(%rbp)
	.loc 1 983 13
	leaq	.LC107(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 984 13
	leaq	.LC108(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 987 72
	call	rand@PLT
	.loc 1 987 79 discriminator 1
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
	.loc 1 987 13 discriminator 1
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%edx, %xmm1
	movsd	.LC109(%rip), %xmm0
	addsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, %xmm0
	leaq	.LC110(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
.L205:
	.loc 1 991 20
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 991 12
	testl	%eax, %eax
	js	.L206
	.loc 1 993 13
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
.L206:
	.loc 1 995 17
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -8(%rbp)
	.loc 1 996 10
	addl	$1, -16(%rbp)
.L203:
	.loc 1 970 12
	cmpq	$0, -8(%rbp)
	jne	.L207
	.loc 1 1000 5
	leaq	.LC52(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1001 5
	leaq	.LC111(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1002 5
	leaq	.LC54(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1005 5
	movq	-24(%rbp), %rax
	movl	64(%rax), %edx
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC112(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1007 29
	movq	-24(%rbp), %rax
	movl	64(%rax), %eax
	.loc 1 1007 8
	cmpl	%eax, -12(%rbp)
	jne	.L208
	.loc 1 1009 9
	leaq	.LC113(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L209
.L208:
	.loc 1 1011 13
	cmpl	$1, -12(%rbp)
	jle	.L210
	.loc 1 1013 9
	leaq	.LC114(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L209
.L210:
	.loc 1 1015 13
	cmpl	$0, -12(%rbp)
	jle	.L211
	.loc 1 1017 9
	leaq	.LC115(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L209
.L211:
	.loc 1 1021 9
	leaq	.LC116(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L209:
	.loc 1 1025 5
	movq	-24(%rbp), %rax
	movl	64(%rax), %edx
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC117(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1027 8
	cmpl	$0, -12(%rbp)
	jle	.L212
	.loc 1 1029 9
	leaq	.LC118(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L213
.L212:
	.loc 1 1033 9
	leaq	.LC119(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L213:
	.loc 1 1035 5
	leaq	.LC120(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 1037 8
	cmpl	$3, -12(%rbp)
	jle	.L214
	.loc 1 1039 9
	leaq	.LC118(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L215
.L214:
	.loc 1 1043 9
	leaq	.LC119(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L215:
	.loc 1 1045 5
	leaq	.LC121(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 1047 8
	cmpl	$0, -12(%rbp)
	jle	.L216
	.loc 1 1049 9
	leaq	.LC118(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L217
.L216:
	.loc 1 1053 9
	leaq	.LC119(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L217:
	.loc 1 1055 5
	cmpl	$3, -12(%rbp)
	jle	.L218
	.loc 1 1055 5 is_stmt 0 discriminator 1
	leaq	.LC122(%rip), %rax
	jmp	.L219
.L218:
	.loc 1 1055 5 discriminator 2
	leaq	.LC123(%rip), %rax
.L219:
	.loc 1 1055 5 discriminator 4
	movq	%rax, %rsi
	leaq	.LC124(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1058 8 is_stmt 1
	cmpl	$0, -12(%rbp)
	jle	.L220
	.loc 1 1060 9
	leaq	.LC118(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L221
.L220:
	.loc 1 1064 9
	leaq	.LC119(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L221:
	.loc 1 1066 5
	leaq	.LC125(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 1068 5
	leaq	.LC54(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1072 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE332:
	.size	server_info, .-server_info
	.section	.rodata
.LC126:
	.string	"SERVER INFO"
.LC127:
	.string	"UNKNOWN"
.LC128:
	.string	"DELETE"
.LC129:
	.string	"LIST"
.LC130:
	.string	"GET"
.LC131:
	.string	"PUT"
.LC132:
	.string	"\033[36m    OPERATION: %s\n\033[0m"
	.text
	.globl	handle_req
	.type	handle_req, @function
handle_req:
.LFB333:
	.loc 1 1091 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 1093 5
	leaq	.LC52(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1095 14
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	.loc 1 1094 5
	cmpl	$1, %eax
	je	.L223
	.loc 1 1095 47
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	.loc 1 1096 41
	testl	%eax, %eax
	je	.L224
	.loc 1 1096 45 discriminator 1
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	.loc 1 1097 41
	cmpl	$3, %eax
	je	.L225
	.loc 1 1097 45 discriminator 1
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	.loc 1 1098 41
	cmpl	$2, %eax
	je	.L226
	.loc 1 1098 45 discriminator 1
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	.loc 1 1099 74
	cmpl	$5, %eax
	jne	.L227
	.loc 1 1099 74 is_stmt 0 discriminator 1
	leaq	.LC126(%rip), %rax
	jmp	.L232
.L227:
	.loc 1 1099 74 discriminator 2
	leaq	.LC127(%rip), %rax
	jmp	.L232
.L226:
	.loc 1 1098 41 is_stmt 1 discriminator 2
	leaq	.LC128(%rip), %rax
	jmp	.L232
.L225:
	.loc 1 1097 41 discriminator 2
	leaq	.LC129(%rip), %rax
	jmp	.L232
.L224:
	.loc 1 1096 41 discriminator 2
	leaq	.LC130(%rip), %rax
	jmp	.L232
.L223:
	.loc 1 1094 5 discriminator 1
	leaq	.LC131(%rip), %rax
.L232:
	.loc 1 1094 5 is_stmt 0 discriminator 3
	movq	%rax, %rsi
	leaq	.LC132(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1100 5 is_stmt 1
	leaq	.LC54(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1103 15
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	.loc 1 1103 5
	cmpl	$5, %eax
	ja	.L243
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L235(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L235(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L235:
	.long	.L240-.L235
	.long	.L239-.L235
	.long	.L238-.L235
	.long	.L237-.L235
	.long	.L236-.L235
	.long	.L234-.L235
	.text
.L237:
	.loc 1 1106 9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	list_file
	.loc 1 1107 9
	jmp	.L241
.L240:
	.loc 1 1109 9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	get_file
	.loc 1 1110 9
	jmp	.L241
.L239:
	.loc 1 1112 9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	put_file
	.loc 1 1113 9
	jmp	.L241
.L238:
	.loc 1 1115 9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	delete_file
	.loc 1 1116 9
	jmp	.L241
.L236:
	.loc 1 1118 9
	movl	$0, %edi
	call	exit@PLT
.L234:
	.loc 1 1121 9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	server_info
	.loc 1 1122 9
	jmp	.L241
.L243:
	.loc 1 1124 9
	nop
.L241:
	.loc 1 1127 12
	movl	$0, %eax
	.loc 1 1128 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE333:
	.size	handle_req, .-handle_req
	.section	.rodata
	.align 4
.LC48:
	.long	1120403456
	.align 8
.LC109:
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
	.long	0x1d17
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
	.uleb128 0x5
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
	.uleb128 0x5
	.long	.LASF8
	.byte	0x3
	.byte	0x26
	.byte	0x17
	.long	0x4f
	.uleb128 0xd
	.byte	0x2
	.byte	0x5
	.long	.LASF9
	.uleb128 0x5
	.long	.LASF10
	.byte	0x3
	.byte	0x28
	.byte	0x1c
	.long	0x56
	.uleb128 0x29
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x5
	.long	.LASF11
	.byte	0x3
	.byte	0x2a
	.byte	0x16
	.long	0x41
	.uleb128 0xd
	.byte	0x8
	.byte	0x5
	.long	.LASF12
	.uleb128 0x5
	.long	.LASF13
	.byte	0x3
	.byte	0x98
	.byte	0x19
	.long	0x96
	.uleb128 0x5
	.long	.LASF14
	.byte	0x3
	.byte	0x99
	.byte	0x1b
	.long	0x96
	.uleb128 0x5
	.long	.LASF15
	.byte	0x3
	.byte	0x9a
	.byte	0x19
	.long	0x83
	.uleb128 0x5
	.long	.LASF16
	.byte	0x3
	.byte	0xa0
	.byte	0x1a
	.long	0x96
	.uleb128 0x5
	.long	.LASF17
	.byte	0x3
	.byte	0xa2
	.byte	0x1f
	.long	0x96
	.uleb128 0x5
	.long	.LASF18
	.byte	0x3
	.byte	0xc2
	.byte	0x1b
	.long	0x96
	.uleb128 0x6
	.long	0xef
	.uleb128 0x12
	.long	0xe5
	.uleb128 0xd
	.byte	0x1
	.byte	0x6
	.long	.LASF19
	.uleb128 0x1c
	.long	0xef
	.uleb128 0x5
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
	.uleb128 0x5
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
	.uleb128 0x6
	.long	0x2a2
	.uleb128 0x6
	.long	0x107
	.uleb128 0xe
	.long	0xef
	.long	0x2c1
	.uleb128 0xf
	.long	0x3a
	.byte	0
	.byte	0
	.uleb128 0x6
	.long	0x29a
	.uleb128 0x15
	.long	.LASF52
	.uleb128 0x6
	.long	0x2c6
	.uleb128 0x15
	.long	.LASF53
	.uleb128 0x6
	.long	0x2d0
	.uleb128 0x6
	.long	0x2ac
	.uleb128 0xe
	.long	0xef
	.long	0x2ef
	.uleb128 0xf
	.long	0x3a
	.byte	0x13
	.byte	0
	.uleb128 0x6
	.long	0xf6
	.uleb128 0x12
	.long	0x2ef
	.uleb128 0x5
	.long	.LASF54
	.byte	0x6
	.byte	0x4e
	.byte	0x13
	.long	0xd9
	.uleb128 0x6
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
	.uleb128 0x3
	.long	.LASF62
	.byte	0x8
	.byte	0x35
	.byte	0x23
	.long	0x379
	.byte	0
	.uleb128 0x3
	.long	.LASF63
	.byte	0x8
	.byte	0x36
	.byte	0x23
	.long	0x379
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.long	0x351
	.uleb128 0x5
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
	.uleb128 0x3
	.long	.LASF66
	.byte	0x9
	.byte	0x18
	.byte	0x7
	.long	0x83
	.byte	0
	.uleb128 0x3
	.long	.LASF67
	.byte	0x9
	.byte	0x19
	.byte	0x10
	.long	0x41
	.byte	0x4
	.uleb128 0x3
	.long	.LASF68
	.byte	0x9
	.byte	0x1a
	.byte	0x7
	.long	0x83
	.byte	0x8
	.uleb128 0x3
	.long	.LASF69
	.byte	0x9
	.byte	0x1c
	.byte	0x10
	.long	0x41
	.byte	0xc
	.uleb128 0x3
	.long	.LASF70
	.byte	0x9
	.byte	0x20
	.byte	0x7
	.long	0x83
	.byte	0x10
	.uleb128 0x3
	.long	.LASF71
	.byte	0x9
	.byte	0x22
	.byte	0x9
	.long	0x70
	.byte	0x14
	.uleb128 0x3
	.long	.LASF72
	.byte	0x9
	.byte	0x23
	.byte	0x9
	.long	0x70
	.byte	0x16
	.uleb128 0x3
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
	.uleb128 0x5
	.long	.LASF77
	.byte	0xa
	.byte	0x48
	.byte	0x3
	.long	0x400
	.uleb128 0x6
	.long	0x454
	.uleb128 0x12
	.long	0x44a
	.uleb128 0x2c
	.uleb128 0x5
	.long	.LASF78
	.byte	0xb
	.byte	0x18
	.byte	0x13
	.long	0x64
	.uleb128 0x5
	.long	.LASF79
	.byte	0xb
	.byte	0x19
	.byte	0x14
	.long	0x77
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x5
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
	.uleb128 0x3
	.long	.LASF93
	.byte	0xe
	.byte	0xba
	.byte	0x5
	.long	0x4dd
	.byte	0
	.uleb128 0x3
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
	.uleb128 0x6
	.long	0x4e9
	.uleb128 0x11
	.long	.LASF95
	.byte	0x10
	.byte	0xf
	.byte	0xf7
	.byte	0x27
	.long	0x568
	.uleb128 0x3
	.long	.LASF96
	.byte	0xf
	.byte	0xf9
	.byte	0x5
	.long	0x4dd
	.byte	0
	.uleb128 0x3
	.long	.LASF97
	.byte	0xf
	.byte	0xfa
	.byte	0xf
	.long	0x5f5
	.byte	0x2
	.uleb128 0x3
	.long	.LASF98
	.byte	0xf
	.byte	0xfb
	.byte	0x14
	.long	0x5da
	.byte	0x4
	.uleb128 0x3
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
	.uleb128 0x5
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
	.uleb128 0x5
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
	.uleb128 0x3
	.long	.LASF109
	.byte	0xf
	.byte	0x21
	.byte	0xf
	.long	0x5ce
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x3
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
	.uleb128 0x6
	.long	0x68a
	.uleb128 0x6
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
	.uleb128 0x5
	.long	.LASF128
	.byte	0x12
	.byte	0x6a
	.byte	0x1a
	.long	0x743
	.uleb128 0x1c
	.long	0x732
	.uleb128 0x15
	.long	.LASF129
	.uleb128 0x5
	.long	.LASF130
	.byte	0x12
	.byte	0x6b
	.byte	0x1e
	.long	0x754
	.uleb128 0x15
	.long	.LASF131
	.uleb128 0x5
	.long	.LASF132
	.byte	0x12
	.byte	0xba
	.byte	0x1a
	.long	0x765
	.uleb128 0x15
	.long	.LASF133
	.uleb128 0x6
	.long	0x4f
	.uleb128 0x6
	.long	0x83
	.uleb128 0xe
	.long	0x4f
	.long	0x784
	.uleb128 0xf
	.long	0x3a
	.byte	0xf
	.byte	0
	.uleb128 0x6
	.long	0x73e
	.uleb128 0x31
	.byte	0x7
	.byte	0x4
	.long	0x41
	.byte	0x13
	.byte	0x71
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
	.uleb128 0x5
	.long	.LASF139
	.byte	0x13
	.byte	0x7a
	.byte	0x3
	.long	0x789
	.uleb128 0x11
	.long	.LASF140
	.byte	0x28
	.byte	0x13
	.byte	0x7f
	.byte	0x10
	.long	0x822
	.uleb128 0x3
	.long	.LASF141
	.byte	0x13
	.byte	0x80
	.byte	0x9
	.long	0x83
	.byte	0
	.uleb128 0x3
	.long	.LASF142
	.byte	0x13
	.byte	0x81
	.byte	0xb
	.long	0xe5
	.byte	0x8
	.uleb128 0x3
	.long	.LASF143
	.byte	0x13
	.byte	0x82
	.byte	0xb
	.long	0xe5
	.byte	0x10
	.uleb128 0x3
	.long	.LASF144
	.byte	0x13
	.byte	0x83
	.byte	0x9
	.long	0x83
	.byte	0x18
	.uleb128 0x3
	.long	.LASF145
	.byte	0x13
	.byte	0x84
	.byte	0x1d
	.long	0x822
	.byte	0x20
	.byte	0
	.uleb128 0x6
	.long	0x7d3
	.uleb128 0x5
	.long	.LASF140
	.byte	0x13
	.byte	0x85
	.byte	0x2
	.long	0x7d3
	.uleb128 0x32
	.byte	0x70
	.byte	0x13
	.byte	0x8e
	.byte	0x9
	.long	0x8bf
	.uleb128 0x3
	.long	.LASF146
	.byte	0x13
	.byte	0x90
	.byte	0x9
	.long	0x83
	.byte	0
	.uleb128 0x3
	.long	.LASF147
	.byte	0x13
	.byte	0x91
	.byte	0xb
	.long	0xe5
	.byte	0x8
	.uleb128 0x3
	.long	.LASF148
	.byte	0x13
	.byte	0x92
	.byte	0xb
	.long	0xe5
	.byte	0x10
	.uleb128 0x3
	.long	.LASF149
	.byte	0x13
	.byte	0x93
	.byte	0x10
	.long	0x7c7
	.byte	0x18
	.uleb128 0x3
	.long	.LASF150
	.byte	0x13
	.byte	0x94
	.byte	0x16
	.long	0x8bf
	.byte	0x20
	.uleb128 0x3
	.long	.LASF151
	.byte	0x13
	.byte	0x95
	.byte	0x16
	.long	0x70e
	.byte	0x28
	.uleb128 0x3
	.long	.LASF152
	.byte	0x13
	.byte	0x96
	.byte	0x9
	.long	0x8c4
	.byte	0x30
	.uleb128 0x3
	.long	.LASF153
	.byte	0x13
	.byte	0x97
	.byte	0x9
	.long	0x83
	.byte	0x40
	.uleb128 0x3
	.long	.LASF154
	.byte	0x13
	.byte	0x98
	.byte	0x9
	.long	0x83
	.byte	0x44
	.uleb128 0x3
	.long	.LASF155
	.byte	0x13
	.byte	0x9a
	.byte	0x15
	.long	0x43e
	.byte	0x48
	.byte	0
	.uleb128 0x6
	.long	0x827
	.uleb128 0xe
	.long	0x83
	.long	0x8d4
	.uleb128 0xf
	.long	0x3a
	.byte	0x3
	.byte	0
	.uleb128 0x5
	.long	.LASF156
	.byte	0x13
	.byte	0x9b
	.byte	0x3
	.long	0x833
	.uleb128 0x11
	.long	.LASF157
	.byte	0xa
	.byte	0x1
	.byte	0x2e
	.byte	0x10
	.long	0x922
	.uleb128 0x3
	.long	.LASF147
	.byte	0x1
	.byte	0x30
	.byte	0xd
	.long	0x455
	.byte	0
	.uleb128 0x3
	.long	.LASF158
	.byte	0x1
	.byte	0x31
	.byte	0xd
	.long	0x455
	.byte	0x1
	.uleb128 0x3
	.long	.LASF159
	.byte	0x1
	.byte	0x32
	.byte	0xe
	.long	0x46d
	.byte	0x2
	.uleb128 0x3
	.long	.LASF160
	.byte	0x1
	.byte	0x33
	.byte	0xe
	.long	0x46d
	.byte	0x6
	.byte	0
	.uleb128 0x5
	.long	.LASF161
	.byte	0x1
	.byte	0x34
	.byte	0x3
	.long	0x8e0
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
	.long	0x951
	.uleb128 0x1
	.long	0x2ef
	.byte	0
	.uleb128 0xc
	.long	.LASF163
	.byte	0x14
	.byte	0x9c
	.byte	0xc
	.long	0x83
	.long	0x96c
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
	.long	0x98c
	.uleb128 0x1
	.long	0xe5
	.uleb128 0x1
	.long	0x2ef
	.uleb128 0x1
	.long	0x3a
	.byte	0
	.uleb128 0xc
	.long	.LASF165
	.byte	0x14
	.byte	0xf6
	.byte	0xe
	.long	0xe5
	.long	0x9a7
	.uleb128 0x1
	.long	0x2ef
	.uleb128 0x1
	.long	0x83
	.byte	0
	.uleb128 0xc
	.long	.LASF166
	.byte	0x6
	.byte	0xb8
	.byte	0xc
	.long	0x83
	.long	0x9bd
	.uleb128 0x1
	.long	0x305
	.byte	0
	.uleb128 0x9
	.long	.LASF167
	.byte	0x6
	.value	0x2df
	.byte	0xf
	.long	0x2e
	.long	0x9e3
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
	.long	.LASF168
	.byte	0x6
	.value	0x193
	.byte	0xc
	.long	0x83
	.long	0xa00
	.uleb128 0x1
	.long	0x48b
	.uleb128 0x1
	.long	0x2f4
	.uleb128 0x20
	.byte	0
	.uleb128 0xc
	.long	.LASF169
	.byte	0x14
	.byte	0x2b
	.byte	0xe
	.long	0x48
	.long	0xa20
	.uleb128 0x1
	.long	0x48
	.uleb128 0x1
	.long	0x44a
	.uleb128 0x1
	.long	0x3a
	.byte	0
	.uleb128 0x9
	.long	.LASF170
	.byte	0x6
	.value	0x2d8
	.byte	0xf
	.long	0x2e
	.long	0xa46
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
	.long	.LASF171
	.byte	0x15
	.value	0x2a0
	.byte	0xe
	.long	0x48
	.long	0xa5d
	.uleb128 0x1
	.long	0x3a
	.byte	0
	.uleb128 0x9
	.long	.LASF172
	.byte	0x6
	.value	0x307
	.byte	0x11
	.long	0x96
	.long	0xa74
	.uleb128 0x1
	.long	0x305
	.byte	0
	.uleb128 0x9
	.long	.LASF173
	.byte	0x6
	.value	0x301
	.byte	0xc
	.long	0x83
	.long	0xa95
	.uleb128 0x1
	.long	0x305
	.uleb128 0x1
	.long	0x96
	.uleb128 0x1
	.long	0x83
	.byte	0
	.uleb128 0x9
	.long	.LASF174
	.byte	0x14
	.value	0x111
	.byte	0xe
	.long	0xe5
	.long	0xab1
	.uleb128 0x1
	.long	0x2ef
	.uleb128 0x1
	.long	0x83
	.byte	0
	.uleb128 0x9
	.long	.LASF175
	.byte	0x6
	.value	0x108
	.byte	0xe
	.long	0x305
	.long	0xacd
	.uleb128 0x1
	.long	0x2f4
	.uleb128 0x1
	.long	0x2f4
	.byte	0
	.uleb128 0xc
	.long	.LASF176
	.byte	0x14
	.byte	0x9f
	.byte	0xc
	.long	0x83
	.long	0xaed
	.uleb128 0x1
	.long	0x2ef
	.uleb128 0x1
	.long	0x2ef
	.uleb128 0x1
	.long	0x3a
	.byte	0
	.uleb128 0xc
	.long	.LASF177
	.byte	0x10
	.byte	0x91
	.byte	0x10
	.long	0x2f9
	.long	0xb12
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
	.long	.LASF178
	.byte	0x10
	.byte	0x8a
	.byte	0x10
	.long	0x2f9
	.long	0xb37
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
	.long	.LASF179
	.byte	0x14
	.value	0x197
	.byte	0xf
	.long	0x2e
	.long	0xb4e
	.uleb128 0x1
	.long	0x2ef
	.byte	0
	.uleb128 0x21
	.long	.LASF195
	.byte	0x11
	.value	0x29a
	.byte	0xd
	.long	0xb61
	.uleb128 0x1
	.long	0x70e
	.byte	0
	.uleb128 0x9
	.long	.LASF180
	.byte	0x10
	.value	0x115
	.byte	0xc
	.long	0x83
	.long	0xb8c
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
	.long	0xba4
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
	.long	0xbc9
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
	.long	0xbec
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
	.long	0xc18
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
	.long	0xc38
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
	.long	0xc55
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
	.long	0xc6c
	.uleb128 0x1
	.long	0x83
	.byte	0
	.uleb128 0x9
	.long	.LASF191
	.byte	0x11
	.value	0x294
	.byte	0xc
	.long	0x83
	.long	0xc92
	.uleb128 0x1
	.long	0x2f4
	.uleb128 0x1
	.long	0x2f4
	.uleb128 0x1
	.long	0x718
	.uleb128 0x1
	.long	0xc97
	.byte	0
	.uleb128 0x6
	.long	0x70e
	.uleb128 0x12
	.long	0xc92
	.uleb128 0x33
	.long	.LASF192
	.byte	0x15
	.value	0x2f4
	.byte	0xd
	.long	0xcaf
	.uleb128 0x1
	.long	0x83
	.byte	0
	.uleb128 0xc
	.long	.LASF193
	.byte	0x15
	.byte	0x69
	.byte	0xc
	.long	0x83
	.long	0xcc5
	.uleb128 0x1
	.long	0x2ef
	.byte	0
	.uleb128 0xc
	.long	.LASF194
	.byte	0x14
	.byte	0x3d
	.byte	0xe
	.long	0x48
	.long	0xce5
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
	.long	0xcf8
	.uleb128 0x1
	.long	0x48
	.byte	0
	.uleb128 0x9
	.long	.LASF197
	.byte	0xc
	.value	0x166
	.byte	0xc
	.long	0x83
	.long	0xd0f
	.uleb128 0x1
	.long	0x83
	.byte	0
	.uleb128 0x21
	.long	.LASF198
	.byte	0x19
	.value	0x2c0
	.byte	0x6
	.long	0xd22
	.uleb128 0x1
	.long	0xd22
	.byte	0
	.uleb128 0x6
	.long	0x748
	.uleb128 0x9
	.long	.LASF199
	.byte	0x19
	.value	0x2cf
	.byte	0xc
	.long	0x83
	.long	0xd48
	.uleb128 0x1
	.long	0xd22
	.uleb128 0x1
	.long	0x76a
	.uleb128 0x1
	.long	0xd48
	.byte	0
	.uleb128 0x6
	.long	0x41
	.uleb128 0x9
	.long	.LASF200
	.byte	0x19
	.value	0x2cd
	.byte	0xc
	.long	0x83
	.long	0xd6e
	.uleb128 0x1
	.long	0xd22
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
	.long	0xd8f
	.uleb128 0x1
	.long	0xd22
	.uleb128 0x1
	.long	0x784
	.uleb128 0x1
	.long	0xd8f
	.byte	0
	.uleb128 0x6
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
	.long	0xd22
	.uleb128 0x22
	.long	.LASF225
	.value	0x442
	.byte	0x7
	.long	0x48
	.quad	.LFB333
	.quad	.LFE333-.LFB333
	.uleb128 0x1
	.byte	0x9c
	.long	0xddf
	.uleb128 0x17
	.string	"sd"
	.value	0x442
	.byte	0x21
	.long	0xddf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x6
	.long	0x8d4
	.uleb128 0x18
	.long	.LASF206
	.value	0x3ba
	.quad	.LFB332
	.quad	.LFE332-.LFB332
	.uleb128 0x1
	.byte	0x9c
	.long	0xe3b
	.uleb128 0x17
	.string	"sd"
	.value	0x3ba
	.byte	0x21
	.long	0xddf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xa
	.string	"i"
	.value	0x3c0
	.byte	0x9
	.long	0x83
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.long	.LASF204
	.value	0x3c1
	.byte	0x9
	.long	0x83
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x2
	.long	.LASF205
	.value	0x3c2
	.byte	0x16
	.long	0x8bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x18
	.long	.LASF207
	.value	0x385
	.quad	.LFB331
	.quad	.LFE331-.LFB331
	.uleb128 0x1
	.byte	0x9c
	.long	0xfcb
	.uleb128 0x17
	.string	"sd"
	.value	0x385
	.byte	0x21
	.long	0xddf
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30840
	.uleb128 0xa
	.string	"i"
	.value	0x388
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30828
	.uleb128 0x2
	.long	.LASF208
	.value	0x388
	.byte	0x10
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30816
	.uleb128 0x2
	.long	.LASF205
	.value	0x389
	.byte	0x16
	.long	0x8bf
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30792
	.uleb128 0x2
	.long	.LASF209
	.value	0x38a
	.byte	0xa
	.long	0xfcb
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30768
	.uleb128 0x19
	.long	.LASF145
	.value	0x3b3
	.byte	0x5
	.quad	.L187
	.uleb128 0x8
	.quad	.LBB48
	.quad	.LBE48-.LBB48
	.uleb128 0x2
	.long	.LASF210
	.value	0x391
	.byte	0xd
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30812
	.uleb128 0x2
	.long	.LASF211
	.value	0x392
	.byte	0xd
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30824
	.uleb128 0x8
	.quad	.LBB49
	.quad	.LBE49-.LBB49
	.uleb128 0xa
	.string	"j"
	.value	0x393
	.byte	0x12
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30820
	.uleb128 0x8
	.quad	.LBB50
	.quad	.LBE50-.LBB50
	.uleb128 0x2
	.long	.LASF212
	.value	0x397
	.byte	0x1e
	.long	0x922
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30778
	.uleb128 0x4
	.quad	.LBB51
	.quad	.LBE51-.LBB51
	.long	0xf56
	.uleb128 0x2
	.long	.LASF208
	.value	0x39d
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30808
	.byte	0
	.uleb128 0x4
	.quad	.LBB52
	.quad	.LBE52-.LBB52
	.long	0xf7d
	.uleb128 0x2
	.long	.LASF208
	.value	0x39f
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30804
	.byte	0
	.uleb128 0x4
	.quad	.LBB53
	.quad	.LBE53-.LBB53
	.long	0xfa4
	.uleb128 0x2
	.long	.LASF208
	.value	0x3a1
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30800
	.byte	0
	.uleb128 0x8
	.quad	.LBB54
	.quad	.LBE54-.LBB54
	.uleb128 0x2
	.long	.LASF208
	.value	0x3a3
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
	.long	0xfdc
	.uleb128 0x34
	.long	0x3a
	.value	0x77ff
	.byte	0
	.uleb128 0x18
	.long	.LASF213
	.value	0x2c2
	.quad	.LFB330
	.quad	.LFE330-.LFB330
	.uleb128 0x1
	.byte	0x9c
	.long	0x126f
	.uleb128 0x17
	.string	"sd"
	.value	0x2c2
	.byte	0x1f
	.long	0xddf
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30888
	.uleb128 0xa
	.string	"i"
	.value	0x2c6
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30876
	.uleb128 0x2
	.long	.LASF208
	.value	0x2c6
	.byte	0x10
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30848
	.uleb128 0x2
	.long	.LASF205
	.value	0x2c7
	.byte	0x16
	.long	0x8bf
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30824
	.uleb128 0x2
	.long	.LASF209
	.value	0x2c8
	.byte	0xa
	.long	0xfcb
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30768
	.uleb128 0x1d
	.long	.LASF214
	.byte	0x20
	.byte	0x1
	.value	0x2cb
	.byte	0x14
	.long	0x1084
	.uleb128 0xb
	.long	.LASF148
	.byte	0x1
	.value	0x2cd
	.byte	0xf
	.long	0xe5
	.byte	0
	.uleb128 0xb
	.long	.LASF215
	.byte	0x1
	.value	0x2ce
	.byte	0xd
	.long	0x8c4
	.byte	0x8
	.uleb128 0xb
	.long	.LASF145
	.byte	0x1
	.value	0x2cf
	.byte	0x1b
	.long	0x126f
	.byte	0x18
	.byte	0
	.uleb128 0x25
	.long	.LASF216
	.byte	0x1
	.value	0x2d0
	.byte	0x7
	.long	0x104b
	.uleb128 0x2
	.long	.LASF217
	.value	0x2d2
	.byte	0x12
	.long	0x10a2
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30816
	.uleb128 0x6
	.long	0x1084
	.uleb128 0x19
	.long	.LASF145
	.value	0x32e
	.byte	0x5
	.quad	.L145
	.uleb128 0x4
	.quad	.LBB37
	.quad	.LBE37-.LBB37
	.long	0x11c0
	.uleb128 0x2
	.long	.LASF212
	.value	0x2de
	.byte	0x1a
	.long	0x922
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30778
	.uleb128 0x2
	.long	.LASF218
	.value	0x2e7
	.byte	0xd
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30872
	.uleb128 0x4
	.quad	.LBB38
	.quad	.LBE38-.LBB38
	.long	0x1115
	.uleb128 0x2
	.long	.LASF208
	.value	0x2e3
	.byte	0x14
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30844
	.byte	0
	.uleb128 0x4
	.quad	.LBB39
	.quad	.LBE39-.LBB39
	.long	0x113c
	.uleb128 0x2
	.long	.LASF208
	.value	0x2e5
	.byte	0x14
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30840
	.byte	0
	.uleb128 0x35
	.long	.LLRL0
	.uleb128 0x2
	.long	.LASF219
	.value	0x2fb
	.byte	0x13
	.long	0xe5
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30832
	.uleb128 0x2
	.long	.LASF158
	.value	0x2fc
	.byte	0x11
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30880
	.uleb128 0x4
	.quad	.LBB41
	.quad	.LBE41-.LBB41
	.long	0x118a
	.uleb128 0x2
	.long	.LASF208
	.value	0x2ed
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30836
	.byte	0
	.uleb128 0x8
	.quad	.LBB42
	.quad	.LBE42-.LBB42
	.uleb128 0x2
	.long	.LASF220
	.value	0x302
	.byte	0x1e
	.long	0x10a2
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30808
	.uleb128 0x2
	.long	.LASF221
	.value	0x303
	.byte	0x15
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30868
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x8
	.quad	.LBB44
	.quad	.LBE44-.LBB44
	.uleb128 0x2
	.long	.LASF220
	.value	0x347
	.byte	0x16
	.long	0x10a2
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30800
	.uleb128 0x8
	.quad	.LBB45
	.quad	.LBE45-.LBB45
	.uleb128 0x2
	.long	.LASF222
	.value	0x34b
	.byte	0x11
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30864
	.uleb128 0x2
	.long	.LASF223
	.value	0x34c
	.byte	0x11
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30860
	.uleb128 0x2
	.long	.LASF224
	.value	0x37b
	.byte	0x1a
	.long	0x10a2
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30792
	.uleb128 0x4
	.quad	.LBB46
	.quad	.LBE46-.LBB46
	.long	0x124b
	.uleb128 0xa
	.string	"j"
	.value	0x34e
	.byte	0x16
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30856
	.byte	0
	.uleb128 0x8
	.quad	.LBB47
	.quad	.LBE47-.LBB47
	.uleb128 0xa
	.string	"j"
	.value	0x36a
	.byte	0x16
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30852
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x6
	.long	0x104b
	.uleb128 0x22
	.long	.LASF226
	.value	0x29a
	.byte	0x5
	.long	0x83
	.quad	.LFB329
	.quad	.LFE329-.LFB329
	.uleb128 0x1
	.byte	0x9c
	.long	0x12f2
	.uleb128 0x1b
	.long	.LASF227
	.value	0x29a
	.byte	0x27
	.long	0x2ef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1b
	.long	.LASF219
	.value	0x29a
	.byte	0x3f
	.long	0x486
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1b
	.long	.LASF158
	.value	0x29a
	.byte	0x57
	.long	0x76f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x2
	.long	.LASF228
	.value	0x29d
	.byte	0x11
	.long	0x2ef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.long	.LASF229
	.value	0x2a8
	.byte	0x11
	.long	0x2ef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.long	.LASF230
	.value	0x2b2
	.byte	0xc
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x22
	.long	.LASF231
	.value	0x275
	.byte	0x7
	.long	0xe5
	.quad	.LFB328
	.quad	.LFE328-.LFB328
	.uleb128 0x1
	.byte	0x9c
	.long	0x1360
	.uleb128 0x1b
	.long	.LASF227
	.value	0x275
	.byte	0x2d
	.long	0x2ef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x2
	.long	.LASF232
	.value	0x278
	.byte	0x11
	.long	0x2ef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2
	.long	.LASF229
	.value	0x282
	.byte	0x11
	.long	0x2ef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.long	.LASF230
	.value	0x289
	.byte	0xc
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.long	.LASF219
	.value	0x28c
	.byte	0xb
	.long	0xe5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x18
	.long	.LASF233
	.value	0x163
	.quad	.LFB327
	.quad	.LFE327-.LFB327
	.uleb128 0x1
	.byte	0x9c
	.long	0x17c9
	.uleb128 0x17
	.string	"sd"
	.value	0x163
	.byte	0x1e
	.long	0xddf
	.uleb128 0x4
	.byte	0x91
	.sleb128 -31000
	.uleb128 0x2
	.long	.LASF234
	.value	0x167
	.byte	0xb
	.long	0xe5
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30872
	.uleb128 0x2
	.long	.LASF210
	.value	0x170
	.byte	0xe
	.long	0x46d
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30924
	.uleb128 0xa
	.string	"i"
	.value	0x173
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30988
	.uleb128 0x2
	.long	.LASF208
	.value	0x173
	.byte	0x10
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30920
	.uleb128 0x2
	.long	.LASF205
	.value	0x174
	.byte	0x16
	.long	0x8bf
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30864
	.uleb128 0x2
	.long	.LASF235
	.value	0x177
	.byte	0x9
	.long	0x8c4
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30832
	.uleb128 0x2
	.long	.LASF236
	.value	0x178
	.byte	0x9
	.long	0x8c4
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30816
	.uleb128 0x2
	.long	.LASF237
	.value	0x179
	.byte	0xb
	.long	0x17c9
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30800
	.uleb128 0x2
	.long	.LASF209
	.value	0x17a
	.byte	0xa
	.long	0xfcb
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30768
	.uleb128 0x2
	.long	.LASF238
	.value	0x17b
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30984
	.uleb128 0x2
	.long	.LASF239
	.value	0x183
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30980
	.uleb128 0x2
	.long	.LASF240
	.value	0x184
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30976
	.uleb128 0x19
	.long	.LASF145
	.value	0x20a
	.byte	0x5
	.quad	.L74
	.uleb128 0x19
	.long	.LASF241
	.value	0x201
	.byte	0x9
	.quad	.L89
	.uleb128 0x2
	.long	.LASF223
	.value	0x228
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30952
	.uleb128 0x2
	.long	.LASF148
	.value	0x248
	.byte	0xb
	.long	0xe5
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30848
	.uleb128 0xa
	.string	"fs"
	.value	0x24c
	.byte	0xb
	.long	0x305
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30856
	.uleb128 0x2
	.long	.LASF242
	.value	0x25d
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30936
	.uleb128 0x4
	.quad	.LBB17
	.quad	.LBE17-.LBB17
	.long	0x16ee
	.uleb128 0x2
	.long	.LASF211
	.value	0x194
	.byte	0xd
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30972
	.uleb128 0x4
	.quad	.LBB18
	.quad	.LBE18-.LBB18
	.long	0x1505
	.uleb128 0xa
	.string	"j"
	.value	0x197
	.byte	0x12
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30968
	.byte	0
	.uleb128 0x8
	.quad	.LBB19
	.quad	.LBE19-.LBB19
	.uleb128 0xa
	.string	"j"
	.value	0x19e
	.byte	0x12
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30964
	.uleb128 0x8
	.quad	.LBB20
	.quad	.LBE20-.LBB20
	.uleb128 0x2
	.long	.LASF212
	.value	0x1ac
	.byte	0x1e
	.long	0x922
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30848
	.uleb128 0x2
	.long	.LASF243
	.value	0x1d6
	.byte	0x11
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30892
	.uleb128 0x2
	.long	.LASF244
	.value	0x1e3
	.byte	0x11
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30960
	.uleb128 0x4
	.quad	.LBB21
	.quad	.LBE21-.LBB21
	.long	0x1590
	.uleb128 0x2
	.long	.LASF208
	.value	0x1bb
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30916
	.byte	0
	.uleb128 0x4
	.quad	.LBB22
	.quad	.LBE22-.LBB22
	.long	0x15b7
	.uleb128 0x2
	.long	.LASF208
	.value	0x1bc
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30912
	.byte	0
	.uleb128 0x4
	.quad	.LBB23
	.quad	.LBE23-.LBB23
	.long	0x15de
	.uleb128 0x2
	.long	.LASF208
	.value	0x1be
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30908
	.byte	0
	.uleb128 0x4
	.quad	.LBB24
	.quad	.LBE24-.LBB24
	.long	0x1605
	.uleb128 0x2
	.long	.LASF208
	.value	0x1bf
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30904
	.byte	0
	.uleb128 0x4
	.quad	.LBB25
	.quad	.LBE25-.LBB25
	.long	0x162c
	.uleb128 0x2
	.long	.LASF208
	.value	0x1c9
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30900
	.byte	0
	.uleb128 0x4
	.quad	.LBB26
	.quad	.LBE26-.LBB26
	.long	0x1653
	.uleb128 0x2
	.long	.LASF208
	.value	0x1cb
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30896
	.byte	0
	.uleb128 0x4
	.quad	.LBB27
	.quad	.LBE27-.LBB27
	.long	0x167a
	.uleb128 0x2
	.long	.LASF208
	.value	0x1e1
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30888
	.byte	0
	.uleb128 0x4
	.quad	.LBB28
	.quad	.LBE28-.LBB28
	.long	0x16a1
	.uleb128 0x2
	.long	.LASF208
	.value	0x1e7
	.byte	0x1c
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30876
	.byte	0
	.uleb128 0x4
	.quad	.LBB29
	.quad	.LBE29-.LBB29
	.long	0x16c8
	.uleb128 0x2
	.long	.LASF208
	.value	0x1f4
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30884
	.byte	0
	.uleb128 0x8
	.quad	.LBB30
	.quad	.LBE30-.LBB30
	.uleb128 0x2
	.long	.LASF208
	.value	0x1f6
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30880
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x4
	.quad	.LBB31
	.quad	.LBE31-.LBB31
	.long	0x1713
	.uleb128 0xa
	.string	"i"
	.value	0x21a
	.byte	0xe
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30956
	.byte	0
	.uleb128 0x4
	.quad	.LBB32
	.quad	.LBE32-.LBB32
	.long	0x1738
	.uleb128 0xa
	.string	"i"
	.value	0x229
	.byte	0xe
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30948
	.byte	0
	.uleb128 0x4
	.quad	.LBB33
	.quad	.LBE33-.LBB33
	.long	0x175d
	.uleb128 0xa
	.string	"i"
	.value	0x23c
	.byte	0x12
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30944
	.byte	0
	.uleb128 0x4
	.quad	.LBB34
	.quad	.LBE34-.LBB34
	.long	0x1782
	.uleb128 0xa
	.string	"i"
	.value	0x252
	.byte	0x12
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30940
	.byte	0
	.uleb128 0x4
	.quad	.LBB35
	.quad	.LBE35-.LBB35
	.long	0x17a7
	.uleb128 0xa
	.string	"i"
	.value	0x25e
	.byte	0xe
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30932
	.byte	0
	.uleb128 0x8
	.quad	.LBB36
	.quad	.LBE36-.LBB36
	.uleb128 0xa
	.string	"i"
	.value	0x264
	.byte	0xe
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30928
	.byte	0
	.byte	0
	.uleb128 0xe
	.long	0xe5
	.long	0x17d9
	.uleb128 0xf
	.long	0x3a
	.byte	0x3
	.byte	0
	.uleb128 0x18
	.long	.LASF245
	.value	0x12a
	.quad	.LFB326
	.quad	.LFE326-.LFB326
	.uleb128 0x1
	.byte	0x9c
	.long	0x18c6
	.uleb128 0x17
	.string	"sd"
	.value	0x12a
	.byte	0x1e
	.long	0xddf
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0xa
	.string	"fs"
	.value	0x12c
	.byte	0xb
	.long	0x305
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x2
	.long	.LASF234
	.value	0x133
	.byte	0xb
	.long	0xe5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x2
	.long	.LASF210
	.value	0x13d
	.byte	0xe
	.long	0x46d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x2
	.long	.LASF246
	.value	0x141
	.byte	0x9
	.long	0x83
	.uleb128 0x3
	.byte	0x91
	.sleb128 -108
	.uleb128 0x2
	.long	.LASF247
	.value	0x144
	.byte	0x9
	.long	0x8c4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x2
	.long	.LASF237
	.value	0x145
	.byte	0xb
	.long	0x17c9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x2
	.long	.LASF248
	.value	0x146
	.byte	0x9
	.long	0x83
	.uleb128 0x3
	.byte	0x91
	.sleb128 -124
	.uleb128 0x8
	.quad	.LBB15
	.quad	.LBE15-.LBB15
	.uleb128 0xa
	.string	"i"
	.value	0x14d
	.byte	0xe
	.long	0x83
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x8
	.quad	.LBB16
	.quad	.LBE16-.LBB16
	.uleb128 0x2
	.long	.LASF249
	.value	0x14f
	.byte	0xd
	.long	0x83
	.uleb128 0x3
	.byte	0x91
	.sleb128 -116
	.uleb128 0x2
	.long	.LASF250
	.value	0x158
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
	.byte	0xca
	.quad	.LFB325
	.quad	.LFE325-.LFB325
	.uleb128 0x1
	.byte	0x9c
	.long	0x1b0d
	.uleb128 0x1a
	.string	"sd"
	.byte	0xca
	.byte	0x2c
	.long	0xddf
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30872
	.uleb128 0x13
	.long	.LASF237
	.byte	0xca
	.byte	0x36
	.long	0x486
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30880
	.uleb128 0x13
	.long	.LASF247
	.byte	0xca
	.byte	0x44
	.long	0x76f
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30888
	.uleb128 0x13
	.long	.LASF210
	.byte	0xca
	.byte	0x57
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30892
	.uleb128 0x7
	.long	.LASF205
	.byte	0xd1
	.byte	0x16
	.long	0x8bf
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30808
	.uleb128 0x14
	.string	"i"
	.byte	0xd2
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30856
	.uleb128 0x7
	.long	.LASF208
	.byte	0xd2
	.byte	0x10
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30832
	.uleb128 0x7
	.long	.LASF235
	.byte	0xd4
	.byte	0x9
	.long	0x8c4
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30784
	.uleb128 0x7
	.long	.LASF209
	.byte	0xd5
	.byte	0xa
	.long	0xfcb
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30768
	.uleb128 0x19
	.long	.LASF145
	.value	0x10e
	.byte	0x5
	.quad	.L36
	.uleb128 0x4
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.long	0x1aeb
	.uleb128 0x7
	.long	.LASF211
	.byte	0xde
	.byte	0xd
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30852
	.uleb128 0x4
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.long	0x19c8
	.uleb128 0x14
	.string	"j"
	.byte	0xe2
	.byte	0x12
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30848
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
	.sleb128 -30844
	.uleb128 0x8
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.uleb128 0x7
	.long	.LASF252
	.byte	0xee
	.byte	0x1e
	.long	0x922
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30794
	.uleb128 0x4
	.quad	.LBB8
	.quad	.LBE8-.LBB8
	.long	0x1a2e
	.uleb128 0x7
	.long	.LASF208
	.byte	0xf4
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30836
	.byte	0
	.uleb128 0x4
	.quad	.LBB9
	.quad	.LBE9-.LBB9
	.long	0x1a54
	.uleb128 0x7
	.long	.LASF208
	.byte	0xf6
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30828
	.byte	0
	.uleb128 0x4
	.quad	.LBB10
	.quad	.LBE10-.LBB10
	.long	0x1a7a
	.uleb128 0x7
	.long	.LASF208
	.byte	0xf8
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30824
	.byte	0
	.uleb128 0x4
	.quad	.LBB11
	.quad	.LBE11-.LBB11
	.long	0x1aa0
	.uleb128 0x7
	.long	.LASF208
	.byte	0xfa
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30820
	.byte	0
	.uleb128 0x4
	.quad	.LBB12
	.quad	.LBE12-.LBB12
	.long	0x1ac6
	.uleb128 0x7
	.long	.LASF208
	.byte	0xfc
	.byte	0x18
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30816
	.byte	0
	.uleb128 0x8
	.quad	.LBB13
	.quad	.LBE13-.LBB13
	.uleb128 0x7
	.long	.LASF208
	.byte	0xfe
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
	.quad	.LBB14
	.quad	.LBE14-.LBB14
	.uleb128 0xa
	.string	"i"
	.value	0x114
	.byte	0xe
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30840
	.byte	0
	.byte	0
	.uleb128 0x36
	.long	.LASF253
	.byte	0x1
	.byte	0x7e
	.byte	0x5
	.long	0x83
	.quad	.LFB324
	.quad	.LFE324-.LFB324
	.uleb128 0x1
	.byte	0x9c
	.long	0x1bb4
	.uleb128 0x1a
	.string	"sd"
	.byte	0x7e
	.byte	0x23
	.long	0xddf
	.uleb128 0x3
	.byte	0x91
	.sleb128 -184
	.uleb128 0x13
	.long	.LASF205
	.byte	0x7e
	.byte	0x38
	.long	0x8bf
	.uleb128 0x3
	.byte	0x91
	.sleb128 -192
	.uleb128 0x13
	.long	.LASF254
	.byte	0x7e
	.byte	0x45
	.long	0x83
	.uleb128 0x3
	.byte	0x91
	.sleb128 -196
	.uleb128 0x7
	.long	.LASF255
	.byte	0x80
	.byte	0x15
	.long	0x68a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x7
	.long	.LASF224
	.byte	0x80
	.byte	0x1d
	.long	0x70e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x7
	.long	.LASF256
	.byte	0x81
	.byte	0x9
	.long	0x83
	.uleb128 0x3
	.byte	0x91
	.sleb128 -172
	.uleb128 0x37
	.long	.LASF257
	.byte	0x1
	.byte	0xc5
	.byte	0x1
	.quad	.L23
	.uleb128 0x14
	.string	"s"
	.byte	0xb7
	.byte	0xa
	.long	0x1bb4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x14
	.string	"tv"
	.byte	0xbc
	.byte	0x14
	.long	0x322
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.byte	0
	.uleb128 0xe
	.long	0xef
	.long	0x1bc4
	.uleb128 0xf
	.long	0x3a
	.byte	0x2d
	.byte	0
	.uleb128 0x23
	.long	.LASF258
	.byte	0x66
	.quad	.LFB323
	.quad	.LFE323-.LFB323
	.uleb128 0x1
	.byte	0x9c
	.long	0x1c1c
	.uleb128 0x1a
	.string	"sd"
	.byte	0x66
	.byte	0x28
	.long	0xddf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x7
	.long	.LASF205
	.byte	0x68
	.byte	0x16
	.long	0x8bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x8
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x7
	.long	.LASF224
	.byte	0x6b
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
	.long	0x1c47
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
	.long	0x1c77
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
	.uleb128 0x7
	.long	.LASF263
	.byte	0x39
	.byte	0x11
	.long	0xd22
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
	.uleb128 0x7
	.long	.LASF264
	.byte	0x3c
	.byte	0x12
	.long	0x41
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x7
	.long	.LASF265
	.byte	0x3d
	.byte	0x13
	.long	0x774
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x7
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
	.uleb128 .LBB40-.Ltext0
	.uleb128 .LBE40-.Ltext0
	.byte	0x4
	.uleb128 .LBB43-.Ltext0
	.uleb128 .LBE43-.Ltext0
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
.LASF174:
	.string	"strrchr"
.LASF47:
	.string	"_prevchain"
.LASF213:
	.string	"list_file"
.LASF267:
	.string	"_IO_lock_t"
.LASF264:
	.string	"md_len"
.LASF179:
	.string	"strlen"
.LASF260:
	.string	"get_in_addr"
.LASF208:
	.string	"numbytes"
.LASF176:
	.string	"strncmp"
.LASF29:
	.string	"_IO_buf_end"
.LASF252:
	.string	"message"
.LASF234:
	.string	"temp_filename"
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
.LASF241:
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
.LASF235:
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
.LASF242:
	.string	"total_file_size"
.LASF141:
	.string	"client_sock_fd"
.LASF250:
	.string	"chunk"
.LASF178:
	.string	"send"
.LASF240:
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
.LASF171:
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
.LASF237:
	.string	"chunks"
.LASF78:
	.string	"uint8_t"
.LASF256:
	.string	"status"
.LASF88:
	.string	"SOCK_PACKET"
.LASF268:
	.string	"stderr"
.LASF236:
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
.LASF175:
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
.LASF239:
	.string	"servers_contacted"
.LASF238:
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
.LASF165:
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
.LASF210:
	.string	"hash"
.LASF262:
	.string	"length"
.LASF170:
	.string	"fread"
.LASF138:
	.string	"number_of_command"
.LASF224:
	.string	"temp"
.LASF53:
	.string	"_IO_wide_data"
.LASF230:
	.string	"original_len"
.LASF166:
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
.LASF168:
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
.LASF167:
	.string	"fwrite"
.LASF129:
	.string	"evp_md_st"
.LASF13:
	.string	"__off_t"
.LASF177:
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
.LASF169:
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
