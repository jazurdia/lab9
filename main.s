/**
* Universidad del Valle de Guatemala
* Laboratorio 9 - Organización de computadoras y Assembler
* "Corrimiento de bits activos" Temario 1 - Manejo de puertos GPIO
* carnets: 21242, #######, #######
**/ 

// Desarrollar un programa en assembler ARM, generar la secuencia mostrada en la siguiente figura por medio
// del control de puertos GPIO. El cambio de estado se realizará cada 1.5 segundos.

// Figura:
// 1 - (1, 2) - 3 - (3, 4) - 5 - (5, 6) - 7 - (7, 8)

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
    
    // GPIO 17 | wPi - 0 | primer bit
    // GPIO 27 | wPi - 1 | segundo bit
    // GPIO 22 | wPi - 2 | tercer bit
    // GPIO 23 | wPi - 3 | cuarto bit
    // GPIO 24 | wPi - 4 | quinto bit
    // GPIO 25 | wPi - 5 | sexto bit
    // GPIO 4  | wPi - 6 | septimo bit
    // GPIO 2  | wPi - 7 | octavo bit

    // setting wpi 0 to 7 as output
    mov r0, #0 // wpi 0
    mov r1, #1
    bl pinMode

    mov r0, #1 // wpi 1
    mov r1, #1
    bl pinMode

    mov r0, #2 // wpi 2
    mov r1, #1
    bl pinMode

    mov r0, #3 // wpi 3
    mov r1, #1
    bl pinMode

    mov r0, #4 // wpi 4
    mov r1, #1
    bl pinMode

    mov r0, #5 // wpi 5
    mov r1, #1
    bl pinMode

    mov r0, #6 // wpi 6
    mov r1, #1
    bl pinMode

    mov r0, #7 // wpi 7
    mov r1, #1
    bl pinMode


    // primer estado: wpi 0 "on", todos los demás "off"
    mov r0, #0 // wpi 0 "on"
    mov r1, #1
    bl pinMode

    
    // cambio de estado
    mov r0, #1500
    bl delay

    
    // segundo estado: wpi 0 "on" y wpi 1 "on", todos los demás "off"

    mov r0, #1 // wpi 1 "on"
    mov r1, #1
    bl digitalWrite

    
    // cambio de estado
    mov r0, #1500
    bl delay


    // tercer estado: wpi 2 "on", todos los demás "off"
    mov r0, #0 // wpi 0 "off"
    mov r1, #0
    bl digitalWrite

    mov r0, #1 // wpi 1 "off"
    mov r1, #0
    bl digitalWrite

    mov r0, #2 // wpi 2 "on"
    mov r1, #1
    bl digitalWrite

    // cambio de estado
    mov r0, #1500
    bl delay


    // cuarto estado: wpi 2 "on" y wpi 3 "on", todos los demás "off"

    mov r0, #3 // wpi 3 "on"
    mov r1, #1
    bl digitalWrite

    // cambio de estado
    mov r0, #1500
    bl delay


    // quinto estado: wpi 4 "on", todos los demás "off"
    mov r0, #2 // wpi 2 "off"
    mov r1, #0
    bl digitalWrite

    mov r0, #3 // wpi 3 "off"
    mov r1, #0
    bl digitalWrite

    mov r0, #4 // wpi 4 "on"
    mov r1, #1
    bl digitalWrite


    // cambio de estado
    mov r0, #1500
    bl delay


    // sexto estado: wpi 4 "on" y wpi 5 "on", todos los demás "off"

    mov r0, #5 // wpi 5 "on"
    mov r1, #1
    bl digitalWrite


    // cambio de estado
    mov r0, #1500
    bl delay


    // septimo estado: wpi 6 "on", todos los demás "off"
    mov r0, #4 // wpi 4 "off"
    mov r1, #0
    bl digitalWrite

    mov r0, #5 // wpi 5 "off"
    mov r1, #0
    bl digitalWrite

    mov r0, #6 // wpi 6 "on"
    mov r1, #1
    bl digitalWrite


    // cambio de estado
    mov r0, #1500
    bl delay


    // octavo estado: wpi 6 "on" y wpi 7 "on", todos los demás "off"

    mov r0, #7 // wpi 7 "on"
    mov r1, #1
    bl digitalWrite

    b end

end:
    pop {ip, pc}

