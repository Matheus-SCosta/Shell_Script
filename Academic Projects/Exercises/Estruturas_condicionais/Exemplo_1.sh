#Script que verifica a existência de arquivos com o mesmo número de linhas no diretório atual. Caso existam, imprime o nome dos arquivos duplicados e quando imprime, verifica se os parâmetros são arquivos ou diretórios.


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
