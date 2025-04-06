	.file	"parser.c"
	.text
.Ltext0:
	.file 0 "/home/parth/Work/All_data/university/Network System/Assignments/PA3" "src/parser.c"
	.section	.rodata
.LC0:
	.string	"GET"
.LC1:
	.string	"POST"
.LC2:
	.string	"DELETE"
.LC3:
	.string	"PATCH"
.LC4:
	.string	""
	.section	.data.rel.local,"aw"
	.align 32
	.type	reqMethod, @object
	.size	reqMethod, 56
reqMethod:
	.quad	.LC0
	.quad	.LC1
	.quad	.LC2
	.quad	.LC3
	.quad	.LC4
	.quad	.LC4
	.quad	.LC4
	.section	.rodata
.LC5:
	.string	"HTTP/1.0"
.LC6:
	.string	"HTTP/1.1"
	.section	.data.rel.local
	.align 32
	.type	http_type, @object
	.size	http_type, 32
http_type:
	.quad	.LC5
	.quad	.LC6
	.zero	16
	.section	.rodata
.LC7:
	.string	"://"
.LC8:
	.string	"/"
	.text
	.globl	extract_uri_path
	.type	extract_uri_path, @function
extract_uri_path:
.LFB6:
	.file 1 "src/parser.c"
	.loc 1 61 41
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	.loc 1 63 32
	movq	-40(%rbp), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	movq	%rax, -24(%rbp)
	.loc 1 64 8
	cmpq	$0, -24(%rbp)
	jne	.L2
	.loc 1 65 16
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	jmp	.L3
.L2:
	.loc 1 69 17
	movq	-24(%rbp), %rax
	addq	$3, %rax
	movq	%rax, -16(%rbp)
	.loc 1 72 30
	movq	-16(%rbp), %rax
	movl	$47, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	movq	%rax, -8(%rbp)
	.loc 1 73 8
	cmpq	$0, -8(%rbp)
	jne	.L4
	.loc 1 74 16
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	jmp	.L3
.L4:
	.loc 1 78 12
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
.L3:
	.loc 1 79 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	extract_uri_path, .-extract_uri_path
	.section	.rodata
.LC9:
	.string	"Invalid header pointer"
.LC10:
	.string	"Request exceeds maximum size"
.LC11:
	.string	"Empty request"
	.align 8
.LC12:
	.string	"\033[31m[-] (%d) Parse error: %s\n\033[0m"
.LC13:
	.string	"\r\n"
	.align 8
.LC14:
	.string	"\033[31m\n[-] (%d) ERROR: HTTP request has no valid lines\n------------------------------------------------------------\n\033[0m"
.LC15:
	.string	" "
.LC16:
	.string	"\033[31m[-] (%d) no method \n\033[0m"
	.align 8
.LC17:
	.string	"\033[31m[-] (%d)no valid header \n\033[0m"
	.align 8
.LC18:
	.string	"\033[31m[-] (%d)no valid method \n\033[0m"
	.align 8
.LC19:
	.string	"\033[31m[-] (%d)no valid uri \n\033[0m"
.LC20:
	.string	"\033[31m[-] (%d)uri len =0 \n\033[0m"
.LC21:
	.string	".."
.LC22:
	.string	"\033[31m[-] (%d)uri has .. \n\033[0m"
	.align 8
.LC23:
	.string	"\033[31m[-] (%d)uri str null \n\033[0m"
	.align 8
.LC24:
	.string	"\033[31m[-] (%d)no version found\n\033[0m"
.LC25:
	.string	"HTTP/1."
	.align 8
.LC26:
	.string	"\033[31m[-] (%d)wrong thing found\n\033[0m"
	.align 8
.LC27:
	.string	"\033[31m[-] (%d)somthing wrong in version\n\033[0m"
.LC28:
	.string	":"
.LC29:
	.string	"Host"
.LC30:
	.string	"\033[31m[-] (%d)no host\n\033[0m"
.LC31:
	.string	"\033[31m[-] (%d) no host\n\033[0m"
.LC32:
	.string	"Connection"
.LC33:
	.string	"keep-alive"
.LC34:
	.string	"Cache-Control"
	.align 8
.LC35:
	.string	"[-] (%d) key:value not found in header!\033[0m"
	.align 8
.LC36:
	.string	"\033[31m[-] (%d) Memory allocation failed\n\033[0m"
	.align 8
.LC37:
	.string	"[-] (%d) No host in HTTP/1.1 header\n\033[0m"
	.text
	.globl	parse_request_line_thread_safe
	.type	parse_request_line_thread_safe, @function
