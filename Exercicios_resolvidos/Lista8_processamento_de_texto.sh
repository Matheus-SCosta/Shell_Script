
1 - Escreva um script que receba o nome de um arquivo e um número (x) como parâmetros de linha de comando. O script deve imprimir a linha número x do arquivo.

#!/bin/bash

read -p "Arquivo: " arquivo
read -p "Nº da linha: " x

head -${x} < ${arquivo} | tail -1




2 - Escreva um script que receba o nome de um arquivo e um número (y) como parâmetros de linha de comando. O script deve imprimir a coluna número y do arquivo.


#!/bin/bash

read -p "Arquivo: " arquivo
read -p "Nº da coluna: " x

cut -f ${x} < ${arquivo}





3 - Escreva um script que use o comando tr para remover linhas vazias de um arquivo, isto é, linhas que possuem apenas o enter (\n).



#!/bin/bash

read -p "Arquivo a suprimir linhas vazias: " arq
cat ${arq} | tr -s "\n" > arq_aux
cp arq_aux ${arq}
rm arq_aux





4 - Considere o seguinte arquivo ips.txt:

8.8.8.8
8.8.4.4
200.148.191.197
168.196.40.154
45.225.123.54
8.8.8.8
8.8.4.4
200.148.191.197
123.123.123.1
123.123.123.2
123.123.123.1
123.123.123.3
123.123.123.2

Escreva um script para listar apenas os ips sem repetição. Isto é, remover as duplicatas




#!/bin/bash

sort -n < ips.txt | uniq






5 - Escreva um script que exiba um arquivo parte por parte (digamos 10 linhas em cada parte), esperando por um enter, até o fim do arquivo.


#!/bin/bash

read -p "Digite o arquivo para leitura: " arq
condicao=true
linhas=10  #condição para o comando head
totaldelinhas=$(cat $arq | wc -l)  #total de linhas do arquivo

while ${condicao}; do
	if [ ${linhas} -gt ${totaldelinhas} ]; then  #quando a proxima parte tem menos de 10 linhas
		cat ${arq} | head -${linhas} > comeco
		conta=$(( ${linhas} - ${totaldelinhas} ))
		linhasfaltantes=$(( 10 - ${conta} ))
		cat comeco | tail -${linhasfaltantes} > linhasparamostrar
		cat linhasparamostrar
		break   #encerramento do script ao ler todas as linhas
	fi
	
	cat ${arq} | head -${linhas} > comeco
	cat comeco | tail -10 > linhasparamostrar
	cat linhasparamostrar

	linhas=$(( linhas + 10 ))
	
	read -p "Aperte ENTER para continuar a leitura do arquivo " condicao_aux
	if [ ${condicao_aux} != "" ]; then    #caso o usuário digite algo ao invés de aperta ENTER, o script será encerrado
		condicao=false
	fi	
	

done


rm comeco linhasparamostrar







6 - Escreva um script que exiba um arquivo parte por parte (digamos 10 caracteres em cada parte), esperando por um enter, até o fim do arquivo.

Por exemplo, considere o arquivo:

01234567890abcdefghij01234567890123456789012345
01234567890abcdefghij01234567890123456789012345
01234567890abcdefghij01234567890123456789012345

O script deve imprimir:

Exibindo as colunas de 1 a 10 (enter para continuar):

0123456789
0123456789
0123456789
Exibindo as colunas de 11 a 20 (enter para continuar):

abcdefghij
abcdefghij
abcdefghij

...




#!/bin/bash

read -p "Digite o arquivo para leitura: " arq
linhas=1
coluna=0
condicaolinhas=true
condicaocolunas=true
totaldelinhas=$(cat ${arq} | wc -l)
while ${condicaocolunas}; do
	linhas=1
	if [ ${colunas -gt 50 ]; then
		break
	fi
	coluna=$(( coluna + 10 ))
	colunaaux=$(( coluna - 9 ))
	echo "Exibindo as colunas de ${colunaaux} a ${coluna}"
	while ${condicaolinhas}; do
		if [ ${linhas} -gt ${totaldelinhas} ];then
			break
		fi
		cat ${arq} | head -${linhas} | cut -c ${colunaaux}-${coluna} > comeco
		cat comeco | tail - 1 > colunasparamostrar
		cat colunasparamostrar
		linhas=$(( linhas + 1 ))
	done
	read -p "Aperte ENTER para continuar: " con
	if [ ${con} != "" ] &>/dev/null ;then
		condicaocolunas=false
	fi
done

rm comeco colunasparamostrar


