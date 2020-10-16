1 - Escreva um script chamado help_test.sh. Este deve receber um ou mais parâmetros de linha de comando. Se um destes parâmetros for “logica”, o script deve imprimir uma ajuda sobre os parâmetros lógicos do comando test. Se um destes parâmetros for “aritmetica”, o script deve imprimir uma ajuda sobre os parâmetros aritméticos do comando test. Se um destes parâmetros for “strings”, o script deve imprimir uma ajuda sobre os parâmetros para strings do comando test. Se um destes parâmetros for “variáveis”, o script deve imprimir uma ajuda sobre os parâmetros para variáveis do comando test. Se um destes parâmetros for “arquivos”, o script deve imprimir uma ajuda sobre os parâmetros sobre arquivos do comando test. Se um destes parâmetros for "lógica", o script deve imprimir uma ajuda sobre os parâmetros lógicos do comando test.

#!/bin/bash
for i in $*; then
	if [ ${i} == "artimetica" ]; then
		echo "-gt significa maior que"
		echo "-ge significa maior ou igual a"
		echo "-lt significa menor que"
		echo "-le significa menor ou igual"
		echo "-eq significa igual a"
		echo "-ne significa diferente de"
	elif [ ${i} == "lógica"]; then
		echo "-a significa um and"
		echo "-o significa um or"
		echo "! nega a condição"
	elif [ ${i} == "arquivos" ]; then
		echo "-d significa teste se o arquivo existe e é um diretório"
		echo "-e significa teste se o arquivo existe"
		echo "-f significa teste se o arquivo existe e é um arquivo comum"
	elif [ ${i} == "variável" ]; then
		echo "-z significa teste se a string é vazia"
		echo "-n significa teste se a string é não vazia"
	elif [ ${i} == "string" ]; then
		echo "== significa strings iguais"
		echo "!= significa strings diferentes"
	fi
done





2 - Se você cria uma variável no shell atual e usa o comando export, esta variável fica disponível em qualquer script chamado a partir do shell atual. Ex.:

a=10
export a
./teste.sh

Se executar “echo $a” dentro do script teste.sh, este imprimirá 10. Sem o export, a variável “a” não existiria. Escreva um script que teste se as variáveis a, b e c existem (e têm valor diferente de vazio). Peça para o usuário digitar um valor para cada uma que não existir. Exiba os valores das variáveis a b e c na tela.


#!/bin/bash

if test -z ${a}; then
	read -p "Digite um valor para variável a: " a
fi
if test -z ${b}; then
	read -p "Digite um valor para variável b: " b
fi
echo "variável a: ${a}"
echo "variável b: ${b}"



3 - Escreva um script que receba uma lista de arquivos como parâmetros de linha de comando e exiba na tela os arquivos que são executáveis.

#!/bin/bash
for i in $*; do
	if [ -x ${i} ]; then
		echo "arquivo ${i} é executável"
	fi
done



4 - Escreva um script que receba 3 nomes de arquivos como argumentos de linha de comando. Verifique se pelo menos 2 destes arquivos passaram do tamanho crítico, que significa ter 5 linhas ou mais.

!#/bin/bash


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





5 - Escreva um script que imprima a palavra DIRETORIOS e abaixo liste todos os diretórios da pasta atual. Em seguida imprima a palavra ARQUIVOS e abaixo liste todos os arquivos da pasta atual. Por fim, imprima a palavra LINKS e abaixo liste todos os links simbólicos da pasta atual.


#!/bin/bash
echo "DIRETORIOS:"
for i in $(ls); do
	if [ -d ${i} ]; then
		echo ${i}
	fi
done
echo -e "\n"
echo "ARQUIVOS:"
for i in $(ls); do
	if [ -f ${i} ]; then
		echo ${i}
	fi
done
echo -e "\n"
for i in $(ls); do
	if [ -h ${i} ]; then
		echo ${i}
	fi
done
echo -e "\n"


6 - Usando o comando if, escreva um script que verifique a existência de arquivos com o mesmo número de linhas no diretório atual. Caso existam, imprima o nome dos arquivos duplicados. Quando listar, verifique (usando if) se os parâmetros são arquivos ou diretórios.


#!/bin/bash
for i in $(ls); do
	linhas_i=$(cat ${i} 2>/dev/null | wc -l)
	for j in $(ls); do
		linhas_j=$(cat ${j} 2>/dev/null | wc -l)
		if [ ${linhas_i} == ${linhas_j} ] && [ ${i} != ${j} ]; then
			echo "arquivos ${i} e ${j} possuem a mesma quantidade de linhas"
			test -d ${i} && echo "${i} é um diretório"
			test -e ${i} && echo "${i} é um arquivo"
			test -d ${j} && echo "${j} é um diretório"
			test -e ${j} && echo "${j} é um arquivo"
			echo -e "\n"
		fi

	done
done



7 - [PESQUISA] Escreva um script que exiba o arquivo mais recente (cuja criação ou modificação foi realizada mais tarde) do diretório atual.

Essa tem que usar o comando ls -lc ou ls -l, e vai aparecer o dia e horário da criação ou última modificação do arquivo


#!/bin/bash
maior_data=0
maior_horario=00:00
maior_minuto=0
maior_hora=0
for i in $(ls); do
	data=$(ls -l ${i} | awk '{print $7}')
	horario=$(ls -l ${i} | awk '{print $8}')
	hora=$( echo ${horario} | cut  -d: -f1 )
	minutos=$( echo ${horario} | cut -d: -f2 )
	nome_arq=$(ls -l ${i} | awk '{print $9}')
	if [ ${data} -gt ${maior_data} ]; then
		maior_data=${data}
		nome_arquivo=${nome_arq}
		maior_minuto=${minutos}
		maior_hora=${hora}
	elif [ ${data} -eq ${maior_data} ]; then
		if [ ${hora} -gt ${maior_hora} ]; then
			nome_arquivo=${nome_arq}
			maior_minuto=${minutos}	
			maior_hora=${hora}
		elif [ ${hora} -eq ${maior_hora} ]; then
			if [ ${minutos} -gt ${maior_minuto} ]; then
				nome_arquivo=${nome_arq}
				maior_minuto=${minutos}
			fi
		fi
	fi	
done

echo "Arquivo mais recente criado ou alterado: ${nome_arquivo}"	

