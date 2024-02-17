# shellcheck disable=SC2148
###########################################
#
# Autores: 
# Kai Rodríguez García <kai97rg@gmail.com>
# Joseph
#
# Nombre: script-entrega2.sh
#
# Objetivo: recibir argumentos, validar argumentos, monitorizar máximos cada 30 segundos,
# menú de opciones de procesos y manejar las señales que puedan entrar.
#
# Entradas: maxcpu y maxmem
# Salidas: info de procesos
#
# Historial: 16/02/2024
#
###########################################

# la primera var es el max de cpu y la segunda el max de memoria
maxCPU=$1
maxMem=$2

# si no son 2 argumentos, salta mensaje de error y sale

if [ "$#" -ne 2 ]; then
    echo "Debe escribir dos argumentos, el primer porcentaje máximo de uso de CPU, y el segundo es el porcentaje máximo de uso de memoria."
    exit 100
fi

# si alguno de los 2 arg es menor que 0, da mensaje de error y sale

if [ "$maxCPU" -lt 0 ] || [ "$maxMem" -lt 0 ]; then
    echo "Ambos valores deben ser mayores o iguales que 0."
    exit 200
fi

# si el num de memoria max es superior a 100, salta mensaje de error y sale

if [ "$maxMem" -gt 100 ]; then
    echo "La memoria máxima debe ser menor o igual que 100."
    exit 150
fi

# función para mostrar la info y menú, dependiendo de si proceso que supera
# el max es el en su cpu o en memoria, y su porcentaje
function mostrarMenu () {
    local tipo_proceso=$1
    local porcentaje=$2

# mensaje de alerta, un proceso es sueperior al max en cpu o memoria o ambas
    echo "CUIDADO!!! Se está utilizando $porcentaje % de $tipo_proceso, que es un uso mayor de $tipo_proceso del permitido. "
		
# si es la cpu, entonces recolecta info del proceso
    if [ "$tipo_proceso" == "%CPU" ]; then
        proceso_info=$(ps -eo pid,cmd,%cpu --sort=-%cpu | awk 'NR==2')
# si es la memoria, entonces recolecta info del proceso
    elif [ "$tipo_proceso" == "%mem" ]; then
        proceso_info=$(ps -eo pid,cmd,%mem --sort=-%mem | awk 'NR==2')
    fi
# muestra info del proceso
    echo "Información sobre ese proceso:"
    echo "$proceso_info"

    # MENÚ
    echo "                ┌────────────────┐"
    echo "                │      Menú      │"
    echo "                └────────────────┘"
    echo ""
    echo "┌───────────────────────────────────────────────────────────┐"
    echo ""
    echo "1) Ignorar el aviso y seguir comprobando"
    echo "2) Disminuir en 3 puntos la prioridad del proceso"
    echo "3) Interrumpir el proceso"
    echo "4) Terminar el proceso"
    echo "5) Finalizar inmediatamente el proceso"
    echo "6) Detener el proceso (congelarlo de forma evitable)"
    echo "7) Detener el proceso (congelarlo de forma INevitable)"
    echo "8) Salir"
    echo ""
    echo "└───────────────────────────────────────────────────────────┘"

    while true; do #empieza el bucle de mientras proceso sea superior:

# busca el pid del proceso
        pid=$(ps -eo pid --sort=-%cpu | awk 'NR==2')

        read -r  -p "Elija la opción que desee: " opcion

# código para ejecutar opciones del menú

        case $opcion in
            1) echo "Se ignora el proceso";;
            2) sudo renice -n -3 -p "$pid";;
            3) kill -s SIGINT "$pid";;
            4) kill -s SIGTERM "$pid";;
            5) kill -s SIGKILL "$pid";;
            6) kill -s SIGSTOP "$pid";;
            7) kill -s SIGTSTP "$pid";;
            8) echo "Saliendo del menú"; exit;;
            *) echo "No es una opción válida";;
        esac
    done
}

# Comienza parte de recibir señales, y si la señal es mostrar caraga o limites 
# hace las siguientes funciones:

function mostrarCargaSistema () {
    echo "Carga del sistema:"
    uptime
}

function mostrarLimitesProcesos () {
    echo "Límites de los procesos del sistema:"
    ulimit -a
}

# pendiente de recibir ciertas señales  

trap 'echo "Interrumpiendo ejecución"; exit 0' SIGINT
trap 'echo "Finalizando ejecución"; exit 0' SIGTERM
trap 'mostrarCargaSistema' SIGUSR1
trap 'mostrarLimitesProcesos' SIGUSR2

# bucle que comprueba si se supera los límites

while true; do
    maxCPU_proceso=$(ps -eo %cpu --sort=-%cpu | awk 'NR==2{print $1}')
    maxMem_proceso=$(ps -eo %mem --sort=-%mem | awk 'NR==2{print $1}')
   
    if (( $(echo "$maxCPU_proceso > $maxCPU" | bc -l) )) || (( $(echo "$maxMem_proceso > $maxMem" | bc -l) )); then
    mostrarMenu "%CPU" "$maxCPU_proceso"
    fi

    sleep 30
done

