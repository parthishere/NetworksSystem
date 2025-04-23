	.file	"handle_req.c"
	.text
.Ltext0:
	.file 0 "/home/parth/Work/All_data/university/Network System/Assignments/PA4/server" "src/handle_req.c"
	.globl	get_in_addr
	.type	get_in_addr, @function
get_in_addr:
.LFB320:
	.file 1 "src/handle_req.c"
	.loc 1 55 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	.loc 1 56 11
	movq	-8(%rbp), %rax
	movzwl	(%rax), %eax
	.loc 1 56 8
	cmpw	$2, %ax
	jne	.L2
	.loc 1 58 16
	movq	-8(%rbp), %rax
	addq	$4, %rax
	jmp	.L3
.L2:
	.loc 1 61 12
	movq	-8(%rbp), %rax
	addq	$8, %rax
.L3:
	.loc 1 62 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE320:
	.size	get_in_addr, .-get_in_addr
	.section	.rodata
.LC0:
	.string	"Too large filename size "
	.align 8
.LC1:
	.string	"\033[31m[-] Recv failed, error no: %d \n\033[0m"
	.align 8
.LC2:
	.string	"\033[33m[-] Client Closed the Connection, error no: %d \n\033[0m"
.LC3:
	.string	"%s/%s_%d"
.LC4:
	.string	"wb"
	.align 8
.LC5:
	.string	"\033[31m\n[-] Error opening file: %s\n\033[0m"
	.align 8
.LC6:
	.string	"\033[31m    Error: %s (code: %d)\n\n\033[0m"
	.align 8
.LC7:
	.string	"\033[31m[-] Num bytes read and write did not match \n\033[0m"
.LC8:
	.string	"ack\t\n0\t\n"
	.string	""
	.align 8
.LC9:
	.string	"\033[31m[-] Send failed, error no: %d \n\033[0m"
	.align 8
.LC10:
	.string	"\033[32m\n=========================================\n\033[0m"
.LC11:
	.string	"\033[32m    PUT SUCCESSFUL\n\033[0m"
.LC12:
	.string	"\033[32m    FILE: %s\n\033[0m"
	.align 8
.LC13:
	.string	"\033[32m    CHUNK: %d stored !\n\033[0m"
	.align 8
.LC14:
	.string	"\033[32m=========================================\n\n\033[0m"
.LC15:
	.string	"nack\t\n0\t\n"
	.string	""
	.align 8
.LC16:
	.string	"\033[31m\n=========================================\n\033[0m"
.LC17:
	.string	"\033[31m    PUT FAILED\n\033[0m"
.LC18:
	.string	"\033[31m    FILE: %s\n\033[0m"
	.align 8
.LC19:
	.string	"\033[31m    CHUNK: %d stored !\n\033[0m"
	.align 8
.LC20:
	.string	"\033[31m=========================================\n\n\033[0m"
	.text
	.globl	put_command
	.type	put_command, @function
