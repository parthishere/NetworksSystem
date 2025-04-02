	.file	"cache.c"
	.text
	.local	global_table
	.comm	global_table,8,8
	.globl	init_cache_table
	.type	init_cache_table, @function
init_cache_table:
.LFB320:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	cmpl	$0, -20(%rbp)
	je	.L2
	movl	$8232, %edi
	call	malloc@PLT
	movq	%rax, global_table(%rip)
	movq	global_table(%rip), %rax
	testq	%rax, %rax
	jne	.L3
	movl	$0, %eax
	jmp	.L4
.L3:
	movq	global_table(%rip), %rax
	movl	$8192, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movq	global_table(%rip), %rax
	addq	$8192, %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_mutex_init@PLT
	movq	global_table(%rip), %rax
	jmp	.L4
.L2:
	movl	$8232, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L5
	movl	$0, %eax
	jmp	.L4
.L5:
	movq	-8(%rbp), %rax
	movl	$8192, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movq	-8(%rbp), %rax
	addq	$8192, %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_mutex_init@PLT
	movq	-8(%rbp), %rax
.L4:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE320:
	.size	init_cache_table, .-init_cache_table
	.globl	hash_index
	.type	hash_index, @function
hash_index:
.LFB321:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L7
.L8:
	movl	-8(%rbp), %edx
	movl	%edx, %eax
	sall	$5, %eax
	subl	%edx, %eax
	movl	%eax, %ecx
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	addl	%ecx, %eax
	movl	%eax, -8(%rbp)
	addl	$1, -4(%rbp)
.L7:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L8
	movl	-8(%rbp), %eax
	andl	$1023, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE321:
	.size	hash_index, .-hash_index
	.section	.rodata
.LC0:
	.string	"./cache"
.LC1:
	.string	"Can't open dir %s\n"
.LC2:
	.string	"%s/%s"
.LC3:
	.string	"cannot stat %s\n"
	.text
	.globl	init_cache
	.type	init_cache, @function
