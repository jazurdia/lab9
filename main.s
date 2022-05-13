/**
* Universidad del Valle de Guatemala
* Laboratorio 9 - Organización de computadoras y Assembler
* "Corrimiento de bits activos" Temario 1 - Manejo de puertos GPIO
* carnets: 21242, #######, #######
**/ 

// Desarrollar un programa en assembler ARM, generar la secuencia mostrada en la siguiente figura por medio
// del control de puertos GPIO. El cambio de estado se realizará cada 1.5 segundos.

// Figura:
// 1 - 1, 2 - 3 - 3, 4 - 5 - 5, 6 - 7 - 7, 8

.data
.balign 4

    error: .asciz "Se ha producido un error.\n"


.text
    .global main
    .extern wiringPiSetup
    .extern pinMode
    .extern digitalWrite
    .extern delay


main:   push 	{ip, lr}
    bl wiringPiSetup
    mov r1, #-1
    cmp r0, r1
    bne init

    ldr r0, =error
    bl printf
    b end


init:
    
    mov r0, #0
    mov r1, #1
    bl pinMode

    
    // prender foco 1. 
    mov r0, #0
    move r1, #1
    bl digitalWrite

    //esperar 1.5 segundos|
    mov r0, #1500
    bl delay

    // prender foco 1 y 2.
    mov r0, #1
    mov r1, #1
    bl digitalWrite

    mov r0, #0
    mov r1, #1
    bl digitalWrite

    //esperar 1.5 segundos|
    mov r0, #1500
    bl delay

    // prender foco 3. 
    mov r0, #2
    mov r1, #1
    bl digitalWrite

    //esperar 1.5 segundos|
    mov r0, #1500
    bl delay

    // prender foco 3 y 4.
    mov r0, #3
    mov r1, #1
    bl digitalWrite

    mov r0, #2
    mov r1, #1
    bl digitalWrite

    //esperar 1.5 segundos|
    mov r0, #1500
    bl delay

    // prender foco 5.
    mov r0, #4
    mov r1, #1
    bl digitalWrite

    //esperar 1.5 segundos|
    mov r0, #1500
    bl delay

    // prender foco 5 y 6.
    mov r0, #5
    mov r1, #1
    bl digitalWrite

    mov r0, #4
    mov r1, #1
    bl digitalWrite

    //esperar 1.5 segundos|
    mov r0, #1500
    bl delay

    // prender foco 7.
    mov r0, #6
    mov r1, #1
    bl digitalWrite

    //esperar 1.5 segundos|
    mov r0, #1500
    bl delay

    // prender foco 7 y 8.
    mov r0, #7
    mov r1, #1
    bl digitalWrite

    mov r0, #6
    mov r1, #1
    bl digitalWrite

    b end


end:
    pop {ip, pc}

