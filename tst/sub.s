.global main

.align 4

.text

main:
push {lr}

//output hello msg
ldr r0, =hello_msg
bl printf

//output the prompt then get the first integer
ldr r0, =prompt1
bl printf

ldr r0, =scan1
ldr r1, =number_1
bl scanf

//output the prompt and get the second integer
ldr r0, =prompt2
bl printf

ldr r0, =scan1
ldr r1, =number_2
bl scanf

//calculate the sum
ldr r0, =number_2
ldr r0,[r0]
ldr r1, =number_1
ldr r1,[r1]
add r0,r0,r1


//str the sum
ldr r1, =sum
str r0, [r1]

//calculate the difference
ldr r0, =number_2
ldr r0,[r0]
ldr r1, =number_1
ldr r1,[r1]
sub r0,r1,r0


//str the difference
ldr r1, =difference
str r0, [r1]

//calculate the product
ldr r0, =number_2
ldr r0,[r0]
ldr r1, =number_1
ldr r1,[r1]
mul r0,r1,r0


//str the product
ldr r1, =product
str r0, [r1]


//output the sum
ldr r0, =output1
ldr r1, =number_1
ldr r1,[r1]
ldr r2, =number_2
ldr r2,[r2]
ldr r3, =sum
ldr r3,[r3]

bl printf

//output the difference
ldr r0, =output2
ldr r1, =number_1
ldr r1,[r1]
ldr r2, =number_2
ldr r2,[r2]
ldr r3, =difference
ldr r3,[r3]

bl printf

//output the product
ldr r0, =output3
ldr r1, =number_1
ldr r1,[r1]
ldr r2, =number_2
ldr r2,[r2]
ldr r3, =product
ldr r3,[r3]

bl printf


pop {pc}

.data

number_1:   .word 0   //integer number 1
number_2:   .word 0   //integer number 2
sum:        .word 0   //the sum of the numbers
difference: .word 0   //their differance
product:    .word 0   //their product

hello_msg: .asciz "Hello! Welcome to Two Integers.\n\n"   //A welcome prompt
prompt1:    .asciz "Enter an integer for first number: "   //prompt for first num
prompt2:    .asciz "Enter an integer for second number: "  //prompt for second num

output1:    .asciz "The sum of %d and %d is %d\n\n"        //outputs the sum of two numbers
output2:    .asciz "The difference of %d and %d is %d\n\n" //outputs the differance of two numbers
output3:    .asciz "The product of %d and %d is %d\n\n"    //outputs their product

scan1:      .asciz "%d"                                    //required for scanf

