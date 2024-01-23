#!/bin/bash
#####################################################
#
# Nombre: Sripts.sh
# Autor: Joseph Vanegas <josephvanegas48@Gmail.com
#
# Objetivo cambiar de Farth a celsious
# Entrada: Valores para cambiar
# Salida: valor cambiado
#
# Historial:
#   2023-12-19: version 1
######################################################

elem=$1

# 3 formas de comprobar que una variable no esté vacía
#if [ "$elem" = "" ]
#if [ -z "$elem" ]
if [ ! -n "$elem" ]
then
	echo "ERROR: Debe indicar un elemento"
	read -p "Indique el elemento: " elem
fi

if [ -e "$elem" ]
then
	echo "'$elem' EXISTE"
else
	echo "Lo siento, '$elem' NO existe"
	exit
fi

# Compruebo el tipo de elemento
if [ -f "$elem" ]
then
	echo "'$elem' es un FICHERO"
elif [ -d "$elem" ]
then
	echo "'$elem' es un DIRECTORIO"
elif [ -h "$elem" ]
then
	echo "'$elem' es un ENLACE"
else
	echo "'$elem es OTRO ELEMENTO"
fi

# Compruebo si está vacío o no
if [ -s "$elem" ]
then
	echo "'$elem' NO es vacío"
else
	echo "'$elem' es VACÍO"
fi

# Comprobar PERMISOS

if [ -r "$elem" ]
then
	echo "'$elem' tiene permisos de LECTURA"
else
	echo "'$elem' NO tiene permisos de LECTURA"
fi
if [ -w "$elem" ]
then
	echo "'$elem' tiene permisos de ESCRITURA"
else
	echo "'$elem' NO tiene permisos de ESCRITURA"
fi
if [ -x "$elem" ]
then
	echo "'$elem' tiene permisos de EJECUCIÓN/ACCESO"
else
	echo "'$elem' NO tiene permisos de EJECUCIÓN/ACCESO"
fi