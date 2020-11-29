

# 2 - Considere o seguinte arquivo:

#       A 10
#       B 20
#       A 15
#       C 12
#       D 21
#       B 12
#       C 21

# Escreva um script que, para cada nome na coluna 1, some os números da coluna 2, totalizando-os. Use arrays associativos, pois os nomes da coluna 1 podem mudar.

#!/bin/bash


lin=1
declare -A vetor
while read linha; do
        pri_coluna=$(cat arquivo | awk 'NR=='$lin' {print $1}')
        seg_coluna=$(cat arquivo | awk 'NR=='$lin' {print $2}')

        if [ "$pri_coluna" == "A" ]; then
                vetor[A]=$(( seg_coluna + vetor[A] ))
        elif [ "$pri_coluna" == "B" ]; then
                vetor[B]=$(( seg_coluna + vetor[B] ))
        elif [ "$pri_coluna" == "C" ]; then
                vetor[C]=$(( seg_coluna + vetor[C] ))
        elif [ "$pri_coluna" == "D" ]; then
                vetor[D]=$(( seg_coluna + vetor[D] ))
        fi


        lin=$(( lin + 1 ))
done < arquivo
echo "Soma dos valores da(as) coluna(as) A: ${vetor[A]}"
echo "Soma dos valores da(as) coluna(as) B: ${vetor[B]}"
echo "Soma dos valores da(as) coluna(as) C: ${vetor[C]}"
echo "Soma dos valores da(as) coluna(as) D: ${vetor[D]}"
