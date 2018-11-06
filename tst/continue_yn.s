.global main
.global continue_yn

.section .text
.align 4
// continue_yn:		prompt user if they want to continue, y for yes, n for no
//
// parameters:		none
//
// return value:	r0 = 0 if no; r0 = 1 if yes
//

continue_yn:
	push {lr}		// save lr for exit
	sub r11, sp, #4		// set frame pointer to sp - 4 (next available memory location)
	sub sp, sp, #4		// move stack pointer down 4 bytes (local variable to hold choice)

cont_loop:
	ldr r0, =cont_yn_msg	// r0 has address of prompt message
	bl printf		// print the prompt message

	ldr r0, =cont_yn_pat	// r0 has address to %c scan pattern
	mov r1, r11		// r1 has address to local variable
	bl scanf		// call scanf

	ldrb r0, [r11]		// load 8 bit byte into r0 from local variable's location

	cmp r0, #89		// compare r0 and 'Y'
	beq cont_done_y		// branch if equal to cont_done_y
	cmp r0, #121		// compare r0 and 'y'
	beq cont_done_y		// branch if equal to cont_done_y
	cmp r0, #78		// compare r0 and 'N'
	beq cont_done_n		// branch if equal to cont_done_n
	cmp r0, #110		// compare r0 and 'n'
	beq cont_done_n		// branch if eqal to cont_done_n
	bl clr_kb		// clear keyboard buffer of any addition chars we done want or need
	bal cont_loop		// otherwise, all other characters, loop back to prompt and try again
cont_done_y:
	mov r0, #1		// if entered char is 'Y' or 'y' r0 will return 1
	bal cont_done		// head out, almost done!
cont_done_n:
	mov r0, #0		// if enterec char is 'n' or 'Y' r0 will return 0
cont_done:
	add sp, sp, #4		// adjust stack pointer back to where it was before allocating local variable
	pop {pc}		// exit the function

.align 4
cont_yn_msg:	.asciz "Do you want to continue (Y=Yes, N=No)? "
cont_yn_pat:	.asciz "%c"
///////////////////////////////////////////////////////////////////////////////
.align 4
clr_kb:
	push {lr}
clr_kb_loop:
        bl getchar
	cmp r0, #0
	beq clr_kb_done
        cmp r0, #10
        bne clr_kb_loop
clr_kb_done:
	pop {pc}

///////////////////////////////////////////////////////////////////////////////
.align 4
main:
	push {lr}
	bl continue_yn

	mov r1, r0
	ldr r0, =out_msg
	bl printf

	mov r0, #0
	pop {pc}

.align 4
out_msg: .asciz "continue_yn returned %d\n"
