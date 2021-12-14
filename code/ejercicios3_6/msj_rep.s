/*
	3.6 Ejercicios
	
	msj_rep.s / teclado.s
	Programa corto que obtiene la entrada del teclado y luego lo imprime de nuevo en la pantalla.
	
	Autor	Guerrero Montaño Alonso E. - 18211240
	Fecha	13/Dic/2021
*/


.section	.bss
.comm buffer, 48	     @ reservar buffer de 48 bytes

.section	.data
msg:
	.ascii	"** Mensaje_Replica **\nIngresa tu nombre: "
msgLen = . - msg
msg2:
	.ascii	"Hola "
msg2Len = . - msg2

.section	.text
.globl	_start
_start:

mov r0, $1		    @ despliega el mensaje principal del programa
ldr r1, =msg
ldr r2, =msgLen
mov r7, $4
svc $0

mov r7, $3		    @ llamada al sistema read
mov r0, $1		
ldr r1, =buffer
mov r2, $0x30
svc $0

mov r0, $1		    @ despliega mensaje 2 (msg2)
ldr r1, =msg2
ldr r2, =msg2Len
mov r7, $4
svc $0

mov r0, $1		    @ despliega la cadena ingresada por usuario
ldr r1, =buffer
mov r2, $0x30
mov r7, $4
svc $0

mov r7, $1	            @ salida del programa
svc $0		            
.end
