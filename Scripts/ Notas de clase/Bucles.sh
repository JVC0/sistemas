#!/bin/bash

for i in 1 2 3 4 5 6 7 9 10
do
    echo "ELvalor de i es $1"
done
for i in "Monaco" "Francia" "Reino Unido" "Italia"
do
    echo "EL pais es $1"
done
#Bucle con rango
for i in {1..20}
do
    echo "EL valor de i es $i"
done
#Bucle con 'salto' (de 1 a 20 de en 3:1,4 ,...
for i in {1..20..3}
do
    echo "EL valor de i es $i"
done
#bucle decreciente:20,17,14..
for i in {20..1..3}
do
    echo "EL valor de i es $i"
done
#Buvle hasta un valor almacenado en una variable
read "indique el valor maximo:" n
for i in {0..$n}
do
    echo "EL valor de i es $i"
done