.text
.global main
main:
	push {lr}
	mov r1, #5
	mov r2, #64
	add r1, r2, asr #4
	pop {pc}
