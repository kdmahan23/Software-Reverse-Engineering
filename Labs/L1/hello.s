	.file	"hello.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Hello, world!"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
	sub	rsp, 8
	lea	rdi, .LC0[rip]
	call	puts@PLT
	xor	eax, eax
	add	rsp, 8
	ret
	.size	main, .-main
	.ident	"GCC: (Debian 9.2.1-19) 9.2.1 20191109"
	.section	.note.GNU-stack,"",@progbits
