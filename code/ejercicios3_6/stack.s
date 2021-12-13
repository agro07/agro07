/*
	3.6 Ejercicios
	
	stack.s
	Ejemplo sencillo del uso del stack de la CPU
	
	Autor	Guerrero Montaño Alonso E. - 18211240
	Fecha	13/Dic/2021
*/


.global main

main:
     mov   r0, #2  /* asignar un valor a r0 (2) */
     push  {r0}    /* guardar r0 en la pila o stack */
     mov   r0, #3  /* asignar un nuevo valor a r0 (3) */
     pop   {r0}    /* regresar r0 a su estado inicial (2) */
     bx    lr      /* terminar programa */
     
