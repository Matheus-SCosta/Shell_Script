# Esse script recebe 3 nomes de arquivos como argumentos de linha de comando e verifica se pelo menos 2 destes arquivos tem 5 linhas ou mais. Caso o arquivo passado como argumento de linha de comando não exista no diretório atual, o script informa que o arquivo não existe e encerra.

#!/bin/bash


ls $1 &>/dev/null || echo "arquivo $1 não existe, script encerrado!"
ls $1 || exit 1
ls $2 &>/dev/null || echo "arquivo $2 não existe, script encerrado!"
ls $2 || exit 1
ls $3 &>/dev/null || echo "arquivo $3 não existe, script encerrado!"
ls $3 || exit 1

maximo_de_linhas=5
quantidade_de_arquivos_com_tamanho_critico=0
for i in $*; do
	linhas=$(cat ${i} | wc -l)
	if (( linhas >= maximo_de_linhas )); then
		quantidade_de_arquivos_com_tamanho_critico=$(( quantidade_de_arquivos_com_tamanho_critico + 1 ))
	fi
done

if [ $quantidade_de_arquivos_com_tamanho_critico -ge 2 ]; then
	echo "pelo menos 2 arquivos passados como argumento de linha de comando tem mais que 5 linhas"
fi