put_command:
.LFB321:
	.loc 1 75 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	leaq	-28672(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$2152, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -30824(%rbp)
	movq	%rsi, -30832(%rbp)
	.loc 1 75 1
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 1 76 9
	movl	$0, -30800(%rbp)
	.loc 1 76 23
	movl	$0, -30808(%rbp)
	.loc 1 76 40
	movl	$0, -30796(%rbp)
	.loc 1 78 9
	movl	$0, -30804(%rbp)
	.loc 1 82 5
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 83 22
	movq	-30832(%rbp), %rax
	movl	2(%rax), %eax
	.loc 1 83 7
	cmpl	$30720, %eax
	jbe	.L5
	.loc 1 84 9
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 85 9
	jmp	.L6
.L5:
.LBB2:
	.loc 1 87 16
	movq	-30832(%rbp), %rax
	movl	2(%rax), %eax
	movl	%eax, %edx
	movq	-30824(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30752(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 87 16 is_stmt 0 discriminator 1
	movl	%eax, -30792(%rbp)
	cmpl	$0, -30792(%rbp)
	jns	.L7
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 87 16 discriminator 2
	movq	-30824(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 87 16
	jmp	.L6
.L7:
	.loc 1 87 16 discriminator 2
	cmpl	$0, -30792(%rbp)
	jne	.L8
	.loc 1 87 16 discriminator 3
	movq	-30824(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 87 16 discriminator 1
	call	__errno_location@PLT
	.loc 1 87 16 discriminator 2
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 87 16
	jmp	.L6
.L8:
	.loc 1 87 16 discriminator 4
	movl	-30792(%rbp), %eax
.LBE2:
	.loc 1 87 14 is_stmt 1 discriminator 4
	movl	%eax, -30800(%rbp)
	.loc 1 89 21
	leaq	-30752(%rbp), %rax
	movl	$47, %esi
	movq	%rax, %rdi
	call	strrchr@PLT
	movq	%rax, -30768(%rbp)
	.loc 1 90 8
	cmpq	$0, -30768(%rbp)
	jne	.L9
	.loc 1 92 23
	leaq	-30752(%rbp), %rax
	movq	%rax, -30768(%rbp)
	jmp	.L10
.L9:
	.loc 1 96 22
	addq	$1, -30768(%rbp)
.L10:
	.loc 1 99 83
	movq	-30832(%rbp), %rax
	movzbl	1(%rax), %eax
	.loc 1 99 9
	movzbl	%al, %esi
	movq	-30824(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-30768(%rbp), %rcx
	leaq	-30776(%rbp), %rax
	movl	%esi, %r8d
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	.loc 1 99 8 discriminator 1
	testl	%eax, %eax
	js	.L25
	.loc 1 102 16
	movq	-30776(%rbp), %rax
	leaq	.LC4(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -30760(%rbp)
	.loc 1 103 8
	cmpq	$0, -30760(%rbp)
	jne	.L13
	.loc 1 105 9
	movq	-30776(%rbp), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC5(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 106 84
	call	__errno_location@PLT
	.loc 1 106 9 discriminator 1
	movl	(%rax), %ebx
	.loc 1 106 76 discriminator 1
	call	__errno_location@PLT
	.loc 1 106 9 discriminator 2
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rdx
	.loc 1 106 9 is_stmt 0 discriminator 3
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 107 16 is_stmt 1
	movl	$-1, -30804(%rbp)
	.loc 1 108 9
	jmp	.L6
.L18:
	.loc 1 113 9
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.LBB3:
	.loc 1 114 20
	movq	-30824(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30752(%rbp), %rsi
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 114 20 is_stmt 0 discriminator 1
	movl	%eax, -30788(%rbp)
	cmpl	$0, -30788(%rbp)
	jns	.L14
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 114 20 discriminator 2
	movq	-30824(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 114 20
	jmp	.L6
.L14:
	.loc 1 114 20 discriminator 2
	cmpl	$0, -30788(%rbp)
	jne	.L15
	.loc 1 114 20 discriminator 3
	movq	-30824(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 114 20 discriminator 1
	call	__errno_location@PLT
	.loc 1 114 20 discriminator 2
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 114 20
	jmp	.L6
.L15:
	.loc 1 114 20 discriminator 4
	movl	-30788(%rbp), %eax
.LBE3:
	.loc 1 114 18 is_stmt 1 discriminator 4
	movl	%eax, -30800(%rbp)
	.loc 1 115 22
	movl	-30800(%rbp), %eax
	movslq	%eax, %rsi
	movq	-30760(%rbp), %rdx
	leaq	-30752(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 115 20 discriminator 1
	movl	%eax, -30796(%rbp)
	.loc 1 117 36
	movl	-30796(%rbp), %eax
	imull	-30800(%rbp), %eax
	.loc 1 117 12
	cmpl	%eax, -30800(%rbp)
	je	.L16
	.loc 1 119 13
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$53, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 120 20
	movl	$-1, -30804(%rbp)
	.loc 1 121 13
	jmp	.L17
.L16:
	.loc 1 123 21
	movl	-30800(%rbp), %eax
	addl	%eax, -30808(%rbp)
.L13:
	.loc 1 111 40
	movq	-30832(%rbp), %rax
	movl	6(%rax), %eax
	.loc 1 111 24
	movl	-30808(%rbp), %edx
	cmpl	%eax, %edx
	jb	.L18
.L17:
	.loc 1 127 8
	cmpl	$0, -30804(%rbp)
	js	.L19
.LBB4:
	.loc 1 129 20
	movq	-30824(%rbp), %rax
	movl	4(%rax), %eax
	movl	$0, %ecx
	movl	$7, %edx
	leaq	.LC8(%rip), %rsi
	movl	%eax, %edi
	call	send@PLT
	.loc 1 129 20 is_stmt 0 discriminator 1
	movl	%eax, -30780(%rbp)
	cmpl	$0, -30780(%rbp)
	jns	.L20
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 129 20 discriminator 2
	movq	-30824(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 129 20
	jmp	.L6
.L20:
	.loc 1 129 20 discriminator 2
	cmpl	$0, -30780(%rbp)
	jne	.L21
	.loc 1 129 20 discriminator 3
	movq	-30824(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 129 20 discriminator 1
	call	__errno_location@PLT
	.loc 1 129 20 discriminator 2
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 129 20
	jmp	.L6
.L21:
	.loc 1 129 20 discriminator 4
	movl	-30780(%rbp), %eax
.LBE4:
	.loc 1 129 18 is_stmt 1 discriminator 4
	movl	%eax, -30800(%rbp)
	.loc 1 130 9
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 131 9
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 132 9
	movq	-30776(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 133 68
	movq	-30832(%rbp), %rax
	movzbl	1(%rax), %eax
	.loc 1 133 9
	movzbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 134 9
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L6
.L19:
.LBB5:
	.loc 1 139 20
	movq	-30824(%rbp), %rax
	movl	4(%rax), %eax
	movl	$0, %ecx
	movl	$8, %edx
	leaq	.LC15(%rip), %rsi
	movl	%eax, %edi
	call	send@PLT
	.loc 1 139 20 is_stmt 0 discriminator 1
	movl	%eax, -30784(%rbp)
	cmpl	$0, -30784(%rbp)
	jns	.L22
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 139 20 discriminator 2
	movq	-30824(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 139 20
	jmp	.L6
.L22:
	.loc 1 139 20 discriminator 2
	cmpl	$0, -30784(%rbp)
	jne	.L23
	.loc 1 139 20 discriminator 3
	movq	-30824(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 139 20 discriminator 1
	call	__errno_location@PLT
	.loc 1 139 20 discriminator 2
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 139 20
	jmp	.L6
.L23:
	.loc 1 139 20 discriminator 4
	movl	-30784(%rbp), %eax
.LBE5:
	.loc 1 139 18 is_stmt 1 discriminator 4
	movl	%eax, -30800(%rbp)
	.loc 1 140 9
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 141 9
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 142 9
	movq	-30776(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 143 68
	movq	-30832(%rbp), %rax
	movzbl	1(%rax), %eax
	.loc 1 143 9
	movzbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 144 9
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L6
.L25:
	.loc 1 100 9
	nop
.L6:
	.loc 1 148 5
	movq	-30776(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 149 5
	movq	-30760(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	.loc 1 150 1
	nop
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L24
	call	__stack_chk_fail@PLT
.L24:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE321:
	.size	put_command, .-put_command
	.section	.rodata
.LC21:
	.string	"rb"
.LC22:
	.string	"Reading failed "
.LC23:
	.string	"file size %d \n"
.LC24:
	.string	"numbytes ACK sent %d \n"
	.align 8
.LC25:
	.string	"Numbbytes send for header %d, chunk id sent %d, file length %d data len %d \n"
.LC26:
	.string	"Raw header bytes: (sent)"
.LC27:
	.string	"%02x "
.LC28:
	.string	"send bytes:%d\n"
	.align 8
.LC29:
	.string	"\033[32m    GET FILE SUCCESSFUL\n\033[0m"
	.align 8
.LC30:
	.string	"\033[32m    CHUNK: %d sent !\n\033[0m"
.LC31:
	.string	"\033[31m    GET FAILED\n\033[0m"
	.text
	.globl	get_command
	.type	get_command, @function
get_command:
.LFB322:
	.loc 1 153 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	-61440(%rsp), %r11
.LPSRL1:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL1
	subq	$144, %rsp
	movq	%rdi, -61576(%rbp)
	movq	%rsi, -61584(%rbp)
	.loc 1 153 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 154 9
	movl	$0, -61548(%rbp)
	.loc 1 154 23
	movl	$0, -61556(%rbp)
	.loc 1 154 40
	movl	$0, -61544(%rbp)
	.loc 1 157 9
	movl	$0, -61540(%rbp)
	.loc 1 161 5
	leaq	-61456(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 162 22
	movq	-61584(%rbp), %rax
	movl	2(%rax), %eax
	.loc 1 162 7
	cmpl	$30720, %eax
	jbe	.L27
	.loc 1 163 9
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 164 9
	jmp	.L28
.L27:
.LBB6:
	.loc 1 166 16
	movq	-61584(%rbp), %rax
	movl	2(%rax), %eax
	movl	%eax, %edx
	movq	-61576(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-61456(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 166 16 is_stmt 0 discriminator 1
	movl	%eax, -61536(%rbp)
	cmpl	$0, -61536(%rbp)
	jns	.L29
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 166 16 discriminator 2
	movq	-61576(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 166 16
	jmp	.L28
.L29:
	.loc 1 166 16 discriminator 2
	cmpl	$0, -61536(%rbp)
	jne	.L30
	.loc 1 166 16 discriminator 3
	movq	-61576(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 166 16 discriminator 1
	call	__errno_location@PLT
	.loc 1 166 16 discriminator 2
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 166 16
	jmp	.L28
.L30:
	.loc 1 166 16 discriminator 4
	movl	-61536(%rbp), %eax
.LBE6:
	.loc 1 166 14 is_stmt 1 discriminator 4
	movl	%eax, -61548(%rbp)
	.loc 1 168 21
	leaq	-61456(%rbp), %rax
	movl	$47, %esi
	movq	%rax, %rdi
	call	strrchr@PLT
	movq	%rax, -61496(%rbp)
	.loc 1 169 8
	cmpq	$0, -61496(%rbp)
	jne	.L31
	.loc 1 171 23
	leaq	-61456(%rbp), %rax
	movq	%rax, -61496(%rbp)
	jmp	.L32
.L31:
	.loc 1 175 22
	addq	$1, -61496(%rbp)
.L32:
	.loc 1 178 79
	movq	-61584(%rbp), %rax
	movzbl	1(%rax), %eax
	.loc 1 178 5
	movzbl	%al, %esi
	movq	-61576(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-61496(%rbp), %rcx
	leaq	-61504(%rbp), %rax
	movl	%esi, %r8d
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	.loc 1 180 16
	movq	-61504(%rbp), %rax
	leaq	.LC21(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -61488(%rbp)
	.loc 1 181 8
	cmpq	$0, -61488(%rbp)
	jne	.L33
	.loc 1 183 9
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.LBB7:
	.loc 1 184 20
	movq	-61576(%rbp), %rax
	movl	4(%rax), %eax
	movl	$0, %ecx
	movl	$8, %edx
	leaq	.LC15(%rip), %rsi
	movl	%eax, %edi
	call	send@PLT
	.loc 1 184 20 is_stmt 0 discriminator 1
	movl	%eax, -61508(%rbp)
	cmpl	$0, -61508(%rbp)
	jns	.L34
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 184 20 discriminator 2
	movq	-61576(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 184 20
	jmp	.L28
.L34:
	.loc 1 184 20 discriminator 2
	cmpl	$0, -61508(%rbp)
	jne	.L35
	.loc 1 184 20 discriminator 3
	movq	-61576(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 184 20 discriminator 1
	call	__errno_location@PLT
	.loc 1 184 20 discriminator 2
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 184 20
	jmp	.L28
.L35:
	.loc 1 184 20 discriminator 4
	movl	-61508(%rbp), %eax
.LBE7:
	.loc 1 184 18 is_stmt 1 discriminator 4
	movl	%eax, -61548(%rbp)
	.loc 1 185 16
	movl	$-1, -61540(%rbp)
	.loc 1 186 9
	movq	-61504(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	jmp	.L26
.L33:
	.loc 1 190 5
	movq	-61488(%rbp), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseek@PLT
	.loc 1 191 21
	movq	-61488(%rbp), %rax
	movq	%rax, %rdi
	call	ftell@PLT
	.loc 1 191 9 discriminator 1
	movl	%eax, -61532(%rbp)
	.loc 1 192 5
	movq	-61488(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseek@PLT
	.loc 1 194 5
	movl	-61532(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBB8:
	.loc 1 196 16
	movq	-61576(%rbp), %rax
	movl	4(%rax), %eax
	movl	$0, %ecx
	movl	$7, %edx
	leaq	.LC8(%rip), %rsi
	movl	%eax, %edi
	call	send@PLT
	.loc 1 196 16 is_stmt 0 discriminator 1
	movl	%eax, -61528(%rbp)
	cmpl	$0, -61528(%rbp)
	jns	.L37
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 196 16 discriminator 2
	movq	-61576(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 196 16
	jmp	.L28
.L37:
	.loc 1 196 16 discriminator 2
	cmpl	$0, -61528(%rbp)
	jne	.L38
	.loc 1 196 16 discriminator 3
	movq	-61576(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 196 16 discriminator 1
	call	__errno_location@PLT
	.loc 1 196 16 discriminator 2
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 196 16
	jmp	.L28
.L38:
	.loc 1 196 16 discriminator 4
	movl	-61528(%rbp), %eax
.LBE8:
	.loc 1 196 14 is_stmt 1 discriminator 4
	movl	%eax, -61548(%rbp)
	.loc 1 197 5
	movl	-61548(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBB9:
	.loc 1 199 16
	movq	-61576(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-61456(%rbp), %rsi
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 199 16 is_stmt 0 discriminator 1
	movl	%eax, -61524(%rbp)
	cmpl	$0, -61524(%rbp)
	jns	.L39
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 199 16 discriminator 2
	movq	-61576(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 199 16
	jmp	.L28
.L39:
	.loc 1 199 16 discriminator 2
	cmpl	$0, -61524(%rbp)
	jne	.L40
	.loc 1 199 16 discriminator 3
	movq	-61576(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 199 16 discriminator 1
	call	__errno_location@PLT
	.loc 1 199 16 discriminator 2
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 199 16
	jmp	.L28
.L40:
	.loc 1 199 16 discriminator 4
	movl	-61524(%rbp), %eax
.LBE9:
	.loc 1 199 14 is_stmt 1 discriminator 4
	movl	%eax, -61548(%rbp)
	.loc 1 201 22
	movb	$0, -61466(%rbp)
	.loc 1 203 35
	movq	-61584(%rbp), %rax
	movzbl	1(%rax), %eax
	.loc 1 201 22
	movb	%al, -61465(%rbp)
	.loc 1 204 28
	movq	-61504(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 201 22
	movl	%eax, -61464(%rbp)
	movl	-61532(%rbp), %eax
	movl	%eax, -61460(%rbp)
.LBB10:
	.loc 1 208 16
	movq	-61576(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-61466(%rbp), %rsi
	movl	$0, %ecx
	movl	$10, %edx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 208 16 is_stmt 0 discriminator 1
	movl	%eax, -61520(%rbp)
	cmpl	$0, -61520(%rbp)
	jns	.L41
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 208 16 discriminator 2
	movq	-61576(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 208 16
	jmp	.L28
.L41:
	.loc 1 208 16 discriminator 2
	cmpl	$0, -61520(%rbp)
	jne	.L42
	.loc 1 208 16 discriminator 3
	movq	-61576(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 208 16 discriminator 1
	call	__errno_location@PLT
	.loc 1 208 16 discriminator 2
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 208 16
	jmp	.L28
.L42:
	.loc 1 208 16 discriminator 4
	movl	-61520(%rbp), %eax
.LBE10:
	.loc 1 208 14 is_stmt 1 discriminator 4
	movl	%eax, -61548(%rbp)
	.loc 1 209 5
	movl	-61460(%rbp), %esi
	movl	-61464(%rbp), %ecx
	.loc 1 209 122
	movzbl	-61465(%rbp), %eax
	.loc 1 209 5
	movzbl	%al, %edx
	movl	-61548(%rbp), %eax
	movl	%esi, %r8d
	movl	%eax, %esi
	leaq	.LC25(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 210 5
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 212 20
	leaq	-61466(%rbp), %rax
	movq	%rax, -61480(%rbp)
.LBB11:
	.loc 1 213 14
	movl	$0, -61552(%rbp)
	.loc 1 213 5
	jmp	.L43
.L44:
	.loc 1 215 30
	movl	-61552(%rbp), %eax
	movslq	%eax, %rdx
	movq	-61480(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	.loc 1 215 9
	movzbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 213 52 discriminator 3
	addl	$1, -61552(%rbp)
.L43:
	.loc 1 213 23 discriminator 1
	movl	-61552(%rbp), %eax
	cmpl	$9, %eax
	jbe	.L44
.LBE11:
	.loc 1 217 5
	movl	$10, %edi
	call	putchar@PLT
	.loc 1 219 17
	movl	$0, -61556(%rbp)
	.loc 1 220 11
	jmp	.L45
.L48:
	.loc 1 222 9
	leaq	-30736(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 223 20
	movl	-61532(%rbp), %eax
	movslq	%eax, %rdx
	movq	-61488(%rbp), %rcx
	leaq	-30736(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	fread@PLT
	.loc 1 223 18 discriminator 1
	movl	%eax, -61548(%rbp)
.LBB12:
	.loc 1 224 20
	movl	-61548(%rbp), %eax
	movslq	%eax, %rdx
	movq	-61576(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30736(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 224 20 is_stmt 0 discriminator 1
	movl	%eax, -61512(%rbp)
	cmpl	$0, -61512(%rbp)
	jns	.L46
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 224 20 discriminator 2
	movq	-61576(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 224 20
	jmp	.L28
.L46:
	.loc 1 224 20 discriminator 2
	cmpl	$0, -61512(%rbp)
	jne	.L47
	.loc 1 224 20 discriminator 3
	movq	-61576(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 224 20 discriminator 1
	call	__errno_location@PLT
	.loc 1 224 20 discriminator 2
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 224 20
	jmp	.L28
.L47:
	.loc 1 224 20 discriminator 4
	movl	-61512(%rbp), %eax
.LBE12:
	.loc 1 224 18 is_stmt 1 discriminator 4
	movl	%eax, -61548(%rbp)
	.loc 1 225 9
	movl	-61548(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC28(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 227 21
	movl	-61548(%rbp), %eax
	addl	%eax, -61556(%rbp)
.L45:
	.loc 1 220 24
	movl	-61556(%rbp), %eax
	cmpl	-61532(%rbp), %eax
	jl	.L48
	.loc 1 230 5
	leaq	-61456(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.LBB13:
	.loc 1 231 16
	movq	-61576(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-61456(%rbp), %rsi
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 231 16 is_stmt 0 discriminator 1
	movl	%eax, -61516(%rbp)
	cmpl	$0, -61516(%rbp)
	jns	.L49
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 231 16 discriminator 2
	movq	-61576(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 231 16
	jmp	.L28
.L49:
	.loc 1 231 16 discriminator 2
	cmpl	$0, -61516(%rbp)
	jne	.L50
	.loc 1 231 16 discriminator 3
	movq	-61576(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 231 16 discriminator 1
	call	__errno_location@PLT
	.loc 1 231 16 discriminator 2
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 231 16
	jmp	.L28
.L50:
	.loc 1 231 16 discriminator 4
	movl	-61516(%rbp), %eax
.LBE13:
	.loc 1 231 14 is_stmt 1 discriminator 4
	movl	%eax, -61548(%rbp)
	.loc 1 232 9
	leaq	-61456(%rbp), %rax
	movl	$7, %edx
	leaq	.LC8(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 232 8 discriminator 1
	testl	%eax, %eax
	jne	.L51
	.loc 1 234 9
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 235 9
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 236 9
	movq	-61504(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 237 66
	movq	-61584(%rbp), %rax
	movzbl	1(%rax), %eax
	.loc 1 237 9
	movzbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 238 9
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L28
.L51:
	.loc 1 242 9
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 243 9
	leaq	.LC31(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 244 9
	movq	-61504(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 245 68
	movq	-61584(%rbp), %rax
	movzbl	1(%rax), %eax
	.loc 1 245 9
	movzbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 246 9
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L28:
	.loc 1 251 5
	movq	-61488(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
.L26:
	.loc 1 252 1
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L52
	call	__stack_chk_fail@PLT
.L52:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE322:
	.size	get_command, .-get_command
	.section	.rodata
	.align 8
.LC32:
	.string	"\033[36m\n=========================================\n\033[0m"
	.align 8
.LC33:
	.string	"\033[36m    PROCESSING LIST COMMAND\n\033[0m"
	.align 8
.LC34:
	.string	"\033[36m    Server directory: %s\n\033[0m"
	.align 8
.LC35:
	.string	"\033[36m=========================================\n\n\033[0m"
	.align 8
.LC36:
	.string	"\033[32m\n[+] Directory listing completed successfully\n\n\033[0m"
	.text
	.globl	ls_command
	.type	ls_command, @function
ls_command:
.LFB323:
	.loc 1 255 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	-28672(%rsp), %r11
.LPSRL2:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL2
	subq	$2096, %rsp
	movq	%rdi, -30760(%rbp)
	movq	%rsi, -30768(%rbp)
	.loc 1 255 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 256 5
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 257 5
	leaq	.LC33(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 258 5
	movq	-30760(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC34(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 259 5
	leaq	.LC35(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 261 9
	movl	$0, -30740(%rbp)
	.loc 1 265 26
	movq	-30760(%rbp), %rax
	movq	8(%rax), %rdx
	.loc 1 265 5
	movq	-30760(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	list_directory
	.loc 1 268 5
	movq	-30760(%rbp), %rax
	movl	4(%rax), %eax
	movl	$0, %ecx
	movl	$7, %edx
	leaq	.LC8(%rip), %rsi
	movl	%eax, %edi
	call	send@PLT
	.loc 1 270 5
	leaq	.LC36(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 271 1
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L54
	call	__stack_chk_fail@PLT
.L54:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE323:
	.size	ls_command, .-ls_command
	.section	.rodata
	.align 8
.LC37:
	.string	"\033[36m[*] Scanning directory: %s\n\033[0m"
	.align 8
.LC38:
	.string	"\033[31m[-] Failed to open directory: %s\n\033[0m"
.LC39:
	.string	"."
.LC40:
	.string	".."
.LC41:
	.string	"%s/%s"
	.align 8
.LC42:
	.string	"\033[31m[-] Failed to get file status: %s\n\033[0m"
.LC43:
	.string	"%s"
	.align 8
.LC44:
	.string	"\033[32m[+] Found chunk file: %s (Chunk ID: %d)\n\033[0m"
	.text
	.globl	list_directory
	.type	list_directory, @function
list_directory:
.LFB324:
	.loc 1 280 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$232, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -8424(%rbp)
	movq	%rsi, -8432(%rbp)
	.loc 1 280 1
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 1 286 5
	movq	-8432(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC37(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 288 10
	movq	-8432(%rbp), %rax
	movq	%rax, %rdi
	call	opendir@PLT
	movq	%rax, -8408(%rbp)
	.loc 1 289 8
	cmpq	$0, -8408(%rbp)
	jne	.L58
	.loc 1 291 9
	movq	stderr(%rip), %rax
	movq	-8432(%rbp), %rdx
	leaq	.LC38(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 292 84
	call	__errno_location@PLT
	.loc 1 292 9 discriminator 1
	movl	(%rax), %ebx
	.loc 1 292 76 discriminator 1
	call	__errno_location@PLT
	.loc 1 292 9 discriminator 2
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rdx
	.loc 1 292 9 is_stmt 0 discriminator 3
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	jmp	.L55
.L65:
.LBB14:
	.loc 1 299 25 is_stmt 1
	movq	-8400(%rbp), %rax
	addq	$19, %rax
	.loc 1 299 13
	leaq	.LC39(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 299 12 discriminator 1
	testl	%eax, %eax
	je	.L67
	.loc 1 299 60 discriminator 2
	movq	-8400(%rbp), %rax
	addq	$19, %rax
	.loc 1 299 48 discriminator 2
	leaq	.LC40(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 299 45 discriminator 1
	testl	%eax, %eax
	je	.L67
	.loc 1 306 75
	movq	-8400(%rbp), %rax
	leaq	19(%rax), %rcx
	.loc 1 306 9
	movq	-8432(%rbp), %rdx
	leaq	-8224(%rbp), %rax
	movq	%rcx, %r8
	movq	%rdx, %rcx
	leaq	.LC41(%rip), %rdx
	movl	$4096, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	.loc 1 309 13
	leaq	-8368(%rbp), %rdx
	leaq	-8224(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	stat@PLT
	.loc 1 309 12 discriminator 1
	testl	%eax, %eax
	jns	.L62
	.loc 1 311 13
	movq	stderr(%rip), %rax
	leaq	-8224(%rbp), %rdx
	leaq	.LC42(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 312 13
	jmp	.L58
.L62:
	.loc 1 315 13
	movl	-8344(%rbp), %eax
	andl	$61440, %eax
	.loc 1 315 12
	cmpl	$32768, %eax
	jne	.L58
.LBB15:
	.loc 1 318 50
	movq	-8400(%rbp), %rax
	addq	$19, %rax
	.loc 1 318 37
	movl	$95, %esi
	movq	%rax, %rdi
	call	strrchr@PLT
	movq	%rax, -8392(%rbp)
	.loc 1 319 16
	cmpq	$0, -8392(%rbp)
	je	.L58
	.loc 1 319 44 discriminator 1
	call	__ctype_b_loc@PLT
	movq	(%rax), %rax
	movq	-8392(%rbp), %rdx
	addq	$1, %rdx
	movzbl	(%rdx), %edx
	movsbq	%dl, %rdx
	addq	%rdx, %rdx
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$2048, %eax
	.loc 1 319 41 discriminator 1
	testl	%eax, %eax
	je	.L58
.LBB16:
	.loc 1 325 67
	movq	-8400(%rbp), %rax
	leaq	19(%rax), %rdx
	.loc 1 325 17
	leaq	-4128(%rbp), %rax
	movq	%rdx, %rcx
	leaq	.LC43(%rip), %rdx
	movl	$4096, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	.loc 1 328 53
	movq	-8392(%rbp), %rax
	addq	$1, %rax
	.loc 1 328 32
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -8412(%rbp)
	.loc 1 330 17
	movl	-8412(%rbp), %edx
	leaq	-4128(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC44(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 333 34
	movb	$3, -8378(%rbp)
	movl	-8412(%rbp), %eax
	movb	%al, -8377(%rbp)
	.loc 1 336 40
	leaq	-4128(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 333 34
	movl	%eax, -8376(%rbp)
	movl	$0, -8372(%rbp)
	.loc 1 340 17
	movq	-8424(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-8378(%rbp), %rsi
	movl	$0, %ecx
	movl	$10, %edx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 341 72
	movl	-8376(%rbp), %eax
	.loc 1 341 17
	movl	%eax, %edx
	movq	-8424(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-4128(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	jmp	.L58
.L67:
.LBE16:
.LBE15:
	.loc 1 301 13
	nop
.L58:
.LBE14:
	.loc 1 296 21
	movq	-8408(%rbp), %rax
	movq	%rax, %rdi
	call	readdir@PLT
	movq	%rax, -8400(%rbp)
	.loc 1 296 34 discriminator 1
	cmpq	$0, -8400(%rbp)
	jne	.L65
	.loc 1 346 5
	movq	-8408(%rbp), %rax
	movq	%rax, %rdi
	call	closedir@PLT
.L55:
	.loc 1 347 1
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L66
	call	__stack_chk_fail@PLT
.L66:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE324:
	.size	list_directory, .-list_directory
	.section	.rodata
	.align 8
.LC45:
	.string	"\033[32m    DELETE FILE SUCCESSFUL\n\033[0m"
	.align 8
.LC46:
	.string	"\033[32m    CHUNK: %d deleted !\n\033[0m"
.LC47:
	.string	"\033[31m    DELETE FAILED\n\033[0m"
	.align 8
.LC48:
	.string	"\033[31m    CHUNK: %d deleted !\n\033[0m"
	.text
	.globl	delete_command
	.type	delete_command, @function
delete_command:
.LFB325:
	.loc 1 350 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	-28672(%rsp), %r11
.LPSRL3:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL3
	subq	$2112, %rsp
	movq	%rdi, -30776(%rbp)
	movq	%rsi, -30784(%rbp)
	.loc 1 350 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 351 9
	movl	$0, -30760(%rbp)
	.loc 1 354 5
	leaq	-30736(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 355 22
	movq	-30784(%rbp), %rax
	movl	2(%rax), %eax
	.loc 1 355 7
	cmpl	$30720, %eax
	jbe	.L69
	.loc 1 356 9
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 357 9
	jmp	.L70
.L69:
.LBB17:
	.loc 1 359 16
	movq	-30784(%rbp), %rax
	movl	2(%rax), %eax
	movl	%eax, %edx
	movq	-30776(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30736(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 359 16 is_stmt 0 discriminator 1
	movl	%eax, -30756(%rbp)
	cmpl	$0, -30756(%rbp)
	jns	.L71
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 359 16 discriminator 2
	movq	-30776(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 359 16
	jmp	.L70
.L71:
	.loc 1 359 16 discriminator 2
	cmpl	$0, -30756(%rbp)
	jne	.L72
	.loc 1 359 16 discriminator 3
	movq	-30776(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 359 16 discriminator 1
	call	__errno_location@PLT
	.loc 1 359 16 discriminator 2
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 359 16
	jmp	.L70
.L72:
	.loc 1 359 16 discriminator 4
	movl	-30756(%rbp), %eax
.LBE17:
	.loc 1 359 14 is_stmt 1 discriminator 4
	movl	%eax, -30760(%rbp)
	.loc 1 363 78
	movq	-30784(%rbp), %rax
	movzbl	1(%rax), %eax
	.loc 1 363 5
	movzbl	%al, %esi
	movq	-30776(%rbp), %rax
	movq	8(%rax), %rdx
	leaq	-30736(%rbp), %rcx
	leaq	-30752(%rbp), %rax
	movl	%esi, %r8d
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	.loc 1 365 16
	movq	-30752(%rbp), %rax
	leaq	.LC4(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -30744(%rbp)
	.loc 1 366 8
	cmpq	$0, -30744(%rbp)
	jne	.L73
	.loc 1 368 9
	movq	-30776(%rbp), %rax
	movl	4(%rax), %eax
	movl	$0, %ecx
	movl	$8, %edx
	leaq	.LC15(%rip), %rsi
	movl	%eax, %edi
	call	send@PLT
.L73:
	.loc 1 371 9
	movq	-30752(%rbp), %rax
	movq	%rax, %rdi
	call	remove@PLT
	.loc 1 371 8 discriminator 1
	testl	%eax, %eax
	js	.L74
	.loc 1 373 9
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 374 9
	leaq	.LC45(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 375 9
	movq	-30752(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 376 69
	movq	-30784(%rbp), %rax
	movzbl	1(%rax), %eax
	.loc 1 376 9
	movzbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC46(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 377 9
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 378 9
	movq	-30776(%rbp), %rax
	movl	4(%rax), %eax
	movl	$0, %ecx
	movl	$7, %edx
	leaq	.LC8(%rip), %rsi
	movl	%eax, %edi
	call	send@PLT
	jmp	.L75
.L74:
	.loc 1 382 9
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 383 9
	leaq	.LC47(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 384 9
	movq	-30752(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 385 69
	movq	-30784(%rbp), %rax
	movzbl	1(%rax), %eax
	.loc 1 385 9
	movzbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC48(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 386 9
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 387 9
	movq	-30776(%rbp), %rax
	movl	4(%rax), %eax
	movl	$0, %ecx
	movl	$8, %edx
	leaq	.LC15(%rip), %rsi
	movl	%eax, %edi
	call	send@PLT
.L75:
	.loc 1 390 5
	movq	-30752(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L70:
	.loc 1 393 5
	nop
	.loc 1 394 1
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L77
	call	__stack_chk_fail@PLT
.L77:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE325:
	.size	delete_command, .-delete_command
	.section	.rodata
	.align 8
.LC49:
	.string	"\033[31m[-] (%d) Select syscall failed with error: %d (%s)\n\033[0m"
	.align 8
.LC50:
	.string	"\033[33m\n[!] (%d) CONNECTION TIMEOUT:\n[-] Client connection idle for %d seconds\n------------------------------------------------------------\n\033[0m"
	.align 8
.LC51:
	.string	"\033[35m\n=========================================\n\033[0m"
.LC52:
	.string	"SERVER INFO"
.LC53:
	.string	"UNKNOWN"
.LC54:
	.string	"DELETE"
.LC55:
	.string	"LIST"
.LC56:
	.string	"GET"
.LC57:
	.string	"PUT"
.LC58:
	.string	"\033[35m    OPERATION: %s\n\033[0m"
	.align 8
.LC59:
	.string	"\033[35m    CHUNK NUMBER: %d \n\033[0m"
	.align 8
.LC60:
	.string	"\033[35m    FILENAME LENGTH: %d \n\033[0m"
	.align 8
.LC61:
	.string	"\033[35m    DATA LENGTH: %d \n\033[0m"
	.align 8
.LC62:
	.string	"\033[35m=========================================\n\033[0m"
	.text
	.globl	handle_req
	.type	handle_req, @function
handle_req:
.LFB326:
	.loc 1 414 1
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
.LPSRL4:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL4
	subq	$2272, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -30952(%rbp)
	.loc 1 414 1
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
.L104:
.LBB18:
.LBB19:
	.loc 1 422 9
	leaq	-30880(%rbp), %rax
	movq	%rax, -30920(%rbp)
	movl	$0, -30936(%rbp)
	jmp	.L79
.L80:
	.loc 1 422 9 is_stmt 0 discriminator 3
	movq	-30920(%rbp), %rax
	movl	-30936(%rbp), %edx
	movq	$0, (%rax,%rdx,8)
	addl	$1, -30936(%rbp)
.L79:
	.loc 1 422 9 discriminator 1
	cmpl	$15, -30936(%rbp)
	jbe	.L80
.LBE19:
	.loc 1 423 9 is_stmt 1
	movq	-30952(%rbp), %rax
	movl	4(%rax), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	movl	%eax, %esi
	movslq	%esi, %rax
	movq	-30880(%rbp,%rax,8), %rdx
	movq	-30952(%rbp), %rax
	movl	4(%rax), %eax
	andl	$63, %eax
	movl	$1, %edi
	movl	%eax, %ecx
	salq	%cl, %rdi
	movq	%rdi, %rax
	orq	%rax, %rdx
	movslq	%esi, %rax
	movq	%rdx, -30880(%rbp,%rax,8)
	.loc 1 426 24
	movq	$5, -30896(%rbp)
	movq	$0, -30888(%rbp)
	.loc 1 429 38
	movq	-30952(%rbp), %rax
	movl	4(%rax), %eax
	.loc 1 429 29
	leal	1(%rax), %edi
	leaq	-30896(%rbp), %rdx
	leaq	-30880(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	call	select@PLT
	movl	%eax, -30932(%rbp)
	.loc 1 431 12
	cmpl	$0, -30932(%rbp)
	jns	.L81
	.loc 1 434 47
	call	__errno_location@PLT
	.loc 1 433 13
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %r12
	.loc 1 434 31
	call	__errno_location@PLT
	.loc 1 433 13
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	.loc 1 433 13 is_stmt 0 discriminator 2
	movq	stderr(%rip), %rax
	movq	%r12, %r8
	movl	%ebx, %ecx
	leaq	.LC49(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 435 13 is_stmt 1
	jmp	.L103
.L81:
	.loc 1 439 17
	cmpl	$0, -30932(%rbp)
	jne	.L83
	.loc 1 441 13
	call	gettid@PLT
	.loc 1 441 13 is_stmt 0 discriminator 1
	movl	$5, %edx
	movl	%eax, %esi
	leaq	.LC50(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 445 13 is_stmt 1
	jmp	.L103
.L83:
	.loc 1 449 18
	movq	-30952(%rbp), %rax
	movl	4(%rax), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	cltq
	movq	-30880(%rbp,%rax,8), %rdx
	movq	-30952(%rbp), %rax
	movl	4(%rax), %eax
	andl	$63, %eax
	movl	$1, %esi
	movl	%eax, %ecx
	salq	%cl, %rsi
	movq	%rsi, %rax
	andq	%rdx, %rax
	.loc 1 449 17
	testq	%rax, %rax
	je	.L104
.LBB20:
	.loc 1 451 13
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 453 17
	movl	$0, -30928(%rbp)
	.loc 1 455 13
	leaq	-30906(%rbp), %rax
	movl	$10, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.LBB21:
	.loc 1 457 13
	movq	-30952(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30906(%rbp), %rsi
	movl	$0, %ecx
	movl	$10, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 457 13 is_stmt 0 discriminator 1
	movl	%eax, -30924(%rbp)
	cmpl	$0, -30924(%rbp)
	jns	.L85
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 457 13 discriminator 2
	movq	-30952(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 457 13
	jmp	.L86
.L85:
	.loc 1 457 13 discriminator 2
	cmpl	$0, -30924(%rbp)
	jne	.L87
	.loc 1 457 13 discriminator 4
	movq	-30952(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 457 13 discriminator 1
	call	__errno_location@PLT
	.loc 1 457 13 discriminator 2
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 457 13
	jmp	.L86
.L87:
.LBE21:
	.loc 1 459 13 is_stmt 1
	leaq	.LC51(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 461 34
	movzbl	-30906(%rbp), %eax
	.loc 1 460 13
	cmpb	$1, %al
	je	.L88
	.loc 1 461 74
	movzbl	-30906(%rbp), %eax
	.loc 1 462 56
	testb	%al, %al
	je	.L89
	.loc 1 462 72 discriminator 1
	movzbl	-30906(%rbp), %eax
	.loc 1 463 56
	cmpb	$3, %al
	je	.L90
	.loc 1 463 72 discriminator 1
	movzbl	-30906(%rbp), %eax
	.loc 1 464 56
	cmpb	$2, %al
	je	.L91
	.loc 1 464 72 discriminator 1
	movzbl	-30906(%rbp), %eax
	.loc 1 465 96
	cmpb	$5, %al
	jne	.L92
	.loc 1 465 96 is_stmt 0 discriminator 1
	leaq	.LC52(%rip), %rax
	jmp	.L97
.L92:
	.loc 1 465 96 discriminator 2
	leaq	.LC53(%rip), %rax
	jmp	.L97
.L91:
	.loc 1 464 56 is_stmt 1 discriminator 2
	leaq	.LC54(%rip), %rax
	jmp	.L97
.L90:
	.loc 1 463 56 discriminator 2
	leaq	.LC55(%rip), %rax
	jmp	.L97
.L89:
	.loc 1 462 56 discriminator 2
	leaq	.LC56(%rip), %rax
	jmp	.L97
.L88:
	.loc 1 460 13 discriminator 1
	leaq	.LC57(%rip), %rax
.L97:
	.loc 1 460 13 is_stmt 0 discriminator 3
	movq	%rax, %rsi
	leaq	.LC58(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 466 71 is_stmt 1
	movzbl	-30905(%rbp), %eax
	.loc 1 466 13
	movzbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC59(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 467 13
	movl	-30904(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC60(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 468 13
	movl	-30900(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC61(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 469 13
	leaq	.LC62(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 471 35
	movzbl	-30906(%rbp), %eax
	movzbl	%al, %eax
	.loc 1 471 13
	cmpl	$3, %eax
	je	.L98
	cmpl	$3, %eax
	jg	.L104
	cmpl	$2, %eax
	je	.L100
	cmpl	$2, %eax
	jg	.L104
	testl	%eax, %eax
	je	.L101
	cmpl	$1, %eax
	jne	.L104
	.loc 1 474 17
	leaq	-30906(%rbp), %rdx
	movq	-30952(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	put_command
	.loc 1 475 17
	jmp	.L102
.L101:
	.loc 1 477 17
	leaq	-30906(%rbp), %rdx
	movq	-30952(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_command
	.loc 1 478 17
	jmp	.L102
.L100:
	.loc 1 480 17
	leaq	-30906(%rbp), %rdx
	movq	-30952(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	delete_command
	.loc 1 481 17
	jmp	.L102
.L98:
	.loc 1 483 17
	leaq	-30906(%rbp), %rdx
	movq	-30952(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	ls_command
	.loc 1 484 17
	jmp	.L102
.L86:
.LBE20:
	.loc 1 435 13 discriminator 1
	jmp	.L103
.L102:
.LBE18:
	.loc 1 421 5
	jmp	.L104
.L103:
	.loc 1 493 5
	movq	-30952(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 495 12
	movl	$0, %eax
	.loc 1 496 1
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L106
	call	__stack_chk_fail@PLT
.L106:
	addq	$30944, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE326:
	.size	handle_req, .-handle_req
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/14/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h"
	.file 9 "/usr/include/x86_64-linux-gnu/sys/select.h"
	.file 10 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"
	.file 11 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h"
	.file 12 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.file 13 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h"
	.file 14 "/usr/include/unistd.h"
	.file 15 "/usr/include/x86_64-linux-gnu/bits/dirent.h"
	.file 16 "/usr/include/x86_64-linux-gnu/bits/sockaddr.h"
	.file 17 "/usr/include/x86_64-linux-gnu/bits/socket.h"
	.file 18 "/usr/include/netinet/in.h"
	.file 19 "/usr/include/netdb.h"
	.file 20 "/usr/include/x86_64-linux-gnu/bits/struct_stat.h"
	.file 21 "./common.h"
	.file 22 "/usr/include/ctype.h"
	.file 23 "/usr/include/dirent.h"
	.file 24 "/usr/include/stdlib.h"
	.file 25 "/usr/include/x86_64-linux-gnu/bits/unistd_ext.h"
	.file 26 "/usr/include/x86_64-linux-gnu/sys/stat.h"
	.file 27 "/usr/include/string.h"
	.file 28 "/usr/include/x86_64-linux-gnu/sys/socket.h"
	.file 29 "/usr/include/errno.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x150e
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x29
	.long	.LASF251
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x3
	.long	.LASF7
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
	.uleb128 0x2a
	.byte	0x8
	.uleb128 0x12
	.long	0x48
	.uleb128 0x8
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x8
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x1e
	.long	0x56
	.uleb128 0x8
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x3
	.long	.LASF8
	.byte	0x3
	.byte	0x26
	.byte	0x17
	.long	0x4f
	.uleb128 0x8
	.byte	0x2
	.byte	0x5
	.long	.LASF9
	.uleb128 0x3
	.long	.LASF10
	.byte	0x3
	.byte	0x28
	.byte	0x1c
	.long	0x56
	.uleb128 0x2b
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.long	.LASF11
	.byte	0x3
	.byte	0x2a
	.byte	0x16
	.long	0x41
	.uleb128 0x8
	.byte	0x8
	.byte	0x5
	.long	.LASF12
	.uleb128 0x3
	.long	.LASF13
	.byte	0x3
	.byte	0x91
	.byte	0x19
	.long	0x3a
	.uleb128 0x3
	.long	.LASF14
	.byte	0x3
	.byte	0x92
	.byte	0x19
	.long	0x41
	.uleb128 0x3
	.long	.LASF15
	.byte	0x3
	.byte	0x93
	.byte	0x19
	.long	0x41
	.uleb128 0x3
	.long	.LASF16
	.byte	0x3
	.byte	0x94
	.byte	0x19
	.long	0x3a
	.uleb128 0x3
	.long	.LASF17
	.byte	0x3
	.byte	0x96
	.byte	0x1a
	.long	0x41
	.uleb128 0x3
	.long	.LASF18
	.byte	0x3
	.byte	0x97
	.byte	0x1b
	.long	0x3a
	.uleb128 0x3
	.long	.LASF19
	.byte	0x3
	.byte	0x98
	.byte	0x19
	.long	0x9b
	.uleb128 0x3
	.long	.LASF20
	.byte	0x3
	.byte	0x99
	.byte	0x1b
	.long	0x9b
	.uleb128 0x3
	.long	.LASF21
	.byte	0x3
	.byte	0x9a
	.byte	0x19
	.long	0x88
	.uleb128 0x3
	.long	.LASF22
	.byte	0x3
	.byte	0xa0
	.byte	0x1a
	.long	0x9b
	.uleb128 0x3
	.long	.LASF23
	.byte	0x3
	.byte	0xa2
	.byte	0x1f
	.long	0x9b
	.uleb128 0x3
	.long	.LASF24
	.byte	0x3
	.byte	0xaf
	.byte	0x1d
	.long	0x9b
	.uleb128 0x3
	.long	.LASF25
	.byte	0x3
	.byte	0xb4
	.byte	0x1c
	.long	0x9b
	.uleb128 0x3
	.long	.LASF26
	.byte	0x3
	.byte	0xc2
	.byte	0x1b
	.long	0x9b
	.uleb128 0x3
	.long	.LASF27
	.byte	0x3
	.byte	0xc5
	.byte	0x21
	.long	0x9b
	.uleb128 0x5
	.long	0x15b
	.uleb128 0x8
	.byte	0x1
	.byte	0x6
	.long	.LASF28
	.uleb128 0x1e
	.long	0x15b
	.uleb128 0x3
	.long	.LASF29
	.byte	0x3
	.byte	0xd2
	.byte	0x17
	.long	0x41
	.uleb128 0xc
	.long	.LASF65
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x2fa
	.uleb128 0x1
	.long	.LASF30
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x88
	.byte	0
	.uleb128 0x1
	.long	.LASF31
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0x156
	.byte	0x8
	.uleb128 0x1
	.long	.LASF32
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0x156
	.byte	0x10
	.uleb128 0x1
	.long	.LASF33
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0x156
	.byte	0x18
	.uleb128 0x1
	.long	.LASF34
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0x156
	.byte	0x20
	.uleb128 0x1
	.long	.LASF35
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0x156
	.byte	0x28
	.uleb128 0x1
	.long	.LASF36
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0x156
	.byte	0x30
	.uleb128 0x1
	.long	.LASF37
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0x156
	.byte	0x38
	.uleb128 0x1
	.long	.LASF38
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0x156
	.byte	0x40
	.uleb128 0x1
	.long	.LASF39
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0x156
	.byte	0x48
	.uleb128 0x1
	.long	.LASF40
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0x156
	.byte	0x50
	.uleb128 0x1
	.long	.LASF41
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0x156
	.byte	0x58
	.uleb128 0x1
	.long	.LASF42
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x313
	.byte	0x60
	.uleb128 0x1
	.long	.LASF43
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x318
	.byte	0x68
	.uleb128 0x1
	.long	.LASF44
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x88
	.byte	0x70
	.uleb128 0x1
	.long	.LASF45
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x88
	.byte	0x74
	.uleb128 0x1
	.long	.LASF46
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0xea
	.byte	0x78
	.uleb128 0x1
	.long	.LASF47
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x56
	.byte	0x80
	.uleb128 0x1
	.long	.LASF48
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x62
	.byte	0x82
	.uleb128 0x1
	.long	.LASF49
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x31d
	.byte	0x83
	.uleb128 0x1
	.long	.LASF50
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x32d
	.byte	0x88
	.uleb128 0x1
	.long	.LASF51
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0xf6
	.byte	0x90
	.uleb128 0x1
	.long	.LASF52
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x337
	.byte	0x98
	.uleb128 0x1
	.long	.LASF53
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x341
	.byte	0xa0
	.uleb128 0x1
	.long	.LASF54
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x318
	.byte	0xa8
	.uleb128 0x1
	.long	.LASF55
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0x48
	.byte	0xb0
	.uleb128 0x1
	.long	.LASF56
	.byte	0x4
	.byte	0x5f
	.byte	0x15
	.long	0x346
	.byte	0xb8
	.uleb128 0x1
	.long	.LASF57
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x88
	.byte	0xc0
	.uleb128 0x1
	.long	.LASF58
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x34b
	.byte	0xc4
	.byte	0
	.uleb128 0x3
	.long	.LASF59
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0x173
	.uleb128 0x2c
	.long	.LASF252
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0x14
	.long	.LASF60
	.uleb128 0x5
	.long	0x30e
	.uleb128 0x5
	.long	0x173
	.uleb128 0x7
	.long	0x15b
	.long	0x32d
	.uleb128 0xd
	.long	0x3a
	.byte	0
	.byte	0
	.uleb128 0x5
	.long	0x306
	.uleb128 0x14
	.long	.LASF61
	.uleb128 0x5
	.long	0x332
	.uleb128 0x14
	.long	.LASF62
	.uleb128 0x5
	.long	0x33c
	.uleb128 0x5
	.long	0x318
	.uleb128 0x7
	.long	0x15b
	.long	0x35b
	.uleb128 0xd
	.long	0x3a
	.byte	0x13
	.byte	0
	.uleb128 0x5
	.long	0x162
	.uleb128 0x12
	.long	0x35b
	.uleb128 0x3
	.long	.LASF63
	.byte	0x6
	.byte	0x4e
	.byte	0x13
	.long	0x13e
	.uleb128 0x5
	.long	0x2fa
	.uleb128 0x12
	.long	0x371
	.uleb128 0x2d
	.long	.LASF253
	.byte	0x6
	.byte	0x97
	.byte	0xe
	.long	0x371
	.uleb128 0x8
	.byte	0x8
	.byte	0x5
	.long	.LASF64
	.uleb128 0x5
	.long	0x5d
	.uleb128 0xc
	.long	.LASF66
	.byte	0x10
	.byte	0x7
	.byte	0x8
	.byte	0x8
	.long	0x3bb
	.uleb128 0x1
	.long	.LASF67
	.byte	0x7
	.byte	0xe
	.byte	0xc
	.long	0x10e
	.byte	0
	.uleb128 0x1
	.long	.LASF68
	.byte	0x7
	.byte	0xf
	.byte	0x11
	.long	0x11a
	.byte	0x8
	.byte	0
	.uleb128 0xc
	.long	.LASF69
	.byte	0x10
	.byte	0x8
	.byte	0xb
	.byte	0x8
	.long	0x3e3
	.uleb128 0x1
	.long	.LASF67
	.byte	0x8
	.byte	0x10
	.byte	0xc
	.long	0x10e
	.byte	0
	.uleb128 0x1
	.long	.LASF70
	.byte	0x8
	.byte	0x15
	.byte	0x15
	.long	0x14a
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	.LASF71
	.byte	0x9
	.byte	0x31
	.byte	0x12
	.long	0x9b
	.uleb128 0x1f
	.byte	0x80
	.byte	0x9
	.byte	0x3b
	.long	0x405
	.uleb128 0x1
	.long	.LASF72
	.byte	0x9
	.byte	0x40
	.byte	0xf
	.long	0x405
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x3e3
	.long	0x415
	.uleb128 0xd
	.long	0x3a
	.byte	0xf
	.byte	0
	.uleb128 0x3
	.long	.LASF73
	.byte	0x9
	.byte	0x46
	.byte	0x5
	.long	0x3ef
	.uleb128 0x8
	.byte	0x8
	.byte	0x7
	.long	.LASF74
	.uleb128 0xc
	.long	.LASF75
	.byte	0x10
	.byte	0xa
	.byte	0x33
	.byte	0x10
	.long	0x450
	.uleb128 0x1
	.long	.LASF76
	.byte	0xa
	.byte	0x35
	.byte	0x23
	.long	0x450
	.byte	0
	.uleb128 0x1
	.long	.LASF77
	.byte	0xa
	.byte	0x36
	.byte	0x23
	.long	0x450
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.long	0x428
	.uleb128 0x3
	.long	.LASF78
	.byte	0xa
	.byte	0x37
	.byte	0x3
	.long	0x428
	.uleb128 0xc
	.long	.LASF79
	.byte	0x28
	.byte	0xb
	.byte	0x16
	.byte	0x8
	.long	0x4d7
	.uleb128 0x1
	.long	.LASF80
	.byte	0xb
	.byte	0x18
	.byte	0x7
	.long	0x88
	.byte	0
	.uleb128 0x1
	.long	.LASF81
	.byte	0xb
	.byte	0x19
	.byte	0x10
	.long	0x41
	.byte	0x4
	.uleb128 0x1
	.long	.LASF82
	.byte	0xb
	.byte	0x1a
	.byte	0x7
	.long	0x88
	.byte	0x8
	.uleb128 0x1
	.long	.LASF83
	.byte	0xb
	.byte	0x1c
	.byte	0x10
	.long	0x41
	.byte	0xc
	.uleb128 0x1
	.long	.LASF84
	.byte	0xb
	.byte	0x20
	.byte	0x7
	.long	0x88
	.byte	0x10
	.uleb128 0x1
	.long	.LASF85
	.byte	0xb
	.byte	0x22
	.byte	0x9
	.long	0x75
	.byte	0x14
	.uleb128 0x1
	.long	.LASF86
	.byte	0xb
	.byte	0x23
	.byte	0x9
	.long	0x75
	.byte	0x16
	.uleb128 0x1
	.long	.LASF87
	.byte	0xb
	.byte	0x24
	.byte	0x14
	.long	0x455
	.byte	0x18
	.byte	0
	.uleb128 0x20
	.byte	0x28
	.byte	0xc
	.byte	0x43
	.byte	0x9
	.long	0x505
	.uleb128 0x13
	.long	.LASF88
	.byte	0xc
	.byte	0x45
	.byte	0x1c
	.long	0x461
	.uleb128 0x13
	.long	.LASF89
	.byte	0xc
	.byte	0x46
	.byte	0x8
	.long	0x505
	.uleb128 0x13
	.long	.LASF90
	.byte	0xc
	.byte	0x47
	.byte	0xc
	.long	0x9b
	.byte	0
	.uleb128 0x7
	.long	0x15b
	.long	0x515
	.uleb128 0xd
	.long	0x3a
	.byte	0x27
	.byte	0
	.uleb128 0x3
	.long	.LASF91
	.byte	0xc
	.byte	0x48
	.byte	0x3
	.long	0x4d7
	.uleb128 0x5
	.long	0x526
	.uleb128 0x2e
	.uleb128 0x3
	.long	.LASF92
	.byte	0xd
	.byte	0x18
	.byte	0x13
	.long	0x69
	.uleb128 0x3
	.long	.LASF93
	.byte	0xd
	.byte	0x19
	.byte	0x14
	.long	0x7c
	.uleb128 0x3
	.long	.LASF94
	.byte	0xd
	.byte	0x1a
	.byte	0x14
	.long	0x8f
	.uleb128 0x2f
	.long	.LASF95
	.byte	0xe
	.value	0x112
	.byte	0x15
	.long	0x167
	.uleb128 0x5
	.long	0x156
	.uleb128 0x12
	.long	0x558
	.uleb128 0x30
	.long	.LASF96
	.value	0x118
	.byte	0xf
	.byte	0x16
	.byte	0x8
	.long	0x5b2
	.uleb128 0x1
	.long	.LASF97
	.byte	0xf
	.byte	0x19
	.byte	0xd
	.long	0xc6
	.byte	0
	.uleb128 0x1
	.long	.LASF98
	.byte	0xf
	.byte	0x1a
	.byte	0xd
	.long	0xea
	.byte	0x8
	.uleb128 0x1
	.long	.LASF99
	.byte	0xf
	.byte	0x1f
	.byte	0x18
	.long	0x56
	.byte	0x10
	.uleb128 0x1
	.long	.LASF100
	.byte	0xf
	.byte	0x20
	.byte	0x13
	.long	0x4f
	.byte	0x12
	.uleb128 0x1
	.long	.LASF101
	.byte	0xf
	.byte	0x21
	.byte	0xa
	.long	0x5b2
	.byte	0x13
	.byte	0
	.uleb128 0x7
	.long	0x15b
	.long	0x5c2
	.uleb128 0xd
	.long	0x3a
	.byte	0xff
	.byte	0
	.uleb128 0x31
	.string	"DIR"
	.byte	0x17
	.byte	0x7f
	.byte	0x1c
	.long	0x5ce
	.uleb128 0x14
	.long	.LASF102
	.uleb128 0x3
	.long	.LASF103
	.byte	0x10
	.byte	0x1c
	.byte	0x1c
	.long	0x56
	.uleb128 0xc
	.long	.LASF104
	.byte	0x10
	.byte	0x11
	.byte	0xb8
	.byte	0x27
	.long	0x607
	.uleb128 0x1
	.long	.LASF105
	.byte	0x11
	.byte	0xba
	.byte	0x5
	.long	0x5d3
	.byte	0
	.uleb128 0x1
	.long	.LASF106
	.byte	0x11
	.byte	0xbb
	.byte	0xa
	.long	0x607
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	0x15b
	.long	0x617
	.uleb128 0xd
	.long	0x3a
	.byte	0xd
	.byte	0
	.uleb128 0xc
	.long	.LASF107
	.byte	0x80
	.byte	0x11
	.byte	0xc5
	.byte	0x27
	.long	0x64c
	.uleb128 0x1
	.long	.LASF108
	.byte	0x11
	.byte	0xc7
	.byte	0x5
	.long	0x5d3
	.byte	0
	.uleb128 0x1
	.long	.LASF109
	.byte	0x11
	.byte	0xc8
	.byte	0xa
	.long	0x64c
	.byte	0x2
	.uleb128 0x1
	.long	.LASF110
	.byte	0x11
	.byte	0xc9
	.byte	0x14
	.long	0x3a
	.byte	0x78
	.byte	0
	.uleb128 0x7
	.long	0x15b
	.long	0x65c
	.uleb128 0xd
	.long	0x3a
	.byte	0x75
	.byte	0
	.uleb128 0x5
	.long	0x5df
	.uleb128 0xc
	.long	.LASF111
	.byte	0x10
	.byte	0x12
	.byte	0xf7
	.byte	0x27
	.long	0x6a3
	.uleb128 0x1
	.long	.LASF112
	.byte	0x12
	.byte	0xf9
	.byte	0x5
	.long	0x5d3
	.byte	0
	.uleb128 0x1
	.long	.LASF113
	.byte	0x12
	.byte	0xfa
	.byte	0xf
	.long	0x71f
	.byte	0x2
	.uleb128 0x1
	.long	.LASF114
	.byte	0x12
	.byte	0xfb
	.byte	0x14
	.long	0x704
	.byte	0x4
	.uleb128 0x1
	.long	.LASF115
	.byte	0x12
	.byte	0xfe
	.byte	0x13
	.long	0x7a4
	.byte	0x8
	.byte	0
	.uleb128 0x21
	.long	.LASF116
	.byte	0x1c
	.byte	0x12
	.value	0x108
	.byte	0x27
	.long	0x6f8
	.uleb128 0x9
	.long	.LASF117
	.byte	0x12
	.value	0x10a
	.byte	0x5
	.long	0x5d3
	.byte	0
	.uleb128 0x9
	.long	.LASF118
	.byte	0x12
	.value	0x10b
	.byte	0xf
	.long	0x71f
	.byte	0x2
	.uleb128 0x9
	.long	.LASF119
	.byte	0x12
	.value	0x10c
	.byte	0xe
	.long	0x53f
	.byte	0x4
	.uleb128 0x9
	.long	.LASF120
	.byte	0x12
	.value	0x10d
	.byte	0x15
	.long	0x789
	.byte	0x8
	.uleb128 0x9
	.long	.LASF121
	.byte	0x12
	.value	0x10e
	.byte	0xe
	.long	0x53f
	.byte	0x18
	.byte	0
	.uleb128 0x3
	.long	.LASF122
	.byte	0x12
	.byte	0x1e
	.byte	0x12
	.long	0x53f
	.uleb128 0xc
	.long	.LASF123
	.byte	0x4
	.byte	0x12
	.byte	0x1f
	.byte	0x8
	.long	0x71f
	.uleb128 0x1
	.long	.LASF124
	.byte	0x12
	.byte	0x21
	.byte	0xf
	.long	0x6f8
	.byte	0
	.byte	0
	.uleb128 0x3
	.long	.LASF125
	.byte	0x12
	.byte	0x7d
	.byte	0x12
	.long	0x533
	.uleb128 0x20
	.byte	0x10
	.byte	0x12
	.byte	0xdf
	.byte	0x5
	.long	0x759
	.uleb128 0x13
	.long	.LASF126
	.byte	0x12
	.byte	0xe1
	.byte	0xa
	.long	0x759
	.uleb128 0x13
	.long	.LASF127
	.byte	0x12
	.byte	0xe2
	.byte	0xb
	.long	0x769
	.uleb128 0x13
	.long	.LASF128
	.byte	0x12
	.byte	0xe3
	.byte	0xb
	.long	0x779
	.byte	0
	.uleb128 0x7
	.long	0x527
	.long	0x769
	.uleb128 0xd
	.long	0x3a
	.byte	0xf
	.byte	0
	.uleb128 0x7
	.long	0x533
	.long	0x779
	.uleb128 0xd
	.long	0x3a
	.byte	0x7
	.byte	0
	.uleb128 0x7
	.long	0x53f
	.long	0x789
	.uleb128 0xd
	.long	0x3a
	.byte	0x3
	.byte	0
	.uleb128 0xc
	.long	.LASF129
	.byte	0x10
	.byte	0x12
	.byte	0xdd
	.byte	0x8
	.long	0x7a4
	.uleb128 0x1
	.long	.LASF130
	.byte	0x12
	.byte	0xe4
	.byte	0x9
	.long	0x72b
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x4f
	.long	0x7b4
	.uleb128 0xd
	.long	0x3a
	.byte	0x7
	.byte	0
	.uleb128 0x21
	.long	.LASF131
	.byte	0x30
	.byte	0x13
	.value	0x235
	.byte	0x8
	.long	0x833
	.uleb128 0x9
	.long	.LASF132
	.byte	0x13
	.value	0x237
	.byte	0x7
	.long	0x88
	.byte	0
	.uleb128 0x9
	.long	.LASF133
	.byte	0x13
	.value	0x238
	.byte	0x7
	.long	0x88
	.byte	0x4
	.uleb128 0x9
	.long	.LASF134
	.byte	0x13
	.value	0x239
	.byte	0x7
	.long	0x88
	.byte	0x8
	.uleb128 0x9
	.long	.LASF135
	.byte	0x13
	.value	0x23a
	.byte	0x7
	.long	0x88
	.byte	0xc
	.uleb128 0x9
	.long	.LASF136
	.byte	0x13
	.value	0x23b
	.byte	0xd
	.long	0x54b
	.byte	0x10
	.uleb128 0x9
	.long	.LASF137
	.byte	0x13
	.value	0x23c
	.byte	0x14
	.long	0x65c
	.byte	0x18
	.uleb128 0x9
	.long	.LASF138
	.byte	0x13
	.value	0x23d
	.byte	0x9
	.long	0x156
	.byte	0x20
	.uleb128 0x9
	.long	.LASF139
	.byte	0x13
	.value	0x23e
	.byte	0x14
	.long	0x833
	.byte	0x28
	.byte	0
	.uleb128 0x5
	.long	0x7b4
	.uleb128 0xc
	.long	.LASF140
	.byte	0x90
	.byte	0x14
	.byte	0x1a
	.byte	0x8
	.long	0x909
	.uleb128 0x1
	.long	.LASF141
	.byte	0x14
	.byte	0x1f
	.byte	0xd
	.long	0xa2
	.byte	0
	.uleb128 0x1
	.long	.LASF142
	.byte	0x14
	.byte	0x24
	.byte	0xd
	.long	0xc6
	.byte	0x8
	.uleb128 0x1
	.long	.LASF143
	.byte	0x14
	.byte	0x2c
	.byte	0xf
	.long	0xde
	.byte	0x10
	.uleb128 0x1
	.long	.LASF144
	.byte	0x14
	.byte	0x2d
	.byte	0xe
	.long	0xd2
	.byte	0x18
	.uleb128 0x1
	.long	.LASF145
	.byte	0x14
	.byte	0x2f
	.byte	0xd
	.long	0xae
	.byte	0x1c
	.uleb128 0x1
	.long	.LASF146
	.byte	0x14
	.byte	0x30
	.byte	0xd
	.long	0xba
	.byte	0x20
	.uleb128 0x1
	.long	.LASF147
	.byte	0x14
	.byte	0x32
	.byte	0x9
	.long	0x88
	.byte	0x24
	.uleb128 0x1
	.long	.LASF148
	.byte	0x14
	.byte	0x34
	.byte	0xd
	.long	0xa2
	.byte	0x28
	.uleb128 0x1
	.long	.LASF149
	.byte	0x14
	.byte	0x39
	.byte	0xd
	.long	0xea
	.byte	0x30
	.uleb128 0x1
	.long	.LASF150
	.byte	0x14
	.byte	0x3d
	.byte	0x11
	.long	0x126
	.byte	0x38
	.uleb128 0x1
	.long	.LASF151
	.byte	0x14
	.byte	0x3f
	.byte	0x10
	.long	0x132
	.byte	0x40
	.uleb128 0x1
	.long	.LASF152
	.byte	0x14
	.byte	0x4a
	.byte	0x15
	.long	0x3bb
	.byte	0x48
	.uleb128 0x1
	.long	.LASF153
	.byte	0x14
	.byte	0x4b
	.byte	0x15
	.long	0x3bb
	.byte	0x58
	.uleb128 0x1
	.long	.LASF154
	.byte	0x14
	.byte	0x4c
	.byte	0x15
	.long	0x3bb
	.byte	0x68
	.uleb128 0x1
	.long	.LASF155
	.byte	0x14
	.byte	0x59
	.byte	0x17
	.long	0x909
	.byte	0x78
	.byte	0
	.uleb128 0x7
	.long	0x14a
	.long	0x919
	.uleb128 0xd
	.long	0x3a
	.byte	0x2
	.byte	0
	.uleb128 0x8
	.byte	0x10
	.byte	0x5
	.long	.LASF156
	.uleb128 0x8
	.byte	0x10
	.byte	0x7
	.long	.LASF157
	.uleb128 0x8
	.byte	0x10
	.byte	0x4
	.long	.LASF158
	.uleb128 0x5
	.long	0x4f
	.uleb128 0x5
	.long	0x88
	.uleb128 0x22
	.long	0x41
	.byte	0x15
	.byte	0x71
	.long	0x96d
	.uleb128 0x17
	.string	"GET"
	.byte	0
	.uleb128 0x17
	.string	"PUT"
	.byte	0x1
	.uleb128 0x10
	.long	.LASF159
	.byte	0x2
	.uleb128 0x17
	.string	"LS"
	.byte	0x3
	.uleb128 0x10
	.long	.LASF160
	.byte	0x4
	.uleb128 0x10
	.long	.LASF161
	.byte	0x5
	.uleb128 0x10
	.long	.LASF162
	.byte	0x6
	.byte	0
	.uleb128 0x1f
	.byte	0xc8
	.byte	0x15
	.byte	0x83
	.long	0x9d1
	.uleb128 0x1
	.long	.LASF163
	.byte	0x15
	.byte	0x85
	.byte	0x9
	.long	0x88
	.byte	0
	.uleb128 0x1
	.long	.LASF164
	.byte	0x15
	.byte	0x86
	.byte	0x9
	.long	0x88
	.byte	0x4
	.uleb128 0x1
	.long	.LASF165
	.byte	0x15
	.byte	0x88
	.byte	0xb
	.long	0x156
	.byte	0x8
	.uleb128 0x1
	.long	.LASF166
	.byte	0x15
	.byte	0x8a
	.byte	0x1d
	.long	0x617
	.byte	0x10
	.uleb128 0x1
	.long	.LASF167
	.byte	0x15
	.byte	0x8b
	.byte	0x16
	.long	0x833
	.byte	0x90
	.uleb128 0x1
	.long	.LASF168
	.byte	0x15
	.byte	0x8c
	.byte	0x9
	.long	0x88
	.byte	0x98
	.uleb128 0x1
	.long	.LASF169
	.byte	0x15
	.byte	0x8d
	.byte	0x15
	.long	0x515
	.byte	0xa0
	.byte	0
	.uleb128 0x3
	.long	.LASF170
	.byte	0x15
	.byte	0x8e
	.byte	0x3
	.long	0x96d
	.uleb128 0x22
	.long	0x41
	.byte	0x16
	.byte	0x2f
	.long	0xa39
	.uleb128 0x11
	.long	.LASF171
	.value	0x100
	.uleb128 0x11
	.long	.LASF172
	.value	0x200
	.uleb128 0x11
	.long	.LASF173
	.value	0x400
	.uleb128 0x11
	.long	.LASF174
	.value	0x800
	.uleb128 0x11
	.long	.LASF175
	.value	0x1000
	.uleb128 0x11
	.long	.LASF176
	.value	0x2000
	.uleb128 0x11
	.long	.LASF177
	.value	0x4000
	.uleb128 0x11
	.long	.LASF178
	.value	0x8000
	.uleb128 0x10
	.long	.LASF179
	.byte	0x1
	.uleb128 0x10
	.long	.LASF180
	.byte	0x2
	.uleb128 0x10
	.long	.LASF181
	.byte	0x4
	.uleb128 0x10
	.long	.LASF182
	.byte	0x8
	.byte	0
	.uleb128 0xc
	.long	.LASF183
	.byte	0xa
	.byte	0x1
	.byte	0x41
	.byte	0x10
	.long	0xa7b
	.uleb128 0x1
	.long	.LASF184
	.byte	0x1
	.byte	0x43
	.byte	0xd
	.long	0x527
	.byte	0
	.uleb128 0x1
	.long	.LASF185
	.byte	0x1
	.byte	0x44
	.byte	0xd
	.long	0x527
	.byte	0x1
	.uleb128 0x1
	.long	.LASF186
	.byte	0x1
	.byte	0x45
	.byte	0xe
	.long	0x53f
	.byte	0x2
	.uleb128 0x1
	.long	.LASF187
	.byte	0x1
	.byte	0x46
	.byte	0xe
	.long	0x53f
	.byte	0x6
	.byte	0
	.uleb128 0x3
	.long	.LASF188
	.byte	0x1
	.byte	0x47
	.byte	0x3
	.long	0xa39
	.uleb128 0x18
	.long	.LASF194
	.byte	0x19
	.byte	0x22
	.byte	0x10
	.long	0x102
	.uleb128 0xa
	.long	.LASF189
	.byte	0x9
	.byte	0x66
	.byte	0xc
	.long	0x88
	.long	0xabd
	.uleb128 0x2
	.long	0x88
	.uleb128 0x2
	.long	0xac2
	.uleb128 0x2
	.long	0xac2
	.uleb128 0x2
	.long	0xac2
	.uleb128 0x2
	.long	0xacc
	.byte	0
	.uleb128 0x5
	.long	0x415
	.uleb128 0x12
	.long	0xabd
	.uleb128 0x5
	.long	0x393
	.uleb128 0x12
	.long	0xac7
	.uleb128 0xa
	.long	.LASF190
	.byte	0x6
	.byte	0x9e
	.byte	0xc
	.long	0x88
	.long	0xae7
	.uleb128 0x2
	.long	0x35b
	.byte	0
	.uleb128 0xa
	.long	.LASF191
	.byte	0x17
	.byte	0x86
	.byte	0xc
	.long	0x88
	.long	0xafd
	.uleb128 0x2
	.long	0xafd
	.byte	0
	.uleb128 0x5
	.long	0x5c2
	.uleb128 0xa
	.long	.LASF192
	.byte	0x17
	.byte	0xa4
	.byte	0x17
	.long	0xb18
	.long	0xb18
	.uleb128 0x2
	.long	0xafd
	.byte	0
	.uleb128 0x5
	.long	0x562
	.uleb128 0xa
	.long	.LASF193
	.byte	0x18
	.byte	0x69
	.byte	0xc
	.long	0x88
	.long	0xb33
	.uleb128 0x2
	.long	0x35b
	.byte	0
	.uleb128 0x18
	.long	.LASF195
	.byte	0x16
	.byte	0x4f
	.byte	0x23
	.long	0xb3f
	.uleb128 0x5
	.long	0x38e
	.uleb128 0xa
	.long	.LASF140
	.byte	0x1a
	.byte	0xcd
	.byte	0xc
	.long	0x88
	.long	0xb5f
	.uleb128 0x2
	.long	0x360
	.uleb128 0x2
	.long	0xb64
	.byte	0
	.uleb128 0x5
	.long	0x838
	.uleb128 0x12
	.long	0xb5f
	.uleb128 0xb
	.long	.LASF196
	.byte	0x6
	.value	0x181
	.byte	0xc
	.long	0x88
	.long	0xb8b
	.uleb128 0x2
	.long	0x156
	.uleb128 0x2
	.long	0x3a
	.uleb128 0x2
	.long	0x35b
	.uleb128 0x15
	.byte	0
	.uleb128 0xa
	.long	.LASF197
	.byte	0x1b
	.byte	0x9c
	.byte	0xc
	.long	0x88
	.long	0xba6
	.uleb128 0x2
	.long	0x35b
	.uleb128 0x2
	.long	0x35b
	.byte	0
	.uleb128 0xa
	.long	.LASF198
	.byte	0x17
	.byte	0x8d
	.byte	0xd
	.long	0xafd
	.long	0xbbc
	.uleb128 0x2
	.long	0x35b
	.byte	0
	.uleb128 0xa
	.long	.LASF199
	.byte	0x1b
	.byte	0x9f
	.byte	0xc
	.long	0x88
	.long	0xbdc
	.uleb128 0x2
	.long	0x35b
	.uleb128 0x2
	.long	0x35b
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0xb
	.long	.LASF200
	.byte	0x6
	.value	0x2d8
	.byte	0xf
	.long	0x2e
	.long	0xc02
	.uleb128 0x2
	.long	0x4a
	.uleb128 0x2
	.long	0x2e
	.uleb128 0x2
	.long	0x2e
	.uleb128 0x2
	.long	0x376
	.byte	0
	.uleb128 0xb
	.long	.LASF201
	.byte	0x1b
	.value	0x197
	.byte	0xf
	.long	0x2e
	.long	0xc19
	.uleb128 0x2
	.long	0x35b
	.byte	0
	.uleb128 0xb
	.long	.LASF202
	.byte	0x6
	.value	0x307
	.byte	0x11
	.long	0x9b
	.long	0xc30
	.uleb128 0x2
	.long	0x371
	.byte	0
	.uleb128 0xb
	.long	.LASF203
	.byte	0x6
	.value	0x301
	.byte	0xc
	.long	0x88
	.long	0xc51
	.uleb128 0x2
	.long	0x371
	.uleb128 0x2
	.long	0x9b
	.uleb128 0x2
	.long	0x88
	.byte	0
	.uleb128 0xa
	.long	.LASF204
	.byte	0x6
	.byte	0xb8
	.byte	0xc
	.long	0x88
	.long	0xc67
	.uleb128 0x2
	.long	0x371
	.byte	0
	.uleb128 0x32
	.long	.LASF254
	.byte	0x18
	.value	0x2af
	.byte	0xd
	.long	0xc7a
	.uleb128 0x2
	.long	0x48
	.byte	0
	.uleb128 0xa
	.long	.LASF205
	.byte	0x1c
	.byte	0x8a
	.byte	0x10
	.long	0x365
	.long	0xc9f
	.uleb128 0x2
	.long	0x88
	.uleb128 0x2
	.long	0x521
	.uleb128 0x2
	.long	0x2e
	.uleb128 0x2
	.long	0x88
	.byte	0
	.uleb128 0xb
	.long	.LASF206
	.byte	0x6
	.value	0x2df
	.byte	0xf
	.long	0x2e
	.long	0xcc5
	.uleb128 0x2
	.long	0x521
	.uleb128 0x2
	.long	0x3a
	.uleb128 0x2
	.long	0x3a
	.uleb128 0x2
	.long	0x371
	.byte	0
	.uleb128 0xb
	.long	.LASF207
	.byte	0x1b
	.value	0x1a3
	.byte	0xe
	.long	0x156
	.long	0xcdc
	.uleb128 0x2
	.long	0x88
	.byte	0
	.uleb128 0xb
	.long	.LASF208
	.byte	0x6
	.value	0x165
	.byte	0xc
	.long	0x88
	.long	0xcf9
	.uleb128 0x2
	.long	0x371
	.uleb128 0x2
	.long	0x35b
	.uleb128 0x15
	.byte	0
	.uleb128 0xb
	.long	.LASF209
	.byte	0x6
	.value	0x108
	.byte	0xe
	.long	0x371
	.long	0xd15
	.uleb128 0x2
	.long	0x360
	.uleb128 0x2
	.long	0x360
	.byte	0
	.uleb128 0xb
	.long	.LASF210
	.byte	0x6
	.value	0x193
	.byte	0xc
	.long	0x88
	.long	0xd32
	.uleb128 0x2
	.long	0x55d
	.uleb128 0x2
	.long	0x360
	.uleb128 0x15
	.byte	0
	.uleb128 0xb
	.long	.LASF211
	.byte	0x1b
	.value	0x111
	.byte	0xe
	.long	0x156
	.long	0xd4e
	.uleb128 0x2
	.long	0x35b
	.uleb128 0x2
	.long	0x88
	.byte	0
	.uleb128 0xb
	.long	.LASF212
	.byte	0xe
	.value	0x166
	.byte	0xc
	.long	0x88
	.long	0xd65
	.uleb128 0x2
	.long	0x88
	.byte	0
	.uleb128 0xb
	.long	.LASF213
	.byte	0x6
	.value	0x16b
	.byte	0xc
	.long	0x88
	.long	0xd7d
	.uleb128 0x2
	.long	0x35b
	.uleb128 0x15
	.byte	0
	.uleb128 0x18
	.long	.LASF214
	.byte	0x1d
	.byte	0x25
	.byte	0xd
	.long	0x933
	.uleb128 0xa
	.long	.LASF215
	.byte	0x1c
	.byte	0x91
	.byte	0x10
	.long	0x365
	.long	0xdae
	.uleb128 0x2
	.long	0x88
	.uleb128 0x2
	.long	0x48
	.uleb128 0x2
	.long	0x2e
	.uleb128 0x2
	.long	0x88
	.byte	0
	.uleb128 0xa
	.long	.LASF216
	.byte	0x1b
	.byte	0x3d
	.byte	0xe
	.long	0x48
	.long	0xdce
	.uleb128 0x2
	.long	0x48
	.uleb128 0x2
	.long	0x88
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0x33
	.long	.LASF255
	.byte	0x1
	.value	0x19d
	.byte	0x7
	.long	0x48
	.quad	.LFB326
	.quad	.LFE326-.LFB326
	.uleb128 0x1
	.byte	0x9c
	.long	0xf0c
	.uleb128 0x19
	.string	"sd"
	.value	0x19d
	.byte	0x21
	.long	0xf0c
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30968
	.uleb128 0x23
	.long	.LASF219
	.value	0x19f
	.long	0x88
	.uleb128 0x6
	.long	.LASF217
	.value	0x1a0
	.byte	0xa
	.long	0xf11
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30768
	.uleb128 0x6
	.long	.LASF218
	.value	0x1a1
	.byte	0xc
	.long	0x415
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30896
	.uleb128 0x23
	.long	.LASF220
	.value	0x1a2
	.long	0x88
	.uleb128 0x24
	.long	.LASF227
	.value	0x1e9
	.quad	.L103
	.uleb128 0xf
	.quad	.LBB18
	.quad	.LBE18-.LBB18
	.uleb128 0x6
	.long	.LASF221
	.value	0x1aa
	.byte	0x18
	.long	0x393
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30912
	.uleb128 0x6
	.long	.LASF222
	.value	0x1ad
	.byte	0xd
	.long	0x88
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30948
	.uleb128 0xe
	.quad	.LBB19
	.quad	.LBE19-.LBB19
	.long	0xeb3
	.uleb128 0x1a
	.string	"__i"
	.value	0x1a6
	.byte	0x9
	.long	0x41
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30952
	.uleb128 0x6
	.long	.LASF223
	.value	0x1a6
	.byte	0x9
	.long	0xabd
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30936
	.byte	0
	.uleb128 0xf
	.quad	.LBB20
	.quad	.LBE20-.LBB20
	.uleb128 0x6
	.long	.LASF224
	.value	0x1c5
	.byte	0x11
	.long	0x88
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30944
	.uleb128 0x6
	.long	.LASF225
	.value	0x1c6
	.byte	0x1e
	.long	0xa7b
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30922
	.uleb128 0xf
	.quad	.LBB21
	.quad	.LBE21-.LBB21
	.uleb128 0x6
	.long	.LASF226
	.value	0x1c9
	.byte	0xd
	.long	0x88
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30940
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x5
	.long	0x9d1
	.uleb128 0x7
	.long	0x15b
	.long	0xf22
	.uleb128 0x25
	.long	0x3a
	.value	0x77ff
	.byte	0
	.uleb128 0x26
	.long	.LASF230
	.value	0x15d
	.quad	.LFB325
	.quad	.LFE325-.LFB325
	.uleb128 0x1
	.byte	0x9c
	.long	0xfd6
	.uleb128 0x19
	.string	"sd"
	.value	0x15d
	.byte	0x24
	.long	0xf0c
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30792
	.uleb128 0x27
	.long	.LASF225
	.value	0x15d
	.byte	0x3a
	.long	0xfd6
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30800
	.uleb128 0x6
	.long	.LASF219
	.value	0x15f
	.byte	0x9
	.long	0x88
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30776
	.uleb128 0x6
	.long	.LASF217
	.value	0x160
	.byte	0xa
	.long	0xf11
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30752
	.uleb128 0x24
	.long	.LASF228
	.value	0x188
	.quad	.L70
	.uleb128 0x6
	.long	.LASF229
	.value	0x16a
	.byte	0xb
	.long	0x156
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30768
	.uleb128 0x1a
	.string	"fs"
	.value	0x16d
	.byte	0xb
	.long	0x371
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30760
	.uleb128 0xf
	.quad	.LBB17
	.quad	.LBE17-.LBB17
	.uleb128 0x6
	.long	.LASF226
	.value	0x167
	.byte	0x10
	.long	0x88
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30772
	.byte	0
	.byte	0
	.uleb128 0x5
	.long	0xa7b
	.uleb128 0x26
	.long	.LASF231
	.value	0x117
	.quad	.LFB324
	.quad	.LFE324-.LFB324
	.uleb128 0x1
	.byte	0x9c
	.long	0x10e6
	.uleb128 0x19
	.string	"sd"
	.value	0x117
	.byte	0x24
	.long	0xf0c
	.uleb128 0x4
	.byte	0x91
	.sleb128 -8440
	.uleb128 0x27
	.long	.LASF232
	.value	0x117
	.byte	0x34
	.long	0x35b
	.uleb128 0x4
	.byte	0x91
	.sleb128 -8448
	.uleb128 0x6
	.long	.LASF233
	.value	0x119
	.byte	0xa
	.long	0x10e6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -4144
	.uleb128 0x1a
	.string	"dp"
	.value	0x11a
	.byte	0xa
	.long	0xafd
	.uleb128 0x4
	.byte	0x91
	.sleb128 -8424
	.uleb128 0x6
	.long	.LASF234
	.value	0x11b
	.byte	0x14
	.long	0xb18
	.uleb128 0x4
	.byte	0x91
	.sleb128 -8416
	.uleb128 0x6
	.long	.LASF235
	.value	0x11c
	.byte	0x11
	.long	0x838
	.uleb128 0x4
	.byte	0x91
	.sleb128 -8384
	.uleb128 0xf
	.quad	.LBB14
	.quad	.LBE14-.LBB14
	.uleb128 0x6
	.long	.LASF236
	.value	0x131
	.byte	0xe
	.long	0x10e6
	.uleb128 0x4
	.byte	0x91
	.sleb128 -8240
	.uleb128 0xf
	.quad	.LBB15
	.quad	.LBE15-.LBB15
	.uleb128 0x6
	.long	.LASF237
	.value	0x13e
	.byte	0x13
	.long	0x156
	.uleb128 0x4
	.byte	0x91
	.sleb128 -8408
	.uleb128 0xf
	.quad	.LBB16
	.quad	.LBE16-.LBB16
	.uleb128 0x6
	.long	.LASF238
	.value	0x142
	.byte	0x16
	.long	0x10e6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -4144
	.uleb128 0x6
	.long	.LASF185
	.value	0x148
	.byte	0x15
	.long	0x88
	.uleb128 0x4
	.byte	0x91
	.sleb128 -8428
	.uleb128 0x6
	.long	.LASF239
	.value	0x14d
	.byte	0x22
	.long	0xa7b
	.uleb128 0x4
	.byte	0x91
	.sleb128 -8394
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x15b
	.long	0x10f7
	.uleb128 0x25
	.long	0x3a
	.value	0xfff
	.byte	0
	.uleb128 0x1b
	.long	.LASF240
	.byte	0xfe
	.quad	.LFB323
	.quad	.LFE323-.LFB323
	.uleb128 0x1
	.byte	0x9c
	.long	0x1155
	.uleb128 0x16
	.string	"sd"
	.byte	0xfe
	.byte	0x20
	.long	0xf0c
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30776
	.uleb128 0x1c
	.long	.LASF225
	.byte	0xfe
	.byte	0x36
	.long	0xfd6
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30784
	.uleb128 0x6
	.long	.LASF219
	.value	0x105
	.byte	0x9
	.long	0x88
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30756
	.uleb128 0x6
	.long	.LASF241
	.value	0x106
	.byte	0xa
	.long	0xf11
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30752
	.byte	0
	.uleb128 0x1b
	.long	.LASF242
	.byte	0x98
	.quad	.LFB322
	.quad	.LFE322-.LFB322
	.uleb128 0x1
	.byte	0x9c
	.long	0x1388
	.uleb128 0x16
	.string	"sd"
	.byte	0x98
	.byte	0x21
	.long	0xf0c
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61592
	.uleb128 0x1c
	.long	.LASF225
	.byte	0x98
	.byte	0x37
	.long	0xfd6
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61600
	.uleb128 0x4
	.long	.LASF219
	.byte	0x9a
	.byte	0x9
	.long	0x88
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61564
	.uleb128 0x4
	.long	.LASF224
	.byte	0x9a
	.byte	0x17
	.long	0x88
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61572
	.uleb128 0x4
	.long	.LASF243
	.byte	0x9a
	.byte	0x28
	.long	0x88
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61560
	.uleb128 0x4
	.long	.LASF217
	.byte	0x9b
	.byte	0xa
	.long	0xf11
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61472
	.uleb128 0x4
	.long	.LASF241
	.byte	0x9c
	.byte	0xa
	.long	0xf11
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30752
	.uleb128 0x4
	.long	.LASF244
	.byte	0x9d
	.byte	0x9
	.long	0x88
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61556
	.uleb128 0x4
	.long	.LASF229
	.byte	0x9e
	.byte	0xb
	.long	0x156
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61520
	.uleb128 0x4
	.long	.LASF245
	.byte	0x9f
	.byte	0xb
	.long	0x156
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61512
	.uleb128 0x28
	.long	.LASF228
	.byte	0xf9
	.quad	.L28
	.uleb128 0x1d
	.string	"fs"
	.byte	0xb4
	.byte	0xb
	.long	0x371
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61504
	.uleb128 0x4
	.long	.LASF246
	.byte	0xbf
	.byte	0x9
	.long	0x88
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61548
	.uleb128 0x4
	.long	.LASF239
	.byte	0xc9
	.byte	0x16
	.long	0xa7b
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61482
	.uleb128 0x4
	.long	.LASF247
	.byte	0xd4
	.byte	0x14
	.long	0x92e
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61496
	.uleb128 0xe
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.long	0x1283
	.uleb128 0x4
	.long	.LASF226
	.byte	0xa6
	.byte	0x10
	.long	0x88
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61552
	.byte	0
	.uleb128 0xe
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.long	0x12a9
	.uleb128 0x4
	.long	.LASF226
	.byte	0xb8
	.byte	0x14
	.long	0x88
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61524
	.byte	0
	.uleb128 0xe
	.quad	.LBB8
	.quad	.LBE8-.LBB8
	.long	0x12cf
	.uleb128 0x4
	.long	.LASF226
	.byte	0xc4
	.byte	0x10
	.long	0x88
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61544
	.byte	0
	.uleb128 0xe
	.quad	.LBB9
	.quad	.LBE9-.LBB9
	.long	0x12f5
	.uleb128 0x4
	.long	.LASF226
	.byte	0xc7
	.byte	0x10
	.long	0x88
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61540
	.byte	0
	.uleb128 0xe
	.quad	.LBB10
	.quad	.LBE10-.LBB10
	.long	0x131b
	.uleb128 0x4
	.long	.LASF226
	.byte	0xd0
	.byte	0x10
	.long	0x88
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61536
	.byte	0
	.uleb128 0xe
	.quad	.LBB11
	.quad	.LBE11-.LBB11
	.long	0x133f
	.uleb128 0x1d
	.string	"i"
	.byte	0xd5
	.byte	0xe
	.long	0x88
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61568
	.byte	0
	.uleb128 0xe
	.quad	.LBB12
	.quad	.LBE12-.LBB12
	.long	0x1365
	.uleb128 0x4
	.long	.LASF226
	.byte	0xe0
	.byte	0x14
	.long	0x88
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61528
	.byte	0
	.uleb128 0xf
	.quad	.LBB13
	.quad	.LBE13-.LBB13
	.uleb128 0x4
	.long	.LASF226
	.byte	0xe7
	.byte	0x10
	.long	0x88
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61532
	.byte	0
	.byte	0
	.uleb128 0x1b
	.long	.LASF248
	.byte	0x4a
	.quad	.LFB321
	.quad	.LFE321-.LFB321
	.uleb128 0x1
	.byte	0x9c
	.long	0x14e5
	.uleb128 0x16
	.string	"sd"
	.byte	0x4a
	.byte	0x21
	.long	0xf0c
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30840
	.uleb128 0x1c
	.long	.LASF225
	.byte	0x4a
	.byte	0x37
	.long	0xfd6
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30848
	.uleb128 0x4
	.long	.LASF219
	.byte	0x4c
	.byte	0x9
	.long	0x88
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30816
	.uleb128 0x4
	.long	.LASF224
	.byte	0x4c
	.byte	0x17
	.long	0x88
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30824
	.uleb128 0x4
	.long	.LASF249
	.byte	0x4c
	.byte	0x28
	.long	0x88
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30812
	.uleb128 0x4
	.long	.LASF217
	.byte	0x4d
	.byte	0xa
	.long	0xf11
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30768
	.uleb128 0x4
	.long	.LASF244
	.byte	0x4e
	.byte	0x9
	.long	0x88
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30820
	.uleb128 0x4
	.long	.LASF229
	.byte	0x4f
	.byte	0xb
	.long	0x156
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30792
	.uleb128 0x4
	.long	.LASF245
	.byte	0x50
	.byte	0xb
	.long	0x156
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30784
	.uleb128 0x28
	.long	.LASF228
	.byte	0x93
	.quad	.L6
	.uleb128 0x1d
	.string	"fs"
	.byte	0x66
	.byte	0xb
	.long	0x371
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30776
	.uleb128 0xe
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.long	0x1476
	.uleb128 0x4
	.long	.LASF226
	.byte	0x57
	.byte	0x10
	.long	0x88
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30808
	.byte	0
	.uleb128 0xe
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.long	0x149c
	.uleb128 0x4
	.long	.LASF226
	.byte	0x72
	.byte	0x14
	.long	0x88
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30804
	.byte	0
	.uleb128 0xe
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.long	0x14c2
	.uleb128 0x4
	.long	.LASF226
	.byte	0x81
	.byte	0x14
	.long	0x88
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30796
	.byte	0
	.uleb128 0xf
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x4
	.long	.LASF226
	.byte	0x8b
	.byte	0x14
	.long	0x88
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30800
	.byte	0
	.byte	0
	.uleb128 0x34
	.long	.LASF250
	.byte	0x1
	.byte	0x36
	.byte	0x7
	.long	0x48
	.quad	.LFB320
	.quad	.LFE320-.LFB320
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x16
	.string	"sa"
	.byte	0x36
	.byte	0x24
	.long	0x65c
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
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
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
	.uleb128 0x4
	.byte	0x1
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
	.sleb128 1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
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
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
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
	.uleb128 0x27
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
	.uleb128 0x28
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x29
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
	.uleb128 0x2a
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2b
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
	.uleb128 0x2c
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
	.uleb128 0x2d
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
	.uleb128 0x2e
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2f
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
	.uleb128 0x30
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
	.uleb128 0x31
	.uleb128 0x16
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
	.byte	0
	.byte	0
	.uleb128 0x32
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
	.uleb128 0x33
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
	.uleb128 0x34
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
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF119:
	.string	"sin6_flowinfo"
.LASF49:
	.string	"_shortbuf"
.LASF211:
	.string	"strrchr"
.LASF56:
	.string	"_prevchain"
.LASF252:
	.string	"_IO_lock_t"
.LASF201:
	.string	"strlen"
.LASF250:
	.string	"get_in_addr"
.LASF190:
	.string	"remove"
.LASF199:
	.string	"strncmp"
.LASF38:
	.string	"_IO_buf_end"
.LASF195:
	.string	"__ctype_b_loc"
.LASF106:
	.string	"sa_data"
.LASF220:
	.string	"file_fd"
.LASF245:
	.string	"temp_filename"
.LASF71:
	.string	"__fd_mask"
.LASF104:
	.string	"sockaddr"
.LASF183:
	.string	"message_header_s"
.LASF188:
	.string	"message_header_t"
.LASF121:
	.string	"sin6_scope_id"
.LASF36:
	.string	"_IO_write_end"
.LASF3:
	.string	"unsigned int"
.LASF54:
	.string	"_freeres_list"
.LASF150:
	.string	"st_blksize"
.LASF30:
	.string	"_flags"
.LASF248:
	.string	"put_command"
.LASF207:
	.string	"strerror"
.LASF198:
	.string	"opendir"
.LASF225:
	.string	"message_header"
.LASF42:
	.string	"_markers"
.LASF18:
	.string	"__nlink_t"
.LASF172:
	.string	"_ISlower"
.LASF243:
	.string	"numbytes_r"
.LASF101:
	.string	"d_name"
.LASF160:
	.string	"EXIT"
.LASF63:
	.string	"ssize_t"
.LASF249:
	.string	"numbytes_w"
.LASF127:
	.string	"__u6_addr16"
.LASF214:
	.string	"__errno_location"
.LASF16:
	.string	"__ino_t"
.LASF205:
	.string	"send"
.LASF75:
	.string	"__pthread_internal_list"
.LASF94:
	.string	"uint32_t"
.LASF76:
	.string	"__prev"
.LASF122:
	.string	"in_addr_t"
.LASF41:
	.string	"_IO_save_end"
.LASF81:
	.string	"__count"
.LASF131:
	.string	"addrinfo"
.LASF74:
	.string	"long long unsigned int"
.LASF187:
	.string	"data_length"
.LASF185:
	.string	"chunk_id"
.LASF126:
	.string	"__u6_addr8"
.LASF151:
	.string	"st_blocks"
.LASF227:
	.string	"cleanup"
.LASF155:
	.string	"__glibc_reserved"
.LASF99:
	.string	"d_reclen"
.LASF112:
	.string	"sin_family"
.LASF10:
	.string	"__uint16_t"
.LASF7:
	.string	"size_t"
.LASF82:
	.string	"__owner"
.LASF51:
	.string	"_offset"
.LASF165:
	.string	"dirname"
.LASF125:
	.string	"in_port_t"
.LASF86:
	.string	"__elision"
.LASF222:
	.string	"select_status"
.LASF208:
	.string	"fprintf"
.LASF44:
	.string	"_fileno"
.LASF140:
	.string	"stat"
.LASF66:
	.string	"timeval"
.LASF115:
	.string	"sin_zero"
.LASF209:
	.string	"fopen"
.LASF124:
	.string	"s_addr"
.LASF70:
	.string	"tv_nsec"
.LASF219:
	.string	"numbytes"
.LASF103:
	.string	"sa_family_t"
.LASF137:
	.string	"ai_addr"
.LASF17:
	.string	"__mode_t"
.LASF100:
	.string	"d_type"
.LASF175:
	.string	"_ISxdigit"
.LASF232:
	.string	"base_path"
.LASF33:
	.string	"_IO_read_base"
.LASF146:
	.string	"st_gid"
.LASF35:
	.string	"_IO_write_ptr"
.LASF68:
	.string	"tv_usec"
.LASF120:
	.string	"sin6_addr"
.LASF254:
	.string	"free"
.LASF117:
	.string	"sin6_family"
.LASF143:
	.string	"st_nlink"
.LASF161:
	.string	"SERVER_INFO"
.LASF77:
	.string	"__next"
.LASF107:
	.string	"sockaddr_storage"
.LASF69:
	.string	"timespec"
.LASF28:
	.string	"char"
.LASF110:
	.string	"__ss_align"
.LASF57:
	.string	"_mode"
.LASF237:
	.string	"last_underscore"
.LASF229:
	.string	"filename"
.LASF60:
	.string	"_IO_marker"
.LASF212:
	.string	"close"
.LASF164:
	.string	"client_sock_fd"
.LASF236:
	.string	"entry_path"
.LASF255:
	.string	"handle_req"
.LASF159:
	.string	"DELETE"
.LASF85:
	.string	"__spins"
.LASF108:
	.string	"ss_family"
.LASF92:
	.string	"uint8_t"
.LASF244:
	.string	"status"
.LASF240:
	.string	"ls_command"
.LASF253:
	.string	"stderr"
.LASF142:
	.string	"st_ino"
.LASF242:
	.string	"get_command"
.LASF34:
	.string	"_IO_write_base"
.LASF21:
	.string	"__pid_t"
.LASF87:
	.string	"__list"
.LASF64:
	.string	"long long int"
.LASF217:
	.string	"recieved_buf"
.LASF213:
	.string	"printf"
.LASF169:
	.string	"lock"
.LASF39:
	.string	"_IO_save_base"
.LASF13:
	.string	"__dev_t"
.LASF113:
	.string	"sin_port"
.LASF180:
	.string	"_IScntrl"
.LASF218:
	.string	"readfds"
.LASF128:
	.string	"__u6_addr32"
.LASF27:
	.string	"__syscall_slong_t"
.LASF139:
	.string	"ai_next"
.LASF174:
	.string	"_ISdigit"
.LASF166:
	.string	"client_info"
.LASF203:
	.string	"fseek"
.LASF216:
	.string	"memset"
.LASF170:
	.string	"sockDetails_t"
.LASF226:
	.string	"nbytes"
.LASF73:
	.string	"fd_set"
.LASF196:
	.string	"snprintf"
.LASF176:
	.string	"_ISspace"
.LASF55:
	.string	"_freeres_buf"
.LASF144:
	.string	"st_mode"
.LASF40:
	.string	"_IO_backup_base"
.LASF184:
	.string	"command"
.LASF130:
	.string	"__in6_u"
.LASF114:
	.string	"sin_addr"
.LASF84:
	.string	"__kind"
.LASF147:
	.string	"__pad0"
.LASF202:
	.string	"ftell"
.LASF2:
	.string	"long unsigned int"
.LASF138:
	.string	"ai_canonname"
.LASF239:
	.string	"message_header_send"
.LASF168:
	.string	"addr_len"
.LASF48:
	.string	"_vtable_offset"
.LASF228:
	.string	"done"
.LASF78:
	.string	"__pthread_list_t"
.LASF158:
	.string	"long double"
.LASF15:
	.string	"__gid_t"
.LASF93:
	.string	"uint16_t"
.LASF118:
	.string	"sin6_port"
.LASF251:
	.string	"GNU C17 14.2.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF96:
	.string	"dirent"
.LASF133:
	.string	"ai_family"
.LASF235:
	.string	"statbuf"
.LASF224:
	.string	"total_bytes"
.LASF181:
	.string	"_ISpunct"
.LASF32:
	.string	"_IO_read_end"
.LASF167:
	.string	"server_info"
.LASF191:
	.string	"closedir"
.LASF177:
	.string	"_ISprint"
.LASF9:
	.string	"short int"
.LASF194:
	.string	"gettid"
.LASF72:
	.string	"fds_bits"
.LASF231:
	.string	"list_directory"
.LASF12:
	.string	"long int"
.LASF247:
	.string	"bytes"
.LASF200:
	.string	"fread"
.LASF162:
	.string	"number_of_command"
.LASF238:
	.string	"file_path"
.LASF88:
	.string	"__data"
.LASF62:
	.string	"_IO_wide_data"
.LASF223:
	.string	"__arr"
.LASF204:
	.string	"fclose"
.LASF192:
	.string	"readdir"
.LASF98:
	.string	"d_off"
.LASF24:
	.string	"__blksize_t"
.LASF26:
	.string	"__ssize_t"
.LASF111:
	.string	"sockaddr_in"
.LASF14:
	.string	"__uid_t"
.LASF8:
	.string	"__uint8_t"
.LASF152:
	.string	"st_atim"
.LASF178:
	.string	"_ISgraph"
.LASF189:
	.string	"select"
.LASF83:
	.string	"__nusers"
.LASF53:
	.string	"_wide_data"
.LASF50:
	.string	"_lock"
.LASF67:
	.string	"tv_sec"
.LASF129:
	.string	"in6_addr"
.LASF163:
	.string	"sockfd"
.LASF61:
	.string	"_IO_codecvt"
.LASF46:
	.string	"_old_offset"
.LASF65:
	.string	"_IO_FILE"
.LASF173:
	.string	"_ISalpha"
.LASF102:
	.string	"__dirstream"
.LASF91:
	.string	"pthread_mutex_t"
.LASF80:
	.string	"__lock"
.LASF153:
	.string	"st_mtim"
.LASF241:
	.string	"transmit_buf"
.LASF156:
	.string	"__int128"
.LASF123:
	.string	"in_addr"
.LASF109:
	.string	"__ss_padding"
.LASF234:
	.string	"entry"
.LASF135:
	.string	"ai_protocol"
.LASF134:
	.string	"ai_socktype"
.LASF246:
	.string	"file_size"
.LASF4:
	.string	"unsigned char"
.LASF11:
	.string	"__uint32_t"
.LASF210:
	.string	"asprintf"
.LASF29:
	.string	"__socklen_t"
.LASF221:
	.string	"timeout"
.LASF23:
	.string	"__suseconds_t"
.LASF22:
	.string	"__time_t"
.LASF182:
	.string	"_ISalnum"
.LASF149:
	.string	"st_size"
.LASF97:
	.string	"d_ino"
.LASF52:
	.string	"_codecvt"
.LASF132:
	.string	"ai_flags"
.LASF206:
	.string	"fwrite"
.LASF145:
	.string	"st_uid"
.LASF19:
	.string	"__off_t"
.LASF215:
	.string	"recv"
.LASF154:
	.string	"st_ctim"
.LASF197:
	.string	"strcmp"
.LASF179:
	.string	"_ISblank"
.LASF141:
	.string	"st_dev"
.LASF6:
	.string	"signed char"
.LASF105:
	.string	"sa_family"
.LASF5:
	.string	"short unsigned int"
.LASF193:
	.string	"atoi"
.LASF31:
	.string	"_IO_read_ptr"
.LASF230:
	.string	"delete_command"
.LASF186:
	.string	"filename_length"
.LASF157:
	.string	"__int128 unsigned"
.LASF25:
	.string	"__blkcnt_t"
.LASF233:
	.string	"current_rel_path"
.LASF90:
	.string	"__align"
.LASF43:
	.string	"_chain"
.LASF171:
	.string	"_ISupper"
.LASF148:
	.string	"st_rdev"
.LASF136:
	.string	"ai_addrlen"
.LASF59:
	.string	"FILE"
.LASF45:
	.string	"_flags2"
.LASF95:
	.string	"socklen_t"
.LASF89:
	.string	"__size"
.LASF47:
	.string	"_cur_column"
.LASF116:
	.string	"sockaddr_in6"
.LASF20:
	.string	"__off64_t"
.LASF58:
	.string	"_unused2"
.LASF37:
	.string	"_IO_buf_base"
.LASF79:
	.string	"__pthread_mutex_s"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"src/handle_req.c"
.LASF1:
	.string	"/home/parth/Work/All_data/university/Network System/Assignments/PA4/server"
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
