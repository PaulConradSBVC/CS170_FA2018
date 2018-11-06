.global main

.section .text
main:
	push {lr}

	mov r0, #1
	bl static_function	// outputs a=1, n=1, with return value of 2
	ldr r1, =static_function_a
	str r0, [r1]

	mov r0, #5
	bl static_function	// outputs a=1, n=5, with return value of 6

	pop {pc}

/* the following function does the c/c++ equivalent of:

int static_function(int n)
{
	static int a=n;
	printf("a=%d, n=%d\n");
	return a+n;
}
*/
.fnstart
static_function:
	push {r4,lr}
	mov r4, r0			// store r0 in r4
	ldr r0, =static_function_a+4	// r1 will hold boolean value of static_function_a
	ldr r1, [r0]
	cmp r1, #1			// is it 1 (true?)
	beq static_function_1		// if yes, this is not the first time in function
	mov r1, #1
	str r1, [r0]
	str r4, [r0, #-4]
static_function_1:
	ldr r0, =static_function_output // printf format string to print
	ldr r1, =static_function_a
	ldr r1, [r1]
	mov r2, r4
	add r4, r1, r2
	bl printf
	mov r0, r4
	pop {r4,pc}

.align 4
static_function_a:	.word	0	// this is where the initialized value be stored
			.word	0	// "boolean" flag.. false=static var not initialized
					// true=static var has been initialized
static_function_output: .asciz "a=%d\n, n=%d\n"
.fnend
