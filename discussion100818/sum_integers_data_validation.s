.global main

.section .rodata
MIN:	.word	1
MAX: 	.word	65535

prompt1:	.asciz "Enter an integer and I'll add all integers\n"
prompt2:	.asciz "from 1 to your entered integer (between %d and %d) "
scan_str:	.asciz "%d"
error_msg:	.asciz "Out of range, try again!!!!\n"
result:		.asciz "Sum of integers from 1 to %d is %d\n"

.data
value:	.word 	0

.text
//int main()
main:
//{
	push {lr}

	ldr r5, =MIN
	ldr r6, =MAX
	ldr r5, [r5]
	ldr r6, [r6]

//	do
do_label:
//	{
//		printf(prompt1);
	ldr r0, =prompt1
	bl printf
//		printf(prompt2,MIN,MAX);
	ldr r0, =prompt2
	mov r1, r5
	mov r2, r6
	bl printf
//		scanf(scan_str,&value);
	ldr r0, =scan_str
	ldr r1, =value
	mov r4, r1
	bl scanf

	ldr r4, [r4]
//		if ( value >= MIN && value <= MAX )
	cmp r4, r5
	blt err
	cmp r4, r6
	ble end_do_label
//			break;
//		printf(error_msg);
err:
	ldr r0, =error_msg
	bl printf
	b do_label
//	}
//	while( true );
end_do_label:

//	int r0=1;	// use register r0 as counter
	mov r0, #1
//	int r1;
//	r1=value;
	mov r1, r4
//	r2=0;
	mov r2, #0
//	while(r0 <= r1 )
while_r0_lte_r1:
	cmp r0, r1
	bgt end_while_r0_lte_r1
//	{
//		r2=r2+r0;
	add r2, r2, r0
//		r0++;
	add r0, #1
	b while_r0_lte_r1
//	}
end_while_r0_lte_r1:
//	printf(result,r1,r2);
	ldr r0, =result
	mov r1, r4
	bl printf

//	return 0;
	mov r0, #0
	//}
	pop {pc}
