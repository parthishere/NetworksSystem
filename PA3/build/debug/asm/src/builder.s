	.file	"builder.c"
	.text
	.section	.rodata
.LC0:
	.string	"HTTP/1.0"
.LC1:
	.string	"HTTP/1.1"
	.section	.data.rel.local,"aw"
	.align 32
	.type	http_type, @object
	.size	http_type, 32
http_type:
	.quad	.LC0
	.quad	.LC1
	.zero	16
	.section	.rodata
.LC2:
	.string	"200 OK"
.LC3:
	.string	"400 Bad Request"
.LC4:
	.string	"403 Forbidden"
.LC5:
	.string	"404 Not Found"
.LC6:
	.string	"405 Method Not Allowed"
	.align 8
.LC7:
	.string	"505 HTTP Version Not Supported"
	.section	.data.rel.local
	.align 32
	.type	status_codes, @object
	.size	status_codes, 272
status_codes:
	.quad	.LC2
	.quad	.LC3
	.quad	.LC4
	.quad	.LC5
	.quad	.LC6
	.quad	.LC7
	.zero	224
	.section	.rodata
.LC8:
	.string	"GET"
.LC9:
	.string	"POST"
.LC10:
	.string	"DELETE"
.LC11:
	.string	"PATCH"
	.section	.data.rel.local
	.align 32
	.type	reqMethod, @object
	.size	reqMethod, 56
reqMethod:
	.quad	.LC8
	.quad	.LC9
	.quad	.LC10
	.quad	.LC11
	.zero	24
	.section	.rodata
.LC12:
	.string	"text/html"
.LC13:
	.string	"text/css"
.LC14:
	.string	"text/plain"
.LC15:
	.string	"application/javascript"
.LC16:
	.string	"image/png"
.LC17:
	.string	"image/gif"
.LC18:
	.string	"image/jpg"
.LC19:
	.string	"image/x-icon"
.LC20:
	.string	"ERROR"
	.section	.data.rel.local
	.align 32
	.type	contentType, @object
	.size	contentType, 72
contentType:
	.quad	.LC12
	.quad	.LC13
	.quad	.LC14
	.quad	.LC15
	.quad	.LC16
	.quad	.LC17
	.quad	.LC18
	.quad	.LC19
	.quad	.LC20
	.section	.rodata
	.align 8
.LC21:
	.string	"%s %s\r\nContent-Type: text/plain\r\n\r\n%s"
	.text
	.globl	send_
	.type	send_, @function
