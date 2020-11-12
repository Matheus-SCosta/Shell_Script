# script que exibe um arquivo parte por parte, esperando por um enter, até o fim do arquivo.

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
