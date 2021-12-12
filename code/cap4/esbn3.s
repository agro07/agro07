/*
	Cuadernillo Prácticas ASM RaspberryPi
	Capítulo 4
	
	esbn3.s
	Parpadeo continuo de LED 
	
	Autor	Guerrero Montaño Alonso E. - 18211240
	Fecha	12/Dic/2021
*/

	.set GPBASE,	0x20200000
	.set GPFSELO,	0x00
	.set GPSETO, 	0x1c
	.set GPCLRO,	0x28

.text
	ldr r0, =GPBASE

/* guía bits	   xx999888777666555444333222111000 */
	mov r1, #0b00001000000000000000000000000000
	str r1, [r0, #GPFSELO] @ Configura como salida

/* guía bits	   10987654321098765432109876543210 */
bucle:
	mov r1, #0b00000000000000000000001000000000
	str r1, [r0, #GPSETO] @ Enciende
	mov r1, #0b00000000000000000000001000000000
	str r1, [r0, #GPCLRO] @ Apaga
	b	bucle
