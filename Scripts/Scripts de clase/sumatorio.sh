#!/bin/bash
sum=0
for num in "$@"; do
    #sum=$((sum+num))
    ((sum+=num))
done
media=$sum/$#
echo "El total es: $sum.La media es $media"