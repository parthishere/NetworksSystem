	.file	"handle_req.c"
	.text
.Ltext0:
	.file 0 "/home/parth/Work/All_data/university/Network System/Assignments/PA4/server" "src/handle_req.c"
	.globl	get_in_addr
	.type	get_in_addr, @function
get_in_addr:
.LFB320:
	.file 1 "src/handle_req.c"
	.loc 1 47 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	.loc 1 48 11
	movq	-8(%rbp), %rax
	movzwl	(%rax), %eax
	.loc 1 48 8
	cmpw	$2, %ax
	jne	.L2
	.loc 1 50 16
	movq	-8(%rbp), %rax
	addq	$4, %rax
	jmp	.L3
.L2:
	.loc 1 53 12
	movq	-8(%rbp), %rax
	addq	$8, %rax
.L3:
	.loc 1 54 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE320:
	.size	get_in_addr, .-get_in_addr
	.section	.rodata
	.align 8
.LC0:
	.string	"\033[31m[-] Recv failed, error no: %d \n\033[0m"
	.align 8
.LC1:
	.string	"\033[31m[-] Client Closed the Connection, error no: %d \n\033[0m"
	.align 8
.LC2:
	.string	"filename we are putting: %s (%d)\n"
.LC3:
	.string	"%s/%s_%d"
.LC4:
	.string	"wb"
.LC5:
	.string	"could not open file ! "
	.align 8
.LC6:
	.string	"Num bytes read and write did not match \n"
.LC7:
	.string	"ack\t\n0\t\n"
	.string	""
	.align 8
.LC8:
	.string	"\033[31m[-] Send failed, error no: %d \n\033[0m"
.LC9:
	.string	"nack\t\n0\t\n"
	.string	""
	.text
	.globl	put_command
	.type	put_command, @function
