# script que funciona como um explorador de arquivos. Exibe um menu. se o usuário digitar q, sai do script. Se digitar d, mostra os diretórios da pasta atual. Se digitar f, exibe os arquivos da pasta atual. Se digitar v <arq>, exibe o conteúdo do arquivo <arq>. Se digitar cd <dir>, muda para o diretório <dir>, se este existir.




#!/bin/bash

while true; do
	read -p "Digite alguma opção: " opc
	case ${opc} in
		"d") for i in $(ls); do if [ -d ${i} ]; then echo ${i}; fi; done ;;
		"f") for i in $(ls); do if [ -f ${i} ]; then echo ${i}; fi; done ;;
		"q") break ;;
		"cd") read -p "Digite o nome do diretório que deseja mudar: " dir; cd ${arq} ;;
		"v") read -p "Digite o nome do arquivo: " arq; cat ${arq} ;;
	esac

done
