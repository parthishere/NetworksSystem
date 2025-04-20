	.file	"handle_req.c"
	.text
.Ltext0:
	.file 0 "/home/parth/Work/All_data/university/Network System/Assignments/PA4/server" "src/handle_req.c"
	.globl	get_in_addr
	.type	get_in_addr, @function
get_in_addr:
.LFB320:
	.file 1 "src/handle_req.c"
	.loc 1 20 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	.loc 1 21 11
	movq	-8(%rbp), %rax
	movzwl	(%rax), %eax
	.loc 1 21 8
	cmpw	$2, %ax
	jne	.L2
	.loc 1 23 16
	movq	-8(%rbp), %rax
	addq	$4, %rax
	jmp	.L3
.L2:
	.loc 1 26 12
	movq	-8(%rbp), %rax
	addq	$8, %rax
.L3:
	.loc 1 27 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE320:
	.size	get_in_addr, .-get_in_addr
	.section	.rodata
	.align 8
.LC0:
	.string	"Num bytes read and write did not match \n"
	.align 8
.LC1:
	.string	"filename we are putting: %s (%d)\n"
.LC2:
	.string	"%s/%s_%d"
.LC3:
	.string	"wb"
.LC4:
	.string	"could not open file ! "
.LC5:
	.string	"ack\t\n0\t\n"
	.string	""
.LC6:
	.string	"nack\t\n0\t\n"
	.string	""
.LC7:
	.string	"something went wrong"
	.text
	.globl	put_command
	.type	put_command, @function
