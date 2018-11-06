// C recursive function to solve tower of hanoi puzzle in Assembly Lang.
//void tower(int r0, char r1 (from_rod), char r2 (to_rod), char r3 (char aux_rod))
.global tower
.text
tower:
//
//{
	push {lr}
	//if (r0 == 1)
	cmp r0, #1
	bne recurse
	//{
	push {r0,r1,r2,r3}
	ldr r0, =msg1
	bl printf
	pop {r0,r1,r2,r3}
		//printf(msg1, r1, r2);
	pop {pc}
		//return;
	//}
recurse:
	//tower(r0-1, r1, r3, r2);
	sub r0, #1
	push {r2}
	push {r3}
	pop {r2}
	pop {r3}
	bl tower
	//pop {r0,r1,r2,r3}
	push {r2}
	push {r3}
	pop {r2}
	pop {r3}
	//printf(msg2, r0, r1, r2);
	mov r3, r2
	mov r2, r1
	mov r1, r0
	//push {r0,r1,r2,r3}
	ldr r0, =msg2
	bl printf
	//pop {r0,r1,r2,r3}
	//tower(r0-1, r3, r2, r1);
	//push {r0,r1,r2,r3}
	sub r0, #1
	push {r1}
	push {r3}
	pop {r1}
	pop {r3}
	bl tower
	//pop {r0,r1,r2,r3}
//}
	pop {pc}

.section .rodata
msg1: .asciz "\n Move disk 1 from rod %c to rod %c"
msg2: .asciz "\n Move disk %d from rod %c to rod %c"
