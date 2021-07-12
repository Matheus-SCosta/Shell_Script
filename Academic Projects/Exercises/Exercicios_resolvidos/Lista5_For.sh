1 - Escreva um script que imprima todos os números pares de 1 até 21. Melhore o script para que imprima todos os números pares entre a e b, sendo a o primeiro parâmetro de linha de comando, enquanto que b é o segundo.

#!/bin/bash
for (( i=1; i<=21; i++ )) do
	(( ${i} % 2 == 0 )) && echo ${i}
done


#!/bin/bash
for (( i=${1}; i<=${2}; i++ )) do
	(( ${i} % 2 == 0 )) && echo ${i}
done



2 - Escreva um script que exiba o nome e número de linhas de cada um dos arquivos do diretório atual. Melhore o script para que os arquivos sejam exibidos em ordem decrescente em relação ao número de linhas. Melhore ainda mais o script para que receba o nome do diretório (de onde serão listados os nomes dos arquivos) seja lido como parâmetro de linha de comando.


#!/bin/bash
for i in $(ls); do
	echo $( cat ${i} | wc -l )
done


3 - Escreva um script que calcule (e exiba na tela) a soma de todos os números de 1 até 20. Melhore este script para que peça para o usuário digitar dois números, a e b, e calcule a soma dos números de a até b.

De 1 até 20


#!/bin/bash
soma=0
for (( i=0; i<=20; i++ )) do
	soma=$((soma + i))
done
echo ${soma}




Com 2 números digitados pelo usuário


#!/bin/bash
read -p "numero 1: " num1
read -p "numero 2: " num2

soma=0
for (( i=${num1}; i<=${num2}; i++ )) do
	soma=$((soma + i))
done
echo ${soma}




4 - Escreva um script que gere 101 números aleatórios, salvando-os, um por linha, no arquivo num.txt. Use o comando wc para verificar se o arquivo num.txt tem realmente 101 linhas. Escreva um segundo script, este deve ler todos os números de num.txt e calcular a sua soma.



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





5 - Escreva um script que receba vários nomes de arquivo como parâmetros de linha de comando (o número de parâmetros pode variar de execução para execução) e imprima o nome de cada arquivo passado seguido de SIM, caso o arquivo exista, e de NAO caso contrário.


#!/bin/bash
for i in $@; do
	ls ${i} &>/dev/null && echo "${i} - SIM" || echo "${i} - NÃO"
done




6 - Escreva um script que crie 26 diretórios com nomes de A a Z. Dentro de cada diretório criado deve ser criado um arquivo com o nome do diretório e extensão .py (exemplo A.py, B.py ...). O conteúdo de cada um destes arquivos deve ser:

#!/usr/bin/env python3
print(“Rapi Hellow Uin!”)

Lembre de dar permissão de execução para cada arquivo gerado.




#!/bin/bash
for i in {A..Z}; do
	mkdir ${i}
	cd ${i}
	echo -e '#!/usr/bin/env python3 \nprint("Rapi Hellow Uin!")' > ${i}.py
	chmod +x ${i}.py
	cd ..
done


7 - [PESQUISA] Escreva um script que use a ferramenta md5 para verificar a existência de arquivos com o mesmo conteúdo no diretório atual. Caso existam, imprima o nome dos arquivos duplicados.




#!/bin/bash 
contador=0
for i in $(ls); do
	md5=$(cat $i | md5sum)
	for j in $(ls); do
		md5_2=$(cat $j | md5sum)
		if [[ $md5 == $md5_2 ]] && [[ $i != $j ]]; then
			echo "arquivos $i e $j tem o mesmo conteúdo"
			contador=$contador+1
		fi
	done
done
if (( $contador == 0 )); then
	echo "Não existe arquivos iguais"
fi
