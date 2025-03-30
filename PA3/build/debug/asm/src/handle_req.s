	.file	"handle_req.c"
	.text
	.globl	get_in_addr
	.type	get_in_addr, @function
get_in_addr:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movzwl	(%rax), %eax
	cmpw	$2, %ax
	jne	.L2
	movq	-8(%rbp), %rax
	addq	$4, %rax
	jmp	.L3
.L2:
	movq	-8(%rbp), %rax
	addq	$8, %rax
.L3:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	get_in_addr, .-get_in_addr
	.section	.rodata
.LC0:
	.string	"something came "
.LC1:
	.string	"something came %d \n"
.LC2:
	.string	"\033[31mselect error"
	.align 8
.LC3:
	.string	"\033[33m[-] (%d) Connection timed out\n\033[0m"
.LC4:
	.string	"\033[31m[-] read"
.LC5:
	.string	"recieved_buf : %s\n\n"
.LC6:
	.string	"Error !"
	.align 8
.LC7:
	.string	"hostname str %s, hostname port %s\n"
.LC8:
	.string	"80"
.LC9:
	.string	"\033[31mgetaddrinfo\n\033[0m"
	.align 8
.LC10:
	.string	"\033[32m[+] getaddrinfo call successful\n\033[0m"
.LC11:
	.string	"\033[31mserver: socket"
	.align 8
.LC12:
	.string	"\033[32m[+] socket call successful\n\033[0m"
	.align 8
.LC13:
	.string	"\033[31m[-] connect failed for server %d\n\033[0m"
	.align 8
.LC14:
	.string	"\033[32m[+] connect call successful\n\033[0m"
	.align 8
.LC15:
	.string	"\033[31m[-] socket connection failed for server \n\033[0m"
.LC16:
	.string	"client: connecting to %s\n"
.LC17:
	.string	"Connection: Keep-alive"
.LC18:
	.string	"Connection: close"
.LC19:
	.string	"waiting for send ?? "
.LC20:
	.string	"GET %s HTTP/1.0\r\nHost: %s\r\n\r\n"
	.align 8
.LC21:
	.string	"\033[31m[-] send failed for server %d \n\033[0m"
.LC22:
	.string	"Sent\n\r"
	.align 8
.LC23:
	.string	"\033[31m[-] recv failed for server \n\033[0m"
	.align 8
.LC24:
	.string	"\033[31m[-] send-server failed for server %d\n\033[0m"
	.align 8
.LC25:
	.string	"\033[31mSent form the fucking cache \n\r\033[0m"
.LC26:
	.string	"%s"
.LC27:
	.string	"lets see if its working"
	.text
	.globl	handle_req
	.type	handle_req, @function
