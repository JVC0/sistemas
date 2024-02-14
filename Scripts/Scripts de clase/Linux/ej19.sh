#!/bin/bash
#####################################################
#
# Nombre: ej19.sh
# Autor: Joseph Vanegas <josephvanegas48@Gmail.com
#
# Objetivo calcular el cambio
# Entrada: coste de un objeto
# Salida: Cambio
#
# Historial:
#   2023-01-28: version 1
######################################################
dinero2=(200 100 50 20 10 5 2 1)
dinero=$1
resultado=0
echo "Se ha comprado un artículo de $1 euros y ha pagado 500 euros."
cambio=$((500-$dinero))

if [[ $cambio -eq 0 ]]; then 
    echo "No hay que entregar cambio"
else
    for i in "${dinero2[@]}"; do
        if [[ $cambio -ge $i ]]; then
            resultado=$(echo "scale=0; $cambio/$i" | bc)
            echo "$resultado billete(s) de $i euro(s)"
            cambio=$(echo "scale=2; $cambio-$resultado*$i" | bc)
        elif [[ $((cambio % i)) -eq 0 ]];then
            break
        fi
    done
fi
