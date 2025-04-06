	.file	"handle_req.c"
	.text
.Ltext0:
	.file 0 "/home/parth/Work/All_data/university/Network System/Assignments/PA3" "src/handle_req.c"
	.globl	get_in_addr
	.type	get_in_addr, @function
get_in_addr:
.LFB6:
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
.LFE6:
	.size	get_in_addr, .-get_in_addr
	.section	.rodata
.LC0:
	.string	"Cache-Control: no-cache"
.LC1:
	.string	"Cache-Control: no-store"
.LC2:
	.string	"Pragma: no-cache"
.LC3:
	.string	"Content-Type:"
.LC4:
	.string	"application/json"
.LC5:
	.string	"text/javascript"
.LC6:
	.string	"application/xml"
	.text
	.globl	is_dynamic_content
	.type	is_dynamic_content, @function
is_dynamic_content:
.LFB7:
	.loc 1 30 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	.loc 1 32 8
	cmpq	$0, -32(%rbp)
	je	.L5
.LBB2:
	.loc 1 34 13
	movq	-32(%rbp), %rax
	leaq	.LC0(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	.loc 1 34 12 discriminator 1
	testq	%rax, %rax
	jne	.L6
	.loc 1 35 13
	movq	-32(%rbp), %rax
	leaq	.LC1(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	.loc 1 34 61 discriminator 1
	testq	%rax, %rax
	jne	.L6
	.loc 1 36 13
	movq	-32(%rbp), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	.loc 1 35 61
	testq	%rax, %rax
	je	.L7
.L6:
	.loc 1 38 20
	movl	$1, %eax
	jmp	.L8
.L7:
	.loc 1 41 36
	movq	-32(%rbp), %rax
	leaq	.LC3(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	movq	%rax, -8(%rbp)
	.loc 1 42 12
	cmpq	$0, -8(%rbp)
	je	.L5
	.loc 1 44 17
	movq	-8(%rbp), %rax
	leaq	.LC4(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	.loc 1 44 16 discriminator 1
	testq	%rax, %rax
	jne	.L9
	.loc 1 45 17
	movq	-8(%rbp), %rax
	leaq	.LC5(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	.loc 1 44 58 discriminator 1
	testq	%rax, %rax
	jne	.L9
	.loc 1 46 17
	movq	-8(%rbp), %rax
	leaq	.LC6(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	.loc 1 45 57
	testq	%rax, %rax
	je	.L5
.L9:
	.loc 1 48 24
	movl	$1, %eax
	jmp	.L8
.L5:
.LBE2:
	.loc 1 54 8
	cmpq	$0, -24(%rbp)
	je	.L10
	.loc 1 54 24 discriminator 1
	movq	-24(%rbp), %rax
	movl	$63, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	.loc 1 54 21 discriminator 1
	testq	%rax, %rax
	je	.L10
	.loc 1 56 16
	movl	$1, %eax
	jmp	.L8
.L10:
	.loc 1 59 12
	movl	$0, %eax
.L8:
	.loc 1 60 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	is_dynamic_content, .-is_dynamic_content
	.globl	prefetch_thread_create
	.type	prefetch_thread_create, @function
prefetch_thread_create:
.LFB8:
	.loc 1 63 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -56(%rbp)
	movl	%esi, -60(%rbp)
	movq	%rdx, -72(%rbp)
	movq	%rcx, -80(%rbp)
	.loc 1 63 1
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 1 65 26
	movl	$48, %edi
	call	malloc@PLT
	movq	%rax, -32(%rbp)
	.loc 1 66 19
	movl	-60(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	.loc 1 66 17 discriminator 1
	movq	-32(%rbp), %rax
	movq	%rdx, 8(%rax)
	.loc 1 67 16
	movl	$208, %edi
	call	malloc@PLT
	movq	%rax, %rdx
	.loc 1 67 14 discriminator 1
	movq	-32(%rbp), %rax
	movq	%rdx, 32(%rax)
	.loc 1 69 9
	movq	-32(%rbp), %rax
	movq	32(%rax), %rax
	.loc 1 69 30
	movl	$-1, 4(%rax)
	.loc 1 70 9
	movq	-32(%rbp), %rax
	movq	32(%rax), %rax
	.loc 1 70 27
	movq	-56(%rbp), %rdx
	movl	156(%rdx), %edx
	.loc 1 70 23
	movl	%edx, 156(%rax)
.LBB3:
	.loc 1 72 14
	movl	$0, -44(%rbp)
	.loc 1 72 5
	jmp	.L12
.L14:
	.loc 1 74 22
	movl	-44(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 74 12
	testq	%rax, %rax
	je	.L13
	.loc 1 75 46
	movl	-44(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 75 30
	movq	(%rax), %rax
	.loc 1 75 17
	movq	-32(%rbp), %rdx
	movq	8(%rdx), %rdx
	.loc 1 75 24
	movl	-44(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	leaq	(%rdx,%rcx), %rbx
	.loc 1 75 30
	movq	%rax, %rdi
	call	strdup@PLT
	.loc 1 75 28 discriminator 1
	movq	%rax, (%rbx)
.L13:
	.loc 1 72 39 discriminator 2
	addl	$1, -44(%rbp)
.L12:
	.loc 1 72 23 discriminator 1
	movl	-44(%rbp), %eax
	cmpl	-60(%rbp), %eax
	jl	.L14
.LBE3:
	.loc 1 77 19
	movq	-32(%rbp), %rax
	movl	-60(%rbp), %edx
	movl	%edx, (%rax)
	.loc 1 79 35
	movq	-80(%rbp), %rax
	movq	24(%rax), %rax
	.loc 1 79 22
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	.loc 1 79 20 discriminator 1
	movq	-32(%rbp), %rax
	movq	%rdx, 16(%rax)
	.loc 1 80 29
	movq	-80(%rbp), %rax
	movq	32(%rax), %rax
	.loc 1 80 85
	testq	%rax, %rax
	je	.L15
	.loc 1 80 64 discriminator 1
	movq	-80(%rbp), %rax
	movq	32(%rax), %rax
	.loc 1 80 51 discriminator 1
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	jmp	.L16
.L15:
	.loc 1 80 85 discriminator 2
	movl	$0, %edx
.L16:
	.loc 1 80 21 discriminator 4
	movq	-32(%rbp), %rax
	movq	%rdx, 24(%rax)
	.loc 1 81 43
	movq	-80(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 81 30
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	.loc 1 81 28 discriminator 1
	movq	-32(%rbp), %rax
	movq	%rdx, 40(%rax)
	.loc 1 83 5
	movq	-32(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movq	%rdx, %rcx
	movq	prefetch_thread_func@GOTPCREL(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	.loc 1 84 5
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	pthread_detach@PLT
	.loc 1 85 1
	nop
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	prefetch_thread_create, .-prefetch_thread_create
	.section	.rodata
	.align 8
.LC7:
	.string	"\033[35m[+] (%d) Prefetching *not* Cached uri: %s%s\n\033[0m"
.LC8:
	.string	"80"
	.align 8
.LC9:
	.string	"\033[33m[+] (%d) Requesting file from server: %s:%s%s\n\033[0m"
.LC10:
	.string	"8080"
.LC11:
	.string	"localhost"
.LC12:
	.string	"127.0.1.1"
	.align 8
.LC13:
	.string	"%s 404 Not Found\r\nContent-Type: text/plain\r\n\r\n cannot req proxy"
	.align 8
.LC14:
	.string	"\033[31m[-] send-server failed for server %d\n\033[0m"
.LC15:
	.string	"\033[31mgetaddrinfo\n\033[0m"
	.align 8
.LC16:
	.string	"%s 403 Forbidden\r\nContent-Type: text/plain\r\n\r\nBlocked"
	.align 8
.LC17:
	.string	"\033[31m[-] (%d) send-server failed for server %d\n\033[0m"
.LC18:
	.string	"\033[31mserver: socket"
	.align 8
.LC19:
	.string	"\033[31m\n[-] (%d) connect failed for server %d\n\033[0m"
	.align 8
.LC20:
	.string	"\033[32m[+] (%d) Connection established to server: %s\n[+] Server IP address: %s:%s\n\033[0m"
	.align 8
.LC21:
	.string	"\033[33mExisting connection found %d \n\033[0m"
.LC22:
	.string	"Connection: close"
.LC23:
	.string	"GET %s %s\r\nHost: %s\r\n%s\r\n%s\r\n"
.LC24:
	.string	"GET %s %s\r\nHost: %s\r\n%s\r\n\r\n"
.LC25:
	.string	"[+] Sent request %s \n\r"
	.align 8
.LC26:
	.string	"\033[31m[-] (%d) send failed for server %d \n\033[0m"
	.align 8
.LC27:
	.string	"[-] Recv failed for proxy <-> server \n\r"
	.align 8
.LC28:
	.string	"[-] Connetion close proxy <-> server \n\r"
	.align 8
.LC29:
	.string	"\033[31m[-] (%d) Memory allocation failed for links array (requested %zu bytes)\n\033[0m"
	.align 8
.LC30:
	.string	"\033[32m[+] (%d) Sent %d bytes directly (%s %s) !\n\033[0m"
	.align 8
.LC31:
	.string	"\033[32m[+] (%d) %d bytes Saved to cache ! (%s %s) !\n\033[0m"
	.align 8
.LC32:
	.string	"\033[32m[+] (%d) Prefetching for %s:%s/%s \n\033[0m"
	.text
	.globl	if_not_cached
	.type	if_not_cached, @function
if_not_cached:
.LFB9:
	.loc 1 88 1
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
	leaq	-28672(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$2232, %rsp
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	movq	%rdi, -30904(%rbp)
	movq	%rsi, -30912(%rbp)
	movl	%edx, -30916(%rbp)
	movl	%ecx, -30920(%rbp)
	.loc 1 88 1
	movq	%fs:40, %rax
	movq	%rax, -40(%rbp)
	xorl	%eax, %eax
	.loc 1 90 8
	cmpl	$0, -30920(%rbp)
	jne	.L19
	.loc 1 91 9
	movq	-30904(%rbp), %rax
	movq	16(%rax), %r12
	movq	-30904(%rbp), %rax
	movq	24(%rax), %rbx
	call	gettid@PLT
	.loc 1 91 9 is_stmt 0 discriminator 1
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L19:
	.loc 1 97 9 is_stmt 1
	movl	$0, -30892(%rbp)
	.loc 1 98 12
	movq	$0, -30840(%rbp)
	.loc 1 100 5
	movq	-30904(%rbp), %rax
	movq	16(%rax), %r13
	.loc 1 102 18
	movq	-30904(%rbp), %rax
	movq	32(%rax), %rax
	.loc 1 100 5
	testq	%rax, %rax
	je	.L20
	.loc 1 100 5 is_stmt 0 discriminator 1
	movq	-30904(%rbp), %rax
	movq	32(%rax), %rbx
	jmp	.L21
.L20:
	.loc 1 100 5 discriminator 2
	leaq	.LC8(%rip), %rbx
.L21:
	.loc 1 100 5 discriminator 4
	movq	-30904(%rbp), %rax
	movq	24(%rax), %r12
	call	gettid@PLT
	.loc 1 100 5 discriminator 1
	movq	%r13, %r8
	movq	%rbx, %rcx
	movq	%r12, %rdx
	movl	%eax, %esi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 104 5 is_stmt 1
	leaq	-30816(%rbp), %rax
	movl	$48, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 105 21
	movl	$0, -30812(%rbp)
	.loc 1 106 23
	movl	$1, -30808(%rbp)
	.loc 1 108 15
	movq	-30904(%rbp), %rax
	movq	32(%rax), %rax
	.loc 1 108 8
	testq	%rax, %rax
	jne	.L22
	.loc 1 109 37
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	.loc 1 109 35 discriminator 1
	movq	-30904(%rbp), %rax
	movq	%rdx, 32(%rax)
.L22:
	.loc 1 111 22
	movq	-30904(%rbp), %rax
	movq	32(%rax), %rax
	.loc 1 111 9
	leaq	.LC10(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 111 8 discriminator 1
	testl	%eax, %eax
	jne	.L23
	.loc 1 111 74 discriminator 1
	movq	-30904(%rbp), %rax
	movq	24(%rax), %rax
	.loc 1 111 61 discriminator 1
	leaq	.LC11(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 111 56 discriminator 1
	testl	%eax, %eax
	je	.L24
	.loc 1 111 124 discriminator 3
	movq	-30904(%rbp), %rax
	movq	24(%rax), %rax
	.loc 1 111 111 discriminator 3
	leaq	.LC12(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 111 108 discriminator 1
	testl	%eax, %eax
	jne	.L23
.L24:
	.loc 1 111 160 discriminator 4
	cmpl	$0, -30916(%rbp)
	je	.L23
.LBB4:
	.loc 1 114 9
	movq	-30904(%rbp), %rax
	movq	8(%rax), %rdx
	leaq	-30856(%rbp), %rax
	leaq	.LC13(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	.loc 1 115 13
	movq	-30856(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	.loc 1 115 13 is_stmt 0 discriminator 1
	movq	-30856(%rbp), %rsi
	movq	-30912(%rbp), %rax
	movl	4(%rax), %eax
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 115 12 is_stmt 1 discriminator 2
	testq	%rax, %rax
	jns	.L25
	.loc 1 117 81
	call	__errno_location@PLT
	.loc 1 117 13 discriminator 1
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC14(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L25:
	.loc 1 119 9
	movq	-30856(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 120 16
	movl	$-1, %eax
	jmp	.L63
.L23:
.LBE4:
	.loc 1 124 9
	movl	$-1, -30888(%rbp)
	.loc 1 126 8
	cmpl	$0, -30888(%rbp)
	jns	.L27
.LBB5:
	.loc 1 128 54
	movq	-30904(%rbp), %rax
	movq	32(%rax), %rsi
	.loc 1 128 32
	movq	-30904(%rbp), %rax
	movq	24(%rax), %rax
	.loc 1 128 14
	leaq	-30864(%rbp), %rcx
	leaq	-30816(%rbp), %rdx
	movq	%rax, %rdi
	call	getaddrinfo@PLT
	.loc 1 128 12 discriminator 1
	testl	%eax, %eax
	jns	.L28
	.loc 1 130 13
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 131 19
	movq	-30912(%rbp), %rax
	movl	4(%rax), %eax
	.loc 1 131 16
	testl	%eax, %eax
	jle	.L29
	.loc 1 131 40 discriminator 1
	cmpl	$0, -30916(%rbp)
	je	.L29
.LBB6:
	.loc 1 135 17
	movq	-30904(%rbp), %rax
	movq	8(%rax), %rdx
	leaq	-30856(%rbp), %rax
	leaq	.LC16(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	.loc 1 137 22
	movq	-30856(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	.loc 1 137 22 is_stmt 0 discriminator 1
	movq	-30856(%rbp), %rsi
	movq	-30912(%rbp), %rax
	movl	4(%rax), %eax
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 137 20 is_stmt 1 discriminator 2
	testq	%rax, %rax
	jns	.L30
	.loc 1 139 104
	call	__errno_location@PLT
	.loc 1 139 21 discriminator 1
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	.loc 1 139 21 is_stmt 0 discriminator 2
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC17(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L30:
	.loc 1 141 17 is_stmt 1
	movq	-30856(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L29:
.LBE6:
	.loc 1 144 20
	movl	$-1, %eax
	jmp	.L63
.L28:
	.loc 1 147 19
	movq	-30864(%rbp), %rax
	movq	%rax, -30848(%rbp)
	.loc 1 147 9
	jmp	.L32
.L37:
	.loc 1 151 27
	movq	-30848(%rbp), %rax
	movl	12(%rax), %edx
	movq	-30848(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-30848(%rbp), %rax
	movl	4(%rax), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	socket@PLT
	movl	%eax, -30888(%rbp)
	.loc 1 151 16 discriminator 1
	cmpl	$0, -30888(%rbp)
	jns	.L33
	.loc 1 153 17
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	.loc 1 154 17
	jmp	.L34
.L33:
	.loc 1 157 18
	movq	-30848(%rbp), %rax
	movl	16(%rax), %edx
	.loc 1 157 38
	movq	-30848(%rbp), %rax
	movq	24(%rax), %rax
	.loc 1 157 18
	movq	%rax, %rcx
	movl	-30888(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	connect@PLT
	.loc 1 157 16 discriminator 1
	testl	%eax, %eax
	jns	.L65
	.loc 1 159 98
	call	__errno_location@PLT
	.loc 1 159 17 discriminator 1
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	.loc 1 159 17 is_stmt 0 discriminator 2
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC19(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 160 17 is_stmt 1
	movl	-30888(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 161 17
	nop
.L34:
	.loc 1 147 50 discriminator 2
	movq	-30848(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -30848(%rbp)
.L32:
	.loc 1 147 36 discriminator 1
	cmpq	$0, -30848(%rbp)
	jne	.L37
	jmp	.L36
.L65:
	.loc 1 164 13
	nop
.L36:
	.loc 1 167 12
	cmpq	$0, -30848(%rbp)
	jne	.L38
	.loc 1 169 19
	movq	-30912(%rbp), %rax
	movl	4(%rax), %eax
	.loc 1 169 16
	testl	%eax, %eax
	jle	.L39
	.loc 1 169 40 discriminator 1
	cmpl	$0, -30916(%rbp)
	je	.L39
.LBB7:
	.loc 1 172 17
	movq	-30904(%rbp), %rax
	movq	8(%rax), %rdx
	leaq	-30856(%rbp), %rax
	leaq	.LC16(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	.loc 1 173 22
	movq	-30856(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	.loc 1 173 22 is_stmt 0 discriminator 1
	movq	-30856(%rbp), %rsi
	movq	-30912(%rbp), %rax
	movl	4(%rax), %eax
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 173 20 is_stmt 1 discriminator 2
	testq	%rax, %rax
	jns	.L39
	.loc 1 175 104
	call	__errno_location@PLT
	.loc 1 175 21 discriminator 1
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	.loc 1 175 21 is_stmt 0 discriminator 2
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC17(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L39:
.LBE7:
	.loc 1 178 13 is_stmt 1
	movl	-30888(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 179 20
	movl	$-1, %eax
	jmp	.L63
.L38:
	.loc 1 183 36
	movq	-30848(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	get_in_addr
	movq	%rax, %rsi
	.loc 1 183 9 discriminator 1
	movq	-30848(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30768(%rbp), %rdx
	movl	$46, %ecx
	movl	%eax, %edi
	call	inet_ntop@PLT
	.loc 1 187 22
	movq	-30904(%rbp), %rax
	movq	32(%rax), %rax
	.loc 1 184 9
	testq	%rax, %rax
	je	.L41
	.loc 1 184 9 is_stmt 0 discriminator 1
	movq	-30904(%rbp), %rax
	movq	32(%rax), %rbx
	jmp	.L42
.L41:
	.loc 1 184 9 discriminator 2
	leaq	.LC8(%rip), %rbx
.L42:
	.loc 1 184 9 discriminator 4
	movq	-30904(%rbp), %rax
	movq	24(%rax), %r12
	call	gettid@PLT
	movl	%eax, %esi
	.loc 1 184 9 discriminator 1
	leaq	-30768(%rbp), %rax
	movq	%rbx, %r8
	movq	%rax, %rcx
	movq	%r12, %rdx
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 189 9 is_stmt 1
	movq	-30904(%rbp), %rax
	movq	24(%rax), %rax
	movl	-30888(%rbp), %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	save_connection@PLT
	.loc 1 190 9
	movq	-30864(%rbp), %rax
	movq	%rax, %rdi
	call	freeaddrinfo@PLT
.LBE5:
	jmp	.L43
.L27:
	.loc 1 193 9
	movl	-30888(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L43:
	.loc 1 197 17
	leaq	.LC22(%rip), %rax
	movq	%rax, -30832(%rbp)
	.loc 1 201 15
	movq	-30904(%rbp), %rax
	movq	112(%rax), %rax
	.loc 1 201 8
	testq	%rax, %rax
	je	.L44
	.loc 1 203 9
	movq	-30904(%rbp), %rax
	movq	112(%rax), %rsi
	movq	-30904(%rbp), %rax
	movq	24(%rax), %rdi
	movq	-30904(%rbp), %rax
	movq	8(%rax), %rcx
	movq	-30904(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-30832(%rbp), %r8
	leaq	-30856(%rbp), %rax
	subq	$8, %rsp
	pushq	%rsi
	movq	%r8, %r9
	movq	%rdi, %r8
	leaq	.LC23(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	addq	$16, %rsp
	jmp	.L45
.L44:
	.loc 1 208 9
	movq	-30904(%rbp), %rax
	movq	24(%rax), %rsi
	movq	-30904(%rbp), %rax
	movq	8(%rax), %rcx
	movq	-30904(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-30832(%rbp), %rdi
	leaq	-30856(%rbp), %rax
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC24(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
.L45:
	.loc 1 211 5
	movq	-30856(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC25(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 213 9
	movq	-30856(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	.loc 1 213 9 is_stmt 0 discriminator 1
	movq	-30856(%rbp), %rsi
	movl	-30888(%rbp), %eax
	movl	$16384, %ecx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 213 8 is_stmt 1 discriminator 2
	testq	%rax, %rax
	jns	.L46
	.loc 1 215 86
	call	__errno_location@PLT
	.loc 1 215 9 discriminator 1
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	.loc 1 215 9 is_stmt 0 discriminator 2
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC26(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 216 9 is_stmt 1
	movl	-30888(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 217 16
	movl	$-1, %eax
	jmp	.L63
.L46:
	.loc 1 220 67
	movq	-30904(%rbp), %rax
	movq	16(%rax), %rdx
	.loc 1 220 45
	movq	-30904(%rbp), %rax
	movq	24(%rax), %rax
	.loc 1 220 19
	movq	%rax, %rsi
	movl	$0, %edi
	call	cache_add_new@PLT
	movl	%eax, -30876(%rbp)
	.loc 1 222 5
	movq	-30856(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 225 9
	movl	$1, -30872(%rbp)
.L57:
.LBB8:
	.loc 1 229 9
	leaq	-30768(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 230 25
	leaq	-30768(%rbp), %rsi
	movl	-30888(%rbp), %eax
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 230 23 discriminator 1
	movl	%eax, -30868(%rbp)
	.loc 1 230 12 discriminator 1
	cmpl	$0, -30868(%rbp)
	jns	.L47
	.loc 1 232 13
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$39, %edx
	movl	$1, %esi
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 233 13
	jmp	.L48
.L47:
	.loc 1 235 17
	cmpl	$0, -30868(%rbp)
	jne	.L49
	.loc 1 237 13
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$39, %edx
	movl	$1, %esi
	leaq	.LC28(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 238 13
	jmp	.L48
.L49:
	.loc 1 254 9
	movl	-30868(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-30768(%rbp), %rcx
	movl	-30876(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	.loc 1 256 13
	movl	$0, -30896(%rbp)
	.loc 1 257 30
	leaq	-30896(%rbp), %rdx
	leaq	-30768(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	extract_links@PLT
	movq	%rax, -30824(%rbp)
	.loc 1 259 24
	movl	-30896(%rbp), %eax
	.loc 1 259 12
	testl	%eax, %eax
	jle	.L50
	.loc 1 259 28 discriminator 1
	cmpq	$0, -30824(%rbp)
	je	.L50
	.loc 1 262 57
	movl	-30896(%rbp), %edx
	movl	-30892(%rbp), %eax
	addl	%edx, %eax
	cltq
	.loc 1 262 25
	leaq	0(,%rax,8), %rdx
	movq	-30840(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, -30840(%rbp)
	.loc 1 264 16
	cmpq	$0, -30840(%rbp)
	jne	.L51
	.loc 1 267 48
	movl	-30896(%rbp), %edx
	movl	-30892(%rbp), %eax
	addl	%edx, %eax
	cltq
	.loc 1 266 17
	leaq	0(,%rax,8), %rbx
	call	gettid@PLT
	movl	%eax, %edx
	.loc 1 266 17 is_stmt 0 discriminator 1
	movq	stderr(%rip), %rax
	movq	%rbx, %rcx
	leaq	.LC29(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 268 17 is_stmt 1
	movq	-30824(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 270 24
	movl	$-1, %eax
	jmp	.L63
.L51:
.LBB9:
	.loc 1 273 22
	movl	$0, -30884(%rbp)
	.loc 1 273 13
	jmp	.L53
.L54:
	.loc 1 275 64
	movl	-30884(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30824(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 275 46
	movq	(%rax), %rax
	.loc 1 275 39
	movl	-30892(%rbp), %ecx
	movl	-30884(%rbp), %edx
	addl	%ecx, %edx
	movslq	%edx, %rdx
	.loc 1 275 26
	leaq	0(,%rdx,8), %rcx
	movq	-30840(%rbp), %rdx
	leaq	(%rcx,%rdx), %rbx
	.loc 1 275 46
	movq	%rax, %rdi
	call	strdup@PLT
	.loc 1 275 44 discriminator 1
	movq	%rax, (%rbx)
	.loc 1 273 46 discriminator 3
	addl	$1, -30884(%rbp)
.L53:
	.loc 1 273 31 discriminator 1
	movl	-30896(%rbp), %eax
	cmpl	%eax, -30884(%rbp)
	jl	.L54
.LBE9:
	.loc 1 279 25
	movl	-30896(%rbp), %eax
	addl	%eax, -30892(%rbp)
	.loc 1 283 13
	movq	-30824(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L50:
	.loc 1 286 12
	cmpl	$0, -30916(%rbp)
	je	.L55
	.loc 1 288 17
	movl	-30868(%rbp), %eax
	movslq	%eax, %rdx
	movq	-30912(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30768(%rbp), %rsi
	movl	$16384, %ecx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 288 16 discriminator 1
	testq	%rax, %rax
	jns	.L56
	.loc 1 290 100
	call	__errno_location@PLT
	.loc 1 290 17 discriminator 1
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	.loc 1 290 17 is_stmt 0 discriminator 2
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC17(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 291 17 is_stmt 1
	movl	-30876(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 292 17
	movl	-30888(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 294 24
	movl	$-1, %eax
	jmp	.L63
.L56:
	.loc 1 296 13
	movq	-30904(%rbp), %rax
	movq	16(%rax), %r12
	movq	-30904(%rbp), %rax
	movq	24(%rax), %rbx
	call	gettid@PLT
	movl	%eax, %esi
	.loc 1 296 13 is_stmt 0 discriminator 1
	movl	-30868(%rbp), %eax
	movq	%r12, %r8
	movq	%rbx, %rcx
	movl	%eax, %edx
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L55:
	.loc 1 298 9 is_stmt 1
	movq	-30904(%rbp), %rax
	movq	16(%rax), %r12
	movq	-30904(%rbp), %rax
	movq	24(%rax), %rbx
	call	gettid@PLT
	movl	%eax, %esi
	.loc 1 298 9 is_stmt 0 discriminator 1
	movl	-30868(%rbp), %eax
	movq	%r12, %r8
	movq	%rbx, %rcx
	movl	%eax, %edx
	leaq	.LC31(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBE8:
	.loc 1 227 5 is_stmt 1
	jmp	.L57
.L48:
	.loc 1 302 5
	movl	-30876(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 304 15
	movq	-30904(%rbp), %rax
	movl	88(%rax), %eax
	.loc 1 304 7
	testl	%eax, %eax
	jne	.L59
	.loc 1 305 9
	movq	-30904(%rbp), %rax
	movq	24(%rax), %rax
	movl	$1, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	remove_connection@PLT
.L59:
	.loc 1 309 8
	cmpq	$0, -30840(%rbp)
	je	.L60
	.loc 1 309 27 discriminator 1
	cmpl	$0, -30920(%rbp)
	je	.L60
	.loc 1 311 9
	movq	-30904(%rbp), %rax
	movq	16(%rax), %r13
	movq	-30904(%rbp), %rax
	movq	32(%rax), %r12
	movq	-30904(%rbp), %rax
	movq	24(%rax), %rbx
	call	gettid@PLT
	.loc 1 311 9 is_stmt 0 discriminator 1
	movq	%r13, %r8
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 312 9 is_stmt 1
	movq	-30904(%rbp), %rcx
	movq	-30840(%rbp), %rdx
	movl	-30892(%rbp), %esi
	movq	-30912(%rbp), %rax
	movq	%rax, %rdi
	call	prefetch_thread_create
.LBB10:
	.loc 1 315 18
	movl	$0, -30880(%rbp)
	.loc 1 315 9
	jmp	.L61
.L62:
	.loc 1 317 27
	movl	-30880(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30840(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 317 13
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 315 43 discriminator 3
	addl	$1, -30880(%rbp)
.L61:
	.loc 1 315 27 discriminator 1
	movl	-30880(%rbp), %eax
	cmpl	-30892(%rbp), %eax
	jl	.L62
.L60:
.LBE10:
	.loc 1 320 5
	movq	-30840(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 324 12
	movl	$1, %eax
.L63:
	.loc 1 325 1
	movq	-40(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L64
	call	__stack_chk_fail@PLT
.L64:
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	if_not_cached, .-if_not_cached
	.section	.rodata
	.align 8
.LC33:
	.string	"\033[35m[+] (%d) Prefetching Cached uri: %s%s\n\033[0m"
	.align 8
.LC34:
	.string	"\033[32m[+] (%d) Serving file from cache: %s%s\n[+] Cache file size: %ld bytes\n\033[0m"
	.align 8
.LC35:
	.string	"\033[31m[-] (%d) Memory allocation failed\n\033[0m"
	.align 8
.LC36:
	.string	"\033[32m[+] (%d) Sent %d bytes from cache (%s/%s) !\n\033[0m"
	.text
	.globl	if_cached
	.type	if_cached, @function
if_cached:
.LFB10:
	.loc 1 328 1
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
	leaq	-28672(%rsp), %r11
.LPSRL1:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL1
	subq	$2152, %rsp
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	movq	%rdi, -30824(%rbp)
	movq	%rsi, -30832(%rbp)
	movl	%edx, -30836(%rbp)
	movl	%ecx, -30840(%rbp)
	movl	%r8d, -30844(%rbp)
	.loc 1 328 1
	movq	%fs:40, %rax
	movq	%rax, -40(%rbp)
	xorl	%eax, %eax
	.loc 1 329 8
	cmpl	$0, -30844(%rbp)
	jne	.L67
	.loc 1 330 9
	movq	-30824(%rbp), %rax
	movq	16(%rax), %r12
	movq	-30824(%rbp), %rax
	movq	24(%rax), %rbx
	call	gettid@PLT
	.loc 1 330 9 is_stmt 0 discriminator 1
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC33(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L67:
	.loc 1 334 12 is_stmt 1
	movq	$0, -30792(%rbp)
	.loc 1 335 9
	movl	$0, -30808(%rbp)
	.loc 1 339 22
	movl	-30836(%rbp), %eax
	movl	$2, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	lseek@PLT
	.loc 1 339 84 discriminator 1
	testq	%rax, %rax
	jle	.L68
	.loc 1 339 56 discriminator 1
	movl	-30836(%rbp), %eax
	movl	$1, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	lseek@PLT
	jmp	.L69
.L68:
	.loc 1 339 84 discriminator 2
	movl	$0, %eax
.L69:
	.loc 1 339 10 discriminator 4
	movq	%rax, -30784(%rbp)
	.loc 1 341 5
	movq	-30824(%rbp), %rax
	movq	16(%rax), %r12
	movq	-30824(%rbp), %rax
	movq	24(%rax), %rbx
	call	gettid@PLT
	.loc 1 341 5 is_stmt 0 discriminator 1
	movq	-30784(%rbp), %rdx
	movq	%rdx, %r8
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC34(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 346 5 is_stmt 1
	movl	-30836(%rbp), %eax
	movl	$0, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	lseek@PLT
.L80:
.LBB11:
	.loc 1 349 9
	leaq	-30768(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 350 24
	leaq	-30768(%rbp), %rcx
	movl	-30836(%rbp), %eax
	movl	$30720, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	.loc 1 350 13 discriminator 1
	movl	%eax, -30796(%rbp)
	.loc 1 351 12
	cmpl	$0, -30796(%rbp)
	jg	.L70
.LBE11:
	.loc 1 398 8
	cmpq	$0, -30792(%rbp)
	jne	.L71
	jmp	.L72
.L70:
.LBB13:
	.loc 1 356 13
	movl	$0, -30812(%rbp)
	.loc 1 357 30
	leaq	-30812(%rbp), %rdx
	leaq	-30768(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	extract_links@PLT
	movq	%rax, -30776(%rbp)
	.loc 1 358 24
	movl	-30812(%rbp), %eax
	.loc 1 358 12
	testl	%eax, %eax
	jle	.L73
	.loc 1 358 28 discriminator 1
	cmpq	$0, -30776(%rbp)
	je	.L73
	.loc 1 361 57
	movl	-30812(%rbp), %edx
	movl	-30808(%rbp), %eax
	addl	%edx, %eax
	cltq
	.loc 1 361 25
	leaq	0(,%rax,8), %rdx
	movq	-30792(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, -30792(%rbp)
	.loc 1 363 16
	cmpq	$0, -30792(%rbp)
	jne	.L74
	.loc 1 365 17
	call	gettid@PLT
	movl	%eax, %edx
	.loc 1 365 17 is_stmt 0 discriminator 1
	movq	stderr(%rip), %rax
	leaq	.LC35(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 366 17 is_stmt 1
	movq	-30776(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 368 24
	movl	$-1, %eax
	jmp	.L86
.L74:
.LBB12:
	.loc 1 372 22
	movl	$0, -30804(%rbp)
	.loc 1 372 13
	jmp	.L76
.L77:
	.loc 1 374 64
	movl	-30804(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30776(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 374 46
	movq	(%rax), %rax
	.loc 1 374 39
	movl	-30808(%rbp), %ecx
	movl	-30804(%rbp), %edx
	addl	%ecx, %edx
	movslq	%edx, %rdx
	.loc 1 374 26
	leaq	0(,%rdx,8), %rcx
	movq	-30792(%rbp), %rdx
	leaq	(%rcx,%rdx), %rbx
	.loc 1 374 46
	movq	%rax, %rdi
	call	strdup@PLT
	.loc 1 374 44 discriminator 1
	movq	%rax, (%rbx)
	.loc 1 372 46 discriminator 3
	addl	$1, -30804(%rbp)
.L76:
	.loc 1 372 31 discriminator 1
	movl	-30812(%rbp), %eax
	cmpl	%eax, -30804(%rbp)
	jl	.L77
.LBE12:
	.loc 1 378 25
	movl	-30812(%rbp), %eax
	addl	%eax, -30808(%rbp)
	.loc 1 382 13
	movq	-30776(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L73:
	.loc 1 385 12
	cmpl	$0, -30840(%rbp)
	je	.L80
	.loc 1 385 33 discriminator 1
	movq	-30832(%rbp), %rax
	movl	4(%rax), %eax
	.loc 1 385 28 discriminator 1
	testl	%eax, %eax
	jle	.L80
	.loc 1 387 17
	movl	-30796(%rbp), %eax
	movslq	%eax, %rdx
	movq	-30832(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30768(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 387 16 discriminator 1
	testq	%rax, %rax
	jns	.L79
	.loc 1 389 100
	call	__errno_location@PLT
	.loc 1 389 17 discriminator 1
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	.loc 1 389 17 is_stmt 0 discriminator 2
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC17(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 391 24 is_stmt 1
	movl	$-1, %eax
	jmp	.L86
.L79:
	.loc 1 393 13
	movq	-30824(%rbp), %rax
	movq	16(%rax), %r12
	movq	-30824(%rbp), %rax
	movq	24(%rax), %rbx
	call	gettid@PLT
	movl	%eax, %esi
	.loc 1 393 13 is_stmt 0 discriminator 1
	movl	-30796(%rbp), %eax
	movq	%r12, %r8
	movq	%rbx, %rcx
	movl	%eax, %edx
	leaq	.LC36(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBE13:
	.loc 1 348 5 is_stmt 1
	jmp	.L80
.L71:
	.loc 1 398 27 discriminator 1
	cmpl	$0, -30844(%rbp)
	je	.L72
	.loc 1 400 9
	movq	-30824(%rbp), %rax
	movq	16(%rax), %r13
	movq	-30824(%rbp), %rax
	movq	32(%rax), %r12
	movq	-30824(%rbp), %rax
	movq	24(%rax), %rbx
	call	gettid@PLT
	.loc 1 400 9 is_stmt 0 discriminator 1
	movq	%r13, %r8
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 401 9 is_stmt 1
	movq	-30824(%rbp), %rcx
	movq	-30792(%rbp), %rdx
	movl	-30808(%rbp), %esi
	movq	-30832(%rbp), %rax
	movq	%rax, %rdi
	call	prefetch_thread_create
.L72:
	.loc 1 404 5
	movl	-30836(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 407 8
	cmpq	$0, -30792(%rbp)
	je	.L82
.LBB14:
	.loc 1 409 18
	movl	$0, -30800(%rbp)
	.loc 1 409 9
	jmp	.L83
.L85:
	.loc 1 411 26
	movl	-30800(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30792(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 411 16
	testq	%rax, %rax
	je	.L84
	.loc 1 413 31
	movl	-30800(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-30792(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 413 17
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L84:
	.loc 1 409 43 discriminator 2
	addl	$1, -30800(%rbp)
.L83:
	.loc 1 409 27 discriminator 1
	movl	-30800(%rbp), %eax
	cmpl	-30808(%rbp), %eax
	jl	.L85
.LBE14:
	.loc 1 416 9
	movq	-30792(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L82:
	.loc 1 419 12
	movl	$0, %eax
.L86:
	.loc 1 420 1
	movq	-40(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L87
	call	__stack_chk_fail@PLT
.L87:
	addq	$30824, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	if_cached, .-if_cached
	.globl	check_and_send_from_cache
	.type	check_and_send_from_cache, @function
check_and_send_from_cache:
.LFB11:
	.loc 1 423 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movl	%ecx, -40(%rbp)
	movl	%r8d, -44(%rbp)
	.loc 1 427 75
	movq	-32(%rbp), %rax
	movl	156(%rax), %eax
	.loc 1 427 15
	movslq	%eax, %rcx
	movq	-24(%rbp), %rax
	movq	16(%rax), %rdx
	.loc 1 427 40
	movq	-24(%rbp), %rax
	movq	24(%rax), %rax
	.loc 1 427 15
	movq	%rax, %rsi
	movl	$0, %edi
	call	cache_lookup@PLT
	movl	%eax, -4(%rbp)
	.loc 1 429 8
	cmpl	$0, -4(%rbp)
	js	.L89
	.loc 1 429 21 discriminator 1
	cmpl	$0, -36(%rbp)
	je	.L90
.L89:
	.loc 1 432 18
	movl	-44(%rbp), %ecx
	movl	-40(%rbp), %edx
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	if_not_cached
	movl	%eax, -8(%rbp)
	.loc 1 432 16
	jmp	.L91
.L90:
	.loc 1 437 18
	movl	-44(%rbp), %edi
	movl	-40(%rbp), %ecx
	movl	-4(%rbp), %edx
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rax
	movl	%edi, %r8d
	movq	%rax, %rdi
	call	if_cached
	movl	%eax, -8(%rbp)
.L91:
	.loc 1 440 12
	movl	-8(%rbp), %eax
	.loc 1 445 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	check_and_send_from_cache, .-check_and_send_from_cache
	.section	.rodata
.LC37:
	.string	"200 OK"
.LC38:
	.string	"400 Bad Request"
.LC39:
	.string	"403 Forbidden"
.LC40:
	.string	"404 Not Found"
.LC41:
	.string	"405 Method Not Allowed"
	.align 8
.LC42:
	.string	"505 HTTP Version Not Supported"
.LC43:
	.string	"400 Unknown"
	.text
	.globl	get_status_text
	.type	get_status_text, @function
get_status_text:
.LFB12:
	.loc 1 453 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	.loc 1 454 5
	cmpl	$32, -4(%rbp)
	ja	.L94
	movl	-4(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L96(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L96(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L96:
	.long	.L94-.L96
	.long	.L101-.L96
	.long	.L100-.L96
	.long	.L94-.L96
	.long	.L99-.L96
	.long	.L94-.L96
	.long	.L94-.L96
	.long	.L94-.L96
	.long	.L98-.L96
	.long	.L94-.L96
	.long	.L94-.L96
	.long	.L94-.L96
	.long	.L94-.L96
	.long	.L94-.L96
	.long	.L94-.L96
	.long	.L94-.L96
	.long	.L97-.L96
	.long	.L94-.L96
	.long	.L94-.L96
	.long	.L94-.L96
	.long	.L94-.L96
	.long	.L94-.L96
	.long	.L94-.L96
	.long	.L94-.L96
	.long	.L94-.L96
	.long	.L94-.L96
	.long	.L94-.L96
	.long	.L94-.L96
	.long	.L94-.L96
	.long	.L94-.L96
	.long	.L94-.L96
	.long	.L94-.L96
	.long	.L95-.L96
	.text
.L101:
	.loc 1 457 16
	leaq	.LC37(%rip), %rax
	jmp	.L102
.L100:
	.loc 1 459 16
	leaq	.LC38(%rip), %rax
	jmp	.L102
.L99:
	.loc 1 461 16
	leaq	.LC39(%rip), %rax
	jmp	.L102
.L98:
	.loc 1 463 16
	leaq	.LC40(%rip), %rax
	jmp	.L102
.L97:
	.loc 1 465 16
	leaq	.LC41(%rip), %rax
	jmp	.L102
.L95:
	.loc 1 467 16
	leaq	.LC42(%rip), %rax
	jmp	.L102
.L94:
	.loc 1 469 16
	leaq	.LC43(%rip), %rax
.L102:
	.loc 1 471 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	get_status_text, .-get_status_text
	.section	.rodata
	.align 8
.LC44:
	.string	"error we will be sending %d %s"
	.align 8
.LC45:
	.string	"HTTP/1.0 %s\r\nContent-Type: text/plain\r\nContent-Length: %d\r\nConnection: close\r\n\r\n%s"
	.align 8
.LC46:
	.string	"%s %s\r\nContent-Type: text/plain\r\nContent-Length: %d\r\nConnection: close\r\n\r\n%s"
	.text
	.globl	send_error_response
	.type	send_error_response, @function
send_error_response:
.LFB13:
	.loc 1 481 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	movl	%edx, -40(%rbp)
	.loc 1 481 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 483 31
	movl	-40(%rbp), %eax
	movl	%eax, %edi
	call	get_status_text
	movq	%rax, -16(%rbp)
	.loc 1 484 18
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 484 9 discriminator 1
	movl	%eax, -28(%rbp)
	.loc 1 485 5
	movq	-16(%rbp), %rdx
	movl	-40(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC44(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 487 8
	cmpq	$0, -48(%rbp)
	jne	.L104
	.loc 1 489 9
	movq	-16(%rbp), %rsi
	movl	-28(%rbp), %ecx
	movq	-16(%rbp), %rdx
	leaq	-24(%rbp), %rax
	movq	%rsi, %r8
	leaq	.LC45(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	jmp	.L105
.L104:
	.loc 1 499 9
	movq	-16(%rbp), %rdi
	movl	-28(%rbp), %esi
	movq	-16(%rbp), %rcx
	movq	-48(%rbp), %rdx
	leaq	-24(%rbp), %rax
	movq	%rdi, %r9
	movl	%esi, %r8d
	leaq	.LC46(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
.L105:
	.loc 1 508 9
	movq	-24(%rbp), %rax
	.loc 1 508 8
	testq	%rax, %rax
	je	.L108
	.loc 1 510 9
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	.loc 1 510 9 is_stmt 0 discriminator 1
	movq	-24(%rbp), %rsi
	movl	-36(%rbp), %eax
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 511 9 is_stmt 1
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L108:
	.loc 1 513 1
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L107
	call	__stack_chk_fail@PLT
.L107:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	send_error_response, .-send_error_response
	.section	.rodata
	.align 8
.LC47:
	.string	"\033[31m[-] (%d) Select syscall failed with error: %d (%s)\n\033[0m"
	.align 8
.LC48:
	.string	"\033[33m\n[-] (%d) CONNECTION TIMEOUT:\n[-] Client connection idle for %d seconds\n------------------------------------------------------------\n\033[0m"
	.align 8
.LC49:
	.string	"\033[31m[-] (%d) peer has closed the connection exiting\n"
	.align 8
.LC50:
	.string	"\n\n==============================================================\n[+] (%d) Received request from client [%d bytes]:\n==============================================================\n%s\n"
	.align 8
.LC51:
	.string	"\033[31m[-] (%d) ACCESS DENIED: Domain is in blocklist\n[-] Blocked domain: %s\n\033[0m"
	.align 8
.LC52:
	.string	"HTTP/1.0 403 Forbidden\r\nContent-Type: text/plain\r\n\r\nBlocked"
	.text
	.globl	handle_req
	.type	handle_req, @function
handle_req:
.LFB14:
	.loc 1 533 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	leaq	-28672(%rsp), %r11
.LPSRL2:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL2
	subq	$2400, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -31080(%rbp)
	.loc 1 533 1
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
.L125:
.LBB15:
.LBB16:
	.loc 1 542 9
	leaq	-30880(%rbp), %rax
	movq	%rax, -31040(%rbp)
	movl	$0, -31060(%rbp)
	jmp	.L110
.L111:
	.loc 1 542 9 is_stmt 0 discriminator 3
	movq	-31040(%rbp), %rax
	movl	-31060(%rbp), %edx
	movq	$0, (%rax,%rdx,8)
	addl	$1, -31060(%rbp)
.L110:
	.loc 1 542 9 discriminator 1
	cmpl	$15, -31060(%rbp)
	jbe	.L111
.LBE16:
	.loc 1 543 9 is_stmt 1
	movq	-31080(%rbp), %rax
	movl	4(%rax), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	movl	%eax, %esi
	movslq	%esi, %rax
	movq	-30880(%rbp,%rax,8), %rdx
	movq	-31080(%rbp), %rax
	movl	4(%rax), %eax
	andl	$63, %eax
	movl	$1, %edi
	movl	%eax, %ecx
	salq	%cl, %rdi
	movq	%rdi, %rax
	orq	%rax, %rdx
	movslq	%esi, %rax
	movq	%rdx, -30880(%rbp,%rax,8)
	.loc 1 546 24
	movq	$10, -31024(%rbp)
	movq	$0, -31016(%rbp)
	.loc 1 549 38
	movq	-31080(%rbp), %rax
	movl	4(%rax), %eax
	.loc 1 549 29
	leal	1(%rax), %edi
	leaq	-31024(%rbp), %rdx
	leaq	-30880(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	call	select@PLT
	movl	%eax, -31056(%rbp)
	.loc 1 551 12
	cmpl	$0, -31056(%rbp)
	jns	.L112
	.loc 1 554 47
	call	__errno_location@PLT
	.loc 1 553 13
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %r12
	.loc 1 554 31
	call	__errno_location@PLT
	.loc 1 553 13
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	.loc 1 553 13 is_stmt 0 discriminator 2
	movq	stderr(%rip), %rax
	movq	%r12, %r8
	movl	%ebx, %ecx
	leaq	.LC47(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 555 13 is_stmt 1
	jmp	.L126
.L112:
	.loc 1 559 17
	cmpl	$0, -31056(%rbp)
	jne	.L114
	.loc 1 561 13
	call	gettid@PLT
	.loc 1 561 13 is_stmt 0 discriminator 1
	movl	$10, %edx
	movl	%eax, %esi
	leaq	.LC48(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 565 13 is_stmt 1
	jmp	.L126
.L114:
	.loc 1 569 18
	movq	-31080(%rbp), %rax
	movl	4(%rax), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	cltq
	movq	-30880(%rbp,%rax,8), %rdx
	movq	-31080(%rbp), %rax
	movl	4(%rax), %eax
	andl	$63, %eax
	movl	$1, %esi
	movl	%eax, %ecx
	salq	%cl, %rsi
	movq	%rsi, %rax
	andq	%rdx, %rax
	.loc 1 569 17
	testq	%rax, %rax
	je	.L125
.LBB17:
	.loc 1 571 13
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 573 17
	movl	$0, -31052(%rbp)
	.loc 1 575 54
	leaq	-30752(%rbp), %rdx
	movl	-31052(%rbp), %eax
	cltq
	leaq	(%rdx,%rax), %rsi
	.loc 1 575 29
	movq	-31080(%rbp), %rax
	movl	4(%rax), %eax
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 575 27 discriminator 1
	movl	%eax, -31048(%rbp)
	.loc 1 575 16 discriminator 1
	cmpl	$0, -31048(%rbp)
	js	.L129
	.loc 1 582 16
	cmpl	$0, -31048(%rbp)
	jne	.L117
	.loc 1 584 17
	call	gettid@PLT
	movl	%eax, %edx
	.loc 1 584 17 is_stmt 0 discriminator 1
	movq	stderr(%rip), %rax
	leaq	.LC49(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 585 17 is_stmt 1
	jmp	.L126
.L117:
	.loc 1 588 38
	movl	-31048(%rbp), %eax
	subl	$1, %eax
	.loc 1 588 25
	addl	%eax, -31052(%rbp)
	.loc 1 590 13
	call	gettid@PLT
	movl	%eax, %esi
	.loc 1 590 13 is_stmt 0 discriminator 1
	leaq	-30752(%rbp), %rdx
	movl	-31052(%rbp), %eax
	movq	%rdx, %rcx
	movl	%eax, %edx
	leaq	.LC50(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 597 13 is_stmt 1
	leaq	-31008(%rbp), %rax
	movl	$120, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 598 17
	leaq	-31008(%rbp), %rdx
	leaq	-30752(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	parse_request_line_thread_safe@PLT
	.loc 1 598 16 discriminator 1
	testl	%eax, %eax
	jns	.L118
	.loc 1 600 88
	movl	-30912(%rbp), %eax
	.loc 1 600 17
	movl	%eax, %edx
	.loc 1 600 63
	movq	-31000(%rbp), %rcx
	.loc 1 600 17
	movq	-31080(%rbp), %rax
	movl	4(%rax), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	send_error_response
	.loc 1 601 17
	jmp	.L126
.L118:
	.loc 1 604 40
	movq	-30984(%rbp), %rax
	.loc 1 604 17
	movq	%rax, %rsi
	movl	$0, %edi
	call	is_blocked@PLT
	.loc 1 604 16 discriminator 1
	testl	%eax, %eax
	je	.L120
.LBB18:
	.loc 1 606 17
	movq	-30984(%rbp), %rbx
	call	gettid@PLT
	.loc 1 606 17 is_stmt 0 discriminator 1
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC51(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 609 23 is_stmt 1
	leaq	.LC52(%rip), %rax
	movq	%rax, -31032(%rbp)
	.loc 1 610 21
	movq	-31032(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	.loc 1 610 21 is_stmt 0 discriminator 1
	movq	-31080(%rbp), %rax
	movl	4(%rax), %eax
	movq	-31032(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 610 20 is_stmt 1 discriminator 2
	testq	%rax, %rax
	jns	.L130
	.loc 1 612 104
	call	__errno_location@PLT
	.loc 1 612 21 discriminator 1
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	.loc 1 612 21 is_stmt 0 discriminator 2
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC17(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 613 21 is_stmt 1
	jmp	.L126
.L120:
.LBE18:
	.loc 1 619 93
	movq	-30992(%rbp), %rax
	.loc 1 619 29
	leaq	-30752(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	is_dynamic_content
	movl	%eax, %edx
	.loc 1 619 29 is_stmt 0 discriminator 1
	movq	-31080(%rbp), %rsi
	leaq	-31008(%rbp), %rax
	movl	$1, %r8d
	movl	$1, %ecx
	movq	%rax, %rdi
	call	check_and_send_from_cache
	movl	%eax, -31044(%rbp)
	.loc 1 622 24 is_stmt 1
	movl	-30916(%rbp), %eax
	.loc 1 622 16
	cmpl	$1, %eax
	jne	.L122
	.loc 1 622 56 discriminator 1
	movl	-30920(%rbp), %eax
	.loc 1 622 47 discriminator 1
	testl	%eax, %eax
	je	.L131
.L122:
	.loc 1 622 85 discriminator 3
	cmpl	$0, -31044(%rbp)
	js	.L131
	.loc 1 626 13
	leaq	-31008(%rbp), %rax
	movq	%rax, %rdi
	call	cleanup_header@PLT
	.loc 1 627 13
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.LBE17:
.LBE15:
	.loc 1 541 5
	jmp	.L125
.L129:
.LBB21:
.LBB20:
	.loc 1 577 17
	nop
	jmp	.L126
.L130:
.LBB19:
	.loc 1 615 17
	nop
	jmp	.L126
.L131:
.LBE19:
	.loc 1 624 17
	nop
.L126:
.LBE20:
.LBE21:
	.loc 1 634 5
	leaq	-31008(%rbp), %rax
	movq	%rax, %rdi
	call	cleanup_header@PLT
	.loc 1 637 5
	movq	-31080(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 639 12
	movl	$0, %eax
	.loc 1 640 1
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L128
	call	__stack_chk_fail@PLT
.L128:
	addq	$31072, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	handle_req, .-handle_req
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/14/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/types/time_t.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h"
	.file 9 "/usr/include/x86_64-linux-gnu/sys/select.h"
	.file 10 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"
	.file 11 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h"
	.file 12 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.file 13 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h"
	.file 14 "/usr/include/unistd.h"
	.file 15 "/usr/include/x86_64-linux-gnu/bits/sockaddr.h"
	.file 16 "/usr/include/x86_64-linux-gnu/bits/socket.h"
	.file 17 "/usr/include/netinet/in.h"
	.file 18 "/usr/include/x86_64-linux-gnu/sys/socket.h"
	.file 19 "/usr/include/netdb.h"
	.file 20 "/usr/include/x86_64-linux-gnu/bits/socket_type.h"
	.file 21 "./common.h"
	.file 22 "includes/cache.h"
	.file 23 "includes/blocklist.h"
	.file 24 "includes/prefetch.h"
	.file 25 "includes/connections.h"
	.file 26 "includes/parser.h"
	.file 27 "/usr/include/string.h"
	.file 28 "/usr/include/stdlib.h"
	.file 29 "/usr/include/arpa/inet.h"
	.file 30 "/usr/include/errno.h"
	.file 31 "/usr/include/x86_64-linux-gnu/bits/unistd_ext.h"
	.file 32 "/usr/include/pthread.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x18f8
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x2b
	.long	.LASF322
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
	.uleb128 0x2c
	.byte	0x8
	.uleb128 0xf
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
	.uleb128 0x2d
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
	.uleb128 0xf
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
	.uleb128 0x10
	.long	.LASF57
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x28e
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
	.long	0x2a7
	.byte	0x60
	.uleb128 0x1
	.long	.LASF34
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x2ac
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
	.long	0x2b1
	.byte	0x83
	.uleb128 0x1
	.long	.LASF41
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x2c1
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
	.long	0x2cb
	.byte	0x98
	.uleb128 0x1
	.long	.LASF44
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x2d5
	.byte	0xa0
	.uleb128 0x1
	.long	.LASF45
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x2ac
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
	.long	0x2da
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
	.long	0x2df
	.byte	0xc4
	.byte	0
	.uleb128 0x4
	.long	.LASF50
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0x107
	.uleb128 0x2e
	.long	.LASF323
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0x1d
	.long	.LASF51
	.uleb128 0x5
	.long	0x2a2
	.uleb128 0x5
	.long	0x107
	.uleb128 0x9
	.long	0xef
	.long	0x2c1
	.uleb128 0xb
	.long	0x3a
	.byte	0
	.byte	0
	.uleb128 0x5
	.long	0x29a
	.uleb128 0x1d
	.long	.LASF52
	.uleb128 0x5
	.long	0x2c6
	.uleb128 0x1d
	.long	.LASF53
	.uleb128 0x5
	.long	0x2d0
	.uleb128 0x5
	.long	0x2ac
	.uleb128 0x9
	.long	0xef
	.long	0x2ef
	.uleb128 0xb
	.long	0x3a
	.byte	0x13
	.byte	0
	.uleb128 0x5
	.long	0xf6
	.uleb128 0xf
	.long	0x2ef
	.uleb128 0x4
	.long	.LASF54
	.byte	0x6
	.byte	0x4e
	.byte	0x13
	.long	0xd9
	.uleb128 0x5
	.long	0x28e
	.uleb128 0x2f
	.long	.LASF324
	.byte	0x6
	.byte	0x97
	.byte	0xe
	.long	0x305
	.uleb128 0xd
	.byte	0x8
	.byte	0x5
	.long	.LASF55
	.uleb128 0x4
	.long	.LASF56
	.byte	0x7
	.byte	0xa
	.byte	0x12
	.long	0xc1
	.uleb128 0x10
	.long	.LASF58
	.byte	0x10
	.byte	0x8
	.byte	0x8
	.byte	0x8
	.long	0x351
	.uleb128 0x1
	.long	.LASF59
	.byte	0x8
	.byte	0xe
	.byte	0xc
	.long	0xc1
	.byte	0
	.uleb128 0x1
	.long	.LASF60
	.byte	0x8
	.byte	0xf
	.byte	0x11
	.long	0xcd
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.long	.LASF61
	.byte	0x9
	.byte	0x31
	.byte	0x12
	.long	0x96
	.uleb128 0x19
	.byte	0x80
	.byte	0x9
	.byte	0x3b
	.long	0x373
	.uleb128 0x1
	.long	.LASF62
	.byte	0x9
	.byte	0x40
	.byte	0xf
	.long	0x373
	.byte	0
	.byte	0
	.uleb128 0x9
	.long	0x351
	.long	0x383
	.uleb128 0xb
	.long	0x3a
	.byte	0xf
	.byte	0
	.uleb128 0x4
	.long	.LASF63
	.byte	0x9
	.byte	0x46
	.byte	0x5
	.long	0x35d
	.uleb128 0xd
	.byte	0x8
	.byte	0x7
	.long	.LASF64
	.uleb128 0x10
	.long	.LASF65
	.byte	0x10
	.byte	0xa
	.byte	0x33
	.byte	0x10
	.long	0x3be
	.uleb128 0x1
	.long	.LASF66
	.byte	0xa
	.byte	0x35
	.byte	0x23
	.long	0x3be
	.byte	0
	.uleb128 0x1
	.long	.LASF67
	.byte	0xa
	.byte	0x36
	.byte	0x23
	.long	0x3be
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.long	0x396
	.uleb128 0x4
	.long	.LASF68
	.byte	0xa
	.byte	0x37
	.byte	0x3
	.long	0x396
	.uleb128 0x10
	.long	.LASF69
	.byte	0x28
	.byte	0xb
	.byte	0x16
	.byte	0x8
	.long	0x445
	.uleb128 0x1
	.long	.LASF70
	.byte	0xb
	.byte	0x18
	.byte	0x7
	.long	0x83
	.byte	0
	.uleb128 0x1
	.long	.LASF71
	.byte	0xb
	.byte	0x19
	.byte	0x10
	.long	0x41
	.byte	0x4
	.uleb128 0x1
	.long	.LASF72
	.byte	0xb
	.byte	0x1a
	.byte	0x7
	.long	0x83
	.byte	0x8
	.uleb128 0x1
	.long	.LASF73
	.byte	0xb
	.byte	0x1c
	.byte	0x10
	.long	0x41
	.byte	0xc
	.uleb128 0x1
	.long	.LASF74
	.byte	0xb
	.byte	0x20
	.byte	0x7
	.long	0x83
	.byte	0x10
	.uleb128 0x1
	.long	.LASF75
	.byte	0xb
	.byte	0x22
	.byte	0x9
	.long	0x70
	.byte	0x14
	.uleb128 0x1
	.long	.LASF76
	.byte	0xb
	.byte	0x23
	.byte	0x9
	.long	0x70
	.byte	0x16
	.uleb128 0x1
	.long	.LASF77
	.byte	0xb
	.byte	0x24
	.byte	0x14
	.long	0x3c3
	.byte	0x18
	.byte	0
	.uleb128 0x4
	.long	.LASF78
	.byte	0xc
	.byte	0x1b
	.byte	0x1b
	.long	0x3a
	.uleb128 0x30
	.long	.LASF81
	.byte	0x38
	.byte	0xc
	.byte	0x38
	.byte	0x7
	.long	0x477
	.uleb128 0x12
	.long	.LASF79
	.byte	0xc
	.byte	0x3a
	.byte	0x8
	.long	0x477
	.uleb128 0x12
	.long	.LASF80
	.byte	0xc
	.byte	0x3b
	.byte	0xc
	.long	0x96
	.byte	0
	.uleb128 0x9
	.long	0xef
	.long	0x487
	.uleb128 0xb
	.long	0x3a
	.byte	0x37
	.byte	0
	.uleb128 0x4
	.long	.LASF81
	.byte	0xc
	.byte	0x3e
	.byte	0x1e
	.long	0x451
	.uleb128 0x1c
	.long	0x487
	.uleb128 0x25
	.byte	0x28
	.byte	0xc
	.byte	0x43
	.byte	0x9
	.long	0x4c6
	.uleb128 0x12
	.long	.LASF82
	.byte	0xc
	.byte	0x45
	.byte	0x1c
	.long	0x3cf
	.uleb128 0x12
	.long	.LASF79
	.byte	0xc
	.byte	0x46
	.byte	0x8
	.long	0x4c6
	.uleb128 0x12
	.long	.LASF80
	.byte	0xc
	.byte	0x47
	.byte	0xc
	.long	0x96
	.byte	0
	.uleb128 0x9
	.long	0xef
	.long	0x4d6
	.uleb128 0xb
	.long	0x3a
	.byte	0x27
	.byte	0
	.uleb128 0x4
	.long	.LASF83
	.byte	0xc
	.byte	0x48
	.byte	0x3
	.long	0x498
	.uleb128 0x5
	.long	0x4ec
	.uleb128 0xf
	.long	0x4e2
	.uleb128 0x31
	.uleb128 0x4
	.long	.LASF84
	.byte	0xd
	.byte	0x18
	.byte	0x13
	.long	0x64
	.uleb128 0x4
	.long	.LASF85
	.byte	0xd
	.byte	0x19
	.byte	0x14
	.long	0x77
	.uleb128 0x4
	.long	.LASF86
	.byte	0xd
	.byte	0x1a
	.byte	0x14
	.long	0x8a
	.uleb128 0x32
	.long	.LASF87
	.byte	0xe
	.value	0x112
	.byte	0x15
	.long	0xfb
	.uleb128 0x5
	.long	0xe5
	.uleb128 0xf
	.long	0x51e
	.uleb128 0x16
	.long	.LASF159
	.long	0x41
	.byte	0x14
	.byte	0x18
	.byte	0x6
	.long	0x573
	.uleb128 0x3
	.long	.LASF88
	.byte	0x1
	.uleb128 0x3
	.long	.LASF89
	.byte	0x2
	.uleb128 0x3
	.long	.LASF90
	.byte	0x3
	.uleb128 0x3
	.long	.LASF91
	.byte	0x4
	.uleb128 0x3
	.long	.LASF92
	.byte	0x5
	.uleb128 0x3
	.long	.LASF93
	.byte	0x6
	.uleb128 0x3
	.long	.LASF94
	.byte	0xa
	.uleb128 0x15
	.long	.LASF95
	.long	0x80000
	.uleb128 0x11
	.long	.LASF96
	.value	0x800
	.byte	0
	.uleb128 0x4
	.long	.LASF97
	.byte	0xf
	.byte	0x1c
	.byte	0x1c
	.long	0x56
	.uleb128 0x10
	.long	.LASF98
	.byte	0x10
	.byte	0x10
	.byte	0xb8
	.byte	0x27
	.long	0x5a7
	.uleb128 0x1
	.long	.LASF99
	.byte	0x10
	.byte	0xba
	.byte	0x5
	.long	0x573
	.byte	0
	.uleb128 0x1
	.long	.LASF100
	.byte	0x10
	.byte	0xbb
	.byte	0xa
	.long	0x5a7
	.byte	0x2
	.byte	0
	.uleb128 0x9
	.long	0xef
	.long	0x5b7
	.uleb128 0xb
	.long	0x3a
	.byte	0xd
	.byte	0
	.uleb128 0x10
	.long	.LASF101
	.byte	0x80
	.byte	0x10
	.byte	0xc5
	.byte	0x27
	.long	0x5ec
	.uleb128 0x1
	.long	.LASF102
	.byte	0x10
	.byte	0xc7
	.byte	0x5
	.long	0x573
	.byte	0
	.uleb128 0x1
	.long	.LASF103
	.byte	0x10
	.byte	0xc8
	.byte	0xa
	.long	0x5ec
	.byte	0x2
	.uleb128 0x1
	.long	.LASF104
	.byte	0x10
	.byte	0xc9
	.byte	0x14
	.long	0x3a
	.byte	0x78
	.byte	0
	.uleb128 0x9
	.long	0xef
	.long	0x5fc
	.uleb128 0xb
	.long	0x3a
	.byte	0x75
	.byte	0
	.uleb128 0x33
	.byte	0x7
	.byte	0x4
	.long	0x41
	.byte	0x10
	.byte	0xcf
	.byte	0x3
	.long	0x6a6
	.uleb128 0x3
	.long	.LASF105
	.byte	0x1
	.uleb128 0x3
	.long	.LASF106
	.byte	0x2
	.uleb128 0x3
	.long	.LASF107
	.byte	0x4
	.uleb128 0x3
	.long	.LASF108
	.byte	0x4
	.uleb128 0x3
	.long	.LASF109
	.byte	0x8
	.uleb128 0x3
	.long	.LASF110
	.byte	0x10
	.uleb128 0x3
	.long	.LASF111
	.byte	0x20
	.uleb128 0x3
	.long	.LASF112
	.byte	0x40
	.uleb128 0x3
	.long	.LASF113
	.byte	0x80
	.uleb128 0x11
	.long	.LASF114
	.value	0x100
	.uleb128 0x11
	.long	.LASF115
	.value	0x200
	.uleb128 0x11
	.long	.LASF116
	.value	0x400
	.uleb128 0x11
	.long	.LASF117
	.value	0x800
	.uleb128 0x11
	.long	.LASF118
	.value	0x1000
	.uleb128 0x11
	.long	.LASF119
	.value	0x2000
	.uleb128 0x11
	.long	.LASF120
	.value	0x4000
	.uleb128 0x11
	.long	.LASF121
	.value	0x8000
	.uleb128 0x15
	.long	.LASF122
	.long	0x10000
	.uleb128 0x15
	.long	.LASF123
	.long	0x40000
	.uleb128 0x15
	.long	.LASF124
	.long	0x4000000
	.uleb128 0x15
	.long	.LASF125
	.long	0x20000000
	.uleb128 0x15
	.long	.LASF126
	.long	0x40000000
	.byte	0
	.uleb128 0x5
	.long	0x57f
	.uleb128 0x10
	.long	.LASF127
	.byte	0x10
	.byte	0x11
	.byte	0xf7
	.byte	0x27
	.long	0x6ed
	.uleb128 0x1
	.long	.LASF128
	.byte	0x11
	.byte	0xf9
	.byte	0x5
	.long	0x573
	.byte	0
	.uleb128 0x1
	.long	.LASF129
	.byte	0x11
	.byte	0xfa
	.byte	0xf
	.long	0x77a
	.byte	0x2
	.uleb128 0x1
	.long	.LASF130
	.byte	0x11
	.byte	0xfb
	.byte	0x14
	.long	0x75f
	.byte	0x4
	.uleb128 0x1
	.long	.LASF131
	.byte	0x11
	.byte	0xfe
	.byte	0x13
	.long	0x7ff
	.byte	0x8
	.byte	0
	.uleb128 0x26
	.long	.LASF132
	.byte	0x1c
	.byte	0x11
	.value	0x108
	.byte	0x27
	.long	0x742
	.uleb128 0xc
	.long	.LASF133
	.byte	0x11
	.value	0x10a
	.byte	0x5
	.long	0x573
	.byte	0
	.uleb128 0xc
	.long	.LASF134
	.byte	0x11
	.value	0x10b
	.byte	0xf
	.long	0x77a
	.byte	0x2
	.uleb128 0xc
	.long	.LASF135
	.byte	0x11
	.value	0x10c
	.byte	0xe
	.long	0x505
	.byte	0x4
	.uleb128 0xc
	.long	.LASF136
	.byte	0x11
	.value	0x10d
	.byte	0x15
	.long	0x7e4
	.byte	0x8
	.uleb128 0xc
	.long	.LASF137
	.byte	0x11
	.value	0x10e
	.byte	0xe
	.long	0x505
	.byte	0x18
	.byte	0
	.uleb128 0x4
	.long	.LASF138
	.byte	0x12
	.byte	0x54
	.byte	0xa
	.long	0x74e
	.uleb128 0x34
	.byte	0x8
	.byte	0x12
	.byte	0x53
	.byte	0x9
	.uleb128 0x4
	.long	.LASF139
	.byte	0x11
	.byte	0x1e
	.byte	0x12
	.long	0x505
	.uleb128 0x10
	.long	.LASF140
	.byte	0x4
	.byte	0x11
	.byte	0x1f
	.byte	0x8
	.long	0x77a
	.uleb128 0x1
	.long	.LASF141
	.byte	0x11
	.byte	0x21
	.byte	0xf
	.long	0x753
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	.LASF142
	.byte	0x11
	.byte	0x7d
	.byte	0x12
	.long	0x4f9
	.uleb128 0x25
	.byte	0x10
	.byte	0x11
	.byte	0xdf
	.byte	0x5
	.long	0x7b4
	.uleb128 0x12
	.long	.LASF143
	.byte	0x11
	.byte	0xe1
	.byte	0xa
	.long	0x7b4
	.uleb128 0x12
	.long	.LASF144
	.byte	0x11
	.byte	0xe2
	.byte	0xb
	.long	0x7c4
	.uleb128 0x12
	.long	.LASF145
	.byte	0x11
	.byte	0xe3
	.byte	0xb
	.long	0x7d4
	.byte	0
	.uleb128 0x9
	.long	0x4ed
	.long	0x7c4
	.uleb128 0xb
	.long	0x3a
	.byte	0xf
	.byte	0
	.uleb128 0x9
	.long	0x4f9
	.long	0x7d4
	.uleb128 0xb
	.long	0x3a
	.byte	0x7
	.byte	0
	.uleb128 0x9
	.long	0x505
	.long	0x7e4
	.uleb128 0xb
	.long	0x3a
	.byte	0x3
	.byte	0
	.uleb128 0x10
	.long	.LASF146
	.byte	0x10
	.byte	0x11
	.byte	0xdd
	.byte	0x8
	.long	0x7ff
	.uleb128 0x1
	.long	.LASF147
	.byte	0x11
	.byte	0xe4
	.byte	0x9
	.long	0x786
	.byte	0
	.byte	0
	.uleb128 0x9
	.long	0x4f
	.long	0x80f
	.uleb128 0xb
	.long	0x3a
	.byte	0x7
	.byte	0
	.uleb128 0x26
	.long	.LASF148
	.byte	0x30
	.byte	0x13
	.value	0x235
	.byte	0x8
	.long	0x88e
	.uleb128 0xc
	.long	.LASF149
	.byte	0x13
	.value	0x237
	.byte	0x7
	.long	0x83
	.byte	0
	.uleb128 0xc
	.long	.LASF150
	.byte	0x13
	.value	0x238
	.byte	0x7
	.long	0x83
	.byte	0x4
	.uleb128 0xc
	.long	.LASF151
	.byte	0x13
	.value	0x239
	.byte	0x7
	.long	0x83
	.byte	0x8
	.uleb128 0xc
	.long	.LASF152
	.byte	0x13
	.value	0x23a
	.byte	0x7
	.long	0x83
	.byte	0xc
	.uleb128 0xc
	.long	.LASF153
	.byte	0x13
	.value	0x23b
	.byte	0xd
	.long	0x511
	.byte	0x10
	.uleb128 0xc
	.long	.LASF154
	.byte	0x13
	.value	0x23c
	.byte	0x14
	.long	0x6a6
	.byte	0x18
	.uleb128 0xc
	.long	.LASF155
	.byte	0x13
	.value	0x23d
	.byte	0x9
	.long	0xe5
	.byte	0x20
	.uleb128 0xc
	.long	.LASF156
	.byte	0x13
	.value	0x23e
	.byte	0x14
	.long	0x893
	.byte	0x28
	.byte	0
	.uleb128 0x1c
	.long	0x80f
	.uleb128 0x5
	.long	0x80f
	.uleb128 0x5
	.long	0x88e
	.uleb128 0xf
	.long	0x898
	.uleb128 0xd
	.byte	0x10
	.byte	0x5
	.long	.LASF157
	.uleb128 0xd
	.byte	0x10
	.byte	0x7
	.long	.LASF158
	.uleb128 0x16
	.long	.LASF160
	.long	0x41
	.byte	0x15
	.byte	0x66
	.byte	0xe
	.long	0x8d9
	.uleb128 0x3
	.long	.LASF161
	.byte	0
	.uleb128 0x3
	.long	.LASF162
	.byte	0x1
	.uleb128 0x3
	.long	.LASF163
	.byte	0x2
	.uleb128 0x3
	.long	.LASF164
	.byte	0x3
	.byte	0
	.uleb128 0x4
	.long	.LASF165
	.byte	0x15
	.byte	0x6c
	.byte	0x3
	.long	0x8b0
	.uleb128 0x16
	.long	.LASF166
	.long	0x41
	.byte	0x15
	.byte	0x72
	.byte	0xe
	.long	0x91f
	.uleb128 0x1e
	.string	"OK"
	.byte	0x1
	.uleb128 0x3
	.long	.LASF167
	.byte	0x2
	.uleb128 0x3
	.long	.LASF168
	.byte	0x4
	.uleb128 0x3
	.long	.LASF169
	.byte	0x8
	.uleb128 0x3
	.long	.LASF170
	.byte	0x10
	.uleb128 0x3
	.long	.LASF171
	.byte	0x20
	.uleb128 0x3
	.long	.LASF172
	.byte	0x21
	.byte	0
	.uleb128 0x4
	.long	.LASF173
	.byte	0x15
	.byte	0x7b
	.byte	0x3
	.long	0x8e5
	.uleb128 0x16
	.long	.LASF174
	.long	0x41
	.byte	0x15
	.byte	0x82
	.byte	0xe
	.long	0x966
	.uleb128 0x1e
	.string	"GET"
	.byte	0
	.uleb128 0x3
	.long	.LASF175
	.byte	0x1
	.uleb128 0x1e
	.string	"PUT"
	.byte	0x2
	.uleb128 0x3
	.long	.LASF176
	.byte	0x3
	.uleb128 0x3
	.long	.LASF177
	.byte	0x4
	.uleb128 0x3
	.long	.LASF178
	.byte	0x5
	.uleb128 0x3
	.long	.LASF179
	.byte	0x6
	.byte	0
	.uleb128 0x4
	.long	.LASF180
	.byte	0x15
	.byte	0x8b
	.byte	0x3
	.long	0x92b
	.uleb128 0x16
	.long	.LASF181
	.long	0x41
	.byte	0x15
	.byte	0x91
	.byte	0xe
	.long	0x9b9
	.uleb128 0x3
	.long	.LASF182
	.byte	0
	.uleb128 0x3
	.long	.LASF183
	.byte	0x1
	.uleb128 0x3
	.long	.LASF184
	.byte	0x2
	.uleb128 0x3
	.long	.LASF185
	.byte	0x3
	.uleb128 0x3
	.long	.LASF186
	.byte	0x4
	.uleb128 0x3
	.long	.LASF187
	.byte	0x5
	.uleb128 0x3
	.long	.LASF188
	.byte	0x6
	.uleb128 0x3
	.long	.LASF189
	.byte	0x7
	.uleb128 0x3
	.long	.LASF190
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.long	.LASF191
	.byte	0x15
	.byte	0x9c
	.byte	0x3
	.long	0x972
	.uleb128 0x10
	.long	.LASF192
	.byte	0x78
	.byte	0x15
	.byte	0xba
	.byte	0x10
	.long	0xabd
	.uleb128 0x1
	.long	.LASF193
	.byte	0x15
	.byte	0xbc
	.byte	0x10
	.long	0x8d9
	.byte	0
	.uleb128 0x1
	.long	.LASF194
	.byte	0x15
	.byte	0xbd
	.byte	0xb
	.long	0xe5
	.byte	0x8
	.uleb128 0x1
	.long	.LASF195
	.byte	0x15
	.byte	0xbf
	.byte	0xb
	.long	0xe5
	.byte	0x10
	.uleb128 0x1
	.long	.LASF196
	.byte	0x15
	.byte	0xc0
	.byte	0xb
	.long	0xe5
	.byte	0x18
	.uleb128 0x1
	.long	.LASF197
	.byte	0x15
	.byte	0xc1
	.byte	0xb
	.long	0xe5
	.byte	0x20
	.uleb128 0x1
	.long	.LASF198
	.byte	0x15
	.byte	0xc3
	.byte	0x13
	.long	0x9b9
	.byte	0x28
	.uleb128 0x1
	.long	.LASF199
	.byte	0x15
	.byte	0xc4
	.byte	0xb
	.long	0xe5
	.byte	0x30
	.uleb128 0x1
	.long	.LASF200
	.byte	0x15
	.byte	0xc6
	.byte	0xe
	.long	0x966
	.byte	0x38
	.uleb128 0x1
	.long	.LASF201
	.byte	0x15
	.byte	0xc7
	.byte	0xb
	.long	0xe5
	.byte	0x40
	.uleb128 0x1
	.long	.LASF202
	.byte	0x15
	.byte	0xc9
	.byte	0x13
	.long	0xabd
	.byte	0x48
	.uleb128 0x1
	.long	.LASF203
	.byte	0x15
	.byte	0xca
	.byte	0xb
	.long	0xe5
	.byte	0x50
	.uleb128 0x1
	.long	.LASF204
	.byte	0x15
	.byte	0xcc
	.byte	0x9
	.long	0x83
	.byte	0x58
	.uleb128 0x1
	.long	.LASF205
	.byte	0x15
	.byte	0xcd
	.byte	0x9
	.long	0x83
	.byte	0x5c
	.uleb128 0x1
	.long	.LASF206
	.byte	0x15
	.byte	0xcf
	.byte	0x9
	.long	0x83
	.byte	0x60
	.uleb128 0x1
	.long	.LASF207
	.byte	0x15
	.byte	0xd0
	.byte	0x9
	.long	0x83
	.byte	0x64
	.uleb128 0x1
	.long	.LASF208
	.byte	0x15
	.byte	0xd2
	.byte	0x9
	.long	0x83
	.byte	0x68
	.uleb128 0x1
	.long	.LASF209
	.byte	0x15
	.byte	0xd4
	.byte	0x9
	.long	0x83
	.byte	0x6c
	.uleb128 0x1
	.long	.LASF210
	.byte	0x15
	.byte	0xd6
	.byte	0xb
	.long	0xe5
	.byte	0x70
	.byte	0
	.uleb128 0x5
	.long	0x91f
	.uleb128 0x4
	.long	.LASF211
	.byte	0x15
	.byte	0xd7
	.byte	0x3
	.long	0x9c5
	.uleb128 0x19
	.byte	0xd0
	.byte	0x15
	.byte	0xe3
	.long	0xb59
	.uleb128 0x1
	.long	.LASF212
	.byte	0x15
	.byte	0xe5
	.byte	0x9
	.long	0x83
	.byte	0
	.uleb128 0x1
	.long	.LASF213
	.byte	0x15
	.byte	0xe6
	.byte	0x9
	.long	0x83
	.byte	0x4
	.uleb128 0x1
	.long	.LASF214
	.byte	0x15
	.byte	0xe7
	.byte	0x1d
	.long	0x5b7
	.byte	0x8
	.uleb128 0x1
	.long	.LASF215
	.byte	0x15
	.byte	0xe8
	.byte	0x16
	.long	0x893
	.byte	0x88
	.uleb128 0x1
	.long	.LASF216
	.byte	0x15
	.byte	0xe9
	.byte	0x9
	.long	0x83
	.byte	0x90
	.uleb128 0x1
	.long	.LASF217
	.byte	0x15
	.byte	0xea
	.byte	0x9
	.long	0x83
	.byte	0x94
	.uleb128 0x1
	.long	.LASF218
	.byte	0x15
	.byte	0xeb
	.byte	0x9
	.long	0x83
	.byte	0x98
	.uleb128 0x1
	.long	.LASF219
	.byte	0x15
	.byte	0xec
	.byte	0x9
	.long	0x83
	.byte	0x9c
	.uleb128 0x1
	.long	.LASF220
	.byte	0x15
	.byte	0xed
	.byte	0x9
	.long	0x83
	.byte	0xa0
	.uleb128 0x1
	.long	.LASF221
	.byte	0x15
	.byte	0xee
	.byte	0x15
	.long	0x4d6
	.byte	0xa8
	.byte	0
	.uleb128 0x4
	.long	.LASF222
	.byte	0x15
	.byte	0xef
	.byte	0x3
	.long	0xace
	.uleb128 0x35
	.long	.LASF223
	.value	0x1038
	.byte	0x16
	.byte	0x5
	.byte	0x10
	.long	0xba8
	.uleb128 0x1
	.long	.LASF224
	.byte	0x16
	.byte	0x7
	.byte	0xa
	.long	0xba8
	.byte	0
	.uleb128 0x1
	.long	.LASF225
	.byte	0x16
	.byte	0x8
	.byte	0xa
	.long	0xbb8
	.byte	0x21
	.uleb128 0x1f
	.long	.LASF226
	.byte	0x9
	.byte	0x13
	.long	0x3a
	.value	0x1028
	.uleb128 0x1f
	.long	.LASF227
	.byte	0xa
	.byte	0x19
	.long	0xbc9
	.value	0x1030
	.byte	0
	.uleb128 0x9
	.long	0xef
	.long	0xbb8
	.uleb128 0xb
	.long	0x3a
	.byte	0x20
	.byte	0
	.uleb128 0x9
	.long	0xef
	.long	0xbc9
	.uleb128 0x1a
	.long	0x3a
	.value	0xfff
	.byte	0
	.uleb128 0x5
	.long	0xb65
	.uleb128 0x4
	.long	.LASF228
	.byte	0x16
	.byte	0xb
	.byte	0x3
	.long	0xb65
	.uleb128 0x27
	.value	0x2028
	.byte	0x16
	.long	0xbfd
	.uleb128 0x1
	.long	.LASF229
	.byte	0x16
	.byte	0xf
	.byte	0x14
	.long	0xbfd
	.byte	0
	.uleb128 0x1f
	.long	.LASF221
	.byte	0x10
	.byte	0x15
	.long	0x4d6
	.value	0x2000
	.byte	0
	.uleb128 0x9
	.long	0xc0e
	.long	0xc0e
	.uleb128 0x1a
	.long	0x3a
	.value	0x3ff
	.byte	0
	.uleb128 0x5
	.long	0xbce
	.uleb128 0x4
	.long	.LASF230
	.byte	0x16
	.byte	0x11
	.byte	0x3
	.long	0xbda
	.uleb128 0x19
	.byte	0x10
	.byte	0x17
	.byte	0x5
	.long	0xc42
	.uleb128 0x1
	.long	.LASF231
	.byte	0x17
	.byte	0x6
	.byte	0xc
	.long	0x51e
	.byte	0
	.uleb128 0x1
	.long	.LASF232
	.byte	0x17
	.byte	0x7
	.byte	0x9
	.long	0x83
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.long	.LASF233
	.byte	0x17
	.byte	0x8
	.byte	0x3
	.long	0xc1f
	.uleb128 0x19
	.byte	0x30
	.byte	0x18
	.byte	0x9
	.long	0xca4
	.uleb128 0x1
	.long	.LASF234
	.byte	0x18
	.byte	0xa
	.byte	0x9
	.long	0x83
	.byte	0
	.uleb128 0x1
	.long	.LASF235
	.byte	0x18
	.byte	0xb
	.byte	0xc
	.long	0x51e
	.byte	0x8
	.uleb128 0x1
	.long	.LASF236
	.byte	0x18
	.byte	0xc
	.byte	0xb
	.long	0xe5
	.byte	0x10
	.uleb128 0x1
	.long	.LASF237
	.byte	0x18
	.byte	0xd
	.byte	0xb
	.long	0xe5
	.byte	0x18
	.uleb128 0x36
	.string	"sd"
	.byte	0x18
	.byte	0xe
	.byte	0x14
	.long	0xca4
	.byte	0x20
	.uleb128 0x1
	.long	.LASF194
	.byte	0x18
	.byte	0xf
	.byte	0xb
	.long	0xe5
	.byte	0x28
	.byte	0
	.uleb128 0x5
	.long	0xb59
	.uleb128 0x4
	.long	.LASF238
	.byte	0x18
	.byte	0x10
	.byte	0x3
	.long	0xc4e
	.uleb128 0x10
	.long	.LASF239
	.byte	0x48
	.byte	0x19
	.byte	0x5
	.byte	0x10
	.long	0xd04
	.uleb128 0x1
	.long	.LASF240
	.byte	0x19
	.byte	0x6
	.byte	0xa
	.long	0xba8
	.byte	0
	.uleb128 0x1
	.long	.LASF241
	.byte	0x19
	.byte	0x7
	.byte	0xb
	.long	0xe5
	.byte	0x28
	.uleb128 0x1
	.long	.LASF212
	.byte	0x19
	.byte	0x8
	.byte	0x9
	.long	0x83
	.byte	0x30
	.uleb128 0x1
	.long	.LASF226
	.byte	0x19
	.byte	0x9
	.byte	0xc
	.long	0x31d
	.byte	0x38
	.uleb128 0x1
	.long	.LASF227
	.byte	0x19
	.byte	0xa
	.byte	0x1e
	.long	0xd04
	.byte	0x40
	.byte	0
	.uleb128 0x5
	.long	0xcb5
	.uleb128 0x4
	.long	.LASF242
	.byte	0x19
	.byte	0xb
	.byte	0x3
	.long	0xcb5
	.uleb128 0x27
	.value	0x2000
	.byte	0x19
	.long	0xd2b
	.uleb128 0x1
	.long	.LASF229
	.byte	0x19
	.byte	0xe
	.byte	0x19
	.long	0xd2b
	.byte	0
	.byte	0
	.uleb128 0x9
	.long	0xd3c
	.long	0xd3c
	.uleb128 0x1a
	.long	0x3a
	.value	0x3ff
	.byte	0
	.uleb128 0x5
	.long	0xd09
	.uleb128 0x4
	.long	.LASF243
	.byte	0x19
	.byte	0xf
	.byte	0x3
	.long	0xd15
	.uleb128 0x37
	.long	.LASF257
	.byte	0x1a
	.byte	0x38
	.byte	0x6
	.long	0xd5f
	.uleb128 0x2
	.long	0xd5f
	.byte	0
	.uleb128 0x5
	.long	0xac2
	.uleb128 0x7
	.long	.LASF244
	.byte	0x17
	.byte	0xb
	.byte	0x5
	.long	0x83
	.long	0xd7f
	.uleb128 0x2
	.long	0xd7f
	.uleb128 0x2
	.long	0x2ef
	.byte	0
	.uleb128 0x5
	.long	0xc42
	.uleb128 0x7
	.long	.LASF245
	.byte	0x1a
	.byte	0x25
	.byte	0x5
	.long	0x83
	.long	0xd9f
	.uleb128 0x2
	.long	0xe5
	.uleb128 0x2
	.long	0xd5f
	.byte	0
	.uleb128 0xa
	.long	.LASF246
	.byte	0x1b
	.value	0x1a3
	.byte	0xe
	.long	0xe5
	.long	0xdb6
	.uleb128 0x2
	.long	0x83
	.byte	0
	.uleb128 0x7
	.long	.LASF247
	.byte	0x9
	.byte	0x66
	.byte	0xc
	.long	0x83
	.long	0xde0
	.uleb128 0x2
	.long	0x83
	.uleb128 0x2
	.long	0xde5
	.uleb128 0x2
	.long	0xde5
	.uleb128 0x2
	.long	0xde5
	.uleb128 0x2
	.long	0xdef
	.byte	0
	.uleb128 0x5
	.long	0x383
	.uleb128 0xf
	.long	0xde0
	.uleb128 0x5
	.long	0x329
	.uleb128 0xf
	.long	0xdea
	.uleb128 0x7
	.long	.LASF248
	.byte	0x16
	.byte	0x1a
	.byte	0x5
	.long	0x83
	.long	0xe19
	.uleb128 0x2
	.long	0xe19
	.uleb128 0x2
	.long	0x2ef
	.uleb128 0x2
	.long	0xe5
	.uleb128 0x2
	.long	0x31d
	.byte	0
	.uleb128 0x5
	.long	0xc13
	.uleb128 0xa
	.long	.LASF249
	.byte	0xe
	.value	0x173
	.byte	0x10
	.long	0x2f9
	.long	0xe3f
	.uleb128 0x2
	.long	0x83
	.uleb128 0x2
	.long	0x48
	.uleb128 0x2
	.long	0x2e
	.byte	0
	.uleb128 0xa
	.long	.LASF250
	.byte	0xe
	.value	0x153
	.byte	0x10
	.long	0x9d
	.long	0xe60
	.uleb128 0x2
	.long	0x83
	.uleb128 0x2
	.long	0x9d
	.uleb128 0x2
	.long	0x83
	.byte	0
	.uleb128 0x7
	.long	.LASF251
	.byte	0x19
	.byte	0x16
	.byte	0x5
	.long	0x83
	.long	0xe80
	.uleb128 0x2
	.long	0xe80
	.uleb128 0x2
	.long	0xe5
	.uleb128 0x2
	.long	0x83
	.byte	0
	.uleb128 0x5
	.long	0xd41
	.uleb128 0xa
	.long	.LASF252
	.byte	0x1c
	.value	0x2ab
	.byte	0xe
	.long	0x48
	.long	0xea1
	.uleb128 0x2
	.long	0x48
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0x7
	.long	.LASF253
	.byte	0x18
	.byte	0x13
	.byte	0x8
	.long	0x51e
	.long	0xebc
	.uleb128 0x2
	.long	0x2ef
	.uleb128 0x2
	.long	0xebc
	.byte	0
	.uleb128 0x5
	.long	0x83
	.uleb128 0xa
	.long	.LASF254
	.byte	0xe
	.value	0x17a
	.byte	0x10
	.long	0x2f9
	.long	0xee2
	.uleb128 0x2
	.long	0x83
	.uleb128 0x2
	.long	0x4e2
	.uleb128 0x2
	.long	0x2e
	.byte	0
	.uleb128 0x7
	.long	.LASF255
	.byte	0x12
	.byte	0x91
	.byte	0x10
	.long	0x2f9
	.long	0xf07
	.uleb128 0x2
	.long	0x83
	.uleb128 0x2
	.long	0x48
	.uleb128 0x2
	.long	0x2e
	.uleb128 0x2
	.long	0x83
	.byte	0
	.uleb128 0x7
	.long	.LASF256
	.byte	0x16
	.byte	0x18
	.byte	0x5
	.long	0x83
	.long	0xf27
	.uleb128 0x2
	.long	0xe19
	.uleb128 0x2
	.long	0x2ef
	.uleb128 0x2
	.long	0x2ef
	.byte	0
	.uleb128 0x20
	.long	.LASF258
	.byte	0x13
	.value	0x29a
	.long	0xf39
	.uleb128 0x2
	.long	0x893
	.byte	0
	.uleb128 0x7
	.long	.LASF259
	.byte	0x19
	.byte	0x14
	.byte	0x5
	.long	0x83
	.long	0xf59
	.uleb128 0x2
	.long	0xe80
	.uleb128 0x2
	.long	0xe5
	.uleb128 0x2
	.long	0x83
	.byte	0
	.uleb128 0x7
	.long	.LASF260
	.byte	0x1d
	.byte	0x40
	.byte	0x14
	.long	0x2ef
	.long	0xf7e
	.uleb128 0x2
	.long	0x83
	.uleb128 0x2
	.long	0x4e7
	.uleb128 0x2
	.long	0xea
	.uleb128 0x2
	.long	0x511
	.byte	0
	.uleb128 0xa
	.long	.LASF261
	.byte	0xe
	.value	0x166
	.byte	0xc
	.long	0x83
	.long	0xf95
	.uleb128 0x2
	.long	0x83
	.byte	0
	.uleb128 0x7
	.long	.LASF262
	.byte	0x12
	.byte	0x7e
	.byte	0xc
	.long	0x83
	.long	0xfb5
	.uleb128 0x2
	.long	0x83
	.uleb128 0x2
	.long	0x742
	.uleb128 0x2
	.long	0x511
	.byte	0
	.uleb128 0x20
	.long	.LASF263
	.byte	0x6
	.value	0x364
	.long	0xfc7
	.uleb128 0x2
	.long	0x2ef
	.byte	0
	.uleb128 0x7
	.long	.LASF264
	.byte	0x12
	.byte	0x66
	.byte	0xc
	.long	0x83
	.long	0xfe7
	.uleb128 0x2
	.long	0x83
	.uleb128 0x2
	.long	0x83
	.uleb128 0x2
	.long	0x83
	.byte	0
	.uleb128 0xa
	.long	.LASF265
	.byte	0x13
	.value	0x294
	.byte	0xc
	.long	0x83
	.long	0x100d
	.uleb128 0x2
	.long	0x2f4
	.uleb128 0x2
	.long	0x2f4
	.uleb128 0x2
	.long	0x89d
	.uleb128 0x2
	.long	0x1012
	.byte	0
	.uleb128 0x5
	.long	0x893
	.uleb128 0xf
	.long	0x100d
	.uleb128 0x20
	.long	.LASF266
	.byte	0x1c
	.value	0x2af
	.long	0x1029
	.uleb128 0x2
	.long	0x48
	.byte	0
	.uleb128 0xa
	.long	.LASF267
	.byte	0x6
	.value	0x165
	.byte	0xc
	.long	0x83
	.long	0x1046
	.uleb128 0x2
	.long	0x305
	.uleb128 0x2
	.long	0x2ef
	.uleb128 0x21
	.byte	0
	.uleb128 0x28
	.long	.LASF274
	.byte	0x1e
	.byte	0x25
	.byte	0xd
	.long	0xebc
	.uleb128 0x7
	.long	.LASF268
	.byte	0x12
	.byte	0x8a
	.byte	0x10
	.long	0x2f9
	.long	0x1077
	.uleb128 0x2
	.long	0x83
	.uleb128 0x2
	.long	0x4e2
	.uleb128 0x2
	.long	0x2e
	.uleb128 0x2
	.long	0x83
	.byte	0
	.uleb128 0xa
	.long	.LASF269
	.byte	0x1b
	.value	0x197
	.byte	0xf
	.long	0x2e
	.long	0x108e
	.uleb128 0x2
	.long	0x2ef
	.byte	0
	.uleb128 0xa
	.long	.LASF270
	.byte	0x6
	.value	0x193
	.byte	0xc
	.long	0x83
	.long	0x10ab
	.uleb128 0x2
	.long	0x523
	.uleb128 0x2
	.long	0x2f4
	.uleb128 0x21
	.byte	0
	.uleb128 0x7
	.long	.LASF271
	.byte	0x1b
	.byte	0x9c
	.byte	0xc
	.long	0x83
	.long	0x10c6
	.uleb128 0x2
	.long	0x2ef
	.uleb128 0x2
	.long	0x2ef
	.byte	0
	.uleb128 0x7
	.long	.LASF272
	.byte	0x1b
	.byte	0x3d
	.byte	0xe
	.long	0x48
	.long	0x10e6
	.uleb128 0x2
	.long	0x48
	.uleb128 0x2
	.long	0x83
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0xa
	.long	.LASF273
	.byte	0x6
	.value	0x16b
	.byte	0xc
	.long	0x83
	.long	0x10fe
	.uleb128 0x2
	.long	0x2ef
	.uleb128 0x21
	.byte	0
	.uleb128 0x28
	.long	.LASF275
	.byte	0x1f
	.byte	0x22
	.byte	0x10
	.long	0xb5
	.uleb128 0xa
	.long	.LASF276
	.byte	0x20
	.value	0x10d
	.byte	0xc
	.long	0x83
	.long	0x1121
	.uleb128 0x2
	.long	0x445
	.byte	0
	.uleb128 0x7
	.long	.LASF277
	.byte	0x18
	.byte	0x12
	.byte	0x7
	.long	0x48
	.long	0x1137
	.uleb128 0x2
	.long	0x48
	.byte	0
	.uleb128 0x7
	.long	.LASF278
	.byte	0x20
	.byte	0xca
	.byte	0xc
	.long	0x83
	.long	0x115c
	.uleb128 0x2
	.long	0x1161
	.uleb128 0x2
	.long	0x116b
	.uleb128 0x2
	.long	0x1170
	.uleb128 0x2
	.long	0x4a
	.byte	0
	.uleb128 0x5
	.long	0x445
	.uleb128 0xf
	.long	0x115c
	.uleb128 0x5
	.long	0x493
	.uleb128 0xf
	.long	0x1166
	.uleb128 0x5
	.long	0x1175
	.uleb128 0x38
	.long	0x48
	.long	0x1184
	.uleb128 0x2
	.long	0x48
	.byte	0
	.uleb128 0x7
	.long	.LASF279
	.byte	0x1b
	.byte	0xbb
	.byte	0xe
	.long	0xe5
	.long	0x119a
	.uleb128 0x2
	.long	0x2ef
	.byte	0
	.uleb128 0xa
	.long	.LASF280
	.byte	0x1c
	.value	0x2a0
	.byte	0xe
	.long	0x48
	.long	0x11b1
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0x7
	.long	.LASF281
	.byte	0x1b
	.byte	0xf6
	.byte	0xe
	.long	0xe5
	.long	0x11cc
	.uleb128 0x2
	.long	0x2ef
	.uleb128 0x2
	.long	0x83
	.byte	0
	.uleb128 0xa
	.long	.LASF282
	.byte	0x1b
	.value	0x15e
	.byte	0xe
	.long	0xe5
	.long	0x11e8
	.uleb128 0x2
	.long	0x2ef
	.uleb128 0x2
	.long	0x2ef
	.byte	0
	.uleb128 0x22
	.long	.LASF296
	.value	0x214
	.byte	0x7
	.long	0x48
	.quad	.LFB14
	.quad	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.long	0x131c
	.uleb128 0x23
	.string	"sd"
	.value	0x214
	.byte	0x21
	.long	0xca4
	.uleb128 0x4
	.byte	0x91
	.sleb128 -31096
	.uleb128 0x6
	.long	.LASF283
	.value	0x216
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -31064
	.uleb128 0x6
	.long	.LASF284
	.value	0x217
	.byte	0xa
	.long	0x131c
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30768
	.uleb128 0x6
	.long	.LASF285
	.value	0x218
	.byte	0x12
	.long	0xac2
	.uleb128 0x4
	.byte	0x91
	.sleb128 -31024
	.uleb128 0x6
	.long	.LASF286
	.value	0x219
	.byte	0xc
	.long	0x383
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30896
	.uleb128 0x39
	.long	.LASF302
	.byte	0x1
	.value	0x21a
	.byte	0x9
	.long	0x83
	.uleb128 0x3a
	.long	.LASF325
	.byte	0x1
	.value	0x278
	.byte	0x1
	.quad	.L126
	.uleb128 0x24
	.long	.LLRL1
	.uleb128 0x6
	.long	.LASF219
	.value	0x222
	.byte	0x18
	.long	0x329
	.uleb128 0x4
	.byte	0x91
	.sleb128 -31040
	.uleb128 0x6
	.long	.LASF287
	.value	0x225
	.byte	0xd
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -31072
	.uleb128 0x17
	.quad	.LBB16
	.quad	.LBE16-.LBB16
	.long	0x12db
	.uleb128 0x18
	.string	"__i"
	.value	0x21e
	.byte	0x9
	.long	0x41
	.uleb128 0x4
	.byte	0x91
	.sleb128 -31076
	.uleb128 0x6
	.long	.LASF288
	.value	0x21e
	.byte	0x9
	.long	0xde0
	.uleb128 0x4
	.byte	0x91
	.sleb128 -31056
	.byte	0
	.uleb128 0x24
	.long	.LLRL2
	.uleb128 0x6
	.long	.LASF289
	.value	0x23d
	.byte	0x11
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -31068
	.uleb128 0x6
	.long	.LASF290
	.value	0x26b
	.byte	0x11
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -31060
	.uleb128 0x24
	.long	.LLRL3
	.uleb128 0x6
	.long	.LASF291
	.value	0x261
	.byte	0x17
	.long	0xe5
	.uleb128 0x4
	.byte	0x91
	.sleb128 -31048
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x9
	.long	0xef
	.long	0x132d
	.uleb128 0x1a
	.long	0x3a
	.value	0x77ff
	.byte	0
	.uleb128 0x3b
	.long	.LASF316
	.byte	0x1
	.value	0x1e0
	.byte	0x6
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.long	0x13a7
	.uleb128 0xe
	.long	.LASF292
	.value	0x1e0
	.byte	0x1e
	.long	0x83
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0xe
	.long	.LASF193
	.value	0x1e0
	.byte	0x35
	.long	0x2ef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0xe
	.long	.LASF202
	.value	0x1e0
	.byte	0x50
	.long	0x91f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x6
	.long	.LASF293
	.value	0x1e2
	.byte	0xb
	.long	0xe5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x6
	.long	.LASF294
	.value	0x1e3
	.byte	0x11
	.long	0x2ef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x6
	.long	.LASF295
	.value	0x1e4
	.byte	0x9
	.long	0x83
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.uleb128 0x3c
	.long	.LASF297
	.byte	0x1
	.value	0x1c4
	.byte	0xd
	.long	0x2ef
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x13da
	.uleb128 0xe
	.long	.LASF202
	.value	0x1c4
	.byte	0x2a
	.long	0x91f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x22
	.long	.LASF298
	.value	0x1a6
	.byte	0x5
	.long	0x83
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x1465
	.uleb128 0xe
	.long	.LASF285
	.value	0x1a6
	.byte	0x2d
	.long	0xd5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x23
	.string	"sd"
	.value	0x1a6
	.byte	0x44
	.long	0xca4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xe
	.long	.LASF299
	.value	0x1a6
	.byte	0x4c
	.long	0x83
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0xe
	.long	.LASF300
	.value	0x1a6
	.byte	0x61
	.long	0x83
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xe
	.long	.LASF301
	.value	0x1a6
	.byte	0x75
	.long	0x83
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x6
	.long	.LASF302
	.value	0x1a8
	.byte	0x9
	.long	0x83
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x6
	.long	.LASF303
	.value	0x1a9
	.byte	0x9
	.long	0x83
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x22
	.long	.LASF304
	.value	0x147
	.byte	0x5
	.long	0x83
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x159f
	.uleb128 0xe
	.long	.LASF285
	.value	0x147
	.byte	0x1d
	.long	0xd5f
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30840
	.uleb128 0x23
	.string	"sd"
	.value	0x147
	.byte	0x34
	.long	0xca4
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30848
	.uleb128 0xe
	.long	.LASF302
	.value	0x147
	.byte	0x3c
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30852
	.uleb128 0xe
	.long	.LASF300
	.value	0x147
	.byte	0x49
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30856
	.uleb128 0xe
	.long	.LASF301
	.value	0x147
	.byte	0x5d
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30860
	.uleb128 0x6
	.long	.LASF284
	.value	0x14d
	.byte	0xa
	.long	0x131c
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30784
	.uleb128 0x6
	.long	.LASF305
	.value	0x14e
	.byte	0xc
	.long	0x51e
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30808
	.uleb128 0x6
	.long	.LASF306
	.value	0x14f
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30824
	.uleb128 0x6
	.long	.LASF307
	.value	0x153
	.byte	0xa
	.long	0x96
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30800
	.uleb128 0x3d
	.long	.LLRL0
	.long	0x157d
	.uleb128 0x6
	.long	.LASF283
	.value	0x15e
	.byte	0xd
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30812
	.uleb128 0x6
	.long	.LASF308
	.value	0x164
	.byte	0xd
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30828
	.uleb128 0x6
	.long	.LASF309
	.value	0x165
	.byte	0x10
	.long	0x51e
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30792
	.uleb128 0x13
	.quad	.LBB12
	.quad	.LBE12-.LBB12
	.uleb128 0x18
	.string	"i"
	.value	0x174
	.byte	0x16
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30820
	.byte	0
	.byte	0
	.uleb128 0x13
	.quad	.LBB14
	.quad	.LBE14-.LBB14
	.uleb128 0x18
	.string	"i"
	.value	0x199
	.byte	0x12
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30816
	.byte	0
	.byte	0
	.uleb128 0x29
	.long	.LASF310
	.byte	0x57
	.long	0x83
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x17ca
	.uleb128 0x14
	.long	.LASF285
	.byte	0x57
	.byte	0x21
	.long	0xd5f
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30920
	.uleb128 0x1b
	.string	"sd"
	.byte	0x57
	.byte	0x38
	.long	0xca4
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30928
	.uleb128 0x14
	.long	.LASF300
	.byte	0x57
	.byte	0x40
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30932
	.uleb128 0x14
	.long	.LASF301
	.byte	0x57
	.byte	0x54
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30936
	.uleb128 0x8
	.long	.LASF311
	.byte	0x5e
	.byte	0x15
	.long	0x80f
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30832
	.uleb128 0x8
	.long	.LASF312
	.byte	0x5e
	.byte	0x1d
	.long	0x893
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30864
	.uleb128 0x8
	.long	.LASF313
	.byte	0x5e
	.byte	0x24
	.long	0x893
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30880
	.uleb128 0x8
	.long	.LASF283
	.byte	0x5f
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30884
	.uleb128 0x8
	.long	.LASF284
	.byte	0x60
	.byte	0xa
	.long	0x131c
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30784
	.uleb128 0x8
	.long	.LASF306
	.byte	0x61
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30908
	.uleb128 0x8
	.long	.LASF305
	.byte	0x62
	.byte	0xc
	.long	0x51e
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30856
	.uleb128 0x8
	.long	.LASF212
	.byte	0x7c
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30904
	.uleb128 0x8
	.long	.LASF314
	.byte	0xc5
	.byte	0x11
	.long	0x2ef
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30848
	.uleb128 0x8
	.long	.LASF291
	.byte	0xc7
	.byte	0xb
	.long	0xe5
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30872
	.uleb128 0x8
	.long	.LASF302
	.byte	0xdc
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30892
	.uleb128 0x8
	.long	.LASF315
	.byte	0xe1
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30888
	.uleb128 0x17
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.long	0x16e4
	.uleb128 0x8
	.long	.LASF291
	.byte	0x71
	.byte	0xf
	.long	0xe5
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30872
	.byte	0
	.uleb128 0x17
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.long	0x174f
	.uleb128 0x2a
	.string	"s"
	.byte	0xb6
	.long	0x17ca
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30784
	.uleb128 0x17
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.long	0x172c
	.uleb128 0x8
	.long	.LASF291
	.byte	0x85
	.byte	0x17
	.long	0xe5
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30872
	.byte	0
	.uleb128 0x13
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.uleb128 0x8
	.long	.LASF291
	.byte	0xab
	.byte	0x17
	.long	0xe5
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30872
	.byte	0
	.byte	0
	.uleb128 0x17
	.quad	.LBB8
	.quad	.LBE8-.LBB8
	.long	0x17a8
	.uleb128 0x6
	.long	.LASF308
	.value	0x100
	.byte	0xd
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30912
	.uleb128 0x6
	.long	.LASF309
	.value	0x101
	.byte	0x10
	.long	0x51e
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30840
	.uleb128 0x13
	.quad	.LBB9
	.quad	.LBE9-.LBB9
	.uleb128 0x18
	.string	"i"
	.value	0x111
	.byte	0x16
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30900
	.byte	0
	.byte	0
	.uleb128 0x13
	.quad	.LBB10
	.quad	.LBE10-.LBB10
	.uleb128 0x18
	.string	"i"
	.value	0x13b
	.byte	0x12
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30896
	.byte	0
	.byte	0
	.uleb128 0x9
	.long	0xef
	.long	0x17da
	.uleb128 0xb
	.long	0x3a
	.byte	0x2d
	.byte	0
	.uleb128 0x3e
	.long	.LASF317
	.byte	0x1
	.byte	0x3e
	.byte	0x6
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x186d
	.uleb128 0x1b
	.string	"sd"
	.byte	0x3e
	.byte	0x2c
	.long	0xca4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x14
	.long	.LASF306
	.byte	0x3e
	.byte	0x34
	.long	0x83
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x14
	.long	.LASF305
	.byte	0x3e
	.byte	0x48
	.long	0x51e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x14
	.long	.LASF285
	.byte	0x3e
	.byte	0x61
	.long	0xd5f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x8
	.long	.LASF318
	.byte	0x40
	.byte	0xf
	.long	0x445
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x8
	.long	.LASF319
	.byte	0x41
	.byte	0x13
	.long	0x186d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x13
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x2a
	.string	"i"
	.byte	0x48
	.long	0x83
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.byte	0
	.byte	0
	.uleb128 0x5
	.long	0xca9
	.uleb128 0x29
	.long	.LASF320
	.byte	0x1d
	.long	0x83
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x18cf
	.uleb128 0x1b
	.string	"url"
	.byte	0x1d
	.byte	0x24
	.long	0x2ef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x14
	.long	.LASF284
	.byte	0x1d
	.byte	0x2f
	.long	0xe5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x13
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x8
	.long	.LASF198
	.byte	0x29
	.byte	0x15
	.long	0x2ef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x3f
	.long	.LASF321
	.byte	0x1
	.byte	0x13
	.byte	0x7
	.long	0x48
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1b
	.string	"sa"
	.byte	0x13
	.byte	0x24
	.long	0x6a6
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
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
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
	.uleb128 0xf
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
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
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
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
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
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
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 22
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
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
	.uleb128 0x21
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x24
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x25
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
	.uleb128 0x26
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
	.uleb128 0x27
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 13
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
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
	.uleb128 0x29
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
	.sleb128 5
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
	.uleb128 0x2a
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
	.uleb128 0x21
	.sleb128 14
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2b
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
	.uleb128 0x2c
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2d
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
	.uleb128 0x2e
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
	.uleb128 0x2f
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
	.uleb128 0x30
	.uleb128 0x17
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
	.uleb128 0x31
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x32
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
	.uleb128 0x33
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
	.uleb128 0x34
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
	.uleb128 0x35
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
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
	.uleb128 0x36
	.uleb128 0xd
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
	.uleb128 0x38
	.uleb128 0xb
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x39
	.uleb128 0x34
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
	.uleb128 0x3a
	.uleb128 0xa
	.byte	0
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
	.byte	0
	.byte	0
	.uleb128 0x3b
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
	.uleb128 0x3c
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
	.uleb128 0x3d
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3e
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
	.uleb128 0x3f
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
	.uleb128 .LBB11-.Ltext0
	.uleb128 .LBE11-.Ltext0
	.byte	0x4
	.uleb128 .LBB13-.Ltext0
	.uleb128 .LBE13-.Ltext0
	.byte	0
.LLRL1:
	.byte	0x4
	.uleb128 .LBB15-.Ltext0
	.uleb128 .LBE15-.Ltext0
	.byte	0x4
	.uleb128 .LBB21-.Ltext0
	.uleb128 .LBE21-.Ltext0
	.byte	0
.LLRL2:
	.byte	0x4
	.uleb128 .LBB17-.Ltext0
	.uleb128 .LBE17-.Ltext0
	.byte	0x4
	.uleb128 .LBB20-.Ltext0
	.uleb128 .LBE20-.Ltext0
	.byte	0
.LLRL3:
	.byte	0x4
	.uleb128 .LBB18-.Ltext0
	.uleb128 .LBE18-.Ltext0
	.byte	0x4
	.uleb128 .LBB19-.Ltext0
	.uleb128 .LBE19-.Ltext0
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF288:
	.string	"__arr"
.LASF293:
	.string	"response"
.LASF135:
	.string	"sin6_flowinfo"
.LASF257:
	.string	"cleanup_header"
.LASF78:
	.string	"pthread_t"
.LASF40:
	.string	"_shortbuf"
.LASF47:
	.string	"_prevchain"
.LASF323:
	.string	"_IO_lock_t"
.LASF269:
	.string	"strlen"
.LASF321:
	.string	"get_in_addr"
.LASF283:
	.string	"numbytes"
.LASF225:
	.string	"filepath"
.LASF234:
	.string	"linknum"
.LASF29:
	.string	"_IO_buf_end"
.LASF207:
	.string	"current_state"
.LASF100:
	.string	"sa_data"
.LASF302:
	.string	"file_fd"
.LASF61:
	.string	"__fd_mask"
.LASF98:
	.string	"sockaddr"
.LASF294:
	.string	"status_text"
.LASF137:
	.string	"sin6_scope_id"
.LASF27:
	.string	"_IO_write_end"
.LASF3:
	.string	"unsigned int"
.LASF227:
	.string	"next"
.LASF306:
	.string	"total_links"
.LASF45:
	.string	"_freeres_list"
.LASF160:
	.string	"httpType_s"
.LASF21:
	.string	"_flags"
.LASF245:
	.string	"parse_request_line_thread_safe"
.LASF248:
	.string	"cache_lookup"
.LASF159:
	.string	"__socket_type"
.LASF217:
	.string	"recvBytes"
.LASF246:
	.string	"strerror"
.LASF33:
	.string	"_markers"
.LASF301:
	.string	"prefetch"
.LASF317:
	.string	"prefetch_thread_create"
.LASF194:
	.string	"http_version_str"
.LASF211:
	.string	"HttpHeader_t"
.LASF54:
	.string	"ssize_t"
.LASF276:
	.string	"pthread_detach"
.LASF144:
	.string	"__u6_addr16"
.LASF274:
	.string	"__errno_location"
.LASF60:
	.string	"tv_usec"
.LASF213:
	.string	"client_sock_fd"
.LASF268:
	.string	"send"
.LASF286:
	.string	"readfds"
.LASF86:
	.string	"uint32_t"
.LASF66:
	.string	"__prev"
.LASF139:
	.string	"in_addr_t"
.LASF218:
	.string	"sentBytes"
.LASF32:
	.string	"_IO_save_end"
.LASF71:
	.string	"__count"
.LASF244:
	.string	"is_blocked"
.LASF280:
	.string	"malloc"
.LASF148:
	.string	"addrinfo"
.LASF298:
	.string	"check_and_send_from_cache"
.LASF64:
	.string	"long long unsigned int"
.LASF126:
	.string	"MSG_CMSG_CLOEXEC"
.LASF303:
	.string	"result"
.LASF166:
	.string	"statusCode_s"
.LASF173:
	.string	"statusCode_t"
.LASF143:
	.string	"__u6_addr8"
.LASF119:
	.string	"MSG_ERRQUEUE"
.LASF278:
	.string	"pthread_create"
.LASF325:
	.string	"cleanup"
.LASF185:
	.string	"APPLICATION_JAVASCRIPT"
.LASF128:
	.string	"sin_family"
.LASF10:
	.string	"__uint16_t"
.LASF314:
	.string	"connection_type"
.LASF72:
	.string	"__owner"
.LASF256:
	.string	"cache_add_new"
.LASF111:
	.string	"MSG_TRUNC"
.LASF42:
	.string	"_offset"
.LASF142:
	.string	"in_port_t"
.LASF76:
	.string	"__elision"
.LASF287:
	.string	"select_status"
.LASF195:
	.string	"uri_str"
.LASF267:
	.string	"fprintf"
.LASF35:
	.string	"_fileno"
.LASF105:
	.string	"MSG_OOB"
.LASF58:
	.string	"timeval"
.LASF208:
	.string	"open_file_fd"
.LASF131:
	.string	"sin_zero"
.LASF230:
	.string	"cache_table_t"
.LASF141:
	.string	"s_addr"
.LASF7:
	.string	"size_t"
.LASF97:
	.string	"sa_family_t"
.LASF154:
	.string	"ai_addr"
.LASF108:
	.string	"MSG_TRYHARD"
.LASF161:
	.string	"HTTP1_0"
.LASF162:
	.string	"HTTP1_1"
.LASF193:
	.string	"http_version"
.LASF24:
	.string	"_IO_read_base"
.LASF115:
	.string	"MSG_FIN"
.LASF113:
	.string	"MSG_EOR"
.LASF210:
	.string	"extra_header"
.LASF26:
	.string	"_IO_write_ptr"
.LASF304:
	.string	"if_cached"
.LASF136:
	.string	"sin6_addr"
.LASF266:
	.string	"free"
.LASF239:
	.string	"connection_entry"
.LASF177:
	.string	"PATCH"
.LASF292:
	.string	"client_fd"
.LASF163:
	.string	"ERROR_VERSION"
.LASF203:
	.string	"status_code_str"
.LASF171:
	.string	"VERSION_NOT_SUPPORTED"
.LASF233:
	.string	"blocklist_t"
.LASF320:
	.string	"is_dynamic_content"
.LASF67:
	.string	"__next"
.LASF236:
	.string	"base_url"
.LASF174:
	.string	"method_s"
.LASF180:
	.string	"method_t"
.LASF101:
	.string	"sockaddr_storage"
.LASF183:
	.string	"TEXT_CSS"
.LASF19:
	.string	"char"
.LASF104:
	.string	"__ss_align"
.LASF277:
	.string	"prefetch_thread_func"
.LASF48:
	.string	"_mode"
.LASF251:
	.string	"remove_connection"
.LASF308:
	.string	"link_count"
.LASF51:
	.string	"_IO_marker"
.LASF261:
	.string	"close"
.LASF260:
	.string	"inet_ntop"
.LASF296:
	.string	"handle_req"
.LASF319:
	.string	"data"
.LASF120:
	.string	"MSG_NOSIGNAL"
.LASF116:
	.string	"MSG_SYN"
.LASF315:
	.string	"initial"
.LASF93:
	.string	"SOCK_DCCP"
.LASF75:
	.string	"__spins"
.LASF250:
	.string	"lseek"
.LASF102:
	.string	"ss_family"
.LASF313:
	.string	"servinfo"
.LASF84:
	.string	"uint8_t"
.LASF81:
	.string	"pthread_attr_t"
.LASF291:
	.string	"send_req"
.LASF56:
	.string	"time_t"
.LASF94:
	.string	"SOCK_PACKET"
.LASF324:
	.string	"stderr"
.LASF197:
	.string	"hostname_port_str"
.LASF318:
	.string	"prefetch_thread"
.LASF112:
	.string	"MSG_DONTWAIT"
.LASF241:
	.string	"hostname"
.LASF192:
	.string	"req_header_s"
.LASF25:
	.string	"_IO_write_base"
.LASF89:
	.string	"SOCK_DGRAM"
.LASF15:
	.string	"__pid_t"
.LASF77:
	.string	"__list"
.LASF55:
	.string	"long long int"
.LASF263:
	.string	"perror"
.LASF254:
	.string	"write"
.LASF284:
	.string	"recieved_buf"
.LASF189:
	.string	"IMAGE_X_ICON"
.LASF273:
	.string	"printf"
.LASF221:
	.string	"lock"
.LASF305:
	.string	"all_links"
.LASF165:
	.string	"httpType_t"
.LASF129:
	.string	"sin_port"
.LASF176:
	.string	"DELETE"
.LASF145:
	.string	"__u6_addr32"
.LASF170:
	.string	"METHOD_NOT_ALLOWED"
.LASF156:
	.string	"ai_next"
.LASF214:
	.string	"client_info"
.LASF272:
	.string	"memset"
.LASF169:
	.string	"NOT_FOUND"
.LASF124:
	.string	"MSG_ZEROCOPY"
.LASF96:
	.string	"SOCK_NONBLOCK"
.LASF63:
	.string	"fd_set"
.LASF46:
	.string	"_freeres_buf"
.LASF223:
	.string	"cache_entry"
.LASF31:
	.string	"_IO_backup_base"
.LASF167:
	.string	"BAD_REQ"
.LASF147:
	.string	"__in6_u"
.LASF130:
	.string	"sin_addr"
.LASF240:
	.string	"host_hash"
.LASF74:
	.string	"__kind"
.LASF198:
	.string	"content_type"
.LASF285:
	.string	"header"
.LASF2:
	.string	"long unsigned int"
.LASF155:
	.string	"ai_canonname"
.LASF175:
	.string	"POST"
.LASF299:
	.string	"dynamic_content"
.LASF125:
	.string	"MSG_FASTOPEN"
.LASF206:
	.string	"parser_error"
.LASF216:
	.string	"addr_len"
.LASF232:
	.string	"pattern_count"
.LASF39:
	.string	"_vtable_offset"
.LASF275:
	.string	"gettid"
.LASF109:
	.string	"MSG_CTRUNC"
.LASF188:
	.string	"IMAGE_JPG"
.LASF68:
	.string	"__pthread_list_t"
.LASF85:
	.string	"uint16_t"
.LASF134:
	.string	"sin6_port"
.LASF322:
	.string	"GNU C17 14.2.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF150:
	.string	"ai_family"
.LASF297:
	.string	"get_status_text"
.LASF242:
	.string	"connection_entry_t"
.LASF235:
	.string	"links"
.LASF88:
	.string	"SOCK_STREAM"
.LASF289:
	.string	"total_bytes"
.LASF316:
	.string	"send_error_response"
.LASF30:
	.string	"_IO_save_base"
.LASF23:
	.string	"_IO_read_end"
.LASF201:
	.string	"method_str"
.LASF281:
	.string	"strchr"
.LASF209:
	.string	"max_age"
.LASF133:
	.string	"sin6_family"
.LASF9:
	.string	"short int"
.LASF262:
	.string	"connect"
.LASF62:
	.string	"fds_bits"
.LASF12:
	.string	"long int"
.LASF107:
	.string	"MSG_DONTROUTE"
.LASF295:
	.string	"length"
.LASF190:
	.string	"total_content_types"
.LASF312:
	.string	"temp"
.LASF53:
	.string	"_IO_wide_data"
.LASF179:
	.string	"total_req_methods"
.LASF106:
	.string	"MSG_PEEK"
.LASF264:
	.string	"socket"
.LASF123:
	.string	"MSG_BATCH"
.LASF18:
	.string	"__ssize_t"
.LASF127:
	.string	"sockaddr_in"
.LASF8:
	.string	"__uint8_t"
.LASF82:
	.string	"__data"
.LASF249:
	.string	"read"
.LASF247:
	.string	"select"
.LASF95:
	.string	"SOCK_CLOEXEC"
.LASF237:
	.string	"base_port"
.LASF118:
	.string	"MSG_RST"
.LASF73:
	.string	"__nusers"
.LASF44:
	.string	"_wide_data"
.LASF121:
	.string	"MSG_MORE"
.LASF138:
	.string	"__CONST_SOCKADDR_ARG"
.LASF41:
	.string	"_lock"
.LASF59:
	.string	"tv_sec"
.LASF146:
	.string	"in6_addr"
.LASF212:
	.string	"sockfd"
.LASF215:
	.string	"server_info"
.LASF52:
	.string	"_IO_codecvt"
.LASF37:
	.string	"_old_offset"
.LASF57:
	.string	"_IO_FILE"
.LASF282:
	.string	"strstr"
.LASF220:
	.string	"port"
.LASF90:
	.string	"SOCK_RAW"
.LASF178:
	.string	"HEAD"
.LASF122:
	.string	"MSG_WAITFORONE"
.LASF83:
	.string	"pthread_mutex_t"
.LASF114:
	.string	"MSG_WAITALL"
.LASF70:
	.string	"__lock"
.LASF243:
	.string	"connection_table_t"
.LASF157:
	.string	"__int128"
.LASF140:
	.string	"in_addr"
.LASF103:
	.string	"__ss_padding"
.LASF152:
	.string	"ai_protocol"
.LASF151:
	.string	"ai_socktype"
.LASF307:
	.string	"file_size"
.LASF65:
	.string	"__pthread_internal_list"
.LASF4:
	.string	"unsigned char"
.LASF222:
	.string	"sockdetails_t"
.LASF11:
	.string	"__uint32_t"
.LASF270:
	.string	"asprintf"
.LASF168:
	.string	"FORBIDDEN"
.LASF20:
	.string	"__socklen_t"
.LASF311:
	.string	"hints"
.LASF219:
	.string	"timeout"
.LASF92:
	.string	"SOCK_SEQPACKET"
.LASF172:
	.string	"total_status_codes"
.LASF231:
	.string	"patterns"
.LASF310:
	.string	"if_not_cached"
.LASF200:
	.string	"method"
.LASF17:
	.string	"__suseconds_t"
.LASF238:
	.string	"prefetcher_t"
.LASF186:
	.string	"IMAGE_PNG"
.LASF16:
	.string	"__time_t"
.LASF290:
	.string	"returnval"
.LASF43:
	.string	"_codecvt"
.LASF300:
	.string	"send_to_client"
.LASF252:
	.string	"realloc"
.LASF226:
	.string	"timestamp"
.LASF202:
	.string	"status_code"
.LASF117:
	.string	"MSG_CONFIRM"
.LASF13:
	.string	"__off_t"
.LASF255:
	.string	"recv"
.LASF271:
	.string	"strcmp"
.LASF6:
	.string	"signed char"
.LASF99:
	.string	"sa_family"
.LASF279:
	.string	"strdup"
.LASF181:
	.string	"contentType_s"
.LASF191:
	.string	"contentType_t"
.LASF5:
	.string	"short unsigned int"
.LASF199:
	.string	"content_type_str"
.LASF253:
	.string	"extract_links"
.LASF196:
	.string	"hostname_str"
.LASF22:
	.string	"_IO_read_ptr"
.LASF184:
	.string	"TEXT_PLAIN"
.LASF158:
	.string	"__int128 unsigned"
.LASF224:
	.string	"url_hash"
.LASF164:
	.string	"supported_http_protocols"
.LASF228:
	.string	"cache_entry_t"
.LASF229:
	.string	"buckets"
.LASF80:
	.string	"__align"
.LASF34:
	.string	"_chain"
.LASF153:
	.string	"ai_addrlen"
.LASF50:
	.string	"FILE"
.LASF182:
	.string	"TEXT_HTML"
.LASF205:
	.string	"connection_close"
.LASF36:
	.string	"_flags2"
.LASF110:
	.string	"MSG_PROXY"
.LASF187:
	.string	"IMAGE_GIF"
.LASF87:
	.string	"socklen_t"
.LASF79:
	.string	"__size"
.LASF258:
	.string	"freeaddrinfo"
.LASF38:
	.string	"_cur_column"
.LASF132:
	.string	"sockaddr_in6"
.LASF265:
	.string	"getaddrinfo"
.LASF259:
	.string	"save_connection"
.LASF204:
	.string	"connection_keep_alive"
.LASF14:
	.string	"__off64_t"
.LASF49:
	.string	"_unused2"
.LASF28:
	.string	"_IO_buf_base"
.LASF91:
	.string	"SOCK_RDM"
.LASF69:
	.string	"__pthread_mutex_s"
.LASF309:
	.string	"chunk_links"
.LASF149:
	.string	"ai_flags"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/parth/Work/All_data/university/Network System/Assignments/PA3"
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
