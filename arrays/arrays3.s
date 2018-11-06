.global main

.section .rodata
output: .asciz "Sum: %d\n"

.section .data
c: .hword 10,13,16,19,22

.text
main:
	push {lr}

	ldr r2, =c
	mov r0, #0
	mov r1, #0

for_lp:	cmp r1, #5
	bge end_for

	add r3, r2, r1, lsl #1
	ldrsh r3, [r3]
	add r0, r0, r3
	add r1, #1
	b for_lp
end_for:
	mov r1, r0
	ldr r0, =output
	bl printf

	pop {pc}

