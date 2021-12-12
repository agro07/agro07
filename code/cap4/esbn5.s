/*
	Cuadernillo Prácticas ASM RaspberryPi
	Capítulo 4
	
	esbn5.s
	LED parpadeante con temporizador 
	
	Autor	Guerrero Montaño Alonso E. - 18211240
	Fecha	12/Dic/2021
*/

	.set GPBASE,	0x20200000
	.set GPFSELO,	0x00
	.set GPSETO, 	0x1c
	.set GPCLRO,	0x28
	.set STBASE,	0x20003000
	.set STCLO,	0x04

.text
	ldr r0, =GPBASE

/* guía bits		xx999888777666555444333222111000 */
	mov r1, #0b00001000000000000000000000000000
	str r1, [r0, #GPFSELO] @ Configura GPIO 9
/* guía bits		10987654321098765432109876543210 */
	mov r1, #0b00000000000000000000001000000000
	ldr,r2, =STBASE

bucle:
	bl espera		@ salta a rutina de espera
	str r1, [r0, #GPSETO]	@ Enciende
	bl espera
	str r1, [r0, #GPCLRO] 	@ Apaga
	b	bucle
	
/* rutina que espera medio segundo */
espera:
	ldr r3, [r2, #STCLO]	@ Lee contador en r3
	ldr r4, =500000
	add r4, r3		@ r4 = r3 + medio millón

ret1:
	ldr r3, [r2, #STCLO]
	cmp r3, r4		@ Leemos CLO hasta alcanzar
	bne ret1		@ el valor de r4
	bx lr
