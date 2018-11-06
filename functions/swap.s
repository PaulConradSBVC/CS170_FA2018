.global swap
.global mystery_swap

.text
// r0 holds ptr to first value
// r1 holds ptr to second value
// performs swap of values pointed by r0 and r1
swap:
	ldr r2, [r0]	// r2 = *(r0)
	ldr r3, [r1]	// r3 = *(r1)
	str r2, [r1]	// *(r1) = r2
	str r3, [r0]	// *(r0) = r3
	mov pc, lr	// return;

mystery_swap:
	ldr r2, [r0]
	ldr r3, [r1]
	eor r2, r2, r3
	eor r3, r2, r3
	eor r2, r2, r3
	str r2, [r0]
	str r3, [r1]
	mov pc, lr
