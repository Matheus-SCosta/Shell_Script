# script que gera 101 números aleatórios, salvando-os, um por linha, no arquivo num.txt. Usando o comando wc para verificar se o arquivo num.txt tem realmente 101 linhas. Escrevi um segundo script, este deve ler todos os números de num.txt e calcular a sua soma.



#!/bin/bash
for (( i=1; i<-101; i++ )) do
	numero=$(( $RANDOM % 100 )) && echo $numero>> num.txt
done
linhas=$(( cat num.txt | wc -l ))
echo "O arquivo num.txt tem $linhas linhas"

soma=0
for (( i=0; i<=linhas; i++ )) do
	linha=$(cat num.txt | head -$i | tail -1 )
	soma=$(( soma + linha ))
done

echo "Soma dos valores do arquivo num.txt: " $soma"
