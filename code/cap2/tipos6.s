/*
	Cuadernillo Prácticas ASM RaspberryPi
	Capítulo 2
	
	tipos6.s
	Suma de un vector de enteros largos
	
	Autor	Guerrero Montaño Alonso E. - 18211240
	Fecha	6/Dic/2021
*/

.data

var1 : .asciz "La suma es %lld\n"
var2 : .word 1600000000, -100, 800000000, -50, 200

.text
.global main

main:			
	push {r4, r5, r6, lr}	/* Salvamos registros */
	
	mov r5, #5	/* asigna valor 5 a r5 */
	mov r2, #0	/*  asigna valor 0 a r2 */
	mov r3, #0	/* asigna valor 0 a r3 */
	ldr r4, =var2	/* carga direccion de memoria de var2 a r4 */

/* bucle que hace la suma */
bucle:
	ldr r0, [r4], #4	/*carga primer valor de r4 a r0 y suma 4 a r4*/
	mov r1, r0, ASR #31 /* se extiende el signo de la instruccion anterior a los registros r1:r0 */
	
	/* suma r3:r2 = r3:r2 + r1:r0 */
	adds r2, r2, r0 /* se suman los 32 bits inferiores + posible acarreo */
	adc r3, r3, r1 /*suma de 32 bits superiores + acarreo anterior */
	subs r5, r5, #1	/* r5 = r5 - 1 y compara si el resultado es igual a 0*/
	bne bucle /*  si la resta no es igual a 0 regresa a la etiqueta bucle */

	ldr r0, =var1 /* carga var1 en r0 */
	bl printf /* ejecuta el metodo printf */
	
	/* recuperamos registros y salimos */
	pop {r4, r5, r6, lr}	
	bx lr