#1 - Escreva um script chamado help_test_2.sh. Este deve ter um laço, apresentando opções para o usuário. Se o usuário digitar sair, ele sai do script. Se digitar “logica”, o script deve imprimir uma ajuda sobre os parâmetros lógicos do comando test. Se digitar “aritmetica”, o script deve imprimir uma ajuda sobre os parâmetros aritméticos do comando test. Se digitar “strings”, o script deve imprimir uma ajuda sobre os parâmetros para strings do comando test. Se digitar “variáveis”, o script deve imprimir uma ajuda sobre os parâmetros para variáveis do comando test. Se digitar “arquivos”, o script deve imprimir uma ajuda sobre os parâmetros sobre arquivos do comando test. Se digitar "extended", o script deve imprimir uma ajuda sobre a notação estendida [[ ]].

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
		"sair") break
	esac
done 




#2 - Escreva um script que espera que um arquivo chamado key seja criado no diretório atual, verificando isso a cada 2 segundos, até que o arquivo seja criado.




# 1º forma

#!/bin/bash

status=naocriado
while [ $status != "criado" ]; do
	for i in $(ls); do
		case $i in
			"key") status=criado ;;
	done
	sleep 2
done




# 2º forma


#!/bin/bash

while [ "${key}" != "key" ]; do
	read touch key
	sleep 2
done
touch key





#3 - Escreva um script que funcione como um explorador de arquivos. Exibe um menu. se o usuário digitar q, sai do script. Se digitar d, mostra os diretórios da pasta atual. Se digitar f, exibe os arquivos da pasta atual. Se digitar v <arq>, exibe o conteúdo do arquivo <arq>. Se digitar cd <dir>, muda para o diretório <dir>, se este existir.




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





#4 - Escreva um script que use o laço while para contar quantas linhas de um arquivo tem apenas números e quantas tem letras.




#!/bin/bash

linhas_numeros=0
linhas_letras=0
while read linha; do
	[ $linha -gt -1 ] &>/dev/null && linhas_numeros=$(( linhas_numeros + 1 )) || linhas_letras=$(( linhas_letras + 1 ))
done < arq.txt

echo "Linhas somente com números: $linhas_numeros"
echo "Linhas com letras: $linhas_letras"




#5 - Considere o seguinte arquivo ips.txt:

8.8.8.8
8.8.4.4
200.148.191.197
168.196.40.154
45.225.123.54

#Use um laço while para executar 4 pings para cada ip. Liste os IPs que não foram possíveis acessar.



#!/bin/bash

while read linha; do
	echo " "
	echo " "
	echo "DANDO PING EM: ${linha}
	echo " "
	echo " "
	ip=${linha}
	ping -c 4 ${ip}
done < ips.txt




#6 - [PESQUISA] Cada caso do comando case pode terminar com “;;”. Escreva um script que exiba as outras opções de terminadores para os casos do case, explicando cada uma delas.





#!/bin/bash

while true; do
echo "As opções de terminadores além do ; são ;;& e ;&"
ecgo "Para sair digite q"
read -p "Qual terminador deseja saber sobre? Digite qual deseja" opc 
	case ${opc} in
		";;&") echo Quando um bloco de comandos for encerrado com este terminador, o programa não sairá do case, mas testará os próximos padrões ;;
		";&") echo Neste caso, o próximo bloco será executado, sem sequer testar o seu padrão.
		"q") break
	esac
done 






#7 - [PESQUISA] Escreva um script que exiba e exemplifique as diferenças entre o laço while e o laço until.




#!/bin/bash

echo " Esse script serve para saber as diferenças entre while e until de forma simples"
read -p "Para saber sobre o while, digite while e para saber sobre until, digite until: " opcao
	case ${opcao} in
		"while") echo "O while funcionará enquando uma condição for verdadeira, por exemplo no script abaixo ele vai funcionar enquanto a variável i for menor que 5, diferentemente do until. Para saber mais sobre o until selecione a opção until"
		echo "i=0"
		echo "while (( ${i} < 5 )); do"
		echo "		echo ${i}"
		echo "		i=$(( i + 1 ))"
		echo "done"
		"until") echo "O until funcionará enquanto uma condição for falsa, por exemplo no script abaixo ele vai funcionar enquanto a variável i for menor que 5, diferentemente do while. Para saber mais sobre o while selecione a opção while"
		echo "i=0"
		echo "until (( ${i} == 5 )); do"
		echo "		echo ${i}"
		echo "		i=$(( i + 1 ))"
		echo "done"
		

