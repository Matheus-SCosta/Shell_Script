# Lista 13 (Funções e Modularização)


# 1 - Escreva um script com uma função que receba 2 números e retorne o maior entre eles. Escreva uma nova função, esta recebe 2 números e retorna o menor entre eles.



#!/bin/bash

function maior(){
        if (( $1 > $2 )); then
                echo $1
        elif (( $2 > $1 )); then
                echo $2
        fi
}

function menor(){
        if (( $1 < $2 )); then
                echo $1
        elif (( $2 < $1 )); then
                echo $2
        fi
}

maior=$(maior 7 25)
menor=$(menor 13 25)
echo "Maior: $maior - Menor: $menor"




# 2 - Considere o seguinte arquivo:

#	12 10 13 14
#	6 5 -9 11 12 4
#	15
#	12 3
#	21 1 2 3 4 5 6 7 8 9
#	6

# Escreva um script que importe as funções da questão anterior e use-as para encontrar o menor e o maior número do arquivo apresentado acima.


function maior_menor() {
        maior=0
        menor=0
        for i in $(cat $1); do
                if [ $i -gt $maior ]; then
                        maior=$i
                elif [ $i -lt $menor ]; then
                        menor=$i
                fi
        done
        echo "Maior: $maior  -  Menor: $menor"
}


resultado=$(maior_menor arquivo)
echo $resultado





# 3 - Escreva um script que tenha uma função ping_test. Esta recebe um endereço IP como parâmetro, pinga para este IP (sem exibir nada na tela) e exibe OK se o endereço estiver acessível e FALHA caso contrário.


function ping_test () {
        ping -c 2 $1 > arq_aux
        ultimaLinha=$(cat arq_aux |  wc -l)
        ping_sucesso=$(cat arq_aux | awk 'NR=='$(( ultimaLinha-1 ))' {print $4}')
        if [ $ping_sucesso -eq 0 ]; then
                echo "FALHA"
        else
                echo "OK"
        fi

}

ping_test 8.8.8.6
