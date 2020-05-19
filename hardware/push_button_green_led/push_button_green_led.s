// assemble/compile: g++ push_button_green_led.s -lwiringPi -g -o push_button_green_led
.equ INPUT, 0
.equ OUTPUT, 1
.equ LOW, 0
.equ HIGH, 1

.equ LED_OUTPUT, 29	// LED on wiringPi 29, BCM 21, Physical 40
.equ BUTTON_PIN, 29

.equ Q_UPPER, 81	// ASCII Code for upper case Q = 81 decimal
.equ Q_LOWER, 113	// ASCII Code for lower case Q = 113 decimal

.global main

.align 4
.section .rodata
message_1:	.asciz	"Green LED should be ON!\n"
message_2:	.asciz	"Green LED should be OFF!\n"

.align 4
.text
main:	push {LR}

	// first order of business is to set up the wiring pi library
	bl wiringPiSetup	// sets up wiring pi library to use wiring pi pin numbering scheme

	mov R0, #LED_OUTPUT
	mov R1, #INPUT
	bl pinMode		// pinMode sets the pin to a specified mode, in this case, we want
				// wiringPi pin #29 to be set for INPUT, this is like typing in the terminal:
				// gpio mode 29 in
do_while:
	bl getchar		// call the c library function called getchar, R0 holds ascii code of keypress
	and R0, #255
	cmp R0,	#Q_UPPER	// exit if user pressed uppercase Q (shift+Q)
	beq end_do_while
	cmp R0, #Q_LOWER	// exit if user pressed lowercase Q 
	beq end_do_while
	mov R0, #BUTTON_PIN
	bl digitalRead		// digitalRead returns a 0 or 1 from the specified input pin, in this case, wpi #29
				// register R0 will hold either a 0 or 1, if button not pressed - 0, else if
				// button is pressed, R0 holds a 1.
	cmp R0, #HIGH
	bne continue_while

	// code to execute when R0 == #HIGH
	ldr R0, =message_1
	bl printf		// output message that LED should be on
	b do_while
continue_while:
	ldr R0, =message_2
	bl printf
	b do_while
end_do_while:
	mov R0, #0
	pop {PC}
