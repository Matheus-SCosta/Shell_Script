# Lista 13 (Funções e Modularização)


# 1 - Escreva um script com uma função que receba 2 números e retorne o maior entre eles. Escreva uma nova função, esta recebe 2 números e retorna o menor entre eles.



#!/bin/bash


function maior(){
        maior=$(cat $1 | awk 'NR==1 {print $1}')
        for i in $(cat $1); do
                if (( $i > $maior )); then
                        maior=$i
                fi
        done
echo $maior
}


function menor() {
        menor=$(cat $1 | awk 'NR==1 {print $1}')
        for i in $(cat $1); do
                if (( $i < $menor )); then
                        menor=$i
                fi

        done
echo $menor
}



function main() {

        read -p "numero 1: " num1
        read -p "numero 2: " num2
        echo $num1 $num2 > arq_aux
        maior=$(maior arq_aux)
        menor=$(menor arq_aux)
        echo "Maior: $maior - Menor: $menor"
        rm arq_aux
}

main





# 2 - Considere o seguinte arquivo:

#	12 10 13 14
#	6 5 -9 11 12 4
#	15
#	12 3
#	21 1 2 3 4 5 6 7 8 9
#	6

# Escreva um script que importe as funções da questão anterior e use-as para encontrar o menor e o maior número do arquivo apresentado acima.


#!/bin/bash


source questao1.sh  # para a importação funcionar é só comentar a chamada para o metodo main da questao1.sh ou ao invés de pedir para o usuario digitar os 2 números, pode se passar na questão1.sh um arquivo com os 2 números.

maior=$(maior arquivo)
menor=$(menor arquivo)
echo "Maior: $maior - Menor: $menor"




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
