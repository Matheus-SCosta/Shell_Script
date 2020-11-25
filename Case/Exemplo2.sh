# script chamado help_test_2.sh. Este te um laço, apresentando opções para o usuário. Se o usuário digitar sair, ele sai do script. Se digitar “logica”, o script deve imprimir uma ajuda sobre os parâmetros lógicos do comando test. Se digitar “aritmetica”, o script deve imprimir uma ajuda sobre os parâmetros aritméticos do comando test. Se digitar “strings”, o script deve imprimir uma ajuda sobre os parâmetros para strings do comando test. Se digitar “variáveis”, o script deve imprimir uma ajuda sobre os parâmetros para variáveis do comando test. Se digitar “arquivos”, o script deve imprimir uma ajuda sobre os parâmetros sobre arquivos do comando test. Se digitar "extended", o script deve imprimir uma ajuda sobre a notação estendida [[ ]].

#!/bin/bash

while true; do

read -p "Opção" opc 
	case ${opc} in
		"logica") echo "-a significa um and"
			  echo "-o significa um or"
			  echo "! nega a condição" ;;
		"aritmetica") echo "-gt significa maior que"
			      echo "-ge significa maior ou igual a"
			      echo "-lt significa menor que"
			      echo "-le significa menor ou igual"
			      echo "-eq significa igual a"
			      echo "-ne significa diferente de" ;;
		"string") echo "== significa strings iguais"
			  echo "!= significa strings diferentes" ;;
		"variaveis") echo "-z significa teste se a string é vazia"
		             echo "-n significa teste se a string é não vazia" ;;
		"arquivos") echo "-d significa teste se o arquivo existe e é um diretório"
		            echo "-e significa teste se o arquivo existe"
		            echo "-f significa teste se o arquivo existe e é um arquivo comum" ;;
		"extended") echo " [[ ]] servem para fazer comparação de string, se é > ou <" ;;
		"sair") break ;;
	esac
done 
