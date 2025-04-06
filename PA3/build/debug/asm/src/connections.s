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
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	.loc 1 59 11
	jmp	.L9
.L13:
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
	movl	$0, -20(%rbp)
	.loc 1 67 9
	jmp	.L10
.L12:
.LBB4:
	.loc 1 68 58
	movq	global_conn_table(%rip), %rax
	.loc 1 68 33
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	movq	(%rax,%rdx,8), %rax
	movq	%rax, -8(%rbp)
	.loc 1 70 16
	cmpq	$0, -8(%rbp)
	je	.L11
	.loc 1 72 41
	movq	-8(%rbp), %rax
	movq	56(%rax), %rax
	.loc 1 72 34
	movq	-16(%rbp), %rdx
	subq	%rax, %rdx
	.loc 1 72 20
	cmpq	$10, %rdx
	jle	.L11
	.loc 1 76 65
	movq	-8(%rbp), %rax
	movq	56(%rax), %rax
	.loc 1 75 21
	movq	-16(%rbp), %rdx
	subq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 78 21
	movq	-8(%rbp), %rax
	movl	48(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 79 31
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	.loc 1 79 21
	movq	%rax, %rdi
	call	free@PLT
.L11:
.LBE4:
	.loc 1 67 47 discriminator 2
	addl	$1, -20(%rbp)
.L10:
	.loc 1 67 27 discriminator 1
	cmpl	$1023, -20(%rbp)
	jle	.L12
.L9:
.LBE3:
.LBE2:
	.loc 1 59 12
	movl	cleanup_thread_running(%rip), %eax
	testl	%eax, %eax
	jne	.L13
	.loc 1 87 12
	movl	$0, %eax
	.loc 1 88 1
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
	.loc 1 97 76
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
	.loc 1 98 54
	cmpq	$0, -40(%rbp)
	je	.L16
	.loc 1 98 54 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax
	jmp	.L17
.L16:
	.loc 1 98 54 discriminator 2
	movq	global_conn_table(%rip), %rax
.L17:
	.loc 1 98 25 is_stmt 1 discriminator 4
	movq	%rax, -24(%rbp)
	.loc 1 100 8
	cmpq	$0, -48(%rbp)
	je	.L18
	.loc 1 100 19 discriminator 1
	cmpl	$0, -52(%rbp)
	jns	.L19
.L18:
	.loc 1 101 16
	movl	$-1, %eax
	jmp	.L20
.L19:
	.loc 1 104 41
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 104 23 discriminator 1
	movl	%eax, %edx
	movq	-48(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	str2md5@PLT
	movq	%rax, -16(%rbp)
	.loc 1 105 8
	cmpq	$0, -16(%rbp)
	jne	.L21
	.loc 1 106 16
	movl	$-1, %eax
	jmp	.L20
.L21:
	.loc 1 109 26
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	hash_index@PLT
	movl	%eax, -28(%rbp)
	.loc 1 112 33
	movl	$64, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	.loc 1 113 8
	cmpq	$0, -8(%rbp)
	jne	.L22
	.loc 1 114 9
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 115 16
	movl	$-1, %eax
	jmp	.L20
.L22:
	.loc 1 118 18
	movq	-8(%rbp), %rax
	.loc 1 118 5
	movq	-16(%rbp), %rcx
	movl	$33, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	.loc 1 119 23
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	.loc 1 119 21 discriminator 1
	movq	-8(%rbp), %rax
	movq	%rdx, 40(%rax)
	.loc 1 120 19
	movq	-8(%rbp), %rax
	movl	-52(%rbp), %edx
	movl	%edx, 48(%rax)
	.loc 1 121 24
	movl	$0, %edi
	call	time@PLT
	.loc 1 121 22 discriminator 1
	movq	-8(%rbp), %rdx
	movq	%rax, 56(%rdx)
	.loc 1 123 5
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 129 34
	movq	-24(%rbp), %rax
	movl	-28(%rbp), %edx
	movq	-8(%rbp), %rcx
	movq	%rcx, (%rax,%rdx,8)
	.loc 1 133 5
	movl	-52(%rbp), %edx
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 134 12
	movl	$0, %eax
.L20:
	.loc 1 135 1
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
	.loc 1 143 63
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
	.loc 1 144 54
	cmpq	$0, -40(%rbp)
	je	.L24
	.loc 1 144 54 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax
	jmp	.L25
.L24:
	.loc 1 144 54 discriminator 2
	movq	global_conn_table(%rip), %rax
.L25:
	.loc 1 144 25 is_stmt 1 discriminator 4
	movq	%rax, -24(%rbp)
	.loc 1 145 9
	movl	$-1, -32(%rbp)
	.loc 1 147 8
	cmpq	$0, -48(%rbp)
	jne	.L26
	.loc 1 148 16
	movl	$-1, %eax
	jmp	.L27
.L26:
	.loc 1 151 41
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 151 23 discriminator 1
	movl	%eax, %edx
	movq	-48(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	str2md5@PLT
	movq	%rax, -16(%rbp)
	.loc 1 152 8
	cmpq	$0, -16(%rbp)
	jne	.L28
	.loc 1 153 16
	movl	$-1, %eax
	jmp	.L27
.L28:
	.loc 1 156 26
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	hash_index@PLT
	movl	%eax, -28(%rbp)
	.loc 1 161 25
	movq	-24(%rbp), %rax
	movl	-28(%rbp), %edx
	movq	(%rax,%rdx,8), %rax
	movq	%rax, -8(%rbp)
	.loc 1 162 8
	cmpq	$0, -8(%rbp)
	je	.L29
	.loc 1 162 15 discriminator 1
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L29
	.loc 1 163 25
	movq	-8(%rbp), %rax
	.loc 1 163 13
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 163 12 discriminator 1
	testl	%eax, %eax
	jne	.L29
	.loc 1 165 32
	movl	$0, %edi
	call	time@PLT
	.loc 1 165 30 discriminator 1
	movq	-8(%rbp), %rdx
	movq	%rax, 56(%rdx)
	.loc 1 166 20
	movq	-8(%rbp), %rax
	movl	48(%rax), %eax
	movl	%eax, -32(%rbp)
.L29:
	.loc 1 171 5
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 173 8
	cmpl	$-1, -32(%rbp)
	je	.L30
	.loc 1 174 9
	movl	-32(%rbp), %edx
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L31
.L30:
	.loc 1 177 9
	movl	-32(%rbp), %edx
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L31:
	.loc 1 180 12
	movl	-32(%rbp), %eax
.L27:
	.loc 1 181 1
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
	.loc 1 190 84
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
	.loc 1 191 54
	cmpq	$0, -40(%rbp)
	je	.L33
	.loc 1 191 54 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax
	jmp	.L34
.L33:
	.loc 1 191 54 discriminator 2
	movq	global_conn_table(%rip), %rax
.L34:
	.loc 1 191 25 is_stmt 1 discriminator 4
	movq	%rax, -24(%rbp)
	.loc 1 192 9
	movl	$-1, -32(%rbp)
	.loc 1 194 8
	cmpq	$0, -48(%rbp)
	jne	.L35
	.loc 1 195 16
	movl	$-1, %eax
	jmp	.L36
.L35:
	.loc 1 198 41
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 198 23 discriminator 1
	movl	%eax, %edx
	movq	-48(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	str2md5@PLT
	movq	%rax, -16(%rbp)
	.loc 1 199 8
	cmpq	$0, -16(%rbp)
	jne	.L37
	.loc 1 200 16
	movl	$-1, %eax
	jmp	.L36
.L37:
	.loc 1 203 26
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	hash_index@PLT
	movl	%eax, -28(%rbp)
	.loc 1 209 25
	movq	-24(%rbp), %rax
	movl	-28(%rbp), %edx
	movq	(%rax,%rdx,8), %rax
	movq	%rax, -8(%rbp)
	.loc 1 211 8
	cmpq	$0, -8(%rbp)
	je	.L38
	.loc 1 212 25
	movq	-8(%rbp), %rax
	.loc 1 212 13
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 212 12 discriminator 1
	testl	%eax, %eax
	jne	.L38
	.loc 1 213 20
	movq	-8(%rbp), %rax
	movl	48(%rax), %eax
	movl	%eax, -32(%rbp)
	.loc 1 214 23
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	.loc 1 214 13
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 215 13
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L38:
	.loc 1 220 5
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 222 8
	cmpl	$-1, -32(%rbp)
	je	.L39
	.loc 1 223 9
	movl	-32(%rbp), %edx
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 226 12
	cmpl	$0, -52(%rbp)
	je	.L39
	.loc 1 227 13
	movl	-32(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 228 13
	movl	-32(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L39:
	.loc 1 232 12
	movl	-32(%rbp), %eax
.L36:
	.loc 1 233 1
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
	.loc 1 239 58
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	.loc 1 240 54
	cmpq	$0, -40(%rbp)
	je	.L41
	.loc 1 240 54 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax
	jmp	.L42
.L41:
	.loc 1 240 54 discriminator 2
	movq	global_conn_table(%rip), %rax
.L42:
	.loc 1 240 25 is_stmt 1 discriminator 4
	movq	%rax, -16(%rbp)
	.loc 1 242 8
	cmpq	$0, -16(%rbp)
	je	.L49
	.loc 1 248 22
	movq	global_conn_table(%rip), %rax
	.loc 1 248 8
	cmpq	%rax, -16(%rbp)
	jne	.L45
	.loc 1 249 32
	movl	$0, cleanup_thread_running(%rip)
.L45:
.LBB5:
	.loc 1 253 14
	movl	$0, -20(%rbp)
	.loc 1 253 5
	jmp	.L46
.L48:
.LBB6:
	.loc 1 254 29
	movq	-16(%rbp), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	movq	(%rax,%rdx,8), %rax
	movq	%rax, -8(%rbp)
	.loc 1 255 12
	cmpq	$0, -8(%rbp)
	je	.L47
	.loc 1 258 13
	movq	-8(%rbp), %rax
	movl	48(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 259 23
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	.loc 1 259 13
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 260 13
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L47:
	.loc 1 262 34
	movq	-16(%rbp), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	movq	$0, (%rax,%rdx,8)
.LBE6:
	.loc 1 253 43 discriminator 2
	addl	$1, -20(%rbp)
.L46:
	.loc 1 253 23 discriminator 1
	cmpl	$1023, -20(%rbp)
	jle	.L48
.LBE5:
	.loc 1 268 22
	movq	global_conn_table(%rip), %rax
	.loc 1 268 8
	cmpq	%rax, -16(%rbp)
	je	.L40
	.loc 1 270 9
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	jmp	.L40
.L49:
	.loc 1 243 9
	nop
.L40:
	.loc 1 272 1
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
	.long	0x5c8
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0xe
	.long	.LASF54
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x6
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
	.uleb128 0x6
	.long	.LASF10
	.byte	0x3
	.byte	0xa0
	.byte	0x1a
	.long	0x6d
	.uleb128 0x7
	.long	0x85
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x11
	.long	0x85
	.uleb128 0x7
	.long	0x8c
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF12
	.uleb128 0x6
	.long	.LASF13
	.byte	0x4
	.byte	0xa
	.byte	0x12
	.long	0x74
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF14
	.uleb128 0x6
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
	.long	.LASF55
	.byte	0x40
	.byte	0x6
	.byte	0x5
	.byte	0x10
	.long	0x108
	.uleb128 0x8
	.long	.LASF18
	.byte	0x6
	.byte	0xa
	.long	0x108
	.byte	0
	.uleb128 0x8
	.long	.LASF19
	.byte	0x7
	.byte	0xb
	.long	0x80
	.byte	0x28
	.uleb128 0x8
	.long	.LASF20
	.byte	0x8
	.byte	0x9
	.long	0x66
	.byte	0x30
	.uleb128 0x8
	.long	.LASF21
	.byte	0x9
	.byte	0xc
	.long	0x9d
	.byte	0x38
	.byte	0
	.uleb128 0xc
	.long	0x85
	.long	0x118
	.uleb128 0x13
	.long	0x3a
	.byte	0x20
	.byte	0
	.uleb128 0x6
	.long	.LASF22
	.byte	0x6
	.byte	0xa
	.byte	0x3
	.long	0xca
	.uleb128 0x14
	.value	0x2000
	.byte	0x6
	.byte	0xc
	.byte	0x9
	.long	0x13b
	.uleb128 0x8
	.long	.LASF23
	.byte	0xd
	.byte	0x19
	.long	0x13b
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x14c
	.long	0x14c
	.uleb128 0x15
	.long	0x3a
	.value	0x3ff
	.byte	0
	.uleb128 0x7
	.long	0x118
	.uleb128 0x6
	.long	.LASF24
	.byte	0x6
	.byte	0xe
	.byte	0x3
	.long	0x124
	.uleb128 0x3
	.byte	0x10
	.byte	0x4
	.long	.LASF25
	.uleb128 0x1
	.long	.LASF26
	.byte	0xd
	.byte	0x1c
	.long	0x179
	.uleb128 0x9
	.byte	0x3
	.quad	global_conn_table
	.uleb128 0x7
	.long	0x151
	.uleb128 0x1
	.long	.LASF27
	.byte	0xe
	.byte	0x12
	.long	0xb0
	.uleb128 0x9
	.byte	0x3
	.quad	cleanup_thread
	.uleb128 0x1
	.long	.LASF28
	.byte	0xf
	.byte	0xc
	.long	0x66
	.uleb128 0x9
	.byte	0x3
	.quad	cleanup_thread_running
	.uleb128 0x5
	.long	.LASF29
	.byte	0x7
	.byte	0x9c
	.byte	0xc
	.long	0x66
	.long	0x1c3
	.uleb128 0x2
	.long	0x91
	.uleb128 0x2
	.long	0x91
	.byte	0
	.uleb128 0x5
	.long	.LASF30
	.byte	0x7
	.byte	0xbb
	.byte	0xe
	.long	0x80
	.long	0x1d9
	.uleb128 0x2
	.long	0x91
	.byte	0
	.uleb128 0x5
	.long	.LASF31
	.byte	0x7
	.byte	0x90
	.byte	0xe
	.long	0x80
	.long	0x1f9
	.uleb128 0x2
	.long	0x80
	.uleb128 0x2
	.long	0x91
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0x5
	.long	.LASF32
	.byte	0x8
	.byte	0x16
	.byte	0xe
	.long	0x41
	.long	0x20f
	.uleb128 0x2
	.long	0x91
	.byte	0
	.uleb128 0x5
	.long	.LASF33
	.byte	0x8
	.byte	0x1b
	.byte	0x7
	.long	0x80
	.long	0x22a
	.uleb128 0x2
	.long	0x80
	.uleb128 0x2
	.long	0x66
	.byte	0
	.uleb128 0x9
	.long	.LASF34
	.byte	0x7
	.value	0x197
	.byte	0xf
	.long	0x2e
	.long	0x241
	.uleb128 0x2
	.long	0x91
	.byte	0
	.uleb128 0x16
	.long	.LASF56
	.byte	0xc
	.value	0x2af
	.byte	0xd
	.long	0x254
	.uleb128 0x2
	.long	0x48
	.byte	0
	.uleb128 0x9
	.long	.LASF35
	.byte	0x9
	.value	0x166
	.byte	0xc
	.long	0x66
	.long	0x26b
	.uleb128 0x2
	.long	0x66
	.byte	0
	.uleb128 0x9
	.long	.LASF36
	.byte	0xa
	.value	0x16b
	.byte	0xc
	.long	0x66
	.long	0x283
	.uleb128 0x2
	.long	0x91
	.uleb128 0x17
	.byte	0
	.uleb128 0x5
	.long	.LASF37
	.byte	0xb
	.byte	0x4c
	.byte	0xf
	.long	0x9d
	.long	0x299
	.uleb128 0x2
	.long	0x299
	.byte	0
	.uleb128 0x7
	.long	0x9d
	.uleb128 0x9
	.long	.LASF38
	.byte	0x9
	.value	0x1d0
	.byte	0x15
	.long	0x41
	.long	0x2b5
	.uleb128 0x2
	.long	0x41
	.byte	0
	.uleb128 0x5
	.long	.LASF39
	.byte	0x7
	.byte	0x3d
	.byte	0xe
	.long	0x48
	.long	0x2d5
	.uleb128 0x2
	.long	0x48
	.uleb128 0x2
	.long	0x66
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0x9
	.long	.LASF40
	.byte	0xc
	.value	0x2a0
	.byte	0xe
	.long	0x48
	.long	0x2ec
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0x18
	.long	.LASF51
	.byte	0x1
	.byte	0xef
	.byte	0x6
	.quad	.LFB325
	.quad	.LFE325-.LFB325
	.uleb128 0x1
	.byte	0x9c
	.long	0x365
	.uleb128 0x4
	.long	.LASF43
	.byte	0xef
	.byte	0x33
	.long	0x179
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1
	.long	.LASF41
	.byte	0xf0
	.byte	0x19
	.long	0x179
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xa
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0xd
	.string	"i"
	.byte	0xfd
	.byte	0xe
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xa
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.uleb128 0x1
	.long	.LASF42
	.byte	0xfe
	.byte	0x1d
	.long	0x14c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xb
	.long	.LASF46
	.byte	0xbe
	.byte	0x5
	.long	0x66
	.quad	.LFB324
	.quad	.LFE324-.LFB324
	.uleb128 0x1
	.byte	0x9c
	.long	0x3f8
	.uleb128 0x4
	.long	.LASF43
	.byte	0xbe
	.byte	0x2b
	.long	0x179
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x4
	.long	.LASF19
	.byte	0xbe
	.byte	0x38
	.long	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x4
	.long	.LASF44
	.byte	0xbe
	.byte	0x46
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x1
	.long	.LASF41
	.byte	0xbf
	.byte	0x19
	.long	0x179
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.long	.LASF20
	.byte	0xc0
	.byte	0x9
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.long	.LASF18
	.byte	0xc6
	.byte	0xb
	.long	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1
	.long	.LASF45
	.byte	0xcb
	.byte	0x12
	.long	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1
	.long	.LASF42
	.byte	0xd1
	.byte	0x19
	.long	0x14c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xb
	.long	.LASF47
	.byte	0x8f
	.byte	0x5
	.long	0x66
	.quad	.LFB323
	.quad	.LFE323-.LFB323
	.uleb128 0x1
	.byte	0x9c
	.long	0x47c
	.uleb128 0x4
	.long	.LASF43
	.byte	0x8f
	.byte	0x28
	.long	0x179
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x4
	.long	.LASF19
	.byte	0x8f
	.byte	0x35
	.long	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1
	.long	.LASF41
	.byte	0x90
	.byte	0x19
	.long	0x179
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.long	.LASF20
	.byte	0x91
	.byte	0x9
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.long	.LASF18
	.byte	0x97
	.byte	0xb
	.long	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1
	.long	.LASF45
	.byte	0x9c
	.byte	0x12
	.long	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1
	.long	.LASF42
	.byte	0xa1
	.byte	0x19
	.long	0x14c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xb
	.long	.LASF48
	.byte	0x61
	.byte	0x5
	.long	0x66
	.quad	.LFB322
	.quad	.LFE322-.LFB322
	.uleb128 0x1
	.byte	0x9c
	.long	0x501
	.uleb128 0x4
	.long	.LASF43
	.byte	0x61
	.byte	0x29
	.long	0x179
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x4
	.long	.LASF19
	.byte	0x61
	.byte	0x36
	.long	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x4
	.long	.LASF20
	.byte	0x61
	.byte	0x44
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x1
	.long	.LASF41
	.byte	0x62
	.byte	0x19
	.long	0x179
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.long	.LASF18
	.byte	0x68
	.byte	0xb
	.long	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1
	.long	.LASF45
	.byte	0x6d
	.byte	0x12
	.long	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1
	.long	.LASF42
	.byte	0x70
	.byte	0x19
	.long	0x14c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xb
	.long	.LASF49
	.byte	0x3a
	.byte	0x7
	.long	0x48
	.quad	.LFB321
	.quad	.LFE321-.LFB321
	.uleb128 0x1
	.byte	0x9c
	.long	0x590
	.uleb128 0x19
	.string	"arg"
	.byte	0x1
	.byte	0x3a
	.byte	0x27
	.long	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xa
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x1
	.long	.LASF50
	.byte	0x3f
	.byte	0x10
	.long	0x9d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xa
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0xd
	.string	"i"
	.byte	0x43
	.byte	0x12
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xa
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x1
	.long	.LASF42
	.byte	0x44
	.byte	0x21
	.long	0x14c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1a
	.long	.LASF52
	.byte	0x1
	.byte	0x16
	.byte	0x15
	.long	0x179
	.quad	.LFB320
	.quad	.LFE320-.LFB320
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.long	.LASF53
	.byte	0x16
	.byte	0x2f
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1
	.long	.LASF43
	.byte	0x17
	.byte	0x19
	.long	0x179
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
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0x19
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
.LASF55:
	.string	"connection_entry"
.LASF41:
	.string	"table_to_use"
.LASF20:
	.string	"sockfd"
.LASF48:
	.string	"save_connection"
.LASF50:
	.string	"current_time"
.LASF3:
	.string	"unsigned int"
.LASF24:
	.string	"connection_table_t"
.LASF42:
	.string	"entry"
.LASF30:
	.string	"strdup"
.LASF33:
	.string	"str2md5"
.LASF49:
	.string	"connection_cleanup_thread"
.LASF15:
	.string	"pthread_t"
.LASF4:
	.string	"unsigned char"
.LASF18:
	.string	"host_hash"
.LASF2:
	.string	"long unsigned int"
.LASF35:
	.string	"close"
.LASF5:
	.string	"short unsigned int"
.LASF16:
	.string	"__int128"
.LASF43:
	.string	"table"
.LASF44:
	.string	"close_socket"
.LASF31:
	.string	"strncpy"
.LASF10:
	.string	"__time_t"
.LASF39:
	.string	"memset"
.LASF47:
	.string	"get_connection"
.LASF46:
	.string	"remove_connection"
.LASF19:
	.string	"hostname"
.LASF34:
	.string	"strlen"
.LASF27:
	.string	"cleanup_thread"
.LASF22:
	.string	"connection_entry_t"
.LASF11:
	.string	"char"
.LASF13:
	.string	"time_t"
.LASF53:
	.string	"global"
.LASF14:
	.string	"long long unsigned int"
.LASF37:
	.string	"time"
.LASF29:
	.string	"strcmp"
.LASF52:
	.string	"init_connection_table"
.LASF56:
	.string	"free"
.LASF12:
	.string	"long long int"
.LASF23:
	.string	"buckets"
.LASF45:
	.string	"index"
.LASF36:
	.string	"printf"
.LASF7:
	.string	"short int"
.LASF26:
	.string	"global_conn_table"
.LASF8:
	.string	"long int"
.LASF54:
	.string	"GNU C17 14.2.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF25:
	.string	"long double"
.LASF28:
	.string	"cleanup_thread_running"
.LASF6:
	.string	"signed char"
.LASF38:
	.string	"sleep"
.LASF51:
	.string	"cleanup_connection_table"
.LASF40:
	.string	"malloc"
.LASF32:
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
