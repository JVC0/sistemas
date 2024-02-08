#!/bin/bash
nombre_de_paquete=$1
respuesta=""
if [[ -z $nombre_de_paquete ]]; then
    read -p "Introduzca el nombre del paquete que desea instalar: " nombre_de_paquete
fi

sudo apt update
listado=$(apt list --installed "$nombre_de_paquete" | grep -i instalado | wc -l)

if apt-cache show $nombre_de_paquete >/dev/null 2>&1; then
    if [ $listado -eq 0 ]; then
        read -p "Parece que no tienes este paquete. ¿Quieres instalarlo? " respuesta
        if [[ $respuesta == "si" ]]; then
            sudo apt install $nombre_de_paquete
        fi
    else
        echo                    "┌────────────────┐"
        echo                    "|    M E N U     │"
        echo                    "└────────────────┘"
        echo "┌───────────────────────────────────────────────────────────┐"
        echo "a: Mostrar su versión"
        echo "b: Reinstalarlo"
        echo "c: Actualizarlo (solo este paquete, si fuera actualizable)"
        echo "d: Eliminarlo (guardando la configuración)"
        echo "e: Eliminarlo totalmente"
        echo ""
        echo "└───────────────────────────────────────────────────────────┘"
        read -p "Introduzco su opción: " opcion
        case "$opcion" in
            a|A|1) apt policy $nombre_de_paquete ;;
            b|B|2) sudo apt reinstall $nombre_de_paquete ;;
            c|C|3) sudo apt install $nombre_de_paquete ;;
            d|D|4) sudo apt remove $nombre_de_paquete ;;
            e|E|5) sudo apt purge $nombre_de_paquete ;;
            *) echo "ERROR: \"$opcion\" no es una opción correcta" ;;
        esac
    fi
else
    apt search $nombre_de_paquete
fi