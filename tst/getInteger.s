.global clr_kb			// void clr_kb():  clears the keyboard buffer
.global getInteger		// int getInteger(): returns in R0 integer entered at the keyboard
.global getIntegerInRange	// int getIntegerInRange(int min, int max): return integer in R0
.global main

.section .text

.align 4
main:
	push {lr}
	bl getInteger
	mov r1, r0
	ldr r0, =output
	bl printf
	pop {pc}

output:	.asciz "The value you entered was: %d\n"

///////////////////////////////////////////////////////////////////////////////////////////////////////////

.align 4
getInteger:
	push {lr}
	mov fp, sp
	sub sp, #4
	ldr r0, =prompt
	bl printf
	ldr r0, =pat
	mov r1, sp
	bl scanf
	ldr r0, [sp]
	add sp, #4
	pop {pc}

prompt:	.asciz "Enter an integer value: "
pat:	.asciz "%d"

.align 4
getIntegerInRange:
	push {r4,r5,lr}
	mov r4, r0	// r4 = min
	mov r5, r1	// r5 = max
	sub sp, #4
gRange_do:
	ldr r0, =prompt2
	mov r1, r4
	mov r2, r5
	bl printf
	ldr r0, =pat
	mov r1, sp
	bl scanf
	ldr r0, [sp]
	cmp r0, r4
	blt gRange_err
	cmp r0, r5
	ble gRange_done
gRange_err:
	ldr r0, =err_msg
	bl printf
	bl clr_kb
	bal gRange_do
gRange_done:
	add sp, #4
	pop {r4,r5,pc}

prompt2: .asciz "Enter an integer between %d and %d: "
err_msg: .asciz "Invalid Entry!\n"

.align 4
clr_kb:
	push {lr}
clr_kb_loop:
	bl getchar
	cmp r0, #10
	bne clr_kb_loop
	pop {pc}
