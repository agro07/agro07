/*
	3.6 Ejercicios
	
	stack.s
	Ejemplo sencillo del uso del stack de la CPU
	
	Autor	Guerrero Montaño Alonso E. - 18211240
	Fecha	13/Dic/2021
*/


.global main

main:
     mov   r0, #2  /* set up r0 */
     push  {r0}    /* save r0 onto the stack */
     mov   r0, #3  /* overwrite r0 */
     pop   {r0}    /* restore r0 to it's initial state */
     bx    lr      /* finish the program */