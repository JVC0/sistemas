#!/bin/bash
#####################################################
#
# Nombre: ej20.sh
# Autor: Joseph Vanegas <josephvanegas48@Gmail.com
#
# Objetivo Crear una calculadora
# Entrada: 2 numeros
# Salida: resultado de la operacion elegida
#
# Historial:
#   2023-01-28: version 1
######################################################

sumar() {
    resultado=$(echo "scale=2; $1 + $2" | bc )
    echo "Resultado: $resultado"
}

restar() {
    resultado=$(echo "scale=2; $1 - $2"| bc)
    echo "Resultado: $resultado"
}

multiplicar() {
    resultado=$(echo "scale=2;$1 * $2"| bc)
    echo "Resultado: $resultado"
}


dividir() {
    if [ $2 -eq 0 ]; then
        echo "Error"
    else
        resultado=$(echo "scale=2; $1 / $2" | bc)
        echo "Resultado: $resultado"
    fi
}

while true; do
    echo "################################################"
    echo "########### Menu de la Calculadora #############"
    echo "################################################"
    echo "1. Sumar"
    echo "2. Restar"
    echo "3. Multiplicar"
    echo "4. Dividir"
    echo "5. Salir"

    read -p "Opcion: " opcion

    case $opcion in
        "sumar" | 1 | a |A)
            read -p "Ingrese el primer numero: " num1
            read -p "Ingrese el segundo numero: " num2
            sumar "$num1" "$num2"
            ;;
        "restar" | 2 | b |B)
            read -p "Ingrese el primer numero: " num1
            read -p "Ingrese el segundo numero: " num2
            restar "$num1" "$num2"
            ;;
        "multiplicar" | 3 | c |C)
            read -p "Ingrese el primer numero: " num1
            read -p "Ingrese el segundo numero: " num2
            multiplicar "$num1" "$num2"
            ;;
        "dividir" | 4 | d |D)
            read -p "Ingrese el numerador: " num1
            read -p "Ingrese el denominador: " num2
            dividir "$num1" "$num2"
            ;;
        "salir" | 5 | e |E)
            echo "Saliendo de la calculadora."
            exit 0
            ;;
        *)
            echo "Opcion no valida. Intentelo de nuevo."
            ;;
    esac
done