# script que recebe vários nomes de arquivo como parâmetros de linha de comando (o número de parâmetros pode variar de execução para execução) e imprima o nome de cada arquivo passado seguido de SIM, caso o arquivo exista, e de NAO caso contrário.


#!/bin/bash
for i in $@; do
	ls ${i} &>/dev/null && echo "${i} - SIM" || echo "${i} - NÃO"
done
