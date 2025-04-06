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
	.string	"[Cleanup] Closing idle connection to %s (idle for %ld seconds)\n"
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
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	.loc 1 59 11
	jmp	.L9
.L18:
.LBB2:
	.loc 1 61 9
	movl	$5, %edi
	call	sleep@PLT
	.loc 1 63 31
	movl	$0, %edi
	call	time@PLT
	movq	%rax, -16(%rbp)
.LBB3:
	.loc 1 67 18
	movl	$0, -36(%rbp)
	.loc 1 67 9
	jmp	.L10
.L17:
.LBB4:
	.loc 1 68 33
	movq	$0, -32(%rbp)
	.loc 1 69 58
	movq	global_conn_table(%rip), %rax
	.loc 1 69 33
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	movq	(%rax,%rdx,8), %rax
	movq	%rax, -24(%rbp)
	.loc 1 71 19
	jmp	.L11
.L16:
	.loc 1 73 41
	movq	-24(%rbp), %rax
	movq	56(%rax), %rax
	.loc 1 73 34
	movq	-16(%rbp), %rdx
	subq	%rax, %rdx
	.loc 1 73 20
	cmpq	$10, %rdx
	jle	.L12
.LBB5:
	.loc 1 75 24
	cmpq	$0, -32(%rbp)
	je	.L13
	.loc 1 76 43
	movq	-24(%rbp), %rax
	movq	64(%rax), %rdx
	.loc 1 76 36
	movq	-32(%rbp), %rax
	movq	%rdx, 64(%rax)
	jmp	.L14
.L13:
	.loc 1 78 42
	movq	global_conn_table(%rip), %rax
	.loc 1 78 62
	movq	-24(%rbp), %rdx
	movq	64(%rdx), %rcx
	.loc 1 78 55
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	movq	%rcx, (%rax,%rdx,8)
.L14:
	.loc 1 83 65
	movq	-24(%rbp), %rax
	movq	56(%rax), %rax
	.loc 1 82 21
	movq	-16(%rbp), %rdx
	subq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 85 21
	movq	-24(%rbp), %rax
	movl	48(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 86 31
	movq	-24(%rbp), %rax
	movq	40(%rax), %rax
	.loc 1 86 21
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 88 41
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	.loc 1 89 27
	movq	-24(%rbp), %rax
	movq	64(%rax), %rax
	movq	%rax, -24(%rbp)
	.loc 1 90 21
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.LBE5:
	jmp	.L11
.L12:
	.loc 1 92 26
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)
	.loc 1 93 27
	movq	-24(%rbp), %rax
	movq	64(%rax), %rax
	movq	%rax, -24(%rbp)
.L11:
	.loc 1 71 20
	cmpq	$0, -24(%rbp)
	jne	.L16
.LBE4:
	.loc 1 67 47 discriminator 2
	addl	$1, -36(%rbp)
.L10:
	.loc 1 67 27 discriminator 1
	cmpl	$1023, -36(%rbp)
	jle	.L17
.L9:
.LBE3:
.LBE2:
	.loc 1 59 12
	movl	cleanup_thread_running(%rip), %eax
	testl	%eax, %eax
	jne	.L18
	.loc 1 101 12
	movl	$0, %eax
	.loc 1 102 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE321:
	.size	connection_cleanup_thread, .-connection_cleanup_thread
	.section	.rodata
	.align 8
.LC1:
	.string	"\033[32m[+][Connection] Saved connection to %s (socket %d)\n\033[0m"
	.text
	.globl	save_connection
	.type	save_connection, @function
save_connection:
.LFB322:
	.loc 1 111 76
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
	.loc 1 112 54
	cmpq	$0, -40(%rbp)
	je	.L21
	.loc 1 112 54 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax
	jmp	.L22
.L21:
	.loc 1 112 54 discriminator 2
	movq	global_conn_table(%rip), %rax
.L22:
	.loc 1 112 25 is_stmt 1 discriminator 4
	movq	%rax, -24(%rbp)
	.loc 1 114 8
	cmpq	$0, -48(%rbp)
	je	.L23
	.loc 1 114 19 discriminator 1
	cmpl	$0, -52(%rbp)
	jns	.L24
.L23:
	.loc 1 115 16
	movl	$-1, %eax
	jmp	.L25
