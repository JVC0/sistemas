 #!/bin/bash
ERR_NOARG=3
 #DECLARAR una funcion 
 #modo 1
funcion media2v {
        local a=$1
        local b=$2
        if [ -z "$a" ] || [ -z "$b"]
        then
            return $ERR_NOARG
        fi

        med=$(( (a+b)/2 ))
        echo "$med"
        return 0
}

#Modo 2
mediaNV(){
    #Compruebo que haya argumentos
    if [ $# -eq 0 ]
    then 
        return $ERR_NOARG
    local sum=0 
for num in "$@"; do
    ((sum+=num))
done
#La media es el sumatorio dividido
#por el numero de argumentos
echo "$((media=$sum/$#))"
}

#Modo 3
funcion mediaMV(){
    echo "hola"
    local sum=0
    local num_arg=0
    while [ -n $1]
    do 
        ((suma+=$1))
        ((num_arg++))
        shift
    done
    echo "$(( suma/$num_arg ))"
}

res =$(media2v 4 7)
co_err= $?
echo "el resultado es $res"
echo  "Error devulelto es $co_err"
