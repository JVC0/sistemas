#!/bin/bash

# Bucle más simple indicando los valores
for i in 1 2 3 4 5 6 7 8 9 10
do
	echo "El valor de i es $i"
done

# Puede ser cualquier valor
for i in "Monaco" "Francia" "Reino Unido" "Italia"
do
	echo "El país es $i"
done

# Bucle con rango
for i in {1..20}
do
	echo "El valor de i es $i"
done

# Bucle con "salto" (de 1 a 20 de 3 en 3: 1, 4, 7...)
for i in {1..20..3}
do
	echo "El valor de i es $i"
done

# Bucle decreciente:20, 17, 14, ...
for i in {20..1..-3}
do
	echo "El valor de i es $i"
done


for i in {0..100..5}
do
	echo "El cuadrado de $i es $(( i**2 ))"
done

# Bucle hasta un valor almacenado en una variable
read -p "Indique el valor máximo: " n
#             ini  end
for i in `seq 0    $n` 
do
	echo "C: El cuadrado de $i es $(( i**2 ))"
done
#              ini   step end
for i in $(seq $n    -2    4) 
do
	echo "D: El cuadrado de $i es $(( i**2 ))"
done

# Sintaxis C-like 
# for (( var=ini; cond; actual ))
for ((i=0; i<10; i++)) 
do
	echo "Los valores de i son $i"
done

# Puedo recorrer todos los argumentos (único valor)
for arg in "$*"
do
	echo '$*: '"El argumento es $arg"
done

# Puedo recorrer todos los argumentos (uno a uno como una lista)
for arg in "$@"
do
	echo '$@: '"El argumento es $arg"
done


# Puedo recorrer todos los elementos del disco
# Ficheros, directorios, etc.
for elem in *.sh
do
	echo "Elemento: $elem"
	chmod go-x $elem
done


# Puedo recorrer la salida de cualquier comando
for elem in $(date)
do
	echo "Elemento: $elem"
done