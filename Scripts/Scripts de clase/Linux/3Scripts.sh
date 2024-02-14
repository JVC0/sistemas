#!/bin/bash
#####################################################
#
# Nombre: Suma.sh
# Autor: Joseph Vanegas <josephvanegas48@Gmail.com
#
# Objetivo sumar dos numeros
# Entrada: Valores a sumar 
# Salida: resultado de la suma
#
# Historial:
#   2023-12-19: version 1
######################################################

resultado=$(($1+$2))
echo $1 + $2 = $resultado