# script que exibe o nome e número de linhas de cada um dos arquivos do diretório atual


#!/bin/bash

for i in $(ls); do
	echo $( cat ${i} | wc -l )
done