init_cache:
.LFB322:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$464, %rsp
	movq	%rdi, -456(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -448(%rbp)
	cmpq	$0, -456(%rbp)
	jne	.L11
	movq	global_table(%rip), %rax
	movq	%rax, -448(%rbp)
	jmp	.L12
.L11:
	movq	-456(%rbp), %rax
	movq	%rax, -448(%rbp)
.L12:
	leaq	.LC0(%rip), %rax
	movq	%rax, -440(%rbp)
	movq	-440(%rbp), %rax
	movq	%rax, %rdi
	call	opendir@PLT
	movq	%rax, -432(%rbp)
	cmpq	$0, -432(%rbp)
	jne	.L15
	movq	stderr(%rip), %rax
	movq	-440(%rbp), %rdx
	leaq	.LC1(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$-1, %eax
	jmp	.L10
.L20:
	movq	-424(%rbp), %rax
	leaq	19(%rax), %rcx
	movq	-440(%rbp), %rdx
	leaq	-272(%rbp), %rax
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-416(%rbp), %rdx
	leaq	-272(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	stat@PLT
	cmpl	$-1, %eax
	jne	.L16
	movq	-424(%rbp), %rax
	leaq	19(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC3(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	jmp	.L15
.L16:
	movl	-392(%rbp), %eax
	andl	$61440, %eax
	cmpl	$16384, %eax
	je	.L22
	movq	-424(%rbp), %rax
	leaq	19(%rax), %rcx
	leaq	-272(%rbp), %rax
	movq	%rax, %rdx
	movq	%rcx, %rsi
	movl	$0, %edi
	call	cache_add_existing
	jmp	.L15
.L22:
	nop
.L15:
	movq	-432(%rbp), %rax
	movq	%rax, %rdi
	call	readdir@PLT
	movq	%rax, -424(%rbp)
	cmpq	$0, -424(%rbp)
	jne	.L20
.L10:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L21
	call	__stack_chk_fail@PLT
.L21:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE322:
	.size	init_cache, .-init_cache
	.section	.rodata
	.align 8
.LC4:
	.string	"something you will need to tweak"
.LC5:
	.string	"open"
.LC6:
	.string	"stat"
	.text
	.globl	cache_add_new
	.type	cache_add_new, @function
cache_add_new:
.LFB323:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$256, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -248(%rbp)
	movq	%rsi, -256(%rbp)
	movq	%rdx, -264(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %r12
	movq	$0, -216(%rbp)
	cmpq	$0, -248(%rbp)
	jne	.L24
	movq	global_table(%rip), %rax
	movq	%rax, -216(%rbp)
	jmp	.L25
.L24:
	movq	-248(%rbp), %rax
	movq	%rax, -216(%rbp)
.L25:
	movq	-256(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rbx
	movq	-264(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	addq	%rbx, %rax
	leaq	2(%rax), %rsi
	movq	%rsi, %rax
	subq	$1, %rax
	movq	%rax, -208(%rbp)
	movl	$16, %eax
	subq	$1, %rax
	addq	%rsi, %rax
	movl	$16, %ebx
	movl	$0, %edx
	divq	%rbx
	imulq	$16, %rax, %rax
	movq	%rax, %rcx
	andq	$-4096, %rcx
	movq	%rsp, %rdx
	subq	%rcx, %rdx
.L26:
	cmpq	%rdx, %rsp
	je	.L27
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L26
.L27:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L28
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L28:
	movq	%rsp, %rax
	movq	%rax, -200(%rbp)
	movq	-264(%rbp), %rcx
	movq	-256(%rbp), %rdx
	movq	-200(%rbp), %rax
	movq	%rcx, %r8
	movq	%rdx, %rcx
	leaq	.LC2(%rip), %rdx
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	movl	%eax, -236(%rbp)
	movl	-236(%rbp), %eax
	movslq	%eax, %rbx
	movq	-200(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	cmpq	%rax, %rbx
	je	.L29
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L29:
	movq	-200(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	%eax, %edx
	movq	-200(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	str2md5
	movq	%rax, -192(%rbp)
	movq	-192(%rbp), %rdx
	leaq	-224(%rbp), %rax
	movq	%rdx, %rcx
	leaq	.LC0(%rip), %rdx
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	movl	$4152, %edi
	call	malloc@PLT
	movq	%rax, -184(%rbp)
	cmpq	$0, -184(%rbp)
	jne	.L30
	movl	$-1, %eax
	jmp	.L31
.L30:
	movq	-224(%rbp), %rax
	movl	$438, %edx
	movl	$66, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -232(%rbp)
	cmpl	$0, -232(%rbp)
	jns	.L32
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$-1, %eax
	jmp	.L31
.L32:
	movq	-184(%rbp), %rax
	movq	-192(%rbp), %rcx
	movl	$32, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	movq	-184(%rbp), %rax
	movb	$0, 32(%rax)
	movq	-184(%rbp), %rax
	leaq	33(%rax), %rcx
	movq	-264(%rbp), %rax
	movl	$4095, %edx
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	strncpy@PLT
	movq	-184(%rbp), %rax
	movb	$0, 4128(%rax)
	movq	-224(%rbp), %rax
	leaq	-176(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	stat@PLT
	testl	%eax, %eax
	je	.L33
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	-232(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-224(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$-1, %eax
	jmp	.L31
.L33:
	movq	-72(%rbp), %rax
	movq	%rax, %rdx
	movq	-184(%rbp), %rax
	movq	%rdx, 4136(%rax)
	movq	-192(%rbp), %rax
	movq	%rax, %rdi
	call	hash_index
	movl	%eax, -228(%rbp)
	movq	-216(%rbp), %rax
	addq	$8192, %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	movq	-216(%rbp), %rax
	movl	-228(%rbp), %edx
	movq	(%rax,%rdx,8), %rax
	testq	%rax, %rax
	jne	.L34
	movq	-216(%rbp), %rax
	movl	-228(%rbp), %edx
	movq	-184(%rbp), %rcx
	movq	%rcx, (%rax,%rdx,8)
	jmp	.L35
.L34:
	movq	-216(%rbp), %rax
	movl	-228(%rbp), %edx
	movq	(%rax,%rdx,8), %rdx
	movq	-184(%rbp), %rax
	movq	%rdx, 4144(%rax)
	movq	-216(%rbp), %rax
	movl	-228(%rbp), %edx
	movq	-184(%rbp), %rcx
	movq	%rcx, (%rax,%rdx,8)
.L35:
	movq	-216(%rbp), %rax
	addq	$8192, %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	movl	-232(%rbp), %eax
.L31:
	movq	%r12, %rsp
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L37
	call	__stack_chk_fail@PLT
.L37:
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE323:
	.size	cache_add_new, .-cache_add_new
	.section	.rodata
.LC7:
	.string	"cannot open file"
.LC8:
	.string	"cannot stat"
	.text
	.globl	cache_add_existing
	.type	cache_add_existing, @function
cache_add_existing:
.LFB324:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$224, %rsp
	movq	%rdi, -200(%rbp)
	movq	%rsi, -208(%rbp)
	movq	%rdx, -216(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -176(%rbp)
	cmpq	$0, -200(%rbp)
	jne	.L39
	movq	global_table(%rip), %rax
	movq	%rax, -176(%rbp)
	jmp	.L40
.L39:
	movq	-200(%rbp), %rax
	movq	%rax, -176(%rbp)
.L40:
	movl	$4152, %edi
	call	malloc@PLT
	movq	%rax, -168(%rbp)
	cmpq	$0, -168(%rbp)
	je	.L49
	movq	-216(%rbp), %rax
	movl	$438, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -184(%rbp)
	cmpl	$0, -184(%rbp)
	jns	.L43
	movq	-168(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	jmp	.L38
.L43:
	leaq	-160(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	stat@PLT
	testl	%eax, %eax
	je	.L44
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$11, %edx
	movl	$1, %esi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
.L44:
	movq	-168(%rbp), %rax
	movq	-208(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movq	-168(%rbp), %rax
	leaq	33(%rax), %rdx
	movq	-208(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	strcpy@PLT
	movq	-56(%rbp), %rax
	movq	%rax, %rdx
	movq	-168(%rbp), %rax
	movq	%rdx, 4136(%rax)
	movq	-168(%rbp), %rax
	movq	$0, 4144(%rax)
	movq	-208(%rbp), %rax
	movq	%rax, %rdi
	call	hash_index
	movl	%eax, -180(%rbp)
	movq	-176(%rbp), %rax
	addq	$8192, %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	movq	-176(%rbp), %rax
	movl	-180(%rbp), %edx
	movq	(%rax,%rdx,8), %rax
	testq	%rax, %rax
	jne	.L45
	movq	-176(%rbp), %rax
	movl	-180(%rbp), %edx
	movq	-168(%rbp), %rcx
	movq	%rcx, (%rax,%rdx,8)
	jmp	.L46
.L45:
	movq	-176(%rbp), %rax
	movl	-180(%rbp), %edx
	movq	(%rax,%rdx,8), %rdx
	movq	-168(%rbp), %rax
	movq	%rdx, 4144(%rax)
	movq	-176(%rbp), %rax
	movl	-180(%rbp), %edx
	movq	-168(%rbp), %rcx
	movq	%rcx, (%rax,%rdx,8)
.L46:
	movl	-184(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movq	-176(%rbp), %rax
	addq	$8192, %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	jmp	.L38
.L49:
	nop
.L38:
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L48
	call	__stack_chk_fail@PLT
.L48:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE324:
	.size	cache_add_existing, .-cache_add_existing
	.section	.rodata
	.align 8
.LC9:
	.string	"\033[33m[+] (%d) File is %lu sec long (<%ld)!\n\033[0m"
.LC10:
	.string	"file opening from cache"
	.align 8
.LC11:
	.string	"\033[33m[+] (%d) File is %lu sec long, (Need to fetch newer one) (>%ld)!\n\033[0m"
	.text
	.globl	cache_lookup
	.type	cache_lookup, @function
cache_lookup:
.LFB325:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$112, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -104(%rbp)
	movq	%rsi, -112(%rbp)
	movq	%rdx, -120(%rbp)
	movq	%rcx, -128(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %r12
	movq	$0, -64(%rbp)
	movl	$-1, -92(%rbp)
	cmpq	$0, -104(%rbp)
	jne	.L51
	movq	global_table(%rip), %rax
	movq	%rax, -64(%rbp)
	jmp	.L52
.L51:
	movq	-104(%rbp), %rax
	movq	%rax, -64(%rbp)
.L52:
	movq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rbx
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	addq	%rbx, %rax
	leaq	2(%rax), %rsi
	movq	%rsi, %rax
	subq	$1, %rax
	movq	%rax, -48(%rbp)
	movl	$16, %eax
	subq	$1, %rax
	addq	%rsi, %rax
	movl	$16, %ecx
	movl	$0, %edx
	divq	%rcx
	imulq	$16, %rax, %rax
	movq	%rax, %rcx
	andq	$-4096, %rcx
	movq	%rsp, %rdx
	subq	%rcx, %rdx
.L53:
	cmpq	%rdx, %rsp
	je	.L54
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L53
.L54:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L55
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L55:
	movq	%rsp, %rax
	movq	%rax, -40(%rbp)
	movq	-120(%rbp), %rcx
	movq	-112(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rcx, %r8
	movq	%rdx, %rcx
	leaq	.LC2(%rip), %rdx
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	movl	%eax, -88(%rbp)
	movl	-88(%rbp), %eax
	movslq	%eax, %rbx
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	cmpq	%rax, %rbx
	je	.L56
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L56:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	%eax, %edx
	movq	-40(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	str2md5
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	hash_index
	movl	%eax, -84(%rbp)
	movq	-64(%rbp), %rax
	movl	-84(%rbp), %edx
	movq	(%rax,%rdx,8), %rax
	movq	%rax, -56(%rbp)
	movq	-64(%rbp), %rax
	addq	$8192, %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	jmp	.L57
.L63:
	movq	-56(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L58
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	time@PLT
	movq	-56(%rbp), %rdx
	leaq	-72(%rbp), %rax
	movq	%rdx, %rcx
	leaq	.LC0(%rip), %rdx
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	movq	-80(%rbp), %rax
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	4136(%rax), %rax
	subq	%rax, %rdx
	movq	-128(%rbp), %rax
	cmpq	%rdx, %rax
	jb	.L59
	movq	-80(%rbp), %rax
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	4136(%rax), %rax
	movq	%rdx, %rbx
	subq	%rax, %rbx
	call	gettid@PLT
	movl	%eax, %esi
	movq	-128(%rbp), %rax
	movq	%rax, %rcx
	movq	%rbx, %rdx
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-72(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -92(%rbp)
	cmpl	$0, -92(%rbp)
	jns	.L60
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
.L60:
	movq	-64(%rbp), %rax
	addq	$8192, %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	movl	-92(%rbp), %eax
	jmp	.L62
.L59:
	movq	-80(%rbp), %rax
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	4136(%rax), %rax
	movq	%rdx, %rbx
	subq	%rax, %rbx
	call	gettid@PLT
	movl	%eax, %esi
	movq	-128(%rbp), %rax
	movq	%rax, %rcx
	movq	%rbx, %rdx
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-64(%rbp), %rax
	addq	$8192, %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	remove@PLT
	movl	-92(%rbp), %eax
	jmp	.L62
.L58:
	movq	-56(%rbp), %rax
	movq	4144(%rax), %rax
	movq	%rax, -56(%rbp)
.L57:
	cmpq	$0, -56(%rbp)
	jne	.L63
	movq	-64(%rbp), %rax
	addq	$8192, %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	movl	-92(%rbp), %eax
.L62:
	movq	%r12, %rsp
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L65
	call	__stack_chk_fail@PLT
.L65:
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE325:
	.size	cache_lookup, .-cache_lookup
	.section	.rodata
.LC12:
	.string	"%02x"
	.text
	.globl	str2md5
	.type	str2md5, @function
str2md5:
.LFB326:
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
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	call	EVP_MD_CTX_new@PLT
	movq	%rax, -56(%rbp)
	call	EVP_md5@PLT
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rcx
	movq	-56(%rbp), %rax
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	EVP_DigestInit_ex@PLT
	movl	$33, %edi
	call	malloc@PLT
	movq	%rax, -40(%rbp)
	jmp	.L67
.L70:
	cmpl	$512, -76(%rbp)
	jle	.L68
	movq	-72(%rbp), %rcx
	movq	-56(%rbp), %rax
	movl	$512, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	EVP_DigestUpdate@PLT
	jmp	.L69
.L68:
	movl	-76(%rbp), %eax
	movslq	%eax, %rdx
	movq	-72(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	EVP_DigestUpdate@PLT
.L69:
	subl	$512, -76(%rbp)
	addq	$512, -72(%rbp)
.L67:
	cmpl	$0, -76(%rbp)
	jg	.L70
	leaq	-64(%rbp), %rdx
	leaq	-32(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	EVP_DigestFinal_ex@PLT
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	EVP_MD_CTX_free@PLT
	movl	$0, -60(%rbp)
	jmp	.L71
.L72:
	movl	-60(%rbp), %eax
	cltq
	movzbl	-32(%rbp,%rax), %eax
	movzbl	%al, %eax
	movl	-60(%rbp), %edx
	addl	%edx, %edx
	movslq	%edx, %rcx
	movq	-40(%rbp), %rdx
	leaq	(%rcx,%rdx), %rdi
	movl	%eax, %ecx
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdx
	movl	$32, %esi
	movl	$0, %eax
	call	snprintf@PLT
	addl	$1, -60(%rbp)
.L71:
	movl	-64(%rbp), %eax
	cmpl	%eax, -60(%rbp)
	jl	.L72
	movq	-40(%rbp), %rax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L74
	call	__stack_chk_fail@PLT
.L74:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE326:
	.size	str2md5, .-str2md5
	.globl	cleanup_cache
	.type	cleanup_cache, @function
cleanup_cache:
.LFB327:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	$0, -24(%rbp)
	movl	$-1, -28(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L76
	movq	global_table(%rip), %rax
	movq	%rax, -24(%rbp)
	jmp	.L77
.L76:
	movq	-40(%rbp), %rax
	movq	%rax, -24(%rbp)
.L77:
	movl	$0, -32(%rbp)
	movl	$0, -32(%rbp)
	jmp	.L78
.L82:
	movq	-24(%rbp), %rax
	movl	-32(%rbp), %edx
	movslq	%edx, %rdx
	movq	(%rax,%rdx,8), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L79
	movq	-16(%rbp), %rax
	movq	4144(%rax), %rax
	testq	%rax, %rax
	je	.L79
	cmpq	$0, -8(%rbp)
	je	.L80
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L80:
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	movq	4144(%rax), %rax
	movq	%rax, -16(%rbp)
.L79:
	movq	-24(%rbp), %rax
	movl	-32(%rbp), %edx
	movslq	%edx, %rdx
	movq	(%rax,%rdx,8), %rax
	testq	%rax, %rax
	je	.L81
	movq	-24(%rbp), %rax
	movl	-32(%rbp), %edx
	movslq	%edx, %rdx
	movq	(%rax,%rdx,8), %rax
	movq	%rax, %rdi
	call	free@PLT
.L81:
	addl	$1, -32(%rbp)
.L78:
	cmpl	$1023, -32(%rbp)
	jle	.L82
	movq	-24(%rbp), %rax
	addq	$8192, %rax
	movq	%rax, %rdi
	call	pthread_mutex_destroy@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE327:
	.size	cleanup_cache, .-cleanup_cache
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
