#!/bin/bash

usuario=$1

while [ -z "$usuario" ]
do
    read -p "No has puesto un usuario pon un usuario: " usuario
done
#Ejemplo de uso  del break y continue (Evitarlo simpre que sea posible!!)
while true
do  
    read -p "Dime un valor mayor entre 10 y 20" val
    if [ "$val" -ge 10 ] && [ "$val" -le 20 ]
        echo "Correcto"
        break
    else
        echo "Noooo!!!"
        continue
    fi
    echo "Este mensaje Nunca se imprimira"
done
#break para romper
#continue para seguir