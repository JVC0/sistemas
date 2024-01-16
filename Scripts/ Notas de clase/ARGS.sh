#!/bin/bash
# Puedo recorrer todos los argumentos (unico valor)
for arg in "$"
do
    echo '$*: '"EL argumento es $arg"
done
#Puedo recorrer todolos argumentos (uno a uno como lista)
for arg in "$@"
do 
    echo '$@: ' "El argumento es $arg"
done
#Puedo recorrer todos los elementos del disco
#ficheros directorios, etc.
for elem in *.sh
do 
    echo "Elemento:$elem"
    chmod go-x $elem
done
#Puedo recorrer la salida de cualquier comando
for elem in ($date)
do
    echo "Elemento: $elem"
done