put_command:
.LFB321:
	.loc 1 65 1
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
	subq	$2128, %rsp
	movq	%rdi, -30792(%rbp)
	movq	%rsi, -30800(%rbp)
	.loc 1 65 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 66 9
	movl	$0, -30776(%rbp)
	.loc 1 66 23
	movl	$0, -30784(%rbp)
	.loc 1 66 40
	movl	$0, -30772(%rbp)
	.loc 1 68 9
	movl	$0, -30780(%rbp)
	.loc 1 70 5
	leaq	-30736(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.LBB2:
	.loc 1 71 16
	movq	-30800(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edx
	movq	-30792(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30736(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 71 16 is_stmt 0 discriminator 1
	movl	%eax, -30768(%rbp)
	cmpl	$0, -30768(%rbp)
	jg	.L5
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 71 16 discriminator 2
	movq	-30792(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 71 16
	jmp	.L6
.L5:
	.loc 1 71 16 discriminator 2
	cmpl	$0, -30768(%rbp)
	jne	.L7
	.loc 1 71 16 discriminator 3
	movq	-30792(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 71 16 discriminator 1
	call	__errno_location@PLT
	.loc 1 71 16 discriminator 2
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L7:
	.loc 1 71 16 discriminator 5
	movl	-30768(%rbp), %eax
.LBE2:
	.loc 1 71 14 is_stmt 1 discriminator 5
	movl	%eax, -30776(%rbp)
	.loc 1 72 78
	movq	-30800(%rbp), %rax
	movzbl	1(%rax), %eax
	.loc 1 72 5
	movzbl	%al, %edx
	leaq	-30736(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 75 78
	movq	-30800(%rbp), %rax
	movzbl	1(%rax), %eax
	.loc 1 75 5
	movzbl	%al, %esi
	movq	-30792(%rbp), %rax
	movq	8(%rax), %rdx
	leaq	-30736(%rbp), %rcx
	leaq	-30752(%rbp), %rax
	movl	%esi, %r8d
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	.loc 1 76 16
	movq	-30752(%rbp), %rax
	leaq	.LC4(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -30744(%rbp)
	.loc 1 77 8
	cmpq	$0, -30744(%rbp)
	jne	.L9
	.loc 1 79 9
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 80 16
	movl	$-1, -30780(%rbp)
	.loc 1 81 9
	jmp	.L6
.L14:
	.loc 1 86 9
	leaq	-30736(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.LBB3:
	.loc 1 87 20
	movq	-30800(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, %edx
	movq	-30792(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30736(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 87 20 is_stmt 0 discriminator 1
	movl	%eax, -30764(%rbp)
	cmpl	$0, -30764(%rbp)
	jg	.L10
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 87 20 discriminator 2
	movq	-30792(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 87 20
	jmp	.L6
.L10:
	.loc 1 87 20 discriminator 2
	cmpl	$0, -30764(%rbp)
	jne	.L11
	.loc 1 87 20 discriminator 3
	movq	-30792(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 87 20 discriminator 1
	call	__errno_location@PLT
	.loc 1 87 20 discriminator 2
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L11:
	.loc 1 87 20 discriminator 5
	movl	-30764(%rbp), %eax
.LBE3:
	.loc 1 87 18 is_stmt 1 discriminator 5
	movl	%eax, -30776(%rbp)
	.loc 1 88 22
	movl	-30776(%rbp), %eax
	movslq	%eax, %rsi
	movq	-30744(%rbp), %rdx
	leaq	-30736(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 88 20 discriminator 1
	movl	%eax, -30772(%rbp)
	.loc 1 90 36
	movl	-30772(%rbp), %eax
	imull	-30776(%rbp), %eax
	.loc 1 90 12
	cmpl	%eax, -30776(%rbp)
	je	.L12
	.loc 1 92 13
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$40, %edx
	movl	$1, %esi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 93 20
	movl	$-1, -30780(%rbp)
	.loc 1 94 13
	jmp	.L13
.L12:
	.loc 1 96 21
	movl	-30776(%rbp), %eax
	addl	%eax, -30784(%rbp)
.L9:
	.loc 1 84 40
	movq	-30800(%rbp), %rax
	movl	8(%rax), %eax
	.loc 1 84 24
	movl	-30784(%rbp), %edx
	cmpl	%eax, %edx
	jb	.L14
.L13:
	.loc 1 100 8
	cmpl	$0, -30780(%rbp)
	js	.L15
.LBB4:
	.loc 1 101 20
	movq	-30792(%rbp), %rax
	movl	4(%rax), %eax
	movl	$0, %ecx
	movl	$7, %edx
	leaq	.LC7(%rip), %rsi
	movl	%eax, %edi
	call	send@PLT
	.loc 1 101 20 is_stmt 0 discriminator 1
	movl	%eax, -30756(%rbp)
	cmpl	$0, -30756(%rbp)
	jg	.L16
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 101 20 discriminator 2
	movq	-30792(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 101 20
	jmp	.L6
.L16:
	.loc 1 101 20 discriminator 2
	movl	-30756(%rbp), %eax
.LBE4:
	.loc 1 101 18 is_stmt 1 discriminator 2
	movl	%eax, -30776(%rbp)
	jmp	.L6
.L15:
.LBB5:
	.loc 1 103 20
	movq	-30792(%rbp), %rax
	movl	4(%rax), %eax
	movl	$0, %ecx
	movl	$8, %edx
	leaq	.LC9(%rip), %rsi
	movl	%eax, %edi
	call	send@PLT
	.loc 1 103 20 is_stmt 0 discriminator 1
	movl	%eax, -30760(%rbp)
	cmpl	$0, -30760(%rbp)
	jg	.L17
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 103 20 discriminator 2
	movq	-30792(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 103 20
	jmp	.L6
.L17:
	.loc 1 103 20 discriminator 2
	movl	-30760(%rbp), %eax
.LBE5:
	.loc 1 103 18 is_stmt 1 discriminator 2
	movl	%eax, -30776(%rbp)
.L6:
	.loc 1 106 5
	movq	-30752(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 107 5
	movq	-30744(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	.loc 1 108 1
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L18
	call	__stack_chk_fail@PLT
.L18:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE321:
	.size	put_command, .-put_command
	.section	.rodata
.LC10:
	.string	"filename : %s\n"
.LC11:
	.string	"rb"
.LC12:
	.string	"Reading failed "
.LC13:
	.string	"file size %d \n"
.LC14:
	.string	"send bytes:%d\n"
.LC15:
	.string	"ACK recv so client is good"
.LC16:
	.string	"something went wrong"
	.text
	.globl	get_command
	.type	get_command, @function
get_command:
.LFB322:
	.loc 1 111 1
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
	subq	$112, %rsp
	movq	%rdi, -61544(%rbp)
	movq	%rsi, -61552(%rbp)
	.loc 1 111 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 112 9
	movl	$0, -61532(%rbp)
	.loc 1 112 23
	movl	$0, -61536(%rbp)
	.loc 1 112 40
	movl	$0, -61528(%rbp)
	.loc 1 115 9
	movl	$0, -61524(%rbp)
	.loc 1 117 5
	leaq	-61456(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.LBB6:
	.loc 1 118 16
	movq	-61552(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edx
	movq	-61544(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-61456(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 118 16 is_stmt 0 discriminator 1
	movl	%eax, -61520(%rbp)
	cmpl	$0, -61520(%rbp)
	jg	.L20
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 118 16 discriminator 2
	movq	-61544(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 118 16
	jmp	.L21
.L20:
	.loc 1 118 16 discriminator 2
	cmpl	$0, -61520(%rbp)
	jne	.L22
	.loc 1 118 16 discriminator 3
	movq	-61544(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 118 16 discriminator 1
	call	__errno_location@PLT
	.loc 1 118 16 discriminator 2
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L22:
	.loc 1 118 16 discriminator 5
	movl	-61520(%rbp), %eax
.LBE6:
	.loc 1 118 14 is_stmt 1 discriminator 5
	movl	%eax, -61532(%rbp)
	.loc 1 119 5
	leaq	-61456(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 122 78
	movq	-61552(%rbp), %rax
	movzbl	1(%rax), %eax
	.loc 1 122 5
	movzbl	%al, %esi
	movq	-61544(%rbp), %rax
	movq	8(%rax), %rdx
	leaq	-61456(%rbp), %rcx
	leaq	-61488(%rbp), %rax
	movl	%esi, %r8d
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	.loc 1 123 16
	movq	-61488(%rbp), %rax
	leaq	.LC11(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -61480(%rbp)
	.loc 1 124 8
	cmpq	$0, -61480(%rbp)
	jne	.L23
	.loc 1 126 9
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.LBB7:
	.loc 1 127 20
	movq	-61544(%rbp), %rax
	movl	4(%rax), %eax
	movl	$0, %ecx
	movl	$8, %edx
	leaq	.LC9(%rip), %rsi
	movl	%eax, %edi
	call	send@PLT
	.loc 1 127 20 is_stmt 0 discriminator 1
	movl	%eax, -61492(%rbp)
	cmpl	$0, -61492(%rbp)
	jg	.L24
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 127 20 discriminator 2
	movq	-61544(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 127 20
	jmp	.L21
.L24:
	.loc 1 127 20 discriminator 2
	movl	-61492(%rbp), %eax
.LBE7:
	.loc 1 127 18 is_stmt 1 discriminator 2
	movl	%eax, -61532(%rbp)
	.loc 1 128 16
	movl	$-1, -61524(%rbp)
	.loc 1 129 9
	jmp	.L21
.L23:
	.loc 1 131 5
	movq	-61480(%rbp), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseek@PLT
	.loc 1 132 21
	movq	-61480(%rbp), %rax
	movq	%rax, %rdi
	call	ftell@PLT
	.loc 1 132 9 discriminator 1
	movl	%eax, -61516(%rbp)
	.loc 1 133 5
	movq	-61480(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseek@PLT
	.loc 1 135 5
	movl	-61516(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBB8:
	.loc 1 137 16
	movq	-61544(%rbp), %rax
	movl	4(%rax), %eax
	movl	$0, %ecx
	movl	$7, %edx
	leaq	.LC7(%rip), %rsi
	movl	%eax, %edi
	call	send@PLT
	.loc 1 137 16 is_stmt 0 discriminator 1
	movl	%eax, -61512(%rbp)
	cmpl	$0, -61512(%rbp)
	jg	.L25
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 137 16 discriminator 2
	movq	-61544(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 137 16
	jmp	.L21
.L25:
	.loc 1 137 16 discriminator 2
	movl	-61512(%rbp), %eax
.LBE8:
	.loc 1 137 14 is_stmt 1 discriminator 2
	movl	%eax, -61532(%rbp)
	.loc 1 139 22
	movb	$0, -61468(%rbp)
	.loc 1 141 35
	movq	-61552(%rbp), %rax
	movzbl	1(%rax), %eax
	.loc 1 139 22
	movb	%al, -61467(%rbp)
	.loc 1 142 28
	movq	-61488(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 139 22
	movl	%eax, -61464(%rbp)
	movl	-61516(%rbp), %eax
	movl	%eax, -61460(%rbp)
.LBB9:
	.loc 1 146 16
	movq	-61544(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-61468(%rbp), %rsi
	movl	$0, %ecx
	movl	$12, %edx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 146 16 is_stmt 0 discriminator 1
	movl	%eax, -61508(%rbp)
	cmpl	$0, -61508(%rbp)
	jg	.L26
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 146 16 discriminator 2
	movq	-61544(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 146 16
	jmp	.L21
.L26:
	.loc 1 146 16 discriminator 2
	movl	-61508(%rbp), %eax
.LBE9:
	.loc 1 146 14 is_stmt 1 discriminator 2
	movl	%eax, -61532(%rbp)
	.loc 1 147 17
	movl	$0, -61536(%rbp)
	.loc 1 148 11
	jmp	.L27
.L29:
	.loc 1 150 9
	leaq	-30736(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 151 20
	movl	-61516(%rbp), %eax
	movslq	%eax, %rdx
	movq	-61480(%rbp), %rcx
	leaq	-30736(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	fread@PLT
	.loc 1 151 18 discriminator 1
	movl	%eax, -61532(%rbp)
.LBB10:
	.loc 1 152 20
	movl	-61532(%rbp), %eax
	movslq	%eax, %rdx
	movq	-61544(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30736(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 152 20 is_stmt 0 discriminator 1
	movl	%eax, -61496(%rbp)
	cmpl	$0, -61496(%rbp)
	jg	.L28
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 152 20 discriminator 2
	movq	-61544(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 152 20
	jmp	.L21
.L28:
	.loc 1 152 20 discriminator 2
	movl	-61496(%rbp), %eax
.LBE10:
	.loc 1 152 18 is_stmt 1 discriminator 2
	movl	%eax, -61532(%rbp)
	.loc 1 153 9
	movl	-61532(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 155 21
	movl	-61532(%rbp), %eax
	addl	%eax, -61536(%rbp)
.L27:
	.loc 1 148 24
	movl	-61536(%rbp), %eax
	cmpl	-61516(%rbp), %eax
	jl	.L29
	.loc 1 158 5
	leaq	-61456(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.LBB11:
	.loc 1 159 16
	movq	-61544(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-61456(%rbp), %rsi
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 159 16 is_stmt 0 discriminator 1
	movl	%eax, -61504(%rbp)
	cmpl	$0, -61504(%rbp)
	jg	.L30
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 159 16 discriminator 2
	movq	-61544(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 159 16
	jmp	.L21
.L30:
	.loc 1 159 16 discriminator 2
	cmpl	$0, -61504(%rbp)
	jne	.L31
	.loc 1 159 16 discriminator 3
	movq	-61544(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 159 16 discriminator 1
	call	__errno_location@PLT
	.loc 1 159 16 discriminator 2
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L31:
	.loc 1 159 16 discriminator 5
	movl	-61504(%rbp), %eax
.LBE11:
	.loc 1 159 14 is_stmt 1 discriminator 5
	movl	%eax, -61532(%rbp)
	.loc 1 160 9
	leaq	-61456(%rbp), %rax
	movl	$7, %edx
	leaq	.LC7(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 160 8 discriminator 1
	testl	%eax, %eax
	jne	.L32
	.loc 1 162 9
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L33
.L32:
	.loc 1 166 9
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L33:
.LBB12:
	.loc 1 169 5
	movq	-61544(%rbp), %rax
	movl	4(%rax), %eax
	movl	$0, %ecx
	movl	$7, %edx
	leaq	.LC7(%rip), %rsi
	movl	%eax, %edi
	call	send@PLT
	.loc 1 169 5 is_stmt 0 discriminator 1
	movl	%eax, -61500(%rbp)
	cmpl	$0, -61500(%rbp)
	jg	.L21
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 169 5 discriminator 2
	movq	-61544(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
.L21:
.LBE12:
	.loc 1 173 5 is_stmt 1
	movq	-61488(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 174 5
	movq	-61480(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	.loc 1 175 1
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L35
	call	__stack_chk_fail@PLT
.L35:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE322:
	.size	get_command, .-get_command
	.globl	ls_command
	.type	ls_command, @function
ls_command:
.LFB323:
	.loc 1 178 1
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
	subq	$2144, %rsp
	movq	%rdi, -30808(%rbp)
	movq	%rsi, -30816(%rbp)
	.loc 1 178 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 180 9
	movl	$0, -30792(%rbp)
	.loc 1 180 23
	movl	$0, -30788(%rbp)
	.loc 1 180 40
	movl	$0, -30784(%rbp)
	.loc 1 183 9
	movl	$0, -30780(%rbp)
	.loc 1 187 20
	movq	-30808(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 187 10
	movq	%rax, %rdi
	call	opendir@PLT
	movq	%rax, -30768(%rbp)
	.loc 1 189 8
	cmpq	$0, -30768(%rbp)
	je	.L37
.LBB13:
	.loc 1 191 13
	movl	$0, -30776(%rbp)
	.loc 1 192 15
	jmp	.L38
.L41:
.LBB14:
	.loc 1 194 19
	movq	-30760(%rbp), %rax
	movzbl	18(%rax), %eax
	.loc 1 194 16
	cmpb	$8, %al
	jne	.L44
	.loc 1 196 39
	movq	-30760(%rbp), %rax
	addq	$19, %rax
	.loc 1 196 30
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 196 17 discriminator 1
	movl	%eax, -30772(%rbp)
	.loc 1 198 13
	leaq	-30736(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 199 13
	movl	-30772(%rbp), %eax
	movslq	%eax, %rdx
	.loc 1 199 36
	movq	-30760(%rbp), %rax
	leaq	19(%rax), %rcx
	.loc 1 199 13
	leaq	-30736(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	.loc 1 201 30
	movb	$3, -30748(%rbp)
	movb	$0, -30747(%rbp)
	movl	-30772(%rbp), %eax
	movl	%eax, -30744(%rbp)
	movl	$0, -30740(%rbp)
	.loc 1 208 13
	movq	-30808(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30748(%rbp), %rsi
	movl	$0, %ecx
	movl	$12, %edx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 210 13
	movl	-30772(%rbp), %eax
	movslq	%eax, %rdx
	movq	-30808(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30736(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	jmp	.L38
.L44:
	.loc 1 195 17
	nop
.L38:
.LBE14:
	.loc 1 192 22
	movq	-30768(%rbp), %rax
	movq	%rax, %rdi
	call	readdir@PLT
	movq	%rax, -30760(%rbp)
	.loc 1 192 35 discriminator 1
	cmpq	$0, -30760(%rbp)
	jne	.L41
	.loc 1 212 9
	movq	-30808(%rbp), %rax
	movl	4(%rax), %eax
	movl	$0, %ecx
	movl	$7, %edx
	leaq	.LC7(%rip), %rsi
	movl	%eax, %edi
	call	send@PLT
.LBE13:
	.loc 1 218 1
	jmp	.L45
.L37:
	.loc 1 216 9
	movq	-30808(%rbp), %rax
	movl	4(%rax), %eax
	movl	$0, %ecx
	movl	$7, %edx
	leaq	.LC9(%rip), %rsi
	movl	%eax, %edi
	call	send@PLT
.L45:
	.loc 1 218 1
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L43
	call	__stack_chk_fail@PLT
.L43:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE323:
	.size	ls_command, .-ls_command
	.globl	delete_command
	.type	delete_command, @function
delete_command:
.LFB324:
	.loc 1 221 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 222 1
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE324:
	.size	delete_command, .-delete_command
	.section	.rodata
	.align 8
.LC17:
	.string	"\033[31m[-] (%d) Select syscall failed with error: %d (%s)\n\033[0m"
	.align 8
.LC18:
	.string	"\033[33m\n[-] (%d) CONNECTION TIMEOUT:\n[-] Client connection idle for %d seconds\n------------------------------------------------------------\n\033[0m"
	.align 8
.LC19:
	.string	"[+] Recieved bytes:%d | command %d, chunk: %d, filename length %d, data length %d \n"
	.text
	.globl	handle_req
	.type	handle_req, @function
handle_req:
.LFB325:
	.loc 1 242 1
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
.LPSRL3:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL3
	subq	$2272, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -30952(%rbp)
	.loc 1 242 1
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
.L63:
.LBB15:
.LBB16:
	.loc 1 250 9
	leaq	-30880(%rbp), %rax
	movq	%rax, -30920(%rbp)
	movl	$0, -30940(%rbp)
	jmp	.L48
.L49:
	.loc 1 250 9 is_stmt 0 discriminator 3
	movq	-30920(%rbp), %rax
	movl	-30940(%rbp), %edx
	movq	$0, (%rax,%rdx,8)
	addl	$1, -30940(%rbp)
.L48:
	.loc 1 250 9 discriminator 1
	cmpl	$15, -30940(%rbp)
	jbe	.L49
.LBE16:
	.loc 1 251 9 is_stmt 1
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
	.loc 1 254 24
	movq	$2, -30896(%rbp)
	movq	$0, -30888(%rbp)
	.loc 1 257 38
	movq	-30952(%rbp), %rax
	movl	4(%rax), %eax
	.loc 1 257 29
	leal	1(%rax), %edi
	leaq	-30896(%rbp), %rdx
	leaq	-30880(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	call	select@PLT
	movl	%eax, -30936(%rbp)
	.loc 1 259 12
	cmpl	$0, -30936(%rbp)
	jns	.L50
	.loc 1 262 47
	call	__errno_location@PLT
	.loc 1 261 13
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %r12
	.loc 1 262 31
	call	__errno_location@PLT
	.loc 1 261 13
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	.loc 1 261 13 is_stmt 0 discriminator 2
	movq	stderr(%rip), %rax
	movq	%r12, %r8
	movl	%ebx, %ecx
	leaq	.LC17(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 263 13 is_stmt 1
	jmp	.L62
.L50:
	.loc 1 267 17
	cmpl	$0, -30936(%rbp)
	jne	.L52
	.loc 1 269 13
	call	gettid@PLT
	.loc 1 269 13 is_stmt 0 discriminator 1
	movl	$2, %edx
	movl	%eax, %esi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 273 13 is_stmt 1
	jmp	.L62
.L52:
	.loc 1 277 18
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
	.loc 1 277 17
	testq	%rax, %rax
	je	.L63
.LBB17:
	.loc 1 279 13
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 281 17
	movl	$0, -30932(%rbp)
.LBB18:
	.loc 1 284 13
	movq	-30952(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30908(%rbp), %rsi
	movl	$0, %ecx
	movl	$12, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 284 13 is_stmt 0 discriminator 1
	movl	%eax, -30928(%rbp)
	cmpl	$0, -30928(%rbp)
	jg	.L54
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 284 13 discriminator 2
	movq	-30952(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
.LBE18:
.LBE17:
	.loc 1 263 13 is_stmt 1 discriminator 1
	jmp	.L62
.L54:
.LBB20:
.LBB19:
	.loc 1 284 13 discriminator 2
	cmpl	$0, -30928(%rbp)
	jne	.L56
	.loc 1 284 13 is_stmt 0 discriminator 4
	movq	-30952(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 284 13 discriminator 1
	call	__errno_location@PLT
	.loc 1 284 13 discriminator 2
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L56:
.LBE19:
	.loc 1 286 13 is_stmt 1
	movl	-30900(%rbp), %edi
	movl	-30904(%rbp), %esi
	.loc 1 286 156
	movzbl	-30907(%rbp), %eax
	.loc 1 286 13
	movzbl	%al, %ecx
	.loc 1 286 132
	movzbl	-30908(%rbp), %eax
	.loc 1 286 13
	movzbl	%al, %edx
	movl	-30924(%rbp), %eax
	movl	%edi, %r9d
	movl	%esi, %r8d
	movl	%eax, %esi
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 288 35
	movzbl	-30908(%rbp), %eax
	movzbl	%al, %eax
	.loc 1 288 13
	cmpl	$3, %eax
	je	.L57
	cmpl	$3, %eax
	jg	.L63
	cmpl	$2, %eax
	je	.L66
	cmpl	$2, %eax
	jg	.L63
	testl	%eax, %eax
	je	.L60
	cmpl	$1, %eax
	jne	.L63
	.loc 1 291 17
	leaq	-30908(%rbp), %rdx
	movq	-30952(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	put_command
	.loc 1 292 17
	jmp	.L61
.L60:
	.loc 1 294 17
	leaq	-30908(%rbp), %rdx
	movq	-30952(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_command
	.loc 1 295 17
	jmp	.L61
.L57:
	.loc 1 299 17
	leaq	-30908(%rbp), %rdx
	movq	-30952(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	ls_command
	.loc 1 300 17
	jmp	.L61
.L66:
	.loc 1 297 17
	nop
.L61:
.LBE20:
.LBE15:
	.loc 1 249 5
	jmp	.L63
.L62:
	.loc 1 309 5
	movq	-30952(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 311 12
	movl	$0, %eax
	.loc 1 312 1
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L65
	call	__stack_chk_fail@PLT
.L65:
	addq	$30944, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE325:
	.size	handle_req, .-handle_req
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/14/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h"
	.file 8 "/usr/include/x86_64-linux-gnu/sys/select.h"
	.file 9 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"
	.file 10 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h"
	.file 11 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.file 12 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h"
	.file 13 "/usr/include/unistd.h"
	.file 14 "/usr/include/x86_64-linux-gnu/bits/dirent.h"
	.file 15 "/usr/include/x86_64-linux-gnu/bits/sockaddr.h"
	.file 16 "/usr/include/x86_64-linux-gnu/bits/socket.h"
	.file 17 "/usr/include/netinet/in.h"
	.file 18 "/usr/include/netdb.h"
	.file 19 "/usr/include/dirent.h"
	.file 20 "./common.h"
	.file 21 "/usr/include/string.h"
	.file 22 "/usr/include/x86_64-linux-gnu/sys/socket.h"
	.file 23 "/usr/include/x86_64-linux-gnu/bits/unistd_ext.h"
	.file 24 "/usr/include/errno.h"
	.file 25 "/usr/include/stdlib.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x115c
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x21
	.long	.LASF206
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x4
	.long	.LASF7
	.byte	0x2
	.byte	0xd6
	.byte	0x17
	.long	0x3a
	.uleb128 0x6
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x22
	.byte	0x8
	.uleb128 0xf
	.long	0x48
	.uleb128 0x6
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x6
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x6
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x4
	.long	.LASF8
	.byte	0x3
	.byte	0x26
	.byte	0x17
	.long	0x4f
	.uleb128 0x6
	.byte	0x2
	.byte	0x5
	.long	.LASF9
	.uleb128 0x4
	.long	.LASF10
	.byte	0x3
	.byte	0x28
	.byte	0x1c
	.long	0x56
	.uleb128 0x23
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x4
	.long	.LASF11
	.byte	0x3
	.byte	0x2a
	.byte	0x16
	.long	0x41
	.uleb128 0x6
	.byte	0x8
	.byte	0x5
	.long	.LASF12
	.uleb128 0x4
	.long	.LASF13
	.byte	0x3
	.byte	0x94
	.byte	0x19
	.long	0x3a
	.uleb128 0x4
	.long	.LASF14
	.byte	0x3
	.byte	0x98
	.byte	0x19
	.long	0x96
	.uleb128 0x4
	.long	.LASF15
	.byte	0x3
	.byte	0x99
	.byte	0x1b
	.long	0x96
	.uleb128 0x4
	.long	.LASF16
	.byte	0x3
	.byte	0x9a
	.byte	0x19
	.long	0x83
	.uleb128 0x4
	.long	.LASF17
	.byte	0x3
	.byte	0xa0
	.byte	0x1a
	.long	0x96
	.uleb128 0x4
	.long	.LASF18
	.byte	0x3
	.byte	0xa2
	.byte	0x1f
	.long	0x96
	.uleb128 0x4
	.long	.LASF19
	.byte	0x3
	.byte	0xc2
	.byte	0x1b
	.long	0x96
	.uleb128 0x5
	.long	0xf6
	.uleb128 0x6
	.byte	0x1
	.byte	0x6
	.long	.LASF20
	.uleb128 0x24
	.long	0xf6
	.uleb128 0x4
	.long	.LASF21
	.byte	0x3
	.byte	0xd2
	.byte	0x17
	.long	0x41
	.uleb128 0xc
	.long	.LASF57
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x295
	.uleb128 0x1
	.long	.LASF22
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x83
	.byte	0
	.uleb128 0x1
	.long	.LASF23
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0xf1
	.byte	0x8
	.uleb128 0x1
	.long	.LASF24
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0xf1
	.byte	0x10
	.uleb128 0x1
	.long	.LASF25
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0xf1
	.byte	0x18
	.uleb128 0x1
	.long	.LASF26
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0xf1
	.byte	0x20
	.uleb128 0x1
	.long	.LASF27
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0xf1
	.byte	0x28
	.uleb128 0x1
	.long	.LASF28
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0xf1
	.byte	0x30
	.uleb128 0x1
	.long	.LASF29
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0xf1
	.byte	0x38
	.uleb128 0x1
	.long	.LASF30
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0xf1
	.byte	0x40
	.uleb128 0x1
	.long	.LASF31
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0xf1
	.byte	0x48
	.uleb128 0x1
	.long	.LASF32
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0xf1
	.byte	0x50
	.uleb128 0x1
	.long	.LASF33
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0xf1
	.byte	0x58
	.uleb128 0x1
	.long	.LASF34
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x2ae
	.byte	0x60
	.uleb128 0x1
	.long	.LASF35
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x2b3
	.byte	0x68
	.uleb128 0x1
	.long	.LASF36
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x83
	.byte	0x70
	.uleb128 0x1
	.long	.LASF37
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x83
	.byte	0x74
	.uleb128 0x1
	.long	.LASF38
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0xa9
	.byte	0x78
	.uleb128 0x1
	.long	.LASF39
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x56
	.byte	0x80
	.uleb128 0x1
	.long	.LASF40
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x5d
	.byte	0x82
	.uleb128 0x1
	.long	.LASF41
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x2b8
	.byte	0x83
	.uleb128 0x1
	.long	.LASF42
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x2c8
	.byte	0x88
	.uleb128 0x1
	.long	.LASF43
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0xb5
	.byte	0x90
	.uleb128 0x1
	.long	.LASF44
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x2d2
	.byte	0x98
	.uleb128 0x1
	.long	.LASF45
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x2dc
	.byte	0xa0
	.uleb128 0x1
	.long	.LASF46
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x2b3
	.byte	0xa8
	.uleb128 0x1
	.long	.LASF47
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0x48
	.byte	0xb0
	.uleb128 0x1
	.long	.LASF48
	.byte	0x4
	.byte	0x5f
	.byte	0x15
	.long	0x2e1
	.byte	0xb8
	.uleb128 0x1
	.long	.LASF49
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x83
	.byte	0xc0
	.uleb128 0x1
	.long	.LASF50
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x2e6
	.byte	0xc4
	.byte	0
	.uleb128 0x4
	.long	.LASF51
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0x10e
	.uleb128 0x25
	.long	.LASF207
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0x14
	.long	.LASF52
	.uleb128 0x5
	.long	0x2a9
	.uleb128 0x5
	.long	0x10e
	.uleb128 0x9
	.long	0xf6
	.long	0x2c8
	.uleb128 0xa
	.long	0x3a
	.byte	0
	.byte	0
	.uleb128 0x5
	.long	0x2a1
	.uleb128 0x14
	.long	.LASF53
	.uleb128 0x5
	.long	0x2cd
	.uleb128 0x14
	.long	.LASF54
	.uleb128 0x5
	.long	0x2d7
	.uleb128 0x5
	.long	0x2b3
	.uleb128 0x9
	.long	0xf6
	.long	0x2f6
	.uleb128 0xa
	.long	0x3a
	.byte	0x13
	.byte	0
	.uleb128 0x5
	.long	0xfd
	.uleb128 0xf
	.long	0x2f6
	.uleb128 0x4
	.long	.LASF55
	.byte	0x6
	.byte	0x4e
	.byte	0x13
	.long	0xe5
	.uleb128 0x5
	.long	0x295
	.uleb128 0xf
	.long	0x30c
	.uleb128 0x26
	.long	.LASF208
	.byte	0x6
	.byte	0x97
	.byte	0xe
	.long	0x30c
	.uleb128 0x6
	.byte	0x8
	.byte	0x5
	.long	.LASF56
	.uleb128 0xc
	.long	.LASF58
	.byte	0x10
	.byte	0x7
	.byte	0x8
	.byte	0x8
	.long	0x351
	.uleb128 0x1
	.long	.LASF59
	.byte	0x7
	.byte	0xe
	.byte	0xc
	.long	0xcd
	.byte	0
	.uleb128 0x1
	.long	.LASF60
	.byte	0x7
	.byte	0xf
	.byte	0x11
	.long	0xd9
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.long	.LASF61
	.byte	0x8
	.byte	0x31
	.byte	0x12
	.long	0x96
	.uleb128 0x1a
	.byte	0x80
	.byte	0x8
	.byte	0x3b
	.long	0x373
	.uleb128 0x1
	.long	.LASF62
	.byte	0x8
	.byte	0x40
	.byte	0xf
	.long	0x373
	.byte	0
	.byte	0
	.uleb128 0x9
	.long	0x351
	.long	0x383
	.uleb128 0xa
	.long	0x3a
	.byte	0xf
	.byte	0
	.uleb128 0x4
	.long	.LASF63
	.byte	0x8
	.byte	0x46
	.byte	0x5
	.long	0x35d
	.uleb128 0x6
	.byte	0x8
	.byte	0x7
	.long	.LASF64
	.uleb128 0xc
	.long	.LASF65
	.byte	0x10
	.byte	0x9
	.byte	0x33
	.byte	0x10
	.long	0x3be
	.uleb128 0x1
	.long	.LASF66
	.byte	0x9
	.byte	0x35
	.byte	0x23
	.long	0x3be
	.byte	0
	.uleb128 0x1
	.long	.LASF67
	.byte	0x9
	.byte	0x36
	.byte	0x23
	.long	0x3be
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.long	0x396
	.uleb128 0x4
	.long	.LASF68
	.byte	0x9
	.byte	0x37
	.byte	0x3
	.long	0x396
	.uleb128 0xc
	.long	.LASF69
	.byte	0x28
	.byte	0xa
	.byte	0x16
	.byte	0x8
	.long	0x445
	.uleb128 0x1
	.long	.LASF70
	.byte	0xa
	.byte	0x18
	.byte	0x7
	.long	0x83
	.byte	0
	.uleb128 0x1
	.long	.LASF71
	.byte	0xa
	.byte	0x19
	.byte	0x10
	.long	0x41
	.byte	0x4
	.uleb128 0x1
	.long	.LASF72
	.byte	0xa
	.byte	0x1a
	.byte	0x7
	.long	0x83
	.byte	0x8
	.uleb128 0x1
	.long	.LASF73
	.byte	0xa
	.byte	0x1c
	.byte	0x10
	.long	0x41
	.byte	0xc
	.uleb128 0x1
	.long	.LASF74
	.byte	0xa
	.byte	0x20
	.byte	0x7
	.long	0x83
	.byte	0x10
	.uleb128 0x1
	.long	.LASF75
	.byte	0xa
	.byte	0x22
	.byte	0x9
	.long	0x70
	.byte	0x14
	.uleb128 0x1
	.long	.LASF76
	.byte	0xa
	.byte	0x23
	.byte	0x9
	.long	0x70
	.byte	0x16
	.uleb128 0x1
	.long	.LASF77
	.byte	0xa
	.byte	0x24
	.byte	0x14
	.long	0x3c3
	.byte	0x18
	.byte	0
	.uleb128 0x1b
	.byte	0x28
	.byte	0xb
	.byte	0x43
	.byte	0x9
	.long	0x473
	.uleb128 0x10
	.long	.LASF78
	.byte	0xb
	.byte	0x45
	.byte	0x1c
	.long	0x3cf
	.uleb128 0x10
	.long	.LASF79
	.byte	0xb
	.byte	0x46
	.byte	0x8
	.long	0x473
	.uleb128 0x10
	.long	.LASF80
	.byte	0xb
	.byte	0x47
	.byte	0xc
	.long	0x96
	.byte	0
	.uleb128 0x9
	.long	0xf6
	.long	0x483
	.uleb128 0xa
	.long	0x3a
	.byte	0x27
	.byte	0
	.uleb128 0x4
	.long	.LASF81
	.byte	0xb
	.byte	0x48
	.byte	0x3
	.long	0x445
	.uleb128 0x5
	.long	0x494
	.uleb128 0x27
	.uleb128 0x4
	.long	.LASF82
	.byte	0xc
	.byte	0x18
	.byte	0x13
	.long	0x64
	.uleb128 0x4
	.long	.LASF83
	.byte	0xc
	.byte	0x19
	.byte	0x14
	.long	0x77
	.uleb128 0x4
	.long	.LASF84
	.byte	0xc
	.byte	0x1a
	.byte	0x14
	.long	0x8a
	.uleb128 0x28
	.long	.LASF85
	.byte	0xd
	.value	0x112
	.byte	0x15
	.long	0x102
	.uleb128 0x5
	.long	0xf1
	.uleb128 0xf
	.long	0x4c6
	.uleb128 0x29
	.long	.LASF86
	.value	0x118
	.byte	0xe
	.byte	0x16
	.byte	0x8
	.long	0x520
	.uleb128 0x1
	.long	.LASF87
	.byte	0xe
	.byte	0x19
	.byte	0xd
	.long	0x9d
	.byte	0
	.uleb128 0x1
	.long	.LASF88
	.byte	0xe
	.byte	0x1a
	.byte	0xd
	.long	0xa9
	.byte	0x8
	.uleb128 0x1
	.long	.LASF89
	.byte	0xe
	.byte	0x1f
	.byte	0x18
	.long	0x56
	.byte	0x10
	.uleb128 0x1
	.long	.LASF90
	.byte	0xe
	.byte	0x20
	.byte	0x13
	.long	0x4f
	.byte	0x12
	.uleb128 0x1
	.long	.LASF91
	.byte	0xe
	.byte	0x21
	.byte	0xa
	.long	0x520
	.byte	0x13
	.byte	0
	.uleb128 0x9
	.long	0xf6
	.long	0x530
	.uleb128 0xa
	.long	0x3a
	.byte	0xff
	.byte	0
	.uleb128 0x1c
	.long	0x41
	.byte	0x13
	.byte	0x62
	.byte	0x3
	.long	0x573
	.uleb128 0x7
	.long	.LASF92
	.byte	0
	.uleb128 0x7
	.long	.LASF93
	.byte	0x1
	.uleb128 0x7
	.long	.LASF94
	.byte	0x2
	.uleb128 0x7
	.long	.LASF95
	.byte	0x4
	.uleb128 0x7
	.long	.LASF96
	.byte	0x6
	.uleb128 0x7
	.long	.LASF97
	.byte	0x8
	.uleb128 0x7
	.long	.LASF98
	.byte	0xa
	.uleb128 0x7
	.long	.LASF99
	.byte	0xc
	.uleb128 0x7
	.long	.LASF100
	.byte	0xe
	.byte	0
	.uleb128 0x2a
	.string	"DIR"
	.byte	0x13
	.byte	0x7f
	.byte	0x1c
	.long	0x57f
	.uleb128 0x14
	.long	.LASF101
	.uleb128 0x4
	.long	.LASF102
	.byte	0xf
	.byte	0x1c
	.byte	0x1c
	.long	0x56
	.uleb128 0xc
	.long	.LASF103
	.byte	0x10
	.byte	0x10
	.byte	0xb8
	.byte	0x27
	.long	0x5b8
	.uleb128 0x1
	.long	.LASF104
	.byte	0x10
	.byte	0xba
	.byte	0x5
	.long	0x584
	.byte	0
	.uleb128 0x1
	.long	.LASF105
	.byte	0x10
	.byte	0xbb
	.byte	0xa
	.long	0x5b8
	.byte	0x2
	.byte	0
	.uleb128 0x9
	.long	0xf6
	.long	0x5c8
	.uleb128 0xa
	.long	0x3a
	.byte	0xd
	.byte	0
	.uleb128 0xc
	.long	.LASF106
	.byte	0x80
	.byte	0x10
	.byte	0xc5
	.byte	0x27
	.long	0x5fd
	.uleb128 0x1
	.long	.LASF107
	.byte	0x10
	.byte	0xc7
	.byte	0x5
	.long	0x584
	.byte	0
	.uleb128 0x1
	.long	.LASF108
	.byte	0x10
	.byte	0xc8
	.byte	0xa
	.long	0x5fd
	.byte	0x2
	.uleb128 0x1
	.long	.LASF109
	.byte	0x10
	.byte	0xc9
	.byte	0x14
	.long	0x3a
	.byte	0x78
	.byte	0
	.uleb128 0x9
	.long	0xf6
	.long	0x60d
	.uleb128 0xa
	.long	0x3a
	.byte	0x75
	.byte	0
	.uleb128 0x5
	.long	0x590
	.uleb128 0xc
	.long	.LASF110
	.byte	0x10
	.byte	0x11
	.byte	0xf7
	.byte	0x27
	.long	0x654
	.uleb128 0x1
	.long	.LASF111
	.byte	0x11
	.byte	0xf9
	.byte	0x5
	.long	0x584
	.byte	0
	.uleb128 0x1
	.long	.LASF112
	.byte	0x11
	.byte	0xfa
	.byte	0xf
	.long	0x6d0
	.byte	0x2
	.uleb128 0x1
	.long	.LASF113
	.byte	0x11
	.byte	0xfb
	.byte	0x14
	.long	0x6b5
	.byte	0x4
	.uleb128 0x1
	.long	.LASF114
	.byte	0x11
	.byte	0xfe
	.byte	0x13
	.long	0x755
	.byte	0x8
	.byte	0
	.uleb128 0x1d
	.long	.LASF115
	.byte	0x1c
	.byte	0x11
	.value	0x108
	.byte	0x27
	.long	0x6a9
	.uleb128 0x8
	.long	.LASF116
	.byte	0x11
	.value	0x10a
	.byte	0x5
	.long	0x584
	.byte	0
	.uleb128 0x8
	.long	.LASF117
	.byte	0x11
	.value	0x10b
	.byte	0xf
	.long	0x6d0
	.byte	0x2
	.uleb128 0x8
	.long	.LASF118
	.byte	0x11
	.value	0x10c
	.byte	0xe
	.long	0x4ad
	.byte	0x4
	.uleb128 0x8
	.long	.LASF119
	.byte	0x11
	.value	0x10d
	.byte	0x15
	.long	0x73a
	.byte	0x8
	.uleb128 0x8
	.long	.LASF120
	.byte	0x11
	.value	0x10e
	.byte	0xe
	.long	0x4ad
	.byte	0x18
	.byte	0
	.uleb128 0x4
	.long	.LASF121
	.byte	0x11
	.byte	0x1e
	.byte	0x12
	.long	0x4ad
	.uleb128 0xc
	.long	.LASF122
	.byte	0x4
	.byte	0x11
	.byte	0x1f
	.byte	0x8
	.long	0x6d0
	.uleb128 0x1
	.long	.LASF123
	.byte	0x11
	.byte	0x21
	.byte	0xf
	.long	0x6a9
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	.LASF124
	.byte	0x11
	.byte	0x7d
	.byte	0x12
	.long	0x4a1
	.uleb128 0x1b
	.byte	0x10
	.byte	0x11
	.byte	0xdf
	.byte	0x5
	.long	0x70a
	.uleb128 0x10
	.long	.LASF125
	.byte	0x11
	.byte	0xe1
	.byte	0xa
	.long	0x70a
	.uleb128 0x10
	.long	.LASF126
	.byte	0x11
	.byte	0xe2
	.byte	0xb
	.long	0x71a
	.uleb128 0x10
	.long	.LASF127
	.byte	0x11
	.byte	0xe3
	.byte	0xb
	.long	0x72a
	.byte	0
	.uleb128 0x9
	.long	0x495
	.long	0x71a
	.uleb128 0xa
	.long	0x3a
	.byte	0xf
	.byte	0
	.uleb128 0x9
	.long	0x4a1
	.long	0x72a
	.uleb128 0xa
	.long	0x3a
	.byte	0x7
	.byte	0
	.uleb128 0x9
	.long	0x4ad
	.long	0x73a
	.uleb128 0xa
	.long	0x3a
	.byte	0x3
	.byte	0
	.uleb128 0xc
	.long	.LASF128
	.byte	0x10
	.byte	0x11
	.byte	0xdd
	.byte	0x8
	.long	0x755
	.uleb128 0x1
	.long	.LASF129
	.byte	0x11
	.byte	0xe4
	.byte	0x9
	.long	0x6dc
	.byte	0
	.byte	0
	.uleb128 0x9
	.long	0x4f
	.long	0x765
	.uleb128 0xa
	.long	0x3a
	.byte	0x7
	.byte	0
	.uleb128 0x1d
	.long	.LASF130
	.byte	0x30
	.byte	0x12
	.value	0x235
	.byte	0x8
	.long	0x7e4
	.uleb128 0x8
	.long	.LASF131
	.byte	0x12
	.value	0x237
	.byte	0x7
	.long	0x83
	.byte	0
	.uleb128 0x8
	.long	.LASF132
	.byte	0x12
	.value	0x238
	.byte	0x7
	.long	0x83
	.byte	0x4
	.uleb128 0x8
	.long	.LASF133
	.byte	0x12
	.value	0x239
	.byte	0x7
	.long	0x83
	.byte	0x8
	.uleb128 0x8
	.long	.LASF134
	.byte	0x12
	.value	0x23a
	.byte	0x7
	.long	0x83
	.byte	0xc
	.uleb128 0x8
	.long	.LASF135
	.byte	0x12
	.value	0x23b
	.byte	0xd
	.long	0x4b9
	.byte	0x10
	.uleb128 0x8
	.long	.LASF136
	.byte	0x12
	.value	0x23c
	.byte	0x14
	.long	0x60d
	.byte	0x18
	.uleb128 0x8
	.long	.LASF137
	.byte	0x12
	.value	0x23d
	.byte	0x9
	.long	0xf1
	.byte	0x20
	.uleb128 0x8
	.long	.LASF138
	.byte	0x12
	.value	0x23e
	.byte	0x14
	.long	0x7e4
	.byte	0x28
	.byte	0
	.uleb128 0x5
	.long	0x765
	.uleb128 0x6
	.byte	0x10
	.byte	0x5
	.long	.LASF139
	.uleb128 0x6
	.byte	0x10
	.byte	0x7
	.long	.LASF140
	.uleb128 0x6
	.byte	0x10
	.byte	0x4
	.long	.LASF141
	.uleb128 0x5
	.long	0x83
	.uleb128 0x1c
	.long	0x41
	.byte	0x14
	.byte	0x75
	.byte	0x1
	.long	0x839
	.uleb128 0x16
	.string	"GET"
	.byte	0
	.uleb128 0x16
	.string	"PUT"
	.byte	0x1
	.uleb128 0x7
	.long	.LASF142
	.byte	0x2
	.uleb128 0x16
	.string	"LS"
	.byte	0x3
	.uleb128 0x7
	.long	.LASF143
	.byte	0x4
	.uleb128 0x7
	.long	.LASF144
	.byte	0x5
	.uleb128 0x7
	.long	.LASF145
	.byte	0x6
	.byte	0
	.uleb128 0x1a
	.byte	0xc8
	.byte	0x14
	.byte	0x86
	.long	0x89d
	.uleb128 0x1
	.long	.LASF146
	.byte	0x14
	.byte	0x88
	.byte	0x9
	.long	0x83
	.byte	0
	.uleb128 0x1
	.long	.LASF147
	.byte	0x14
	.byte	0x89
	.byte	0x9
	.long	0x83
	.byte	0x4
	.uleb128 0x1
	.long	.LASF148
	.byte	0x14
	.byte	0x8b
	.byte	0xb
	.long	0xf1
	.byte	0x8
	.uleb128 0x1
	.long	.LASF149
	.byte	0x14
	.byte	0x8d
	.byte	0x1d
	.long	0x5c8
	.byte	0x10
	.uleb128 0x1
	.long	.LASF150
	.byte	0x14
	.byte	0x8e
	.byte	0x16
	.long	0x7e4
	.byte	0x90
	.uleb128 0x1
	.long	.LASF151
	.byte	0x14
	.byte	0x8f
	.byte	0x9
	.long	0x83
	.byte	0x98
	.uleb128 0x1
	.long	.LASF152
	.byte	0x14
	.byte	0x90
	.byte	0x15
	.long	0x483
	.byte	0xa0
	.byte	0
	.uleb128 0x4
	.long	.LASF153
	.byte	0x14
	.byte	0x91
	.byte	0x3
	.long	0x839
	.uleb128 0xc
	.long	.LASF154
	.byte	0xc
	.byte	0x1
	.byte	0x38
	.byte	0x10
	.long	0x8eb
	.uleb128 0x1
	.long	.LASF155
	.byte	0x1
	.byte	0x3a
	.byte	0xd
	.long	0x495
	.byte	0
	.uleb128 0x1
	.long	.LASF156
	.byte	0x1
	.byte	0x3b
	.byte	0xd
	.long	0x495
	.byte	0x1
	.uleb128 0x1
	.long	.LASF157
	.byte	0x1
	.byte	0x3c
	.byte	0xe
	.long	0x4ad
	.byte	0x4
	.uleb128 0x1
	.long	.LASF158
	.byte	0x1
	.byte	0x3d
	.byte	0xe
	.long	0x4ad
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.long	.LASF159
	.byte	0x1
	.byte	0x3e
	.byte	0x3
	.long	0x8a9
	.uleb128 0xb
	.long	.LASF160
	.byte	0x6
	.value	0x165
	.byte	0xc
	.long	0x83
	.long	0x914
	.uleb128 0x2
	.long	0x30c
	.uleb128 0x2
	.long	0x2f6
	.uleb128 0x17
	.byte	0
	.uleb128 0x1e
	.long	.LASF178
	.byte	0x17
	.byte	0x22
	.byte	0x10
	.long	0xc1
	.uleb128 0xb
	.long	.LASF161
	.byte	0x15
	.value	0x1a3
	.byte	0xe
	.long	0xf1
	.long	0x937
	.uleb128 0x2
	.long	0x83
	.byte	0
	.uleb128 0xe
	.long	.LASF162
	.byte	0x8
	.byte	0x66
	.byte	0xc
	.long	0x83
	.long	0x961
	.uleb128 0x2
	.long	0x83
	.uleb128 0x2
	.long	0x966
	.uleb128 0x2
	.long	0x966
	.uleb128 0x2
	.long	0x966
	.uleb128 0x2
	.long	0x970
	.byte	0
	.uleb128 0x5
	.long	0x383
	.uleb128 0xf
	.long	0x961
	.uleb128 0x5
	.long	0x329
	.uleb128 0xf
	.long	0x96b
	.uleb128 0xe
	.long	.LASF163
	.byte	0x13
	.byte	0xa4
	.byte	0x17
	.long	0x98b
	.long	0x98b
	.uleb128 0x2
	.long	0x990
	.byte	0
	.uleb128 0x5
	.long	0x4d0
	.uleb128 0x5
	.long	0x573
	.uleb128 0xe
	.long	.LASF164
	.byte	0x15
	.byte	0x2b
	.byte	0xe
	.long	0x48
	.long	0x9b5
	.uleb128 0x2
	.long	0x48
	.uleb128 0x2
	.long	0x48f
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0xe
	.long	.LASF165
	.byte	0x13
	.byte	0x8d
	.byte	0xd
	.long	0x990
	.long	0x9cb
	.uleb128 0x2
	.long	0x2f6
	.byte	0
	.uleb128 0xe
	.long	.LASF166
	.byte	0x15
	.byte	0x9f
	.byte	0xc
	.long	0x83
	.long	0x9eb
	.uleb128 0x2
	.long	0x2f6
	.uleb128 0x2
	.long	0x2f6
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0xb
	.long	.LASF167
	.byte	0x6
	.value	0x2d8
	.byte	0xf
	.long	0x2e
	.long	0xa11
	.uleb128 0x2
	.long	0x4a
	.uleb128 0x2
	.long	0x2e
	.uleb128 0x2
	.long	0x2e
	.uleb128 0x2
	.long	0x311
	.byte	0
	.uleb128 0xb
	.long	.LASF168
	.byte	0x15
	.value	0x197
	.byte	0xf
	.long	0x2e
	.long	0xa28
	.uleb128 0x2
	.long	0x2f6
	.byte	0
	.uleb128 0xb
	.long	.LASF169
	.byte	0x6
	.value	0x307
	.byte	0x11
	.long	0x96
	.long	0xa3f
	.uleb128 0x2
	.long	0x30c
	.byte	0
	.uleb128 0xb
	.long	.LASF170
	.byte	0x6
	.value	0x301
	.byte	0xc
	.long	0x83
	.long	0xa60
	.uleb128 0x2
	.long	0x30c
	.uleb128 0x2
	.long	0x96
	.uleb128 0x2
	.long	0x83
	.byte	0
	.uleb128 0xe
	.long	.LASF171
	.byte	0x6
	.byte	0xb8
	.byte	0xc
	.long	0x83
	.long	0xa76
	.uleb128 0x2
	.long	0x30c
	.byte	0
	.uleb128 0x2b
	.long	.LASF209
	.byte	0x19
	.value	0x2af
	.byte	0xd
	.long	0xa89
	.uleb128 0x2
	.long	0x48
	.byte	0
	.uleb128 0xe
	.long	.LASF172
	.byte	0x16
	.byte	0x8a
	.byte	0x10
	.long	0x300
	.long	0xaae
	.uleb128 0x2
	.long	0x83
	.uleb128 0x2
	.long	0x48f
	.uleb128 0x2
	.long	0x2e
	.uleb128 0x2
	.long	0x83
	.byte	0
	.uleb128 0xb
	.long	.LASF173
	.byte	0x6
	.value	0x2df
	.byte	0xf
	.long	0x2e
	.long	0xad4
	.uleb128 0x2
	.long	0x48f
	.uleb128 0x2
	.long	0x3a
	.uleb128 0x2
	.long	0x3a
	.uleb128 0x2
	.long	0x30c
	.byte	0
	.uleb128 0xb
	.long	.LASF174
	.byte	0x6
	.value	0x108
	.byte	0xe
	.long	0x30c
	.long	0xaf0
	.uleb128 0x2
	.long	0x2fb
	.uleb128 0x2
	.long	0x2fb
	.byte	0
	.uleb128 0xb
	.long	.LASF175
	.byte	0x6
	.value	0x193
	.byte	0xc
	.long	0x83
	.long	0xb0d
	.uleb128 0x2
	.long	0x4cb
	.uleb128 0x2
	.long	0x2fb
	.uleb128 0x17
	.byte	0
	.uleb128 0xb
	.long	.LASF176
	.byte	0xd
	.value	0x166
	.byte	0xc
	.long	0x83
	.long	0xb24
	.uleb128 0x2
	.long	0x83
	.byte	0
	.uleb128 0xb
	.long	.LASF177
	.byte	0x6
	.value	0x16b
	.byte	0xc
	.long	0x83
	.long	0xb3c
	.uleb128 0x2
	.long	0x2f6
	.uleb128 0x17
	.byte	0
	.uleb128 0x1e
	.long	.LASF179
	.byte	0x18
	.byte	0x25
	.byte	0xd
	.long	0x7fe
	.uleb128 0xe
	.long	.LASF180
	.byte	0x16
	.byte	0x91
	.byte	0x10
	.long	0x300
	.long	0xb6d
	.uleb128 0x2
	.long	0x83
	.uleb128 0x2
	.long	0x48
	.uleb128 0x2
	.long	0x2e
	.uleb128 0x2
	.long	0x83
	.byte	0
	.uleb128 0xe
	.long	.LASF181
	.byte	0x15
	.byte	0x3d
	.byte	0xe
	.long	0x48
	.long	0xb8d
	.uleb128 0x2
	.long	0x48
	.uleb128 0x2
	.long	0x83
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0x2c
	.long	.LASF210
	.byte	0x1
	.byte	0xf1
	.byte	0x7
	.long	0x48
	.quad	.LFB325
	.quad	.LFE325-.LFB325
	.uleb128 0x1
	.byte	0x9c
	.long	0xcb4
	.uleb128 0x11
	.string	"sd"
	.byte	0xf1
	.byte	0x21
	.long	0xcb4
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30968
	.uleb128 0x3
	.long	.LASF182
	.byte	0xf3
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30940
	.uleb128 0x3
	.long	.LASF183
	.byte	0xf4
	.byte	0xa
	.long	0xcb9
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30768
	.uleb128 0x3
	.long	.LASF184
	.byte	0xf5
	.byte	0xc
	.long	0x383
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30896
	.uleb128 0x2d
	.long	.LASF211
	.byte	0x1
	.byte	0xf6
	.byte	0x9
	.long	0x83
	.uleb128 0x2e
	.long	.LASF199
	.byte	0x1
	.value	0x131
	.byte	0x1
	.quad	.L62
	.uleb128 0x12
	.quad	.LBB15
	.quad	.LBE15-.LBB15
	.uleb128 0x3
	.long	.LASF185
	.byte	0xfe
	.byte	0x18
	.long	0x329
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30912
	.uleb128 0x15
	.long	.LASF186
	.value	0x101
	.byte	0xd
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30952
	.uleb128 0xd
	.quad	.LBB16
	.quad	.LBE16-.LBB16
	.long	0xc73
	.uleb128 0x13
	.string	"__i"
	.byte	0xfa
	.byte	0x9
	.long	0x41
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30956
	.uleb128 0x3
	.long	.LASF187
	.byte	0xfa
	.byte	0x9
	.long	0x961
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30936
	.byte	0
	.uleb128 0x1f
	.long	.LLRL0
	.uleb128 0x15
	.long	.LASF188
	.value	0x119
	.byte	0x11
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30948
	.uleb128 0x15
	.long	.LASF189
	.value	0x11a
	.byte	0x1e
	.long	0x8eb
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30924
	.uleb128 0x1f
	.long	.LLRL1
	.uleb128 0x15
	.long	.LASF190
	.value	0x11c
	.byte	0xd
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30944
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x5
	.long	0x89d
	.uleb128 0x9
	.long	0xf6
	.long	0xcca
	.uleb128 0x2f
	.long	0x3a
	.value	0x77ff
	.byte	0
	.uleb128 0x30
	.long	.LASF212
	.byte	0x1
	.byte	0xdc
	.byte	0x6
	.quad	.LFB324
	.quad	.LFE324-.LFB324
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x18
	.long	.LASF197
	.byte	0xb1
	.quad	.LFB323
	.quad	.LFE323-.LFB323
	.uleb128 0x1
	.byte	0x9c
	.long	0xdf2
	.uleb128 0x11
	.string	"sd"
	.byte	0xb1
	.byte	0x20
	.long	0xcb4
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30824
	.uleb128 0x19
	.long	.LASF189
	.byte	0xb1
	.byte	0x36
	.long	0xdf2
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30832
	.uleb128 0x3
	.long	.LASF182
	.byte	0xb4
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30808
	.uleb128 0x3
	.long	.LASF188
	.byte	0xb4
	.byte	0x17
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30804
	.uleb128 0x3
	.long	.LASF191
	.byte	0xb4
	.byte	0x28
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30800
	.uleb128 0x3
	.long	.LASF183
	.byte	0xb5
	.byte	0xa
	.long	0xcb9
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30752
	.uleb128 0x3
	.long	.LASF192
	.byte	0xb6
	.byte	0xa
	.long	0xcb9
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30752
	.uleb128 0x3
	.long	.LASF193
	.byte	0xb7
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30796
	.uleb128 0x13
	.string	"dp"
	.byte	0xb9
	.byte	0xa
	.long	0x990
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30784
	.uleb128 0x13
	.string	"ep"
	.byte	0xba
	.byte	0x14
	.long	0x98b
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30776
	.uleb128 0x12
	.quad	.LBB13
	.quad	.LBE13-.LBB13
	.uleb128 0x3
	.long	.LASF194
	.byte	0xbf
	.byte	0xd
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30792
	.uleb128 0x12
	.quad	.LBB14
	.quad	.LBE14-.LBB14
	.uleb128 0x3
	.long	.LASF195
	.byte	0xc4
	.byte	0x11
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30788
	.uleb128 0x3
	.long	.LASF196
	.byte	0xc9
	.byte	0x1e
	.long	0x8eb
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30764
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x5
	.long	0x8eb
	.uleb128 0x18
	.long	.LASF198
	.byte	0x6e
	.quad	.LFB322
	.quad	.LFE322-.LFB322
	.uleb128 0x1
	.byte	0x9c
	.long	0xfe6
	.uleb128 0x11
	.string	"sd"
	.byte	0x6e
	.byte	0x21
	.long	0xcb4
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61560
	.uleb128 0x19
	.long	.LASF189
	.byte	0x6e
	.byte	0x37
	.long	0xdf2
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61568
	.uleb128 0x3
	.long	.LASF182
	.byte	0x70
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61548
	.uleb128 0x3
	.long	.LASF188
	.byte	0x70
	.byte	0x17
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61552
	.uleb128 0x3
	.long	.LASF191
	.byte	0x70
	.byte	0x28
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61544
	.uleb128 0x3
	.long	.LASF183
	.byte	0x71
	.byte	0xa
	.long	0xcb9
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61472
	.uleb128 0x3
	.long	.LASF192
	.byte	0x72
	.byte	0xa
	.long	0xcb9
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30752
	.uleb128 0x3
	.long	.LASF193
	.byte	0x73
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61540
	.uleb128 0x20
	.long	.LASF200
	.byte	0xac
	.quad	.L21
	.uleb128 0x3
	.long	.LASF201
	.byte	0x79
	.byte	0xb
	.long	0xf1
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61504
	.uleb128 0x13
	.string	"fs"
	.byte	0x7b
	.byte	0xb
	.long	0x30c
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61496
	.uleb128 0x3
	.long	.LASF202
	.byte	0x84
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61532
	.uleb128 0x3
	.long	.LASF196
	.byte	0x8b
	.byte	0x16
	.long	0x8eb
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61484
	.uleb128 0xd
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.long	0xf05
	.uleb128 0x3
	.long	.LASF190
	.byte	0x76
	.byte	0x10
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61536
	.byte	0
	.uleb128 0xd
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.long	0xf2b
	.uleb128 0x3
	.long	.LASF190
	.byte	0x7f
	.byte	0x14
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61508
	.byte	0
	.uleb128 0xd
	.quad	.LBB8
	.quad	.LBE8-.LBB8
	.long	0xf51
	.uleb128 0x3
	.long	.LASF190
	.byte	0x89
	.byte	0x10
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61528
	.byte	0
	.uleb128 0xd
	.quad	.LBB9
	.quad	.LBE9-.LBB9
	.long	0xf77
	.uleb128 0x3
	.long	.LASF190
	.byte	0x92
	.byte	0x10
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61524
	.byte	0
	.uleb128 0xd
	.quad	.LBB10
	.quad	.LBE10-.LBB10
	.long	0xf9d
	.uleb128 0x3
	.long	.LASF190
	.byte	0x98
	.byte	0x14
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61512
	.byte	0
	.uleb128 0xd
	.quad	.LBB11
	.quad	.LBE11-.LBB11
	.long	0xfc3
	.uleb128 0x3
	.long	.LASF190
	.byte	0x9f
	.byte	0x10
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61520
	.byte	0
	.uleb128 0x12
	.quad	.LBB12
	.quad	.LBE12-.LBB12
	.uleb128 0x3
	.long	.LASF190
	.byte	0xa9
	.byte	0x5
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61516
	.byte	0
	.byte	0
	.uleb128 0x18
	.long	.LASF203
	.byte	0x40
	.quad	.LFB321
	.quad	.LFE321-.LFB321
	.uleb128 0x1
	.byte	0x9c
	.long	0x1133
	.uleb128 0x11
	.string	"sd"
	.byte	0x40
	.byte	0x21
	.long	0xcb4
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30808
	.uleb128 0x19
	.long	.LASF189
	.byte	0x40
	.byte	0x37
	.long	0xdf2
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30816
	.uleb128 0x3
	.long	.LASF182
	.byte	0x42
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30792
	.uleb128 0x3
	.long	.LASF188
	.byte	0x42
	.byte	0x17
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30800
	.uleb128 0x3
	.long	.LASF204
	.byte	0x42
	.byte	0x28
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30788
	.uleb128 0x3
	.long	.LASF183
	.byte	0x43
	.byte	0xa
	.long	0xcb9
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30752
	.uleb128 0x3
	.long	.LASF193
	.byte	0x44
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30796
	.uleb128 0x20
	.long	.LASF200
	.byte	0x69
	.quad	.L6
	.uleb128 0x3
	.long	.LASF201
	.byte	0x4a
	.byte	0xb
	.long	0xf1
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30768
	.uleb128 0x13
	.string	"fs"
	.byte	0x4c
	.byte	0xb
	.long	0x30c
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30760
	.uleb128 0xd
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.long	0x10c4
	.uleb128 0x3
	.long	.LASF190
	.byte	0x47
	.byte	0x10
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30784
	.byte	0
	.uleb128 0xd
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.long	0x10ea
	.uleb128 0x3
	.long	.LASF190
	.byte	0x57
	.byte	0x14
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30780
	.byte	0
	.uleb128 0xd
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.long	0x1110
	.uleb128 0x3
	.long	.LASF190
	.byte	0x65
	.byte	0x14
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30772
	.byte	0
	.uleb128 0x12
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x3
	.long	.LASF190
	.byte	0x67
	.byte	0x14
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30776
	.byte	0
	.byte	0
	.uleb128 0x31
	.long	.LASF205
	.byte	0x1
	.byte	0x2e
	.byte	0x7
	.long	0x48
	.quad	.LFB320
	.quad	.LFE320-.LFB320
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.string	"sa"
	.byte	0x2e
	.byte	0x24
	.long	0x60d
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
	.uleb128 0x7
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x16
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x23
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
	.uleb128 0x24
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
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
	.uleb128 0x26
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
	.uleb128 0x2a
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
	.uleb128 0x2b
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
	.uleb128 0x2c
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
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x30
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
	.uleb128 0x31
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
	.uleb128 .LBB17-.Ltext0
	.uleb128 .LBE17-.Ltext0
	.byte	0x4
	.uleb128 .LBB20-.Ltext0
	.uleb128 .LBE20-.Ltext0
	.byte	0
.LLRL1:
	.byte	0x4
	.uleb128 .LBB18-.Ltext0
	.uleb128 .LBE18-.Ltext0
	.byte	0x4
	.uleb128 .LBB19-.Ltext0
	.uleb128 .LBE19-.Ltext0
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF177:
	.string	"printf"
.LASF14:
	.string	"__off_t"
.LASF79:
	.string	"__size"
.LASF23:
	.string	"_IO_read_ptr"
.LASF35:
	.string	"_chain"
.LASF119:
	.string	"sin6_addr"
.LASF129:
	.string	"__in6_u"
.LASF7:
	.string	"size_t"
.LASF66:
	.string	"__prev"
.LASF80:
	.string	"__align"
.LASF92:
	.string	"DT_UNKNOWN"
.LASF41:
	.string	"_shortbuf"
.LASF176:
	.string	"close"
.LASF153:
	.string	"sockDetails_t"
.LASF8:
	.string	"__uint8_t"
.LASF55:
	.string	"ssize_t"
.LASF195:
	.string	"record_len"
.LASF206:
	.string	"GNU C17 14.2.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF200:
	.string	"done"
.LASF178:
	.string	"gettid"
.LASF158:
	.string	"data_length"
.LASF196:
	.string	"message_header_send"
.LASF183:
	.string	"recieved_buf"
.LASF64:
	.string	"long long unsigned int"
.LASF121:
	.string	"in_addr_t"
.LASF30:
	.string	"_IO_buf_end"
.LASF159:
	.string	"message_header_t"
.LASF67:
	.string	"__next"
.LASF149:
	.string	"client_info"
.LASF211:
	.string	"file_fd"
.LASF85:
	.string	"socklen_t"
.LASF209:
	.string	"free"
.LASF44:
	.string	"_codecvt"
.LASF37:
	.string	"_flags2"
.LASF146:
	.string	"sockfd"
.LASF170:
	.string	"fseek"
.LASF56:
	.string	"long long int"
.LASF6:
	.string	"signed char"
.LASF193:
	.string	"status"
.LASF205:
	.string	"get_in_addr"
.LASF190:
	.string	"nbytes"
.LASF36:
	.string	"_fileno"
.LASF13:
	.string	"__ino_t"
.LASF24:
	.string	"_IO_read_end"
.LASF126:
	.string	"__u6_addr16"
.LASF12:
	.string	"long int"
.LASF89:
	.string	"d_reclen"
.LASF22:
	.string	"_flags"
.LASF132:
	.string	"ai_family"
.LASF143:
	.string	"EXIT"
.LASF19:
	.string	"__ssize_t"
.LASF157:
	.string	"filename_length"
.LASF164:
	.string	"memcpy"
.LASF180:
	.string	"recv"
.LASF117:
	.string	"sin6_port"
.LASF38:
	.string	"_old_offset"
.LASF43:
	.string	"_offset"
.LASF68:
	.string	"__pthread_list_t"
.LASF91:
	.string	"d_name"
.LASF175:
	.string	"asprintf"
.LASF69:
	.string	"__pthread_mutex_s"
.LASF131:
	.string	"ai_flags"
.LASF96:
	.string	"DT_BLK"
.LASF114:
	.string	"sin_zero"
.LASF188:
	.string	"total_bytes"
.LASF165:
	.string	"opendir"
.LASF52:
	.string	"_IO_marker"
.LASF63:
	.string	"fd_set"
.LASF3:
	.string	"unsigned int"
.LASF123:
	.string	"s_addr"
.LASF47:
	.string	"_freeres_buf"
.LASF145:
	.string	"number_of_command"
.LASF160:
	.string	"fprintf"
.LASF155:
	.string	"command"
.LASF133:
	.string	"ai_socktype"
.LASF2:
	.string	"long unsigned int"
.LASF187:
	.string	"__arr"
.LASF78:
	.string	"__data"
.LASF27:
	.string	"_IO_write_ptr"
.LASF58:
	.string	"timeval"
.LASF151:
	.string	"addr_len"
.LASF76:
	.string	"__elision"
.LASF5:
	.string	"short unsigned int"
.LASF113:
	.string	"sin_addr"
.LASF88:
	.string	"d_off"
.LASF194:
	.string	"seq_num"
.LASF168:
	.string	"strlen"
.LASF31:
	.string	"_IO_save_base"
.LASF169:
	.string	"ftell"
.LASF148:
	.string	"dirname"
.LASF83:
	.string	"uint16_t"
.LASF42:
	.string	"_lock"
.LASF182:
	.string	"numbytes"
.LASF124:
	.string	"in_port_t"
.LASF62:
	.string	"fds_bits"
.LASF97:
	.string	"DT_REG"
.LASF197:
	.string	"ls_command"
.LASF212:
	.string	"delete_command"
.LASF72:
	.string	"__owner"
.LASF71:
	.string	"__count"
.LASF111:
	.string	"sin_family"
.LASF184:
	.string	"readfds"
.LASF198:
	.string	"get_command"
.LASF48:
	.string	"_prevchain"
.LASF163:
	.string	"readdir"
.LASF201:
	.string	"filename"
.LASF59:
	.string	"tv_sec"
.LASF116:
	.string	"sin6_family"
.LASF172:
	.string	"send"
.LASF144:
	.string	"SERVER_INFO"
.LASF28:
	.string	"_IO_write_end"
.LASF95:
	.string	"DT_DIR"
.LASF134:
	.string	"ai_protocol"
.LASF154:
	.string	"message_header_s"
.LASF86:
	.string	"dirent"
.LASF189:
	.string	"message_header"
.LASF87:
	.string	"d_ino"
.LASF106:
	.string	"sockaddr_storage"
.LASF207:
	.string	"_IO_lock_t"
.LASF199:
	.string	"cleanup"
.LASF57:
	.string	"_IO_FILE"
.LASF162:
	.string	"select"
.LASF94:
	.string	"DT_CHR"
.LASF135:
	.string	"ai_addrlen"
.LASF49:
	.string	"_mode"
.LASF174:
	.string	"fopen"
.LASF112:
	.string	"sin_port"
.LASF104:
	.string	"sa_family"
.LASF34:
	.string	"_markers"
.LASF142:
	.string	"DELETE"
.LASF140:
	.string	"__int128 unsigned"
.LASF120:
	.string	"sin6_scope_id"
.LASF4:
	.string	"unsigned char"
.LASF101:
	.string	"__dirstream"
.LASF90:
	.string	"d_type"
.LASF166:
	.string	"strncmp"
.LASF61:
	.string	"__fd_mask"
.LASF136:
	.string	"ai_addr"
.LASF9:
	.string	"short int"
.LASF54:
	.string	"_IO_wide_data"
.LASF99:
	.string	"DT_SOCK"
.LASF138:
	.string	"ai_next"
.LASF40:
	.string	"_vtable_offset"
.LASF51:
	.string	"FILE"
.LASF147:
	.string	"client_sock_fd"
.LASF167:
	.string	"fread"
.LASF18:
	.string	"__suseconds_t"
.LASF128:
	.string	"in6_addr"
.LASF60:
	.string	"tv_usec"
.LASF70:
	.string	"__lock"
.LASF98:
	.string	"DT_LNK"
.LASF156:
	.string	"chunk_id"
.LASF141:
	.string	"long double"
.LASF20:
	.string	"char"
.LASF93:
	.string	"DT_FIFO"
.LASF107:
	.string	"ss_family"
.LASF130:
	.string	"addrinfo"
.LASF21:
	.string	"__socklen_t"
.LASF118:
	.string	"sin6_flowinfo"
.LASF10:
	.string	"__uint16_t"
.LASF65:
	.string	"__pthread_internal_list"
.LASF125:
	.string	"__u6_addr8"
.LASF179:
	.string	"__errno_location"
.LASF11:
	.string	"__uint32_t"
.LASF171:
	.string	"fclose"
.LASF53:
	.string	"_IO_codecvt"
.LASF150:
	.string	"server_info"
.LASF15:
	.string	"__off64_t"
.LASF39:
	.string	"_cur_column"
.LASF25:
	.string	"_IO_read_base"
.LASF186:
	.string	"select_status"
.LASF33:
	.string	"_IO_save_end"
.LASF139:
	.string	"__int128"
.LASF191:
	.string	"numbytes_r"
.LASF81:
	.string	"pthread_mutex_t"
.LASF204:
	.string	"numbytes_w"
.LASF75:
	.string	"__spins"
.LASF17:
	.string	"__time_t"
.LASF102:
	.string	"sa_family_t"
.LASF50:
	.string	"_unused2"
.LASF208:
	.string	"stderr"
.LASF181:
	.string	"memset"
.LASF192:
	.string	"transmit_buf"
.LASF115:
	.string	"sockaddr_in6"
.LASF109:
	.string	"__ss_align"
.LASF103:
	.string	"sockaddr"
.LASF110:
	.string	"sockaddr_in"
.LASF203:
	.string	"put_command"
.LASF82:
	.string	"uint8_t"
.LASF73:
	.string	"__nusers"
.LASF32:
	.string	"_IO_backup_base"
.LASF108:
	.string	"__ss_padding"
.LASF173:
	.string	"fwrite"
.LASF105:
	.string	"sa_data"
.LASF46:
	.string	"_freeres_list"
.LASF77:
	.string	"__list"
.LASF137:
	.string	"ai_canonname"
.LASF127:
	.string	"__u6_addr32"
.LASF45:
	.string	"_wide_data"
.LASF210:
	.string	"handle_req"
.LASF74:
	.string	"__kind"
.LASF185:
	.string	"timeout"
.LASF161:
	.string	"strerror"
.LASF152:
	.string	"lock"
.LASF26:
	.string	"_IO_write_base"
.LASF100:
	.string	"DT_WHT"
.LASF29:
	.string	"_IO_buf_base"
.LASF84:
	.string	"uint32_t"
.LASF16:
	.string	"__pid_t"
.LASF122:
	.string	"in_addr"
.LASF202:
	.string	"file_size"
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
