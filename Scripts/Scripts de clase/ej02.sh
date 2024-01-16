#!/bin/bash
#####################################################
#
# Nombre: ejo02.sh
# Autor: Joseph Vanegas <josephvanegas48@Gmail.com
#
# 
# Entrada: 1:nombre  2: apellido 3: usuario  
# Salida: mensaje
#
# Historial:
#   2023-01-08: version 1
######################################################

read -p "Indique su nombre: " nombre
read -p "Indique su apellido: " apellido
read -p "Indique su usuario: " usuario
echo "Bienvenido, $nombre"
echo "Tu datos son $nombre, $apellido"
echo "Vamos a crear tu usuaria:$usuario"
echo "Tu nueva ID es $RANDOM"