parse_request_line_thread_safe:
.LFB7:
	.loc 1 104 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$240, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -248(%rbp)
	movq	%rsi, -256(%rbp)
	.loc 1 104 1
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %r12
	.loc 1 106 8
	cmpq	$0, -248(%rbp)
	je	.L6
	.loc 1 106 18 discriminator 1
	cmpq	$0, -256(%rbp)
	je	.L6
	.loc 1 106 32 discriminator 2
	movq	-248(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 106 29 discriminator 1
	cmpq	$30720, %rax
	jbe	.L7
.L6:
	.loc 1 108 30
	movq	-256(%rbp), %rax
	movl	$2, 96(%rax)
	.loc 1 109 9
	cmpq	$0, -248(%rbp)
	je	.L8
	.loc 1 111 51
	cmpq	$0, -256(%rbp)
	jne	.L9
	.loc 1 111 51 is_stmt 0 discriminator 1
	leaq	.LC9(%rip), %rbx
	jmp	.L11
.L9:
	.loc 1 111 51 discriminator 2
	leaq	.LC10(%rip), %rbx
	jmp	.L11
.L8:
	.loc 1 109 9 is_stmt 1 discriminator 1
	leaq	.LC11(%rip), %rbx
.L11:
	.loc 1 109 9 is_stmt 0 discriminator 3
	call	gettid@PLT
	.loc 1 109 9 discriminator 1
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 113 16 is_stmt 1
	movl	$-1, %eax
	jmp	.L12
.L7:
	.loc 1 116 23
	movq	-248(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 116 38 discriminator 1
	addq	$1, %rax
	movq	%rax, %rdx
	.loc 1 116 10 discriminator 1
	subq	$1, %rdx
	movq	%rdx, -184(%rbp)
	movl	$16, %edx
	subq	$1, %rdx
	addq	%rdx, %rax
	movl	$16, %ebx
	movl	$0, %edx
	divq	%rbx
	imulq	$16, %rax, %rax
	movq	%rax, %rcx
	andq	$-4096, %rcx
	movq	%rsp, %rdx
	subq	%rcx, %rdx
.L13:
	cmpq	%rdx, %rsp
	je	.L14
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L13
.L14:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L15
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L15:
	movq	%rsp, %rax
	movq	%rax, -176(%rbp)
	.loc 1 117 5
	movq	-248(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	.loc 1 117 5 is_stmt 0 discriminator 1
	movq	-248(%rbp), %rcx
	movq	-176(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	.loc 1 119 5 is_stmt 1
	movq	-256(%rbp), %rax
	movl	$120, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 120 26
	movq	-256(%rbp), %rax
	movl	$2, (%rax)
	.loc 1 121 20
	movq	-256(%rbp), %rax
	movl	$-1, 56(%rax)
	.loc 1 122 27
	movq	-256(%rbp), %rax
	movl	$0, 100(%rax)
	.loc 1 125 9
	movl	$0, -236(%rbp)
	.loc 1 126 11
	movq	$0, -216(%rbp)
	.loc 1 127 18
	leaq	-216(%rbp), %rdx
	movq	-176(%rbp), %rax
	leaq	.LC13(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strtok_r@PLT
	movq	%rax, -200(%rbp)
	.loc 1 129 11
	jmp	.L16
.L19:
	.loc 1 130 13
	movq	-200(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 130 12
	testb	%al, %al
	je	.L17
	.loc 1 132 29
	movl	-236(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -236(%rbp)
	.loc 1 132 33
	cltq
	movq	-200(%rbp), %rdx
	movq	%rdx, -96(%rbp,%rax,8)
.L17:
	.loc 1 134 16
	leaq	-216(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok_r@PLT
	movq	%rax, -200(%rbp)
.L16:
	.loc 1 129 17
	cmpq	$0, -200(%rbp)
	je	.L18
	.loc 1 129 17 is_stmt 0 discriminator 1
	cmpl	$6, -236(%rbp)
	jle	.L19
.L18:
	.loc 1 137 8 is_stmt 1
	cmpl	$0, -236(%rbp)
	jne	.L20
	.loc 1 137 29 discriminator 1
	movq	-248(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	.loc 1 137 25 discriminator 1
	testq	%rax, %rax
	jne	.L20
	.loc 1 140 9
	call	gettid@PLT
	.loc 1 140 9 is_stmt 0 discriminator 1
	movl	%eax, %esi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 143 30 is_stmt 1
	movq	-256(%rbp), %rax
	movl	$2, 96(%rax)
	.loc 1 144 16
	movl	$-1, %eax
	jmp	.L12
.L20:
	.loc 1 147 11
	movq	$0, -168(%rbp)
	.loc 1 147 27
	movq	$0, -160(%rbp)
	.loc 1 147 40
	movq	$0, -152(%rbp)
	.loc 1 148 11
	movq	$0, -208(%rbp)
	.loc 1 151 14
	movq	-96(%rbp), %rax
	leaq	-208(%rbp), %rdx
	leaq	.LC15(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strtok_r@PLT
	movq	%rax, -168(%rbp)
	.loc 1 152 8
	cmpq	$0, -168(%rbp)
	jne	.L21
	.loc 1 154 9
	call	gettid@PLT
	.loc 1 154 9 is_stmt 0 discriminator 1
	movl	%eax, %esi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 155 30 is_stmt 1
	movq	-256(%rbp), %rax
	movl	$2, 96(%rax)
	.loc 1 156 16
	movl	$-1, %eax
	jmp	.L12
.L21:
	.loc 1 161 9
	movl	$0, -232(%rbp)
	.loc 1 162 9
	movl	$0, -228(%rbp)
.LBB2:
	.loc 1 163 14
	movl	$0, -224(%rbp)
	.loc 1 163 5
	jmp	.L22
.L27:
	.loc 1 166 13
	movq	-168(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	.loc 1 166 38 discriminator 1
	movl	-224(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	leaq	reqMethod(%rip), %rax
	movq	(%rcx,%rax), %rcx
	.loc 1 166 13 discriminator 1
	movq	-168(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 166 12 discriminator 2
	testl	%eax, %eax
	jne	.L23
	.loc 1 168 16
	movq	-168(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	.loc 1 168 41 discriminator 1
	movq	reqMethod(%rip), %rcx
	.loc 1 168 16 discriminator 1
	movq	-168(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 168 15 discriminator 2
	testl	%eax, %eax
	jne	.L24
	.loc 1 169 32
	movl	-224(%rbp), %edx
	movq	-256(%rbp), %rax
	movl	%edx, 56(%rax)
	.loc 1 170 54
	movl	-224(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	reqMethod(%rip), %rax
	movq	(%rdx,%rax), %rax
	.loc 1 170 38
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	.loc 1 170 36 discriminator 1
	movq	-256(%rbp), %rax
	movq	%rdx, 64(%rax)
	.loc 1 171 30
	movl	$1, -232(%rbp)
	.loc 1 172 30
	movl	$1, -228(%rbp)
	.loc 1 178 13
	jmp	.L26
.L24:
	.loc 1 175 30
	movl	$1, -228(%rbp)
	.loc 1 176 30
	movl	$0, -232(%rbp)
	.loc 1 178 13
	jmp	.L26
.L23:
	.loc 1 163 45 discriminator 2
	addl	$1, -224(%rbp)
.L22:
	.loc 1 163 23 discriminator 1
	cmpl	$5, -224(%rbp)
	jle	.L27
.L26:
.LBE2:
	.loc 1 181 8
	cmpl	$0, -228(%rbp)
	jne	.L28
	.loc 1 183 9
	call	gettid@PLT
	.loc 1 183 9 is_stmt 0 discriminator 1
	movl	%eax, %esi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 184 30 is_stmt 1
	movq	-256(%rbp), %rax
	movl	$2, 96(%rax)
	.loc 1 185 16
	movl	$-1, %eax
	jmp	.L12
.L28:
	.loc 1 187 12
	cmpl	$0, -232(%rbp)
	jne	.L29
	.loc 1 188 9
	call	gettid@PLT
	.loc 1 188 9 is_stmt 0 discriminator 1
	movl	%eax, %esi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 189 30 is_stmt 1
	movq	-256(%rbp), %rax
	movl	$16, 96(%rax)
	.loc 1 190 16
	movl	$-1, %eax
	jmp	.L12
.L29:
	.loc 1 195 11
	leaq	-208(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok_r@PLT
	movq	%rax, -160(%rbp)
	.loc 1 196 8
	cmpq	$0, -160(%rbp)
	jne	.L30
	.loc 1 198 9
	call	gettid@PLT
	.loc 1 198 9 is_stmt 0 discriminator 1
	movl	%eax, %esi
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 199 30 is_stmt 1
	movq	-256(%rbp), %rax
	movl	$-2, 96(%rax)
	.loc 1 200 16
	movl	$-1, %eax
	jmp	.L12
.L30:
	.loc 1 204 22
	movq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, -144(%rbp)
	.loc 1 205 8
	cmpq	$0, -144(%rbp)
	jne	.L31
	.loc 1 208 9
	call	gettid@PLT
	.loc 1 208 9 is_stmt 0 discriminator 1
	movl	%eax, %esi
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 209 30 is_stmt 1
	movq	-256(%rbp), %rax
	movl	$2, 96(%rax)
	.loc 1 210 16
	movl	$-1, %eax
	jmp	.L12
.L31:
	.loc 1 214 9
	movq	-160(%rbp), %rax
	leaq	.LC21(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	.loc 1 214 8 discriminator 1
	testq	%rax, %rax
	je	.L32
	.loc 1 217 9
	call	gettid@PLT
	.loc 1 217 9 is_stmt 0 discriminator 1
	movl	%eax, %esi
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 218 30 is_stmt 1
	movq	-256(%rbp), %rax
	movl	$4, 96(%rax)
	.loc 1 219 16
	movl	$-1, %eax
	jmp	.L12
.L32:
	.loc 1 223 23
	movq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	extract_uri_path
	.loc 1 223 21 discriminator 1
	movq	-256(%rbp), %rdx
	movq	%rax, 16(%rdx)
	.loc 1 224 16
	movq	-256(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 224 8
	testq	%rax, %rax
	jne	.L33
	.loc 1 226 9
	call	gettid@PLT
	.loc 1 226 9 is_stmt 0 discriminator 1
	movl	%eax, %esi
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 227 30 is_stmt 1
	movq	-256(%rbp), %rax
	movl	$2, 96(%rax)
	.loc 1 228 16
	movl	$-1, %eax
	jmp	.L12
.L33:
	.loc 1 232 15
	leaq	-208(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok_r@PLT
	movq	%rax, -152(%rbp)
	.loc 1 233 8
	cmpq	$0, -152(%rbp)
	jne	.L34
	.loc 1 235 9
	call	gettid@PLT
	.loc 1 235 9 is_stmt 0 discriminator 1
	movl	%eax, %esi
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 236 30 is_stmt 1
	movq	-256(%rbp), %rax
	movl	$2, 96(%rax)
	.loc 1 237 16
	movl	$-1, %eax
	jmp	.L12
.L34:
	.loc 1 244 9
	movq	-152(%rbp), %rax
	movl	$7, %edx
	leaq	.LC25(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 244 8 discriminator 1
	testl	%eax, %eax
	je	.L35
	.loc 1 246 9
	call	gettid@PLT
	.loc 1 246 9 is_stmt 0 discriminator 1
	movl	%eax, %esi
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 247 30 is_stmt 1
	movq	-256(%rbp), %rax
	movl	$2, 96(%rax)
	.loc 1 248 16
	movl	$-1, %eax
	jmp	.L12
.L35:
	.loc 1 252 9
	movq	-152(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 252 8 discriminator 1
	cmpq	$8, %rax
	ja	.L36
	.loc 1 252 32 discriminator 1
	movq	-152(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 252 29 discriminator 1
	cmpq	$6, %rax
	ja	.L37
.L36:
	.loc 1 253 9
	call	gettid@PLT
	.loc 1 253 9 is_stmt 0 discriminator 1
	movl	%eax, %esi
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 254 30 is_stmt 1
	movq	-256(%rbp), %rax
	movl	$2, 96(%rax)
	.loc 1 255 16
	movl	$-1, %eax
	jmp	.L12
.L37:
	.loc 1 258 20
	movq	-152(%rbp), %rax
	addq	$7, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	.loc 1 258 5
	cmpl	$48, %eax
	je	.L38
	cmpl	$49, %eax
	jne	.L39
	.loc 1 261 30
	movq	-256(%rbp), %rax
	movl	$1, (%rax)
	.loc 1 262 52
	movq	8+http_type(%rip), %rax
	.loc 1 262 36
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	.loc 1 262 34 discriminator 1
	movq	-256(%rbp), %rax
	movq	%rdx, 8(%rax)
	.loc 1 263 9
	jmp	.L40
.L38:
	.loc 1 265 30
	movq	-256(%rbp), %rax
	movl	$0, (%rax)
	.loc 1 266 52
	movq	http_type(%rip), %rax
	.loc 1 266 36
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	.loc 1 266 34 discriminator 1
	movq	-256(%rbp), %rax
	movq	%rdx, 8(%rax)
	.loc 1 267 9
	jmp	.L40
.L39:
	.loc 1 269 9
	call	gettid@PLT
	.loc 1 269 9 is_stmt 0 discriminator 1
	movl	%eax, %esi
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 270 30 is_stmt 1
	movq	-256(%rbp), %rax
	movl	$32, 96(%rax)
	.loc 1 271 16
	movl	$-1, %eax
	jmp	.L12
.L40:
	.loc 1 274 27
	movq	-256(%rbp), %rax
	movl	$1, 100(%rax)
	.loc 1 275 30
	movq	-256(%rbp), %rax
	movl	$1, 92(%rax)
	.loc 1 278 14
	movq	-256(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 278 7
	testq	%rax, %rax
	jne	.L41
	.loc 1 279 9
	call	gettid@PLT
	.loc 1 279 9 is_stmt 0 discriminator 1
	movl	%eax, %esi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 280 30 is_stmt 1
	movq	-256(%rbp), %rax
	movl	$16, 96(%rax)
	.loc 1 281 16
	movl	$-1, %eax
	jmp	.L12
.L41:
.LBB3:
	.loc 1 286 14
	movl	$1, -220(%rbp)
	.loc 1 286 5
	jmp	.L42
.L61:
.LBB4:
	.loc 1 288 34
	movl	-220(%rbp), %eax
	cltq
	movq	-96(%rbp,%rax,8), %rax
	.loc 1 288 22
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, -136(%rbp)
	.loc 1 289 21
	movl	-220(%rbp), %eax
	cltq
	movq	-96(%rbp,%rax,8), %rax
	leaq	-208(%rbp), %rdx
	leaq	.LC28(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strtok_r@PLT
	movq	%rax, -128(%rbp)
	.loc 1 290 23
	leaq	-208(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok_r@PLT
	movq	%rax, -192(%rbp)
	.loc 1 292 12
	cmpq	$0, -128(%rbp)
	je	.L65
	.loc 1 292 18 discriminator 2
	cmpq	$0, -192(%rbp)
	je	.L65
	.loc 1 298 15
	jmp	.L46
.L47:
	.loc 1 299 14
	addq	$1, -192(%rbp)
.L46:
	.loc 1 298 16
	movq	-192(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 298 23
	cmpb	$32, %al
	je	.L47
	.loc 1 301 13
	movq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	.loc 1 301 13 is_stmt 0 discriminator 1
	movq	-128(%rbp), %rax
	leaq	.LC29(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncasecmp@PLT
	.loc 1 301 12 is_stmt 1 discriminator 2
	testl	%eax, %eax
	jne	.L48
	.loc 1 303 19
	leaq	-208(%rbp), %rdx
	movq	-192(%rbp), %rax
	leaq	.LC28(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strtok_r@PLT
	movq	%rax, -128(%rbp)
	.loc 1 304 21
	leaq	-208(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok_r@PLT
	movq	%rax, -192(%rbp)
	.loc 1 306 15
	cmpq	$0, -128(%rbp)
	jne	.L49
	.loc 1 307 17
	call	gettid@PLT
	.loc 1 307 17 is_stmt 0 discriminator 1
	movl	%eax, %esi
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 308 38 is_stmt 1
	movq	-256(%rbp), %rax
	movl	$2, 96(%rax)
	.loc 1 309 24
	movl	$-1, %eax
	jmp	.L12
.L49:
	.loc 1 312 36
	movq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	.loc 1 312 34 discriminator 1
	movq	-256(%rbp), %rax
	movq	%rdx, 24(%rax)
	.loc 1 314 24
	movq	-256(%rbp), %rax
	movq	24(%rax), %rax
	.loc 1 314 16
	testq	%rax, %rax
	jne	.L50
	.loc 1 315 17
	call	gettid@PLT
	.loc 1 315 17 is_stmt 0 discriminator 1
	movl	%eax, %esi
	leaq	.LC31(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 316 38 is_stmt 1
	movq	-256(%rbp), %rax
	movl	$2, 96(%rax)
	.loc 1 317 24
	movl	$-1, %eax
	jmp	.L12
.L50:
	.loc 1 321 15
	cmpq	$0, -192(%rbp)
	je	.L51
	.loc 1 322 45
	movq	-192(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	.loc 1 322 43 discriminator 1
	movq	-256(%rbp), %rax
	movq	%rdx, 32(%rax)
.L51:
	.loc 1 325 24
	movq	-256(%rbp), %rax
	movq	32(%rax), %rax
	.loc 1 325 16
	testq	%rax, %rax
	jne	.L52
	.loc 1 326 43
	movq	-256(%rbp), %rax
	movq	$0, 32(%rax)
	jmp	.L52
.L48:
	.loc 1 331 18
	movq	-128(%rbp), %rax
	leaq	.LC32(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcasecmp@PLT
	.loc 1 331 17 discriminator 1
	testl	%eax, %eax
	jne	.L53
	.loc 1 333 16
	movq	-192(%rbp), %rax
	leaq	.LC33(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcasecmp@PLT
	.loc 1 333 15 discriminator 1
	testl	%eax, %eax
	jne	.L54
	.loc 1 333 84 discriminator 1
	movq	-256(%rbp), %rax
	movl	$1, 88(%rax)
	jmp	.L52
.L54:
	.loc 1 334 43
	movq	-256(%rbp), %rax
	movl	$1, 92(%rax)
	jmp	.L52
.L53:
	.loc 1 336 18
	movq	-128(%rbp), %rax
	leaq	.LC34(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcasecmp@PLT
	.loc 1 336 17 discriminator 1
	testl	%eax, %eax
	je	.L52
	.loc 1 341 15
	cmpq	$0, -136(%rbp)
	je	.L55
	.loc 1 341 25 discriminator 1
	movq	-136(%rbp), %rax
	movl	$58, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	.loc 1 341 22 discriminator 1
	testq	%rax, %rax
	jne	.L56
.L55:
	.loc 1 342 17
	call	gettid@PLT
	.loc 1 342 17 is_stmt 0 discriminator 1
	movl	%eax, %esi
	leaq	.LC35(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 343 38 is_stmt 1
	movq	-256(%rbp), %rax
	movl	$2, 96(%rax)
	.loc 1 344 24
	movl	$-1, %eax
	jmp	.L12
.L56:
	.loc 1 347 22
	movq	-256(%rbp), %rax
	movq	112(%rax), %rax
	.loc 1 347 15
	testq	%rax, %rax
	jne	.L57
	.loc 1 348 47
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 348 40 discriminator 1
	addq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	.loc 1 348 38 discriminator 2
	movq	-256(%rbp), %rax
	movq	%rdx, 112(%rax)
	.loc 1 349 27
	movq	-256(%rbp), %rax
	movq	112(%rax), %rax
	.loc 1 349 19
	testq	%rax, %rax
	jne	.L58
	.loc 1 350 21
	call	gettid@PLT
	movl	%eax, %edx
	.loc 1 350 21 is_stmt 0 discriminator 1
	movq	stderr(%rip), %rax
	leaq	.LC36(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 351 21 is_stmt 1
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 352 21
	jmp	.L59
.L58:
	.loc 1 354 17
	movq	-256(%rbp), %rax
	movq	112(%rax), %rax
	movq	-136(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	.loc 1 355 17
	movq	-256(%rbp), %rax
	movq	112(%rax), %rbx
	movq	%rbx, %rdi
	call	strlen@PLT
	.loc 1 355 17 is_stmt 0 discriminator 1
	addq	%rbx, %rax
	movw	$2573, (%rax)
	movb	$0, 2(%rax)
	jmp	.L52
.L57:
	.loc 1 357 34 is_stmt 1
	movq	-256(%rbp), %rax
	movq	112(%rax), %rax
	.loc 1 357 21
	movzbl	(%rax), %eax
	.loc 1 357 20
	testb	%al, %al
	je	.L52
	.loc 1 357 50 discriminator 1
	cmpq	$0, -136(%rbp)
	je	.L52
	.loc 1 357 74 discriminator 2
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 357 58 discriminator 2
	testb	%al, %al
	je	.L52
.LBB5:
	.loc 1 358 51
	movq	-256(%rbp), %rax
	movq	112(%rax), %rax
	.loc 1 358 38
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, -120(%rbp)
	.loc 1 359 35
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, -112(%rbp)
	.loc 1 361 71
	movq	-120(%rbp), %rdx
	movq	-112(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 361 30
	leaq	3(%rax), %rdx
	.loc 1 361 44
	movq	-256(%rbp), %rax
	movq	112(%rax), %rax
	.loc 1 361 30
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, -104(%rbp)
	.loc 1 362 19
	cmpq	$0, -104(%rbp)
	jne	.L60
	.loc 1 363 21
	call	gettid@PLT
	movl	%eax, %edx
	.loc 1 363 21 is_stmt 0 discriminator 1
	movq	stderr(%rip), %rax
	leaq	.LC36(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 364 21 is_stmt 1
	jmp	.L59
.L60:
	.loc 1 367 42
	movq	-256(%rbp), %rax
	movq	-104(%rbp), %rdx
	movq	%rdx, 112(%rax)
	.loc 1 368 21
	movq	-256(%rbp), %rax
	movq	112(%rax), %rax
	movq	-136(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	.loc 1 369 21
	movq	-256(%rbp), %rax
	movq	112(%rax), %rbx
	movq	%rbx, %rdi
	call	strlen@PLT
	.loc 1 369 21 is_stmt 0 discriminator 1
	addq	%rbx, %rax
	movw	$2573, (%rax)
	movb	$0, 2(%rax)
.L52:
.LBE5:
	.loc 1 375 9 is_stmt 1
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	jmp	.L45
.L65:
	.loc 1 294 13
	nop
.L45:
.LBE4:
	.loc 1 286 38 discriminator 2
	addl	$1, -220(%rbp)
.L42:
	.loc 1 286 23 discriminator 1
	movl	-220(%rbp), %eax
	cmpl	-236(%rbp), %eax
	jl	.L61
.L59:
.LBE3:
	.loc 1 379 15
	movq	-256(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 379 8
	cmpl	$1, %eax
	jne	.L62
	.loc 1 379 51 discriminator 1
	movq	-256(%rbp), %rax
	movq	24(%rax), %rax
	.loc 1 379 41 discriminator 1
	testq	%rax, %rax
	jne	.L62
	.loc 1 381 9
	call	gettid@PLT
	.loc 1 381 9 is_stmt 0 discriminator 1
	movl	%eax, %esi
	leaq	.LC37(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 382 30 is_stmt 1
	movq	-256(%rbp), %rax
	movl	$2, 96(%rax)
	.loc 1 383 16
	movl	$-1, %eax
	jmp	.L12
.L62:
	.loc 1 386 12
	movl	$0, %eax
.L12:
	movq	%r12, %rsp
	.loc 1 387 1
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L64
	call	__stack_chk_fail@PLT
.L64:
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	parse_request_line_thread_safe, .-parse_request_line_thread_safe
	.globl	cleanup_header
	.type	cleanup_header, @function
cleanup_header:
.LFB8:
	.loc 1 400 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 401 8
	cmpq	$0, -8(%rbp)
	je	.L73
	.loc 1 403 18
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 403 11
	testq	%rax, %rax
	je	.L68
	.loc 1 403 48 discriminator 1
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 403 29 discriminator 1
	movq	%rax, %rdi
	call	free@PLT
.L68:
	.loc 1 404 18
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	.loc 1 404 11
	testq	%rax, %rax
	je	.L69
	.loc 1 404 53 discriminator 1
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	.loc 1 404 34 discriminator 1
	movq	%rax, %rdi
	call	free@PLT
.L69:
	.loc 1 405 18
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	.loc 1 405 11
	testq	%rax, %rax
	je	.L70
	.loc 1 405 58 discriminator 1
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	.loc 1 405 39 discriminator 1
	movq	%rax, %rdi
	call	free@PLT
.L70:
	.loc 1 406 18
	movq	-8(%rbp), %rax
	movq	80(%rax), %rax
	.loc 1 406 11
	testq	%rax, %rax
	je	.L71
	.loc 1 406 56 discriminator 1
	movq	-8(%rbp), %rax
	movq	80(%rax), %rax
	.loc 1 406 37 discriminator 1
	movq	%rax, %rdi
	call	free@PLT
.L71:
	.loc 1 407 18
	movq	-8(%rbp), %rax
	movq	112(%rax), %rax
	.loc 1 407 11
	testq	%rax, %rax
	je	.L72
	.loc 1 407 53 discriminator 1
	movq	-8(%rbp), %rax
	movq	112(%rax), %rax
	.loc 1 407 34 discriminator 1
	movq	%rax, %rdi
	call	free@PLT
.L72:
	.loc 1 409 9
	movq	-8(%rbp), %rax
	movl	$120, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.L73:
	.loc 1 411 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	cleanup_header, .-cleanup_header
	.globl	str_equals
	.type	str_equals, @function
str_equals:
.LFB9:
	.loc 1 423 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	.loc 1 424 13
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 424 33 discriminator 1
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	.loc 1 425 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	str_equals, .-str_equals
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/14/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 6 "./common.h"
	.file 7 "/usr/include/string.h"
	.file 8 "/usr/include/stdlib.h"
	.file 9 "/usr/include/stdio.h"
	.file 10 "/usr/include/strings.h"
	.file 11 "/usr/include/x86_64-linux-gnu/bits/unistd_ext.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xa4a
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x1a
	.long	.LASF163
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x7
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
	.uleb128 0x5
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x1c
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x7
	.long	.LASF10
	.byte	0x3
	.byte	0x98
	.byte	0x19
	.long	0x6d
	.uleb128 0x7
	.long	.LASF11
	.byte	0x3
	.byte	0x99
	.byte	0x1b
	.long	0x6d
	.uleb128 0x7
	.long	.LASF12
	.byte	0x3
	.byte	0x9a
	.byte	0x19
	.long	0x66
	.uleb128 0x6
	.long	0xa2
	.uleb128 0xf
	.long	0x98
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.long	.LASF13
	.uleb128 0x1d
	.long	0xa2
	.uleb128 0x13
	.long	.LASF89
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x235
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
	.long	0x98
	.byte	0x8
	.uleb128 0x1
	.long	.LASF16
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0x98
	.byte	0x10
	.uleb128 0x1
	.long	.LASF17
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0x98
	.byte	0x18
	.uleb128 0x1
	.long	.LASF18
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0x98
	.byte	0x20
	.uleb128 0x1
	.long	.LASF19
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0x98
	.byte	0x28
	.uleb128 0x1
	.long	.LASF20
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0x98
	.byte	0x30
	.uleb128 0x1
	.long	.LASF21
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0x98
	.byte	0x38
	.uleb128 0x1
	.long	.LASF22
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0x98
	.byte	0x40
	.uleb128 0x1
	.long	.LASF23
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0x98
	.byte	0x48
	.uleb128 0x1
	.long	.LASF24
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0x98
	.byte	0x50
	.uleb128 0x1
	.long	.LASF25
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0x98
	.byte	0x58
	.uleb128 0x1
	.long	.LASF26
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x24e
	.byte	0x60
	.uleb128 0x1
	.long	.LASF27
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x253
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
	.long	0x258
	.byte	0x83
	.uleb128 0x1
	.long	.LASF34
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x268
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
	.long	0x272
	.byte	0x98
	.uleb128 0x1
	.long	.LASF37
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x27c
	.byte	0xa0
	.uleb128 0x1
	.long	.LASF38
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x253
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
	.long	0x281
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
	.long	0x286
	.byte	0xc4
	.byte	0
	.uleb128 0x7
	.long	.LASF43
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0xae
	.uleb128 0x1e
	.long	.LASF164
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0x10
	.long	.LASF44
	.uleb128 0x6
	.long	0x249
	.uleb128 0x6
	.long	0xae
	.uleb128 0xa
	.long	0xa2
	.long	0x268
	.uleb128 0xb
	.long	0x3a
	.byte	0
	.byte	0
	.uleb128 0x6
	.long	0x241
	.uleb128 0x10
	.long	.LASF45
	.uleb128 0x6
	.long	0x26d
	.uleb128 0x10
	.long	.LASF46
	.uleb128 0x6
	.long	0x277
	.uleb128 0x6
	.long	0x253
	.uleb128 0xa
	.long	0xa2
	.long	0x296
	.uleb128 0xb
	.long	0x3a
	.byte	0x13
	.byte	0
	.uleb128 0x6
	.long	0xa9
	.uleb128 0xf
	.long	0x296
	.uleb128 0x6
	.long	0x235
	.uleb128 0x1f
	.long	.LASF165
	.byte	0x9
	.byte	0x97
	.byte	0xe
	.long	0x2a0
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.long	.LASF47
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.long	.LASF48
	.uleb128 0x6
	.long	0x98
	.uleb128 0xf
	.long	0x2bf
	.uleb128 0x5
	.byte	0x10
	.byte	0x5
	.long	.LASF49
	.uleb128 0x5
	.byte	0x10
	.byte	0x7
	.long	.LASF50
	.uleb128 0xc
	.long	.LASF56
	.long	0x41
	.byte	0x6
	.byte	0x66
	.long	0x2ff
	.uleb128 0x2
	.long	.LASF51
	.byte	0
	.uleb128 0x2
	.long	.LASF52
	.byte	0x1
	.uleb128 0x2
	.long	.LASF53
	.byte	0x2
	.uleb128 0x2
	.long	.LASF54
	.byte	0x3
	.byte	0
	.uleb128 0x7
	.long	.LASF55
	.byte	0x6
	.byte	0x6c
	.byte	0x3
	.long	0x2d7
	.uleb128 0xc
	.long	.LASF57
	.long	0x41
	.byte	0x6
	.byte	0x72
	.long	0x344
	.uleb128 0x11
	.string	"OK"
	.byte	0x1
	.uleb128 0x2
	.long	.LASF58
	.byte	0x2
	.uleb128 0x2
	.long	.LASF59
	.byte	0x4
	.uleb128 0x2
	.long	.LASF60
	.byte	0x8
	.uleb128 0x2
	.long	.LASF61
	.byte	0x10
	.uleb128 0x2
	.long	.LASF62
	.byte	0x20
	.uleb128 0x2
	.long	.LASF63
	.byte	0x21
	.byte	0
	.uleb128 0x7
	.long	.LASF64
	.byte	0x6
	.byte	0x7b
	.byte	0x3
	.long	0x30b
	.uleb128 0xc
	.long	.LASF65
	.long	0x41
	.byte	0x6
	.byte	0x82
	.long	0x38a
	.uleb128 0x11
	.string	"GET"
	.byte	0
	.uleb128 0x2
	.long	.LASF66
	.byte	0x1
	.uleb128 0x11
	.string	"PUT"
	.byte	0x2
	.uleb128 0x2
	.long	.LASF67
	.byte	0x3
	.uleb128 0x2
	.long	.LASF68
	.byte	0x4
	.uleb128 0x2
	.long	.LASF69
	.byte	0x5
	.uleb128 0x2
	.long	.LASF70
	.byte	0x6
	.byte	0
	.uleb128 0x7
	.long	.LASF71
	.byte	0x6
	.byte	0x8b
	.byte	0x3
	.long	0x350
	.uleb128 0xc
	.long	.LASF72
	.long	0x41
	.byte	0x6
	.byte	0x91
	.long	0x3dc
	.uleb128 0x2
	.long	.LASF73
	.byte	0
	.uleb128 0x2
	.long	.LASF74
	.byte	0x1
	.uleb128 0x2
	.long	.LASF75
	.byte	0x2
	.uleb128 0x2
	.long	.LASF76
	.byte	0x3
	.uleb128 0x2
	.long	.LASF77
	.byte	0x4
	.uleb128 0x2
	.long	.LASF78
	.byte	0x5
	.uleb128 0x2
	.long	.LASF79
	.byte	0x6
	.uleb128 0x2
	.long	.LASF80
	.byte	0x7
	.uleb128 0x2
	.long	.LASF81
	.byte	0x8
	.byte	0
	.uleb128 0x7
	.long	.LASF82
	.byte	0x6
	.byte	0x9c
	.byte	0x3
	.long	0x396
	.uleb128 0x20
	.byte	0x5
	.byte	0x4
	.long	0x66
	.byte	0x6
	.byte	0xa4
	.byte	0x1
	.long	0x41b
	.uleb128 0x2
	.long	.LASF83
	.byte	0
	.uleb128 0xd
	.long	.LASF84
	.sleb128 -1
	.uleb128 0xd
	.long	.LASF85
	.sleb128 -2
	.uleb128 0xd
	.long	.LASF86
	.sleb128 -3
	.uleb128 0xd
	.long	.LASF87
	.sleb128 -4
	.uleb128 0xd
	.long	.LASF88
	.sleb128 -5
	.byte	0
	.uleb128 0x13
	.long	.LASF90
	.byte	0x78
	.byte	0x6
	.byte	0xba
	.byte	0x10
	.long	0x513
	.uleb128 0x1
	.long	.LASF91
	.byte	0x6
	.byte	0xbc
	.byte	0x10
	.long	0x2ff
	.byte	0
	.uleb128 0x1
	.long	.LASF92
	.byte	0x6
	.byte	0xbd
	.byte	0xb
	.long	0x98
	.byte	0x8
	.uleb128 0x1
	.long	.LASF93
	.byte	0x6
	.byte	0xbf
	.byte	0xb
	.long	0x98
	.byte	0x10
	.uleb128 0x1
	.long	.LASF94
	.byte	0x6
	.byte	0xc0
	.byte	0xb
	.long	0x98
	.byte	0x18
	.uleb128 0x1
	.long	.LASF95
	.byte	0x6
	.byte	0xc1
	.byte	0xb
	.long	0x98
	.byte	0x20
	.uleb128 0x1
	.long	.LASF96
	.byte	0x6
	.byte	0xc3
	.byte	0x13
	.long	0x3dc
	.byte	0x28
	.uleb128 0x1
	.long	.LASF97
	.byte	0x6
	.byte	0xc4
	.byte	0xb
	.long	0x98
	.byte	0x30
	.uleb128 0x1
	.long	.LASF98
	.byte	0x6
	.byte	0xc6
	.byte	0xe
	.long	0x38a
	.byte	0x38
	.uleb128 0x1
	.long	.LASF99
	.byte	0x6
	.byte	0xc7
	.byte	0xb
	.long	0x98
	.byte	0x40
	.uleb128 0x1
	.long	.LASF100
	.byte	0x6
	.byte	0xc9
	.byte	0x13
	.long	0x513
	.byte	0x48
	.uleb128 0x1
	.long	.LASF101
	.byte	0x6
	.byte	0xca
	.byte	0xb
	.long	0x98
	.byte	0x50
	.uleb128 0x1
	.long	.LASF102
	.byte	0x6
	.byte	0xcc
	.byte	0x9
	.long	0x66
	.byte	0x58
	.uleb128 0x1
	.long	.LASF103
	.byte	0x6
	.byte	0xcd
	.byte	0x9
	.long	0x66
	.byte	0x5c
	.uleb128 0x1
	.long	.LASF104
	.byte	0x6
	.byte	0xcf
	.byte	0x9
	.long	0x66
	.byte	0x60
	.uleb128 0x1
	.long	.LASF105
	.byte	0x6
	.byte	0xd0
	.byte	0x9
	.long	0x66
	.byte	0x64
	.uleb128 0x1
	.long	.LASF106
	.byte	0x6
	.byte	0xd2
	.byte	0x9
	.long	0x66
	.byte	0x68
	.uleb128 0x1
	.long	.LASF107
	.byte	0x6
	.byte	0xd4
	.byte	0x9
	.long	0x66
	.byte	0x6c
	.uleb128 0x1
	.long	.LASF108
	.byte	0x6
	.byte	0xd6
	.byte	0xb
	.long	0x98
	.byte	0x70
	.byte	0
	.uleb128 0x6
	.long	0x344
	.uleb128 0x7
	.long	.LASF109
	.byte	0x6
	.byte	0xd7
	.byte	0x3
	.long	0x41b
	.uleb128 0xa
	.long	0x98
	.long	0x534
	.uleb128 0xb
	.long	0x3a
	.byte	0x6
	.byte	0
	.uleb128 0x4
	.long	.LASF110
	.byte	0x18
	.byte	0xe
	.long	0x524
	.uleb128 0x9
	.byte	0x3
	.quad	reqMethod
	.uleb128 0xa
	.long	0x98
	.long	0x559
	.uleb128 0xb
	.long	0x3a
	.byte	0x3
	.byte	0
	.uleb128 0x4
	.long	.LASF111
	.byte	0x23
	.byte	0xe
	.long	0x549
	.uleb128 0x9
	.byte	0x3
	.quad	http_type
	.uleb128 0xc
	.long	.LASF112
	.long	0x41
	.byte	0x1
	.byte	0x28
	.long	0x5ba
	.uleb128 0x2
	.long	.LASF113
	.byte	0
	.uleb128 0x2
	.long	.LASF114
	.byte	0x1
	.uleb128 0x2
	.long	.LASF115
	.byte	0x2
	.uleb128 0x2
	.long	.LASF116
	.byte	0x3
	.uleb128 0x2
	.long	.LASF117
	.byte	0x4
	.uleb128 0x2
	.long	.LASF118
	.byte	0x5
	.uleb128 0x2
	.long	.LASF119
	.byte	0x6
	.uleb128 0x2
	.long	.LASF120
	.byte	0x7
	.uleb128 0x2
	.long	.LASF121
	.byte	0x8
	.uleb128 0x2
	.long	.LASF122
	.byte	0x9
	.byte	0
	.uleb128 0x8
	.long	.LASF123
	.byte	0x7
	.byte	0x95
	.byte	0xe
	.long	0x98
	.long	0x5d5
	.uleb128 0x3
	.long	0x98
	.uleb128 0x3
	.long	0x296
	.byte	0
	.uleb128 0x9
	.long	.LASF124
	.byte	0x8
	.value	0x2ab
	.byte	0xe
	.long	0x48
	.long	0x5f1
	.uleb128 0x3
	.long	0x48
	.uleb128 0x3
	.long	0x3a
	.byte	0
	.uleb128 0x8
	.long	.LASF125
	.byte	0x7
	.byte	0x8d
	.byte	0xe
	.long	0x98
	.long	0x60c
	.uleb128 0x3
	.long	0x98
	.uleb128 0x3
	.long	0x296
	.byte	0
	.uleb128 0x21
	.long	.LASF166
	.byte	0x8
	.value	0x2af
	.byte	0xd
	.long	0x61f
	.uleb128 0x3
	.long	0x48
	.byte	0
	.uleb128 0x9
	.long	.LASF126
	.byte	0x9
	.value	0x165
	.byte	0xc
	.long	0x66
	.long	0x63c
	.uleb128 0x3
	.long	0x2a0
	.uleb128 0x3
	.long	0x296
	.uleb128 0x14
	.byte	0
	.uleb128 0x9
	.long	.LASF127
	.byte	0x8
	.value	0x2a0
	.byte	0xe
	.long	0x48
	.long	0x653
	.uleb128 0x3
	.long	0x3a
	.byte	0
	.uleb128 0x8
	.long	.LASF128
	.byte	0xa
	.byte	0x74
	.byte	0xc
	.long	0x66
	.long	0x66e
	.uleb128 0x3
	.long	0x296
	.uleb128 0x3
	.long	0x296
	.byte	0
	.uleb128 0x8
	.long	.LASF129
	.byte	0xa
	.byte	0x78
	.byte	0xc
	.long	0x66
	.long	0x68e
	.uleb128 0x3
	.long	0x296
	.uleb128 0x3
	.long	0x296
	.uleb128 0x3
	.long	0x3a
	.byte	0
	.uleb128 0x8
	.long	.LASF130
	.byte	0x7
	.byte	0x9f
	.byte	0xc
	.long	0x66
	.long	0x6ae
	.uleb128 0x3
	.long	0x296
	.uleb128 0x3
	.long	0x296
	.uleb128 0x3
	.long	0x3a
	.byte	0
	.uleb128 0x9
	.long	.LASF131
	.byte	0x7
	.value	0x16e
	.byte	0xe
	.long	0x98
	.long	0x6cf
	.uleb128 0x3
	.long	0x9d
	.uleb128 0x3
	.long	0x29b
	.uleb128 0x3
	.long	0x2c4
	.byte	0
	.uleb128 0x8
	.long	.LASF132
	.byte	0x7
	.byte	0x3d
	.byte	0xe
	.long	0x48
	.long	0x6ef
	.uleb128 0x3
	.long	0x48
	.uleb128 0x3
	.long	0x66
	.uleb128 0x3
	.long	0x3a
	.byte	0
	.uleb128 0x8
	.long	.LASF133
	.byte	0x7
	.byte	0x90
	.byte	0xe
	.long	0x98
	.long	0x70f
	.uleb128 0x3
	.long	0x98
	.uleb128 0x3
	.long	0x296
	.uleb128 0x3
	.long	0x3a
	.byte	0
	.uleb128 0x9
	.long	.LASF134
	.byte	0x9
	.value	0x16b
	.byte	0xc
	.long	0x66
	.long	0x727
	.uleb128 0x3
	.long	0x296
	.uleb128 0x14
	.byte	0
	.uleb128 0x22
	.long	.LASF167
	.byte	0xb
	.byte	0x22
	.byte	0x10
	.long	0x8c
	.uleb128 0x9
	.long	.LASF135
	.byte	0x7
	.value	0x197
	.byte	0xf
	.long	0x2e
	.long	0x74a
	.uleb128 0x3
	.long	0x296
	.byte	0
	.uleb128 0x8
	.long	.LASF136
	.byte	0x7
	.byte	0xf6
	.byte	0xe
	.long	0x98
	.long	0x765
	.uleb128 0x3
	.long	0x296
	.uleb128 0x3
	.long	0x66
	.byte	0
	.uleb128 0x8
	.long	.LASF137
	.byte	0x7
	.byte	0xbb
	.byte	0xe
	.long	0x98
	.long	0x77b
	.uleb128 0x3
	.long	0x296
	.byte	0
	.uleb128 0x9
	.long	.LASF138
	.byte	0x7
	.value	0x15e
	.byte	0xe
	.long	0x98
	.long	0x797
	.uleb128 0x3
	.long	0x296
	.uleb128 0x3
	.long	0x296
	.byte	0
	.uleb128 0x23
	.long	.LASF141
	.byte	0x1
	.value	0x1a6
	.byte	0x5
	.long	0x66
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x7e0
	.uleb128 0x15
	.string	"a"
	.byte	0x16
	.long	0x98
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x15
	.string	"b"
	.byte	0x1f
	.long	0x98
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x16
	.long	.LASF139
	.value	0x1a6
	.byte	0x26
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x24
	.long	.LASF158
	.byte	0x1
	.value	0x18f
	.byte	0x6
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x80f
	.uleb128 0x16
	.long	.LASF140
	.value	0x18f
	.byte	0x23
	.long	0x80f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x6
	.long	0x518
	.uleb128 0x25
	.long	.LASF142
	.byte	0x1
	.byte	0x67
	.byte	0x5
	.long	0x66
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x9d1
	.uleb128 0x17
	.long	.LASF143
	.byte	0x67
	.byte	0x2a
	.long	0x98
	.uleb128 0x3
	.byte	0x91
	.sleb128 -264
	.uleb128 0x17
	.long	.LASF140
	.byte	0x67
	.byte	0x41
	.long	0x80f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -272
	.uleb128 0x4
	.long	.LASF144
	.byte	0x74
	.byte	0xa
	.long	0x9d1
	.uleb128 0x4
	.byte	0x91
	.sleb128 -192
	.byte	0x6
	.uleb128 0x4
	.long	.LASF145
	.byte	0x7c
	.byte	0xb
	.long	0x9e5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x4
	.long	.LASF146
	.byte	0x7d
	.byte	0x9
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -252
	.uleb128 0x4
	.long	.LASF147
	.byte	0x7e
	.byte	0xb
	.long	0x98
	.uleb128 0x3
	.byte	0x91
	.sleb128 -232
	.uleb128 0x4
	.long	.LASF148
	.byte	0x7f
	.byte	0xb
	.long	0x98
	.uleb128 0x3
	.byte	0x91
	.sleb128 -216
	.uleb128 0x4
	.long	.LASF98
	.byte	0x93
	.byte	0xb
	.long	0x98
	.uleb128 0x3
	.byte	0x91
	.sleb128 -184
	.uleb128 0x18
	.string	"uri"
	.byte	0x93
	.byte	0x1b
	.long	0x98
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x4
	.long	.LASF149
	.byte	0x93
	.byte	0x28
	.long	0x98
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x4
	.long	.LASF150
	.byte	0x94
	.byte	0xb
	.long	0x98
	.uleb128 0x3
	.byte	0x91
	.sleb128 -224
	.uleb128 0x4
	.long	.LASF151
	.byte	0xa1
	.byte	0x9
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -248
	.uleb128 0x4
	.long	.LASF152
	.byte	0xa2
	.byte	0x9
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -244
	.uleb128 0x4
	.long	.LASF153
	.byte	0xcc
	.byte	0xc
	.long	0x2e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x26
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.long	0x92c
	.uleb128 0x18
	.string	"i"
	.byte	0xa3
	.byte	0xe
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.byte	0
	.uleb128 0x12
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x19
	.string	"i"
	.value	0x11e
	.byte	0xe
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -236
	.uleb128 0x12
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0xe
	.long	.LASF148
	.value	0x120
	.byte	0xf
	.long	0x98
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x19
	.string	"key"
	.value	0x121
	.byte	0xf
	.long	0x98
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0xe
	.long	.LASF154
	.value	0x122
	.byte	0xf
	.long	0x98
	.uleb128 0x3
	.byte	0x91
	.sleb128 -208
	.uleb128 0x12
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0xe
	.long	.LASF155
	.value	0x166
	.byte	0x18
	.long	0x2e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0xe
	.long	.LASF156
	.value	0x167
	.byte	0x18
	.long	0x2e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0xe
	.long	.LASF157
	.value	0x169
	.byte	0x17
	.long	0x98
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0xa2
	.long	0x9e5
	.uleb128 0x27
	.long	0x3a
	.uleb128 0x4
	.byte	0x91
	.sleb128 -200
	.byte	0x6
	.byte	0
	.uleb128 0xa
	.long	0x98
	.long	0x9f5
	.uleb128 0xb
	.long	0x3a
	.byte	0x7
	.byte	0
	.uleb128 0x28
	.long	.LASF159
	.byte	0x1
	.byte	0x3d
	.byte	0x7
	.long	0x98
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x29
	.string	"url"
	.byte	0x1
	.byte	0x3d
	.byte	0x24
	.long	0x296
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x4
	.long	.LASF160
	.byte	0x3f
	.byte	0x11
	.long	0x296
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x4
	.long	.LASF161
	.byte	0x45
	.byte	0x11
	.long	0x296
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x4
	.long	.LASF162
	.byte	0x48
	.byte	0x11
	.long	0x296
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
	.uleb128 0x8
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x21
	.sleb128 14
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
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
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 422
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x23
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
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x26
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
	.uleb128 0x27
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x28
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
	.uleb128 0x29
	.uleb128 0x5
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
	.uleb128 0x2
	.uleb128 0x18
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
.LASF134:
	.string	"printf"
.LASF10:
	.string	"__off_t"
.LASF72:
	.string	"contentType_s"
.LASF82:
	.string	"contentType_t"
.LASF15:
	.string	"_IO_read_ptr"
.LASF127:
	.string	"malloc"
.LASF27:
	.string	"_chain"
.LASF162:
	.string	"path_start"
.LASF57:
	.string	"statusCode_s"
.LASF64:
	.string	"statusCode_t"
.LASF9:
	.string	"size_t"
.LASF60:
	.string	"NOT_FOUND"
.LASF83:
	.string	"PARSE_OK"
.LASF33:
	.string	"_shortbuf"
.LASF138:
	.string	"strstr"
.LASF163:
	.string	"GNU C17 14.2.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF120:
	.string	"accept_parse"
.LASF100:
	.string	"status_code"
.LASF133:
	.string	"strncpy"
.LASF167:
	.string	"gettid"
.LASF21:
	.string	"_IO_buf_base"
.LASF54:
	.string	"supported_http_protocols"
.LASF159:
	.string	"extract_uri_path"
.LASF153:
	.string	"uri_len"
.LASF107:
	.string	"max_age"
.LASF117:
	.string	"accpet_language_parse"
.LASF155:
	.string	"current_len"
.LASF46:
	.string	"_IO_wide_data"
.LASF166:
	.string	"free"
.LASF36:
	.string	"_codecvt"
.LASF47:
	.string	"long long int"
.LASF6:
	.string	"signed char"
.LASF150:
	.string	"token_ctx"
.LASF48:
	.string	"long long unsigned int"
.LASF93:
	.string	"uri_str"
.LASF28:
	.string	"_fileno"
.LASF16:
	.string	"_IO_read_end"
.LASF99:
	.string	"method_str"
.LASF8:
	.string	"long int"
.LASF87:
	.string	"PARSE_ERROR_MALFORMED"
.LASF51:
	.string	"HTTP1_0"
.LASF52:
	.string	"HTTP1_1"
.LASF14:
	.string	"_flags"
.LASF22:
	.string	"_IO_buf_end"
.LASF45:
	.string	"_IO_codecvt"
.LASF30:
	.string	"_old_offset"
.LASF35:
	.string	"_offset"
.LASF95:
	.string	"hostname_port_str"
.LASF151:
	.string	"valid_method"
.LASF68:
	.string	"PATCH"
.LASF148:
	.string	"line"
.LASF78:
	.string	"IMAGE_GIF"
.LASF154:
	.string	"value"
.LASF44:
	.string	"_IO_marker"
.LASF94:
	.string	"hostname_str"
.LASF3:
	.string	"unsigned int"
.LASF39:
	.string	"_freeres_buf"
.LASF77:
	.string	"IMAGE_PNG"
.LASF126:
	.string	"fprintf"
.LASF2:
	.string	"long unsigned int"
.LASF19:
	.string	"_IO_write_ptr"
.LASF73:
	.string	"TEXT_HTML"
.LASF136:
	.string	"strchr"
.LASF98:
	.string	"method"
.LASF152:
	.string	"valid_header"
.LASF157:
	.string	"data"
.LASF142:
	.string	"parse_request_line_thread_safe"
.LASF139:
	.string	"size"
.LASF5:
	.string	"short unsigned int"
.LASF84:
	.string	"PARSE_ERROR_INVALID_METHOD"
.LASF145:
	.string	"lines"
.LASF135:
	.string	"strlen"
.LASF23:
	.string	"_IO_save_base"
.LASF62:
	.string	"VERSION_NOT_SUPPORTED"
.LASF80:
	.string	"IMAGE_X_ICON"
.LASF102:
	.string	"connection_keep_alive"
.LASF125:
	.string	"strcpy"
.LASF34:
	.string	"_lock"
.LASF29:
	.string	"_flags2"
.LASF41:
	.string	"_mode"
.LASF123:
	.string	"strcat"
.LASF66:
	.string	"POST"
.LASF160:
	.string	"protocol_end"
.LASF105:
	.string	"current_state"
.LASF71:
	.string	"method_t"
.LASF90:
	.string	"req_header_s"
.LASF149:
	.string	"version"
.LASF122:
	.string	"cache_control_parse"
.LASF147:
	.string	"line_ctx"
.LASF67:
	.string	"DELETE"
.LASF121:
	.string	"connection_parse"
.LASF146:
	.string	"line_count"
.LASF86:
	.string	"PARSE_ERROR_INVALID_VERSION"
.LASF53:
	.string	"ERROR_VERSION"
.LASF20:
	.string	"_IO_write_end"
.LASF40:
	.string	"_prevchain"
.LASF115:
	.string	"user_agent_parse"
.LASF101:
	.string	"status_code_str"
.LASF97:
	.string	"content_type_str"
.LASF164:
	.string	"_IO_lock_t"
.LASF89:
	.string	"_IO_FILE"
.LASF144:
	.string	"request_copy"
.LASF129:
	.string	"strncasecmp"
.LASF81:
	.string	"total_content_types"
.LASF106:
	.string	"open_file_fd"
.LASF74:
	.string	"TEXT_CSS"
.LASF76:
	.string	"APPLICATION_JAVASCRIPT"
.LASF26:
	.string	"_markers"
.LASF85:
	.string	"PARSE_ERROR_INVALID_URI"
.LASF50:
	.string	"__int128 unsigned"
.LASF158:
	.string	"cleanup_header"
.LASF65:
	.string	"method_s"
.LASF4:
	.string	"unsigned char"
.LASF70:
	.string	"total_req_methods"
.LASF119:
	.string	"referer_parse"
.LASF130:
	.string	"strncmp"
.LASF103:
	.string	"connection_close"
.LASF12:
	.string	"__pid_t"
.LASF118:
	.string	"accept_encoding_parse"
.LASF88:
	.string	"PARSE_ERROR_BUFFER_OVERFLOW"
.LASF114:
	.string	"host_parse"
.LASF56:
	.string	"httpType_s"
.LASF55:
	.string	"httpType_t"
.LASF79:
	.string	"IMAGE_JPG"
.LASF32:
	.string	"_vtable_offset"
.LASF43:
	.string	"FILE"
.LASF75:
	.string	"TEXT_PLAIN"
.LASF141:
	.string	"str_equals"
.LASF113:
	.string	"method_parse"
.LASF116:
	.string	"accpet_parse"
.LASF63:
	.string	"total_status_codes"
.LASF69:
	.string	"HEAD"
.LASF13:
	.string	"char"
.LASF128:
	.string	"strcasecmp"
.LASF92:
	.string	"http_version_str"
.LASF108:
	.string	"extra_header"
.LASF61:
	.string	"METHOD_NOT_ALLOWED"
.LASF7:
	.string	"short int"
.LASF11:
	.string	"__off64_t"
.LASF31:
	.string	"_cur_column"
.LASF17:
	.string	"_IO_read_base"
.LASF25:
	.string	"_IO_save_end"
.LASF49:
	.string	"__int128"
.LASF143:
	.string	"request"
.LASF91:
	.string	"http_version"
.LASF161:
	.string	"host_start"
.LASF42:
	.string	"_unused2"
.LASF165:
	.string	"stderr"
.LASF109:
	.string	"HttpHeader_t"
.LASF132:
	.string	"memset"
.LASF156:
	.string	"line_len"
.LASF131:
	.string	"strtok_r"
.LASF137:
	.string	"strdup"
.LASF24:
	.string	"_IO_backup_base"
.LASF59:
	.string	"FORBIDDEN"
.LASF111:
	.string	"http_type"
.LASF110:
	.string	"reqMethod"
.LASF96:
	.string	"content_type"
.LASF38:
	.string	"_freeres_list"
.LASF124:
	.string	"realloc"
.LASF37:
	.string	"_wide_data"
.LASF112:
	.string	"states_s"
.LASF18:
	.string	"_IO_write_base"
.LASF58:
	.string	"BAD_REQ"
.LASF140:
	.string	"header"
.LASF104:
	.string	"parser_error"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/parth/Work/All_data/university/Network System/Assignments/PA3"
.LASF0:
	.string	"src/parser.c"
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
