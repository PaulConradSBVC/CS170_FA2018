.global main

fptr .req r11

.text
.align 4
main:
	ldr r0, =output
	mov r1, r0
	push {lr}
	//push {fptr}
	//mov fptr, sp
	//push {r1}
	mov fp, sp
	sub sp, sp, #4
	bl printf
//////////////////////////////////////////////////////////
	add sp, sp, #4
	pop {lr}
	mov pc, lr
.align 4
output: .asciz "Hello, r0=%\d"
