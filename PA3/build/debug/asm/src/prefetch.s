	.file	"prefetch.c"
	.text
.Ltext0:
	.file 0 "/home/parth/Work/All_data/university/Network System/Assignments/PA3" "src/prefetch.c"
	.section	.rodata
.LC0:
	.string	"http://"
.LC1:
	.string	"://"
.LC2:
	.string	"/"
.LC3:
	.string	"80"
	.align 8
.LC4:
	.string	"\033[35m[+] (%d) Prefetching absolute URL:\n[+] Host: %s\n[+] Path: %s\n\033[0m"
.LC5:
	.string	"/%s"
	.align 8
.LC6:
	.string	"\033[35m[+] (%d) Prefetching relative URL:\n[+] Host: %s\n[+] Path: %s\n\033[0m"
	.text
	.globl	prefetch_thread_func
	.type	prefetch_thread_func, @function
prefetch_thread_func:
.LFB6:
	.file 1 "src/prefetch.c"
	.loc 1 6 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$448, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -456(%rbp)
	.loc 1 6 1
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 1 7 19
	movq	-456(%rbp), %rax
	movq	%rax, -416(%rbp)
	.loc 1 9 7
	cmpq	$0, -416(%rbp)
	jne	.L2
	.loc 1 9 31 discriminator 1
	movl	$0, %eax
	.loc 1 9 31 is_stmt 0
	jmp	.L3
.L2:
.LBB2:
	.loc 1 12 14 is_stmt 1
	movl	$0, -436(%rbp)
	.loc 1 12 5
	jmp	.L4
