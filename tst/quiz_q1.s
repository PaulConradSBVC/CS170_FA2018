.global main
.text
.balign 4
main:
	push {lr}
	mov R0, #65
	mvn R1, #10
	bl mystery
	pop {pc}

mystery:
	adds R1, R0, lsl #1
	adcs R0, R0, lsl #2
	mov PC, LR
