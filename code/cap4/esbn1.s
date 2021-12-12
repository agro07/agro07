/*
	Cuadernillo Prácticas ASM RaspberryPi
	Capítulo 4
	
	esbn1.s
	Imprime cadena con llamada a sistema 'write'
	
	Autor	Guerrero Montaño Alonso E. - 18211240
	Fecha	12/Dic/2021
*/

.data

cadena : .asciz "Hola Mundo!\n"
cadenafin :

.text
.global main

main:	
	push {r7, lr}			/* preservamos registros */
	mov r0, #1			/* salida estándar*/
	ldr r1, =cadena			/* cadena a enviar*/
	mov r2, #cadenafin-cadena	/* longitud */ 
	mov r7, #4			/*seleccionamos la*/
	swi #0				/* llamada al sistema 'write'*/
	mov r0, #0			/* devolvemos ok*/
	pop {r7, lr}			/* recuperamos registros*/
	bx lr				/* salimos de main */
