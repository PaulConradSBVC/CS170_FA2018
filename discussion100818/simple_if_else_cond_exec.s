.global main

// read only data section
.section .rodata

prompt:		.asciz	"Enter three integer values (r0, x, y): "
scan_str:	.asciz	"%d %d %d"
output_msg:	.asciz  "With r0=%d, x=%d, y=%d\n"

// non-read only data
.data

value1:	.word	0
value2:	.word	0
value3:	.word	0

// code section
.text
main:
	push {lr}

	ldr r0, =prompt
	bl printf

	ldr r0, =scan_str
	ldr r1, =value1
	ldr r2, =value2
	ldr r3, =value3
	bl scanf

	ldr r0, =value1
	ldr r2, =value2
	ldr r3, =value3
	ldr r0, [r0]
	ldr r2, [r2]
	ldr r3, [r3]

if_r0_eq_0:
	cmp r0, #0
	moveq r2, r2, asl #3
	moveq r3, r3, asr #2

else_r0_ne_0:
	movne r2, r2, asr #3
	movne r3, r3, asl #2
end_if_r0_eq_0:

	mov r1, r0
	ldr r0, =output_msg
	bl printf

	pop {pc}