.L22:
.LBB3:
	.loc 1 19 27
	movq	-416(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 19 34
	movl	-436(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 19 12
	testq	%rax, %rax
	je	.L30
	.loc 1 19 61 discriminator 2
	movq	-416(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 19 68 discriminator 2
	movl	-436(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 19 73 discriminator 2
	movzbl	(%rax), %eax
	.loc 1 19 38 discriminator 2
	testb	%al, %al
	je	.L30
	.loc 1 25 9
	leaq	-368(%rbp), %rax
	movl	$120, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 26 9
	leaq	-240(%rbp), %rax
	movl	$208, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 28 40
	movq	-416(%rbp), %rax
	movq	32(%rax), %rax
	.loc 1 28 44
	movl	156(%rax), %eax
	.loc 1 28 25
	movl	%eax, -84(%rbp)
	.loc 1 29 32
	movl	$-1, -236(%rbp)
	.loc 1 32 34
	movq	-416(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 32 41
	movl	-436(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	.loc 1 32 13
	movq	(%rax), %rax
	movl	$7, %edx
	leaq	.LC0(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 32 12 discriminator 1
	testl	%eax, %eax
	jne	.L8
.LBB4:
	.loc 1 35 43
	movq	-416(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 35 50
	movl	-436(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	.loc 1 35 19
	movq	(%rax), %rax
	movq	%rax, -408(%rbp)
	.loc 1 36 34
	movq	-408(%rbp), %rax
	leaq	.LC1(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	movq	%rax, -400(%rbp)
	.loc 1 38 16
	cmpq	$0, -400(%rbp)
	je	.L31
	.loc 1 43 19
	movq	-400(%rbp), %rax
	addq	$3, %rax
	movq	%rax, -392(%rbp)
	.loc 1 44 32
	movq	-392(%rbp), %rax
	movl	$47, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	movq	%rax, -384(%rbp)
	.loc 1 45 32
	movq	-392(%rbp), %rax
	movl	$58, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	movq	%rax, -376(%rbp)
	.loc 1 47 16
	cmpq	$0, -384(%rbp)
	jne	.L10
	.loc 1 50 39
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	.loc 1 50 37 discriminator 1
	movq	%rax, -352(%rbp)
	.loc 1 51 44
	movq	-392(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	.loc 1 51 42 discriminator 1
	movq	%rax, -344(%rbp)
	jmp	.L11
.L10:
	.loc 1 56 29
	movq	-384(%rbp), %rax
	movb	$0, (%rax)
	.loc 1 57 44
	movq	-392(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	.loc 1 57 42 discriminator 1
	movq	%rax, -344(%rbp)
	.loc 1 58 39
	movq	-384(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	.loc 1 58 37 discriminator 1
	movq	%rax, -352(%rbp)
	.loc 1 59 29
	movq	-384(%rbp), %rax
	movb	$47, (%rax)
.L11:
	.loc 1 61 34
	movq	-352(%rbp), %rax
	.loc 1 61 44
	movzbl	(%rax), %eax
	.loc 1 61 15
	testb	%al, %al
	je	.L12
	.loc 1 61 64 discriminator 1
	movq	-352(%rbp), %rax
	.loc 1 61 52 discriminator 1
	movzbl	(%rax), %eax
	.loc 1 61 49 discriminator 1
	testb	%al, %al
	jne	.L13
.L12:
	.loc 1 62 39
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	.loc 1 62 37 discriminator 1
	movq	%rax, -352(%rbp)
.L13:
	.loc 1 64 45
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	.loc 1 64 43 discriminator 1
	movq	%rax, -336(%rbp)
	.loc 1 66 13
	movq	-352(%rbp), %r12
	movq	-344(%rbp), %rbx
	call	gettid@PLT
	.loc 1 66 13 is_stmt 0 discriminator 1
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBE4:
	jmp	.L14
.L8:
	.loc 1 74 60 is_stmt 1
	movq	-416(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 74 40
	movq	%rax, %rdi
	call	strdup@PLT
	.loc 1 74 38 discriminator 1
	movq	%rax, -344(%rbp)
	.loc 1 77 30
	movq	-416(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 77 37
	movl	-436(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 77 40
	movzbl	(%rax), %eax
	.loc 1 77 16
	cmpb	$47, %al
	jne	.L15
	.loc 1 80 59
	movq	-416(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 80 66
	movl	-436(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	.loc 1 80 39
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	.loc 1 80 37 discriminator 1
	movq	%rax, -352(%rbp)
	jmp	.L16
.L15:
.LBB5:
	.loc 1 86 58
	movq	-416(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 86 65
	movl	-436(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	.loc 1 86 17
	movq	(%rax), %rdx
	leaq	-424(%rbp), %rax
	leaq	.LC5(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	.loc 1 87 37
	movq	-424(%rbp), %rax
	movq	%rax, -352(%rbp)
.L16:
.LBE5:
	.loc 1 89 58
	movq	-416(%rbp), %rax
	movq	24(%rax), %rax
	.loc 1 89 105
	testq	%rax, %rax
	je	.L17
	.loc 1 89 92 discriminator 1
	movq	-416(%rbp), %rax
	movq	24(%rax), %rax
	.loc 1 89 72 discriminator 1
	movq	%rax, %rdi
	call	strdup@PLT
	jmp	.L18
.L17:
	.loc 1 89 105 discriminator 2
	movl	$0, %eax
.L18:
	.loc 1 89 43 discriminator 4
	movq	%rax, -336(%rbp)
	.loc 1 91 13
	movq	-352(%rbp), %r12
	movq	-344(%rbp), %rbx
	call	gettid@PLT
	.loc 1 91 13 is_stmt 0 discriminator 1
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L14:
	.loc 1 96 25 is_stmt 1
	movq	-416(%rbp), %rax
	movq	40(%rax), %rax
	.loc 1 96 11
	testq	%rax, %rax
	jne	.L19
	.loc 1 96 60 discriminator 1
	movl	$0, %eax
	.loc 1 96 60 is_stmt 0
	jmp	.L3
.L19:
	.loc 1 98 60 is_stmt 1
	movq	-416(%rbp), %rax
	movq	40(%rax), %rax
	.loc 1 98 40
	movq	%rax, %rdi
	call	strdup@PLT
	.loc 1 98 38 discriminator 1
	movq	%rax, -360(%rbp)
	.loc 1 100 53
	movq	-352(%rbp), %rax
	.loc 1 100 23
	movl	$0, %esi
	movq	%rax, %rdi
	call	is_dynamic_content@PLT
	movl	%eax, -428(%rbp)
	.loc 1 104 9
	movl	-428(%rbp), %edx
	leaq	-240(%rbp), %rsi
	leaq	-368(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdi
	call	check_and_send_from_cache@PLT
	.loc 1 107 9
	leaq	-368(%rbp), %rax
	movq	%rax, %rdi
	call	cleanup_header@PLT
	jmp	.L21
.L30:
	.loc 1 21 13
	nop
	jmp	.L21
.L31:
.LBB6:
	.loc 1 40 17
	nop
.L21:
.LBE6:
.LBE3:
	.loc 1 12 50 discriminator 2
	addl	$1, -436(%rbp)
.L4:
	.loc 1 12 38 discriminator 1
	movq	-416(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 12 23 discriminator 1
	cmpl	%eax, -436(%rbp)
	jl	.L22
.LBE2:
.LBB7:
	.loc 1 111 14
	movl	$0, -432(%rbp)
	.loc 1 111 5
	jmp	.L23
.L25:
	.loc 1 113 26
	movq	-416(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 113 33
	movl	-432(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 113 12
	testq	%rax, %rax
	je	.L24
	.loc 1 114 31
	movq	-416(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 114 38
	movl	-432(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	.loc 1 114 13
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L24:
	.loc 1 111 50 discriminator 2
	addl	$1, -432(%rbp)
.L23:
	.loc 1 111 38 discriminator 1
	movq	-416(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 111 23 discriminator 1
	cmpl	%eax, -432(%rbp)
	jl	.L25
.LBE7:
	.loc 1 116 22
	movq	-416(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 116 8
	testq	%rax, %rax
	je	.L26
	.loc 1 117 27
	movq	-416(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 117 9
	movq	%rax, %rdi
	call	free@PLT
.L26:
	.loc 1 118 22
	movq	-416(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 118 8
	testq	%rax, %rax
	je	.L27
	.loc 1 119 27
	movq	-416(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 119 9
	movq	%rax, %rdi
	call	free@PLT
.L27:
	.loc 1 120 22
	movq	-416(%rbp), %rax
	movq	32(%rax), %rax
	.loc 1 120 8
	testq	%rax, %rax
	je	.L28
	.loc 1 121 27
	movq	-416(%rbp), %rax
	movq	32(%rax), %rax
	.loc 1 121 9
	movq	%rax, %rdi
	call	free@PLT
.L28:
	.loc 1 122 5
	movq	-416(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 124 12
	movl	$0, %eax
.L3:
	.loc 1 125 1
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L29
	call	__stack_chk_fail@PLT
.L29:
	addq	$448, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	prefetch_thread_func, .-prefetch_thread_func
	.section	.rodata
.LC7:
	.string	"href=[\"']([^\"']+)[\"']"
.LC8:
	.string	"#"
.LC9:
	.string	"https://"
.LC10:
	.string	"mailto"
	.align 8
.LC11:
	.string	"\033[31m[-] (%d) Memory allocation failed for links array\n\033[0m"
	.text
	.globl	extract_links
	.type	extract_links, @function
extract_links:
.LFB7:
	.loc 1 129 1
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
	.loc 1 129 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 130 12
	movq	$0, -128(%rbp)
	.loc 1 131 17
	movq	-160(%rbp), %rax
	movl	$0, (%rax)
	.loc 1 134 17
	leaq	.LC7(%rip), %rax
	movq	%rax, -112(%rbp)
	.loc 1 138 9
	movq	-112(%rbp), %rcx
	leaq	-96(%rbp), %rax
	movl	$1, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	regcomp@PLT
	.loc 1 138 8 discriminator 1
	testl	%eax, %eax
	je	.L33
	.loc 1 140 16
	movl	$0, %eax
	jmp	.L40
.L33:
	.loc 1 143 17
	movq	-152(%rbp), %rax
	movq	%rax, -120(%rbp)
	.loc 1 144 11
	jmp	.L35
.L39:
.LBB8:
	.loc 1 147 13
	movl	-24(%rbp), %eax
	movl	%eax, -140(%rbp)
	.loc 1 148 13
	movl	-20(%rbp), %eax
	movl	%eax, -136(%rbp)
	.loc 1 149 13
	movl	-136(%rbp), %eax
	subl	-140(%rbp), %eax
	movl	%eax, -132(%rbp)
	.loc 1 151 36
	movl	-132(%rbp), %eax
	addl	$1, %eax
	.loc 1 151 22
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -104(%rbp)
	.loc 1 152 9
	movl	-132(%rbp), %eax
	movslq	%eax, %rdx
	movl	-140(%rbp), %eax
	movslq	%eax, %rcx
	movq	-120(%rbp), %rax
	addq	%rax, %rcx
	movq	-104(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	.loc 1 153 13
	movl	-132(%rbp), %eax
	movslq	%eax, %rdx
	movq	-104(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 153 22
	movb	$0, (%rax)
	.loc 1 158 13
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	.loc 1 158 13 is_stmt 0 discriminator 1
	movq	-104(%rbp), %rax
	leaq	.LC8(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 158 12 is_stmt 1 discriminator 2
	testl	%eax, %eax
	je	.L36
	.loc 1 158 54 discriminator 1
	movq	-104(%rbp), %rax
	leaq	.LC9(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	.loc 1 158 51 discriminator 1
	testq	%rax, %rax
	jne	.L36
	.loc 1 158 90 discriminator 2
	movq	-104(%rbp), %rax
	leaq	.LC10(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	.loc 1 158 87 discriminator 1
	testq	%rax, %rax
	jne	.L36
	.loc 1 161 37
	movq	-160(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 161 49
	addl	$1, %eax
	cltq
	.loc 1 161 21
	leaq	0(,%rax,8), %rdx
	movq	-128(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, -128(%rbp)
	.loc 1 162 16
	cmpq	$0, -128(%rbp)
	jne	.L37
	.loc 1 164 17
	call	gettid@PLT
	movl	%eax, %edx
	.loc 1 164 17 is_stmt 0 discriminator 1
	movq	stderr(%rip), %rax
	leaq	.LC11(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 165 17 is_stmt 1
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 166 24
	movl	$0, %eax
	jmp	.L40
.L37:
	.loc 1 168 19
	movq	-160(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 168 18
	leaq	0(,%rax,8), %rdx
	movq	-128(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 168 32
	movq	-104(%rbp), %rax
	movq	%rax, (%rdx)
	.loc 1 169 14
	movq	-160(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 169 26
	leal	1(%rax), %edx
	movq	-160(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L38
.L36:
	.loc 1 174 13
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L38:
	.loc 1 178 29
	movl	-28(%rbp), %eax
	cltq
	.loc 1 178 16
	addq	%rax, -120(%rbp)
.L35:
.LBE8:
	.loc 1 144 12
	leaq	-32(%rbp), %rdx
	movq	-120(%rbp), %rsi
	leaq	-96(%rbp), %rax
	movl	$0, %r8d
	movq	%rdx, %rcx
	movl	$2, %edx
	movq	%rax, %rdi
	call	regexec@PLT
	.loc 1 144 51 discriminator 1
	testl	%eax, %eax
	je	.L39
	.loc 1 181 5
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	regfree@PLT
	.loc 1 182 12
	movq	-128(%rbp), %rax
.L40:
	.loc 1 183 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L41
	call	__stack_chk_fail@PLT
.L41:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	extract_links, .-extract_links
	.globl	free_links
	.type	free_links, @function
free_links:
.LFB8:
	.loc 1 186 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
.LBB9:
	.loc 1 187 14
	movl	$0, -4(%rbp)
	.loc 1 187 5
	jmp	.L43
.L44:
	.loc 1 189 19
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 189 9
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 190 14
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 190 18
	movq	$0, (%rax)
	.loc 1 187 39 discriminator 3
	addl	$1, -4(%rbp)
.L43:
	.loc 1 187 23 discriminator 1
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L44
.LBE9:
	.loc 1 192 5
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 193 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	free_links, .-free_links
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/14/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.file 9 "/usr/include/unistd.h"
	.file 10 "/usr/include/x86_64-linux-gnu/bits/sockaddr.h"
	.file 11 "/usr/include/x86_64-linux-gnu/bits/socket.h"
	.file 12 "/usr/include/netdb.h"
	.file 13 "./common.h"
	.file 14 "/usr/include/regex.h"
	.file 15 "includes/prefetch.h"
	.file 16 "/usr/include/stdio.h"
	.file 17 "/usr/include/stdlib.h"
	.file 18 "/usr/include/string.h"
	.file 19 "includes/parser.h"
	.file 20 "includes/handle_req.h"
	.file 21 "/usr/include/x86_64-linux-gnu/bits/unistd_ext.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xe10
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x1e
	.long	.LASF221
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x5
	.long	.LASF9
	.byte	0x2
	.byte	0xd6
	.byte	0x17
	.long	0x3a
	.uleb128 0x8
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x8
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x1f
	.byte	0x8
	.uleb128 0x8
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x8
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x8
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x8
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x20
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x8
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x5
	.long	.LASF10
	.byte	0x3
	.byte	0x98
	.byte	0x19
	.long	0x6d
	.uleb128 0x5
	.long	.LASF11
	.byte	0x3
	.byte	0x99
	.byte	0x1b
	.long	0x6d
	.uleb128 0x5
	.long	.LASF12
	.byte	0x3
	.byte	0x9a
	.byte	0x19
	.long	0x66
	.uleb128 0x4
	.long	0x9d
	.uleb128 0x8
	.byte	0x1
	.byte	0x6
	.long	.LASF13
	.uleb128 0x19
	.long	0x9d
	.uleb128 0x5
	.long	.LASF14
	.byte	0x3
	.byte	0xd2
	.byte	0x17
	.long	0x41
	.uleb128 0xc
	.long	.LASF50
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x23c
	.uleb128 0x1
	.long	.LASF15
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x66
	.byte	0
	.uleb128 0x1
	.long	.LASF16
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0x98
	.byte	0x8
	.uleb128 0x1
	.long	.LASF17
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0x98
	.byte	0x10
	.uleb128 0x1
	.long	.LASF18
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0x98
	.byte	0x18
	.uleb128 0x1
	.long	.LASF19
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0x98
	.byte	0x20
	.uleb128 0x1
	.long	.LASF20
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0x98
	.byte	0x28
	.uleb128 0x1
	.long	.LASF21
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0x98
	.byte	0x30
	.uleb128 0x1
	.long	.LASF22
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0x98
	.byte	0x38
	.uleb128 0x1
	.long	.LASF23
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0x98
	.byte	0x40
	.uleb128 0x1
	.long	.LASF24
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0x98
	.byte	0x48
	.uleb128 0x1
	.long	.LASF25
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0x98
	.byte	0x50
	.uleb128 0x1
	.long	.LASF26
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0x98
	.byte	0x58
	.uleb128 0x1
	.long	.LASF27
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x255
	.byte	0x60
	.uleb128 0x1
	.long	.LASF28
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x25a
	.byte	0x68
	.uleb128 0x1
	.long	.LASF29
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x66
	.byte	0x70
	.uleb128 0x1
	.long	.LASF30
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x66
	.byte	0x74
	.uleb128 0x1
	.long	.LASF31
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0x74
	.byte	0x78
	.uleb128 0x1
	.long	.LASF32
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x51
	.byte	0x80
	.uleb128 0x1
	.long	.LASF33
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x58
	.byte	0x82
	.uleb128 0x1
	.long	.LASF34
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x25f
	.byte	0x83
	.uleb128 0x1
	.long	.LASF35
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x26f
	.byte	0x88
	.uleb128 0x1
	.long	.LASF36
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0x80
	.byte	0x90
	.uleb128 0x1
	.long	.LASF37
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x279
	.byte	0x98
	.uleb128 0x1
	.long	.LASF38
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x283
	.byte	0xa0
	.uleb128 0x1
	.long	.LASF39
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x25a
	.byte	0xa8
	.uleb128 0x1
	.long	.LASF40
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0x48
	.byte	0xb0
	.uleb128 0x1
	.long	.LASF41
	.byte	0x4
	.byte	0x5f
	.byte	0x15
	.long	0x288
	.byte	0xb8
	.uleb128 0x1
	.long	.LASF42
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x66
	.byte	0xc0
	.uleb128 0x1
	.long	.LASF43
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x28d
	.byte	0xc4
	.byte	0
	.uleb128 0x5
	.long	.LASF44
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0xb5
	.uleb128 0x21
	.long	.LASF222
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0x12
	.long	.LASF45
	.uleb128 0x4
	.long	0x250
	.uleb128 0x4
	.long	0xb5
	.uleb128 0xd
	.long	0x9d
	.long	0x26f
	.uleb128 0xe
	.long	0x3a
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	0x248
	.uleb128 0x12
	.long	.LASF46
	.uleb128 0x4
	.long	0x274
	.uleb128 0x12
	.long	.LASF47
	.uleb128 0x4
	.long	0x27e
	.uleb128 0x4
	.long	0x25a
	.uleb128 0xd
	.long	0x9d
	.long	0x29d
	.uleb128 0xe
	.long	0x3a
	.byte	0x13
	.byte	0
	.uleb128 0x4
	.long	0xa4
	.uleb128 0xf
	.long	0x29d
	.uleb128 0x4
	.long	0x23c
	.uleb128 0x22
	.long	.LASF223
	.byte	0x10
	.byte	0x97
	.byte	0xe
	.long	0x2a7
	.uleb128 0x8
	.byte	0x8
	.byte	0x5
	.long	.LASF48
	.uleb128 0x8
	.byte	0x8
	.byte	0x7
	.long	.LASF49
	.uleb128 0xc
	.long	.LASF51
	.byte	0x10
	.byte	0x6
	.byte	0x33
	.byte	0x10
	.long	0x2ee
	.uleb128 0x1
	.long	.LASF52
	.byte	0x6
	.byte	0x35
	.byte	0x23
	.long	0x2ee
	.byte	0
	.uleb128 0x1
	.long	.LASF53
	.byte	0x6
	.byte	0x36
	.byte	0x23
	.long	0x2ee
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.long	0x2c6
	.uleb128 0x5
	.long	.LASF54
	.byte	0x6
	.byte	0x37
	.byte	0x3
	.long	0x2c6
	.uleb128 0xc
	.long	.LASF55
	.byte	0x28
	.byte	0x7
	.byte	0x16
	.byte	0x8
	.long	0x375
	.uleb128 0x1
	.long	.LASF56
	.byte	0x7
	.byte	0x18
	.byte	0x7
	.long	0x66
	.byte	0
	.uleb128 0x1
	.long	.LASF57
	.byte	0x7
	.byte	0x19
	.byte	0x10
	.long	0x41
	.byte	0x4
	.uleb128 0x1
	.long	.LASF58
	.byte	0x7
	.byte	0x1a
	.byte	0x7
	.long	0x66
	.byte	0x8
	.uleb128 0x1
	.long	.LASF59
	.byte	0x7
	.byte	0x1c
	.byte	0x10
	.long	0x41
	.byte	0xc
	.uleb128 0x1
	.long	.LASF60
	.byte	0x7
	.byte	0x20
	.byte	0x7
	.long	0x66
	.byte	0x10
	.uleb128 0x1
	.long	.LASF61
	.byte	0x7
	.byte	0x22
	.byte	0x9
	.long	0x5f
	.byte	0x14
	.uleb128 0x1
	.long	.LASF62
	.byte	0x7
	.byte	0x23
	.byte	0x9
	.long	0x5f
	.byte	0x16
	.uleb128 0x1
	.long	.LASF63
	.byte	0x7
	.byte	0x24
	.byte	0x14
	.long	0x2f3
	.byte	0x18
	.byte	0
	.uleb128 0x23
	.byte	0x28
	.byte	0x8
	.byte	0x43
	.byte	0x9
	.long	0x3a0
	.uleb128 0x16
	.long	.LASF64
	.byte	0x45
	.byte	0x1c
	.long	0x2ff
	.uleb128 0x16
	.long	.LASF65
	.byte	0x46
	.byte	0x8
	.long	0x3a0
	.uleb128 0x16
	.long	.LASF66
	.byte	0x47
	.byte	0xc
	.long	0x6d
	.byte	0
	.uleb128 0xd
	.long	0x9d
	.long	0x3b0
	.uleb128 0xe
	.long	0x3a
	.byte	0x27
	.byte	0
	.uleb128 0x5
	.long	.LASF67
	.byte	0x8
	.byte	0x48
	.byte	0x3
	.long	0x375
	.uleb128 0x13
	.long	.LASF68
	.byte	0x9
	.value	0x112
	.byte	0x15
	.long	0xa9
	.uleb128 0x4
	.long	0x98
	.uleb128 0xf
	.long	0x3c9
	.uleb128 0x5
	.long	.LASF69
	.byte	0xa
	.byte	0x1c
	.byte	0x1c
	.long	0x51
	.uleb128 0xc
	.long	.LASF70
	.byte	0x10
	.byte	0xb
	.byte	0xb8
	.byte	0x27
	.long	0x407
	.uleb128 0x1
	.long	.LASF71
	.byte	0xb
	.byte	0xba
	.byte	0x5
	.long	0x3d3
	.byte	0
	.uleb128 0x1
	.long	.LASF72
	.byte	0xb
	.byte	0xbb
	.byte	0xa
	.long	0x407
	.byte	0x2
	.byte	0
	.uleb128 0xd
	.long	0x9d
	.long	0x417
	.uleb128 0xe
	.long	0x3a
	.byte	0xd
	.byte	0
	.uleb128 0xc
	.long	.LASF73
	.byte	0x80
	.byte	0xb
	.byte	0xc5
	.byte	0x27
	.long	0x44c
	.uleb128 0x1
	.long	.LASF74
	.byte	0xb
	.byte	0xc7
	.byte	0x5
	.long	0x3d3
	.byte	0
	.uleb128 0x1
	.long	.LASF75
	.byte	0xb
	.byte	0xc8
	.byte	0xa
	.long	0x44c
	.byte	0x2
	.uleb128 0x1
	.long	.LASF76
	.byte	0xb
	.byte	0xc9
	.byte	0x14
	.long	0x3a
	.byte	0x78
	.byte	0
	.uleb128 0xd
	.long	0x9d
	.long	0x45c
	.uleb128 0xe
	.long	0x3a
	.byte	0x75
	.byte	0
	.uleb128 0x4
	.long	0x3df
	.uleb128 0x1a
	.long	.LASF77
	.byte	0x30
	.byte	0xc
	.value	0x235
	.long	0x4df
	.uleb128 0x7
	.long	.LASF78
	.byte	0xc
	.value	0x237
	.byte	0x7
	.long	0x66
	.byte	0
	.uleb128 0x7
	.long	.LASF79
	.byte	0xc
	.value	0x238
	.byte	0x7
	.long	0x66
	.byte	0x4
	.uleb128 0x7
	.long	.LASF80
	.byte	0xc
	.value	0x239
	.byte	0x7
	.long	0x66
	.byte	0x8
	.uleb128 0x7
	.long	.LASF81
	.byte	0xc
	.value	0x23a
	.byte	0x7
	.long	0x66
	.byte	0xc
	.uleb128 0x7
	.long	.LASF82
	.byte	0xc
	.value	0x23b
	.byte	0xd
	.long	0x3bc
	.byte	0x10
	.uleb128 0x7
	.long	.LASF83
	.byte	0xc
	.value	0x23c
	.byte	0x14
	.long	0x45c
	.byte	0x18
	.uleb128 0x7
	.long	.LASF84
	.byte	0xc
	.value	0x23d
	.byte	0x9
	.long	0x98
	.byte	0x20
	.uleb128 0x7
	.long	.LASF85
	.byte	0xc
	.value	0x23e
	.byte	0x14
	.long	0x4df
	.byte	0x28
	.byte	0
	.uleb128 0x4
	.long	0x461
	.uleb128 0x8
	.byte	0x10
	.byte	0x5
	.long	.LASF86
	.uleb128 0x8
	.byte	0x10
	.byte	0x7
	.long	.LASF87
	.uleb128 0x14
	.long	.LASF93
	.long	0x41
	.byte	0x66
	.long	0x519
	.uleb128 0x3
	.long	.LASF88
	.byte	0
	.uleb128 0x3
	.long	.LASF89
	.byte	0x1
	.uleb128 0x3
	.long	.LASF90
	.byte	0x2
	.uleb128 0x3
	.long	.LASF91
	.byte	0x3
	.byte	0
	.uleb128 0x5
	.long	.LASF92
	.byte	0xd
	.byte	0x6c
	.byte	0x3
	.long	0x4f2
	.uleb128 0x14
	.long	.LASF94
	.long	0x41
	.byte	0x72
	.long	0x55d
	.uleb128 0x17
	.string	"OK"
	.byte	0x1
	.uleb128 0x3
	.long	.LASF95
	.byte	0x2
	.uleb128 0x3
	.long	.LASF96
	.byte	0x4
	.uleb128 0x3
	.long	.LASF97
	.byte	0x8
	.uleb128 0x3
	.long	.LASF98
	.byte	0x10
	.uleb128 0x3
	.long	.LASF99
	.byte	0x20
	.uleb128 0x3
	.long	.LASF100
	.byte	0x21
	.byte	0
	.uleb128 0x5
	.long	.LASF101
	.byte	0xd
	.byte	0x7b
	.byte	0x3
	.long	0x525
	.uleb128 0x14
	.long	.LASF102
	.long	0x41
	.byte	0x82
	.long	0x5a2
	.uleb128 0x17
	.string	"GET"
	.byte	0
	.uleb128 0x3
	.long	.LASF103
	.byte	0x1
	.uleb128 0x17
	.string	"PUT"
	.byte	0x2
	.uleb128 0x3
	.long	.LASF104
	.byte	0x3
	.uleb128 0x3
	.long	.LASF105
	.byte	0x4
	.uleb128 0x3
	.long	.LASF106
	.byte	0x5
	.uleb128 0x3
	.long	.LASF107
	.byte	0x6
	.byte	0
	.uleb128 0x5
	.long	.LASF108
	.byte	0xd
	.byte	0x8b
	.byte	0x3
	.long	0x569
	.uleb128 0x14
	.long	.LASF109
	.long	0x41
	.byte	0x91
	.long	0x5f3
	.uleb128 0x3
	.long	.LASF110
	.byte	0
	.uleb128 0x3
	.long	.LASF111
	.byte	0x1
	.uleb128 0x3
	.long	.LASF112
	.byte	0x2
	.uleb128 0x3
	.long	.LASF113
	.byte	0x3
	.uleb128 0x3
	.long	.LASF114
	.byte	0x4
	.uleb128 0x3
	.long	.LASF115
	.byte	0x5
	.uleb128 0x3
	.long	.LASF116
	.byte	0x6
	.uleb128 0x3
	.long	.LASF117
	.byte	0x7
	.uleb128 0x3
	.long	.LASF118
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.long	.LASF119
	.byte	0xd
	.byte	0x9c
	.byte	0x3
	.long	0x5ae
	.uleb128 0xc
	.long	.LASF120
	.byte	0x78
	.byte	0xd
	.byte	0xba
	.byte	0x10
	.long	0x6f7
	.uleb128 0x1
	.long	.LASF121
	.byte	0xd
	.byte	0xbc
	.byte	0x10
	.long	0x519
	.byte	0
	.uleb128 0x1
	.long	.LASF122
	.byte	0xd
	.byte	0xbd
	.byte	0xb
	.long	0x98
	.byte	0x8
	.uleb128 0x1
	.long	.LASF123
	.byte	0xd
	.byte	0xbf
	.byte	0xb
	.long	0x98
	.byte	0x10
	.uleb128 0x1
	.long	.LASF124
	.byte	0xd
	.byte	0xc0
	.byte	0xb
	.long	0x98
	.byte	0x18
	.uleb128 0x1
	.long	.LASF125
	.byte	0xd
	.byte	0xc1
	.byte	0xb
	.long	0x98
	.byte	0x20
	.uleb128 0x1
	.long	.LASF126
	.byte	0xd
	.byte	0xc3
	.byte	0x13
	.long	0x5f3
	.byte	0x28
	.uleb128 0x1
	.long	.LASF127
	.byte	0xd
	.byte	0xc4
	.byte	0xb
	.long	0x98
	.byte	0x30
	.uleb128 0x1
	.long	.LASF128
	.byte	0xd
	.byte	0xc6
	.byte	0xe
	.long	0x5a2
	.byte	0x38
	.uleb128 0x1
	.long	.LASF129
	.byte	0xd
	.byte	0xc7
	.byte	0xb
	.long	0x98
	.byte	0x40
	.uleb128 0x1
	.long	.LASF130
	.byte	0xd
	.byte	0xc9
	.byte	0x13
	.long	0x6f7
	.byte	0x48
	.uleb128 0x1
	.long	.LASF131
	.byte	0xd
	.byte	0xca
	.byte	0xb
	.long	0x98
	.byte	0x50
	.uleb128 0x1
	.long	.LASF132
	.byte	0xd
	.byte	0xcc
	.byte	0x9
	.long	0x66
	.byte	0x58
	.uleb128 0x1
	.long	.LASF133
	.byte	0xd
	.byte	0xcd
	.byte	0x9
	.long	0x66
	.byte	0x5c
	.uleb128 0x1
	.long	.LASF134
	.byte	0xd
	.byte	0xcf
	.byte	0x9
	.long	0x66
	.byte	0x60
	.uleb128 0x1
	.long	.LASF135
	.byte	0xd
	.byte	0xd0
	.byte	0x9
	.long	0x66
	.byte	0x64
	.uleb128 0x1
	.long	.LASF136
	.byte	0xd
	.byte	0xd2
	.byte	0x9
	.long	0x66
	.byte	0x68
	.uleb128 0x1
	.long	.LASF137
	.byte	0xd
	.byte	0xd4
	.byte	0x9
	.long	0x66
	.byte	0x6c
	.uleb128 0x1
	.long	.LASF138
	.byte	0xd
	.byte	0xd6
	.byte	0xb
	.long	0x98
	.byte	0x70
	.byte	0
	.uleb128 0x4
	.long	0x55d
	.uleb128 0x5
	.long	.LASF139
	.byte	0xd
	.byte	0xd7
	.byte	0x3
	.long	0x5ff
	.uleb128 0x1b
	.byte	0xd0
	.byte	0xd
	.byte	0xe3
	.long	0x793
	.uleb128 0x1
	.long	.LASF140
	.byte	0xd
	.byte	0xe5
	.byte	0x9
	.long	0x66
	.byte	0
	.uleb128 0x1
	.long	.LASF141
	.byte	0xd
	.byte	0xe6
	.byte	0x9
	.long	0x66
	.byte	0x4
	.uleb128 0x1
	.long	.LASF142
	.byte	0xd
	.byte	0xe7
	.byte	0x1d
	.long	0x417
	.byte	0x8
	.uleb128 0x1
	.long	.LASF143
	.byte	0xd
	.byte	0xe8
	.byte	0x16
	.long	0x4df
	.byte	0x88
	.uleb128 0x1
	.long	.LASF144
	.byte	0xd
	.byte	0xe9
	.byte	0x9
	.long	0x66
	.byte	0x90
	.uleb128 0x1
	.long	.LASF145
	.byte	0xd
	.byte	0xea
	.byte	0x9
	.long	0x66
	.byte	0x94
	.uleb128 0x1
	.long	.LASF146
	.byte	0xd
	.byte	0xeb
	.byte	0x9
	.long	0x66
	.byte	0x98
	.uleb128 0x1
	.long	.LASF147
	.byte	0xd
	.byte	0xec
	.byte	0x9
	.long	0x66
	.byte	0x9c
	.uleb128 0x1
	.long	.LASF148
	.byte	0xd
	.byte	0xed
	.byte	0x9
	.long	0x66
	.byte	0xa0
	.uleb128 0x1
	.long	.LASF149
	.byte	0xd
	.byte	0xee
	.byte	0x15
	.long	0x3b0
	.byte	0xa8
	.byte	0
	.uleb128 0x5
	.long	.LASF150
	.byte	0xd
	.byte	0xef
	.byte	0x3
	.long	0x708
	.uleb128 0x5
	.long	.LASF151
	.byte	0xe
	.byte	0x38
	.byte	0x1b
	.long	0x3a
	.uleb128 0x5
	.long	.LASF152
	.byte	0xe
	.byte	0x48
	.byte	0x1b
	.long	0x3a
	.uleb128 0x1a
	.long	.LASF153
	.byte	0x40
	.byte	0xe
	.value	0x19d
	.long	0x889
	.uleb128 0x7
	.long	.LASF154
	.byte	0xe
	.value	0x1a1
	.byte	0x14
	.long	0x88e
	.byte	0
	.uleb128 0x7
	.long	.LASF155
	.byte	0xe
	.value	0x1a4
	.byte	0x14
	.long	0x79f
	.byte	0x8
	.uleb128 0x7
	.long	.LASF156
	.byte	0xe
	.value	0x1a7
	.byte	0x14
	.long	0x79f
	.byte	0x10
	.uleb128 0x7
	.long	.LASF157
	.byte	0xe
	.value	0x1aa
	.byte	0x10
	.long	0x7ab
	.byte	0x18
	.uleb128 0x7
	.long	.LASF158
	.byte	0xe
	.value	0x1af
	.byte	0x9
	.long	0x98
	.byte	0x20
	.uleb128 0x7
	.long	.LASF159
	.byte	0xe
	.value	0x1b5
	.byte	0x17
	.long	0x893
	.byte	0x28
	.uleb128 0x7
	.long	.LASF160
	.byte	0xe
	.value	0x1b8
	.byte	0xa
	.long	0x2e
	.byte	0x30
	.uleb128 0xa
	.long	.LASF161
	.value	0x1be
	.long	0x41
	.byte	0x1
	.value	0x1c0
	.uleb128 0xa
	.long	.LASF162
	.value	0x1c9
	.long	0x41
	.byte	0x2
	.value	0x1c1
	.uleb128 0xa
	.long	.LASF163
	.value	0x1cd
	.long	0x41
	.byte	0x1
	.value	0x1c3
	.uleb128 0xa
	.long	.LASF164
	.value	0x1d1
	.long	0x41
	.byte	0x1
	.value	0x1c4
	.uleb128 0xa
	.long	.LASF165
	.value	0x1d5
	.long	0x41
	.byte	0x1
	.value	0x1c5
	.uleb128 0xa
	.long	.LASF166
	.value	0x1d8
	.long	0x41
	.byte	0x1
	.value	0x1c6
	.uleb128 0xa
	.long	.LASF167
	.value	0x1db
	.long	0x41
	.byte	0x1
	.value	0x1c7
	.byte	0
	.uleb128 0x12
	.long	.LASF168
	.uleb128 0x4
	.long	0x889
	.uleb128 0x4
	.long	0x4a
	.uleb128 0x13
	.long	.LASF169
	.byte	0xe
	.value	0x1de
	.byte	0x22
	.long	0x7b7
	.uleb128 0x19
	.long	0x898
	.uleb128 0x13
	.long	.LASF170
	.byte	0xe
	.value	0x1ea
	.byte	0xd
	.long	0x66
	.uleb128 0x24
	.byte	0x8
	.byte	0xe
	.value	0x205
	.byte	0x9
	.long	0x8de
	.uleb128 0x7
	.long	.LASF171
	.byte	0xe
	.value	0x207
	.byte	0xc
	.long	0x8aa
	.byte	0
	.uleb128 0x7
	.long	.LASF172
	.byte	0xe
	.value	0x208
	.byte	0xc
	.long	0x8aa
	.byte	0x4
	.byte	0
	.uleb128 0x13
	.long	.LASF173
	.byte	0xe
	.value	0x209
	.byte	0x3
	.long	0x8b7
	.uleb128 0x1b
	.byte	0x30
	.byte	0xf
	.byte	0x9
	.long	0x941
	.uleb128 0x1
	.long	.LASF174
	.byte	0xf
	.byte	0xa
	.byte	0x9
	.long	0x66
	.byte	0
	.uleb128 0x1
	.long	.LASF175
	.byte	0xf
	.byte	0xb
	.byte	0xc
	.long	0x3c9
	.byte	0x8
	.uleb128 0x1
	.long	.LASF176
	.byte	0xf
	.byte	0xc
	.byte	0xb
	.long	0x98
	.byte	0x10
	.uleb128 0x1
	.long	.LASF177
	.byte	0xf
	.byte	0xd
	.byte	0xb
	.long	0x98
	.byte	0x18
	.uleb128 0x25
	.string	"sd"
	.byte	0xf
	.byte	0xe
	.byte	0x14
	.long	0x941
	.byte	0x20
	.uleb128 0x1
	.long	.LASF122
	.byte	0xf
	.byte	0xf
	.byte	0xb
	.long	0x98
	.byte	0x28
	.byte	0
	.uleb128 0x4
	.long	0x793
	.uleb128 0x5
	.long	.LASF178
	.byte	0xf
	.byte	0x10
	.byte	0x3
	.long	0x8eb
	.uleb128 0x1c
	.long	.LASF186
	.byte	0xe
	.value	0x2b1
	.long	0x964
	.uleb128 0x2
	.long	0x964
	.byte	0
	.uleb128 0x4
	.long	0x898
	.uleb128 0xf
	.long	0x964
	.uleb128 0x9
	.long	.LASF179
	.byte	0xe
	.value	0x2a7
	.byte	0xc
	.long	0x66
	.long	0x999
	.uleb128 0x2
	.long	0x99e
	.uleb128 0x2
	.long	0x2a2
	.uleb128 0x2
	.long	0x2e
	.uleb128 0x2
	.long	0x9a8
	.uleb128 0x2
	.long	0x66
	.byte	0
	.uleb128 0x4
	.long	0x8a5
	.uleb128 0xf
	.long	0x999
	.uleb128 0x4
	.long	0x8de
	.uleb128 0xf
	.long	0x9a3
	.uleb128 0x9
	.long	.LASF180
	.byte	0x10
	.value	0x165
	.byte	0xc
	.long	0x66
	.long	0x9ca
	.uleb128 0x2
	.long	0x2a7
	.uleb128 0x2
	.long	0x29d
	.uleb128 0x18
	.byte	0
	.uleb128 0x9
	.long	.LASF181
	.byte	0x11
	.value	0x2ab
	.byte	0xe
	.long	0x48
	.long	0x9e6
	.uleb128 0x2
	.long	0x48
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0x9
	.long	.LASF182
	.byte	0x12
	.value	0x197
	.byte	0xf
	.long	0x2e
	.long	0x9fd
	.uleb128 0x2
	.long	0x29d
	.byte	0
	.uleb128 0xb
	.long	.LASF183
	.byte	0x12
	.byte	0x90
	.byte	0xe
	.long	0x98
	.long	0xa1d
	.uleb128 0x2
	.long	0x98
	.uleb128 0x2
	.long	0x29d
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0x9
	.long	.LASF184
	.byte	0x11
	.value	0x2a0
	.byte	0xe
	.long	0x48
	.long	0xa34
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0x9
	.long	.LASF185
	.byte	0xe
	.value	0x2a3
	.byte	0xc
	.long	0x66
	.long	0xa55
	.uleb128 0x2
	.long	0x969
	.uleb128 0x2
	.long	0x2a2
	.uleb128 0x2
	.long	0x66
	.byte	0
	.uleb128 0x1c
	.long	.LASF187
	.byte	0x11
	.value	0x2af
	.long	0xa67
	.uleb128 0x2
	.long	0x48
	.byte	0
	.uleb128 0x26
	.long	.LASF188
	.byte	0x13
	.byte	0x38
	.byte	0x6
	.long	0xa79
	.uleb128 0x2
	.long	0xa79
	.byte	0
	.uleb128 0x4
	.long	0x6fc
	.uleb128 0xb
	.long	.LASF189
	.byte	0x14
	.byte	0x32
	.byte	0x5
	.long	0x66
	.long	0xaa8
	.uleb128 0x2
	.long	0xa79
	.uleb128 0x2
	.long	0x941
	.uleb128 0x2
	.long	0x66
	.uleb128 0x2
	.long	0x66
	.uleb128 0x2
	.long	0x66
	.byte	0
	.uleb128 0xb
	.long	.LASF190
	.byte	0x14
	.byte	0x31
	.byte	0x5
	.long	0x66
	.long	0xac3
	.uleb128 0x2
	.long	0x29d
	.uleb128 0x2
	.long	0x98
	.byte	0
	.uleb128 0x9
	.long	.LASF191
	.byte	0x10
	.value	0x193
	.byte	0xc
	.long	0x66
	.long	0xae0
	.uleb128 0x2
	.long	0x3ce
	.uleb128 0x2
	.long	0x2a2
	.uleb128 0x18
	.byte	0
	.uleb128 0x9
	.long	.LASF192
	.byte	0x10
	.value	0x16b
	.byte	0xc
	.long	0x66
	.long	0xaf8
	.uleb128 0x2
	.long	0x29d
	.uleb128 0x18
	.byte	0
	.uleb128 0x27
	.long	.LASF224
	.byte	0x15
	.byte	0x22
	.byte	0x10
	.long	0x8c
	.uleb128 0xb
	.long	.LASF193
	.byte	0x12
	.byte	0xbb
	.byte	0xe
	.long	0x98
	.long	0xb1a
	.uleb128 0x2
	.long	0x29d
	.byte	0
	.uleb128 0xb
	.long	.LASF194
	.byte	0x12
	.byte	0xf6
	.byte	0xe
	.long	0x98
	.long	0xb35
	.uleb128 0x2
	.long	0x29d
	.uleb128 0x2
	.long	0x66
	.byte	0
	.uleb128 0x9
	.long	.LASF195
	.byte	0x12
	.value	0x15e
	.byte	0xe
	.long	0x98
	.long	0xb51
	.uleb128 0x2
	.long	0x29d
	.uleb128 0x2
	.long	0x29d
	.byte	0
	.uleb128 0xb
	.long	.LASF196
	.byte	0x12
	.byte	0x9f
	.byte	0xc
	.long	0x66
	.long	0xb71
	.uleb128 0x2
	.long	0x29d
	.uleb128 0x2
	.long	0x29d
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0xb
	.long	.LASF197
	.byte	0x12
	.byte	0x3d
	.byte	0xe
	.long	0x48
	.long	0xb91
	.uleb128 0x2
	.long	0x48
	.uleb128 0x2
	.long	0x66
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0x28
	.long	.LASF225
	.byte	0x1
	.byte	0xb9
	.byte	0x6
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0xbea
	.uleb128 0x10
	.long	.LASF175
	.byte	0xb9
	.byte	0x18
	.long	0x3c9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x10
	.long	.LASF198
	.byte	0xb9
	.byte	0x23
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x11
	.quad	.LBB9
	.quad	.LBE9-.LBB9
	.uleb128 0x15
	.string	"i"
	.byte	0xbb
	.byte	0xe
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x1d
	.long	.LASF208
	.byte	0x80
	.byte	0x8
	.long	0x3c9
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0xcc2
	.uleb128 0x10
	.long	.LASF199
	.byte	0x80
	.byte	0x22
	.long	0x29d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x10
	.long	.LASF200
	.byte	0x80
	.byte	0x35
	.long	0xcc2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x6
	.long	.LASF175
	.byte	0x82
	.byte	0xc
	.long	0x3c9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x6
	.long	.LASF201
	.byte	0x86
	.byte	0x11
	.long	0x29d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x6
	.long	.LASF202
	.byte	0x87
	.byte	0xd
	.long	0x898
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x6
	.long	.LASF203
	.byte	0x88
	.byte	0x10
	.long	0xcc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x6
	.long	.LASF204
	.byte	0x8f
	.byte	0x11
	.long	0x29d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x11
	.quad	.LBB8
	.quad	.LBE8-.LBB8
	.uleb128 0x6
	.long	.LASF205
	.byte	0x93
	.byte	0xd
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -156
	.uleb128 0x15
	.string	"end"
	.byte	0x94
	.byte	0xd
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x6
	.long	.LASF206
	.byte	0x95
	.byte	0xd
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -148
	.uleb128 0x6
	.long	.LASF207
	.byte	0x97
	.byte	0xf
	.long	0x98
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	0x66
	.uleb128 0xd
	.long	0x8de
	.long	0xcd7
	.uleb128 0xe
	.long	0x3a
	.byte	0x1
	.byte	0
	.uleb128 0x1d
	.long	.LASF209
	.byte	0x5
	.byte	0x7
	.long	0x48
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0xe0e
	.uleb128 0x10
	.long	.LASF210
	.byte	0x5
	.byte	0x22
	.long	0x48
	.uleb128 0x3
	.byte	0x91
	.sleb128 -472
	.uleb128 0x6
	.long	.LASF211
	.byte	0x7
	.byte	0x13
	.long	0xe0e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -432
	.uleb128 0x29
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.long	0xdee
	.uleb128 0x15
	.string	"i"
	.byte	0xc
	.byte	0xe
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -452
	.uleb128 0x11
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x6
	.long	.LASF212
	.byte	0xf
	.byte	0x16
	.long	0x6fc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -384
	.uleb128 0x6
	.long	.LASF213
	.byte	0x10
	.byte	0x17
	.long	0x793
	.uleb128 0x3
	.byte	0x91
	.sleb128 -256
	.uleb128 0x6
	.long	.LASF214
	.byte	0x64
	.byte	0xd
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -444
	.uleb128 0x2a
	.long	.LLRL0
	.long	0xdcb
	.uleb128 0x6
	.long	.LASF215
	.byte	0x23
	.byte	0x13
	.long	0x98
	.uleb128 0x3
	.byte	0x91
	.sleb128 -424
	.uleb128 0x6
	.long	.LASF216
	.byte	0x24
	.byte	0x13
	.long	0x98
	.uleb128 0x3
	.byte	0x91
	.sleb128 -416
	.uleb128 0x6
	.long	.LASF217
	.byte	0x2b
	.byte	0x13
	.long	0x98
	.uleb128 0x3
	.byte	0x91
	.sleb128 -408
	.uleb128 0x6
	.long	.LASF218
	.byte	0x2c
	.byte	0x13
	.long	0x98
	.uleb128 0x3
	.byte	0x91
	.sleb128 -400
	.uleb128 0x6
	.long	.LASF219
	.byte	0x2d
	.byte	0x13
	.long	0x98
	.uleb128 0x3
	.byte	0x91
	.sleb128 -392
	.byte	0
	.uleb128 0x11
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x6
	.long	.LASF220
	.byte	0x55
	.byte	0x17
	.long	0x98
	.uleb128 0x3
	.byte	0x91
	.sleb128 -440
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x11
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.uleb128 0x15
	.string	"i"
	.byte	0x6f
	.byte	0xe
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -448
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	0x946
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 14
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 12
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0x6b
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0x11
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
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
	.uleb128 0x14
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
	.sleb128 13
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 14
	.uleb128 0x1
	.uleb128 0x13
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
	.sleb128 8
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
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1e
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
	.uleb128 0x1f
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x23
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
	.uleb128 0x24
	.uleb128 0x13
	.byte	0x1
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
	.uleb128 0x25
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
	.uleb128 0x29
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
	.uleb128 0x2a
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 .LBB4-.Ltext0
	.uleb128 .LBE4-.Ltext0
	.byte	0x4
	.uleb128 .LBB6-.Ltext0
	.uleb128 .LBE6-.Ltext0
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF192:
	.string	"printf"
.LASF10:
	.string	"__off_t"
.LASF179:
	.string	"regexec"
.LASF119:
	.string	"contentType_t"
.LASF65:
	.string	"__size"
.LASF159:
	.string	"translate"
.LASF184:
	.string	"malloc"
.LASF28:
	.string	"_chain"
.LASF218:
	.string	"path_start"
.LASF94:
	.string	"statusCode_s"
.LASF101:
	.string	"statusCode_t"
.LASF9:
	.string	"size_t"
.LASF97:
	.string	"NOT_FOUND"
.LASF52:
	.string	"__prev"
.LASF66:
	.string	"__align"
.LASF34:
	.string	"_shortbuf"
.LASF73:
	.string	"sockaddr_storage"
.LASF77:
	.string	"addrinfo"
.LASF151:
	.string	"__re_long_size_t"
.LASF195:
	.string	"strstr"
.LASF16:
	.string	"_IO_read_ptr"
.LASF221:
	.string	"GNU C17 14.2.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF130:
	.string	"status_code"
.LASF183:
	.string	"strncpy"
.LASF224:
	.string	"gettid"
.LASF161:
	.string	"can_be_null"
.LASF103:
	.string	"POST"
.LASF49:
	.string	"long long unsigned int"
.LASF143:
	.string	"server_info"
.LASF214:
	.string	"dynamic"
.LASF142:
	.string	"client_info"
.LASF137:
	.string	"max_age"
.LASF68:
	.string	"socklen_t"
.LASF158:
	.string	"fastmap"
.LASF187:
	.string	"free"
.LASF37:
	.string	"_codecvt"
.LASF140:
	.string	"sockfd"
.LASF48:
	.string	"long long int"
.LASF6:
	.string	"signed char"
.LASF167:
	.string	"newline_anchor"
.LASF123:
	.string	"uri_str"
.LASF29:
	.string	"_fileno"
.LASF17:
	.string	"_IO_read_end"
.LASF208:
	.string	"extract_links"
.LASF202:
	.string	"regex"
.LASF129:
	.string	"method_str"
.LASF8:
	.string	"long int"
.LASF105:
	.string	"PATCH"
.LASF88:
	.string	"HTTP1_0"
.LASF89:
	.string	"HTTP1_1"
.LASF15:
	.string	"_flags"
.LASF165:
	.string	"not_bol"
.LASF23:
	.string	"_IO_buf_end"
.LASF152:
	.string	"reg_syntax_t"
.LASF46:
	.string	"_IO_codecvt"
.LASF198:
	.string	"total_links"
.LASF31:
	.string	"_old_offset"
.LASF36:
	.string	"_offset"
.LASF169:
	.string	"regex_t"
.LASF191:
	.string	"asprintf"
.LASF55:
	.string	"__pthread_mutex_s"
.LASF78:
	.string	"ai_flags"
.LASF216:
	.string	"protocol_end"
.LASF207:
	.string	"link"
.LASF53:
	.string	"__next"
.LASF115:
	.string	"IMAGE_GIF"
.LASF148:
	.string	"port"
.LASF45:
	.string	"_IO_marker"
.LASF124:
	.string	"hostname_str"
.LASF3:
	.string	"unsigned int"
.LASF40:
	.string	"_freeres_buf"
.LASF145:
	.string	"recvBytes"
.LASF114:
	.string	"IMAGE_PNG"
.LASF180:
	.string	"fprintf"
.LASF80:
	.string	"ai_socktype"
.LASF2:
	.string	"long unsigned int"
.LASF215:
	.string	"url_copy"
.LASF64:
	.string	"__data"
.LASF20:
	.string	"_IO_write_ptr"
.LASF110:
	.string	"TEXT_HTML"
.LASF194:
	.string	"strchr"
.LASF128:
	.string	"method"
.LASF146:
	.string	"sentBytes"
.LASF144:
	.string	"addr_len"
.LASF174:
	.string	"linknum"
.LASF210:
	.string	"data"
.LASF62:
	.string	"__elision"
.LASF5:
	.string	"short unsigned int"
.LASF91:
	.string	"supported_http_protocols"
.LASF47:
	.string	"_IO_wide_data"
.LASF106:
	.string	"HEAD"
.LASF182:
	.string	"strlen"
.LASF24:
	.string	"_IO_save_base"
.LASF99:
	.string	"VERSION_NOT_SUPPORTED"
.LASF217:
	.string	"host_start"
.LASF117:
	.string	"IMAGE_X_ICON"
.LASF220:
	.string	"full_path"
.LASF132:
	.string	"connection_keep_alive"
.LASF35:
	.string	"_lock"
.LASF42:
	.string	"_mode"
.LASF178:
	.string	"prefetcher_t"
.LASF58:
	.string	"__owner"
.LASF176:
	.string	"base_url"
.LASF135:
	.string	"current_state"
.LASF108:
	.string	"method_t"
.LASF120:
	.string	"req_header_s"
.LASF104:
	.string	"DELETE"
.LASF139:
	.string	"HttpHeader_t"
.LASF155:
	.string	"allocated"
.LASF150:
	.string	"sockdetails_t"
.LASF90:
	.string	"ERROR_VERSION"
.LASF21:
	.string	"_IO_write_end"
.LASF41:
	.string	"_prevchain"
.LASF81:
	.string	"ai_protocol"
.LASF131:
	.string	"status_code_str"
.LASF199:
	.string	"html_content"
.LASF127:
	.string	"content_type_str"
.LASF211:
	.string	"prefetch_data"
.LASF222:
	.string	"_IO_lock_t"
.LASF162:
	.string	"regs_allocated"
.LASF50:
	.string	"_IO_FILE"
.LASF204:
	.string	"cursor"
.LASF201:
	.string	"pattern"
.LASF118:
	.string	"total_content_types"
.LASF125:
	.string	"hostname_port_str"
.LASF136:
	.string	"open_file_fd"
.LASF171:
	.string	"rm_so"
.LASF51:
	.string	"__pthread_internal_list"
.LASF82:
	.string	"ai_addrlen"
.LASF190:
	.string	"is_dynamic_content"
.LASF156:
	.string	"used"
.LASF111:
	.string	"TEXT_CSS"
.LASF71:
	.string	"sa_family"
.LASF113:
	.string	"APPLICATION_JAVASCRIPT"
.LASF27:
	.string	"_markers"
.LASF163:
	.string	"fastmap_accurate"
.LASF87:
	.string	"__int128 unsigned"
.LASF188:
	.string	"cleanup_header"
.LASF102:
	.string	"method_s"
.LASF4:
	.string	"unsigned char"
.LASF177:
	.string	"base_port"
.LASF107:
	.string	"total_req_methods"
.LASF203:
	.string	"matches"
.LASF196:
	.string	"strncmp"
.LASF133:
	.string	"connection_close"
.LASF12:
	.string	"__pid_t"
.LASF83:
	.string	"ai_addr"
.LASF7:
	.string	"short int"
.LASF170:
	.string	"regoff_t"
.LASF166:
	.string	"not_eol"
.LASF30:
	.string	"_flags2"
.LASF93:
	.string	"httpType_s"
.LASF92:
	.string	"httpType_t"
.LASF116:
	.string	"IMAGE_JPG"
.LASF85:
	.string	"ai_next"
.LASF33:
	.string	"_vtable_offset"
.LASF154:
	.string	"buffer"
.LASF44:
	.string	"FILE"
.LASF112:
	.string	"TEXT_PLAIN"
.LASF141:
	.string	"client_sock_fd"
.LASF212:
	.string	"temp_header"
.LASF175:
	.string	"links"
.LASF57:
	.string	"__count"
.LASF56:
	.string	"__lock"
.LASF100:
	.string	"total_status_codes"
.LASF172:
	.string	"rm_eo"
.LASF225:
	.string	"free_links"
.LASF164:
	.string	"no_sub"
.LASF13:
	.string	"char"
.LASF149:
	.string	"lock"
.LASF206:
	.string	"length"
.LASF74:
	.string	"ss_family"
.LASF14:
	.string	"__socklen_t"
.LASF122:
	.string	"http_version_str"
.LASF138:
	.string	"extra_header"
.LASF168:
	.string	"re_dfa_t"
.LASF98:
	.string	"METHOD_NOT_ALLOWED"
.LASF109:
	.string	"contentType_s"
.LASF153:
	.string	"re_pattern_buffer"
.LASF79:
	.string	"ai_family"
.LASF209:
	.string	"prefetch_thread_func"
.LASF173:
	.string	"regmatch_t"
.LASF11:
	.string	"__off64_t"
.LASF32:
	.string	"_cur_column"
.LASF18:
	.string	"_IO_read_base"
.LASF26:
	.string	"_IO_save_end"
.LASF86:
	.string	"__int128"
.LASF67:
	.string	"pthread_mutex_t"
.LASF61:
	.string	"__spins"
.LASF121:
	.string	"http_version"
.LASF69:
	.string	"sa_family_t"
.LASF43:
	.string	"_unused2"
.LASF223:
	.string	"stderr"
.LASF197:
	.string	"memset"
.LASF76:
	.string	"__ss_align"
.LASF70:
	.string	"sockaddr"
.LASF219:
	.string	"port_start"
.LASF193:
	.string	"strdup"
.LASF59:
	.string	"__nusers"
.LASF25:
	.string	"_IO_backup_base"
.LASF96:
	.string	"FORBIDDEN"
.LASF75:
	.string	"__ss_padding"
.LASF189:
	.string	"check_and_send_from_cache"
.LASF185:
	.string	"regcomp"
.LASF126:
	.string	"content_type"
.LASF72:
	.string	"sa_data"
.LASF39:
	.string	"_freeres_list"
.LASF63:
	.string	"__list"
.LASF84:
	.string	"ai_canonname"
.LASF181:
	.string	"realloc"
.LASF38:
	.string	"_wide_data"
.LASF60:
	.string	"__kind"
.LASF205:
	.string	"start"
.LASF213:
	.string	"temp_sd"
.LASF54:
	.string	"__pthread_list_t"
.LASF147:
	.string	"timeout"
.LASF157:
	.string	"syntax"
.LASF19:
	.string	"_IO_write_base"
.LASF95:
	.string	"BAD_REQ"
.LASF22:
	.string	"_IO_buf_base"
.LASF186:
	.string	"regfree"
.LASF160:
	.string	"re_nsub"
.LASF134:
	.string	"parser_error"
.LASF200:
	.string	"link_count"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/parth/Work/All_data/university/Network System/Assignments/PA3"
.LASF0:
	.string	"src/prefetch.c"
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
