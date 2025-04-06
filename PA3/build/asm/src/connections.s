	.file	"connections.c"
	.text
.Ltext0:
	.file 0 "/home/parth/Work/All_data/university/Network System/Assignments/PA3" "src/connections.c"
	.local	global_conn_table
	.comm	global_conn_table,8,8
	.local	cleanup_thread
	.comm	cleanup_thread,8,8
	.local	cleanup_thread_running
	.comm	cleanup_thread_running,4,4
	.globl	init_connection_table
	.type	init_connection_table, @function
init_connection_table:
.LFB320:
	.file 1 "src/connections.c"
	.loc 1 22 55
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	.loc 1 25 8
	cmpl	$0, -20(%rbp)
	je	.L2
	.loc 1 26 29
	movl	$8192, %edi
	call	malloc@PLT
	.loc 1 26 27 discriminator 1
	movq	%rax, global_conn_table(%rip)
	.loc 1 27 13
	movq	global_conn_table(%rip), %rax
	.loc 1 27 12
	testq	%rax, %rax
	jne	.L3
	.loc 1 28 20
	movl	$0, %eax
	jmp	.L4
.L3:
	.loc 1 30 33
	movq	global_conn_table(%rip), %rax
	.loc 1 30 9
	movl	$8192, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 33 15
	movq	global_conn_table(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L5
.L2:
	.loc 1 35 17
	movl	$8192, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	.loc 1 36 12
	cmpq	$0, -8(%rbp)
	jne	.L6
	.loc 1 37 20
	movl	$0, %eax
	jmp	.L4
.L6:
	.loc 1 39 21
	movq	-8(%rbp), %rax
	.loc 1 39 9
	movl	$8192, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.L5:
	.loc 1 44 8
	cmpl	$0, -20(%rbp)
	je	.L7
	.loc 1 44 19 discriminator 1
	movl	cleanup_thread_running(%rip), %eax
	.loc 1 44 16 discriminator 1
	testl	%eax, %eax
	jne	.L7
	.loc 1 45 32
	movl	$1, cleanup_thread_running(%rip)
	.loc 1 46 9
	movl	$0, %ecx
	leaq	connection_cleanup_thread(%rip), %rax
	movq	%rax, %rdx
	movl	$0, %esi
	leaq	cleanup_thread(%rip), %rax
	movq	%rax, %rdi
	call	pthread_create@PLT
	.loc 1 47 9
	movq	cleanup_thread(%rip), %rax
	movq	%rax, %rdi
	call	pthread_detach@PLT
.L7:
	.loc 1 50 12
	movq	-8(%rbp), %rax
.L4:
	.loc 1 51 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE320:
	.size	init_connection_table, .-init_connection_table
	.section	.rodata
	.align 8
.LC0:
	.string	"\033[35m[~] (%d) Cleanup: Closing idle connection to %s (idle for %ld seconds)\n\033[0m"
	.text
	.globl	connection_cleanup_thread
	.type	connection_cleanup_thread, @function
connection_cleanup_thread:
.LFB321:
	.loc 1 58 44
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$48, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -56(%rbp)
	.loc 1 59 11
	jmp	.L9
.L14:
.LBB2:
	.loc 1 61 9
	movl	$5, %edi
	call	sleep@PLT
	.loc 1 63 31
	movl	$0, %edi
	call	time@PLT
	movq	%rax, -32(%rbp)
.LBB3:
	.loc 1 67 18
	movl	$0, -36(%rbp)
	.loc 1 67 9
	jmp	.L10
.L13:
.LBB4:
	.loc 1 68 58
	movq	global_conn_table(%rip), %rax
	.loc 1 68 33
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	movq	(%rax,%rdx,8), %rax
	movq	%rax, -24(%rbp)
	.loc 1 69 16
	cmpq	$0, -24(%rbp)
	je	.L11
	.loc 1 69 39 discriminator 1
	movq	-24(%rbp), %rax
	movq	40(%rax), %rax
	.loc 1 69 31 discriminator 1
	testq	%rax, %rax
	je	.L11
	.loc 1 71 41
	movq	-24(%rbp), %rax
	movq	56(%rax), %rax
	.loc 1 71 34
	movq	-32(%rbp), %rdx
	subq	%rax, %rdx
	.loc 1 71 20
	cmpq	$9, %rdx
	jle	.L11
	.loc 1 75 75
	movq	-24(%rbp), %rax
	movq	56(%rax), %rax
	.loc 1 74 21
	movq	-32(%rbp), %rdx
	subq	%rax, %rdx
	movq	%rdx, %r12
	movq	-24(%rbp), %rax
	movq	40(%rax), %rbx
	call	gettid@PLT
	.loc 1 74 21 is_stmt 0 discriminator 1
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 77 21 is_stmt 1
	movq	-24(%rbp), %rax
	movl	48(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 78 29
	movq	-24(%rbp), %rax
	movq	40(%rax), %rax
	.loc 1 78 23
	testq	%rax, %rax
	je	.L12
	.loc 1 79 35
	movq	-24(%rbp), %rax
	movq	40(%rax), %rax
	.loc 1 79 25
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 80 41
	movq	-24(%rbp), %rax
	movq	$0, 40(%rax)
.L12:
	.loc 1 82 23
	cmpq	$0, -24(%rbp)
	je	.L11
	.loc 1 83 25
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 84 31
	movq	$0, -24(%rbp)
.L11:
.LBE4:
	.loc 1 67 47 discriminator 2
	addl	$1, -36(%rbp)
.L10:
	.loc 1 67 27 discriminator 1
	cmpl	$1023, -36(%rbp)
	jle	.L13
.L9:
.LBE3:
.LBE2:
	.loc 1 59 12
	movl	cleanup_thread_running(%rip), %eax
	testl	%eax, %eax
	jne	.L14
	.loc 1 93 12
	movl	$0, %eax
	.loc 1 94 1
	addq	$48, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE321:
	.size	connection_cleanup_thread, .-connection_cleanup_thread
	.section	.rodata
	.align 8
.LC1:
	.string	"\033[32m[+] (%d) Socket fd Saved connection to %s (socket %d)\n\033[0m"
	.text
	.globl	save_connection
	.type	save_connection, @function
save_connection:
.LFB322:
	.loc 1 103 76
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
	.loc 1 104 54
	cmpq	$0, -40(%rbp)
	je	.L17
	.loc 1 104 54 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax
	jmp	.L18
.L17:
	.loc 1 104 54 discriminator 2
	movq	global_conn_table(%rip), %rax
.L18:
	.loc 1 104 25 is_stmt 1 discriminator 4
	movq	%rax, -24(%rbp)
	.loc 1 106 8
	cmpq	$0, -48(%rbp)
	je	.L19
	.loc 1 106 19 discriminator 1
	cmpl	$0, -52(%rbp)
	jns	.L20
.L19:
	.loc 1 107 16
	movl	$-1, %eax
	jmp	.L21
.L20:
	.loc 1 110 41
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 110 23 discriminator 1
	movl	%eax, %edx
	movq	-48(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	str2md5@PLT
	movq	%rax, -16(%rbp)
	.loc 1 111 8
	cmpq	$0, -16(%rbp)
	jne	.L22
	.loc 1 112 16
	movl	$-1, %eax
	jmp	.L21
.L22:
	.loc 1 115 26
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	hash_index@PLT
	movl	%eax, -28(%rbp)
	.loc 1 118 33
	movl	$64, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	.loc 1 119 8
	cmpq	$0, -8(%rbp)
	jne	.L23
	.loc 1 120 9
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 121 16
	movl	$-1, %eax
	jmp	.L21
.L23:
	.loc 1 124 18
	movq	-8(%rbp), %rax
	.loc 1 124 5
	movq	-16(%rbp), %rcx
	movl	$33, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	.loc 1 125 23
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	.loc 1 125 21 discriminator 1
	movq	-8(%rbp), %rax
	movq	%rdx, 40(%rax)
	.loc 1 126 19
	movq	-8(%rbp), %rax
	movl	-52(%rbp), %edx
	movl	%edx, 48(%rax)
	.loc 1 127 24
	movl	$0, %edi
	call	time@PLT
	.loc 1 127 22 discriminator 1
	movq	-8(%rbp), %rdx
	movq	%rax, 56(%rdx)
	.loc 1 129 5
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 135 34
	movq	-24(%rbp), %rax
	movl	-28(%rbp), %edx
	movq	-8(%rbp), %rcx
	movq	%rcx, (%rax,%rdx,8)
	.loc 1 139 5
	call	gettid@PLT
	movl	%eax, %esi
	.loc 1 139 5 is_stmt 0 discriminator 1
	movl	-52(%rbp), %edx
	movq	-48(%rbp), %rax
	movl	%edx, %ecx
	movq	%rax, %rdx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 140 12 is_stmt 1
	movl	$0, %eax
.L21:
	.loc 1 141 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE322:
	.size	save_connection, .-save_connection
	.section	.rodata
	.align 8
.LC2:
	.string	"\033[32m[+][Connection] Found existing connection to %s (socket %d)\n\033[0m"
	.align 8
.LC3:
	.string	"\033[33m[-] (%d) Connection not found to %s (socket %d)\n\033[0m"
	.text
	.globl	get_connection
	.type	get_connection, @function
get_connection:
.LFB323:
	.loc 1 149 63
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	.loc 1 150 54
	cmpq	$0, -40(%rbp)
	je	.L25
	.loc 1 150 54 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax
	jmp	.L26
.L25:
	.loc 1 150 54 discriminator 2
	movq	global_conn_table(%rip), %rax
.L26:
	.loc 1 150 25 is_stmt 1 discriminator 4
	movq	%rax, -24(%rbp)
	.loc 1 151 9
	movl	$-1, -32(%rbp)
	.loc 1 153 8
	cmpq	$0, -48(%rbp)
	jne	.L27
	.loc 1 154 16
	movl	$-1, %eax
	jmp	.L28
.L27:
	.loc 1 157 41
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 157 23 discriminator 1
	movl	%eax, %edx
	movq	-48(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	str2md5@PLT
	movq	%rax, -16(%rbp)
	.loc 1 158 8
	cmpq	$0, -16(%rbp)
	jne	.L29
	.loc 1 159 16
	movl	$-1, %eax
	jmp	.L28
.L29:
	.loc 1 162 26
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	hash_index@PLT
	movl	%eax, -28(%rbp)
	.loc 1 167 25
	movq	-24(%rbp), %rax
	movl	-28(%rbp), %edx
	movq	(%rax,%rdx,8), %rax
	movq	%rax, -8(%rbp)
	.loc 1 168 8
	cmpq	$0, -8(%rbp)
	je	.L30
	.loc 1 168 15 discriminator 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L30
	.loc 1 169 25
	movq	-8(%rbp), %rax
	.loc 1 169 13
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 169 12 discriminator 1
	testl	%eax, %eax
	jne	.L30
	.loc 1 171 32
	movl	$0, %edi
	call	time@PLT
	.loc 1 171 30 discriminator 1
	movq	-8(%rbp), %rdx
	movq	%rax, 56(%rdx)
	.loc 1 172 20
	movq	-8(%rbp), %rax
	movl	48(%rax), %eax
	movl	%eax, -32(%rbp)
.L30:
	.loc 1 177 5
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 179 8
	cmpl	$-1, -32(%rbp)
	je	.L31
	.loc 1 180 9
	movl	-32(%rbp), %edx
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L32
.L31:
	.loc 1 183 9
	call	gettid@PLT
	movl	%eax, %esi
	.loc 1 183 9 is_stmt 0 discriminator 1
	movl	-32(%rbp), %edx
	movq	-48(%rbp), %rax
	movl	%edx, %ecx
	movq	%rax, %rdx
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L32:
	.loc 1 186 12 is_stmt 1
	movl	-32(%rbp), %eax
.L28:
	.loc 1 187 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE323:
	.size	get_connection, .-get_connection
	.section	.rodata
	.align 8
.LC4:
	.string	"[+] (%d) Socket connection closed socket %d\n"
	.text
	.globl	remove_connection
	.type	remove_connection, @function
remove_connection:
.LFB324:
	.loc 1 196 84
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
	.loc 1 197 54
	cmpq	$0, -40(%rbp)
	je	.L34
	.loc 1 197 54 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax
	jmp	.L35
.L34:
	.loc 1 197 54 discriminator 2
	movq	global_conn_table(%rip), %rax
.L35:
	.loc 1 197 25 is_stmt 1 discriminator 4
	movq	%rax, -24(%rbp)
	.loc 1 198 9
	movl	$-1, -32(%rbp)
	.loc 1 200 8
	cmpq	$0, -48(%rbp)
	jne	.L36
	.loc 1 201 16
	movl	$-1, %eax
	jmp	.L37
.L36:
	.loc 1 204 41
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 204 23 discriminator 1
	movl	%eax, %edx
	movq	-48(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	str2md5@PLT
	movq	%rax, -16(%rbp)
	.loc 1 205 8
	cmpq	$0, -16(%rbp)
	jne	.L38
	.loc 1 206 16
	movl	$-1, %eax
	jmp	.L37
.L38:
	.loc 1 209 26
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	hash_index@PLT
	movl	%eax, -28(%rbp)
	.loc 1 215 25
	movq	-24(%rbp), %rax
	movl	-28(%rbp), %edx
	movq	(%rax,%rdx,8), %rax
	movq	%rax, -8(%rbp)
	.loc 1 217 8
	cmpq	$0, -8(%rbp)
	je	.L39
	.loc 1 217 15 discriminator 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L39
	.loc 1 218 25
	movq	-8(%rbp), %rax
	.loc 1 218 13
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 218 12 discriminator 1
	testl	%eax, %eax
	jne	.L39
	.loc 1 219 20
	movq	-8(%rbp), %rax
	movl	48(%rax), %eax
	movl	%eax, -32(%rbp)
	.loc 1 220 23
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	.loc 1 220 13
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 221 13
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L39:
	.loc 1 226 5
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 228 8
	cmpl	$-1, -32(%rbp)
	je	.L40
	.loc 1 232 12
	cmpl	$0, -52(%rbp)
	je	.L40
	.loc 1 233 13
	movl	-32(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 234 13
	call	gettid@PLT
	movl	%eax, %ecx
	.loc 1 234 13 is_stmt 0 discriminator 1
	movl	-32(%rbp), %eax
	movl	%eax, %edx
	movl	%ecx, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L40:
	.loc 1 238 12 is_stmt 1
	movl	-32(%rbp), %eax
.L37:
	.loc 1 239 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE324:
	.size	remove_connection, .-remove_connection
	.globl	cleanup_connection_table
	.type	cleanup_connection_table, @function
cleanup_connection_table:
.LFB325:
	.loc 1 245 58
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	.loc 1 246 54
	cmpq	$0, -40(%rbp)
	je	.L42
	.loc 1 246 54 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax
	jmp	.L43
.L42:
	.loc 1 246 54 discriminator 2
	movq	global_conn_table(%rip), %rax
.L43:
	.loc 1 246 25 is_stmt 1 discriminator 4
	movq	%rax, -16(%rbp)
	.loc 1 248 8
	cmpq	$0, -16(%rbp)
	je	.L50
	.loc 1 254 22
	movq	global_conn_table(%rip), %rax
	.loc 1 254 8
	cmpq	%rax, -16(%rbp)
	jne	.L46
	.loc 1 255 32
	movl	$0, cleanup_thread_running(%rip)
.L46:
.LBB5:
	.loc 1 259 14
	movl	$0, -20(%rbp)
	.loc 1 259 5
	jmp	.L47
.L49:
.LBB6:
	.loc 1 260 29
	movq	-16(%rbp), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	movq	(%rax,%rdx,8), %rax
	movq	%rax, -8(%rbp)
	.loc 1 261 12
	cmpq	$0, -8(%rbp)
	je	.L48
	.loc 1 264 13
	movq	-8(%rbp), %rax
	movl	48(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 265 23
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	.loc 1 265 13
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 266 13
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L48:
	.loc 1 268 34
	movq	-16(%rbp), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	movq	$0, (%rax,%rdx,8)
.LBE6:
	.loc 1 259 43 discriminator 2
	addl	$1, -20(%rbp)
.L47:
	.loc 1 259 23 discriminator 1
	cmpl	$1023, -20(%rbp)
	jle	.L49
.LBE5:
	.loc 1 274 22
	movq	global_conn_table(%rip), %rax
	.loc 1 274 8
	cmpq	%rax, -16(%rbp)
	je	.L41
	.loc 1 276 9
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	jmp	.L41
.L50:
	.loc 1 249 9
	nop
.L41:
	.loc 1 278 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE325:
	.size	cleanup_connection_table, .-cleanup_connection_table
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/14/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/time_t.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.file 6 "includes/connections.h"
	.file 7 "/usr/include/string.h"
	.file 8 "includes/cache.h"
	.file 9 "/usr/include/unistd.h"
	.file 10 "/usr/include/stdio.h"
	.file 11 "/usr/include/time.h"
	.file 12 "/usr/include/pthread.h"
	.file 13 "/usr/include/stdlib.h"
	.file 14 "/usr/include/x86_64-linux-gnu/bits/unistd_ext.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x694
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x11
	.long	.LASF60
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
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x12
	.byte	0x8
	.uleb128 0xc
	.long	0x48
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x13
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x5
	.long	.LASF10
	.byte	0x3
	.byte	0x9a
	.byte	0x19
	.long	0x6b
	.uleb128 0x5
	.long	.LASF11
	.byte	0x3
	.byte	0xa0
	.byte	0x1a
	.long	0x72
	.uleb128 0x6
	.long	0x96
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF12
	.uleb128 0xe
	.long	0x96
	.uleb128 0x6
	.long	0x9d
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF13
	.uleb128 0x5
	.long	.LASF14
	.byte	0x4
	.byte	0xa
	.byte	0x12
	.long	0x85
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF15
	.uleb128 0x5
	.long	.LASF16
	.byte	0x5
	.byte	0x1b
	.byte	0x1b
	.long	0x3a
	.uleb128 0x14
	.long	.LASF19
	.byte	0x38
	.byte	0x5
	.byte	0x38
	.byte	0x7
	.long	0xf1
	.uleb128 0xf
	.long	.LASF17
	.byte	0x3a
	.byte	0x8
	.long	0xf1
	.uleb128 0xf
	.long	.LASF18
	.byte	0x3b
	.byte	0xc
	.long	0x72
	.byte	0
	.uleb128 0xd
	.long	0x96
	.long	0x101
	.uleb128 0x10
	.long	0x3a
	.byte	0x37
	.byte	0
	.uleb128 0x5
	.long	.LASF19
	.byte	0x5
	.byte	0x3e
	.byte	0x1e
	.long	0xcd
	.uleb128 0xe
	.long	0x101
	.uleb128 0x3
	.byte	0x10
	.byte	0x5
	.long	.LASF20
	.uleb128 0x3
	.byte	0x10
	.byte	0x7
	.long	.LASF21
	.uleb128 0x15
	.long	.LASF61
	.byte	0x40
	.byte	0x6
	.byte	0x5
	.byte	0x10
	.long	0x15e
	.uleb128 0x9
	.long	.LASF22
	.byte	0x6
	.byte	0xa
	.long	0x15e
	.byte	0
	.uleb128 0x9
	.long	.LASF23
	.byte	0x7
	.byte	0xb
	.long	0x91
	.byte	0x28
	.uleb128 0x9
	.long	.LASF24
	.byte	0x8
	.byte	0x9
	.long	0x6b
	.byte	0x30
	.uleb128 0x9
	.long	.LASF25
	.byte	0x9
	.byte	0xc
	.long	0xae
	.byte	0x38
	.byte	0
	.uleb128 0xd
	.long	0x96
	.long	0x16e
	.uleb128 0x10
	.long	0x3a
	.byte	0x20
	.byte	0
	.uleb128 0x5
	.long	.LASF26
	.byte	0x6
	.byte	0xa
	.byte	0x3
	.long	0x120
	.uleb128 0x16
	.value	0x2000
	.byte	0x6
	.byte	0xc
	.byte	0x9
	.long	0x191
	.uleb128 0x9
	.long	.LASF27
	.byte	0xd
	.byte	0x19
	.long	0x191
	.byte	0
	.byte	0
	.uleb128 0xd
	.long	0x1a2
	.long	0x1a2
	.uleb128 0x17
	.long	0x3a
	.value	0x3ff
	.byte	0
	.uleb128 0x6
	.long	0x16e
	.uleb128 0x5
	.long	.LASF28
	.byte	0x6
	.byte	0xe
	.byte	0x3
	.long	0x17a
	.uleb128 0x3
	.byte	0x10
	.byte	0x4
	.long	.LASF29
	.uleb128 0x18
	.long	0x48
	.long	0x1c9
	.uleb128 0x1
	.long	0x48
	.byte	0
	.uleb128 0x2
	.long	.LASF30
	.byte	0xd
	.byte	0x1c
	.long	0x1de
	.uleb128 0x9
	.byte	0x3
	.quad	global_conn_table
	.uleb128 0x6
	.long	0x1a7
	.uleb128 0x2
	.long	.LASF31
	.byte	0xe
	.byte	0x12
	.long	0xc1
	.uleb128 0x9
	.byte	0x3
	.quad	cleanup_thread
	.uleb128 0x2
	.long	.LASF32
	.byte	0xf
	.byte	0xc
	.long	0x6b
	.uleb128 0x9
	.byte	0x3
	.quad	cleanup_thread_running
	.uleb128 0x7
	.long	.LASF33
	.byte	0x7
	.byte	0x9c
	.byte	0xc
	.long	0x6b
	.long	0x228
	.uleb128 0x1
	.long	0xa2
	.uleb128 0x1
	.long	0xa2
	.byte	0
	.uleb128 0x7
	.long	.LASF34
	.byte	0x7
	.byte	0xbb
	.byte	0xe
	.long	0x91
	.long	0x23e
	.uleb128 0x1
	.long	0xa2
	.byte	0
	.uleb128 0x7
	.long	.LASF35
	.byte	0x7
	.byte	0x90
	.byte	0xe
	.long	0x91
	.long	0x25e
	.uleb128 0x1
	.long	0x91
	.uleb128 0x1
	.long	0xa2
	.uleb128 0x1
	.long	0x3a
	.byte	0
	.uleb128 0x7
	.long	.LASF36
	.byte	0x8
	.byte	0x16
	.byte	0xe
	.long	0x41
	.long	0x274
	.uleb128 0x1
	.long	0xa2
	.byte	0
	.uleb128 0x7
	.long	.LASF37
	.byte	0x8
	.byte	0x1b
	.byte	0x7
	.long	0x91
	.long	0x28f
	.uleb128 0x1
	.long	0x91
	.uleb128 0x1
	.long	0x6b
	.byte	0
	.uleb128 0x8
	.long	.LASF38
	.byte	0x7
	.value	0x197
	.byte	0xf
	.long	0x2e
	.long	0x2a6
	.uleb128 0x1
	.long	0xa2
	.byte	0
	.uleb128 0x19
	.long	.LASF62
	.byte	0xd
	.value	0x2af
	.byte	0xd
	.long	0x2b9
	.uleb128 0x1
	.long	0x48
	.byte	0
	.uleb128 0x8
	.long	.LASF39
	.byte	0x9
	.value	0x166
	.byte	0xc
	.long	0x6b
	.long	0x2d0
	.uleb128 0x1
	.long	0x6b
	.byte	0
	.uleb128 0x8
	.long	.LASF40
	.byte	0xa
	.value	0x16b
	.byte	0xc
	.long	0x6b
	.long	0x2e8
	.uleb128 0x1
	.long	0xa2
	.uleb128 0x1a
	.byte	0
	.uleb128 0x1b
	.long	.LASF63
	.byte	0xe
	.byte	0x22
	.byte	0x10
	.long	0x79
	.uleb128 0x7
	.long	.LASF41
	.byte	0xb
	.byte	0x4c
	.byte	0xf
	.long	0xae
	.long	0x30a
	.uleb128 0x1
	.long	0x30a
	.byte	0
	.uleb128 0x6
	.long	0xae
	.uleb128 0x8
	.long	.LASF42
	.byte	0x9
	.value	0x1d0
	.byte	0x15
	.long	0x41
	.long	0x326
	.uleb128 0x1
	.long	0x41
	.byte	0
	.uleb128 0x8
	.long	.LASF43
	.byte	0xc
	.value	0x10d
	.byte	0xc
	.long	0x6b
	.long	0x33d
	.uleb128 0x1
	.long	0xc1
	.byte	0
	.uleb128 0x7
	.long	.LASF44
	.byte	0xc
	.byte	0xca
	.byte	0xc
	.long	0x6b
	.long	0x362
	.uleb128 0x1
	.long	0x367
	.uleb128 0x1
	.long	0x371
	.uleb128 0x1
	.long	0x376
	.uleb128 0x1
	.long	0x4a
	.byte	0
	.uleb128 0x6
	.long	0xc1
	.uleb128 0xc
	.long	0x362
	.uleb128 0x6
	.long	0x10d
	.uleb128 0xc
	.long	0x36c
	.uleb128 0x6
	.long	0x1ba
	.uleb128 0x7
	.long	.LASF45
	.byte	0x7
	.byte	0x3d
	.byte	0xe
	.long	0x48
	.long	0x39b
	.uleb128 0x1
	.long	0x48
	.uleb128 0x1
	.long	0x6b
	.uleb128 0x1
	.long	0x3a
	.byte	0
	.uleb128 0x8
	.long	.LASF46
	.byte	0xd
	.value	0x2a0
	.byte	0xe
	.long	0x48
	.long	0x3b2
	.uleb128 0x1
	.long	0x3a
	.byte	0
	.uleb128 0x1c
	.long	.LASF57
	.byte	0x1
	.byte	0xf5
	.byte	0x6
	.quad	.LFB325
	.quad	.LFE325-.LFB325
	.uleb128 0x1
	.byte	0x9c
	.long	0x42f
	.uleb128 0x4
	.long	.LASF49
	.byte	0xf5
	.byte	0x33
	.long	0x1de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x2
	.long	.LASF47
	.byte	0xf6
	.byte	0x19
	.long	0x1de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xa
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x1d
	.string	"i"
	.byte	0x1
	.value	0x103
	.byte	0xe
	.long	0x6b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xa
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.uleb128 0x1e
	.long	.LASF48
	.byte	0x1
	.value	0x104
	.byte	0x1d
	.long	0x1a2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xb
	.long	.LASF52
	.byte	0xc4
	.byte	0x5
	.long	0x6b
	.quad	.LFB324
	.quad	.LFE324-.LFB324
	.uleb128 0x1
	.byte	0x9c
	.long	0x4c2
	.uleb128 0x4
	.long	.LASF49
	.byte	0xc4
	.byte	0x2b
	.long	0x1de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x4
	.long	.LASF23
	.byte	0xc4
	.byte	0x38
	.long	0x91
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x4
	.long	.LASF50
	.byte	0xc4
	.byte	0x46
	.long	0x6b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x2
	.long	.LASF47
	.byte	0xc5
	.byte	0x19
	.long	0x1de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.long	.LASF24
	.byte	0xc6
	.byte	0x9
	.long	0x6b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2
	.long	.LASF22
	.byte	0xcc
	.byte	0xb
	.long	0x91
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.long	.LASF51
	.byte	0xd1
	.byte	0x12
	.long	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x2
	.long	.LASF48
	.byte	0xd7
	.byte	0x19
	.long	0x1a2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xb
	.long	.LASF53
	.byte	0x95
	.byte	0x5
	.long	0x6b
	.quad	.LFB323
	.quad	.LFE323-.LFB323
	.uleb128 0x1
	.byte	0x9c
	.long	0x546
	.uleb128 0x4
	.long	.LASF49
	.byte	0x95
	.byte	0x28
	.long	0x1de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x4
	.long	.LASF23
	.byte	0x95
	.byte	0x35
	.long	0x91
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x2
	.long	.LASF47
	.byte	0x96
	.byte	0x19
	.long	0x1de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.long	.LASF24
	.byte	0x97
	.byte	0x9
	.long	0x6b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2
	.long	.LASF22
	.byte	0x9d
	.byte	0xb
	.long	0x91
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.long	.LASF51
	.byte	0xa2
	.byte	0x12
	.long	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x2
	.long	.LASF48
	.byte	0xa7
	.byte	0x19
	.long	0x1a2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xb
	.long	.LASF54
	.byte	0x67
	.byte	0x5
	.long	0x6b
	.quad	.LFB322
	.quad	.LFE322-.LFB322
	.uleb128 0x1
	.byte	0x9c
	.long	0x5cb
	.uleb128 0x4
	.long	.LASF49
	.byte	0x67
	.byte	0x29
	.long	0x1de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x4
	.long	.LASF23
	.byte	0x67
	.byte	0x36
	.long	0x91
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x4
	.long	.LASF24
	.byte	0x67
	.byte	0x44
	.long	0x6b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x2
	.long	.LASF47
	.byte	0x68
	.byte	0x19
	.long	0x1de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.long	.LASF22
	.byte	0x6e
	.byte	0xb
	.long	0x91
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.long	.LASF51
	.byte	0x73
	.byte	0x12
	.long	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x2
	.long	.LASF48
	.byte	0x76
	.byte	0x19
	.long	0x1a2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xb
	.long	.LASF55
	.byte	0x3a
	.byte	0x7
	.long	0x48
	.quad	.LFB321
	.quad	.LFE321-.LFB321
	.uleb128 0x1
	.byte	0x9c
	.long	0x65c
	.uleb128 0x1f
	.string	"arg"
	.byte	0x1
	.byte	0x3a
	.byte	0x27
	.long	0x48
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0xa
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x2
	.long	.LASF56
	.byte	0x3f
	.byte	0x10
	.long	0xae
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xa
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x20
	.string	"i"
	.byte	0x1
	.byte	0x43
	.byte	0x12
	.long	0x6b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0xa
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x2
	.long	.LASF48
	.byte	0x44
	.byte	0x21
	.long	0x1a2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x21
	.long	.LASF58
	.byte	0x1
	.byte	0x16
	.byte	0x15
	.long	0x1de
	.quad	.LFB320
	.quad	.LFE320-.LFB320
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.long	.LASF59
	.byte	0x16
	.byte	0x2f
	.long	0x6b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x2
	.long	.LASF49
	.byte	0x17
	.byte	0x19
	.long	0x1de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
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
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 6
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
	.uleb128 0xa
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
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
	.uleb128 0xc
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
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
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 5
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0x13
	.byte	0x1
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
	.uleb128 0x17
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x20
	.uleb128 0x34
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
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF39:
	.string	"close"
.LASF35:
	.string	"strncpy"
.LASF25:
	.string	"timestamp"
.LASF50:
	.string	"close_socket"
.LASF32:
	.string	"cleanup_thread_running"
.LASF53:
	.string	"get_connection"
.LASF56:
	.string	"current_time"
.LASF63:
	.string	"gettid"
.LASF9:
	.string	"size_t"
.LASF60:
	.string	"GNU C17 14.2.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF10:
	.string	"__pid_t"
.LASF13:
	.string	"long long int"
.LASF20:
	.string	"__int128"
.LASF18:
	.string	"__align"
.LASF14:
	.string	"time_t"
.LASF59:
	.string	"global"
.LASF51:
	.string	"index"
.LASF22:
	.string	"host_hash"
.LASF49:
	.string	"table"
.LASF62:
	.string	"free"
.LASF7:
	.string	"short int"
.LASF23:
	.string	"hostname"
.LASF31:
	.string	"cleanup_thread"
.LASF21:
	.string	"__int128 unsigned"
.LASF46:
	.string	"malloc"
.LASF44:
	.string	"pthread_create"
.LASF24:
	.string	"sockfd"
.LASF8:
	.string	"long int"
.LASF40:
	.string	"printf"
.LASF43:
	.string	"pthread_detach"
.LASF36:
	.string	"hash_index"
.LASF29:
	.string	"long double"
.LASF27:
	.string	"buckets"
.LASF48:
	.string	"entry"
.LASF4:
	.string	"unsigned char"
.LASF61:
	.string	"connection_entry"
.LASF54:
	.string	"save_connection"
.LASF6:
	.string	"signed char"
.LASF15:
	.string	"long long unsigned int"
.LASF58:
	.string	"init_connection_table"
.LASF3:
	.string	"unsigned int"
.LASF41:
	.string	"time"
.LASF17:
	.string	"__size"
.LASF5:
	.string	"short unsigned int"
.LASF12:
	.string	"char"
.LASF28:
	.string	"connection_table_t"
.LASF38:
	.string	"strlen"
.LASF55:
	.string	"connection_cleanup_thread"
.LASF30:
	.string	"global_conn_table"
.LASF47:
	.string	"table_to_use"
.LASF2:
	.string	"long unsigned int"
.LASF11:
	.string	"__time_t"
.LASF33:
	.string	"strcmp"
.LASF45:
	.string	"memset"
.LASF37:
	.string	"str2md5"
.LASF34:
	.string	"strdup"
.LASF52:
	.string	"remove_connection"
.LASF19:
	.string	"pthread_attr_t"
.LASF57:
	.string	"cleanup_connection_table"
.LASF16:
	.string	"pthread_t"
.LASF26:
	.string	"connection_entry_t"
.LASF42:
	.string	"sleep"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/parth/Work/All_data/university/Network System/Assignments/PA3"
.LASF0:
	.string	"src/connections.c"
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