.L24:
	.loc 1 118 41
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 118 23 discriminator 1
	movl	%eax, %edx
	movq	-48(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	str2md5@PLT
	movq	%rax, -16(%rbp)
	.loc 1 119 8
	cmpq	$0, -16(%rbp)
	jne	.L26
	.loc 1 120 16
	movl	$-1, %eax
	jmp	.L25
.L26:
	.loc 1 123 26
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	hash_index@PLT
	movl	%eax, -28(%rbp)
	.loc 1 126 33
	movl	$72, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	.loc 1 127 8
	cmpq	$0, -8(%rbp)
	jne	.L27
	.loc 1 128 9
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 129 16
	movl	$-1, %eax
	jmp	.L25
.L27:
	.loc 1 132 18
	movq	-8(%rbp), %rax
	.loc 1 132 5
	movq	-16(%rbp), %rcx
	movl	$33, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	.loc 1 133 23
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	.loc 1 133 21 discriminator 1
	movq	-8(%rbp), %rax
	movq	%rdx, 40(%rax)
	.loc 1 134 19
	movq	-8(%rbp), %rax
	movl	-52(%rbp), %edx
	movl	%edx, 48(%rax)
	.loc 1 135 24
	movl	$0, %edi
	call	time@PLT
	.loc 1 135 22 discriminator 1
	movq	-8(%rbp), %rdx
	movq	%rax, 56(%rdx)
	.loc 1 136 17
	movq	-8(%rbp), %rax
	movq	$0, 64(%rax)
	.loc 1 138 5
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 144 40
	movq	-24(%rbp), %rax
	movl	-28(%rbp), %edx
	movq	(%rax,%rdx,8), %rdx
	.loc 1 144 17
	movq	-8(%rbp), %rax
	movq	%rdx, 64(%rax)
	.loc 1 145 34
	movq	-24(%rbp), %rax
	movl	-28(%rbp), %edx
	movq	-8(%rbp), %rcx
	movq	%rcx, (%rax,%rdx,8)
	.loc 1 149 5
	movl	-52(%rbp), %edx
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 150 12
	movl	$0, %eax
.L25:
	.loc 1 151 1
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
	.string	"\033[31m[-] Connection not found to %s (socket %d)\n\033[0m"
	.text
	.globl	get_connection
	.type	get_connection, @function
get_connection:
.LFB323:
	.loc 1 159 63
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
	.loc 1 160 54
	cmpq	$0, -40(%rbp)
	je	.L29
	.loc 1 160 54 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax
	jmp	.L30
.L29:
	.loc 1 160 54 discriminator 2
	movq	global_conn_table(%rip), %rax
.L30:
	.loc 1 160 25 is_stmt 1 discriminator 4
	movq	%rax, -16(%rbp)
	.loc 1 161 9
	movl	$-1, -32(%rbp)
	.loc 1 163 8
	cmpq	$0, -48(%rbp)
	jne	.L31
	.loc 1 164 16
	movl	$-1, %eax
	jmp	.L32
.L31:
	.loc 1 167 41
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 167 23 discriminator 1
	movl	%eax, %edx
	movq	-48(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	str2md5@PLT
	movq	%rax, -8(%rbp)
	.loc 1 168 8
	cmpq	$0, -8(%rbp)
	jne	.L33
	.loc 1 169 16
	movl	$-1, %eax
	jmp	.L32
.L33:
	.loc 1 172 26
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	hash_index@PLT
	movl	%eax, -28(%rbp)
	.loc 1 177 25
	movq	-16(%rbp), %rax
	movl	-28(%rbp), %edx
	movq	(%rax,%rdx,8), %rax
	movq	%rax, -24(%rbp)
	.loc 1 178 11
	jmp	.L34
.L37:
	.loc 1 179 25
	movq	-24(%rbp), %rax
	.loc 1 179 13
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 179 12 discriminator 1
	testl	%eax, %eax
	jne	.L35
	.loc 1 181 32
	movl	$0, %edi
	call	time@PLT
	.loc 1 181 30 discriminator 1
	movq	-24(%rbp), %rdx
	movq	%rax, 56(%rdx)
	.loc 1 182 20
	movq	-24(%rbp), %rax
	movl	48(%rax), %eax
	movl	%eax, -32(%rbp)
	.loc 1 183 13
	jmp	.L36
.L35:
	.loc 1 185 15
	movq	-24(%rbp), %rax
	movq	64(%rax), %rax
	movq	%rax, -24(%rbp)
.L34:
	.loc 1 178 18
	cmpq	$0, -24(%rbp)
	je	.L36
	.loc 1 178 18 is_stmt 0 discriminator 1
	movq	-24(%rbp), %rax
	testq	%rax, %rax
	jne	.L37
.L36:
	.loc 1 189 5 is_stmt 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 191 8
	cmpl	$-1, -32(%rbp)
	je	.L38
	.loc 1 192 9
	movl	-32(%rbp), %edx
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L39
.L38:
	.loc 1 195 9
	movl	-32(%rbp), %edx
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L39:
	.loc 1 198 12
	movl	-32(%rbp), %eax
.L32:
	.loc 1 199 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE323:
	.size	get_connection, .-get_connection
	.section	.rodata
	.align 8
.LC4:
	.string	"[Connection] Removed connection to %s (socket %d)\n"
	.align 8
.LC5:
	.string	"[Connection] Closed socket %d\n"
	.text
	.globl	remove_connection
	.type	remove_connection, @function
remove_connection:
.LFB324:
	.loc 1 208 84
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	.loc 1 209 54
	cmpq	$0, -56(%rbp)
	je	.L41
	.loc 1 209 54 is_stmt 0 discriminator 1
	movq	-56(%rbp), %rax
	jmp	.L42
.L41:
	.loc 1 209 54 discriminator 2
	movq	global_conn_table(%rip), %rax
.L42:
	.loc 1 209 25 is_stmt 1 discriminator 4
	movq	%rax, -16(%rbp)
	.loc 1 210 9
	movl	$-1, -40(%rbp)
	.loc 1 212 8
	cmpq	$0, -64(%rbp)
	jne	.L43
	.loc 1 213 16
	movl	$-1, %eax
	jmp	.L44
.L43:
	.loc 1 216 41
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 216 23 discriminator 1
	movl	%eax, %edx
	movq	-64(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	str2md5@PLT
	movq	%rax, -8(%rbp)
	.loc 1 217 8
	cmpq	$0, -8(%rbp)
	jne	.L45
	.loc 1 218 16
	movl	$-1, %eax
	jmp	.L44
.L45:
	.loc 1 221 26
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	hash_index@PLT
	movl	%eax, -36(%rbp)
	.loc 1 226 25
	movq	$0, -32(%rbp)
	.loc 1 227 25
	movq	-16(%rbp), %rax
	movl	-36(%rbp), %edx
	movq	(%rax,%rdx,8), %rax
	movq	%rax, -24(%rbp)
	.loc 1 229 11
	jmp	.L46
.L51:
	.loc 1 230 25
	movq	-24(%rbp), %rax
	.loc 1 230 13
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 230 12 discriminator 1
	testl	%eax, %eax
	jne	.L47
	.loc 1 232 16
	cmpq	$0, -32(%rbp)
	je	.L48
	.loc 1 233 35
	movq	-24(%rbp), %rax
	movq	64(%rax), %rdx
	.loc 1 233 28
	movq	-32(%rbp), %rax
	movq	%rdx, 64(%rax)
	jmp	.L49
.L48:
	.loc 1 235 53
	movq	-24(%rbp), %rax
	movq	64(%rax), %rcx
	.loc 1 235 46
	movq	-16(%rbp), %rax
	movl	-36(%rbp), %edx
	movq	%rcx, (%rax,%rdx,8)
.L49:
	.loc 1 238 20
	movq	-24(%rbp), %rax
	movl	48(%rax), %eax
	movl	%eax, -40(%rbp)
	.loc 1 239 23
	movq	-24(%rbp), %rax
	movq	40(%rax), %rax
	.loc 1 239 13
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 240 13
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 241 13
	jmp	.L50
.L47:
	.loc 1 244 14
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)
	.loc 1 245 15
	movq	-24(%rbp), %rax
	movq	64(%rax), %rax
	movq	%rax, -24(%rbp)
.L46:
	.loc 1 229 12
	cmpq	$0, -24(%rbp)
	jne	.L51
.L50:
	.loc 1 249 5
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 251 8
	cmpl	$-1, -40(%rbp)
	je	.L52
	.loc 1 252 9
	movl	-40(%rbp), %edx
	movq	-64(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 255 12
	cmpl	$0, -68(%rbp)
	je	.L52
	.loc 1 256 13
	movl	-40(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 257 13
	movl	-40(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L52:
	.loc 1 261 12
	movl	-40(%rbp), %eax
.L44:
	.loc 1 262 1
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
	.loc 1 268 58
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	.loc 1 269 54
	cmpq	$0, -40(%rbp)
	je	.L54
	.loc 1 269 54 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax
	jmp	.L55
.L54:
	.loc 1 269 54 discriminator 2
	movq	global_conn_table(%rip), %rax
.L55:
	.loc 1 269 25 is_stmt 1 discriminator 4
	movq	%rax, -16(%rbp)
	.loc 1 271 8
	cmpq	$0, -16(%rbp)
	je	.L63
	.loc 1 277 22
	movq	global_conn_table(%rip), %rax
	.loc 1 277 8
	cmpq	%rax, -16(%rbp)
	jne	.L58
	.loc 1 278 32
	movl	$0, cleanup_thread_running(%rip)
.L58:
.LBB6:
	.loc 1 282 14
	movl	$0, -28(%rbp)
	.loc 1 282 5
	jmp	.L59
.L62:
.LBB7:
	.loc 1 283 29
	movq	-16(%rbp), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	movq	(%rax,%rdx,8), %rax
	movq	%rax, -24(%rbp)
	.loc 1 284 15
	jmp	.L60
.L61:
.LBB8:
	.loc 1 285 33
	movq	-24(%rbp), %rax
	movq	64(%rax), %rax
	movq	%rax, -8(%rbp)
	.loc 1 288 13
	movq	-24(%rbp), %rax
	movl	48(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 289 23
	movq	-24(%rbp), %rax
	movq	40(%rax), %rax
	.loc 1 289 13
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 290 13
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 292 19
	movq	-8(%rbp), %rax
	movq	%rax, -24(%rbp)
.L60:
.LBE8:
	.loc 1 284 16
	cmpq	$0, -24(%rbp)
	jne	.L61
	.loc 1 294 34
	movq	-16(%rbp), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	movq	$0, (%rax,%rdx,8)
.LBE7:
	.loc 1 282 43 discriminator 2
	addl	$1, -28(%rbp)
.L59:
	.loc 1 282 23 discriminator 1
	cmpl	$1023, -28(%rbp)
	jle	.L62
.LBE6:
	.loc 1 300 22
	movq	global_conn_table(%rip), %rax
	.loc 1 300 8
	cmpq	%rax, -16(%rbp)
	je	.L53
	.loc 1 302 9
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	jmp	.L53
.L63:
	.loc 1 272 9
	nop
.L53:
	.loc 1 304 1
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
	.file 12 "/usr/include/stdlib.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x641
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0xe
	.long	.LASF57
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
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0xf
	.byte	0x8
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
	.uleb128 0x10
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x7
	.long	.LASF10
	.byte	0x3
	.byte	0xa0
	.byte	0x1a
	.long	0x6d
	.uleb128 0x8
	.long	0x85
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x11
	.long	0x85
	.uleb128 0x8
	.long	0x8c
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF12
	.uleb128 0x7
	.long	.LASF13
	.byte	0x4
	.byte	0xa
	.byte	0x12
	.long	0x74
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF14
	.uleb128 0x7
	.long	.LASF15
	.byte	0x5
	.byte	0x1b
	.byte	0x1b
	.long	0x3a
	.uleb128 0x3
	.byte	0x10
	.byte	0x5
	.long	.LASF16
	.uleb128 0x3
	.byte	0x10
	.byte	0x7
	.long	.LASF17
	.uleb128 0x12
	.long	.LASF58
	.byte	0x48
	.byte	0x6
	.byte	0x5
	.byte	0x10
	.long	0x114
	.uleb128 0x9
	.long	.LASF18
	.byte	0x6
	.byte	0xa
	.long	0x114
	.byte	0
	.uleb128 0x9
	.long	.LASF19
	.byte	0x7
	.byte	0xb
	.long	0x80
	.byte	0x28
	.uleb128 0x9
	.long	.LASF20
	.byte	0x8
	.byte	0x9
	.long	0x66
	.byte	0x30
	.uleb128 0x9
	.long	.LASF21
	.byte	0x9
	.byte	0xc
	.long	0x9d
	.byte	0x38
	.uleb128 0x9
	.long	.LASF22
	.byte	0xa
	.byte	0x1e
	.long	0x124
	.byte	0x40
	.byte	0
	.uleb128 0xd
	.long	0x85
	.long	0x124
	.uleb128 0x13
	.long	0x3a
	.byte	0x20
	.byte	0
	.uleb128 0x8
	.long	0xca
	.uleb128 0x7
	.long	.LASF23
	.byte	0x6
	.byte	0xb
	.byte	0x3
	.long	0xca
	.uleb128 0x14
	.value	0x2000
	.byte	0x6
	.byte	0xd
	.byte	0x9
	.long	0x14c
	.uleb128 0x9
	.long	.LASF24
	.byte	0xe
	.byte	0x19
	.long	0x14c
	.byte	0
	.byte	0
	.uleb128 0xd
	.long	0x15d
	.long	0x15d
	.uleb128 0x15
	.long	0x3a
	.value	0x3ff
	.byte	0
	.uleb128 0x8
	.long	0x129
	.uleb128 0x7
	.long	.LASF25
	.byte	0x6
	.byte	0xf
	.byte	0x3
	.long	0x135
	.uleb128 0x3
	.byte	0x10
	.byte	0x4
	.long	.LASF26
	.uleb128 0x1
	.long	.LASF27
	.byte	0xd
	.byte	0x1c
	.long	0x18a
	.uleb128 0x9
	.byte	0x3
	.quad	global_conn_table
	.uleb128 0x8
	.long	0x162
	.uleb128 0x1
	.long	.LASF28
	.byte	0xe
	.byte	0x12
	.long	0xb0
	.uleb128 0x9
	.byte	0x3
	.quad	cleanup_thread
	.uleb128 0x1
	.long	.LASF29
	.byte	0xf
	.byte	0xc
	.long	0x66
	.uleb128 0x9
	.byte	0x3
	.quad	cleanup_thread_running
	.uleb128 0x5
	.long	.LASF30
	.byte	0x7
	.byte	0x9c
	.byte	0xc
	.long	0x66
	.long	0x1d4
	.uleb128 0x2
	.long	0x91
	.uleb128 0x2
	.long	0x91
	.byte	0
	.uleb128 0x5
	.long	.LASF31
	.byte	0x7
	.byte	0xbb
	.byte	0xe
	.long	0x80
	.long	0x1ea
	.uleb128 0x2
	.long	0x91
	.byte	0
	.uleb128 0x5
	.long	.LASF32
	.byte	0x7
	.byte	0x90
	.byte	0xe
	.long	0x80
	.long	0x20a
	.uleb128 0x2
	.long	0x80
	.uleb128 0x2
	.long	0x91
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0x5
	.long	.LASF33
	.byte	0x8
	.byte	0x16
	.byte	0xe
	.long	0x41
	.long	0x220
	.uleb128 0x2
	.long	0x91
	.byte	0
	.uleb128 0x5
	.long	.LASF34
	.byte	0x8
	.byte	0x1b
	.byte	0x7
	.long	0x80
	.long	0x23b
	.uleb128 0x2
	.long	0x80
	.uleb128 0x2
	.long	0x66
	.byte	0
	.uleb128 0xa
	.long	.LASF35
	.byte	0x7
	.value	0x197
	.byte	0xf
	.long	0x2e
	.long	0x252
	.uleb128 0x2
	.long	0x91
	.byte	0
	.uleb128 0x16
	.long	.LASF59
	.byte	0xc
	.value	0x2af
	.byte	0xd
	.long	0x265
	.uleb128 0x2
	.long	0x48
	.byte	0
	.uleb128 0xa
	.long	.LASF36
	.byte	0x9
	.value	0x166
	.byte	0xc
	.long	0x66
	.long	0x27c
	.uleb128 0x2
	.long	0x66
	.byte	0
	.uleb128 0xa
	.long	.LASF37
	.byte	0xa
	.value	0x16b
	.byte	0xc
	.long	0x66
	.long	0x294
	.uleb128 0x2
	.long	0x91
	.uleb128 0x17
	.byte	0
	.uleb128 0x5
	.long	.LASF38
	.byte	0xb
	.byte	0x4c
	.byte	0xf
	.long	0x9d
	.long	0x2aa
	.uleb128 0x2
	.long	0x2aa
	.byte	0
	.uleb128 0x8
	.long	0x9d
	.uleb128 0xa
	.long	.LASF39
	.byte	0x9
	.value	0x1d0
	.byte	0x15
	.long	0x41
	.long	0x2c6
	.uleb128 0x2
	.long	0x41
	.byte	0
	.uleb128 0x5
	.long	.LASF40
	.byte	0x7
	.byte	0x3d
	.byte	0xe
	.long	0x48
	.long	0x2e6
	.uleb128 0x2
	.long	0x48
	.uleb128 0x2
	.long	0x66
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0xa
	.long	.LASF41
	.byte	0xc
	.value	0x2a0
	.byte	0xe
	.long	0x48
	.long	0x2fd
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0x18
	.long	.LASF54
	.byte	0x1
	.value	0x10c
	.byte	0x6
	.quad	.LFB325
	.quad	.LFE325-.LFB325
	.uleb128 0x1
	.byte	0x9c
	.long	0x39e
	.uleb128 0x19
	.long	.LASF44
	.byte	0x1
	.value	0x10c
	.byte	0x33
	.long	0x18a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xc
	.long	.LASF42
	.value	0x10d
	.byte	0x19
	.long	0x18a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x6
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.uleb128 0x1a
	.string	"i"
	.byte	0x1
	.value	0x11a
	.byte	0xe
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x6
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.uleb128 0xc
	.long	.LASF43
	.value	0x11b
	.byte	0x1d
	.long	0x15d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x6
	.quad	.LBB8
	.quad	.LBE8-.LBB8
	.uleb128 0xc
	.long	.LASF22
	.value	0x11d
	.byte	0x21
	.long	0x15d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xb
	.long	.LASF48
	.byte	0xd0
	.byte	0x5
	.long	0x66
	.quad	.LFB324
	.quad	.LFE324-.LFB324
	.uleb128 0x1
	.byte	0x9c
	.long	0x441
	.uleb128 0x4
	.long	.LASF44
	.byte	0xd0
	.byte	0x2b
	.long	0x18a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x4
	.long	.LASF19
	.byte	0xd0
	.byte	0x38
	.long	0x80
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x4
	.long	.LASF45
	.byte	0xd0
	.byte	0x46
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x1
	.long	.LASF42
	.byte	0xd1
	.byte	0x19
	.long	0x18a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1
	.long	.LASF20
	.byte	0xd2
	.byte	0x9
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1
	.long	.LASF18
	.byte	0xd8
	.byte	0xb
	.long	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1
	.long	.LASF46
	.byte	0xdd
	.byte	0x12
	.long	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x1
	.long	.LASF47
	.byte	0xe2
	.byte	0x19
	.long	0x15d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.long	.LASF43
	.byte	0xe3
	.byte	0x19
	.long	0x15d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0xb
	.long	.LASF49
	.byte	0x9f
	.byte	0x5
	.long	0x66
	.quad	.LFB323
	.quad	.LFE323-.LFB323
	.uleb128 0x1
	.byte	0x9c
	.long	0x4c5
	.uleb128 0x4
	.long	.LASF44
	.byte	0x9f
	.byte	0x28
	.long	0x18a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x4
	.long	.LASF19
	.byte	0x9f
	.byte	0x35
	.long	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1
	.long	.LASF42
	.byte	0xa0
	.byte	0x19
	.long	0x18a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1
	.long	.LASF20
	.byte	0xa1
	.byte	0x9
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.long	.LASF18
	.byte	0xa7
	.byte	0xb
	.long	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1
	.long	.LASF46
	.byte	0xac
	.byte	0x12
	.long	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1
	.long	.LASF43
	.byte	0xb1
	.byte	0x19
	.long	0x15d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0xb
	.long	.LASF50
	.byte	0x6f
	.byte	0x5
	.long	0x66
	.quad	.LFB322
	.quad	.LFE322-.LFB322
	.uleb128 0x1
	.byte	0x9c
	.long	0x54a
	.uleb128 0x4
	.long	.LASF44
	.byte	0x6f
	.byte	0x29
	.long	0x18a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x4
	.long	.LASF19
	.byte	0x6f
	.byte	0x36
	.long	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x4
	.long	.LASF20
	.byte	0x6f
	.byte	0x44
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x1
	.long	.LASF42
	.byte	0x70
	.byte	0x19
	.long	0x18a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.long	.LASF18
	.byte	0x76
	.byte	0xb
	.long	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1
	.long	.LASF46
	.byte	0x7b
	.byte	0x12
	.long	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1
	.long	.LASF43
	.byte	0x7e
	.byte	0x19
	.long	0x15d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xb
	.long	.LASF51
	.byte	0x3a
	.byte	0x7
	.long	0x48
	.quad	.LFB321
	.quad	.LFE321-.LFB321
	.uleb128 0x1
	.byte	0x9c
	.long	0x609
	.uleb128 0x1b
	.string	"arg"
	.byte	0x1
	.byte	0x3a
	.byte	0x27
	.long	0x48
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x6
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x1
	.long	.LASF52
	.byte	0x3f
	.byte	0x10
	.long	0x9d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x6
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x1c
	.string	"i"
	.byte	0x1
	.byte	0x43
	.byte	0x12
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x6
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x1
	.long	.LASF47
	.byte	0x44
	.byte	0x21
	.long	0x15d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.long	.LASF43
	.byte	0x45
	.byte	0x21
	.long	0x15d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x6
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x1
	.long	.LASF53
	.byte	0x58
	.byte	0x29
	.long	0x15d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1d
	.long	.LASF55
	.byte	0x1
	.byte	0x16
	.byte	0x15
	.long	0x18a
	.quad	.LFB320
	.quad	.LFE320-.LFB320
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.long	.LASF56
	.byte	0x16
	.byte	0x2f
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1
	.long	.LASF44
	.byte	0x17
	.byte	0x19
	.long	0x18a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
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
	.uleb128 0x2
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x6
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
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
	.uleb128 0xf
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x19
	.uleb128 0x5
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
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
.LASF21:
	.string	"timestamp"
.LASF17:
	.string	"__int128 unsigned"
.LASF9:
	.string	"size_t"
.LASF22:
	.string	"next"
.LASF58:
	.string	"connection_entry"
.LASF42:
	.string	"table_to_use"
.LASF20:
	.string	"sockfd"
.LASF50:
	.string	"save_connection"
.LASF52:
	.string	"current_time"
.LASF3:
	.string	"unsigned int"
.LASF25:
	.string	"connection_table_t"
.LASF43:
	.string	"entry"
.LASF53:
	.string	"to_free"
.LASF31:
	.string	"strdup"
.LASF34:
	.string	"str2md5"
.LASF51:
	.string	"connection_cleanup_thread"
.LASF15:
	.string	"pthread_t"
.LASF4:
	.string	"unsigned char"
.LASF18:
	.string	"host_hash"
.LASF2:
	.string	"long unsigned int"
.LASF36:
	.string	"close"
.LASF5:
	.string	"short unsigned int"
.LASF16:
	.string	"__int128"
.LASF44:
	.string	"table"
.LASF45:
	.string	"close_socket"
.LASF32:
	.string	"strncpy"
.LASF10:
	.string	"__time_t"
.LASF40:
	.string	"memset"
.LASF49:
	.string	"get_connection"
.LASF48:
	.string	"remove_connection"
.LASF47:
	.string	"prev"
.LASF19:
	.string	"hostname"
.LASF35:
	.string	"strlen"
.LASF28:
	.string	"cleanup_thread"
.LASF23:
	.string	"connection_entry_t"
.LASF11:
	.string	"char"
.LASF13:
	.string	"time_t"
.LASF56:
	.string	"global"
.LASF14:
	.string	"long long unsigned int"
.LASF38:
	.string	"time"
.LASF30:
	.string	"strcmp"
.LASF55:
	.string	"init_connection_table"
.LASF59:
	.string	"free"
.LASF12:
	.string	"long long int"
.LASF24:
	.string	"buckets"
.LASF46:
	.string	"index"
.LASF37:
	.string	"printf"
.LASF7:
	.string	"short int"
.LASF27:
	.string	"global_conn_table"
.LASF8:
	.string	"long int"
.LASF57:
	.string	"GNU C17 14.2.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF26:
	.string	"long double"
.LASF29:
	.string	"cleanup_thread_running"
.LASF6:
	.string	"signed char"
.LASF39:
	.string	"sleep"
.LASF54:
	.string	"cleanup_connection_table"
.LASF41:
	.string	"malloc"
.LASF33:
	.string	"hash_index"
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