put_command:
.LFB321:
	.loc 1 38 1
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
	subq	$2112, %rsp
	movq	%rdi, -30776(%rbp)
	movq	%rsi, -30784(%rbp)
	.loc 1 38 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 39 9
	movl	$0, -30760(%rbp)
	.loc 1 39 23
	movl	$0, -30768(%rbp)
	.loc 1 39 40
	movl	$0, -30756(%rbp)
	.loc 1 41 9
	movl	$0, -30764(%rbp)
	.loc 1 43 5
	leaq	-30736(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 44 74
	movq	-30784(%rbp), %rax
	movl	4(%rax), %eax
	.loc 1 44 21
	movl	%eax, %edx
	movq	-30776(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30736(%rbp), %rsi
	movl	$256, %ecx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 44 19 discriminator 1
	movl	%eax, -30760(%rbp)
	.loc 1 44 8 discriminator 1
	cmpl	$0, -30760(%rbp)
	jg	.L5
	.loc 1 46 9
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$40, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 47 9
	jmp	.L6
.L5:
	.loc 1 49 78
	movq	-30784(%rbp), %rax
	movzbl	1(%rax), %eax
	.loc 1 49 5
	movzbl	%al, %edx
	leaq	-30736(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 52 77
	movq	-30784(%rbp), %rax
	movzbl	1(%rax), %eax
	.loc 1 52 5
	movzbl	%al, %esi
	movq	-30776(%rbp), %rax
	movq	8(%rax), %rdx
	leaq	-30736(%rbp), %rcx
	leaq	-30752(%rbp), %rax
	movl	%esi, %r8d
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	.loc 1 53 16
	movq	-30752(%rbp), %rax
	leaq	.LC3(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -30744(%rbp)
	.loc 1 54 7
	cmpq	$0, -30744(%rbp)
	jne	.L8
	.loc 1 55 9
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 56 9
	jmp	.L6
.L11:
	.loc 1 61 9
	leaq	-30736(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 62 73
	movq	-30784(%rbp), %rax
	movl	8(%rax), %eax
	.loc 1 62 20
	movl	%eax, %edx
	movq	-30776(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30736(%rbp), %rsi
	movl	$256, %ecx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 62 18 discriminator 1
	movl	%eax, -30760(%rbp)
	.loc 1 63 22
	movl	-30760(%rbp), %eax
	movslq	%eax, %rsi
	movq	-30744(%rbp), %rdx
	leaq	-30736(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 63 20 discriminator 1
	movl	%eax, -30756(%rbp)
	.loc 1 65 36
	movl	-30756(%rbp), %eax
	imull	-30760(%rbp), %eax
	.loc 1 65 12
	cmpl	%eax, -30760(%rbp)
	je	.L9
	.loc 1 67 13
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$40, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 68 20
	movl	$-1, -30764(%rbp)
	.loc 1 69 13
	jmp	.L10
.L9:
	.loc 1 71 21
	movl	-30760(%rbp), %eax
	addl	%eax, -30768(%rbp)
.L8:
	.loc 1 59 40
	movq	-30784(%rbp), %rax
	movl	8(%rax), %eax
	.loc 1 59 24
	movl	-30768(%rbp), %edx
	cmpl	%eax, %edx
	jb	.L11
.L10:
	.loc 1 75 8
	cmpl	$0, -30764(%rbp)
	js	.L12
	.loc 1 76 9
	movq	-30776(%rbp), %rax
	movl	4(%rax), %eax
	movl	$256, %ecx
	movl	$7, %edx
	leaq	.LC5(%rip), %rsi
	movl	%eax, %edi
	call	send@PLT
	jmp	.L13
.L12:
	.loc 1 78 9
	movq	-30776(%rbp), %rax
	movl	4(%rax), %eax
	movl	$256, %ecx
	movl	$8, %edx
	leaq	.LC6(%rip), %rsi
	movl	%eax, %edi
	call	send@PLT
.L13:
	.loc 1 80 5
	leaq	-30736(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 81 16
	movq	-30776(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30736(%rbp), %rsi
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 81 14 discriminator 1
	movl	%eax, -30760(%rbp)
	.loc 1 82 9
	leaq	-30736(%rbp), %rax
	movl	$7, %edx
	leaq	.LC5(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 82 8 discriminator 1
	testl	%eax, %eax
	je	.L15
	.loc 1 84 9
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L6
.L15:
	.loc 1 87 1
	nop
.L6:
	.loc 1 88 5
	movq	-30752(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 89 5
	movq	-30744(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	.loc 1 90 1
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L14
	call	__stack_chk_fail@PLT
.L14:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE321:
	.size	put_command, .-put_command
	.section	.rodata
.LC8:
	.string	"filename : %s\n"
.LC9:
	.string	"rb"
.LC10:
	.string	"Reading failed "
.LC11:
	.string	"file size %d \n"
.LC12:
	.string	"send bytes:%d\n"
.LC13:
	.string	"ACK recv so client is good"
	.text
	.globl	get_command
	.type	get_command, @function
get_command:
.LFB322:
	.loc 1 93 1
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
	subq	$96, %rsp
	movq	%rdi, -61528(%rbp)
	movq	%rsi, -61536(%rbp)
	.loc 1 93 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 94 9
	movl	$0, -61504(%rbp)
	.loc 1 94 23
	movl	$0, -61508(%rbp)
	.loc 1 94 40
	movl	$0, -61500(%rbp)
	.loc 1 97 9
	movl	$0, -61496(%rbp)
	.loc 1 99 5
	leaq	-61456(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 101 69
	movq	-61536(%rbp), %rax
	movl	4(%rax), %eax
	.loc 1 101 16
	movl	%eax, %edx
	movq	-61528(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-61456(%rbp), %rsi
	movl	$256, %ecx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 101 14 discriminator 1
	movl	%eax, -61504(%rbp)
	.loc 1 102 5
	leaq	-61456(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 105 78
	movq	-61536(%rbp), %rax
	movzbl	1(%rax), %eax
	.loc 1 105 5
	movzbl	%al, %esi
	movq	-61528(%rbp), %rax
	movq	8(%rax), %rdx
	leaq	-61456(%rbp), %rcx
	leaq	-61488(%rbp), %rax
	movl	%esi, %r8d
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	.loc 1 106 16
	movq	-61488(%rbp), %rax
	leaq	.LC9(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -61480(%rbp)
	.loc 1 107 8
	cmpq	$0, -61480(%rbp)
	jne	.L17
	.loc 1 109 9
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 110 20
	movq	-61528(%rbp), %rax
	movl	4(%rax), %eax
	movl	$0, %ecx
	movl	$8, %edx
	leaq	.LC6(%rip), %rsi
	movl	%eax, %edi
	call	send@PLT
	.loc 1 110 18 discriminator 1
	movl	%eax, -61504(%rbp)
	.loc 1 111 16
	movl	$-1, -61496(%rbp)
	.loc 1 112 9
	jmp	.L18
.L17:
	.loc 1 114 5
	movq	-61480(%rbp), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseek@PLT
	.loc 1 115 21
	movq	-61480(%rbp), %rax
	movq	%rax, %rdi
	call	ftell@PLT
	.loc 1 115 9 discriminator 1
	movl	%eax, -61492(%rbp)
	.loc 1 116 5
	movq	-61480(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseek@PLT
	.loc 1 118 5
	movl	-61492(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 120 16
	movq	-61528(%rbp), %rax
	movl	4(%rax), %eax
	movl	$0, %ecx
	movl	$7, %edx
	leaq	.LC5(%rip), %rsi
	movl	%eax, %edi
	call	send@PLT
	.loc 1 120 14 discriminator 1
	movl	%eax, -61504(%rbp)
	.loc 1 122 22
	movb	$0, -61468(%rbp)
	.loc 1 124 33
	movq	-61536(%rbp), %rax
	movzbl	1(%rax), %eax
	.loc 1 122 22
	movb	%al, -61467(%rbp)
	.loc 1 125 26
	movq	-61488(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 122 22
	movl	%eax, -61464(%rbp)
	movl	-61492(%rbp), %eax
	movl	%eax, -61460(%rbp)
	.loc 1 130 16
	movq	-61528(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-61468(%rbp), %rsi
	movl	$0, %ecx
	movl	$12, %edx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 130 14 discriminator 1
	movl	%eax, -61504(%rbp)
	.loc 1 131 17
	movl	$0, -61508(%rbp)
	.loc 1 132 11
	jmp	.L19
.L20:
	.loc 1 134 9
	leaq	-30736(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 135 20
	movl	-61492(%rbp), %eax
	movslq	%eax, %rdx
	movq	-61480(%rbp), %rcx
	leaq	-30736(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	fread@PLT
	.loc 1 135 18 discriminator 1
	movl	%eax, -61504(%rbp)
	.loc 1 136 20
	movl	-61504(%rbp), %eax
	movslq	%eax, %rdx
	movq	-61528(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30736(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 136 18 discriminator 1
	movl	%eax, -61504(%rbp)
	.loc 1 137 9
	movl	-61504(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 139 21
	movl	-61504(%rbp), %eax
	addl	%eax, -61508(%rbp)
.L19:
	.loc 1 132 24
	movl	-61508(%rbp), %eax
	cmpl	-61492(%rbp), %eax
	jl	.L20
	.loc 1 145 5
	leaq	-61456(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 146 16
	movq	-61528(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-61456(%rbp), %rsi
	movl	$0, %ecx
	movl	$30720, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 146 14 discriminator 1
	movl	%eax, -61504(%rbp)
	.loc 1 147 9
	leaq	-61456(%rbp), %rax
	movl	$7, %edx
	leaq	.LC5(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 147 8 discriminator 1
	testl	%eax, %eax
	jne	.L21
	.loc 1 149 9
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L22
.L21:
	.loc 1 153 9
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L22:
	.loc 1 158 5
	leaq	-61456(%rbp), %rax
	movl	$7, %edx
	leaq	.LC5(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	.loc 1 159 5
	movq	-61528(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-61456(%rbp), %rsi
	movl	$0, %ecx
	movl	$7, %edx
	movl	%eax, %edi
	call	send@PLT
.L18:
	.loc 1 163 5
	movq	-61488(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 164 5
	movq	-61480(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	.loc 1 165 1
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L23
	call	__stack_chk_fail@PLT
.L23:
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
	.loc 1 168 1
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
	.loc 1 168 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 170 9
	movl	$0, -30792(%rbp)
	.loc 1 170 23
	movl	$0, -30788(%rbp)
	.loc 1 170 40
	movl	$0, -30784(%rbp)
	.loc 1 173 9
	movl	$0, -30780(%rbp)
	.loc 1 177 20
	movq	-30808(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 177 10
	movq	%rax, %rdi
	call	opendir@PLT
	movq	%rax, -30768(%rbp)
	.loc 1 179 8
	cmpq	$0, -30768(%rbp)
	je	.L25
.LBB2:
	.loc 1 181 13
	movl	$0, -30776(%rbp)
	.loc 1 182 15
	jmp	.L26
.L30:
.LBB3:
	.loc 1 184 18
	movq	-30760(%rbp), %rax
	movzbl	18(%rax), %eax
	.loc 1 184 15
	cmpb	$8, %al
	jne	.L33
	.loc 1 185 39
	movq	-30760(%rbp), %rax
	addq	$19, %rax
	.loc 1 185 30
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 185 17 discriminator 1
	movl	%eax, -30772(%rbp)
	.loc 1 187 13
	leaq	-30736(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 188 13
	movl	-30772(%rbp), %eax
	movslq	%eax, %rdx
	.loc 1 188 36
	movq	-30760(%rbp), %rax
	leaq	19(%rax), %rcx
	.loc 1 188 13
	leaq	-30736(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	.loc 1 190 30
	movb	$3, -30748(%rbp)
	movb	$0, -30747(%rbp)
	movl	-30772(%rbp), %eax
	movl	%eax, -30744(%rbp)
	movl	$0, -30740(%rbp)
	.loc 1 197 13
	movq	-30808(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30748(%rbp), %rsi
	movl	$0, %ecx
	movl	$12, %edx
	movl	%eax, %edi
	call	send@PLT
	.loc 1 199 13
	movl	-30772(%rbp), %eax
	movslq	%eax, %rdx
	movq	-30808(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30736(%rbp), %rsi
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	jmp	.L26
.L33:
	.loc 1 184 38
	nop
.L26:
.LBE3:
	.loc 1 182 22
	movq	-30768(%rbp), %rax
	movq	%rax, %rdi
	call	readdir@PLT
	movq	%rax, -30760(%rbp)
	.loc 1 182 35 discriminator 1
	cmpq	$0, -30760(%rbp)
	jne	.L30
	.loc 1 201 9
	movq	-30808(%rbp), %rax
	movl	4(%rax), %eax
	movl	$0, %ecx
	movl	$7, %edx
	leaq	.LC5(%rip), %rsi
	movl	%eax, %edi
	call	send@PLT
.LBE2:
	.loc 1 207 1
	jmp	.L34
.L25:
	.loc 1 204 9
	movq	-30808(%rbp), %rax
	movl	4(%rax), %eax
	movl	$0, %ecx
	movl	$7, %edx
	leaq	.LC6(%rip), %rsi
	movl	%eax, %edi
	call	send@PLT
.L34:
	.loc 1 207 1
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L32
	call	__stack_chk_fail@PLT
.L32:
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
	.loc 1 210 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 211 1
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE324:
	.size	delete_command, .-delete_command
	.section	.rodata
	.align 8
.LC14:
	.string	"\033[31m[-] (%d) Select syscall failed with error: %d (%s)\n\033[0m"
	.align 8
.LC15:
	.string	"\033[33m\n[-] (%d) CONNECTION TIMEOUT:\n[-] Client connection idle for %d seconds\n------------------------------------------------------------\n\033[0m"
.LC16:
	.string	"\033[31m[-] (%d) read %d\n"
	.align 8
.LC17:
	.string	"\033[31m[-] (%d) peer has closed the connection exiting\n"
	.align 8
.LC18:
	.string	"[+] Recieved bytes:%d | command %d, chunk: %d, filename length %d, data length %d \n"
	.text
	.globl	handle_req
	.type	handle_req, @function
handle_req:
.LFB325:
	.loc 1 231 1
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
	.loc 1 231 1
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
.L52:
.LBB4:
.LBB5:
	.loc 1 239 9
	leaq	-30880(%rbp), %rax
	movq	%rax, -30920(%rbp)
	movl	$0, -30936(%rbp)
	jmp	.L37
.L38:
	.loc 1 239 9 is_stmt 0 discriminator 3
	movq	-30920(%rbp), %rax
	movl	-30936(%rbp), %edx
	movq	$0, (%rax,%rdx,8)
	addl	$1, -30936(%rbp)
.L37:
	.loc 1 239 9 discriminator 1
	cmpl	$15, -30936(%rbp)
	jbe	.L38
.LBE5:
	.loc 1 240 9 is_stmt 1
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
	.loc 1 243 24
	movq	$2, -30896(%rbp)
	movq	$0, -30888(%rbp)
	.loc 1 246 38
	movq	-30952(%rbp), %rax
	movl	4(%rax), %eax
	.loc 1 246 29
	leal	1(%rax), %edi
	leaq	-30896(%rbp), %rdx
	leaq	-30880(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	call	select@PLT
	movl	%eax, -30932(%rbp)
	.loc 1 248 12
	cmpl	$0, -30932(%rbp)
	jns	.L39
	.loc 1 251 47
	call	__errno_location@PLT
	.loc 1 250 13
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %r12
	.loc 1 251 31
	call	__errno_location@PLT
	.loc 1 250 13
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	.loc 1 250 13 is_stmt 0 discriminator 2
	movq	stderr(%rip), %rax
	movq	%r12, %r8
	movl	%ebx, %ecx
	leaq	.LC14(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 252 13 is_stmt 1
	jmp	.L51
.L39:
	.loc 1 256 17
	cmpl	$0, -30932(%rbp)
	jne	.L41
	.loc 1 258 13
	call	gettid@PLT
	.loc 1 258 13 is_stmt 0 discriminator 1
	movl	$2, %edx
	movl	%eax, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 262 13 is_stmt 1
	jmp	.L51
.L41:
	.loc 1 266 18
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
	.loc 1 266 17
	testq	%rax, %rax
	je	.L52
.LBB6:
	.loc 1 268 13
	leaq	-30752(%rbp), %rax
	movl	$30720, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 270 17
	movl	$0, -30928(%rbp)
	.loc 1 272 29
	movq	-30952(%rbp), %rax
	movl	4(%rax), %eax
	leaq	-30908(%rbp), %rsi
	movl	$256, %ecx
	movl	$12, %edx
	movl	%eax, %edi
	call	recv@PLT
	.loc 1 272 27 discriminator 1
	movl	%eax, -30924(%rbp)
	.loc 1 272 16 discriminator 1
	cmpl	$0, -30924(%rbp)
	jns	.L43
	.loc 1 274 69
	call	__errno_location@PLT
	.loc 1 274 17 discriminator 1
	movl	(%rax), %ebx
	call	gettid@PLT
	movl	%eax, %edx
	.loc 1 274 17 is_stmt 0 discriminator 2
	movq	stderr(%rip), %rax
	movl	%ebx, %ecx
	leaq	.LC16(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 275 17 is_stmt 1
	jmp	.L44
.L43:
	.loc 1 278 16
	cmpl	$0, -30924(%rbp)
	jne	.L45
	.loc 1 280 17
	call	gettid@PLT
	movl	%eax, %edx
	.loc 1 280 17 is_stmt 0 discriminator 1
	movq	stderr(%rip), %rax
	leaq	.LC17(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 281 17 is_stmt 1
	jmp	.L44
.L45:
	.loc 1 284 13
	movl	-30900(%rbp), %edi
	movl	-30904(%rbp), %esi
	.loc 1 284 156
	movzbl	-30907(%rbp), %eax
	.loc 1 284 13
	movzbl	%al, %ecx
	.loc 1 284 132
	movzbl	-30908(%rbp), %eax
	.loc 1 284 13
	movzbl	%al, %edx
	movl	-30924(%rbp), %eax
	movl	%edi, %r9d
	movl	%esi, %r8d
	movl	%eax, %esi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 286 35
	movzbl	-30908(%rbp), %eax
	movzbl	%al, %eax
	.loc 1 286 13
	cmpl	$3, %eax
	je	.L46
	cmpl	$3, %eax
	jg	.L52
	cmpl	$2, %eax
	je	.L55
	cmpl	$2, %eax
	jg	.L52
	testl	%eax, %eax
	je	.L49
	cmpl	$1, %eax
	jne	.L52
	.loc 1 289 17
	leaq	-30908(%rbp), %rdx
	movq	-30952(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	put_command
	.loc 1 290 17
	jmp	.L50
.L49:
	.loc 1 292 17
	leaq	-30908(%rbp), %rdx
	movq	-30952(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_command
	.loc 1 293 17
	jmp	.L50
.L46:
	.loc 1 297 17
	leaq	-30908(%rbp), %rdx
	movq	-30952(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	ls_command
	.loc 1 298 17
	jmp	.L50
.L44:
.LBE6:
	.loc 1 252 13 discriminator 1
	jmp	.L51
.L55:
.LBB7:
	.loc 1 295 17
	nop
.L50:
.LBE7:
.LBE4:
	.loc 1 238 5
	jmp	.L52
.L51:
	.loc 1 307 5
	movq	-30952(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	.loc 1 309 12
	movl	$0, %eax
	.loc 1 310 1
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L54
	call	__stack_chk_fail@PLT
.L54:
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
	.file 17 "/usr/include/dirent.h"
	.file 18 "/usr/include/netinet/in.h"
	.file 19 "/usr/include/netdb.h"
	.file 20 "./common.h"
	.file 21 "/usr/include/string.h"
	.file 22 "/usr/include/x86_64-linux-gnu/bits/unistd_ext.h"
	.file 23 "/usr/include/errno.h"
	.file 24 "/usr/include/x86_64-linux-gnu/sys/socket.h"
	.file 25 "/usr/include/stdlib.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1052
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x21
	.long	.LASF227
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
	.uleb128 0x7
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x7
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x22
	.byte	0x8
	.uleb128 0xf
	.long	0x48
	.uleb128 0x7
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x7
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x7
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x4
	.long	.LASF8
	.byte	0x3
	.byte	0x26
	.byte	0x17
	.long	0x4f
	.uleb128 0x7
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
	.uleb128 0x7
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
	.uleb128 0x6
	.long	0xf6
	.uleb128 0x7
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
	.long	.LASF228
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0x14
	.long	.LASF52
	.uleb128 0x6
	.long	0x2a9
	.uleb128 0x6
	.long	0x10e
	.uleb128 0x9
	.long	0xf6
	.long	0x2c8
	.uleb128 0xa
	.long	0x3a
	.byte	0
	.byte	0
	.uleb128 0x6
	.long	0x2a1
	.uleb128 0x14
	.long	.LASF53
	.uleb128 0x6
	.long	0x2cd
	.uleb128 0x14
	.long	.LASF54
	.uleb128 0x6
	.long	0x2d7
	.uleb128 0x6
	.long	0x2b3
	.uleb128 0x9
	.long	0xf6
	.long	0x2f6
	.uleb128 0xa
	.long	0x3a
	.byte	0x13
	.byte	0
	.uleb128 0x6
	.long	0xfd
	.uleb128 0xf
	.long	0x2f6
	.uleb128 0x4
	.long	.LASF55
	.byte	0x6
	.byte	0x4e
	.byte	0x13
	.long	0xe5
	.uleb128 0x6
	.long	0x295
	.uleb128 0xf
	.long	0x30c
	.uleb128 0x26
	.long	.LASF229
	.byte	0x6
	.byte	0x97
	.byte	0xe
	.long	0x30c
	.uleb128 0x7
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
	.uleb128 0x1b
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
	.uleb128 0x7
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
	.uleb128 0x6
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
	.uleb128 0x1c
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
	.uleb128 0x6
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
	.uleb128 0x6
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
	.uleb128 0x15
	.long	0x41
	.byte	0x11
	.byte	0x62
	.byte	0x3
	.long	0x573
	.uleb128 0x5
	.long	.LASF92
	.byte	0
	.uleb128 0x5
	.long	.LASF93
	.byte	0x1
	.uleb128 0x5
	.long	.LASF94
	.byte	0x2
	.uleb128 0x5
	.long	.LASF95
	.byte	0x4
	.uleb128 0x5
	.long	.LASF96
	.byte	0x6
	.uleb128 0x5
	.long	.LASF97
	.byte	0x8
	.uleb128 0x5
	.long	.LASF98
	.byte	0xa
	.uleb128 0x5
	.long	.LASF99
	.byte	0xc
	.uleb128 0x5
	.long	.LASF100
	.byte	0xe
	.byte	0
	.uleb128 0x2a
	.string	"DIR"
	.byte	0x11
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
	.uleb128 0x15
	.long	0x41
	.byte	0x10
	.byte	0xcf
	.byte	0x3
	.long	0x6b5
	.uleb128 0x5
	.long	.LASF110
	.byte	0x1
	.uleb128 0x5
	.long	.LASF111
	.byte	0x2
	.uleb128 0x5
	.long	.LASF112
	.byte	0x4
	.uleb128 0x5
	.long	.LASF113
	.byte	0x4
	.uleb128 0x5
	.long	.LASF114
	.byte	0x8
	.uleb128 0x5
	.long	.LASF115
	.byte	0x10
	.uleb128 0x5
	.long	.LASF116
	.byte	0x20
	.uleb128 0x5
	.long	.LASF117
	.byte	0x40
	.uleb128 0x5
	.long	.LASF118
	.byte	0x80
	.uleb128 0xe
	.long	.LASF119
	.value	0x100
	.uleb128 0xe
	.long	.LASF120
	.value	0x200
	.uleb128 0xe
	.long	.LASF121
	.value	0x400
	.uleb128 0xe
	.long	.LASF122
	.value	0x800
	.uleb128 0xe
	.long	.LASF123
	.value	0x1000
	.uleb128 0xe
	.long	.LASF124
	.value	0x2000
	.uleb128 0xe
	.long	.LASF125
	.value	0x4000
	.uleb128 0xe
	.long	.LASF126
	.value	0x8000
	.uleb128 0x11
	.long	.LASF127
	.long	0x10000
	.uleb128 0x11
	.long	.LASF128
	.long	0x40000
	.uleb128 0x11
	.long	.LASF129
	.long	0x4000000
	.uleb128 0x11
	.long	.LASF130
	.long	0x20000000
	.uleb128 0x11
	.long	.LASF131
	.long	0x40000000
	.byte	0
	.uleb128 0x6
	.long	0x590
	.uleb128 0xc
	.long	.LASF132
	.byte	0x10
	.byte	0x12
	.byte	0xf7
	.byte	0x27
	.long	0x6fc
	.uleb128 0x1
	.long	.LASF133
	.byte	0x12
	.byte	0xf9
	.byte	0x5
	.long	0x584
	.byte	0
	.uleb128 0x1
	.long	.LASF134
	.byte	0x12
	.byte	0xfa
	.byte	0xf
	.long	0x778
	.byte	0x2
	.uleb128 0x1
	.long	.LASF135
	.byte	0x12
	.byte	0xfb
	.byte	0x14
	.long	0x75d
	.byte	0x4
	.uleb128 0x1
	.long	.LASF136
	.byte	0x12
	.byte	0xfe
	.byte	0x13
	.long	0x7fd
	.byte	0x8
	.byte	0
	.uleb128 0x1d
	.long	.LASF137
	.byte	0x1c
	.byte	0x12
	.value	0x108
	.byte	0x27
	.long	0x751
	.uleb128 0x8
	.long	.LASF138
	.byte	0x12
	.value	0x10a
	.byte	0x5
	.long	0x584
	.byte	0
	.uleb128 0x8
	.long	.LASF139
	.byte	0x12
	.value	0x10b
	.byte	0xf
	.long	0x778
	.byte	0x2
	.uleb128 0x8
	.long	.LASF140
	.byte	0x12
	.value	0x10c
	.byte	0xe
	.long	0x4ad
	.byte	0x4
	.uleb128 0x8
	.long	.LASF141
	.byte	0x12
	.value	0x10d
	.byte	0x15
	.long	0x7e2
	.byte	0x8
	.uleb128 0x8
	.long	.LASF142
	.byte	0x12
	.value	0x10e
	.byte	0xe
	.long	0x4ad
	.byte	0x18
	.byte	0
	.uleb128 0x4
	.long	.LASF143
	.byte	0x12
	.byte	0x1e
	.byte	0x12
	.long	0x4ad
	.uleb128 0xc
	.long	.LASF144
	.byte	0x4
	.byte	0x12
	.byte	0x1f
	.byte	0x8
	.long	0x778
	.uleb128 0x1
	.long	.LASF145
	.byte	0x12
	.byte	0x21
	.byte	0xf
	.long	0x751
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	.LASF146
	.byte	0x12
	.byte	0x7d
	.byte	0x12
	.long	0x4a1
	.uleb128 0x1c
	.byte	0x10
	.byte	0x12
	.byte	0xdf
	.byte	0x5
	.long	0x7b2
	.uleb128 0x10
	.long	.LASF147
	.byte	0x12
	.byte	0xe1
	.byte	0xa
	.long	0x7b2
	.uleb128 0x10
	.long	.LASF148
	.byte	0x12
	.byte	0xe2
	.byte	0xb
	.long	0x7c2
	.uleb128 0x10
	.long	.LASF149
	.byte	0x12
	.byte	0xe3
	.byte	0xb
	.long	0x7d2
	.byte	0
	.uleb128 0x9
	.long	0x495
	.long	0x7c2
	.uleb128 0xa
	.long	0x3a
	.byte	0xf
	.byte	0
	.uleb128 0x9
	.long	0x4a1
	.long	0x7d2
	.uleb128 0xa
	.long	0x3a
	.byte	0x7
	.byte	0
	.uleb128 0x9
	.long	0x4ad
	.long	0x7e2
	.uleb128 0xa
	.long	0x3a
	.byte	0x3
	.byte	0
	.uleb128 0xc
	.long	.LASF150
	.byte	0x10
	.byte	0x12
	.byte	0xdd
	.byte	0x8
	.long	0x7fd
	.uleb128 0x1
	.long	.LASF151
	.byte	0x12
	.byte	0xe4
	.byte	0x9
	.long	0x784
	.byte	0
	.byte	0
	.uleb128 0x9
	.long	0x4f
	.long	0x80d
	.uleb128 0xa
	.long	0x3a
	.byte	0x7
	.byte	0
	.uleb128 0x1d
	.long	.LASF152
	.byte	0x30
	.byte	0x13
	.value	0x235
	.byte	0x8
	.long	0x88c
	.uleb128 0x8
	.long	.LASF153
	.byte	0x13
	.value	0x237
	.byte	0x7
	.long	0x83
	.byte	0
	.uleb128 0x8
	.long	.LASF154
	.byte	0x13
	.value	0x238
	.byte	0x7
	.long	0x83
	.byte	0x4
	.uleb128 0x8
	.long	.LASF155
	.byte	0x13
	.value	0x239
	.byte	0x7
	.long	0x83
	.byte	0x8
	.uleb128 0x8
	.long	.LASF156
	.byte	0x13
	.value	0x23a
	.byte	0x7
	.long	0x83
	.byte	0xc
	.uleb128 0x8
	.long	.LASF157
	.byte	0x13
	.value	0x23b
	.byte	0xd
	.long	0x4b9
	.byte	0x10
	.uleb128 0x8
	.long	.LASF158
	.byte	0x13
	.value	0x23c
	.byte	0x14
	.long	0x6b5
	.byte	0x18
	.uleb128 0x8
	.long	.LASF159
	.byte	0x13
	.value	0x23d
	.byte	0x9
	.long	0xf1
	.byte	0x20
	.uleb128 0x8
	.long	.LASF160
	.byte	0x13
	.value	0x23e
	.byte	0x14
	.long	0x88c
	.byte	0x28
	.byte	0
	.uleb128 0x6
	.long	0x80d
	.uleb128 0x7
	.byte	0x10
	.byte	0x5
	.long	.LASF161
	.uleb128 0x7
	.byte	0x10
	.byte	0x7
	.long	.LASF162
	.uleb128 0x7
	.byte	0x10
	.byte	0x4
	.long	.LASF163
	.uleb128 0x6
	.long	0x83
	.uleb128 0x15
	.long	0x41
	.byte	0x14
	.byte	0x75
	.byte	0x1
	.long	0x8e1
	.uleb128 0x16
	.string	"GET"
	.byte	0
	.uleb128 0x16
	.string	"PUT"
	.byte	0x1
	.uleb128 0x5
	.long	.LASF164
	.byte	0x2
	.uleb128 0x16
	.string	"LS"
	.byte	0x3
	.uleb128 0x5
	.long	.LASF165
	.byte	0x4
	.uleb128 0x5
	.long	.LASF166
	.byte	0x5
	.uleb128 0x5
	.long	.LASF167
	.byte	0x6
	.byte	0
	.uleb128 0x1b
	.byte	0xc8
	.byte	0x14
	.byte	0x86
	.long	0x945
	.uleb128 0x1
	.long	.LASF168
	.byte	0x14
	.byte	0x88
	.byte	0x9
	.long	0x83
	.byte	0
	.uleb128 0x1
	.long	.LASF169
	.byte	0x14
	.byte	0x89
	.byte	0x9
	.long	0x83
	.byte	0x4
	.uleb128 0x1
	.long	.LASF170
	.byte	0x14
	.byte	0x8b
	.byte	0xb
	.long	0xf1
	.byte	0x8
	.uleb128 0x1
	.long	.LASF171
	.byte	0x14
	.byte	0x8d
	.byte	0x1d
	.long	0x5c8
	.byte	0x10
	.uleb128 0x1
	.long	.LASF172
	.byte	0x14
	.byte	0x8e
	.byte	0x16
	.long	0x88c
	.byte	0x90
	.uleb128 0x1
	.long	.LASF173
	.byte	0x14
	.byte	0x8f
	.byte	0x9
	.long	0x83
	.byte	0x98
	.uleb128 0x1
	.long	.LASF174
	.byte	0x14
	.byte	0x90
	.byte	0x15
	.long	0x483
	.byte	0xa0
	.byte	0
	.uleb128 0x4
	.long	.LASF175
	.byte	0x14
	.byte	0x91
	.byte	0x3
	.long	0x8e1
	.uleb128 0xc
	.long	.LASF176
	.byte	0xc
	.byte	0x1
	.byte	0x1d
	.byte	0x10
	.long	0x993
	.uleb128 0x1
	.long	.LASF177
	.byte	0x1
	.byte	0x1f
	.byte	0xd
	.long	0x495
	.byte	0
	.uleb128 0x1
	.long	.LASF178
	.byte	0x1
	.byte	0x20
	.byte	0xd
	.long	0x495
	.byte	0x1
	.uleb128 0x1
	.long	.LASF179
	.byte	0x1
	.byte	0x21
	.byte	0xe
	.long	0x4ad
	.byte	0x4
	.uleb128 0x1
	.long	.LASF180
	.byte	0x1
	.byte	0x22
	.byte	0xe
	.long	0x4ad
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.long	.LASF181
	.byte	0x1
	.byte	0x23
	.byte	0x3
	.long	0x951
	.uleb128 0xb
	.long	.LASF182
	.byte	0xd
	.value	0x166
	.byte	0xc
	.long	0x83
	.long	0x9b6
	.uleb128 0x2
	.long	0x83
	.byte	0
	.uleb128 0xb
	.long	.LASF183
	.byte	0x6
	.value	0x165
	.byte	0xc
	.long	0x83
	.long	0x9d3
	.uleb128 0x2
	.long	0x30c
	.uleb128 0x2
	.long	0x2f6
	.uleb128 0x17
	.byte	0
	.uleb128 0x1e
	.long	.LASF185
	.byte	0x16
	.byte	0x22
	.byte	0x10
	.long	0xc1
	.uleb128 0xb
	.long	.LASF184
	.byte	0x15
	.value	0x1a3
	.byte	0xe
	.long	0xf1
	.long	0x9f6
	.uleb128 0x2
	.long	0x83
	.byte	0
	.uleb128 0x1e
	.long	.LASF186
	.byte	0x17
	.byte	0x25
	.byte	0xd
	.long	0x8a6
	.uleb128 0xd
	.long	.LASF187
	.byte	0x8
	.byte	0x66
	.byte	0xc
	.long	0x83
	.long	0xa2c
	.uleb128 0x2
	.long	0x83
	.uleb128 0x2
	.long	0xa31
	.uleb128 0x2
	.long	0xa31
	.uleb128 0x2
	.long	0xa31
	.uleb128 0x2
	.long	0xa3b
	.byte	0
	.uleb128 0x6
	.long	0x383
	.uleb128 0xf
	.long	0xa2c
	.uleb128 0x6
	.long	0x329
	.uleb128 0xf
	.long	0xa36
	.uleb128 0xd
	.long	.LASF188
	.byte	0x11
	.byte	0xa4
	.byte	0x17
	.long	0xa56
	.long	0xa56
	.uleb128 0x2
	.long	0xa5b
	.byte	0
	.uleb128 0x6
	.long	0x4d0
	.uleb128 0x6
	.long	0x573
	.uleb128 0xd
	.long	.LASF189
	.byte	0x11
	.byte	0x8d
	.byte	0xd
	.long	0xa5b
	.long	0xa76
	.uleb128 0x2
	.long	0x2f6
	.byte	0
	.uleb128 0xd
	.long	.LASF190
	.byte	0x15
	.byte	0x2b
	.byte	0xe
	.long	0x48
	.long	0xa96
	.uleb128 0x2
	.long	0x48
	.uleb128 0x2
	.long	0x48f
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0xb
	.long	.LASF191
	.byte	0x6
	.value	0x2d8
	.byte	0xf
	.long	0x2e
	.long	0xabc
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
	.long	.LASF192
	.byte	0x15
	.value	0x197
	.byte	0xf
	.long	0x2e
	.long	0xad3
	.uleb128 0x2
	.long	0x2f6
	.byte	0
	.uleb128 0xb
	.long	.LASF193
	.byte	0x6
	.value	0x307
	.byte	0x11
	.long	0x96
	.long	0xaea
	.uleb128 0x2
	.long	0x30c
	.byte	0
	.uleb128 0xb
	.long	.LASF194
	.byte	0x6
	.value	0x301
	.byte	0xc
	.long	0x83
	.long	0xb0b
	.uleb128 0x2
	.long	0x30c
	.uleb128 0x2
	.long	0x96
	.uleb128 0x2
	.long	0x83
	.byte	0
	.uleb128 0xd
	.long	.LASF195
	.byte	0x6
	.byte	0xb8
	.byte	0xc
	.long	0x83
	.long	0xb21
	.uleb128 0x2
	.long	0x30c
	.byte	0
	.uleb128 0x2b
	.long	.LASF230
	.byte	0x19
	.value	0x2af
	.byte	0xd
	.long	0xb34
	.uleb128 0x2
	.long	0x48
	.byte	0
	.uleb128 0xd
	.long	.LASF196
	.byte	0x15
	.byte	0x9f
	.byte	0xc
	.long	0x83
	.long	0xb54
	.uleb128 0x2
	.long	0x2f6
	.uleb128 0x2
	.long	0x2f6
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0xd
	.long	.LASF197
	.byte	0x18
	.byte	0x8a
	.byte	0x10
	.long	0x300
	.long	0xb79
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
	.long	.LASF198
	.byte	0x6
	.value	0x2df
	.byte	0xf
	.long	0x2e
	.long	0xb9f
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
	.long	.LASF199
	.byte	0x6
	.value	0x108
	.byte	0xe
	.long	0x30c
	.long	0xbbb
	.uleb128 0x2
	.long	0x2fb
	.uleb128 0x2
	.long	0x2fb
	.byte	0
	.uleb128 0xb
	.long	.LASF200
	.byte	0x6
	.value	0x193
	.byte	0xc
	.long	0x83
	.long	0xbd8
	.uleb128 0x2
	.long	0x4cb
	.uleb128 0x2
	.long	0x2fb
	.uleb128 0x17
	.byte	0
	.uleb128 0xb
	.long	.LASF201
	.byte	0x6
	.value	0x16b
	.byte	0xc
	.long	0x83
	.long	0xbf0
	.uleb128 0x2
	.long	0x2f6
	.uleb128 0x17
	.byte	0
	.uleb128 0xd
	.long	.LASF202
	.byte	0x18
	.byte	0x91
	.byte	0x10
	.long	0x300
	.long	0xc15
	.uleb128 0x2
	.long	0x83
	.uleb128 0x2
	.long	0x48
	.uleb128 0x2
	.long	0x2e
	.uleb128 0x2
	.long	0x83
	.byte	0
	.uleb128 0xd
	.long	.LASF203
	.byte	0x15
	.byte	0x3d
	.byte	0xe
	.long	0x48
	.long	0xc35
	.uleb128 0x2
	.long	0x48
	.uleb128 0x2
	.long	0x83
	.uleb128 0x2
	.long	0x3a
	.byte	0
	.uleb128 0x2c
	.long	.LASF231
	.byte	0x1
	.byte	0xe6
	.byte	0x7
	.long	0x48
	.quad	.LFB325
	.quad	.LFE325-.LFB325
	.uleb128 0x1
	.byte	0x9c
	.long	0xd44
	.uleb128 0x12
	.string	"sd"
	.byte	0xe6
	.byte	0x21
	.long	0xd44
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30968
	.uleb128 0x3
	.long	.LASF204
	.byte	0xe8
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30940
	.uleb128 0x3
	.long	.LASF205
	.byte	0xe9
	.byte	0xa
	.long	0xd49
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30768
	.uleb128 0x3
	.long	.LASF206
	.byte	0xea
	.byte	0xc
	.long	0x383
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30896
	.uleb128 0x2d
	.long	.LASF232
	.byte	0x1
	.byte	0xeb
	.byte	0x9
	.long	0x83
	.uleb128 0x2e
	.long	.LASF221
	.byte	0x1
	.value	0x12f
	.byte	0x1
	.quad	.L51
	.uleb128 0x18
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x3
	.long	.LASF207
	.byte	0xf3
	.byte	0x18
	.long	0x329
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30912
	.uleb128 0x3
	.long	.LASF208
	.byte	0xf6
	.byte	0xd
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30948
	.uleb128 0x2f
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.long	0xd1a
	.uleb128 0x13
	.string	"__i"
	.byte	0xef
	.byte	0x9
	.long	0x41
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30952
	.uleb128 0x3
	.long	.LASF209
	.byte	0xef
	.byte	0x9
	.long	0xa2c
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30936
	.byte	0
	.uleb128 0x30
	.long	.LLRL0
	.uleb128 0x1f
	.long	.LASF210
	.value	0x10e
	.byte	0x11
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30944
	.uleb128 0x1f
	.long	.LASF211
	.value	0x10f
	.byte	0x1e
	.long	0x993
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30924
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x6
	.long	0x945
	.uleb128 0x9
	.long	0xf6
	.long	0xd5a
	.uleb128 0x31
	.long	0x3a
	.value	0x77ff
	.byte	0
	.uleb128 0x32
	.long	.LASF233
	.byte	0x1
	.byte	0xd1
	.byte	0x6
	.quad	.LFB324
	.quad	.LFE324-.LFB324
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x19
	.long	.LASF218
	.byte	0xa7
	.quad	.LFB323
	.quad	.LFE323-.LFB323
	.uleb128 0x1
	.byte	0x9c
	.long	0xe82
	.uleb128 0x12
	.string	"sd"
	.byte	0xa7
	.byte	0x20
	.long	0xd44
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30824
	.uleb128 0x1a
	.long	.LASF211
	.byte	0xa7
	.byte	0x36
	.long	0xe82
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30832
	.uleb128 0x3
	.long	.LASF204
	.byte	0xaa
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30808
	.uleb128 0x3
	.long	.LASF210
	.byte	0xaa
	.byte	0x17
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30804
	.uleb128 0x3
	.long	.LASF212
	.byte	0xaa
	.byte	0x28
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30800
	.uleb128 0x3
	.long	.LASF205
	.byte	0xab
	.byte	0xa
	.long	0xd49
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30752
	.uleb128 0x3
	.long	.LASF213
	.byte	0xac
	.byte	0xa
	.long	0xd49
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30752
	.uleb128 0x3
	.long	.LASF214
	.byte	0xad
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30796
	.uleb128 0x13
	.string	"dp"
	.byte	0xaf
	.byte	0xa
	.long	0xa5b
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30784
	.uleb128 0x13
	.string	"ep"
	.byte	0xb0
	.byte	0x14
	.long	0xa56
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30776
	.uleb128 0x18
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x3
	.long	.LASF215
	.byte	0xb5
	.byte	0xd
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30792
	.uleb128 0x18
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x3
	.long	.LASF216
	.byte	0xb9
	.byte	0x11
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30788
	.uleb128 0x3
	.long	.LASF217
	.byte	0xbe
	.byte	0x1e
	.long	0x993
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30764
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x6
	.long	0x993
	.uleb128 0x19
	.long	.LASF219
	.byte	0x5c
	.quad	.LFB322
	.quad	.LFE322-.LFB322
	.uleb128 0x1
	.byte	0x9c
	.long	0xf70
	.uleb128 0x12
	.string	"sd"
	.byte	0x5c
	.byte	0x21
	.long	0xd44
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61544
	.uleb128 0x1a
	.long	.LASF211
	.byte	0x5c
	.byte	0x37
	.long	0xe82
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61552
	.uleb128 0x3
	.long	.LASF204
	.byte	0x5e
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61520
	.uleb128 0x3
	.long	.LASF210
	.byte	0x5e
	.byte	0x17
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61524
	.uleb128 0x3
	.long	.LASF212
	.byte	0x5e
	.byte	0x28
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61516
	.uleb128 0x3
	.long	.LASF205
	.byte	0x5f
	.byte	0xa
	.long	0xd49
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61472
	.uleb128 0x3
	.long	.LASF213
	.byte	0x60
	.byte	0xa
	.long	0xd49
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30752
	.uleb128 0x3
	.long	.LASF214
	.byte	0x61
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61512
	.uleb128 0x3
	.long	.LASF220
	.byte	0x68
	.byte	0xb
	.long	0xf1
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61504
	.uleb128 0x13
	.string	"fs"
	.byte	0x6a
	.byte	0xb
	.long	0x30c
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61496
	.uleb128 0x20
	.long	.LASF222
	.byte	0xa2
	.quad	.L18
	.uleb128 0x3
	.long	.LASF223
	.byte	0x73
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61508
	.uleb128 0x3
	.long	.LASF217
	.byte	0x7a
	.byte	0x16
	.long	0x993
	.uleb128 0x4
	.byte	0x91
	.sleb128 -61484
	.byte	0
	.uleb128 0x19
	.long	.LASF224
	.byte	0x25
	.quad	.LFB321
	.quad	.LFE321-.LFB321
	.uleb128 0x1
	.byte	0x9c
	.long	0x1029
	.uleb128 0x12
	.string	"sd"
	.byte	0x25
	.byte	0x21
	.long	0xd44
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30792
	.uleb128 0x1a
	.long	.LASF211
	.byte	0x25
	.byte	0x37
	.long	0xe82
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30800
	.uleb128 0x3
	.long	.LASF204
	.byte	0x27
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30776
	.uleb128 0x3
	.long	.LASF210
	.byte	0x27
	.byte	0x17
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30784
	.uleb128 0x3
	.long	.LASF225
	.byte	0x27
	.byte	0x28
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30772
	.uleb128 0x3
	.long	.LASF205
	.byte	0x28
	.byte	0xa
	.long	0xd49
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30752
	.uleb128 0x3
	.long	.LASF214
	.byte	0x29
	.byte	0x9
	.long	0x83
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30780
	.uleb128 0x20
	.long	.LASF222
	.byte	0x57
	.quad	.L6
	.uleb128 0x3
	.long	.LASF220
	.byte	0x33
	.byte	0xb
	.long	0xf1
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30768
	.uleb128 0x13
	.string	"fs"
	.byte	0x35
	.byte	0xb
	.long	0x30c
	.uleb128 0x4
	.byte	0x91
	.sleb128 -30760
	.byte	0
	.uleb128 0x33
	.long	.LASF226
	.byte	0x1
	.byte	0x13
	.byte	0x7
	.long	0x48
	.quad	.LFB320
	.quad	.LFE320-.LFB320
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x12
	.string	"sa"
	.byte	0x13
	.byte	0x24
	.long	0x6b5
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
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
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
	.uleb128 0xe
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
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
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
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
	.uleb128 0x1a
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
	.uleb128 0x30
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x32
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
	.uleb128 .LBB6-.Ltext0
	.uleb128 .LBE6-.Ltext0
	.byte	0x4
	.uleb128 .LBB7-.Ltext0
	.uleb128 .LBE7-.Ltext0
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF201:
	.string	"printf"
.LASF14:
	.string	"__off_t"
.LASF119:
	.string	"MSG_WAITALL"
.LASF79:
	.string	"__size"
.LASF23:
	.string	"_IO_read_ptr"
.LASF35:
	.string	"_chain"
.LASF141:
	.string	"sin6_addr"
.LASF151:
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
.LASF182:
	.string	"close"
.LASF175:
	.string	"sockDetails_t"
.LASF8:
	.string	"__uint8_t"
.LASF55:
	.string	"ssize_t"
.LASF216:
	.string	"record_len"
.LASF227:
	.string	"GNU C17 14.2.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF222:
	.string	"done"
.LASF185:
	.string	"gettid"
.LASF180:
	.string	"data_length"
.LASF217:
	.string	"message_header_send"
.LASF127:
	.string	"MSG_WAITFORONE"
.LASF64:
	.string	"long long unsigned int"
.LASF143:
	.string	"in_addr_t"
.LASF30:
	.string	"_IO_buf_end"
.LASF67:
	.string	"__next"
.LASF171:
	.string	"client_info"
.LASF232:
	.string	"file_fd"
.LASF85:
	.string	"socklen_t"
.LASF230:
	.string	"free"
.LASF44:
	.string	"_codecvt"
.LASF37:
	.string	"_flags2"
.LASF168:
	.string	"sockfd"
.LASF194:
	.string	"fseek"
.LASF56:
	.string	"long long int"
.LASF6:
	.string	"signed char"
.LASF214:
	.string	"status"
.LASF226:
	.string	"get_in_addr"
.LASF36:
	.string	"_fileno"
.LASF13:
	.string	"__ino_t"
.LASF118:
	.string	"MSG_EOR"
.LASF24:
	.string	"_IO_read_end"
.LASF148:
	.string	"__u6_addr16"
.LASF12:
	.string	"long int"
.LASF89:
	.string	"d_reclen"
.LASF120:
	.string	"MSG_FIN"
.LASF22:
	.string	"_flags"
.LASF154:
	.string	"ai_family"
.LASF165:
	.string	"EXIT"
.LASF19:
	.string	"__ssize_t"
.LASF179:
	.string	"filename_length"
.LASF190:
	.string	"memcpy"
.LASF202:
	.string	"recv"
.LASF139:
	.string	"sin6_port"
.LASF113:
	.string	"MSG_TRYHARD"
.LASF117:
	.string	"MSG_DONTWAIT"
.LASF43:
	.string	"_offset"
.LASF68:
	.string	"__pthread_list_t"
.LASF91:
	.string	"d_name"
.LASF205:
	.string	"recieved_buf"
.LASF200:
	.string	"asprintf"
.LASF69:
	.string	"__pthread_mutex_s"
.LASF153:
	.string	"ai_flags"
.LASF96:
	.string	"DT_BLK"
.LASF129:
	.string	"MSG_ZEROCOPY"
.LASF136:
	.string	"sin_zero"
.LASF210:
	.string	"total_bytes"
.LASF114:
	.string	"MSG_CTRUNC"
.LASF52:
	.string	"_IO_marker"
.LASF63:
	.string	"fd_set"
.LASF3:
	.string	"unsigned int"
.LASF145:
	.string	"s_addr"
.LASF47:
	.string	"_freeres_buf"
.LASF167:
	.string	"number_of_command"
.LASF183:
	.string	"fprintf"
.LASF177:
	.string	"command"
.LASF155:
	.string	"ai_socktype"
.LASF2:
	.string	"long unsigned int"
.LASF209:
	.string	"__arr"
.LASF123:
	.string	"MSG_RST"
.LASF78:
	.string	"__data"
.LASF27:
	.string	"_IO_write_ptr"
.LASF223:
	.string	"file_size"
.LASF58:
	.string	"timeval"
.LASF173:
	.string	"addr_len"
.LASF112:
	.string	"MSG_DONTROUTE"
.LASF76:
	.string	"__elision"
.LASF5:
	.string	"short unsigned int"
.LASF135:
	.string	"sin_addr"
.LASF54:
	.string	"_IO_wide_data"
.LASF88:
	.string	"d_off"
.LASF215:
	.string	"seq_num"
.LASF192:
	.string	"strlen"
.LASF31:
	.string	"_IO_save_base"
.LASF193:
	.string	"ftell"
.LASF170:
	.string	"dirname"
.LASF83:
	.string	"uint16_t"
.LASF124:
	.string	"MSG_ERRQUEUE"
.LASF42:
	.string	"_lock"
.LASF204:
	.string	"numbytes"
.LASF146:
	.string	"in_port_t"
.LASF62:
	.string	"fds_bits"
.LASF97:
	.string	"DT_REG"
.LASF218:
	.string	"ls_command"
.LASF233:
	.string	"delete_command"
.LASF72:
	.string	"__owner"
.LASF71:
	.string	"__count"
.LASF133:
	.string	"sin_family"
.LASF206:
	.string	"readfds"
.LASF219:
	.string	"get_command"
.LASF48:
	.string	"_prevchain"
.LASF188:
	.string	"readdir"
.LASF220:
	.string	"filename"
.LASF59:
	.string	"tv_sec"
.LASF138:
	.string	"sin6_family"
.LASF197:
	.string	"send"
.LASF166:
	.string	"SERVER_INFO"
.LASF28:
	.string	"_IO_write_end"
.LASF95:
	.string	"DT_DIR"
.LASF156:
	.string	"ai_protocol"
.LASF176:
	.string	"message_header_s"
.LASF181:
	.string	"message_header_t"
.LASF211:
	.string	"message_header"
.LASF87:
	.string	"d_ino"
.LASF106:
	.string	"sockaddr_storage"
.LASF228:
	.string	"_IO_lock_t"
.LASF221:
	.string	"cleanup"
.LASF57:
	.string	"_IO_FILE"
.LASF187:
	.string	"select"
.LASF94:
	.string	"DT_CHR"
.LASF157:
	.string	"ai_addrlen"
.LASF49:
	.string	"_mode"
.LASF199:
	.string	"fopen"
.LASF134:
	.string	"sin_port"
.LASF104:
	.string	"sa_family"
.LASF34:
	.string	"_markers"
.LASF164:
	.string	"DELETE"
.LASF162:
	.string	"__int128 unsigned"
.LASF142:
	.string	"sin6_scope_id"
.LASF4:
	.string	"unsigned char"
.LASF186:
	.string	"__errno_location"
.LASF101:
	.string	"__dirstream"
.LASF90:
	.string	"d_type"
.LASF196:
	.string	"strncmp"
.LASF61:
	.string	"__fd_mask"
.LASF158:
	.string	"ai_addr"
.LASF9:
	.string	"short int"
.LASF130:
	.string	"MSG_FASTOPEN"
.LASF99:
	.string	"DT_SOCK"
.LASF86:
	.string	"dirent"
.LASF111:
	.string	"MSG_PEEK"
.LASF115:
	.string	"MSG_PROXY"
.LASF160:
	.string	"ai_next"
.LASF40:
	.string	"_vtable_offset"
.LASF51:
	.string	"FILE"
.LASF169:
	.string	"client_sock_fd"
.LASF191:
	.string	"fread"
.LASF18:
	.string	"__suseconds_t"
.LASF150:
	.string	"in6_addr"
.LASF60:
	.string	"tv_usec"
.LASF70:
	.string	"__lock"
.LASF98:
	.string	"DT_LNK"
.LASF178:
	.string	"chunk_id"
.LASF122:
	.string	"MSG_CONFIRM"
.LASF163:
	.string	"long double"
.LASF20:
	.string	"char"
.LASF93:
	.string	"DT_FIFO"
.LASF107:
	.string	"ss_family"
.LASF152:
	.string	"addrinfo"
.LASF21:
	.string	"__socklen_t"
.LASF140:
	.string	"sin6_flowinfo"
.LASF10:
	.string	"__uint16_t"
.LASF65:
	.string	"__pthread_internal_list"
.LASF147:
	.string	"__u6_addr8"
.LASF128:
	.string	"MSG_BATCH"
.LASF11:
	.string	"__uint32_t"
.LASF195:
	.string	"fclose"
.LASF116:
	.string	"MSG_TRUNC"
.LASF53:
	.string	"_IO_codecvt"
.LASF172:
	.string	"server_info"
.LASF15:
	.string	"__off64_t"
.LASF39:
	.string	"_cur_column"
.LASF25:
	.string	"_IO_read_base"
.LASF208:
	.string	"select_status"
.LASF33:
	.string	"_IO_save_end"
.LASF161:
	.string	"__int128"
.LASF212:
	.string	"numbytes_r"
.LASF81:
	.string	"pthread_mutex_t"
.LASF225:
	.string	"numbytes_w"
.LASF75:
	.string	"__spins"
.LASF17:
	.string	"__time_t"
.LASF102:
	.string	"sa_family_t"
.LASF125:
	.string	"MSG_NOSIGNAL"
.LASF50:
	.string	"_unused2"
.LASF229:
	.string	"stderr"
.LASF203:
	.string	"memset"
.LASF213:
	.string	"transmit_buf"
.LASF137:
	.string	"sockaddr_in6"
.LASF109:
	.string	"__ss_align"
.LASF103:
	.string	"sockaddr"
.LASF132:
	.string	"sockaddr_in"
.LASF224:
	.string	"put_command"
.LASF82:
	.string	"uint8_t"
.LASF73:
	.string	"__nusers"
.LASF32:
	.string	"_IO_backup_base"
.LASF126:
	.string	"MSG_MORE"
.LASF108:
	.string	"__ss_padding"
.LASF198:
	.string	"fwrite"
.LASF105:
	.string	"sa_data"
.LASF46:
	.string	"_freeres_list"
.LASF77:
	.string	"__list"
.LASF159:
	.string	"ai_canonname"
.LASF149:
	.string	"__u6_addr32"
.LASF45:
	.string	"_wide_data"
.LASF231:
	.string	"handle_req"
.LASF74:
	.string	"__kind"
.LASF121:
	.string	"MSG_SYN"
.LASF38:
	.string	"_old_offset"
.LASF207:
	.string	"timeout"
.LASF184:
	.string	"strerror"
.LASF174:
	.string	"lock"
.LASF26:
	.string	"_IO_write_base"
.LASF100:
	.string	"DT_WHT"
.LASF131:
	.string	"MSG_CMSG_CLOEXEC"
.LASF29:
	.string	"_IO_buf_base"
.LASF84:
	.string	"uint32_t"
.LASF110:
	.string	"MSG_OOB"
.LASF16:
	.string	"__pid_t"
.LASF144:
	.string	"in_addr"
.LASF189:
	.string	"opendir"
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
