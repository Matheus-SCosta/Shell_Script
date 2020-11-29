# 1 - Escreva um script que peça para o usuário digitar um conjunto de números na mesma linha, separados por espaço (podem ser vários números, o usuário decide quantos) e exiba o menor deles.

#!/bin/bash

read -p "Digite vários números: " numeros
echo $numeros > arq_aux
colunas=$(cat arq_aux | awk '{print NF}')



for i in $(cat arq_aux); do
        vetor[ ${#vetor[*]} ]=$i
done



menor=${vetor[0]}
for i in ${!vetor[*]}; do
        if [ ${vetor[$i]} -lt $menor ]; then
                menor=${vetor[$i]}
        fi
done
echo "menor: $menor"







