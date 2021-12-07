/*
	Cuadernillo Prácticas ASM RaspberryPi
	Capítulo 2
	
	tipos3a.s
	Imprime numeros del 0 a 4 utilizando estructura for
	
	Autor	Guerrero Montaño Alonso E. - 18211240
	Fecha	6/Dic/2021
*/

.data
var1:	.asciz	"%d\012"

.text
.global main

main:
	push {r4, lr}	/* guarda el contenido de r4 y lr en la pila (program stack)*/
	mov r4, #0	/* asigna valor 0 a r4*/
		

.L2:
	mov r1, r4	/* asigna el valor de r4 a r1 */
	ldr r0, =var1	/* carga la direccion de memoria de var1 a r0 */
	add r4, r4, #1	/* suma 1 al valor de r4 y lo guarda en r4 */	
	bl printf	/* salta a la funcion printf para imprimir var1 y toma el valor a imprimir de r1 */
	cmp r4, #5	/* compara el valor de r4 con 5 */
	bne .L2	/* si no son iguales, regresa a la etiqueta .L2*/
	pop {r4, pc}	/* carga valores de 4 y pc ---> en vez de pop{r4, lr} bx lr*/
