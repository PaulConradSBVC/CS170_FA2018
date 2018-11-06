.section .data
/* Prompt message */
prompt: .asciz "Hi there! Please type in two integer values (seperated by a space): "

/* Response message */
response: .asciz "I read the numbers %d, %d and %d from the keyboard\n"

/* Format pattern for scanf */
pattern: .asciz "%d %d %d"

/* Where scanf will store the number read */
value_read1: .word 0
value_read2: .word 0
value_read3: .word 0

.section .text
.global main
main:
	push {lr}		/* save our return address */

    	ldr r0, =prompt		/* r0 contains pointer to prompt message */
    	bl printf		/* call printf to output our prompt */

    	ldr r0, =pattern 	/* r0 contains pointer to format string for our scan pattern */
    	ldr r1, =value_read1  	/* r1 contains pointer to variable label where our first number is stored */
	ldr r2, =value_read2	/* r2 contains pointer to variable label where our second number is stored */
	ldr r3, =value_read3
    	bl scanf              	/* call to scanf */
next:
	ldr r0, =response	/* r0 contains pointer to response message */
	ldr r1, =value_read1	/* r1 contains pointer to value_read1 */
	ldr r1, [r1]		/* r1 contains value dereferenced from r1 in previous instruction */
	ldr r2, =value_read2
	ldr r2, [r2]
	ldr r3, =value_read3
	ldr r3, [r3]
	bl printf		/* call printf to output our response */

	mov r0, #0		/* exit code 0 = program terminated normally */
pop {pc}		/* exit our main function */
