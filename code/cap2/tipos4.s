/*
	Cuadernillo Prácticas ASM RaspberryPi
	Capítulo 2
	
	tipos4.s
	Suma de elementos de un vector
	
	Autor	Guerrero Montaño Alonso E. - 18211240
	Fecha	6/Dic/2021
*/

.data

var1 : .asciz "La suma es %d\n"
var2 : .word 128, 32, 100, -30, 124

.text
.global main

main:			
	push {r4, lr}	/* Salvamos registros */
	
	mov r0, #5	/* asigna valor 5 a r0 */
	mov r1, #0	/*  asigna valor 0 a r1 */
	ldr r2, =var2	/* carga direccion de memoria de var2 a r2 */

/* bucle que hace la suma */
bucle:
	ldr r3, [r2], #4	/**/
	add r1, r1, r3	/* r1 = r1 + r3 */
	subs r0, r0, #1	/* r0 = r0 - 1 */
	bne bucle /*  si no es */

	ldr r0, =var1 /* carga var1 en r0 */
	bl printf /* ejecuta el metodo printf */
	
	/* recuperamos registros y salimos */
	pop {r4, lr}	
	bx lr