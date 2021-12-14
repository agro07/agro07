/*
	3.6 Ejercicios
	
	hanoi2.s
	Torres recursivas de Hanoi con número de discos asignado por usuario
	
	Autor	Guerrero Montaño Alonso E. - 18211240
	Fecha	13/Dic/2021
*/

@ ---------------------------------------
@	Data Section
@ ---------------------------------------
	
	.data
	.balign 4
prompt:	.asciz	"How many disk do you want to move? "
format:	.asciz	"%d"	
string: .asciz  "move disk from %c to %c\n\0"
peg1:	.int	'A'		@ vlavijas
peg2:	.int	'B'
peg3:	.int	'C'
n:	.int	4		@ número de discos a mover
	
@ ---------------------------------------
@	Code Section
@ ---------------------------------------
	
	.text
	.global main
	.extern printf
	.extern	scanf

@ ---------------------------------------
@ getNumberOfDisks():
@ Pregunta al usuario y asigna el número de discos a r1
getNumberOfDisks:
	push 	{ip, lr}	@ salvamos registros
				

	ldr	r0, =prompt	@ despliega prompt
	bl	printf

	ldr     r0, =format	@ llama a scanf y asigna la direccion de memoria de format
	ldr	r1, =n		@ y n a r0 y r1, respectivamente.
	bl	scanf		

        pop 	{ip, pc}
	
@ ---------------------------------------
@ moveDisks( n, Source, Dest, Extra )
@	    r4   r5     r6    r7
@    if n==1:
@	printf( "move disk from %c to %c\n", Source, Dest )
@    else:
@	moveDisks( n-1, Source, Extra, Desk )
@	printf( "move disk from %c to %c\n", Source, Dest )
@	moveDisks( n-1, Extra, Dest, Source )
@	
moveDisks:	
	push	{r4-r8, lr}

	@ if n==1:
	cmp	r4, #1
	bgt	moveN_1Disks

move1Disk:	
	@ print( "move disk from %c to %c\n", Source, Dest )
	ldr	r0, =string
	mov	r1, r5
	mov	r2, r6
	bl	printf
	b	endMoveDisk

moveN_1Disks:	
	@ moveDisks( n-1, Source, Extra, Dest )
	mov	r8, r7		@ intercambia Dest & Extra
	mov	r7, r6
	mov	r6, r8
	sub	r4, #1
	bl	moveDisks
	mov	r8, r7		@ regresa a sus reg originales Dest & Extra
	mov	r7, r6
	mov	r6, r8

	@ print( "move disk from %c to %c\n", Source, Dest )
	ldr	r0, =string
	mov	r1, r5
	mov	r2, r6
	bl	printf

	@ moveDisks( n-1, Extra, Dest, Source )	
	mov	r8, r5		@ intercambia Source y Extra,  r5 y r7.
	mov	r5, r7
	mov	r7, r8
	bl	moveDisks
	
endMoveDisk:	
	pop	{r4-r8, pc}

	
@ ---------------------------------------
@ main: call moveDisks( n, peg1, peg2, peg3 )

main:   push 	{ip, lr}	@ salvar registros

	bl	getNumberOfDisks
				@ obtener n
	
	ldr	r4, =n		@ asignar n a r4
	ldr	r4, [r4]
	ldr	r5, =peg1	@ asignar peg1 a r5
	ldr	r5, [r5]
	ldr	r6, =peg2	@ asignar peg2 a r6
	ldr	r6, [r6]
	ldr	r7, =peg3	@ asignar peg3 a r7
	ldr	r7, [r7]
	bl	moveDisks	@ llamada a moveDisks( n, peg1, peg2, peg3 )

	
@ rgreso al so
        pop 	{ip, pc}	@ recuperamos registros
