# script que remove as linhas em branco de um arquivo. Adiciona uma opção para que o script conte as linhas em branco de um arquivo, em vez de removê-las.

#!/bin/bash

read -p "Digite 1 para returar linhas em branco de um arquivo e 2 para contar linhas em branco de um arquivo: " opc
	case ${opc} in
		"1") read -p "Digite o nome de um arquivo: " arq
		     linhas=$(cat ${arq} | grep -E '^$' | wc -l)
		     echo "Arquivo ${arq} contém ${linhas} linhas em branco" ;;

		"2") read -p "Digite um arquivo para tirar linhas em branco: " arq
		     cat $arq | grep -E '[^$]' >> arq_aux
		     cat arq_aux
		     rm arq_aux ;;
	esac


