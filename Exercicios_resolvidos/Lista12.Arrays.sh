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


# 3 - Considere o seguinte arquivo com nomes reais de pessoas:

# Ana Thereza Vasques
# Brissa Silvia Bracchi
# Dehbora Kaynahra Patricia da Silva
# Graucia Adyana Dantas Pereira
# Ysabelle Aciole Lhima Santos de Oliveirah
# Marylih Rodriguez Fehlixis

# Escreva um script que abrevie o nome da cada pessoa na lista. Use arrays e strings.
# Exemplo de saída:

# Ana T. Vasques
# Brissa S. Bracchi
# Dehbora K. P. d. Silva
# Graucia A. D. Pereira
# Ysabelle A. L. S. d. Oliveirah
# Marylih R. Fehlixis

#!/bin/bash

i=0
while read linha; do
        pri_nome=$(echo $linha | awk '{print $1}')
        ult_nome=$(echo $linha | awk '{print $NF}')
        vetor_pri_nome=( ${vetor_pri_nome[*]} $pri_nome ) # utilizei arrays para guardar primeiros nomes
        vetor_ult_nome=( ${vetor_ult_nome[*]} $ult_nome ) # utilizei arrays para guardar ultimos nomes
        sem_pri_nome=$(echo $linha | grep -E -o '[ a-zA-Z]+')
        nomes_meio=$(echo $sem_pri_nome | grep -E -o ' [ a-zA-Z]+ \b')


        pri_nome_meio=$(echo $nomes_meio | awk '{print $1}')
        seg_nome_meio=$(echo $nomes_meio | awk '{print $2}')
        ter_nome_meio=$(echo $nomes_meio | awk '{print $3}')
        qua_nome_meio=$(echo $nomes_meio | awk '{print $4}')
        qui_nome_meio=$(echo $nomes_meio | awk '{print $5}')
        sex_nome_meio=$(echo $nomes_meio | awk '{print $6}')
        seti_nome_meio=$(echo $nomes_meio | awk '{print $7}') # fiz com possibilidade do nome ter até 7 nomes de meio

        NFS_AUX=$(echo $linha | awk '{print NF}')   # números de nomes
        NFS=$(( NFS_AUX - 2 ))   # número de nomes de meio

 	if [ $NFS -eq 1 ]; then
                echo "${vetor_pri_nome[$i]} ${pri_nome_meio:0:1}. ${vetor_ult_nome[$i]}"
        elif [ $NFS -eq 2 ]; then
                echo "${vetor_pri_nome[$i]} ${pri_nome_meio:0:1}. ${seg_nome_meio:0:1}. ${vetor_ult_nome[$i]}"
        elif [ $NFS -eq 3 ]; then
                echo "${vetor_pri_nome[$i]} ${pri_nome_meio:0:1}. ${seg_nome_meio:0:1}. ${ter_nome_meio:0:1}. ${vetor_ult_nome[$i]}"
        elif [ $NFS -eq 4 ]; then
                echo "${vetor_pri_nome[$i]} ${pri_nome_meio:0:1}. ${seg_nome_meio:0:1}. ${ter_nome_meio:0:1}. ${qua_nome_meio:0:1}. ${vetor_ult_nome[$i]}"
        elif [ $NFS -eq 5 ]; then
                echo "${vetor_pri_nome[$i]} ${pri_nome_meio:0:1}. ${seg_nome_meio:0:1}. ${ter_nome_meio:0:1}. ${qua_nome_meio:0:1}. ${qui_nome_meio:0:1}. ${vetor_ult_nome[$i]}"
        elif [ $NFS -eq 6 ]; then
                echo "${vetor_pri_nome[$i]} ${pri_nome_meio:0:1}. ${seg_nome_meio:0:1}. ${ter_nome_meio:0:1}. ${qua_nome_meio:0:1}. ${qui_nome_meio:0:1}. ${sex_nome_meio:0:1}. ${vetor_ult_nome[$i]}"
        elif [ $NFS -eq 7 ]; then
                echo "${vetor_pri_nome[$i]} ${pri_nome_meio:0:1}. ${seg_nome_meio:0:1}. ${ter_nome_meio:0:1}. ${qua_nome_meio:0:1}. ${qui_nome_meio:0:1}. ${sex_nome_meio:0:1}. ${seti_nome_meio:0:1}. ${vetor_ult_nomes[$i]}"
        fi
	i=$(( i + 1 ))
done < arquivo