handle_req:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	-61440(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$400, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L37:
	leaq	-61456(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-61584(%rbp), %rax
	movq	%rax, -61776(%rbp)
	movl	$0, -61828(%rbp)
	jmp	.L5
.L6:
	movq	-61776(%rbp), %rax
	movl	-61828(%rbp), %edx
	movq	$0, (%rax,%rdx,8)
	addl	$1, -61828(%rbp)
.L5:
	cmpl	$15, -61828(%rbp)
	jbe	.L6
	movl	20(%rbp), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	movl	%eax, %esi
	movslq	%esi, %rax
	movq	-61584(%rbp,%rax,8), %rax
	movl	20(%rbp), %edx
	andl	$63, %edx
	movl	$1, %edi
	movl	%edx, %ecx
	salq	%cl, %rdi
	movq	%rdi, %rdx
	orq	%rax, %rdx
	movslq	%esi, %rax
	movq	%rdx, -61584(%rbp,%rax,8)
	movq	$2, -61760(%rbp)
	movq	$0, -61752(%rbp)
	movl	20(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	20(%rbp), %eax
	leal	1(%rax), %edi
	leaq	-61760(%rbp), %rdx
	leaq	-61584(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	call	select@PLT
	movl	%eax, -61820(%rbp)
	cmpl	$0, -61820(%rbp)
	jns	.L7
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	jmp	.L8
.L7:
	cmpl	$0, -61820(%rbp)
	jne	.L9
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L8
.L9:
	movl	20(%rbp), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	cltq
	movq	-61584(%rbp,%rax,8), %rdx
	movl	20(%rbp), %eax
	andl	$63, %eax
	movl	$1, %esi
	movl	%eax, %ecx
	salq	%cl, %rsi
	movq	%rsi, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L37
	leaq	-61456(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	20(%rbp), %eax
	leaq	-61456(%rbp), %rsi
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	movl	%eax, -61816(%rbp)
	cmpl	$0, -61816(%rbp)
	jns	.L11
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$0, %eax
	jmp	.L38
.L11:
	leaq	-61456(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-61696(%rbp), %rax
	movl	$112, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-61696(%rbp), %rdx
	leaq	-61456(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	parse_request_line_thread_safe@PLT
	testl	%eax, %eax
	jns	.L13
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L8
.L13:
	movq	-61672(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	is_blocked@PLT
	testl	%eax, %eax
	jne	.L40
	movq	-61680(%rbp), %rdx
	movq	-61672(%rbp), %rax
	movl	$60, %ecx
	movq	%rax, %rsi
	movl	$0, %edi
	call	cache_lookup@PLT
	shrl	$31, %eax
	movzbl	%al, %eax
	movl	%eax, -61812(%rbp)
	cmpl	$0, -61812(%rbp)
	je	.L15
	leaq	-61744(%rbp), %rax
	movl	$48, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	$0, -61740(%rbp)
	movl	$1, -61736(%rbp)
	movq	-61664(%rbp), %rdx
	movq	-61672(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-61664(%rbp), %rax
	testq	%rax, %rax
	jne	.L16
	leaq	.LC8(%rip), %rax
	movq	%rax, -61664(%rbp)
.L16:
	movq	-61664(%rbp), %rsi
	movq	-61672(%rbp), %rax
	leaq	-61800(%rbp), %rcx
	leaq	-61744(%rbp), %rdx
	movq	%rax, %rdi
	call	getaddrinfo@PLT
	testl	%eax, %eax
	jns	.L17
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$1, %edi
	call	exit@PLT
.L17:
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-61800(%rbp), %rax
	movq	%rax, -61784(%rbp)
	jmp	.L18
.L23:
	movq	-61784(%rbp), %rax
	movl	12(%rax), %edx
	movq	-61784(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-61784(%rbp), %rax
	movl	4(%rax), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	socket@PLT
	movl	%eax, -61824(%rbp)
	cmpl	$0, -61824(%rbp)
	jns	.L19
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	jmp	.L20
.L19:
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-61784(%rbp), %rax
	movl	16(%rax), %edx
	movq	-61784(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rcx
	movl	-61824(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	connect@PLT
	testl	%eax, %eax
	jns	.L21
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC13(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	-61824(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L20
.L21:
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L22
.L20:
	movq	-61784(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -61784(%rbp)
.L18:
	cmpq	$0, -61784(%rbp)
	jne	.L23
.L22:
	cmpq	$0, -61784(%rbp)
	jne	.L24
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$50, %edx
	movl	$1, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	-61824(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$1, %edi
	call	exit@PLT
.L24:
	movq	-61784(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	get_in_addr
	movq	%rax, %rsi
	movq	-61784(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30736(%rbp), %rdx
	movl	$46, %ecx
	movl	%eax, %edi
	call	inet_ntop@PLT
	leaq	-30736(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-61800(%rbp), %rax
	movq	%rax, %rdi
	call	freeaddrinfo@PLT
	movl	-61608(%rbp), %eax
	testl	%eax, %eax
	je	.L25
	leaq	.LC17(%rip), %rax
	jmp	.L26
.L25:
	leaq	.LC18(%rip), %rax
.L26:
	movq	%rax, -61768(%rbp)
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-61672(%rbp), %rcx
	movq	-61680(%rbp), %rdx
	leaq	-61792(%rbp), %rax
	leaq	.LC20(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	movq	-61792(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-61792(%rbp), %rsi
	movl	-61824(%rbp), %eax
	movl	$16384, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L27
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC21(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	-61824(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$1, %edi
	call	exit@PLT
.L27:
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-61680(%rbp), %rdx
	movq	-61672(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	cache_add_new@PLT
	movl	%eax, -61808(%rbp)
.L31:
	leaq	-61456(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-61456(%rbp), %rsi
	movl	-61824(%rbp), %eax
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	movl	%eax, -61804(%rbp)
	cmpl	$0, -61804(%rbp)
	jg	.L28
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$37, %edx
	movl	$1, %esi
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	-61824(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	nop
	movl	-61808(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L32
.L28:
	movl	-61804(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-61456(%rbp), %rcx
	movl	-61808(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movl	-61804(%rbp), %eax
	movslq	%eax, %rdx
	movl	20(%rbp), %eax
	leaq	-61456(%rbp), %rsi
	movl	$16384, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L31
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC24(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	-61824(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L31
.L15:
	leaq	.LC25(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L36:
	leaq	-30736(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-30736(%rbp), %rcx
	movl	-61812(%rbp), %eax
	movl	$30720, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	movl	%eax, -61816(%rbp)
	cmpl	$0, -61816(%rbp)
	jle	.L41
	leaq	-30736(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-61816(%rbp), %eax
	movslq	%eax, %rdx
	movl	20(%rbp), %eax
	leaq	-30736(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L36
	call	__errno_location@PLT
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC24(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	20(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L34
.L41:
	nop
.L34:
	movl	-61812(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
.L32:
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	-61604(%rbp), %eax
	cmpl	$1, %eax
	je	.L8
	movl	-61608(%rbp), %eax
	testl	%eax, %eax
	je	.L8
	leaq	-61696(%rbp), %rax
	movl	$112, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-61456(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	jmp	.L37
.L40:
	nop
.L8:
	movl	20(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$0, %eax
.L38:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L39
	call	__stack_chk_fail@PLT
.L39:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	handle_req, .-handle_req
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
