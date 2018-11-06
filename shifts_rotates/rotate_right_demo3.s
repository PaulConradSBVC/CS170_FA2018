// simulate "rotate left 8"

.data
/* Prompt message */
prompt: .asciz "Please type an integer number (in hex): "

/* Response message */
response: .asciz "I rotated the number %0#x left 8 bits and that is %0#x\n"

/* Format pattern for scanf */
pattern: .asciz "%x"

/* Where scanf will store the number read */
value_read: .word 0

.text
.global main
main:
	push {lr}		/* save our return address */

	// register r4 holds address to value_read
	ldr r4, =value_read

    	ldr r0, =prompt		/* r0 contains pointer to prompt message */
    	bl printf		/* call printf to output our prompt */

    	ldr r0, =pattern 	/* r0 contains pointer to format string for our scan pattern */
    	mov r1, r4	  	/* r1 contains pointer to variable label where our number is stored */
    	bl scanf              	/* call to scanf */
next:
	// demonstrate rotate "left" 8 bits which should rotate right 24 bits (32-8=24)
	ldr r1, [r4]
	mov r2, r1, ror #24

	// output the results
	ldr r0, =response	/* r0 contains pointer to response message */
	bl printf		/* call printf to output our response */

	mov r0, #0		/* exit code 0 = program terminated normally */
	pop {pc}		/* exit our main function */
