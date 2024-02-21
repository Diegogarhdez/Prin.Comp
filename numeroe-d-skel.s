# PR1. PRINCIPIO DE COMPUTADORES.
# Autor: Diego García Hernández
# Fecha ultima modificacion:

	.data

titulo:				 .asciiz "\nPR1: Principio de computadores.\n"
pet:		  		 .asciiz "\nIntroduzca maximo error permitido: "
caderr:				 .asciiz "\nError: el dato introducido debe cumplir 0.00001 <= dato < 1\n"
cade:		  		 .asciiz "\nNumero e: "
cadnt:				 .asciiz "\nNumero de terminos: "
cadfin:				 .asciiz "\nPR1: Fin del programa.\n"

	.text

main:

	li $v0, 4
	la $a0, titulo
	syscall

	li.d     $f20, 0.0    # Variable de error
	li.d 		$f22, 0.00001 # Variable de error minimo
	li.d 		$f24  1.0 	 # Variable e
	li.d 		$f26, 1.0 	 # Factorial
	li.d 		$f28, 1.0		 # Número de terminos
	li.d 		$f30, 1.0		 # Último termino

do: 
	li $v0, 4	
	la $a0, pet		# Imprime el mensaje para introducir el número de error máximo permitido 
	syscall

	li $v0, 7
	syscall		# Pide el número de error máxim0 permitido
	mov.d $f20, $f0

	li.d 		$f6,  1.0 # Variable temporal

	c.lt.d $f20,$f22	#compara si el número de error esta comprendido entre 0.00001 y 1
	bc1t if_fin
	c.lt.d $f20,$f6
	bc1t while

if_fin:
	li $v0, 4
	la $a0, caderr
	syscall
	b do

	li.d 		$f22, 0.0001 # Variable de error minimo
	li.d 		$f24  1.0 	 # Variable e
	li.d 		$f26, 1.0 	 # Factorial
	li.d 		$f28, 1.0		 # Número de terminos
	li.d 		$f30, 1.0		 # Último termino

while:
	li.d 		$f6,  1.0 # Variable temporal

	mul.d $f26,$f26,$f28  # Multiplica factorial por número de terminos
	div.d $f30,$f6,$f26		# Divide 1 entre factorial y lo almacena en último termino
	add.d $f24,$f24,$f30	# Suma número e con el último termino
	add.d $f28,$f28,$f6		# Suma a número de terminos 1
	c.lt.d $f30,$f20			# Compara el último termino con el error, si es menor salta al while
	bc1f while

	li $v0, 4
	la $a0, cade
	syscall

	li $v0, 3
	mov.d $f12,$f24
	syscall

	li $v0, 4
	la $a0, cadnt
	syscall

	li $v0, 3
	mov.d $f12,$f28
	syscall

	li $v0, 4
	la $a0, cadfin
	syscall

	li $v0, 10
	syscall