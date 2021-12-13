/*
	Cuadernillo Prácticas ASM RaspberryPi
	Capítulo 4
	
	esbn2.s
	Encendido de LED (GPIO 9)
	
	Autor	Guerrero Montaño Alonso E. - 18211240
	Fecha	12/Dic/2021
*/

	.set GPBASE,	0x20200000
	.set GPFSEL0,	0x00
	.set GPSET0, 	0x1c

.text
	ldr r0, =GPBASE

/* guía bits	   xx999888777666555444333222111000 */
	mov r1, #0b00001000000000000000000000000000
	str r1, [r0, #GPFSEL0] @ Configura GPIO 9

/* guía bits	   10987654321098765432109876543210 */
	mov r1, #0b00000000000000000000001000000000
	str r1, [r0, #GPSET0] @ Enciende GPIO 9

infi: b infi
