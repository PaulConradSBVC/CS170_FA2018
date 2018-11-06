.global main
.section .text
.align 8

mystery:
	push {fp,lr}
	mov r3, #-1
	push {r3}		// just a "marker" to show where the "frame" is in memory
	sub fp, sp, #0		// instead of mov fp, sp to make gdb happy?
	//mov fp, sp
	sub sp, sp, #16		// sp = sp - 16
	push {r3}		// see above
	add r2, r0, r1		// r2 = r0 + r1
	str r2, [fp, #-4]	// *( fp - 4 ) = a
	mov r2, r2, asl #2	// r2 = r2 << 2
	str r2, [fp, #-8]	// *( fp - 8 ) = b
	sub r2, r1, r0		// r2 = r1 - r0
	str r2, [fp, #-12]	// *( fp - 12 ) = c
	mov r2, r2, asr #1	// r2 = r2 >> 1
	str r2, [fp, #-16]	// *( fp - 16 ) = d
	ldr r0, [fp, #-8]	// r0 = *(fp - 8)
	ldr r1, [fp, #-16]	// r1 = *(fp - 16)
	mul r0, r1, r0		// r0 = r0 * r1
	pop {r3}
	add sp, #16		// adjust stack back to what it was at start of function
				// 20 is the 16 plus 4 that were subtracted earlier
	pop {r3}
	pop {fp,pc}

main:
	push {lr}
	mov r0, #2
	mov r1, #10
	bl mystery
	mov r1, r0
	ldr r0, =output
	bl printf
	pop {pc}

output: .asciz "Result=%d\n"
