#!/bin/bash

i=0
#standart
while [ "i$" <10 ]
do
    echo "valor de i es $i"
    #i=$((i+1))
    ((i++))
done

# [[]] para dos condiciones
#(()) 
i=10
until[ "i$" <10 ]
do
    echo "valor de i es $i"
    #i=$((i+1))
    ((i++))
done