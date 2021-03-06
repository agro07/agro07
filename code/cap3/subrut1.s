/*
	Cuadernillo Prácticas ASM RaspberryPi
	Capítulo 3
	
	subrut1.s
	Números aleatorios
	
	Autor	Guerrero Montaño Alonso E. - 18211240
	Fecha	9/Dic/2021
*/

.data
seed :	.word	1
const1 :	.word	1103515245
const2 :	.word	12345

.text
.global main

main:
	ldr r1, =seed		@ leo puntero a seed
	ldr r0, [r1]		@ leo valor de seed
	ldr r2, [r1, #4]	@ leo const1 en r2
	mul r3, r0, r2		@r3 = seed*1103515245
	ldr r0, [r1, #8]	@leo const2 en r0
	add r0, r0, r3		@r0 = r3 + 12345
	str r0, [r1]		@guardo en variable seed
	
/* Devuelven "seed >> 16 & 0x7fff".
	Se evita el uso del AND */
	
	LSL r0, #1
	LSR r0, #17
	bx lr
	
mysrand:
	ldr r1, =seed
	str r0, [r1]
	bx lr
