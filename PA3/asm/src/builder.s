	.file	"builder.c"
	.text
.Ltext0:
	.file 0 "/home/parth/Work/All_data/university/Network System/Assignments/PA3" "src/builder.c"
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
	.file 1 "src/builder.c"
	.loc 1 60 1
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
	.loc 1 60 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 64 19
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
	.loc 1 73 5
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-16(%rbp), %rsi
	movq	-64(%rbp), %rax
	movl	4(%rax), %eax
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 74 1
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
	.loc 1 91 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 92 8
	cmpq	$0, -8(%rbp)
	jne	.L4
	.loc 1 93 16
	movl	$2, %eax
	jmp	.L5
.L4:
	.loc 1 94 10
	movq	-8(%rbp), %rax
	leaq	.LC22(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 94 8 discriminator 1
	testl	%eax, %eax
	je	.L6
	.loc 1 94 34 discriminator 1
	movq	-8(%rbp), %rax
	leaq	.LC23(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 94 30 discriminator 1
	testl	%eax, %eax
	jne	.L7
.L6:
	.loc 1 95 16
	movl	$0, %eax
	jmp	.L5
.L7:
	.loc 1 96 10
	movq	-8(%rbp), %rax
	leaq	.LC24(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 96 8 discriminator 1
	testl	%eax, %eax
	jne	.L8
	.loc 1 97 16
	movl	$1, %eax
	jmp	.L5
.L8:
	.loc 1 98 10
	movq	-8(%rbp), %rax
	leaq	.LC25(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 98 8 discriminator 1
	testl	%eax, %eax
	jne	.L9
	.loc 1 99 16
	movl	$2, %eax
	jmp	.L5
.L9:
	.loc 1 100 10
	movq	-8(%rbp), %rax
	leaq	.LC26(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 100 8 discriminator 1
	testl	%eax, %eax
	jne	.L10
	.loc 1 101 16
	movl	$3, %eax
	jmp	.L5
.L10:
	.loc 1 102 10
	movq	-8(%rbp), %rax
	leaq	.LC27(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 102 8 discriminator 1
	testl	%eax, %eax
	jne	.L11
	.loc 1 103 16
	movl	$4, %eax
	jmp	.L5
.L11:
	.loc 1 104 10
	movq	-8(%rbp), %rax
	leaq	.LC28(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 104 8 discriminator 1
	testl	%eax, %eax
	jne	.L12
	.loc 1 105 16
	movl	$5, %eax
	jmp	.L5
.L12:
	.loc 1 106 10
	movq	-8(%rbp), %rax
	leaq	.LC29(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 106 8 discriminator 1
	testl	%eax, %eax
	jne	.L13
	.loc 1 107 16
	movl	$6, %eax
	jmp	.L5
.L13:
	.loc 1 108 10
	movq	-8(%rbp), %rax
	movl	$3, %edx
	leaq	.LC30(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 108 8 discriminator 1
	testl	%eax, %eax
	jne	.L14
	.loc 1 109 16
	movl	$7, %eax
	jmp	.L5
.L14:
	.loc 1 111 16
	movl	$8, %eax
.L5:
	.loc 1 112 1
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
	.loc 1 125 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 1 125 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 127 10
	movq	-24(%rbp), %rax
	leaq	.LC31(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 127 8 discriminator 1
	testl	%eax, %eax
	jne	.L16
	.loc 1 129 9
	leaq	-16(%rbp), %rax
	leaq	.LC32(%rip), %rdx
	leaq	.LC33(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	jmp	.L17
.L16:
	.loc 1 133 9
	movq	-24(%rbp), %rdx
	leaq	-16(%rbp), %rax
	movq	%rdx, %rcx
	leaq	.LC32(%rip), %rdx
	leaq	.LC34(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
.L17:
	.loc 1 135 12
	movq	-16(%rbp), %rax
	.loc 1 136 1
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
	.loc 1 150 1
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
	.loc 1 151 8
	cmpq	$0, -24(%rbp)
	je	.L21
	.loc 1 151 28 discriminator 1
	cmpq	$0, -32(%rbp)
	jne	.L22
.L21:
	.loc 1 152 16
	movl	$-1, %eax
	jmp	.L23
.L22:
	.loc 1 154 9
	movl	$-1, -12(%rbp)
	.loc 1 155 18
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, -8(%rbp)
	.loc 1 158 8
	cmpq	$5, -8(%rbp)
	jbe	.L24
	.loc 1 158 51 discriminator 1
	movq	-8(%rbp), %rax
	leaq	-5(%rax), %rdx
	.loc 1 158 20 discriminator 1
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC35(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 158 17 discriminator 1
	testl	%eax, %eax
	jne	.L24
	.loc 1 160 27
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	.loc 1 160 25 discriminator 1
	movq	-32(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 161 14
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 161 12
	testq	%rax, %rax
	jne	.L25
	.loc 1 162 20
	movl	$-1, %eax
	jmp	.L23
.L25:
	.loc 1 164 10
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 164 26
	movq	-8(%rbp), %rdx
	subq	$1, %rdx
	addq	%rdx, %rax
	.loc 1 164 36
	movb	$0, (%rax)
	.loc 1 165 14
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -12(%rbp)
	.loc 1 166 12
	cmpl	$0, -12(%rbp)
	jns	.L27
	.loc 1 168 13
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 169 29
	movq	-32(%rbp), %rax
	movq	$0, (%rax)
	.loc 1 166 12
	jmp	.L27
.L24:
	.loc 1 173 13
	cmpq	$4, -8(%rbp)
	jbe	.L27
	.loc 1 173 56 discriminator 1
	movq	-8(%rbp), %rax
	leaq	-4(%rax), %rdx
	.loc 1 173 25 discriminator 1
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC36(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 173 22 discriminator 1
	testl	%eax, %eax
	jne	.L27
	.loc 1 175 13
	movq	-24(%rbp), %rdx
	movq	-32(%rbp), %rax
	leaq	.LC37(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	.loc 1 175 12 discriminator 1
	testl	%eax, %eax
	jns	.L28
	.loc 1 177 20
	movl	$-1, %eax
	jmp	.L23
.L28:
	.loc 1 179 14
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -12(%rbp)
	.loc 1 180 12
	cmpl	$0, -12(%rbp)
	jns	.L27
	.loc 1 182 13
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 183 29
	movq	-32(%rbp), %rax
	movq	$0, (%rax)
.L27:
	.loc 1 187 12
	movl	-12(%rbp), %eax
.L23:
	.loc 1 188 1
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
	.loc 1 208 1
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
	.loc 1 209 14
	movq	-40(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -12(%rbp)
	.loc 1 210 23
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	.loc 1 210 21 discriminator 1
	movq	-48(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 212 8
	cmpl	$0, -12(%rbp)
	jns	.L30
.LBB2:
	.loc 1 214 27
	movq	-40(%rbp), %rax
	movl	$46, %esi
	movq	%rax, %rdi
	call	strrchr@PLT
	movq	%rax, -8(%rbp)
	.loc 1 216 17
	call	__errno_location@PLT
	.loc 1 216 17 is_stmt 0 discriminator 1
	movl	(%rax), %eax
	.loc 1 216 9 is_stmt 1 discriminator 1
	cmpl	$2, %eax
	je	.L31
	cmpl	$13, %eax
	jne	.L32
	.loc 1 219 13
	call	gettid@PLT
	.loc 1 219 13 is_stmt 0 discriminator 1
	movl	%eax, %esi
	leaq	.LC38(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 220 13 is_stmt 1
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rcx
	movl	$4, %edx
	leaq	.LC39(%rip), %rsi
	movq	%rax, %rdi
	call	send_
	.loc 1 221 13
	jmp	.L33
.L31:
	.loc 1 225 16
	cmpq	$0, -8(%rbp)
	je	.L34
	.loc 1 225 25 discriminator 1
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 225 21 discriminator 1
	testq	%rax, %rax
	je	.L34
	.loc 1 226 18
	movq	-8(%rbp), %rax
	leaq	.LC35(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 225 50 discriminator 2
	testl	%eax, %eax
	je	.L35
	.loc 1 226 47
	movq	-8(%rbp), %rax
	leaq	.LC36(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 226 44 discriminator 1
	testl	%eax, %eax
	jne	.L34
.L35:
	.loc 1 229 17
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 230 22
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	try_alternative_html
	movl	%eax, -12(%rbp)
	.loc 1 232 20
	cmpl	$0, -12(%rbp)
	jns	.L36
	.loc 1 234 21
	call	gettid@PLT
	.loc 1 234 21 is_stmt 0 discriminator 1
	movl	%eax, %esi
	leaq	.LC40(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 235 21 is_stmt 1
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rcx
	movl	$8, %edx
	leaq	.LC41(%rip), %rsi
	movq	%rax, %rdi
	call	send_
	.loc 1 232 20
	nop
	.loc 1 248 13
	jmp	.L33
.L36:
	.loc 1 239 21
	call	gettid@PLT
	.loc 1 239 21 is_stmt 0 discriminator 1
	movl	%eax, %esi
	leaq	.LC42(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 240 28 is_stmt 1
	movl	-12(%rbp), %eax
	jmp	.L38
.L34:
	.loc 1 245 17
	call	gettid@PLT
	.loc 1 245 17 is_stmt 0 discriminator 1
	movl	%eax, %esi
	leaq	.LC43(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 246 17 is_stmt 1
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rcx
	movl	$8, %edx
	leaq	.LC41(%rip), %rsi
	movq	%rax, %rdi
	call	send_
	.loc 1 248 13
	jmp	.L33
.L32:
	.loc 1 251 13
	call	gettid@PLT
	.loc 1 251 13 is_stmt 0 discriminator 1
	movl	%eax, %esi
	leaq	.LC44(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 252 13 is_stmt 1
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rcx
	movl	$2, %edx
	leaq	.LC45(%rip), %rsi
	movq	%rax, %rdi
	call	send_
	.loc 1 253 13
	nop
.L33:
	.loc 1 256 9
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 257 25
	movq	-48(%rbp), %rax
	movq	$0, (%rax)
	.loc 1 258 16
	movl	$-1, %eax
	jmp	.L38
.L30:
.LBE2:
	.loc 1 261 12
	movl	-12(%rbp), %eax
.L38:
	.loc 1 262 1
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
	.string	"%s %s\r\nContent-Type: %s\r\nContent-Length: %ld\r\n%s\r\r\n\n"
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
	.loc 1 286 1
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
	.loc 1 286 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 290 8
	cmpq	$0, -30824(%rbp)
	je	.L59
	.loc 1 294 23
	movq	-30824(%rbp), %rax
	movl	96(%rax), %eax
	.loc 1 294 38
	andl	$1, %eax
	.loc 1 294 7
	testl	%eax, %eax
	jne	.L43
	.loc 1 295 9
	call	gettid@PLT
	.loc 1 295 9 is_stmt 0 discriminator 1
	movl	%eax, %esi
	leaq	.LC46(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 296 69 is_stmt 1
	movq	-30824(%rbp), %rax
	movl	96(%rax), %eax
	.loc 1 296 9
	movl	%eax, %esi
	movq	-30832(%rbp), %rdx
	movq	-30824(%rbp), %rax
	movq	%rdx, %rcx
	movl	%esi, %edx
	leaq	.LC47(%rip), %rsi
	movq	%rax, %rdi
	call	send_
	.loc 1 297 9
	jmp	.L40
.L43:
	.loc 1 302 49
	movq	-30824(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 302 16
	movq	%rax, %rdi
	call	construct_filepath
	movq	%rax, -30776(%rbp)
	.loc 1 303 8
	cmpq	$0, -30776(%rbp)
	jne	.L44
	.loc 1 305 9
	movq	-30832(%rbp), %rdx
	movq	-30824(%rbp), %rax
	movq	%rdx, %rcx
	movl	$4, %edx
	leaq	.LC48(%rip), %rsi
	movq	%rax, %rdi
	call	send_
	.loc 1 306 9
	jmp	.L40
.L44:
	.loc 1 310 14
	leaq	-30792(%rbp), %rcx
	movq	-30776(%rbp), %rdx
	movq	-30832(%rbp), %rsi
	movq	-30824(%rbp), %rax
	movq	%rax, %rdi
	call	handle_file_request
	movl	%eax, -30812(%rbp)
	.loc 1 311 8
	cmpl	$0, -30812(%rbp)
	jns	.L45
	.loc 1 313 9
	movq	-30776(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 314 9
	jmp	.L40
.L45:
	.loc 1 324 23
	movq	-30824(%rbp), %rax
	movl	56(%rax), %eax
	.loc 1 324 8
	testl	%eax, %eax
	jne	.L46
.LBB3:
	.loc 1 327 15
	movq	-30776(%rbp), %rax
	movl	$46, %esi
	movq	%rax, %rdi
	call	strrchr@PLT
	movq	%rax, -30768(%rbp)
	.loc 1 328 36
	cmpq	$0, -30768(%rbp)
	je	.L47
	.loc 1 328 36 is_stmt 0 discriminator 1
	movq	-30768(%rbp), %rax
	addq	$1, %rax
	jmp	.L48
.L47:
	.loc 1 328 36 discriminator 2
	movl	$0, %eax
.L48:
	.loc 1 328 36 discriminator 4
	movq	%rax, %rdi
	call	get_content_type
	.loc 1 328 22 is_stmt 1 discriminator 1
	movl	%eax, %eax
	leaq	0(,%rax,8), %rdx
	leaq	contentType(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, -30760(%rbp)
	.loc 1 330 13
	movq	-30760(%rbp), %rax
	movl	$5, %edx
	leaq	.LC20(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 330 12 discriminator 1
	testl	%eax, %eax
	jne	.L49
	.loc 1 332 13
	movq	-30776(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 333 13
	call	gettid@PLT
	.loc 1 333 13 is_stmt 0 discriminator 1
	movl	%eax, %esi
	leaq	.LC49(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 334 13 is_stmt 1
	movq	-30832(%rbp), %rdx
	movq	-30824(%rbp), %rax
	movq	%rdx, %rcx
	movl	$2, %edx
	leaq	.LC50(%rip), %rsi
	movq	%rax, %rdi
	call	send_
	.loc 1 335 13
	jmp	.L40
.L49:
	.loc 1 339 16
	movl	-30812(%rbp), %eax
	movl	$2, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	lseek@PLT
	.loc 1 339 14 discriminator 1
	movq	%rax, -30752(%rbp)
	.loc 1 340 9
	movl	-30812(%rbp), %eax
	movl	$0, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	lseek@PLT
	.loc 1 343 53
	movq	-30824(%rbp), %rax
	movl	88(%rax), %eax
	.loc 1 343 104
	testl	%eax, %eax
	je	.L50
	.loc 1 343 104 is_stmt 0 discriminator 1
	leaq	.LC51(%rip), %rax
	jmp	.L51
.L50:
	.loc 1 343 104 discriminator 2
	leaq	.LC52(%rip), %rax
.L51:
	.loc 1 343 21 is_stmt 1 discriminator 4
	movq	%rax, -30744(%rbp)
	.loc 1 346 23
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
	.loc 1 348 12
	cmpl	$0, -30804(%rbp)
	jns	.L52
	.loc 1 350 13
	movl	-30812(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 351 13
	movq	-30776(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 352 13
	call	gettid@PLT
	.loc 1 352 13 is_stmt 0 discriminator 1
	movl	%eax, %esi
	leaq	.LC44(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 353 13 is_stmt 1
	movq	-30832(%rbp), %rdx
	movq	-30824(%rbp), %rax
	movq	%rdx, %rcx
	movl	$2, %edx
	leaq	.LC45(%rip), %rsi
	movq	%rax, %rdi
	call	send_
	.loc 1 354 32
	movq	-30784(%rbp), %rax
	.loc 1 354 16
	testq	%rax, %rax
	je	.L60
	.loc 1 355 17
	movq	-30784(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 356 13
	jmp	.L60
.L52:
	.loc 1 360 13
	movl	$0, -30800(%rbp)
	.loc 1 360 27
	movq	-30752(%rbp), %rax
	movl	%eax, -30796(%rbp)
	.loc 1 361 25
	movl	-30804(%rbp), %eax
	movslq	%eax, %rdx
	movq	-30784(%rbp), %rsi
	movq	-30832(%rbp), %rax
	movl	4(%rax), %eax
	movl	$16384, %ecx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 361 23 discriminator 1
	movl	%eax, -30800(%rbp)
	.loc 1 361 12 discriminator 1
	cmpl	$0, -30800(%rbp)
	jns	.L54
	.loc 1 363 13
	movq	-30832(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 364 13
	movl	-30812(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 365 13
	leaq	.LC54(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	.loc 1 366 13
	jmp	.L40
.L54:
	.loc 1 371 20
	movq	-30832(%rbp), %rax
	movl	4(%rax), %eax
	movq	-30752(%rbp), %rdx
	movl	-30812(%rbp), %esi
	movq	%rdx, %rcx
	movl	$0, %edx
	movl	%eax, %edi
	call	sendfile@PLT
	.loc 1 371 18 discriminator 1
	movl	%eax, -30800(%rbp)
	.loc 1 372 12
	cmpl	$0, -30800(%rbp)
	jle	.L55
	.loc 1 374 13
	call	gettid@PLT
	movl	%eax, %esi
	.loc 1 374 13 is_stmt 0 discriminator 1
	movl	-30800(%rbp), %edx
	movq	-30776(%rbp), %rax
	movl	%edx, %ecx
	movq	%rax, %rdx
	leaq	.LC55(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 375 13 is_stmt 1
	movl	-30812(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 376 13
	jmp	.L40
.L55:
	.loc 1 395 9
	movq	-30776(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 396 9
	movl	-30812(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
.LBE3:
	jmp	.L40
.L46:
	.loc 1 401 9
	call	gettid@PLT
	.loc 1 401 9 is_stmt 0 discriminator 1
	movl	%eax, %esi
	leaq	.LC56(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 402 9 is_stmt 1
	movq	-30832(%rbp), %rdx
	movq	-30824(%rbp), %rax
	movq	%rdx, %rcx
	movl	$16, %edx
	leaq	.LC57(%rip), %rsi
	movq	%rax, %rdi
	call	send_
	.loc 1 403 9
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
	.loc 1 291 9
	nop
	jmp	.L40
.L60:
.LBB4:
	.loc 1 356 13
	nop
.L40:
.LBE4:
	.loc 1 405 1
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
	.loc 1 407 74
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
	.loc 1 411 8
	cmpq	$0, -8(%rbp)
	je	.L64
	.loc 1 415 23
	movq	-8(%rbp), %rax
	movl	96(%rax), %eax
	.loc 1 415 38
	andl	$1, %eax
	.loc 1 415 7
	testl	%eax, %eax
	jne	.L61
	.loc 1 416 9
	call	gettid@PLT
	.loc 1 416 9 is_stmt 0 discriminator 1
	movl	%eax, %esi
	leaq	.LC46(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 417 69 is_stmt 1
	movq	-8(%rbp), %rax
	movl	96(%rax), %eax
	.loc 1 417 9
	movl	%eax, %esi
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rcx
	movl	%esi, %edx
	leaq	.LC47(%rip), %rsi
	movq	%rax, %rdi
	call	send_
	.loc 1 418 9
	jmp	.L61
.L64:
	.loc 1 412 9
	nop
.L61:
	.loc 1 427 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	build_for_og_server, .-build_for_og_server
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/14/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/stdio.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.file 8 "/usr/include/unistd.h"
	.file 9 "/usr/include/x86_64-linux-gnu/bits/sockaddr.h"
	.file 10 "/usr/include/x86_64-linux-gnu/bits/socket.h"
	.file 11 "/usr/include/netdb.h"
	.file 12 "./common.h"
	.file 13 "/usr/include/x86_64-linux-gnu/sys/sendfile.h"
	.file 14 "/usr/include/x86_64-linux-gnu/bits/unistd_ext.h"
	.file 15 "/usr/include/errno.h"
	.file 16 "/usr/include/string.h"
	.file 17 "/usr/include/stdlib.h"
	.file 18 "/usr/include/fcntl.h"
	.file 19 "/usr/include/x86_64-linux-gnu/sys/socket.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xbf8
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x22
	.long	.LASF181
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
	.uleb128 0x23
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
	.uleb128 0x24
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
	.byte	0x9a
	.byte	0x19
	.long	0x66
	.uleb128 0x4
	.long	.LASF12
	.byte	0x3
	.byte	0xc2
	.byte	0x1b
	.long	0x6d
	.uleb128 0x6
	.long	0x9d
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.long	.LASF13
	.uleb128 0x25
	.long	0x9d
	.uleb128 0x4
	.long	.LASF14
	.byte	0x3
	.byte	0xd2
	.byte	0x17
	.long	0x41
	.uleb128 0x6
	.long	0xa4
	.uleb128 0x19
	.long	0xb5
	.uleb128 0x4
	.long	.LASF15
	.byte	0x4
	.byte	0x40
	.byte	0x11
	.long	0x74
	.uleb128 0x4
	.long	.LASF16
	.byte	0x4
	.byte	0x4e
	.byte	0x13
	.long	0x8c
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.long	.LASF17
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.long	.LASF18
	.uleb128 0x10
	.long	.LASF22
	.byte	0x10
	.byte	0x5
	.byte	0x33
	.byte	0x10
	.long	0x10d
	.uleb128 0x1
	.long	.LASF19
	.byte	0x5
	.byte	0x35
	.byte	0x23
	.long	0x10d
	.byte	0
	.uleb128 0x1
	.long	.LASF20
	.byte	0x5
	.byte	0x36
	.byte	0x23
	.long	0x10d
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.long	0xe5
	.uleb128 0x4
	.long	.LASF21
	.byte	0x5
	.byte	0x37
	.byte	0x3
	.long	0xe5
	.uleb128 0x10
	.long	.LASF23
	.byte	0x28
	.byte	0x6
	.byte	0x16
	.byte	0x8
	.long	0x194
	.uleb128 0x1
	.long	.LASF24
	.byte	0x6
	.byte	0x18
	.byte	0x7
	.long	0x66
	.byte	0
	.uleb128 0x1
	.long	.LASF25
	.byte	0x6
	.byte	0x19
	.byte	0x10
	.long	0x41
	.byte	0x4
	.uleb128 0x1
	.long	.LASF26
	.byte	0x6
	.byte	0x1a
	.byte	0x7
	.long	0x66
	.byte	0x8
	.uleb128 0x1
	.long	.LASF27
	.byte	0x6
	.byte	0x1c
	.byte	0x10
	.long	0x41
	.byte	0xc
	.uleb128 0x1
	.long	.LASF28
	.byte	0x6
	.byte	0x20
	.byte	0x7
	.long	0x66
	.byte	0x10
	.uleb128 0x1
	.long	.LASF29
	.byte	0x6
	.byte	0x22
	.byte	0x9
	.long	0x5f
	.byte	0x14
	.uleb128 0x1
	.long	.LASF30
	.byte	0x6
	.byte	0x23
	.byte	0x9
	.long	0x5f
	.byte	0x16
	.uleb128 0x1
	.long	.LASF31
	.byte	0x6
	.byte	0x24
	.byte	0x14
	.long	0x112
	.byte	0x18
	.byte	0
	.uleb128 0x26
	.byte	0x28
	.byte	0x7
	.byte	0x43
	.byte	0x9
	.long	0x1bf
	.uleb128 0x16
	.long	.LASF32
	.byte	0x45
	.byte	0x1c
	.long	0x11e
	.uleb128 0x16
	.long	.LASF33
	.byte	0x46
	.byte	0x8
	.long	0x1bf
	.uleb128 0x16
	.long	.LASF34
	.byte	0x47
	.byte	0xc
	.long	0x6d
	.byte	0
	.uleb128 0x8
	.long	0x9d
	.long	0x1cf
	.uleb128 0xc
	.long	0x3a
	.byte	0x27
	.byte	0
	.uleb128 0x4
	.long	.LASF35
	.byte	0x7
	.byte	0x48
	.byte	0x3
	.long	0x194
	.uleb128 0x6
	.long	0x1e0
	.uleb128 0x27
	.uleb128 0x28
	.long	.LASF36
	.byte	0x8
	.value	0x112
	.byte	0x15
	.long	0xa9
	.uleb128 0x6
	.long	0x98
	.uleb128 0x19
	.long	0x1ee
	.uleb128 0x4
	.long	.LASF37
	.byte	0x9
	.byte	0x1c
	.byte	0x1c
	.long	0x51
	.uleb128 0x10
	.long	.LASF38
	.byte	0x10
	.byte	0xa
	.byte	0xb8
	.byte	0x27
	.long	0x22c
	.uleb128 0x1
	.long	.LASF39
	.byte	0xa
	.byte	0xba
	.byte	0x5
	.long	0x1f8
	.byte	0
	.uleb128 0x1
	.long	.LASF40
	.byte	0xa
	.byte	0xbb
	.byte	0xa
	.long	0x22c
	.byte	0x2
	.byte	0
	.uleb128 0x8
	.long	0x9d
	.long	0x23c
	.uleb128 0xc
	.long	0x3a
	.byte	0xd
	.byte	0
	.uleb128 0x10
	.long	.LASF41
	.byte	0x80
	.byte	0xa
	.byte	0xc5
	.byte	0x27
	.long	0x271
	.uleb128 0x1
	.long	.LASF42
	.byte	0xa
	.byte	0xc7
	.byte	0x5
	.long	0x1f8
	.byte	0
	.uleb128 0x1
	.long	.LASF43
	.byte	0xa
	.byte	0xc8
	.byte	0xa
	.long	0x271
	.byte	0x2
	.uleb128 0x1
	.long	.LASF44
	.byte	0xa
	.byte	0xc9
	.byte	0x14
	.long	0x3a
	.byte	0x78
	.byte	0
	.uleb128 0x8
	.long	0x9d
	.long	0x281
	.uleb128 0xc
	.long	0x3a
	.byte	0x75
	.byte	0
	.uleb128 0x29
	.byte	0x7
	.byte	0x4
	.long	0x41
	.byte	0xa
	.byte	0xcf
	.byte	0x3
	.long	0x32b
	.uleb128 0x2
	.long	.LASF45
	.byte	0x1
	.uleb128 0x2
	.long	.LASF46
	.byte	0x2
	.uleb128 0x2
	.long	.LASF47
	.byte	0x4
	.uleb128 0x2
	.long	.LASF48
	.byte	0x4
	.uleb128 0x2
	.long	.LASF49
	.byte	0x8
	.uleb128 0x2
	.long	.LASF50
	.byte	0x10
	.uleb128 0x2
	.long	.LASF51
	.byte	0x20
	.uleb128 0x2
	.long	.LASF52
	.byte	0x40
	.uleb128 0x2
	.long	.LASF53
	.byte	0x80
	.uleb128 0x9
	.long	.LASF54
	.value	0x100
	.uleb128 0x9
	.long	.LASF55
	.value	0x200
	.uleb128 0x9
	.long	.LASF56
	.value	0x400
	.uleb128 0x9
	.long	.LASF57
	.value	0x800
	.uleb128 0x9
	.long	.LASF58
	.value	0x1000
	.uleb128 0x9
	.long	.LASF59
	.value	0x2000
	.uleb128 0x9
	.long	.LASF60
	.value	0x4000
	.uleb128 0x9
	.long	.LASF61
	.value	0x8000
	.uleb128 0x11
	.long	.LASF62
	.long	0x10000
	.uleb128 0x11
	.long	.LASF63
	.long	0x40000
	.uleb128 0x11
	.long	.LASF64
	.long	0x4000000
	.uleb128 0x11
	.long	.LASF65
	.long	0x20000000
	.uleb128 0x11
	.long	.LASF66
	.long	0x40000000
	.byte	0
	.uleb128 0x6
	.long	0x204
	.uleb128 0x2a
	.long	.LASF67
	.byte	0x30
	.byte	0xb
	.value	0x235
	.byte	0x8
	.long	0x3a7
	.uleb128 0xa
	.long	.LASF68
	.value	0x237
	.byte	0x7
	.long	0x66
	.byte	0
	.uleb128 0xa
	.long	.LASF69
	.value	0x238
	.byte	0x7
	.long	0x66
	.byte	0x4
	.uleb128 0xa
	.long	.LASF70
	.value	0x239
	.byte	0x7
	.long	0x66
	.byte	0x8
	.uleb128 0xa
	.long	.LASF71
	.value	0x23a
	.byte	0x7
	.long	0x66
	.byte	0xc
	.uleb128 0xa
	.long	.LASF72
	.value	0x23b
	.byte	0xd
	.long	0x1e1
	.byte	0x10
	.uleb128 0xa
	.long	.LASF73
	.value	0x23c
	.byte	0x14
	.long	0x32b
	.byte	0x18
	.uleb128 0xa
	.long	.LASF74
	.value	0x23d
	.byte	0x9
	.long	0x98
	.byte	0x20
	.uleb128 0xa
	.long	.LASF75
	.value	0x23e
	.byte	0x14
	.long	0x3a7
	.byte	0x28
	.byte	0
	.uleb128 0x6
	.long	0x330
	.uleb128 0x5
	.byte	0x10
	.byte	0x5
	.long	.LASF76
	.uleb128 0x5
	.byte	0x10
	.byte	0x7
	.long	.LASF77
	.uleb128 0x12
	.long	.LASF83
	.long	0x41
	.byte	0x66
	.long	0x3e1
	.uleb128 0x2
	.long	.LASF78
	.byte	0
	.uleb128 0x2
	.long	.LASF79
	.byte	0x1
	.uleb128 0x2
	.long	.LASF80
	.byte	0x2
	.uleb128 0x2
	.long	.LASF81
	.byte	0x3
	.byte	0
	.uleb128 0x4
	.long	.LASF82
	.byte	0xc
	.byte	0x6c
	.byte	0x3
	.long	0x3ba
	.uleb128 0x12
	.long	.LASF84
	.long	0x41
	.byte	0x72
	.long	0x425
	.uleb128 0x17
	.string	"OK"
	.byte	0x1
	.uleb128 0x2
	.long	.LASF85
	.byte	0x2
	.uleb128 0x2
	.long	.LASF86
	.byte	0x4
	.uleb128 0x2
	.long	.LASF87
	.byte	0x8
	.uleb128 0x2
	.long	.LASF88
	.byte	0x10
	.uleb128 0x2
	.long	.LASF89
	.byte	0x20
	.uleb128 0x2
	.long	.LASF90
	.byte	0x21
	.byte	0
	.uleb128 0x4
	.long	.LASF91
	.byte	0xc
	.byte	0x7b
	.byte	0x3
	.long	0x3ed
	.uleb128 0x12
	.long	.LASF92
	.long	0x41
	.byte	0x82
	.long	0x46a
	.uleb128 0x17
	.string	"GET"
	.byte	0
	.uleb128 0x2
	.long	.LASF93
	.byte	0x1
	.uleb128 0x17
	.string	"PUT"
	.byte	0x2
	.uleb128 0x2
	.long	.LASF94
	.byte	0x3
	.uleb128 0x2
	.long	.LASF95
	.byte	0x4
	.uleb128 0x2
	.long	.LASF96
	.byte	0x5
	.uleb128 0x2
	.long	.LASF97
	.byte	0x6
	.byte	0
	.uleb128 0x4
	.long	.LASF98
	.byte	0xc
	.byte	0x8b
	.byte	0x3
	.long	0x431
	.uleb128 0x12
	.long	.LASF99
	.long	0x41
	.byte	0x91
	.long	0x4bb
	.uleb128 0x2
	.long	.LASF100
	.byte	0
	.uleb128 0x2
	.long	.LASF101
	.byte	0x1
	.uleb128 0x2
	.long	.LASF102
	.byte	0x2
	.uleb128 0x2
	.long	.LASF103
	.byte	0x3
	.uleb128 0x2
	.long	.LASF104
	.byte	0x4
	.uleb128 0x2
	.long	.LASF105
	.byte	0x5
	.uleb128 0x2
	.long	.LASF106
	.byte	0x6
	.uleb128 0x2
	.long	.LASF107
	.byte	0x7
	.uleb128 0x2
	.long	.LASF108
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.long	.LASF109
	.byte	0xc
	.byte	0x9c
	.byte	0x3
	.long	0x476
	.uleb128 0x10
	.long	.LASF110
	.byte	0x78
	.byte	0xc
	.byte	0xba
	.byte	0x10
	.long	0x5bf
	.uleb128 0x1
	.long	.LASF111
	.byte	0xc
	.byte	0xbc
	.byte	0x10
	.long	0x3e1
	.byte	0
	.uleb128 0x1
	.long	.LASF112
	.byte	0xc
	.byte	0xbd
	.byte	0xb
	.long	0x98
	.byte	0x8
	.uleb128 0x1
	.long	.LASF113
	.byte	0xc
	.byte	0xbf
	.byte	0xb
	.long	0x98
	.byte	0x10
	.uleb128 0x1
	.long	.LASF114
	.byte	0xc
	.byte	0xc0
	.byte	0xb
	.long	0x98
	.byte	0x18
	.uleb128 0x1
	.long	.LASF115
	.byte	0xc
	.byte	0xc1
	.byte	0xb
	.long	0x98
	.byte	0x20
	.uleb128 0x1
	.long	.LASF116
	.byte	0xc
	.byte	0xc3
	.byte	0x13
	.long	0x4bb
	.byte	0x28
	.uleb128 0x1
	.long	.LASF117
	.byte	0xc
	.byte	0xc4
	.byte	0xb
	.long	0x98
	.byte	0x30
	.uleb128 0x1
	.long	.LASF118
	.byte	0xc
	.byte	0xc6
	.byte	0xe
	.long	0x46a
	.byte	0x38
	.uleb128 0x1
	.long	.LASF119
	.byte	0xc
	.byte	0xc7
	.byte	0xb
	.long	0x98
	.byte	0x40
	.uleb128 0x1
	.long	.LASF120
	.byte	0xc
	.byte	0xc9
	.byte	0x13
	.long	0x5bf
	.byte	0x48
	.uleb128 0x1
	.long	.LASF121
	.byte	0xc
	.byte	0xca
	.byte	0xb
	.long	0x98
	.byte	0x50
	.uleb128 0x1
	.long	.LASF122
	.byte	0xc
	.byte	0xcc
	.byte	0x9
	.long	0x66
	.byte	0x58
	.uleb128 0x1
	.long	.LASF123
	.byte	0xc
	.byte	0xcd
	.byte	0x9
	.long	0x66
	.byte	0x5c
	.uleb128 0x1
	.long	.LASF124
	.byte	0xc
	.byte	0xcf
	.byte	0x9
	.long	0x66
	.byte	0x60
	.uleb128 0x1
	.long	.LASF125
	.byte	0xc
	.byte	0xd0
	.byte	0x9
	.long	0x66
	.byte	0x64
	.uleb128 0x1
	.long	.LASF126
	.byte	0xc
	.byte	0xd2
	.byte	0x9
	.long	0x66
	.byte	0x68
	.uleb128 0x1
	.long	.LASF127
	.byte	0xc
	.byte	0xd4
	.byte	0x9
	.long	0x66
	.byte	0x6c
	.uleb128 0x1
	.long	.LASF128
	.byte	0xc
	.byte	0xd6
	.byte	0xb
	.long	0x98
	.byte	0x70
	.byte	0
	.uleb128 0x6
	.long	0x425
	.uleb128 0x4
	.long	.LASF129
	.byte	0xc
	.byte	0xd7
	.byte	0x3
	.long	0x4c7
	.uleb128 0x2b
	.byte	0xd0
	.byte	0xc
	.byte	0xe3
	.byte	0x9
	.long	0x65c
	.uleb128 0x1
	.long	.LASF130
	.byte	0xc
	.byte	0xe5
	.byte	0x9
	.long	0x66
	.byte	0
	.uleb128 0x1
	.long	.LASF131
	.byte	0xc
	.byte	0xe6
	.byte	0x9
	.long	0x66
	.byte	0x4
	.uleb128 0x1
	.long	.LASF132
	.byte	0xc
	.byte	0xe7
	.byte	0x1d
	.long	0x23c
	.byte	0x8
	.uleb128 0x1
	.long	.LASF133
	.byte	0xc
	.byte	0xe8
	.byte	0x16
	.long	0x3a7
	.byte	0x88
	.uleb128 0x1
	.long	.LASF134
	.byte	0xc
	.byte	0xe9
	.byte	0x9
	.long	0x66
	.byte	0x90
	.uleb128 0x1
	.long	.LASF135
	.byte	0xc
	.byte	0xea
	.byte	0x9
	.long	0x66
	.byte	0x94
	.uleb128 0x1
	.long	.LASF136
	.byte	0xc
	.byte	0xeb
	.byte	0x9
	.long	0x66
	.byte	0x98
	.uleb128 0x1
	.long	.LASF137
	.byte	0xc
	.byte	0xec
	.byte	0x9
	.long	0x66
	.byte	0x9c
	.uleb128 0x1
	.long	.LASF138
	.byte	0xc
	.byte	0xed
	.byte	0x9
	.long	0x66
	.byte	0xa0
	.uleb128 0x1
	.long	.LASF139
	.byte	0xc
	.byte	0xee
	.byte	0x15
	.long	0x1cf
	.byte	0xa8
	.byte	0
	.uleb128 0x4
	.long	.LASF140
	.byte	0xc
	.byte	0xef
	.byte	0x3
	.long	0x5d0
	.uleb128 0x8
	.long	0x98
	.long	0x678
	.uleb128 0xc
	.long	0x3a
	.byte	0x3
	.byte	0
	.uleb128 0xd
	.long	.LASF141
	.byte	0x13
	.byte	0xe
	.long	0x668
	.uleb128 0x9
	.byte	0x3
	.quad	http_type
	.uleb128 0x8
	.long	0x98
	.long	0x69d
	.uleb128 0xc
	.long	0x3a
	.byte	0x21
	.byte	0
	.uleb128 0xd
	.long	.LASF142
	.byte	0x17
	.byte	0xe
	.long	0x68d
	.uleb128 0x9
	.byte	0x3
	.quad	status_codes
	.uleb128 0x8
	.long	0x98
	.long	0x6c2
	.uleb128 0xc
	.long	0x3a
	.byte	0x6
	.byte	0
	.uleb128 0xd
	.long	.LASF143
	.byte	0x1f
	.byte	0xe
	.long	0x6b2
	.uleb128 0x9
	.byte	0x3
	.quad	reqMethod
	.uleb128 0x8
	.long	0x98
	.long	0x6e7
	.uleb128 0xc
	.long	0x3a
	.byte	0x8
	.byte	0
	.uleb128 0xd
	.long	.LASF144
	.byte	0x25
	.byte	0xe
	.long	0x6d7
	.uleb128 0x9
	.byte	0x3
	.quad	contentType
	.uleb128 0xe
	.long	.LASF145
	.byte	0xd
	.byte	0x21
	.byte	0x10
	.long	0xcb
	.long	0x721
	.uleb128 0x3
	.long	0x66
	.uleb128 0x3
	.long	0x66
	.uleb128 0x3
	.long	0x721
	.uleb128 0x3
	.long	0x2e
	.byte	0
	.uleb128 0x6
	.long	0xbf
	.uleb128 0x1a
	.long	.LASF152
	.byte	0x4
	.value	0x364
	.long	0x738
	.uleb128 0x3
	.long	0xb5
	.byte	0
	.uleb128 0xf
	.long	.LASF146
	.byte	0x8
	.value	0x166
	.byte	0xc
	.long	0x66
	.long	0x74f
	.uleb128 0x3
	.long	0x66
	.byte	0
	.uleb128 0xf
	.long	.LASF147
	.byte	0x8
	.value	0x153
	.byte	0x10
	.long	0x74
	.long	0x770
	.uleb128 0x3
	.long	0x66
	.uleb128 0x3
	.long	0x74
	.uleb128 0x3
	.long	0x66
	.byte	0
	.uleb128 0xf
	.long	.LASF148
	.byte	0x4
	.value	0x16b
	.byte	0xc
	.long	0x66
	.long	0x788
	.uleb128 0x3
	.long	0xb5
	.uleb128 0x18
	.byte	0
	.uleb128 0x1b
	.long	.LASF149
	.byte	0xe
	.byte	0x22
	.byte	0x10
	.long	0x80
	.uleb128 0x1b
	.long	.LASF150
	.byte	0xf
	.byte	0x25
	.byte	0xd
	.long	0x7a0
	.uleb128 0x6
	.long	0x66
	.uleb128 0xf
	.long	.LASF151
	.byte	0x10
	.value	0x111
	.byte	0xe
	.long	0x98
	.long	0x7c1
	.uleb128 0x3
	.long	0xb5
	.uleb128 0x3
	.long	0x66
	.byte	0
	.uleb128 0x1a
	.long	.LASF153
	.byte	0x11
	.value	0x2af
	.long	0x7d3
	.uleb128 0x3
	.long	0x48
	.byte	0
	.uleb128 0xe
	.long	.LASF154
	.byte	0x12
	.byte	0xd1
	.byte	0xc
	.long	0x66
	.long	0x7ef
	.uleb128 0x3
	.long	0xb5
	.uleb128 0x3
	.long	0x66
	.uleb128 0x18
	.byte	0
	.uleb128 0xe
	.long	.LASF155
	.byte	0x10
	.byte	0xbb
	.byte	0xe
	.long	0x98
	.long	0x805
	.uleb128 0x3
	.long	0xb5
	.byte	0
	.uleb128 0xf
	.long	.LASF156
	.byte	0x10
	.value	0x197
	.byte	0xf
	.long	0x2e
	.long	0x81c
	.uleb128 0x3
	.long	0xb5
	.byte	0
	.uleb128 0xe
	.long	.LASF157
	.byte	0x10
	.byte	0x9f
	.byte	0xc
	.long	0x66
	.long	0x83c
	.uleb128 0x3
	.long	0xb5
	.uleb128 0x3
	.long	0xb5
	.uleb128 0x3
	.long	0x3a
	.byte	0
	.uleb128 0xe
	.long	.LASF158
	.byte	0x10
	.byte	0x9c
	.byte	0xc
	.long	0x66
	.long	0x857
	.uleb128 0x3
	.long	0xb5
	.uleb128 0x3
	.long	0xb5
	.byte	0
	.uleb128 0xe
	.long	.LASF159
	.byte	0x13
	.byte	0x8a
	.byte	0x10
	.long	0xcb
	.long	0x87c
	.uleb128 0x3
	.long	0x66
	.uleb128 0x3
	.long	0x1db
	.uleb128 0x3
	.long	0x2e
	.uleb128 0x3
	.long	0x66
	.byte	0
	.uleb128 0xf
	.long	.LASF160
	.byte	0x4
	.value	0x193
	.byte	0xc
	.long	0x66
	.long	0x899
	.uleb128 0x3
	.long	0x1f3
	.uleb128 0x3
	.long	0xba
	.uleb128 0x18
	.byte	0
	.uleb128 0x1c
	.long	.LASF166
	.value	0x197
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x904
	.uleb128 0x1d
	.long	.LASF161
	.value	0x197
	.byte	0x28
	.long	0x904
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1e
	.string	"sd"
	.value	0x197
	.byte	0x47
	.long	0x909
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x13
	.long	.LASF162
	.value	0x198
	.byte	0xb
	.long	0x98
	.uleb128 0x13
	.long	.LASF163
	.value	0x198
	.byte	0x16
	.long	0x98
	.uleb128 0x13
	.long	.LASF164
	.value	0x198
	.byte	0x27
	.long	0x98
	.uleb128 0x13
	.long	.LASF165
	.value	0x199
	.byte	0x9
	.long	0x66
	.byte	0
	.uleb128 0x6
	.long	0x5c4
	.uleb128 0x6
	.long	0x65c
	.uleb128 0x1c
	.long	.LASF167
	.value	0x11d
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0xa2f
	.uleb128 0x1d
	.long	.LASF161
	.value	0x11d
	.byte	0x2a
	.long	0x904
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30840
	.uleb128 0x1e
	.string	"sd"
	.value	0x11d
	.byte	0x49
	.long	0x909
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30848
	.uleb128 0x7
	.long	.LASF162
	.value	0x11f
	.byte	0xb
	.long	0x98
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30792
	.uleb128 0x7
	.long	.LASF163
	.value	0x11f
	.byte	0x16
	.long	0x98
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30808
	.uleb128 0x7
	.long	.LASF164
	.value	0x11f
	.byte	0x27
	.long	0x98
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30800
	.uleb128 0x7
	.long	.LASF165
	.value	0x120
	.byte	0x9
	.long	0x66
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30824
	.uleb128 0x1f
	.string	"fd"
	.value	0x136
	.byte	0x9
	.long	0x66
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30828
	.uleb128 0x7
	.long	.LASF168
	.value	0x13d
	.byte	0xc
	.long	0x2e
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30768
	.uleb128 0x1f
	.string	"ext"
	.value	0x13e
	.byte	0xb
	.long	0x98
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30784
	.uleb128 0x7
	.long	.LASF116
	.value	0x13f
	.byte	0xb
	.long	0x98
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30776
	.uleb128 0x7
	.long	.LASF169
	.value	0x140
	.byte	0x9
	.long	0x66
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30820
	.uleb128 0x7
	.long	.LASF170
	.value	0x141
	.byte	0xa
	.long	0xa2f
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30752
	.uleb128 0x2c
	.long	.LLRL0
	.uleb128 0x7
	.long	.LASF171
	.value	0x157
	.byte	0x15
	.long	0xb5
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30760
	.uleb128 0x7
	.long	.LASF172
	.value	0x168
	.byte	0xd
	.long	0x66
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30816
	.uleb128 0x7
	.long	.LASF173
	.value	0x168
	.byte	0x1b
	.long	0x66
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30812
	.byte	0
	.byte	0
	.uleb128 0x8
	.long	0x9d
	.long	0xa40
	.uleb128 0x2d
	.long	0x3a
	.value	0x77ff
	.byte	0
	.uleb128 0x20
	.long	.LASF174
	.byte	0xce
	.long	0x66
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0xac5
	.uleb128 0xb
	.long	.LASF161
	.byte	0xce
	.byte	0x27
	.long	0x904
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x14
	.string	"sd"
	.byte	0xce
	.byte	0x46
	.long	0x909
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xb
	.long	.LASF162
	.byte	0xcf
	.byte	0x25
	.long	0xb5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xb
	.long	.LASF163
	.byte	0xcf
	.byte	0x36
	.long	0x1ee
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x15
	.string	"fd"
	.byte	0xd1
	.byte	0x9
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x2e
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x15
	.string	"ext"
	.byte	0xd6
	.byte	0x15
	.long	0xb5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x20
	.long	.LASF175
	.byte	0x95
	.long	0x66
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0xb1d
	.uleb128 0xb
	.long	.LASF176
	.byte	0x95
	.byte	0x26
	.long	0xb5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xb
	.long	.LASF163
	.byte	0x95
	.byte	0x40
	.long	0x1ee
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x15
	.string	"fd"
	.byte	0x9a
	.byte	0x9
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x15
	.string	"len"
	.byte	0x9b
	.byte	0xc
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x21
	.long	.LASF177
	.byte	0x7c
	.byte	0xe
	.long	0x98
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0xb5b
	.uleb128 0x14
	.string	"uri"
	.byte	0x7c
	.byte	0x2d
	.long	0xb5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xd
	.long	.LASF162
	.byte	0x7e
	.byte	0xb
	.long	0x98
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x21
	.long	.LASF178
	.byte	0x5a
	.byte	0x16
	.long	0x4bb
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0xb8b
	.uleb128 0x14
	.string	"ext"
	.byte	0x5a
	.byte	0x33
	.long	0xb5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x2f
	.long	.LASF182
	.byte	0x1
	.byte	0x3b
	.byte	0x6
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xb
	.long	.LASF161
	.byte	0x3b
	.byte	0x1a
	.long	0x904
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xb
	.long	.LASF179
	.byte	0x3b
	.byte	0x30
	.long	0x98
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0xb
	.long	.LASF180
	.byte	0x3b
	.byte	0x46
	.long	0x425
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x14
	.string	"sd"
	.byte	0x3b
	.byte	0x5b
	.long	0x909
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0xd
	.long	.LASF164
	.byte	0x3d
	.byte	0xb
	.long	0x98
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xd
	.long	.LASF165
	.byte	0x3e
	.byte	0x9
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
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
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x5
	.byte	0
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
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 11
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
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xf
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
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x21
	.sleb128 12
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 14
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 7
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
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
	.uleb128 0x22
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
	.uleb128 0x23
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.uleb128 0x25
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
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
	.uleb128 0x27
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x28
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
	.uleb128 0x29
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
	.uleb128 0x2a
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
	.uleb128 0x2b
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
	.uleb128 0x2c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x2f
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
	.uleb128 .LBB3-.Ltext0
	.uleb128 .LBE3-.Ltext0
	.byte	0x4
	.uleb128 .LBB4-.Ltext0
	.uleb128 .LBE4-.Ltext0
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF148:
	.string	"printf"
.LASF69:
	.string	"ai_family"
.LASF99:
	.string	"contentType_s"
.LASF54:
	.string	"MSG_WAITALL"
.LASF33:
	.string	"__size"
.LASF81:
	.string	"supported_http_protocols"
.LASF68:
	.string	"ai_flags"
.LASF91:
	.string	"statusCode_t"
.LASF9:
	.string	"size_t"
.LASF19:
	.string	"__prev"
.LASF34:
	.string	"__align"
.LASF163:
	.string	"final_filename"
.LASF67:
	.string	"addrinfo"
.LASF145:
	.string	"sendfile"
.LASF16:
	.string	"ssize_t"
.LASF173:
	.string	"temp_size"
.LASF181:
	.string	"GNU C17 14.2.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF120:
	.string	"status_code"
.LASF142:
	.string	"status_codes"
.LASF149:
	.string	"gettid"
.LASF62:
	.string	"MSG_WAITFORONE"
.LASF18:
	.string	"long long unsigned int"
.LASF20:
	.string	"__next"
.LASF132:
	.string	"client_info"
.LASF127:
	.string	"max_age"
.LASF36:
	.string	"socklen_t"
.LASF43:
	.string	"__ss_padding"
.LASF66:
	.string	"MSG_CMSG_CLOEXEC"
.LASF60:
	.string	"MSG_NOSIGNAL"
.LASF136:
	.string	"sentBytes"
.LASF17:
	.string	"long long int"
.LASF6:
	.string	"signed char"
.LASF10:
	.string	"__off_t"
.LASF146:
	.string	"close"
.LASF130:
	.string	"sockfd"
.LASF168:
	.string	"size"
.LASF113:
	.string	"uri_str"
.LASF110:
	.string	"req_header_s"
.LASF53:
	.string	"MSG_EOR"
.LASF8:
	.string	"long int"
.LASF48:
	.string	"MSG_TRYHARD"
.LASF78:
	.string	"HTTP1_0"
.LASF79:
	.string	"HTTP1_1"
.LASF12:
	.string	"__ssize_t"
.LASF106:
	.string	"IMAGE_JPG"
.LASF52:
	.string	"MSG_DONTWAIT"
.LASF21:
	.string	"__pthread_list_t"
.LASF160:
	.string	"asprintf"
.LASF23:
	.string	"__pthread_mutex_s"
.LASF169:
	.string	"header_size"
.LASF15:
	.string	"off_t"
.LASF64:
	.string	"MSG_ZEROCOPY"
.LASF105:
	.string	"IMAGE_GIF"
.LASF138:
	.string	"port"
.LASF76:
	.string	"__int128"
.LASF49:
	.string	"MSG_CTRUNC"
.LASF114:
	.string	"hostname_str"
.LASF3:
	.string	"unsigned int"
.LASF135:
	.string	"recvBytes"
.LASF104:
	.string	"IMAGE_PNG"
.LASF95:
	.string	"PATCH"
.LASF70:
	.string	"ai_socktype"
.LASF2:
	.string	"long unsigned int"
.LASF57:
	.string	"MSG_CONFIRM"
.LASF58:
	.string	"MSG_RST"
.LASF152:
	.string	"perror"
.LASF28:
	.string	"__kind"
.LASF32:
	.string	"__data"
.LASF100:
	.string	"TEXT_HTML"
.LASF118:
	.string	"method"
.LASF182:
	.string	"send_"
.LASF134:
	.string	"addr_len"
.LASF87:
	.string	"NOT_FOUND"
.LASF133:
	.string	"server_info"
.LASF5:
	.string	"short unsigned int"
.LASF55:
	.string	"MSG_FIN"
.LASF156:
	.string	"strlen"
.LASF89:
	.string	"VERSION_NOT_SUPPORTED"
.LASF107:
	.string	"IMAGE_X_ICON"
.LASF122:
	.string	"connection_keep_alive"
.LASF59:
	.string	"MSG_ERRQUEUE"
.LASF94:
	.string	"DELETE"
.LASF172:
	.string	"numbytes"
.LASF158:
	.string	"strcmp"
.LASF93:
	.string	"POST"
.LASF26:
	.string	"__owner"
.LASF125:
	.string	"current_state"
.LASF98:
	.string	"method_t"
.LASF144:
	.string	"contentType"
.LASF178:
	.string	"get_content_type"
.LASF129:
	.string	"HttpHeader_t"
.LASF154:
	.string	"open"
.LASF162:
	.string	"filename"
.LASF97:
	.string	"total_req_methods"
.LASF140:
	.string	"sockdetails_t"
.LASF159:
	.string	"send"
.LASF80:
	.string	"ERROR_VERSION"
.LASF176:
	.string	"original_filename"
.LASF71:
	.string	"ai_protocol"
.LASF121:
	.string	"status_code_str"
.LASF117:
	.string	"content_type_str"
.LASF41:
	.string	"sockaddr_storage"
.LASF179:
	.string	"message"
.LASF151:
	.string	"strrchr"
.LASF174:
	.string	"handle_file_request"
.LASF96:
	.string	"HEAD"
.LASF115:
	.string	"hostname_port_str"
.LASF126:
	.string	"open_file_fd"
.LASF22:
	.string	"__pthread_internal_list"
.LASF72:
	.string	"ai_addrlen"
.LASF101:
	.string	"TEXT_CSS"
.LASF39:
	.string	"sa_family"
.LASF103:
	.string	"APPLICATION_JAVASCRIPT"
.LASF167:
	.string	"build_and_send_header"
.LASF77:
	.string	"__int128 unsigned"
.LASF92:
	.string	"method_s"
.LASF4:
	.string	"unsigned char"
.LASF150:
	.string	"__errno_location"
.LASF85:
	.string	"BAD_REQ"
.LASF157:
	.string	"strncmp"
.LASF123:
	.string	"connection_close"
.LASF11:
	.string	"__pid_t"
.LASF73:
	.string	"ai_addr"
.LASF7:
	.string	"short int"
.LASF65:
	.string	"MSG_FASTOPEN"
.LASF83:
	.string	"httpType_s"
.LASF82:
	.string	"httpType_t"
.LASF46:
	.string	"MSG_PEEK"
.LASF50:
	.string	"MSG_PROXY"
.LASF75:
	.string	"ai_next"
.LASF102:
	.string	"TEXT_PLAIN"
.LASF131:
	.string	"client_sock_fd"
.LASF175:
	.string	"try_alternative_html"
.LASF25:
	.string	"__count"
.LASF24:
	.string	"__lock"
.LASF47:
	.string	"MSG_DONTROUTE"
.LASF139:
	.string	"lock"
.LASF13:
	.string	"char"
.LASF42:
	.string	"ss_family"
.LASF14:
	.string	"__socklen_t"
.LASF112:
	.string	"http_version_str"
.LASF128:
	.string	"extra_header"
.LASF38:
	.string	"sockaddr"
.LASF88:
	.string	"METHOD_NOT_ALLOWED"
.LASF84:
	.string	"statusCode_s"
.LASF30:
	.string	"__elision"
.LASF164:
	.string	"return_request"
.LASF63:
	.string	"MSG_BATCH"
.LASF51:
	.string	"MSG_TRUNC"
.LASF161:
	.string	"request_header"
.LASF153:
	.string	"free"
.LASF35:
	.string	"pthread_mutex_t"
.LASF29:
	.string	"__spins"
.LASF111:
	.string	"http_version"
.LASF37:
	.string	"sa_family_t"
.LASF165:
	.string	"return_size"
.LASF180:
	.string	"code"
.LASF44:
	.string	"__ss_align"
.LASF177:
	.string	"construct_filepath"
.LASF155:
	.string	"strdup"
.LASF109:
	.string	"contentType_t"
.LASF27:
	.string	"__nusers"
.LASF61:
	.string	"MSG_MORE"
.LASF86:
	.string	"FORBIDDEN"
.LASF147:
	.string	"lseek"
.LASF141:
	.string	"http_type"
.LASF143:
	.string	"reqMethod"
.LASF166:
	.string	"build_for_og_server"
.LASF116:
	.string	"content_type"
.LASF40:
	.string	"sa_data"
.LASF31:
	.string	"__list"
.LASF170:
	.string	"file_buffer"
.LASF74:
	.string	"ai_canonname"
.LASF119:
	.string	"method_str"
.LASF56:
	.string	"MSG_SYN"
.LASF90:
	.string	"total_status_codes"
.LASF137:
	.string	"timeout"
.LASF108:
	.string	"total_content_types"
.LASF171:
	.string	"connection_type"
.LASF45:
	.string	"MSG_OOB"
.LASF124:
	.string	"parser_error"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"src/builder.c"
.LASF1:
	.string	"/home/parth/Work/All_data/university/Network System/Assignments/PA3"
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
