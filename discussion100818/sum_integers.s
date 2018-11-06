.global main

// all read only data here
.section .rodata
prompt:		.asciz	"Enter an integer and I'll add all integers from 1 to your entered integer: "
scan_str:	.asciz	"%d"
result:		.asciz  "Sum of integers from 1 to %d is %d\n"

// non read only data
.data
value:		.word 	0

.text
//int main()
main:
	//{
	push {lr}

	//printf(prompt);
	ldr r0, =prompt
	bl printf

	//scanf(scan_str,&value);
	ldr r0, =scan_str
	ldr r1, =value
	mov r4, r1	// make a copy of the pointer to value for later
	bl scanf

	//int r0=1;	// use register r0 as counter
	mov r0, #1

	//int r2=0;	// r2 holds the sum
	mov r2, #0

	//int r1 = value;
	ldr r1, [r4]

	//while(r0 <= r1 )
while_r0_lte_r1:
	cmp r0, r1
	bgt end_while_r0_lte_r1
	//{
	//	r2=r2+r0;
	add r2, r2, r0
	//	r0++;
	add r0, #1
	b while_r0_lte_r1
	//}
end_while_r0_lte_r1:

	//printf(result,r1,r2);
	ldr r0, =result
	bl printf

	//return 0;
	mov r0, #0

	//}
	pop {pc}
