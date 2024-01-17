 #!/bin/bash

 regalo = ("caletine" "corbatas" "accesorios" "prismaticos" "camiseta de futbol")
 numeros=(2 432 6435 234 53)

echo "Este ano me he portado muy bien y me han regalado: ${regalos[1]}"

echo "Este ano me he portado muy bien y me han regalado: ${regalos[*]}"
echo "Este ano me he portado muy bien y me han regalado: ${regalos[@]}"

echo "Mis regalos han sido: "
for reg in "${regalos[@]}" # vacio es un error
do
    echo " - $reg "
done

#Numeros de elementos del array -> ${#regalos[@]}
echo  "Como me he poertado tan  bien me han traido ${#regalos[@]} regalos"
echo "Y los indices son ${!regalos[@]}"

#Manipular Arrays!!

#Insertar elementos por el final
regalos+=("unas pantuflas")
regalos=( ${regalos[@]} "una camara")

#Insertar elemntos al principio
regalos=("una camara" ${regalos[@]})
regalos=("una camara" ${regalos[@]}"abrigo")

#coger varios elementos

echo "a ver si es verdad: ${regalos[@]:1:3}"

#insertar elemento en la posicion 2
regalos=(${regalos[@]::2} "sombrero" ${regalos[@]:2})

# echo "${@:1:5}"
#BORRAR
val=(234 6345 234 234 63546)
unset val[2]
echo "Los indices son: ${!val[@]}"
unset val

#Declarar los arrays
a