Script que exibe um arquivo parte por parte (digamos 10 caracteres em cada parte), esperando por um enter, até o fim do arquivo.

Por exemplo, considerando o arquivo:

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
