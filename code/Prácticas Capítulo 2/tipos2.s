/*
	Cuadernillo Prácticas ASM RaspberryPi
	Capítulo 2
	
	tipos2.s
	Estructura if
	
	Autor	Guerrero Montaño Alonso E. - 18211240
	Fecha	6/Dic/2021
*/

.data
a:	.word	5
b:	.word	4

.text
.global main

main:
	ldr r1, =a	@carga la direccion de memoria de a en r1	
	ldr r1, [r1]	@carga el valor de la direccion de memoria en r1
	ldr r2, =b	@carga direccion de memoria de b en r2
	ldr r2, [r2]	@carga valor de direccion en r2
	cmp r1, r2	@compara el valor de r1 y r2
	bne else	@si no son iguales salta a etiqueta else, si son iguales sigue a etiqueta then

then:
	mov r0, #1	@asigna el valor 1 a r0
	b final		@salta a etiqueta final
	
else:
	mov r0, #0	@asigna el valor 0 a r0

final:
	bx lr		@instruccion de retorno
