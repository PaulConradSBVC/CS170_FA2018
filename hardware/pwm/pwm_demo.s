// assemble: g++ pwm_demo.s -lwiringPi -g -o pwm_mode

.equ INPUT, 0
.equ OUTPUT, 1
.equ PWM_OUTPUT, 2

.equ LOW, 0
.equ HIGH, 1

.equ LED_PIN, 1		// LED on wiringPi 1

.equ PAUSE, 75		// 75 ms delay = 0.075 second delay

.equ DELTA, 16		// delta increment/decrement (use a power of two that is a multiple of 1024)

.global main

.align 4
.section .rodata
output_msg:	.asciz	"Outputting %d to pin #%d\n"

.align 4
.text
main:
	push {R4, LR}
	bl wiringPiSetup

	// set up pin mode
	mov R0, #LED_PIN
	mov R1, #PWM_OUTPUT
	bl pinMode

	// run our loop
	mov R4, #0
do_while:
	mov R0, #LED_PIN
	mov R1, R4
	bl pwmWrite

	// delay
	mov R0, #PAUSE
	bl delay

	add R4, #DELTA
	cmp R4, #1024
	ble do_while

do_while2:
	mov R0, #LED_PIN
	mov R1, R4
	bl pwmWrite

	// delay
	mov R0, #PAUSE
	bl delay

	sub R4, #DELTA
	cmp R4, #0
	bgt do_while2

	mov R0, #0
	pop {R4, PC}