send_:
.LFB6:
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
	movl	%edx, -52(%rbp)
	movq	%rcx, -64(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	-52(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	leaq	status_codes(%rip), %rax
	movq	(%rdx,%rax), %rcx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-48(%rbp), %rsi
	leaq	-16(%rbp), %rax
	movq	%rsi, %r8
	leaq	.LC21(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-16(%rbp), %rsi
	movq	-64(%rbp), %rax
	movl	4(%rax), %eax
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L2
	call	__stack_chk_fail@PLT
.L2:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	send_, .-send_
	.section	.rodata
.LC22:
	.string	"html"
.LC23:
	.string	"htm"
.LC24:
	.string	"css"
.LC25:
	.string	"txt"
.LC26:
	.string	"js"
.LC27:
	.string	"png"
.LC28:
	.string	"gif"
.LC29:
	.string	"jpg"
.LC30:
	.string	"ico"
	.text
	.type	get_content_type, @function
get_content_type:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L4
	movl	$2, %eax
	jmp	.L5
.L4:
	movq	-8(%rbp), %rax
	leaq	.LC22(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L6
	movq	-8(%rbp), %rax
	leaq	.LC23(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L7
.L6:
	movl	$0, %eax
	jmp	.L5
.L7:
	movq	-8(%rbp), %rax
	leaq	.LC24(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L8
	movl	$1, %eax
	jmp	.L5
.L8:
	movq	-8(%rbp), %rax
	leaq	.LC25(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L9
	movl	$2, %eax
	jmp	.L5
.L9:
	movq	-8(%rbp), %rax
	leaq	.LC26(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L10
	movl	$3, %eax
	jmp	.L5
.L10:
	movq	-8(%rbp), %rax
	leaq	.LC27(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L11
	movl	$4, %eax
	jmp	.L5
.L11:
	movq	-8(%rbp), %rax
	leaq	.LC28(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L12
	movl	$5, %eax
	jmp	.L5
.L12:
	movq	-8(%rbp), %rax
	leaq	.LC29(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L13
	movl	$6, %eax
	jmp	.L5
.L13:
	movq	-8(%rbp), %rax
	movl	$3, %edx
	leaq	.LC30(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	testl	%eax, %eax
	jne	.L14
	movl	$7, %eax
	jmp	.L5
.L14:
	movl	$8, %eax
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	get_content_type, .-get_content_type
	.section	.rodata
.LC31:
	.string	"/"
.LC32:
	.string	"./www"
.LC33:
	.string	"%s/index.html"
.LC34:
	.string	"%s%s"
	.text
	.type	construct_filepath, @function
construct_filepath:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-24(%rbp), %rax
	leaq	.LC31(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L16
	leaq	-16(%rbp), %rax
	leaq	.LC32(%rip), %rdx
	leaq	.LC33(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	jmp	.L17
.L16:
	movq	-24(%rbp), %rdx
	leaq	-16(%rbp), %rax
	movq	%rdx, %rcx
	leaq	.LC32(%rip), %rdx
	leaq	.LC34(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
.L17:
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L19
	call	__stack_chk_fail@PLT
.L19:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	construct_filepath, .-construct_filepath
	.section	.rodata
.LC35:
	.string	".html"
.LC36:
	.string	".htm"
.LC37:
	.string	"%sl"
	.text
	.globl	try_alternative_html
	.type	try_alternative_html, @function
try_alternative_html:
.LFB9:
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
	cmpq	$0, -24(%rbp)
	je	.L21
	cmpq	$0, -32(%rbp)
	jne	.L22
.L21:
	movl	$-1, %eax
	jmp	.L23
.L22:
	movl	$-1, -12(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, -8(%rbp)
	cmpq	$5, -8(%rbp)
	jbe	.L24
	movq	-8(%rbp), %rax
	leaq	-5(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC35(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L24
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L25
	movl	$-1, %eax
	jmp	.L23
.L25:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	subq	$1, %rdx
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -12(%rbp)
	cmpl	$0, -12(%rbp)
	jns	.L27
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-32(%rbp), %rax
	movq	$0, (%rax)
	jmp	.L27
.L24:
	cmpq	$4, -8(%rbp)
	jbe	.L27
	movq	-8(%rbp), %rax
	leaq	-4(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC36(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L27
	movq	-24(%rbp), %rdx
	movq	-32(%rbp), %rax
	leaq	.LC37(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	testl	%eax, %eax
	jns	.L28
	movl	$-1, %eax
	jmp	.L23
.L28:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -12(%rbp)
	cmpl	$0, -12(%rbp)
	jns	.L27
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-32(%rbp), %rax
	movq	$0, (%rax)
.L27:
	movl	-12(%rbp), %eax
.L23:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	try_alternative_html, .-try_alternative_html
	.section	.rodata
	.align 8
.LC38:
	.string	"\033[31m[-] (%d) Access denied\n\033[0m"
.LC39:
	.string	"Access denied"
	.align 8
.LC40:
	.string	"\033[31m[-] (%d) File not found (tried both .html and .htm)\n\033[0m"
.LC41:
	.string	"File not found"
	.align 8
.LC42:
	.string	"\033[32m[+] (%d) Found alternative HTML file\n\033[0m"
	.align 8
.LC43:
	.string	"\033[31m[-] (%d) File not found\n\033[0m"
	.align 8
.LC44:
	.string	"\033[31m[-] (%d) Bad request\n\033[0m"
.LC45:
	.string	"Bad request"
	.text
	.globl	handle_file_request
	.type	handle_file_request, @function
handle_file_request:
.LFB10:
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
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	-40(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -12(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, (%rax)
	cmpl	$0, -12(%rbp)
	jns	.L30
	movq	-40(%rbp), %rax
	movl	$46, %esi
	movq	%rax, %rdi
	call	strrchr@PLT
	movq	%rax, -8(%rbp)
	call	__errno_location@PLT
	movl	(%rax), %eax
	cmpl	$2, %eax
	je	.L31
	cmpl	$13, %eax
	jne	.L32
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC38(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rcx
	movl	$4, %edx
	leaq	.LC39(%rip), %rsi
	movq	%rax, %rdi
	call	send_
	jmp	.L33
.L31:
	cmpq	$0, -8(%rbp)
	je	.L34
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L34
	movq	-8(%rbp), %rax
	leaq	.LC35(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L35
	movq	-8(%rbp), %rax
	leaq	.LC36(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L34
.L35:
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	try_alternative_html
	movl	%eax, -12(%rbp)
	cmpl	$0, -12(%rbp)
	jns	.L36
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC40(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rcx
	movl	$8, %edx
	leaq	.LC41(%rip), %rsi
	movq	%rax, %rdi
	call	send_
	nop
	jmp	.L33
.L36:
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC42(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-12(%rbp), %eax
	jmp	.L38
.L34:
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC43(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rcx
	movl	$8, %edx
	leaq	.LC41(%rip), %rsi
	movq	%rax, %rdi
	call	send_
	jmp	.L33
.L32:
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC44(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rcx
	movl	$2, %edx
	leaq	.LC45(%rip), %rsi
	movq	%rax, %rdi
	call	send_
	nop
.L33:
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-48(%rbp), %rax
	movq	$0, (%rax)
	movl	$-1, %eax
	jmp	.L38
.L30:
	movl	-12(%rbp), %eax
.L38:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	handle_file_request, .-handle_file_request
	.section	.rodata
	.align 8
.LC46:
	.string	"\033[31m[-] (%d) SOMETHING WENT WRONG\n\033[0m"
.LC47:
	.string	"SOMETHING WENT WRONG"
.LC48:
	.string	"Internal server error"
	.align 8
.LC49:
	.string	"\033[31m[-] (%d) Bad Extension\n\033[0m"
.LC50:
	.string	"Bad Extension"
.LC51:
	.string	"Connection: Keep-alive"
.LC52:
	.string	"Connection: close"
	.align 8
.LC53:
	.string	"%s %s\r\nContent-Type: %s\r\nContent-Length: %ld\r\n%s\r\n\r\n"
.LC54:
	.string	"Send header"
	.align 8
.LC55:
	.string	"\033[35m[+] (%d) Sent file %s, size: %d\n\033[0m"
	.align 8
.LC56:
	.string	"\033[31m[-] (%d) Method not allowed \n\033[0m"
.LC57:
	.string	"Method not allowed !"
	.text
	.globl	build_and_send_header
	.type	build_and_send_header, @function
build_and_send_header:
.LFB11:
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
	subq	$2160, %rsp
	movq	%rdi, -30824(%rbp)
	movq	%rsi, -30832(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpq	$0, -30824(%rbp)
	je	.L59
	movq	-30824(%rbp), %rax
	movl	88(%rax), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L43
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC46(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-30824(%rbp), %rax
	movl	88(%rax), %eax
	movl	%eax, %esi
	movq	-30832(%rbp), %rdx
	movq	-30824(%rbp), %rax
	movq	%rdx, %rcx
	movl	%esi, %edx
	leaq	.LC47(%rip), %rsi
	movq	%rax, %rdi
	call	send_
	jmp	.L40
.L43:
	movq	-30824(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	construct_filepath
	movq	%rax, -30776(%rbp)
	cmpq	$0, -30776(%rbp)
	jne	.L44
	movq	-30832(%rbp), %rdx
	movq	-30824(%rbp), %rax
	movq	%rdx, %rcx
	movl	$4, %edx
	leaq	.LC48(%rip), %rsi
	movq	%rax, %rdi
	call	send_
	jmp	.L40
.L44:
	leaq	-30792(%rbp), %rcx
	movq	-30776(%rbp), %rdx
	movq	-30832(%rbp), %rsi
	movq	-30824(%rbp), %rax
	movq	%rax, %rdi
	call	handle_file_request
	movl	%eax, -30812(%rbp)
	cmpl	$0, -30812(%rbp)
	jns	.L45
	movq	-30776(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	jmp	.L40
.L45:
	movq	-30824(%rbp), %rax
	movl	48(%rax), %eax
	testl	%eax, %eax
	jne	.L46
	movq	-30776(%rbp), %rax
	movl	$46, %esi
	movq	%rax, %rdi
	call	strrchr@PLT
	movq	%rax, -30768(%rbp)
	cmpq	$0, -30768(%rbp)
	je	.L47
	movq	-30768(%rbp), %rax
	addq	$1, %rax
	jmp	.L48
.L47:
	movl	$0, %eax
.L48:
	movq	%rax, %rdi
	call	get_content_type
	movl	%eax, %eax
	leaq	0(,%rax,8), %rdx
	leaq	contentType(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, -30760(%rbp)
	movq	-30760(%rbp), %rax
	movl	$5, %edx
	leaq	.LC20(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	testl	%eax, %eax
	jne	.L49
	movq	-30776(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC49(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-30832(%rbp), %rdx
	movq	-30824(%rbp), %rax
	movq	%rdx, %rcx
	movl	$2, %edx
	leaq	.LC50(%rip), %rsi
	movq	%rax, %rdi
	call	send_
	jmp	.L40
.L49:
	movl	-30812(%rbp), %eax
	movl	$2, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	lseek@PLT
	movq	%rax, -30752(%rbp)
	movl	-30812(%rbp), %eax
	movl	$0, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	lseek@PLT
	movq	-30824(%rbp), %rax
	movl	80(%rax), %eax
	testl	%eax, %eax
	je	.L50
	leaq	.LC51(%rip), %rax
	jmp	.L51
.L50:
	leaq	.LC52(%rip), %rax
.L51:
	movq	%rax, -30744(%rbp)
	movq	8+status_codes(%rip), %rcx
	movq	-30824(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-30752(%rbp), %rdi
	movq	-30760(%rbp), %rsi
	leaq	-30784(%rbp), %rax
	subq	$8, %rsp
	pushq	-30744(%rbp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC53(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	addq	$16, %rsp
	movl	%eax, -30804(%rbp)
	cmpl	$0, -30804(%rbp)
	jns	.L52
	movl	-30812(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movq	-30776(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC44(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-30832(%rbp), %rdx
	movq	-30824(%rbp), %rax
	movq	%rdx, %rcx
	movl	$2, %edx
	leaq	.LC45(%rip), %rsi
	movq	%rax, %rdi
	call	send_
	movq	-30784(%rbp), %rax
	testq	%rax, %rax
	je	.L60
	movq	-30784(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	jmp	.L60
.L52:
	movl	$0, -30800(%rbp)
	movq	-30752(%rbp), %rax
	movl	%eax, -30796(%rbp)
	movl	-30804(%rbp), %eax
	movslq	%eax, %rdx
	movq	-30784(%rbp), %rsi
	movq	-30832(%rbp), %rax
	movl	4(%rax), %eax
	movl	$16384, %ecx
	movl	%eax, %edi
	call	send@PLT
	movl	%eax, -30800(%rbp)
	cmpl	$0, -30800(%rbp)
	jns	.L54
	movq	-30832(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	-30812(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	leaq	.LC54(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	jmp	.L40
.L54:
	movq	-30832(%rbp), %rax
	movl	4(%rax), %eax
	movq	-30752(%rbp), %rdx
	movl	-30812(%rbp), %esi
	movq	%rdx, %rcx
	movl	$0, %edx
	movl	%eax, %edi
	call	sendfile@PLT
	movl	%eax, -30800(%rbp)
	cmpl	$0, -30800(%rbp)
	jle	.L55
	call	gettid@PLT
	movl	%eax, %esi
	movl	-30800(%rbp), %edx
	movq	-30776(%rbp), %rax
	movl	%edx, %ecx
	movq	%rax, %rdx
	leaq	.LC55(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-30812(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L40
.L55:
	movq	-30776(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	-30812(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L40
.L46:
	call	gettid@PLT
	movl	%eax, %esi
	leaq	.LC56(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-30832(%rbp), %rdx
	movq	-30824(%rbp), %rax
	movq	%rdx, %rcx
	movl	$16, %edx
	leaq	.LC57(%rip), %rsi
	movq	%rax, %rdi
	call	send_
	movl	-30808(%rbp), %eax
	movslq	%eax, %rdx
	movq	-30784(%rbp), %rsi
	movq	-30832(%rbp), %rax
	movl	4(%rax), %eax
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	jmp	.L40
.L59:
	nop
	jmp	.L40
.L60:
	nop
.L40:
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L58
	call	__stack_chk_fail@PLT
.L58:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	build_and_send_header, .-build_and_send_header
	.globl	build_for_og_server
	.type	build_for_og_server, @function
build_for_og_server:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, %edx
	movl	$1, %esi
	movl	$2, %edi
	call	socket@PLT
	movl	%eax, -4(%rbp)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	build_for_og_server, .-build_for_og_server
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
