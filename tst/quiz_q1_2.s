.global main
.text
.balign 4
main:
	push {lr}
	mov R0, #65
	mvn R1, #10
	bl mystery
	pop {pc}

mystery:
	push {r4,fp,lr}
	add fp, sp, #0
	sub sp, sp, #16
	add r4, r0, r1
	str r4, [fp, #-4]
	mov r4, r4, asr #2
	str r4, [fp, #-8]
	sub r4, r0, r1
	str r4, [fp, #-12]
	mov r4, r4, asr #1
	str r4, [fp, #-16]
	ldr r0, [fp, #-8]
	ldr r1, [fp, #-16]
	add r0, r1, r0
	add sp, #16
	pop {r4,fp,pc}
