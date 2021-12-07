/*
	Cuadernillo Prácticas ASM RaspberryPi
	Capítulo 2
	
	tipos3b.s
	Imprime numeros del 0 a 4 decompilando estructura for de C
	
	Autor	Guerrero Montaño Alonso E. - 18211240
	Fecha	6/Dic/2021
*/

.data
var1:	.asciz	"%d\012"

.text
.global main

main:
	push {r4, lr}	/* guarda el contenido de r4 y lr en la pila (program stack)*/
	mov r1, #0	/* asigna valor 0 a r1 */	
	ldr r4, =var1	/* carga la direccion de memoria de var1 a r4 */
	
	mov r0, r4	/* asigna valor de r4 a r0 (mensaje) */
	bl printf	/* salta a la funcion printf para imprimir var1(r0) y toma el valor a imprimir de r1(0) */
	
	mov r0, r4	/* asigna valor de r4 a r0 (mensaje) */	
	mov r1, #1	/* asigna valor 1 a r1 */
	bl printf	/* salta a la funcion printf para imprimir var1(r0) y toma el valor a imprimir de r1(1) */
	
	mov r0, r4	/* asigna valor de r4 a r0 (mensaje) */	
	mov r1, #2	/* asigna valor 2 a r1 */
	bl printf	/* salta a la funcion printf para imprimir var1(r0) y toma el valor a imprimir de r1(2) */
	
	mov r0, r4	/* asigna valor de r4 a r0 (mensaje) */	
	mov r1, #3	/* asigna valor 3 a r1 */
	bl printf	/* salta a la funcion printf para imprimir var1(r0) y toma el valor a imprimir de r1(3) */
	
	mov r0, r4	/* asigna valor de r4 a r0 (mensaje) */	
	mov r1, #4	/* asigna valor 4 a r1 */
	
	pop {r4, lr}	/* carga valores de 4 y pc ---> en vez de pop{r4, lr} bx lr / instruccion de retorno */
	b printf	/* salta a la funcion printf para imprimir var1(r0) y toma el valor a imprimir de r1(4) */
